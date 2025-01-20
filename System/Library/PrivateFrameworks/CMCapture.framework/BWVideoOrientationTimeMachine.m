@interface BWVideoOrientationTimeMachine
+ (void)initialize;
- (BWVideoOrientationTimeMachine)initWithCapacity:(unint64_t)a3 formatDescription:(opaqueCMFormatDescription *)a4 metadataLocalID:(unsigned int)a5;
- (CMSampleBufferRef)_newSbufWithCachedItem:(CMTime *)a3 trimAtStartPTS:(CMTime *)a4 referencePTS:;
- (id)_cachedItemsFromPTSSeconds:(double)a3 toPTSSeconds:(double)a4;
- (id)copyVideoOrientationSbufFromPTS:(id *)a3 toPTS:(id *)a4 referencePTS:(id *)a5;
- (id)debugDescription;
- (void)addItemToCacheWithPTS:(id *)a3 exifOrientation:(signed __int16)a4;
- (void)dealloc;
@end

@implementation BWVideoOrientationTimeMachine

- (BWVideoOrientationTimeMachine)initWithCapacity:(unint64_t)a3 formatDescription:(opaqueCMFormatDescription *)a4 metadataLocalID:(unsigned int)a5
{
  if (!a3) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"Capacity must be non-zero" userInfo:0]);
  }
  v12.receiver = self;
  v12.super_class = (Class)BWVideoOrientationTimeMachine;
  v8 = [(BWVideoOrientationTimeMachine *)&v12 init];
  v9 = v8;
  if (v8)
  {
    v8->_capacity = a3;
    v8->_cache = (NSMutableArray *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v8->_capacity];
    if (a4) {
      v10 = (opaqueCMFormatDescription *)CFRetain(a4);
    }
    else {
      v10 = 0;
    }
    v9->_formatDescription = v10;
    v9->_metadataLocalID = a5;
    v9->_propertyMutex = (OpaqueFigSimpleMutex *)FigSimpleMutexCreate();
  }
  return v9;
}

+ (void)initialize
{
}

- (void)dealloc
{
  formatDescription = self->_formatDescription;
  if (formatDescription) {
    CFRelease(formatDescription);
  }
  FigSimpleMutexDestroy();
  v4.receiver = self;
  v4.super_class = (Class)BWVideoOrientationTimeMachine;
  [(BWVideoOrientationTimeMachine *)&v4 dealloc];
}

- (id)debugDescription
{
  pthread_mutex_lock((pthread_mutex_t *)self->_propertyMutex);
  v3 = (void *)[(NSMutableArray *)self->_cache copy];
  pthread_mutex_unlock((pthread_mutex_t *)self->_propertyMutex);
  objc_super v4 = NSString;
  v5 = (objc_class *)objc_opt_class();
  v6 = (void *)[v4 stringWithFormat:@"<%@: %p> %@", NSStringFromClass(v5), self, v3];

  return v6;
}

- (void)addItemToCacheWithPTS:(id *)a3 exifOrientation:(signed __int16)a4
{
  uint64_t v4 = a4;
  CMTime v11 = *(CMTime *)a3;
  double Seconds = CMTimeGetSeconds(&v11);
  v7 = [[BWVideoOrientationTimeMachineItem alloc] initWithPTSSeconds:v4 exifOrientation:Seconds];
  pthread_mutex_lock((pthread_mutex_t *)self->_propertyMutex);
  v8 = (void *)[(NSMutableArray *)self->_cache lastObject];
  if (!v8
    || (v9 = v8, [v8 ptsSeconds], v10 < Seconds)
    && [v9 exifOrientation] != v4)
  {
    if ([(NSMutableArray *)self->_cache count] >= self->_capacity) {
      [(NSMutableArray *)self->_cache removeObjectAtIndex:0];
    }
    [(NSMutableArray *)self->_cache addObject:v7];
  }
  pthread_mutex_unlock((pthread_mutex_t *)self->_propertyMutex);
}

- (id)copyVideoOrientationSbufFromPTS:(id *)a3 toPTS:(id *)a4 referencePTS:(id *)a5
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if ((a3->var2 & 1) == 0) {
    return 0;
  }
  if ((a4->var2 & 1) == 0) {
    return 0;
  }
  CMTime time1 = *(CMTime *)a3;
  CMTime time2 = *(CMTime *)a4;
  if ((CMTimeCompare(&time1, &time2) & 0x80000000) == 0) {
    return 0;
  }
  if ((a5->var2 & 1) == 0) {
    return 0;
  }
  CMTime time1 = (CMTime)*a5;
  CMTime time2 = (CMTime)*a3;
  CMTimeAdd(&time, &time1, &time2);
  double Seconds = CMTimeGetSeconds(&time);
  CMTime time1 = (CMTime)*a5;
  CMTime time2 = (CMTime)*a4;
  CMTimeAdd(&v24, &time1, &time2);
  id v10 = [(BWVideoOrientationTimeMachine *)self _cachedItemsFromPTSSeconds:Seconds toPTSSeconds:CMTimeGetSeconds(&v24)];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v20 objects:v28 count:16];
  if (!v11) {
    return 0;
  }
  uint64_t v12 = v11;
  v13 = 0;
  uint64_t v14 = *(void *)v21;
LABEL_7:
  uint64_t v15 = 0;
  while (1)
  {
    if (*(void *)v21 != v14) {
      objc_enumerationMutation(v10);
    }
    v16 = *(void **)(*((void *)&v20 + 1) + 8 * v15);
    if (!v13) {
      v13 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v10, "count"));
    }
    CMTime time1 = (CMTime)*a3;
    CMTime time2 = (CMTime)*a5;
    CMSampleBufferRef v17 = -[BWVideoOrientationTimeMachine _newSbufWithCachedItem:trimAtStartPTS:referencePTS:]((CMSampleBufferRef)self, v16, &time1, &time2);
    if (!v17) {
      return v13;
    }
    CMSampleBufferRef v18 = v17;
    [v13 addObject:v17];
    CFRelease(v18);
    if (v12 == ++v15)
    {
      uint64_t v12 = [v10 countByEnumeratingWithState:&v20 objects:v28 count:16];
      if (v12) {
        goto LABEL_7;
      }
      return v13;
    }
  }
}

- (CMSampleBufferRef)_newSbufWithCachedItem:(CMTime *)a3 trimAtStartPTS:(CMTime *)a4 referencePTS:
{
  if (result)
  {
    CMSampleBufferRef v6 = result;
    CMTime time = *a3;
    double Seconds = CMTimeGetSeconds(&time);
    CMTime time = *a4;
    double v8 = CMTimeGetSeconds(&time);
    [a2 ptsSeconds];
    double v10 = v9 - v8;
    if (v10 < Seconds) {
      double v10 = Seconds;
    }
    memset(&time, 0, sizeof(time));
    CMTimeMakeWithSeconds(&time, v10, a4->timescale);
    uint64_t v11 = [a2 exifOrientation];
    uint64_t v12 = (const opaqueCMFormatDescription *)*((void *)v6 + 3);
    CMTime v13 = time;
    return FigCaptureMetadataUtilitiesCreateVideoOrientationSampleBuffer((uint64_t)&v13, 0, v11, v12);
  }
  return result;
}

- (id)_cachedItemsFromPTSSeconds:(double)a3 toPTSSeconds:(double)a4
{
  pthread_mutex_lock((pthread_mutex_t *)self->_propertyMutex);
  if ([(NSMutableArray *)self->_cache count])
  {
    unint64_t v7 = 0;
    unint64_t v8 = 0x7FFFFFFFFFFFFFFFLL;
    while (1)
    {
      objc_msgSend((id)-[NSMutableArray objectAtIndexedSubscript:](self->_cache, "objectAtIndexedSubscript:", v7), "ptsSeconds");
      if (v9 >= a4 && v8 == 0x7FFFFFFFFFFFFFFFLL) {
        break;
      }
      if (v9 > a3 && v8 != 0x7FFFFFFFFFFFFFFFLL) {
        goto LABEL_17;
      }
      if (v9 < a4) {
        unint64_t v8 = v7;
      }
      if (++v7 >= [(NSMutableArray *)self->_cache count])
      {
        if (v8 == 0x7FFFFFFFFFFFFFFFLL) {
          break;
        }
LABEL_17:
        unint64_t v13 = v8;
        if (v8 < [(NSMutableArray *)self->_cache count])
        {
          objc_msgSend((id)-[NSMutableArray objectAtIndexedSubscript:](self->_cache, "objectAtIndexedSubscript:", v8), "ptsSeconds");
          unint64_t v13 = v8;
          if (v14 < a4)
          {
            unint64_t v15 = v8;
            do
            {
              unint64_t v13 = v15++;
              if (v15 >= [(NSMutableArray *)self->_cache count]) {
                break;
              }
              objc_msgSend((id)-[NSMutableArray objectAtIndexedSubscript:](self->_cache, "objectAtIndexedSubscript:", v15), "ptsSeconds");
            }
            while (v16 < a4);
          }
        }
        uint64_t v12 = (void *)-[NSMutableArray subarrayWithRange:](self->_cache, "subarrayWithRange:", v8, v13 - v8 + 1);
        goto LABEL_23;
      }
    }
  }
  uint64_t v12 = 0;
LABEL_23:
  pthread_mutex_unlock((pthread_mutex_t *)self->_propertyMutex);
  return v12;
}

@end
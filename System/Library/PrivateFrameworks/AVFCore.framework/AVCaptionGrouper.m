@interface AVCaptionGrouper
- (AVCaptionGrouper)init;
- (NSArray)flushAddedCaptionsIntoGroupsUpToTime:(CMTime *)upToTime;
- (void)addCaption:(AVCaption *)input;
- (void)dealloc;
@end

@implementation AVCaptionGrouper

- (AVCaptionGrouper)init
{
  v5.receiver = self;
  v5.super_class = (Class)AVCaptionGrouper;
  v2 = [(AVCaptionGrouper *)&v5 init];
  if (v2)
  {
    v2->_captionCollector = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v3 = MEMORY[0x1E4F1F9F8];
    *(_OWORD *)&v2->_captionGroupStartTime.value = *MEMORY[0x1E4F1F9F8];
    v2->_captionGroupStartTime.epoch = *(void *)(v3 + 16);
  }
  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)AVCaptionGrouper;
  [(AVCaptionGrouper *)&v3 dealloc];
}

- (void)addCaption:(AVCaption *)input
{
  if ((self->_captionGroupStartTime.flags & 1) == 0)
  {
    p_captionGroupStartTime = &self->_captionGroupStartTime;
    if (input)
    {
      [(AVCaption *)input timeRange];
    }
    else
    {
      long long v7 = 0u;
      long long v8 = 0u;
      long long v6 = 0u;
    }
    *(_OWORD *)&p_captionGroupStartTime->value = v6;
    self->_captionGroupStartTime.epoch = v7;
  }
  -[NSMutableArray addObject:](self->_captionCollector, "addObject:", input, v6, v7, v8);
}

- (NSArray)flushAddedCaptionsIntoGroupsUpToTime:(CMTime *)upToTime
{
  v18 = (NSArray *)[MEMORY[0x1E4F1CA48] array];
  objc_super v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_captionCollector, "count"));
  long long v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_captionCollector, "count"));
  p_captionGroupStartTime = &self->_captionGroupStartTime;
  v17 = v22;
  p_duration = &v32.duration;
  v16 = v20;
  while (1)
  {
    objc_msgSend(v5, "removeAllObjects", p_duration, v16, v17);
    [v6 removeAllObjects];
    memset(&v32, 0, sizeof(v32));
    *(_OWORD *)&start.value = *(_OWORD *)&p_captionGroupStartTime->value;
    start.epoch = self->_captionGroupStartTime.epoch;
    *(_OWORD *)&end.start.value = *(_OWORD *)&upToTime->value;
    end.start.epoch = upToTime->epoch;
    CMTimeRangeFromTimeToTime(&v32, &start, &end.start);
    start.value = 0;
    *(void *)&start.timescale = &start;
    start.epoch = 0x3810000000;
    v30 = &unk_194C75EBF;
    memset(&v31, 0, sizeof(v31));
    CMTimeRange end = v32;
    CMTimeRangeGetEnd(&v31, &end);
    captionCollector = self->_captionCollector;
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __57__AVCaptionGrouper_flushAddedCaptionsIntoGroupsUpToTime___block_invoke;
    v27[3] = &unk_1E57B66C8;
    v27[4] = self;
    v27[5] = &start;
    [(NSMutableArray *)captionCollector enumerateObjectsUsingBlock:v27];
    *(_OWORD *)&time2.value = *(_OWORD *)&p_captionGroupStartTime->value;
    time2.epoch = self->_captionGroupStartTime.epoch;
    CMTime v25 = *(CMTime *)(*(void *)&start.timescale + 32);
    CMTimeRangeFromTimeToTime(&end, &time2, &v25);
    CMTimeRange v32 = end;
    char flags = end.start.flags;
    if ((end.start.flags & 1) != 0
      && (v32.duration.flags & 1) != 0
      && !v32.duration.epoch
      && (v32.duration.value & 0x8000000000000000) == 0)
    {
      *(_OWORD *)&end.start.value = *(_OWORD *)&p_duration->value;
      end.start.epoch = p_duration->epoch;
      CMTime time2 = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA48];
      if (!CMTimeCompare(&end.start, &time2)) {
        break;
      }
      char flags = v32.start.flags;
    }
    if ((flags & 0x1D) != 1) {
      break;
    }
    CMTimeRange end = v32;
    CMTimeRangeGetEnd(&v24, &end);
    if ((v24.flags & 0x1D) != 1) {
      break;
    }
    v10 = self->_captionCollector;
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v22[0] = __57__AVCaptionGrouper_flushAddedCaptionsIntoGroupsUpToTime___block_invoke_2;
    v22[1] = &unk_1E57B66F0;
    CMTimeRange v23 = v32;
    v22[2] = v5;
    [(NSMutableArray *)v10 enumerateObjectsUsingBlock:v21];
    v11 = [AVCaptionGroup alloc];
    CMTimeRange end = v32;
    v12 = [(AVCaptionGroup *)v11 initWithCaptions:v5 timeRange:&end];
    [(NSArray *)v18 addObject:v12];

    CMTimeRange end = v32;
    CMTimeRangeGetEnd(&time2, &end);
    *(_OWORD *)&p_captionGroupStartTime->value = *(_OWORD *)&time2.value;
    self->_captionGroupStartTime.epoch = time2.epoch;
    v13 = self->_captionCollector;
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v20[0] = __57__AVCaptionGrouper_flushAddedCaptionsIntoGroupsUpToTime___block_invoke_3;
    v20[1] = &unk_1E57B6718;
    v20[2] = self;
    v20[3] = v6;
    [(NSMutableArray *)v13 enumerateObjectsUsingBlock:v19];
    [(NSMutableArray *)self->_captionCollector removeObjectsInArray:v6];
    _Block_object_dispose(&start, 8);
    if (![(NSMutableArray *)self->_captionCollector count]) {
      goto LABEL_13;
    }
  }
  _Block_object_dispose(&start, 8);
LABEL_13:

  return v18;
}

__n128 __57__AVCaptionGrouper_flushAddedCaptionsIntoGroupsUpToTime___block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    [a2 timeRange];
    *(_OWORD *)&v22.value = v19;
    v22.epoch = v20;
    memset(&v18, 0, sizeof(v18));
    [a2 timeRange];
  }
  else
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v19 = 0u;
    memset(&v22, 0, sizeof(v22));
    memset(&v18, 0, sizeof(v18));
    memset(&range, 0, sizeof(range));
  }
  CMTimeRangeGetEnd(&v18, &range);
  uint64_t v4 = *(void *)(a1 + 32);
  CMTime time1 = v22;
  CMTime time2 = *(CMTime *)(v4 + 16);
  if (CMTimeCompare(&time1, &time2) < 1)
  {
    uint64_t v9 = *(void *)(a1 + 32);
    CMTime time1 = v18;
    CMTime time2 = *(CMTime *)(v9 + 16);
    if (CMTimeCompare(&time1, &time2) < 1) {
      return result;
    }
    uint64_t v11 = *(void *)(a1 + 40);
    uint64_t v5 = a1 + 40;
    CMTime time1 = *(CMTime *)(*(void *)(v11 + 8) + 32);
    CMTime time2 = v18;
    long long v7 = (__n128 *)v13;
    long long v8 = (CMTime *)v13;
  }
  else
  {
    uint64_t v6 = *(void *)(a1 + 40);
    uint64_t v5 = a1 + 40;
    CMTime time1 = *(CMTime *)(*(void *)(v6 + 8) + 32);
    CMTime time2 = v22;
    long long v7 = (__n128 *)v14;
    long long v8 = (CMTime *)v14;
  }
  CMTimeMinimum(v8, &time1, &time2);
  v12 = *(__n128 **)(*(void *)v5 + 8);
  __n128 result = *v7;
  v12[2] = *v7;
  v12[3].n128_u64[0] = v7[1].n128_u64[0];
  return result;
}

uint64_t __57__AVCaptionGrouper_flushAddedCaptionsIntoGroupsUpToTime___block_invoke_2(uint64_t a1, void *a2)
{
  memset(&v10, 0, sizeof(v10));
  uint64_t v4 = (_OWORD *)(a1 + 40);
  if (a2) {
    [a2 timeRange];
  }
  else {
    memset(&otherRange, 0, sizeof(otherRange));
  }
  long long v5 = v4[1];
  *(_OWORD *)&range.start.value = *v4;
  *(_OWORD *)&range.start.epoch = v5;
  *(_OWORD *)&range.duration.timescale = v4[2];
  CMTimeRangeGetIntersection(&v10, &range, &otherRange);
  if ((v10.start.flags & 1) == 0) {
    return [*(id *)(a1 + 32) addObject:a2];
  }
  if ((v10.duration.flags & 1) == 0) {
    return [*(id *)(a1 + 32) addObject:a2];
  }
  if (v10.duration.epoch) {
    return [*(id *)(a1 + 32) addObject:a2];
  }
  if (v10.duration.value < 0) {
    return [*(id *)(a1 + 32) addObject:a2];
  }
  range.CMTime start = v10.duration;
  CMTime v7 = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA48];
  uint64_t result = CMTimeCompare(&range.start, &v7);
  if (result) {
    return [*(id *)(a1 + 32) addObject:a2];
  }
  return result;
}

uint64_t __57__AVCaptionGrouper_flushAddedCaptionsIntoGroupsUpToTime___block_invoke_3(uint64_t a1, void *a2)
{
  memset(&v9, 0, sizeof(v9));
  if (a2) {
    [a2 timeRange];
  }
  else {
    memset(&range, 0, sizeof(range));
  }
  CMTimeRangeGetEnd(&v9, &range);
  uint64_t v4 = *(void *)(a1 + 32);
  CMTime time1 = v9;
  CMTime v6 = *(CMTime *)(v4 + 16);
  uint64_t result = CMTimeCompare(&time1, &v6);
  if ((int)result <= 0) {
    return [*(id *)(a1 + 40) addObject:a2];
  }
  return result;
}

@end
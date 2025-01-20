@interface BWPhotoDescriptor
+ (BOOL)supportsSecureCoding;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)presentationTimeStamp;
- (BOOL)isEqual:(id)a3;
- (BWPhotoDescriptor)initWithCoder:(id)a3;
- (BWPhotoDescriptor)initWithPhotoIdentifier:(id)a3 processingFlags:(unsigned int)a4;
- (BWPhotoDescriptor)initWithPhotoIdentifier:(id)a3 processingFlags:(unsigned int)a4 time:(id)a5 timeZone:(id)a6 presentationTimeStamp:(id *)a7;
- (NSDate)time;
- (NSString)photoIdentifier;
- (NSTimeZone)timeZone;
- (id)description;
- (unint64_t)hash;
- (unsigned)processingFlags;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setPresentationTimeStamp:(id *)a3;
- (void)setTime:(id)a3;
- (void)setTimeZone:(id)a3;
@end

@implementation BWPhotoDescriptor

- (BWPhotoDescriptor)initWithPhotoIdentifier:(id)a3 processingFlags:(unsigned int)a4
{
  v9.receiver = self;
  v9.super_class = (Class)BWPhotoDescriptor;
  v6 = [(BWPhotoDescriptor *)&v9 init];
  if (v6)
  {
    *((void *)v6 + 1) = [a3 copy];
    *((_DWORD *)v6 + 4) = a4;
    uint64_t v7 = MEMORY[0x1E4F1F9F8];
    *(_OWORD *)(v6 + 52) = *MEMORY[0x1E4F1F9F8];
    *(void *)(v6 + 68) = *(void *)(v7 + 16);
  }
  return (BWPhotoDescriptor *)v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BWPhotoDescriptor)initWithPhotoIdentifier:(id)a3 processingFlags:(unsigned int)a4 time:(id)a5 timeZone:(id)a6 presentationTimeStamp:(id *)a7
{
  v16.receiver = self;
  v16.super_class = (Class)BWPhotoDescriptor;
  v12 = [(BWPhotoDescriptor *)&v16 init];
  if (v12)
  {
    v12->_photoIdentifier = (NSString *)[a3 copy];
    v12->_processingFlags = a4;
    [(BWPhotoDescriptor *)v12 setTime:a5];
    [(BWPhotoDescriptor *)v12 setTimeZone:a6];
    long long v14 = *(_OWORD *)&a7->var0;
    int64_t var3 = a7->var3;
    [(BWPhotoDescriptor *)v12 setPresentationTimeStamp:&v14];
  }
  return v12;
}

- (BWPhotoDescriptor)initWithCoder:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)BWPhotoDescriptor;
  v4 = [(BWPhotoDescriptor *)&v9 init];
  if (v4)
  {
    v4->_photoIdentifier = (NSString *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"photoIdentifer"];
    v4->_processingFlags = objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), @"processingFlags"), "unsignedIntValue");
    -[BWPhotoDescriptor setTime:](v4, "setTime:", [a3 decodeObjectOfClass:objc_opt_class() forKey:@"time"]);
    -[BWPhotoDescriptor setTimeZone:](v4, "setTimeZone:", [a3 decodeObjectOfClass:objc_opt_class() forKey:@"timeZone"]);
    uint64_t v5 = objc_opt_class();
    CFDictionaryRef v6 = (const __CFDictionary *)[a3 decodeDictionaryWithKeysOfClass:v5 objectsOfClass:objc_opt_class() forKey:@"timeStamp"];
    CMTimeMakeFromDictionary(&v8, v6);
    [(BWPhotoDescriptor *)v4 setPresentationTimeStamp:&v8];
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  [a3 encodeObject:self->_photoIdentifier forKey:@"photoIdentifer"];
  objc_msgSend(a3, "encodeObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", self->_processingFlags), @"processingFlags");
  [a3 encodeObject:self->_time forKey:@"time"];
  [a3 encodeObject:self->_timeZone forKey:@"timeZone"];
  CFAllocatorRef v5 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  *(_OWORD *)&v7.value = *(_OWORD *)(&self->_timeZoneHasBeenSet + 4);
  v7.epoch = *(void *)&self->_presentationTimeStamp.flags;
  CFDictionaryRef v6 = CMTimeCopyAsDictionary(&v7, v5);
  [a3 encodeObject:v6 forKey:@"timeStamp"];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)BWPhotoDescriptor;
  [(BWPhotoDescriptor *)&v3 dealloc];
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self)
  {
    LOBYTE(v8) = 1;
    return v8;
  }
  uint64_t v15 = v3;
  uint64_t v16 = v4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_13;
  }
  CMTime v7 = [(BWPhotoDescriptor *)self photoIdentifier];
  if (v7 != (NSString *)[a3 photoIdentifier])
  {
    int v8 = -[NSString isEqual:](-[BWPhotoDescriptor photoIdentifier](self, "photoIdentifier"), "isEqual:", [a3 photoIdentifier]);
    if (!v8) {
      return v8;
    }
  }
  unsigned int v9 = [(BWPhotoDescriptor *)self processingFlags];
  if (v9 != [a3 processingFlags])
  {
LABEL_13:
    LOBYTE(v8) = 0;
    return v8;
  }
  v10 = [(BWPhotoDescriptor *)self time];
  if (v10 == (NSDate *)[a3 time]
    || (int v8 = -[NSDate isEqual:](-[BWPhotoDescriptor time](self, "time"), "isEqual:", [a3 time])) != 0)
  {
    v11 = [(BWPhotoDescriptor *)self timeZone];
    if (v11 == (NSTimeZone *)[a3 timeZone]
      || (int v8 = -[NSTimeZone isEqual:](-[BWPhotoDescriptor timeZone](self, "timeZone"), "isEqual:", [a3 timeZone])) != 0)
    {
      if (self)
      {
        [(BWPhotoDescriptor *)self presentationTimeStamp];
        if (a3)
        {
LABEL_12:
          [a3 presentationTimeStamp];
LABEL_18:
          LOBYTE(v8) = CMTimeCompare(&time1, &v13) == 0;
          return v8;
        }
      }
      else
      {
        memset(&time1, 0, sizeof(time1));
        if (a3) {
          goto LABEL_12;
        }
      }
      memset(&v13, 0, sizeof(v13));
      goto LABEL_18;
    }
  }
  return v8;
}

- (unint64_t)hash
{
  return [(NSString *)self->_photoIdentifier hash];
}

- (void)setTime:(id)a3
{
  self->_time = (NSDate *)a3;
  self->_timeHasBeenSet = 1;
}

- (NSDate)time
{
  v2 = self->_time;
  return v2;
}

- (void)setTimeZone:(id)a3
{
  self->_timeZone = (NSTimeZone *)a3;
  self->_timeZoneHasBeenSet = 1;
}

- (NSTimeZone)timeZone
{
  v2 = self->_timeZone;
  return v2;
}

- (void)setPresentationTimeStamp:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0;
  *(void *)&self->_presentationTimeStamp.flags = a3->var3;
  *(_OWORD *)(&self->_timeZoneHasBeenSet + 4) = v3;
  BYTE4(self->_presentationTimeStamp.epoch) = 1;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)presentationTimeStamp
{
  *(_OWORD *)&retstr->var0 = *(_OWORD *)((char *)&self[2].var0 + 4);
  retstr->int64_t var3 = *(int64_t *)((char *)&self[2].var3 + 4);
  return self;
}

- (id)description
{
  long long v3 = (void *)[MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p>: ", objc_opt_class(), self];
  CFAllocatorRef v4 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  *(_OWORD *)&time.value = *(_OWORD *)(&self->_timeZoneHasBeenSet + 4);
  time.epoch = *(void *)&self->_presentationTimeStamp.flags;
  CFAllocatorRef v5 = (__CFString *)CMTimeCopyDescription(v4, &time);
  [v3 appendFormat:@"identifier: %@, flags: \"%@\", time: \"%@\", timeZone: \"%@\", presentationTimeStamp: %@", self->_photoIdentifier, FigAppleMakerNoteStillImageProcessingFlagsToShortString(self->_processingFlags), self->_time, self->_timeZone, v5];

  return v3;
}

- (NSString)photoIdentifier
{
  return self->_photoIdentifier;
}

- (unsigned)processingFlags
{
  return self->_processingFlags;
}

@end
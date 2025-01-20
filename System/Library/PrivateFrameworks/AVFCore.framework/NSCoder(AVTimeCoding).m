@interface NSCoder(AVTimeCoding)
- (CMTime)decodeCMTimeForKey:()AVTimeCoding;
- (CMTimeRange)decodeCMTimeRangeForKey:()AVTimeCoding;
- (double)decodeCMTimeMappingForKey:()AVTimeCoding;
- (void)encodeCMTime:()AVTimeCoding forKey:;
- (void)encodeCMTimeMapping:()AVTimeCoding forKey:;
- (void)encodeCMTimeRange:()AVTimeCoding forKey:;
@end

@implementation NSCoder(AVTimeCoding)

- (void)encodeCMTime:()AVTimeCoding forKey:
{
  CFAllocatorRef v6 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  CMTime v8 = *a3;
  CFDictionaryRef v7 = CMTimeCopyAsDictionary(&v8, v6);
  [a1 encodeObject:v7 forKey:a4];
  if (v7) {
    CFRelease(v7);
  }
}

- (CMTime)decodeCMTimeForKey:()AVTimeCoding
{
  CFAllocatorRef v6 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  CFDictionaryRef v9 = (const __CFDictionary *)objc_msgSend(a1, "decodeObjectOfClasses:forKey:", objc_msgSend(v6, "setWithObjects:", v7, v8, objc_opt_class(), 0), a2);
  return CMTimeMakeFromDictionary(a3, v9);
}

- (void)encodeCMTimeRange:()AVTimeCoding forKey:
{
  CFAllocatorRef v6 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  long long v7 = a3[1];
  *(_OWORD *)&v9.start.value = *a3;
  *(_OWORD *)&v9.start.epoch = v7;
  *(_OWORD *)&v9.duration.timescale = a3[2];
  CFDictionaryRef v8 = CMTimeRangeCopyAsDictionary(&v9, v6);
  [a1 encodeObject:v8 forKey:a4];
  if (v8) {
    CFRelease(v8);
  }
}

- (CMTimeRange)decodeCMTimeRangeForKey:()AVTimeCoding
{
  CFAllocatorRef v6 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  CFDictionaryRef v9 = (const __CFDictionary *)objc_msgSend(a1, "decodeObjectOfClasses:forKey:", objc_msgSend(v6, "setWithObjects:", v7, v8, objc_opt_class(), 0), a2);
  return CMTimeRangeMakeFromDictionary(a3, v9);
}

- (void)encodeCMTimeMapping:()AVTimeCoding forKey:
{
  CFAllocatorRef v7 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  long long v8 = a3[1];
  *(_OWORD *)&range.start.value = *a3;
  *(_OWORD *)&range.start.epoch = v8;
  *(_OWORD *)&range.duration.timescale = a3[2];
  CFDictionaryRef v9 = CMTimeRangeCopyAsDictionary(&range, v7);
  long long v10 = a3[4];
  *(_OWORD *)&range.start.value = a3[3];
  *(_OWORD *)&range.start.epoch = v10;
  *(_OWORD *)&range.duration.timescale = a3[5];
  CFDictionaryRef v11 = CMTimeRangeCopyAsDictionary(&range, v7);
  v12 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", v9, v11, 0);
  [a1 encodeObject:v12 forKey:a4];

  if (v9) {
    CFRelease(v9);
  }
  if (v11) {
    CFRelease(v11);
  }
}

- (double)decodeCMTimeMappingForKey:()AVTimeCoding
{
  uint64_t v6 = MEMORY[0x1E4F1FA20];
  long long v7 = *MEMORY[0x1E4F1FA20];
  long long v8 = *(_OWORD *)(MEMORY[0x1E4F1FA20] + 16);
  *a3 = *MEMORY[0x1E4F1FA20];
  a3[1] = v8;
  long long v9 = *(_OWORD *)(v6 + 32);
  a3[2] = v9;
  a3[3] = v7;
  a3[4] = v8;
  a3[5] = v9;
  long long v10 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = objc_opt_class();
  uint64_t v13 = objc_opt_class();
  v14 = objc_msgSend(a1, "decodeObjectOfClasses:forKey:", objc_msgSend(v10, "setWithObjects:", v11, v12, v13, objc_opt_class(), 0), a2);
  if ([v14 count] == 2)
  {
    CMTimeRangeMakeFromDictionary(&v18, (CFDictionaryRef)[v14 objectAtIndex:0]);
    long long v16 = *(_OWORD *)&v18.start.epoch;
    *a3 = *(_OWORD *)&v18.start.value;
    a3[1] = v16;
    a3[2] = *(_OWORD *)&v18.duration.timescale;
    CMTimeRangeMakeFromDictionary(&v18, (CFDictionaryRef)[v14 objectAtIndex:1]);
    long long v17 = *(_OWORD *)&v18.start.epoch;
    a3[3] = *(_OWORD *)&v18.start.value;
    a3[4] = v17;
    double result = *(double *)&v18.duration.timescale;
    a3[5] = *(_OWORD *)&v18.duration.timescale;
  }
  return result;
}

@end
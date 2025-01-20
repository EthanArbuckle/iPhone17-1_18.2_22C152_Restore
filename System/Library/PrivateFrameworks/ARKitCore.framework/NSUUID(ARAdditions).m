@interface NSUUID(ARAdditions)
+ (id)ar_NSUUIDSetWithCFArrayRef:()ARAdditions;
+ (id)ar_NSUUIDsWithCFArrayRef:()ARAdditions;
+ (id)ar_UUIDWithCFUUIDRef:()ARAdditions;
+ (id)ar_UUIDWithCVPixelBuffer:()ARAdditions;
+ (id)ar_UUIDWithData:()ARAdditions;
+ (id)ar_UUIDWithIntegerValue:()ARAdditions;
+ (id)ar_zeroUUID;
- (CFUUIDRef)ar_createCFUUIDRef;
- (uint64_t)ar_integerValue;
@end

@implementation NSUUID(ARAdditions)

+ (id)ar_UUIDWithCVPixelBuffer:()ARAdditions
{
  CVPixelBufferLockBaseAddress(pixelBuffer, 0);
  BaseAddress = CVPixelBufferGetBaseAddress(pixelBuffer);
  size_t BytesPerRow = CVPixelBufferGetBytesPerRow(pixelBuffer);
  v6 = [MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:BaseAddress length:CVPixelBufferGetHeight(pixelBuffer) * BytesPerRow freeWhenDone:0];
  v7 = objc_msgSend((id)objc_opt_class(), "ar_UUIDWithData:", v6);
  CVPixelBufferUnlockBaseAddress(pixelBuffer, 0);

  return v7;
}

+ (id)ar_UUIDWithData:()ARAdditions
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = (const void *)[v3 bytes];
  CC_LONG v5 = [v3 length];

  CC_SHA1(v4, v5, md);
  long long v8 = *(_OWORD *)md;
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDBytes:&v8];
  return v6;
}

+ (id)ar_zeroUUID
{
  v2[2] = *MEMORY[0x1E4F143B8];
  v2[0] = 0;
  v2[1] = 0;
  v0 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDBytes:v2];
  return v0;
}

+ (id)ar_UUIDWithIntegerValue:()ARAdditions
{
  v5[2] = *MEMORY[0x1E4F143B8];
  v5[0] = a3;
  v5[1] = ~a3;
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDBytes:v5];
  return v3;
}

+ (id)ar_UUIDWithCFUUIDRef:()ARAdditions
{
  CFUUIDBytes v5 = CFUUIDGetUUIDBytes(uuid);
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDBytes:&v5];
  return v3;
}

- (uint64_t)ar_integerValue
{
  v2[2] = *MEMORY[0x1E4F143B8];
  v2[0] = 0;
  v2[1] = 0;
  [a1 getUUIDBytes:v2];
  return v2[0];
}

- (CFUUIDRef)ar_createCFUUIDRef
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  *(void *)&v2.byte0 = 0;
  *(void *)&v2.byte8 = 0;
  [a1 getUUIDBytes:&v2];
  return CFUUIDCreateFromUUIDBytes((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v2);
}

+ (id)ar_NSUUIDsWithCFArrayRef:()ARAdditions
{
  if (theArray)
  {
    CFIndex Count = CFArrayGetCount(theArray);
    CFUUIDBytes v5 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:Count];
    if (Count)
    {
      for (CFIndex i = 0; i != Count; ++i)
      {
        v7 = objc_msgSend(MEMORY[0x1E4F29128], "ar_UUIDWithCFUUIDRef:", CFArrayGetValueAtIndex(theArray, i));
        [v5 addObject:v7];
      }
    }
  }
  else
  {
    CFUUIDBytes v5 = [MEMORY[0x1E4F1C978] array];
  }
  return v5;
}

+ (id)ar_NSUUIDSetWithCFArrayRef:()ARAdditions
{
  if (theArray)
  {
    CFIndex Count = CFArrayGetCount(theArray);
    CFUUIDBytes v5 = (void *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithCapacity:Count];
    if (Count)
    {
      for (CFIndex i = 0; i != Count; ++i)
      {
        v7 = objc_msgSend(MEMORY[0x1E4F29128], "ar_UUIDWithCFUUIDRef:", CFArrayGetValueAtIndex(theArray, i));
        [v5 addObject:v7];
      }
    }
  }
  else
  {
    CFUUIDBytes v5 = [MEMORY[0x1E4F1CAD0] set];
  }
  return v5;
}

@end
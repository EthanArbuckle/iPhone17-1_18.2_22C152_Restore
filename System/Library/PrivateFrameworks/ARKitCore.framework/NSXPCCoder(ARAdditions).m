@interface NSXPCCoder(ARAdditions)
- (CVPixelBufferRef)ar_decodePixelBufferForKey:()ARAdditions;
- (void)ar_encodePixelBuffer:()ARAdditions forKey:;
@end

@implementation NSXPCCoder(ARAdditions)

- (CVPixelBufferRef)ar_decodePixelBufferForKey:()ARAdditions
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  CVPixelBufferRef pixelBufferOut = 0;
  v5 = [a1 decodeObjectOfClass:objc_opt_class() forKey:v4];
  if (v5)
  {
    CVReturn v6 = CVPixelBufferCreateWithIOSurface((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v5, 0, &pixelBufferOut);
    if (v6)
    {
      v7 = _ARLogGeneral_17();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        v8 = (objc_class *)objc_opt_class();
        v9 = NSStringFromClass(v8);
        *(_DWORD *)buf = 138543874;
        v14 = v9;
        __int16 v15 = 2048;
        v16 = a1;
        __int16 v17 = 1024;
        CVReturn v18 = v6;
        _os_log_impl(&dword_1B88A2000, v7, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Failed to decode pixel buffer - status: %d", buf, 0x1Cu);
      }
    }
  }
  CVPixelBufferRef v10 = pixelBufferOut;

  return v10;
}

- (void)ar_encodePixelBuffer:()ARAdditions forKey:
{
  id v7 = a4;
  CVReturn v6 = CVPixelBufferGetIOSurface(a3);
  [a1 encodeObject:v6 forKey:v7];
}

@end
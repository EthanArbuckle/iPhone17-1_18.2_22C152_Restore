@interface ASVTextureDescription
+ (int64_t)pixelEncodingForBitsPerComponent:(unint64_t)a3;
+ (unint64_t)bytesPerComponentForColorModel:(int64_t)a3;
+ (unint64_t)bytesPerComponentForPixelEncoding:(int64_t)a3;
+ (unint64_t)bytesPerPixelForPixelFormat:(id)a3;
- ($0AC6E346AE4835514AAA8AC86D8F4844)destinationPixelFormat;
- ($0AC6E346AE4835514AAA8AC86D8F4844)originalPixelFormat;
- (ASVTextureDescription)initWithName:(id)a3 destinationPixelFormat:(id)a4 imageProperties:(__CFDictionary *)a5 fileType:(__CFString *)a6 generateMipmaps:(BOOL)a7;
- (ASVTextureDescription)initWithName:(id)a3 originalSize:(id)a4 originalPixelFormat:(id)a5 destinationPixelFormat:(int64_t)a6 downsamplingFactor:(int64_t)a7 fileType:(BOOL)a8 generateMipmaps:;
- (BOOL)generateMipmaps;
- (BOOL)requiresDownsampling;
- (NSString)name;
- (__n64)destinationSize;
- (double)originalSize;
- (id)debugDescription;
- (int64_t)downsamplingFactor;
- (int64_t)fileType;
- (void)setDownsamplingFactor:(int64_t)a3;
- (void)setGenerateMipmaps:(BOOL)a3;
@end

@implementation ASVTextureDescription

- (ASVTextureDescription)initWithName:(id)a3 originalSize:(id)a4 originalPixelFormat:(id)a5 destinationPixelFormat:(int64_t)a6 downsamplingFactor:(int64_t)a7 fileType:(BOOL)a8 generateMipmaps:
{
  int64_t var1 = a5.var1;
  int64_t var0 = a5.var0;
  int64_t v12 = a4.var1;
  int64_t v13 = a4.var0;
  uint64_t v14 = v8;
  id v17 = a3;
  v21.receiver = self;
  v21.super_class = (Class)ASVTextureDescription;
  v18 = [(ASVTextureDescription *)&v21 init];
  v19 = v18;
  if (v18)
  {
    *(void *)&v18->_originalSize[7] = v14;
    v18->_originalPixelFormat.colorModel = v13;
    v18->_originalPixelFormat.pixelEncoding = v12;
    v18->_destinationPixelFormat.colorModel = var0;
    v18->_destinationPixelFormat.pixelEncoding = var1;
    v18->_downsamplingFactor = a6;
    v18->_fileType = a7;
    objc_storeStrong((id *)&v18->_name, a3);
    v19->_generateMipmaps = a8;
  }

  return v19;
}

- (ASVTextureDescription)initWithName:(id)a3 destinationPixelFormat:(id)a4 imageProperties:(__CFDictionary *)a5 fileType:(__CFString *)a6 generateMipmaps:(BOOL)a7
{
  int64_t var1 = a4.var1;
  int64_t var0 = a4.var0;
  id v14 = a3;
  v39.receiver = self;
  v39.super_class = (Class)ASVTextureDescription;
  v15 = [(ASVTextureDescription *)&v39 init];
  v16 = v15;
  if (!v15) {
    goto LABEL_39;
  }
  objc_storeStrong((id *)&v15->_name, a3);
  v16->_generateMipmaps = a7;
  uint64_t v17 = 1;
  v16->_downsamplingFactor = 1;
  if (!CFEqual(a6, (CFTypeRef)*MEMORY[0x1E4F22610]))
  {
    if (CFEqual(a6, (CFTypeRef)*MEMORY[0x1E4F22678]))
    {
      uint64_t v17 = 2;
    }
    else if (CFEqual(a6, (CFTypeRef)*MEMORY[0x1E4F226E8]))
    {
      uint64_t v17 = 3;
    }
    else if (CFEqual(a6, @"public.heic") || CFEqual(a6, @"public.heif"))
    {
      uint64_t v17 = 4;
    }
    else if (CFEqual(a6, (CFTypeRef)*MEMORY[0x1E4F225D8]))
    {
      uint64_t v17 = 5;
    }
    else
    {
      uint64_t v17 = 6;
    }
  }
  v16->_fileType = v17;
  CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue(a5, (const void *)*MEMORY[0x1E4F2FD00]);
  CFNumberRef v19 = (const __CFNumber *)CFDictionaryGetValue(a5, (const void *)*MEMORY[0x1E4F2FCE8]);
  CFNumberRef v20 = (const __CFNumber *)CFDictionaryGetValue(a5, (const void *)*MEMORY[0x1E4F2F6B8]);
  if (Value) {
    BOOL v21 = v19 == 0;
  }
  else {
    BOOL v21 = 1;
  }
  if (!v21 && v20 != 0)
  {
    CFNumberRef v24 = v20;
    uint64_t v37 = 0;
    uint64_t valuePtr = 0;
    CFNumberGetValue(Value, kCFNumberNSIntegerType, &valuePtr);
    CFNumberGetValue(v19, kCFNumberNSIntegerType, &v37);
    *(void *)&v16->_originalSize[7] = __PAIR64__(v37, valuePtr);
    uint64_t v36 = 0;
    CFNumberGetValue(v24, kCFNumberNSIntegerType, &v36);
    v25 = CFDictionaryGetValue(a5, (const void *)*MEMORY[0x1E4F2F578]);
    v26 = CFDictionaryGetValue(a5, (const void *)*MEMORY[0x1E4F2FBE8]);
    v27 = (const void *)*MEMORY[0x1E4F2FB40];
    if (CFDictionaryContainsKey(a5, (const void *)*MEMORY[0x1E4F2FB40]))
    {
      CFBooleanRef v29 = (const __CFBoolean *)CFDictionaryGetValue(a5, v27);
      int v30 = CFBooleanGetValue(v29);
      if (!v25) {
        goto LABEL_36;
      }
    }
    else
    {
      int v30 = 0;
      if (!v25) {
        goto LABEL_36;
      }
    }
    if (CFEqual(v25, (CFTypeRef)*MEMORY[0x1E4F2F588]))
    {
      uint64_t v31 = 1;
      if (v30) {
        uint64_t v31 = 2;
      }
      if (v36 < 9 && *MEMORY[0x1E4F1CFD0] == (void)v26) {
        uint64_t v33 = 6;
      }
      else {
        uint64_t v33 = v31;
      }
LABEL_37:
      int64_t v34 = +[ASVTextureDescription pixelEncodingForBitsPerComponent:v36];
      v16->_originalPixelFormat.colorModel = v33;
      v16->_originalPixelFormat.pixelEncoding = v34;
      v16->_destinationPixelFormat.colorModel = var0;
      v16->_destinationPixelFormat.pixelEncoding = var1;
      if (var0)
      {
        if (var1)
        {
LABEL_39:
          v23 = v16;
          goto LABEL_40;
        }
      }
      else
      {
        v16->_destinationPixelFormat.colorModel = v33;
        if (var1) {
          goto LABEL_39;
        }
      }
      v16->_destinationPixelFormat.pixelEncoding = v34;
      goto LABEL_39;
    }
    if (CFEqual(v25, (CFTypeRef)*MEMORY[0x1E4F2F580]))
    {
      if (v30) {
        uint64_t v33 = 5;
      }
      else {
        uint64_t v33 = 4;
      }
      goto LABEL_37;
    }
LABEL_36:
    uint64_t v33 = 0;
    goto LABEL_37;
  }
  v23 = 0;
LABEL_40:

  return v23;
}

- (__n64)destinationSize
{
  [a1 originalSize];
  uint64_t v3 = v2 / [a1 downsamplingFactor];
  [a1 originalSize];
  uint64_t v5 = v4;
  uint64_t v6 = [a1 downsamplingFactor];
  result.n64_u32[0] = v3;
  result.n64_u32[1] = v5 / v6;
  return result;
}

- (id)debugDescription
{
  uint64_t v3 = NSString;
  int v4 = [(ASVTextureDescription *)self name];
  [(ASVTextureDescription *)self originalSize];
  uint64_t v6 = v5;
  [(ASVTextureDescription *)self originalSize];
  uint64_t v8 = v7;
  [(ASVTextureDescription *)self destinationSize];
  uint64_t v10 = v9;
  [(ASVTextureDescription *)self destinationSize];
  int64_t v12 = [v3 stringWithFormat:@"%@: original (%d, %d), destination (%d, %d)", v4, v6, v8, v10, v11];

  return v12;
}

- (BOOL)requiresDownsampling
{
  return [(ASVTextureDescription *)self downsamplingFactor] > 1;
}

+ (unint64_t)bytesPerComponentForColorModel:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 5) {
    return 0;
  }
  else {
    return qword_1E29A3CD8[a3 - 1];
  }
}

+ (unint64_t)bytesPerComponentForPixelEncoding:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 2) {
    return 0;
  }
  else {
    return qword_1E29A3D08[a3 - 1];
  }
}

+ (int64_t)pixelEncodingForBitsPerComponent:(unint64_t)a3
{
  int64_t v3 = 3;
  if (a3 != 32) {
    int64_t v3 = 0;
  }
  if (a3 == 16) {
    int64_t v3 = 2;
  }
  if (a3 < 9) {
    return 1;
  }
  else {
    return v3;
  }
}

+ (unint64_t)bytesPerPixelForPixelFormat:(id)a3
{
  int64_t var1 = a3.var1;
  unint64_t v4 = +[ASVTextureDescription bytesPerComponentForColorModel:a3.var0];
  return +[ASVTextureDescription bytesPerComponentForPixelEncoding:var1]* v4;
}

- (double)originalSize
{
  return *(double *)(a1 + 16);
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)originalPixelFormat
{
  int64_t pixelEncoding = self->_originalPixelFormat.pixelEncoding;
  int64_t colorModel = self->_originalPixelFormat.colorModel;
  result.int64_t var1 = pixelEncoding;
  result.int64_t var0 = colorModel;
  return result;
}

- (int64_t)downsamplingFactor
{
  return self->_downsamplingFactor;
}

- (void)setDownsamplingFactor:(int64_t)a3
{
  self->_downsamplingFactor = a3;
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)destinationPixelFormat
{
  int64_t pixelEncoding = self->_destinationPixelFormat.pixelEncoding;
  int64_t colorModel = self->_destinationPixelFormat.colorModel;
  result.int64_t var1 = pixelEncoding;
  result.int64_t var0 = colorModel;
  return result;
}

- (int64_t)fileType
{
  return self->_fileType;
}

- (NSString)name
{
  return self->_name;
}

- (BOOL)generateMipmaps
{
  return self->_generateMipmaps;
}

- (void)setGenerateMipmaps:(BOOL)a3
{
  self->_generateMipmaps = a3;
}

- (void).cxx_destruct
{
}

@end
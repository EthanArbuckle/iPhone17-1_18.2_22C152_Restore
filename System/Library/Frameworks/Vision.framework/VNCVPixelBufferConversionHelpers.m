@interface VNCVPixelBufferConversionHelpers
+ (BOOL)isCVPixelBuffer:(__CVBuffer *)a3 equalToCVPixelBuffer:(__CVBuffer *)a4;
+ (__CVBuffer)createCVPixelBufferRefFromDictionaryRepresentation:(id)a3;
+ (id)createDictionaryRepresentationOfCVPixelBuffer:(__CVBuffer *)a3;
+ (id)dictionaryRepresentationClassesSet;
+ (unint64_t)computeHashForCVPixelBuffer:(__CVBuffer *)a3;
@end

@implementation VNCVPixelBufferConversionHelpers

+ (unint64_t)computeHashForCVPixelBuffer:(__CVBuffer *)a3
{
  int IsPlanar = CVPixelBufferIsPlanar(a3);
  unsigned int Width = CVPixelBufferGetWidth(a3);
  unsigned int Height = CVPixelBufferGetHeight(a3);
  OSType PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
  uint64_t v8 = [(id)CVPixelBufferGetAttributes() hash];
  CFDictionaryRef v9 = CVBufferCopyAttachments(a3, kCVAttachmentMode_ShouldNotPropagate);
  uint64_t v10 = [(__CFDictionary *)v9 hash] ^ __ROR8__(v8 ^ __ROR8__(((unint64_t)Width << 26) ^ ((unint64_t)Height << 13) ^ PixelFormatType, 51), 51);

  if (IsPlanar)
  {
    int PlaneCount = CVPixelBufferGetPlaneCount(a3);
    uint64_t v12 = PlaneCount;
    unint64_t v13 = PlaneCount ^ __ROR8__(v10, 51);
    CVPixelBufferLockBaseAddress(a3, 0);
    if (PlaneCount >= 1)
    {
      size_t v14 = 0;
      do
      {
        int BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(a3, v14);
        int HeightOfPlane = CVPixelBufferGetHeightOfPlane(a3, v14);
        BaseAddressOfPlane = CVPixelBufferGetBaseAddressOfPlane(a3, v14);
        unint64_t v13 = VNHashMemory((uint64_t)BaseAddressOfPlane, BytesPerRowOfPlane * HeightOfPlane) ^ __ROR8__(v13, 51);
        ++v14;
      }
      while (v12 != v14);
    }
  }
  else
  {
    CVPixelBufferLockBaseAddress(a3, 0);
    int BytesPerRow = CVPixelBufferGetBytesPerRow(a3);
    int v19 = CVPixelBufferGetHeight(a3);
    BaseAddress = CVPixelBufferGetBaseAddress(a3);
    unint64_t v13 = VNHashMemory((uint64_t)BaseAddress, BytesPerRow * v19) ^ __ROR8__(v10, 51);
  }
  CVPixelBufferUnlockBaseAddress(a3, 0);
  return v13;
}

+ (BOOL)isCVPixelBuffer:(__CVBuffer *)a3 equalToCVPixelBuffer:(__CVBuffer *)a4
{
  if ((!a3 || a4) && (a3 || !a4))
  {
    if (a4 == a3) {
      return 1;
    }
    int Height = CVPixelBufferGetHeight(a3);
    if (Height == CVPixelBufferGetHeight(a4))
    {
      int v7 = CVPixelBufferGetHeight(a3);
      if (v7 == CVPixelBufferGetHeight(a4))
      {
        OSType PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
        if (PixelFormatType == CVPixelBufferGetPixelFormatType(a4))
        {
          int IsPlanar = CVPixelBufferIsPlanar(a3);
          if (IsPlanar == CVPixelBufferIsPlanar(a4))
          {
            v39 = CVPixelBufferGetAttributes();
            v38 = CVPixelBufferGetAttributes();
            if ((objc_msgSend(v39, "isEqual:") & 1) == 0)
            {
              BOOL v21 = 0;
LABEL_46:

              return v21;
            }
            CFDictionaryRef v37 = CVBufferCopyAttachments(a3, kCVAttachmentMode_ShouldNotPropagate);
            CFDictionaryRef v36 = CVBufferCopyAttachments(a4, kCVAttachmentMode_ShouldNotPropagate);
            if (-[__CFDictionary isEqual:](v37, "isEqual:"))
            {
              if (IsPlanar)
              {
                int PlaneCount = CVPixelBufferGetPlaneCount(a3);
                if (PlaneCount == CVPixelBufferGetPlaneCount(a4))
                {
                  if (PlaneCount < 1)
                  {
                    char v12 = 1;
LABEL_48:
                    BOOL v21 = v12 & 1;
                    goto LABEL_45;
                  }
                  size_t v11 = 0;
                  uint64_t v35 = PlaneCount;
                  char v12 = 1;
                  while (1)
                  {
                    int BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(a3, v11);
                    int v14 = CVPixelBufferGetBytesPerRowOfPlane(a4, v11);
                    if (BytesPerRowOfPlane != v14) {
                      break;
                    }
                    int HeightOfPlane = CVPixelBufferGetHeightOfPlane(a3, v11);
                    if (HeightOfPlane != CVPixelBufferGetHeightOfPlane(a4, v11)) {
                      break;
                    }
                    int WidthOfPlane = CVPixelBufferGetWidthOfPlane(a3, v11);
                    if (WidthOfPlane != CVPixelBufferGetWidthOfPlane(a4, v11)) {
                      break;
                    }
                    if (WidthOfPlane && HeightOfPlane)
                    {
                      CVPixelBufferLockBaseAddress(a3, 0);
                      CVPixelBufferLockBaseAddress(a4, 0);
                      BaseAddressOfPlane = (char *)CVPixelBufferGetBaseAddressOfPlane(a3, v11);
                      v18 = (char *)CVPixelBufferGetBaseAddressOfPlane(a4, v11);
                      if (HeightOfPlane >= 1)
                      {
                        int v19 = v18;
                        size_t v20 = (BytesPerRowOfPlane / WidthOfPlane * WidthOfPlane);
                        do
                        {
                          if (memcmp(BaseAddressOfPlane, v19, v20)) {
                            char v12 = 0;
                          }
                          v19 += v14;
                          BaseAddressOfPlane += BytesPerRowOfPlane;
                          --HeightOfPlane;
                        }
                        while (HeightOfPlane);
                      }
                      CVPixelBufferUnlockBaseAddress(a3, 0);
                      CVPixelBufferUnlockBaseAddress(a4, 0);
                    }
                    if (++v11 == v35) {
                      goto LABEL_48;
                    }
                  }
                }
              }
              else
              {
                int BytesPerRow = CVPixelBufferGetBytesPerRow(a3);
                int v24 = CVPixelBufferGetBytesPerRow(a4);
                if (BytesPerRow == v24)
                {
                  int v25 = CVPixelBufferGetHeight(a3);
                  if (v25 == CVPixelBufferGetHeight(a4))
                  {
                    int Width = CVPixelBufferGetWidth(a3);
                    if (Width == CVPixelBufferGetWidth(a4))
                    {
                      BOOL v21 = 1;
                      if (Width && v25)
                      {
                        CVPixelBufferLockBaseAddress(a3, 0);
                        CVPixelBufferLockBaseAddress(a4, 0);
                        BaseAddress = (char *)CVPixelBufferGetBaseAddress(a3);
                        v28 = (char *)CVPixelBufferGetBaseAddress(a4);
                        if (v25 < 1)
                        {
                          int v34 = 1;
                        }
                        else
                        {
                          v29 = v28;
                          size_t v30 = (BytesPerRow / Width * Width);
                          uint64_t v31 = v24;
                          uint64_t v32 = BytesPerRow;
                          char v33 = 1;
                          do
                          {
                            if (memcmp(BaseAddress, v29, v30)) {
                              char v33 = 0;
                            }
                            v29 += v31;
                            BaseAddress += v32;
                            --v25;
                          }
                          while (v25);
                          int v34 = v33 & 1;
                        }
                        CVPixelBufferUnlockBaseAddress(a3, 0);
                        CVPixelBufferUnlockBaseAddress(a4, 0);
                        BOOL v21 = v34 != 0;
                      }
                      goto LABEL_45;
                    }
                  }
                }
              }
            }
            BOOL v21 = 0;
LABEL_45:

            goto LABEL_46;
          }
        }
      }
    }
  }
  return 0;
}

+ (__CVBuffer)createCVPixelBufferRefFromDictionaryRepresentation:(id)a3
{
  id v3 = a3;
  id v38 = v3;
  v4 = [v3 objectForKey:@"vnpbo_width"];
  int v5 = [v4 intValue];

  v6 = [v3 objectForKey:@"vnpbo_height"];
  int v7 = [v6 intValue];

  uint64_t v8 = [v3 objectForKey:@"vnpbo_pixelFormat"];
  OSType v9 = [v8 intValue];

  CFDictionaryRef v10 = [v3 objectForKey:@"vnpbo_attribs"];
  CFDictionaryRef v11 = [v3 objectForKey:@"vnpbo_attach"];
  size_t v12 = v5;
  uint64_t v13 = v7;
  CVBufferRef buffer = 0;
  if (VNCVPixelBufferCreateUsingIOSurface(v12, v7, v9, v10, &buffer))
  {
    int v14 = 0;
  }
  else
  {
    if (v11) {
      CVBufferSetAttachments(buffer, v11, kCVAttachmentMode_ShouldNotPropagate);
    }
    CFDictionaryRef v36 = v11;
    if (CVPixelBufferIsPlanar(buffer))
    {
      size_t PlaneCount = CVPixelBufferGetPlaneCount(buffer);
      CVPixelBufferLockBaseAddress(buffer, 0);
      if (PlaneCount)
      {
        for (size_t i = 0; i != PlaneCount; ++i)
        {
          v16 = [NSString stringWithFormat:@"%@_%zu", @"vnpbo_bytes", i];
          v17 = [v3 objectForKey:v16];

          v18 = [NSString stringWithFormat:@"%@_%zu", @"vnpbo_bpr", i];
          int v19 = [v3 objectForKey:v18];
          LODWORD(v20) = [v19 intValue];

          size_t HeightOfPlane = CVPixelBufferGetHeightOfPlane(buffer, i);
          size_t BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(buffer, i);
          BaseAddressOfPlane = (char *)CVPixelBufferGetBaseAddressOfPlane(buffer, i);
          id v24 = v17;
          int v25 = (char *)[v24 bytes];
          uint64_t v26 = (int)v20;
          if (BytesPerRowOfPlane == (int)v20)
          {
            memcpy(BaseAddressOfPlane, v25, HeightOfPlane * (int)v20);
          }
          else
          {
            if ((int)v20 >= BytesPerRowOfPlane) {
              size_t v20 = BytesPerRowOfPlane;
            }
            else {
              size_t v20 = (int)v20;
            }
            for (; HeightOfPlane; --HeightOfPlane)
            {
              memcpy(BaseAddressOfPlane, v25, v20);
              v25 += v26;
              BaseAddressOfPlane += BytesPerRowOfPlane;
            }
          }

          id v3 = v38;
        }
      }
      CVPixelBufferUnlockBaseAddress(buffer, 0);
    }
    else
    {
      v27 = [v3 objectForKey:@"vnpbo_bytes"];
      v28 = [v3 objectForKey:@"vnpbo_bpr"];
      int v29 = [v28 intValue];

      CVPixelBufferLockBaseAddress(buffer, 0);
      size_t BytesPerRow = CVPixelBufferGetBytesPerRow(buffer);
      BaseAddress = (char *)CVPixelBufferGetBaseAddress(buffer);
      id v32 = v27;
      char v33 = (char *)[v32 bytes];
      if (BytesPerRow == v29)
      {
        memcpy(BaseAddress, v33, v29 * (uint64_t)v7);
      }
      else
      {
        if (v29 >= BytesPerRow) {
          size_t v34 = BytesPerRow;
        }
        else {
          size_t v34 = v29;
        }
        if (v7)
        {
          do
          {
            memcpy(BaseAddress, v33, v34);
            v33 += v29;
            BaseAddress += BytesPerRow;
            --v13;
          }
          while (v13);
        }
      }
      CVPixelBufferUnlockBaseAddress(buffer, 0);

      id v3 = v38;
    }
    int v14 = buffer;
    CFDictionaryRef v11 = v36;
  }

  return v14;
}

+ (id)createDictionaryRepresentationOfCVPixelBuffer:(__CVBuffer *)a3
{
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  size_t Width = CVPixelBufferGetWidth(a3);
  size_t Height = CVPixelBufferGetHeight(a3);
  uint64_t PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
  id v24 = CVPixelBufferGetAttributes();
  CFDictionaryRef v23 = CVBufferCopyAttachments(a3, kCVAttachmentMode_ShouldNotPropagate);
  uint64_t v8 = [NSNumber numberWithInt:Width];
  [v4 setObject:v8 forKey:@"vnpbo_width"];

  OSType v9 = [NSNumber numberWithInt:Height];
  [v4 setObject:v9 forKey:@"vnpbo_height"];

  CFDictionaryRef v10 = [NSNumber numberWithInt:PixelFormatType];
  [v4 setObject:v10 forKey:@"vnpbo_pixelFormat"];

  [v4 setObject:v24 forKey:@"vnpbo_attribs"];
  [v4 setObject:v23 forKey:@"vnpbo_attach"];
  if (CVPixelBufferIsPlanar(a3))
  {
    size_t PlaneCount = CVPixelBufferGetPlaneCount(a3);
    if (PlaneCount)
    {
      for (size_t i = 0; i != PlaneCount; ++i)
      {
        int HeightOfPlane = CVPixelBufferGetHeightOfPlane(a3, i);
        size_t BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(a3, i);
        CVPixelBufferLockBaseAddress(a3, 0);
        v15 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytes:length:", CVPixelBufferGetBaseAddressOfPlane(a3, i), HeightOfPlane * (int)BytesPerRowOfPlane);
        v16 = [NSNumber numberWithInt:BytesPerRowOfPlane];
        v17 = [NSString stringWithFormat:@"%@_%zu", @"vnpbo_bpr", i];
        [v4 setObject:v16 forKey:v17];

        v18 = [NSString stringWithFormat:@"%@_%zu", @"vnpbo_bytes", i];
        [v4 setObject:v15 forKey:v18];

        CVPixelBufferUnlockBaseAddress(a3, 0);
      }
    }
  }
  else
  {
    size_t BytesPerRow = CVPixelBufferGetBytesPerRow(a3);
    CVPixelBufferLockBaseAddress(a3, 0);
    size_t v20 = [MEMORY[0x1E4F1C9B8] dataWithBytes:CVPixelBufferGetBaseAddress(a3) length:(int)Height * (int)BytesPerRow];
    BOOL v21 = [NSNumber numberWithInt:BytesPerRow];
    [v4 setObject:v21 forKey:@"vnpbo_bpr"];

    [v4 setObject:v20 forKey:@"vnpbo_bytes"];
    CVPixelBufferUnlockBaseAddress(a3, 0);
  }

  return v4;
}

+ (id)dictionaryRepresentationClassesSet
{
  if (+[VNCVPixelBufferConversionHelpers dictionaryRepresentationClassesSet]::onceToken != -1) {
    dispatch_once(&+[VNCVPixelBufferConversionHelpers dictionaryRepresentationClassesSet]::onceToken, &__block_literal_global_18217);
  }
  v2 = (void *)+[VNCVPixelBufferConversionHelpers dictionaryRepresentationClassesSet]::classesSet;

  return v2;
}

uint64_t __70__VNCVPixelBufferConversionHelpers_dictionaryRepresentationClassesSet__block_invoke()
{
  id v0 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  +[VNCVPixelBufferConversionHelpers dictionaryRepresentationClassesSet]::classesSet = objc_msgSend(v0, "initWithObjects:", v1, v2, v3, objc_opt_class(), 0);

  return MEMORY[0x1F41817F8]();
}

@end
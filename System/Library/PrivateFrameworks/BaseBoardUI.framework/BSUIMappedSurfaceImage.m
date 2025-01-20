@interface BSUIMappedSurfaceImage
+ (BOOL)writeSurfaceImage:(int)a3 toFileDescriptor:;
+ (id)mappedSurfaceImageFromPath:(int)a3 loadEagerly:;
@end

@implementation BSUIMappedSurfaceImage

+ (BOOL)writeSurfaceImage:(int)a3 toFileDescriptor:
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  v43 = v4;
  self;
  v5 = (__IOSurface *)[v4 ioSurface];
  v6 = v5;
  if (v5)
  {
    IOSurfaceLock(v5, 1u, 0);
    size_t PlaneCount = IOSurfaceGetPlaneCount(v6);
    BaseAddress = IOSurfaceGetBaseAddress(v6);
    BOOL v8 = 0;
    if (BaseAddress)
    {
      uint64_t v41 = (uint64_t)BaseAddress;
      if (!HIDWORD(PlaneCount))
      {
        size_t AllocSize = IOSurfaceGetAllocSize(v6);
        if (__writeDataToFileDescriptor(a3, v41, AllocSize))
        {
          CFDictionaryRef v10 = IOSurfaceCopyAllValues(v6);
          CFDictionaryRef v11 = v10;
          if (!v10)
          {
            unint64_t Length = 0;
            goto LABEL_18;
          }
          if (CFDictionaryGetCount(v10) >= 1
            && (CFDataRef Data = CFPropertyListCreateData((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v11, kCFPropertyListBinaryFormat_v1_0, 0, 0), (v13 = Data) != 0))
          {
            unint64_t Length = CFDataGetLength(Data);
            if (HIDWORD(Length))
            {
              BOOL v15 = 0;
            }
            else
            {
              BytePtr = CFDataGetBytePtr(v13);
              BOOL v15 = __writeDataToFileDescriptor(a3, (uint64_t)BytePtr, Length);
            }
            CFRelease(v13);
          }
          else
          {
            unint64_t Length = 0;
            BOOL v15 = 1;
          }
          CFRelease(v11);
          if (v15)
          {
LABEL_18:
            size_t Width = IOSurfaceGetWidth(v6);
            size_t v39 = AllocSize;
            if (Width != IOSurfaceGetWidthOfPlane(v6, 0))
            {
              v35 = [MEMORY[0x1E4F28B00] currentHandler];
              v36 = [NSString stringWithUTF8String:"+[BSUIMappedSurfaceImage writeSurfaceImage:toFileDescriptor:]"];
              [v35 handleFailureInFunction:v36 file:@"BSUIMappedSurfaceImage.m" lineNumber:99 description:@"width of surface not the same as width of first plane"];
            }
            size_t Height = IOSurfaceGetHeight(v6);
            if (Height != IOSurfaceGetHeightOfPlane(v6, 0))
            {
              v37 = [MEMORY[0x1E4F28B00] currentHandler];
              v38 = [NSString stringWithUTF8String:"+[BSUIMappedSurfaceImage writeSurfaceImage:toFileDescriptor:]"];
              [v37 handleFailureInFunction:v38 file:@"BSUIMappedSurfaceImage.m" lineNumber:100 description:@"height of surface not the same as height of first plane"];
            }
            size_t v20 = 0;
            while (1)
            {
              size_t WidthOfPlane = IOSurfaceGetWidthOfPlane(v6, v20);
              size_t HeightOfPlane = IOSurfaceGetHeightOfPlane(v6, v20);
              size_t BytesPerElementOfPlane = IOSurfaceGetBytesPerElementOfPlane(v6, v20);
              size_t BytesPerRowOfPlane = IOSurfaceGetBytesPerRowOfPlane(v6, v20);
              BaseAddressOfPlane = IOSurfaceGetBaseAddressOfPlane(v6, v20);
              BOOL v8 = 0;
              if (HIDWORD(WidthOfPlane)
                || HIDWORD(HeightOfPlane)
                || HIDWORD(BytesPerElementOfPlane)
                || HIDWORD(BytesPerRowOfPlane)
                || ((unint64_t)BaseAddressOfPlane - v41) >> 32)
              {
                goto LABEL_46;
              }
              unint64_t v26 = 0;
              *(_DWORD *)buf = WidthOfPlane;
              v45 = (const char *)__PAIR64__(BytesPerElementOfPlane, HeightOfPlane);
              LODWORD(v46) = BytesPerRowOfPlane;
              HIDWORD(v46) = BaseAddressOfPlane - v41;
              do
              {
                ssize_t v27 = write(a3, &buf[v26], 20 - v26);
                if (v27 < 0) {
                  break;
                }
                v26 += v27 & ~(v27 >> 63);
              }
              while (v26 <= 0x13);
              if ((v27 & 0x8000000000000000) == 0 && ++v20 < PlaneCount) {
                continue;
              }
              if ((v27 & 0x8000000000000000) == 0)
              {
                *(_DWORD *)buf = IOSurfaceGetPixelFormat(v6);
                v45 = (const char *)__PAIR64__(Length, PlaneCount);
                [v43 scale];
                unint64_t v46 = bswap64(v28);
                unint64_t v29 = 0;
                int v47 = [v43 imageOrientation];
                int v48 = -1413377484;
                do
                {
                  ssize_t v30 = write(a3, &buf[v29], 28 - v29);
                  ssize_t v31 = v30;
                  if (v30 < 0) {
                    break;
                  }
                  v29 += v30 & ~(v30 >> 63);
                }
                while (v29 <= 0x1B);
                if ((v30 & 0x8000000000000000) == 0)
                {
                  if (PlaneCount <= 1) {
                    uint64_t v32 = 1;
                  }
                  else {
                    uint64_t v32 = PlaneCount;
                  }
                  off_t v33 = lseek(a3, 0, 2);
                  if (v33 == 0x7FFFFFFFFFFFFFFFLL) {
                    __assert_rtn("+[BSUIMappedSurfaceImage writeSurfaceImage:toFileDescriptor:]", "BSUIMappedSurfaceImage.m", 140, "end < LONG_MAX");
                  }
                  BOOL v8 = v33 == v39 + 20 * v32 + Length + 28 && v31 >= 0;
                  goto LABEL_46;
                }
              }
              break;
            }
          }
        }
        BOOL v8 = 0;
      }
    }
LABEL_46:
    IOSurfaceUnlock(v6, 1u, 0);
    BOOL v17 = v8;
    id v4 = v43;
    goto LABEL_47;
  }
  v16 = BSLogCommon();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    v45 = "+[BSUIMappedSurfaceImage writeSurfaceImage:toFileDescriptor:]";
    _os_log_error_impl(&dword_1A2B0C000, v16, OS_LOG_TYPE_ERROR, " %s : can not persist image that is not backed by an IOSurface", buf, 0xCu);
  }

  BOOL v17 = 0;
LABEL_47:

  return v17;
}

+ (id)mappedSurfaceImageFromPath:(int)a3 loadEagerly:
{
  v64[8] = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  v5 = (objc_class *)self;
  CFDataRef MappedDataFromPath = (const __CFData *)CPBitmapCreateMappedDataFromPath();
  CFDataRef v7 = MappedDataFromPath;
  if (!MappedDataFromPath)
  {
    v16 = 0;
    goto LABEL_22;
  }
  BytePtr = (UInt8 *)CFDataGetBytePtr(MappedDataFromPath);
  size_t Length = CFDataGetLength(v7);
  if (a3) {
    madvise(BytePtr, Length, 3);
  }
  if (!BytePtr || Length < 0x30)
  {
    BOOL v15 = BSLogCommon();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v58 = "+[BSUIMappedSurfaceImage mappedSurfaceImageFromPath:loadEagerly:]";
      _os_log_error_impl(&dword_1A2B0C000, v15, OS_LOG_TYPE_ERROR, " %s : file too small to describe a surface", buf, 0xCu);
    }
    goto LABEL_20;
  }
  CFDictionaryRef v10 = &BytePtr[Length];
  if (*(_DWORD *)&BytePtr[Length - 4] != -1413377484)
  {
    BOOL v15 = BSLogCommon();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v58 = "+[BSUIMappedSurfaceImage mappedSurfaceImageFromPath:loadEagerly:]";
      _os_log_error_impl(&dword_1A2B0C000, v15, OS_LOG_TYPE_ERROR, " %s : format of file not recognized", buf, 0xCu);
    }
    goto LABEL_20;
  }
  uint64_t v12 = *((unsigned int *)v10 - 6);
  uint64_t v11 = *((unsigned int *)v10 - 5);
  if (v12 <= 1) {
    unsigned int v13 = 1;
  }
  else {
    unsigned int v13 = *((_DWORD *)v10 - 6);
  }
  uint64_t v14 = 20 * v13 + 28;
  if (Length >= v14 + v11)
  {
    unsigned int v46 = *((_DWORD *)v10 - 7);
    unint64_t v44 = *((void *)v10 - 2);
    uint64_t v45 = *((unsigned int *)v10 - 2);
    size_t v18 = Length - v14;
    uint64_t v54 = 0;
    uint64_t v55 = 0;
    unsigned int v56 = 0;
    v53[0] = MEMORY[0x1E4F143A8];
    v53[1] = 3221225472;
    v53[2] = __65__BSUIMappedSurfaceImage_mappedSurfaceImageFromPath_loadEagerly___block_invoke;
    v53[3] = &__block_descriptor_48_e40_v20__0___BSUISurfacePlaneInfo_IIIII_8I16l;
    v53[4] = BytePtr;
    v53[5] = v18;
    v51 = (void (**)(void, void, void))MEMORY[0x1A623AF30](v53);
    ((void (**)(void, uint64_t *, void))v51)[2](v51, &v54, 0);
    unint64_t v19 = v18 - v11;
    if (v19 < (HIDWORD(v54) * HIDWORD(v55)))
    {
      size_t v20 = BSLogCommon();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        v58 = "+[BSUIMappedSurfaceImage mappedSurfaceImageFromPath:loadEagerly:]";
        __int16 v59 = 1024;
        LODWORD(v60[0]) = HIDWORD(v55);
        WORD2(v60[0]) = 1024;
        *(_DWORD *)((char *)v60 + 6) = HIDWORD(v54);
        _os_log_error_impl(&dword_1A2B0C000, v20, OS_LOG_TYPE_ERROR, " %s : file too small to describe surface with bytesPerRow=%u and height=%u", buf, 0x18u);
      }

      goto LABEL_49;
    }
    if (v12)
    {
      uint64_t v40 = HIDWORD(v54);
      uint64_t v41 = v54;
      v52[0] = MEMORY[0x1E4F143A8];
      v52[1] = 3221225472;
      v52[2] = __65__BSUIMappedSurfaceImage_mappedSurfaceImageFromPath_loadEagerly___block_invoke_13;
      v52[3] = &__block_descriptor_40_e51___NSDictionary_16__0___BSUISurfacePlaneInfo_IIIII_8l;
      unint64_t v42 = v19;
      v52[4] = v19;
      CFDictionaryRef v21 = (const __CFDictionary *)MEMORY[0x1A623AF30](v52);
      uint64_t v49 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v12];
      v22 = (*((void (**)(const __CFDictionary *, uint64_t *))v21 + 2))(v21, &v54);
      [v49 bs_safeAddObject:v22];

      if (v12 >= 2)
      {
        uint64_t v23 = 1;
        do
        {
          ((void (**)(void, uint64_t *, uint64_t))v51)[2](v51, &v54, v23);
          v24 = (*((void (**)(const __CFDictionary *, uint64_t *))v21 + 2))(v21, &v54);
          [v49 bs_safeAddObject:v24];

          uint64_t v23 = (v23 + 1);
        }
        while (v12 != v23);
      }
      if ([v49 count] == v12)
      {
        v61[0] = *MEMORY[0x1E4F2F150];
        v62[0] = [NSNumber numberWithUnsignedInt:v46];
        v61[1] = *MEMORY[0x1E4F2F040];
        int v47 = (void *)v62[0];
        uint64_t v25 = [NSNumber numberWithUnsignedLong:BytePtr];
        v62[1] = v25;
        v61[2] = *MEMORY[0x1E4F2EFB8];
        unint64_t v26 = [NSNumber numberWithUnsignedLong:v42];
        v62[2] = v26;
        v61[3] = *MEMORY[0x1E4F2F2C0];
        ssize_t v27 = [NSNumber numberWithUnsignedLong:v41];
        unint64_t v28 = (void *)v25;
        v62[3] = v27;
        v61[4] = *MEMORY[0x1E4F2F0E8];
        unint64_t v29 = [NSNumber numberWithUnsignedLong:v40];
        v61[5] = *MEMORY[0x1E4F2F238];
        v62[4] = v29;
        v62[5] = v49;
        CFDictionaryRef v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v62 forKeys:v61 count:6];

        IOSurfaceRef v31 = IOSurfaceCreate(v30);
        if (!v31)
        {
          uint64_t v32 = BSLogCommon();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            v58 = "+[BSUIMappedSurfaceImage mappedSurfaceImageFromPath:loadEagerly:]";
            __int16 v59 = 2114;
            v60[0] = v30;
            _os_log_error_impl(&dword_1A2B0C000, v32, OS_LOG_TYPE_ERROR, " %s : failed to create surface with properties -> %{public}@", buf, 0x16u);
          }
        }
      }
      else
      {
        IOSurfaceRef v31 = 0;
      }
      v38 = v49;
    }
    else
    {
      v63[0] = *MEMORY[0x1E4F2F150];
      v64[0] = [NSNumber numberWithUnsignedInt:v46];
      v63[1] = *MEMORY[0x1E4F2F040];
      v43 = (void *)v64[0];
      v50 = [NSNumber numberWithUnsignedLong:BytePtr];
      v64[1] = v50;
      v63[2] = *MEMORY[0x1E4F2EFB8];
      int v48 = [NSNumber numberWithUnsignedLong:v19];
      v64[2] = v48;
      v63[3] = *MEMORY[0x1E4F2F138];
      off_t v33 = [NSNumber numberWithUnsignedInt:v56];
      v64[3] = v33;
      v63[4] = *MEMORY[0x1E4F2F2C0];
      v34 = [NSNumber numberWithUnsignedInt:v54];
      v64[4] = v34;
      v63[5] = *MEMORY[0x1E4F2F0E8];
      v35 = [NSNumber numberWithUnsignedInt:HIDWORD(v54)];
      v64[5] = v35;
      v63[6] = *MEMORY[0x1E4F2EFD8];
      v36 = [NSNumber numberWithUnsignedInt:v55];
      v64[6] = v36;
      v63[7] = *MEMORY[0x1E4F2EFE0];
      v37 = [NSNumber numberWithUnsignedInt:HIDWORD(v55)];
      v64[7] = v37;
      CFDictionaryRef v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v64 forKeys:v63 count:8];

      IOSurfaceRef v31 = IOSurfaceCreate(v21);
      if (v31) {
        goto LABEL_45;
      }
      v38 = BSLogCommon();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v58 = "+[BSUIMappedSurfaceImage mappedSurfaceImageFromPath:loadEagerly:]";
        __int16 v59 = 2114;
        v60[0] = v21;
        _os_log_error_impl(&dword_1A2B0C000, v38, OS_LOG_TYPE_ERROR, " %s : failed to create surface with properties -> %{public}@", buf, 0x16u);
      }
    }

LABEL_45:
    if (v31)
    {
      uint64_t v39 = [[v5 alloc] _initWithIOSurface:v31 scale:v45 orientation:COERCE_DOUBLE(bswap64(v44))];
      v16 = (void *)v39;
      if (v39) {
        objc_storeStrong((id *)(v39 + 144), v7);
      }
      CFRelease(v31);
      goto LABEL_50;
    }
LABEL_49:
    v16 = 0;
LABEL_50:

    goto LABEL_21;
  }
  BOOL v15 = BSLogCommon();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v58 = "+[BSUIMappedSurfaceImage mappedSurfaceImageFromPath:loadEagerly:]";
    __int16 v59 = 1024;
    LODWORD(v60[0]) = v12;
    _os_log_error_impl(&dword_1A2B0C000, v15, OS_LOG_TYPE_ERROR, " %s : file too small to describe a surface with %u planes", buf, 0x12u);
  }
LABEL_20:

  v16 = 0;
LABEL_21:
  CFRelease(v7);
LABEL_22:

  return v16;
}

__n128 __65__BSUIMappedSurfaceImage_mappedSurfaceImageFromPath_loadEagerly___block_invoke(uint64_t a1, __n128 *a2, unsigned int a3)
{
  v3 = (__n128 *)(*(void *)(a1 + 32) + *(void *)(a1 + 40) + 20 * a3);
  __n128 result = *v3;
  a2[1].n128_u32[0] = v3[1].n128_u32[0];
  *a2 = result;
  return result;
}

id __65__BSUIMappedSurfaceImage_mappedSurfaceImageFromPath_loadEagerly___block_invoke_13(uint64_t a1, unsigned int *a2)
{
  v24[6] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = a2[1] * a2[3];
  if (*(void *)(a1 + 32) >= (unint64_t)a2[4] + v3)
  {
    v23[0] = *MEMORY[0x1E4F2F258];
    id v4 = [NSNumber numberWithUnsignedInt:*a2];
    v24[0] = v4;
    v23[1] = *MEMORY[0x1E4F2F220];
    v6 = [NSNumber numberWithUnsignedInt:a2[1]];
    v24[1] = v6;
    v23[2] = *MEMORY[0x1E4F2F170];
    CFDataRef v7 = [NSNumber numberWithUnsignedInt:a2[2]];
    v24[2] = v7;
    v23[3] = *MEMORY[0x1E4F2F178];
    BOOL v8 = [NSNumber numberWithUnsignedInt:a2[3]];
    v24[3] = v8;
    v23[4] = *MEMORY[0x1E4F2F240];
    v9 = [NSNumber numberWithUnsignedInt:a2[4]];
    v24[4] = v9;
    v23[5] = *MEMORY[0x1E4F2F248];
    CFDictionaryRef v10 = [NSNumber numberWithUnsignedLong:v3];
    v24[5] = v10;
    v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:6];
  }
  else
  {
    id v4 = BSLogCommon();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      unsigned int v13 = a2[3];
      unsigned int v12 = a2[4];
      unsigned int v14 = a2[1];
      int v15 = 136315906;
      v16 = "+[BSUIMappedSurfaceImage mappedSurfaceImageFromPath:loadEagerly:]_block_invoke";
      __int16 v17 = 1024;
      unsigned int v18 = v12;
      __int16 v19 = 1024;
      unsigned int v20 = v13;
      __int16 v21 = 1024;
      unsigned int v22 = v14;
      _os_log_error_impl(&dword_1A2B0C000, v4, OS_LOG_TYPE_ERROR, " %s : file too small to describe plane with offset=%u bytesPerRow=%u and height=%u", (uint8_t *)&v15, 0x1Eu);
    }
    v5 = 0;
  }

  return v5;
}

- (void).cxx_destruct
{
}

@end
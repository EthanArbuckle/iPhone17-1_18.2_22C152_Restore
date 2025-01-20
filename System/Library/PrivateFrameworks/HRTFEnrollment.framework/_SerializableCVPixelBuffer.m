@interface _SerializableCVPixelBuffer
+ (BOOL)supportsSecureCoding;
- (_SerializableCVPixelBuffer)initWithCVPixelBufferRef:(__CVBuffer *)a3;
- (_SerializableCVPixelBuffer)initWithCoder:(id)a3;
- (__CVBuffer)pixelBuffer;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _SerializableCVPixelBuffer

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_SerializableCVPixelBuffer)initWithCVPixelBufferRef:(__CVBuffer *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)_SerializableCVPixelBuffer;
  v4 = [(_SerializableCVPixelBuffer *)&v7 init];
  v5 = v4;
  if (v4)
  {
    v4->_pixelBuffer = a3;
    CVBufferRetain(a3);
  }
  return v5;
}

- (void)dealloc
{
  pixelBuffer = self->_pixelBuffer;
  if (pixelBuffer)
  {
    CVBufferRelease(pixelBuffer);
    self->_pixelBuffer = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)_SerializableCVPixelBuffer;
  [(_SerializableCVPixelBuffer *)&v4 dealloc];
}

- (void)encodeWithCoder:(id)a3
{
  v42[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  CVPixelBufferLockBaseAddress(self->_pixelBuffer, 1uLL);
  int64_t PlaneCount = CVPixelBufferGetPlaneCount(self->_pixelBuffer);
  v6 = [NSNumber numberWithUnsignedInt:CVPixelBufferGetPixelFormatType(self->_pixelBuffer)];
  [v4 encodeObject:v6 forKey:@"PixelFormat"];

  objc_super v7 = [NSNumber numberWithInteger:PlaneCount];
  [v4 encodeObject:v7 forKey:@"PlaneCount"];

  if (PlaneCount)
  {
    v37 = v4;
    id v8 = objc_alloc_init(MEMORY[0x263EFF980]);
    id v9 = objc_alloc_init(MEMORY[0x263EFF980]);
    id v38 = objc_alloc_init(MEMORY[0x263EFF980]);
    id v10 = objc_alloc_init(MEMORY[0x263EFF980]);
    v11 = [NSNumber numberWithUnsignedLong:CVPixelBufferGetWidth(self->_pixelBuffer)];
    [v8 addObject:v11];

    v12 = [NSNumber numberWithUnsignedLong:CVPixelBufferGetHeight(self->_pixelBuffer)];
    v13 = v9;
    [v9 addObject:v12];

    if (PlaneCount >= 1)
    {
      size_t v14 = 0;
      do
      {
        int64_t v15 = PlaneCount;
        v16 = objc_msgSend(NSNumber, "numberWithUnsignedLong:", CVPixelBufferGetWidthOfPlane(self->_pixelBuffer, v14));
        [v8 addObject:v16];

        size_t HeightOfPlane = CVPixelBufferGetHeightOfPlane(self->_pixelBuffer, v14);
        id v18 = v8;
        size_t BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(self->_pixelBuffer, v14);
        v20 = [NSNumber numberWithUnsignedLong:HeightOfPlane];
        [v13 addObject:v20];

        v21 = [NSNumber numberWithUnsignedLong:BytesPerRowOfPlane];
        [v38 addObject:v21];

        size_t v22 = BytesPerRowOfPlane * HeightOfPlane;
        id v8 = v18;
        id v23 = objc_alloc(MEMORY[0x263EFF8F8]);
        BaseAddressOfPlane = CVPixelBufferGetBaseAddressOfPlane(self->_pixelBuffer, v14);
        v25 = v23;
        int64_t PlaneCount = v15;
        v26 = (void *)[v25 initWithBytes:BaseAddressOfPlane length:v22];
        [v10 addObject:v26];

        ++v14;
      }
      while (v15 != v14);
    }
    id v4 = v37;
    [v37 encodeObject:v8 forKey:@"Width"];
    [v37 encodeObject:v13 forKey:@"Height"];
    [v37 encodeObject:v38 forKey:@"BytesPerRow"];
    [v37 encodeObject:v10 forKey:@"PixelData"];
  }
  else
  {
    v27 = [NSNumber numberWithUnsignedLong:CVPixelBufferGetWidth(self->_pixelBuffer)];
    v42[0] = v27;
    v28 = [MEMORY[0x263EFF8C0] arrayWithObjects:v42 count:1];
    [v4 encodeObject:v28 forKey:@"Width"];

    v29 = [NSNumber numberWithUnsignedLong:CVPixelBufferGetHeight(self->_pixelBuffer)];
    v41 = v29;
    v30 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v41 count:1];
    [v4 encodeObject:v30 forKey:@"Height"];

    v31 = [NSNumber numberWithUnsignedLong:CVPixelBufferGetBytesPerRow(self->_pixelBuffer)];
    v40 = v31;
    v32 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v40 count:1];
    [v4 encodeObject:v32 forKey:@"BytesPerRow"];

    id v33 = objc_alloc(MEMORY[0x263EFF8F8]);
    BaseAddress = CVPixelBufferGetBaseAddress(self->_pixelBuffer);
    v35 = (void *)[v33 initWithBytes:BaseAddress length:CVPixelBufferGetDataSize(self->_pixelBuffer)];
    v39 = v35;
    v36 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v39 count:1];
    [v4 encodeObject:v36 forKey:@"PixelData"];
  }
  CVPixelBufferUnlockBaseAddress(self->_pixelBuffer, 1uLL);
}

- (_SerializableCVPixelBuffer)initWithCoder:(id)a3
{
  v81[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([v4 containsValueForKey:@"PlaneCount"]
    && [v4 containsValueForKey:@"PixelFormat"]
    && [v4 containsValueForKey:@"Width"]
    && [v4 containsValueForKey:@"Height"]
    && [v4 containsValueForKey:@"BytesPerRow"]
    && [v4 containsValueForKey:@"PixelData"])
  {
    v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PlaneCount"];
    uint64_t v6 = [v5 integerValue];
    objc_super v7 = (void *)MEMORY[0x263EFFA08];
    v81[0] = objc_opt_class();
    v81[1] = objc_opt_class();
    id v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v81 count:2];
    uint64_t v9 = [v7 setWithArray:v8];

    id v10 = (void *)MEMORY[0x263EFFA08];
    v80[0] = objc_opt_class();
    v80[1] = objc_opt_class();
    v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v80 count:2];
    uint64_t v12 = [v10 setWithArray:v11];

    v71 = (void *)v12;
    v72 = (void *)v9;
    if (v6)
    {
      int64_t v13 = v6;
      v69 = self;
      id v70 = v5;
      size_t v14 = [v4 decodeObjectOfClasses:v9 forKey:@"Width"];
      int64_t v15 = [v4 decodeObjectOfClasses:v9 forKey:@"Height"];
      v16 = [v4 decodeObjectOfClasses:v9 forKey:@"BytesPerRow"];
      v17 = [v4 decodeObjectOfClasses:v12 forKey:@"PixelData"];
      id v18 = [(size_t *)v14 objectAtIndexedSubscript:0];
      size_t v67 = [v18 integerValue];

      v19 = [v15 objectAtIndexedSubscript:0];
      size_t v66 = [v19 integerValue];

      v68 = &v66;
      unint64_t v20 = (8 * v13 + 15) & 0xFFFFFFFFFFFFFFF0;
      v21 = (void **)((char *)&v66 - v20);
      if ((unint64_t)(8 * v13) >= 0x200) {
        size_t v22 = 512;
      }
      else {
        size_t v22 = 8 * v13;
      }
      bzero((char *)&v66 - v20, v22);
      planeWidth = (size_t *)((char *)&v66 - v20);
      planeHeight = (size_t *)((char *)&v66 - v20);
      planeBytesPerRow = (size_t *)((char *)&v66 - v20);
      if (v13 >= 1)
      {
        id v23 = 0;
        for (i = (void *)v13; i != v23; int64_t v13 = (int64_t)i)
        {
          v24 = objc_msgSend(v17, "objectAtIndexedSubscript:", v23, v66);
          v25 = malloc_type_malloc([v24 length], 0xF231FE04uLL);
          v21[(void)v23] = v25;

          v26 = [v17 objectAtIndexedSubscript:v23];
          [v17 objectAtIndexedSubscript:v23];
          v27 = v21;
          v28 = v17;
          v29 = v16;
          v30 = v15;
          v32 = v31 = v14;
          objc_msgSend(v26, "getBytes:length:", v25, objc_msgSend(v32, "length"));

          size_t v14 = v31;
          int64_t v15 = v30;
          v16 = v29;
          v17 = v28;
          v21 = v27;

          id v33 = [(size_t *)v14 objectAtIndexedSubscript:(char *)v23 + 1];
          uint64_t v34 = [v33 integerValue];
          planeWidth[(void)v23] = v34;

          v35 = [v15 objectAtIndexedSubscript:(char *)v23 + 1];
          uint64_t v36 = [v35 integerValue];
          planeHeight[(void)v23] = v36;

          v37 = [v16 objectAtIndexedSubscript:v23];
          uint64_t v38 = [v37 integerValue];
          planeBytesPerRow[(void)v23] = v38;

          id v23 = (char *)v23 + 1;
        }
      }
      CVPixelBufferRef pixelBufferOut = 0;
      v39 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PixelFormat"];

      OSType v40 = [v39 integerValue];
      CVReturn v41 = CVPixelBufferCreateWithPlanarBytes((CFAllocatorRef)*MEMORY[0x263EFFB08], v67, v66, v40, 0, 0, v13, v21, planeWidth, planeHeight, planeBytesPerRow, (CVPixelBufferReleasePlanarBytesCallback)__planarDeallocateHelper, 0, 0, &pixelBufferOut);
      if (v41)
      {
        int v42 = v41;
        i = v39;
        v43 = v16;
        v44 = HRTFEnrollmentLog;
        BOOL v45 = os_log_type_enabled((os_log_t)HRTFEnrollmentLog, OS_LOG_TYPE_ERROR);
        self = v69;
        if (v45) {
          -[_SerializableCVPixelBuffer initWithCoder:](v42, v44);
        }
        v46 = 0;
        v47 = v71;
        v48 = v72;
        v16 = v43;
        v39 = i;
      }
      else
      {
        v77.receiver = v69;
        v77.super_class = (Class)_SerializableCVPixelBuffer;
        v64 = [(_SerializableCVPixelBuffer *)&v77 init];
        if (v64) {
          v64->_pixelBuffer = pixelBufferOut;
        }
        self = v64;
        v46 = self;
        v47 = v71;
        v48 = v72;
      }
    }
    else
    {
      v50 = [v4 decodeObjectOfClasses:v12 forKey:@"PixelData"];
      v51 = [v50 objectAtIndexedSubscript:0];

      planeWidth = (size_t *)malloc_type_malloc([v51 length], 0x7227F3ADuLL);
      planeBytesPerRow = v51;
      memcpy(planeWidth, (const void *)[(size_t *)planeBytesPerRow bytes], [(size_t *)planeBytesPerRow length]);
      CVPixelBufferRef pixelBufferOut = 0;
      v52 = [v4 decodeObjectOfClasses:v9 forKey:@"Width"];
      v53 = [v4 decodeObjectOfClasses:v9 forKey:@"Height"];
      v54 = [v4 decodeObjectOfClasses:v9 forKey:@"BytesPerRow"];
      v55 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PixelFormat"];

      i = v55;
      planeHeight = (size_t *)[v55 integerValue];
      CFAllocatorRef v56 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
      id v70 = v52;
      v57 = [v52 objectAtIndexedSubscript:0];
      size_t v58 = [v57 integerValue];
      v69 = v53;
      v59 = [(_SerializableCVPixelBuffer *)v53 objectAtIndexedSubscript:0];
      size_t v60 = [v59 integerValue];
      v68 = v54;
      v61 = [(size_t *)v54 objectAtIndexedSubscript:0];
      CVReturn v62 = CVPixelBufferCreateWithBytes(v56, v58, v60, (OSType)planeHeight, planeWidth, [v61 integerValue], (CVPixelBufferReleaseBytesCallback)__deallocateHelper, 0, 0, &pixelBufferOut);

      if (v62)
      {
        v63 = HRTFEnrollmentLog;
        if (os_log_type_enabled((os_log_t)HRTFEnrollmentLog, OS_LOG_TYPE_ERROR)) {
          -[_SerializableCVPixelBuffer initWithCoder:](v62, v63);
        }
        v46 = 0;
      }
      else
      {
        v78.receiver = self;
        v78.super_class = (Class)_SerializableCVPixelBuffer;
        v65 = [(_SerializableCVPixelBuffer *)&v78 init];
        if (v65) {
          v65->_pixelBuffer = pixelBufferOut;
        }
        self = v65;
        v46 = self;
      }
      v47 = v71;
      v48 = v72;
      size_t v14 = planeBytesPerRow;
      v39 = i;
    }
  }
  else
  {
    v46 = 0;
  }

  return v46;
}

- (__CVBuffer)pixelBuffer
{
  return self->_pixelBuffer;
}

- (void)initWithCoder:(int)a1 .cold.1(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_22F0F1000, a2, OS_LOG_TYPE_ERROR, "failed to create CVPixelBuffer: %d", (uint8_t *)v2, 8u);
}

- (void)initWithCoder:(int)a1 .cold.2(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_22F0F1000, a2, OS_LOG_TYPE_ERROR, "failed to create planar CVPixelBuffer: %d", (uint8_t *)v2, 8u);
}

@end
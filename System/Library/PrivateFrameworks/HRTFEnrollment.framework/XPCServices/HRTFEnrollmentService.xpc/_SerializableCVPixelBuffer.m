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
  id v4 = a3;
  CVPixelBufferLockBaseAddress(self->_pixelBuffer, 1uLL);
  int64_t PlaneCount = CVPixelBufferGetPlaneCount(self->_pixelBuffer);
  v6 = +[NSNumber numberWithUnsignedInt:CVPixelBufferGetPixelFormatType(self->_pixelBuffer)];
  [v4 encodeObject:v6 forKey:@"PixelFormat"];

  objc_super v7 = +[NSNumber numberWithInteger:PlaneCount];
  [v4 encodeObject:v7 forKey:@"PlaneCount"];

  if (PlaneCount)
  {
    v37 = v4;
    id v8 = objc_alloc_init((Class)NSMutableArray);
    id v9 = objc_alloc_init((Class)NSMutableArray);
    id v38 = objc_alloc_init((Class)NSMutableArray);
    id v10 = objc_alloc_init((Class)NSMutableArray);
    v11 = +[NSNumber numberWithUnsignedLong:CVPixelBufferGetWidth(self->_pixelBuffer)];
    [v8 addObject:v11];

    v12 = +[NSNumber numberWithUnsignedLong:CVPixelBufferGetHeight(self->_pixelBuffer)];
    v13 = v9;
    [v9 addObject:v12];

    if (PlaneCount >= 1)
    {
      size_t v14 = 0;
      do
      {
        int64_t v15 = PlaneCount;
        v16 = +[NSNumber numberWithUnsignedLong:CVPixelBufferGetWidthOfPlane(self->_pixelBuffer, v14)];
        [v8 addObject:v16];

        size_t HeightOfPlane = CVPixelBufferGetHeightOfPlane(self->_pixelBuffer, v14);
        id v18 = v8;
        size_t BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(self->_pixelBuffer, v14);
        v20 = +[NSNumber numberWithUnsignedLong:HeightOfPlane];
        [v13 addObject:v20];

        v21 = +[NSNumber numberWithUnsignedLong:BytesPerRowOfPlane];
        [v38 addObject:v21];

        size_t v22 = BytesPerRowOfPlane * HeightOfPlane;
        id v8 = v18;
        id v23 = objc_alloc((Class)NSData);
        BaseAddressOfPlane = CVPixelBufferGetBaseAddressOfPlane(self->_pixelBuffer, v14);
        v25 = v23;
        int64_t PlaneCount = v15;
        id v26 = [v25 initWithBytes:BaseAddressOfPlane length:v22];
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
    v27 = +[NSNumber numberWithUnsignedLong:CVPixelBufferGetWidth(self->_pixelBuffer)];
    v42 = v27;
    v28 = +[NSArray arrayWithObjects:&v42 count:1];
    [v4 encodeObject:v28 forKey:@"Width"];

    v29 = +[NSNumber numberWithUnsignedLong:CVPixelBufferGetHeight(self->_pixelBuffer)];
    v41 = v29;
    v30 = +[NSArray arrayWithObjects:&v41 count:1];
    [v4 encodeObject:v30 forKey:@"Height"];

    v31 = +[NSNumber numberWithUnsignedLong:CVPixelBufferGetBytesPerRow(self->_pixelBuffer)];
    v40 = v31;
    v32 = +[NSArray arrayWithObjects:&v40 count:1];
    [v4 encodeObject:v32 forKey:@"BytesPerRow"];

    id v33 = objc_alloc((Class)NSData);
    BaseAddress = CVPixelBufferGetBaseAddress(self->_pixelBuffer);
    id v35 = [v33 initWithBytes:BaseAddress length:CVPixelBufferGetDataSize(self->_pixelBuffer)];
    id v39 = v35;
    v36 = +[NSArray arrayWithObjects:&v39 count:1];
    [v4 encodeObject:v36 forKey:@"PixelData"];
  }
  CVPixelBufferUnlockBaseAddress(self->_pixelBuffer, 1uLL);
}

- (_SerializableCVPixelBuffer)initWithCoder:(id)a3
{
  id v4 = a3;
  if ([v4 containsValueForKey:@"PlaneCount"]
    && [v4 containsValueForKey:@"PixelFormat"]
    && [v4 containsValueForKey:@"Width"]
    && [v4 containsValueForKey:@"Height"]
    && [v4 containsValueForKey:@"BytesPerRow"]
    && [v4 containsValueForKey:@"PixelData"])
  {
    v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PlaneCount"];
    id v6 = [v5 integerValue];
    v78[0] = objc_opt_class();
    v78[1] = objc_opt_class();
    objc_super v7 = +[NSArray arrayWithObjects:v78 count:2];
    uint64_t v8 = +[NSSet setWithArray:v7];

    v77[0] = objc_opt_class();
    v77[1] = objc_opt_class();
    id v9 = +[NSArray arrayWithObjects:v77 count:2];
    uint64_t v10 = +[NSSet setWithArray:v9];

    v68 = (void *)v10;
    v69 = (void *)v8;
    if (v6)
    {
      int64_t v11 = (int64_t)v6;
      v66 = self;
      id v67 = v5;
      v12 = [v4 decodeObjectOfClasses:v8 forKey:@"Width"];
      v13 = [v4 decodeObjectOfClasses:v8 forKey:@"Height"];
      size_t v14 = [v4 decodeObjectOfClasses:v8 forKey:@"BytesPerRow"];
      int64_t v15 = [v4 decodeObjectOfClasses:v10 forKey:@"PixelData"];
      v16 = [(size_t *)v12 objectAtIndexedSubscript:0];
      id v64 = [v16 integerValue];

      v17 = [v13 objectAtIndexedSubscript:0];
      id v63 = [v17 integerValue];

      v65 = &v63;
      unint64_t v18 = (8 * v11 + 15) & 0xFFFFFFFFFFFFFFF0;
      v19 = (id *)((char *)&v63 - v18);
      if ((unint64_t)(8 * v11) >= 0x200) {
        size_t v20 = 512;
      }
      else {
        size_t v20 = 8 * v11;
      }
      bzero((char *)&v63 - v18, v20);
      planeWidth = (size_t *)((char *)&v63 - v18);
      planeHeight = (size_t *)((char *)&v63 - v18);
      planeBytesPerRow = (size_t *)((char *)&v63 - v18);
      if (v11 >= 1)
      {
        v21 = 0;
        for (i = (void *)v11; i != v21; int64_t v11 = (int64_t)i)
        {
          size_t v22 = objc_msgSend(v15, "objectAtIndexedSubscript:", v21, v63);
          id v23 = malloc_type_malloc((size_t)[v22 length], 0xF231FE04uLL);
          v19[(void)v21] = v23;

          v24 = [v15 objectAtIndexedSubscript:v21];
          [v15 objectAtIndexedSubscript:v21];
          v25 = v19;
          id v26 = v15;
          v27 = v14;
          v28 = v13;
          v30 = v29 = v12;
          objc_msgSend(v24, "getBytes:length:", v23, objc_msgSend(v30, "length"));

          v12 = v29;
          v13 = v28;
          size_t v14 = v27;
          int64_t v15 = v26;
          v19 = v25;

          v31 = [(size_t *)v12 objectAtIndexedSubscript:(char *)v21 + 1];
          id v32 = [v31 integerValue];
          planeWidth[(void)v21] = (size_t)v32;

          id v33 = [v13 objectAtIndexedSubscript:(char *)v21 + 1];
          id v34 = [v33 integerValue];
          planeHeight[(void)v21] = (size_t)v34;

          id v35 = [v14 objectAtIndexedSubscript:v21];
          id v36 = [v35 integerValue];
          planeBytesPerRow[(void)v21] = (size_t)v36;

          v21 = (char *)v21 + 1;
        }
      }
      CVPixelBufferRef pixelBufferOut = 0;
      v37 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PixelFormat"];

      OSType v38 = [v37 integerValue];
      CVReturn v39 = CVPixelBufferCreateWithPlanarBytes(kCFAllocatorDefault, (size_t)v64, (size_t)v63, v38, 0, 0, v11, v19, planeWidth, planeHeight, planeBytesPerRow, (CVPixelBufferReleasePlanarBytesCallback)sub_10000631C, 0, 0, &pixelBufferOut);
      if (v39)
      {
        int v40 = v39;
        i = v37;
        v41 = v14;
        v42 = HRTFEnrollmentLog;
        BOOL v43 = os_log_type_enabled((os_log_t)HRTFEnrollmentLog, OS_LOG_TYPE_ERROR);
        self = v66;
        if (v43) {
          sub_10000AE38(v40, v42);
        }
        v44 = 0;
        v45 = v68;
        v46 = v69;
        size_t v14 = v41;
        v37 = i;
      }
      else
      {
        v74.receiver = v66;
        v74.super_class = (Class)_SerializableCVPixelBuffer;
        v61 = [(_SerializableCVPixelBuffer *)&v74 init];
        if (v61) {
          v61->_pixelBuffer = pixelBufferOut;
        }
        self = v61;
        v44 = self;
        v45 = v68;
        v46 = v69;
      }
    }
    else
    {
      v48 = [v4 decodeObjectOfClasses:v10 forKey:@"PixelData"];
      v49 = [v48 objectAtIndexedSubscript:0];

      planeWidth = (size_t *)malloc_type_malloc((size_t)[v49 length], 0x7227F3ADuLL);
      planeBytesPerRow = v49;
      memcpy(planeWidth, [(size_t *)planeBytesPerRow bytes], (size_t)[(size_t *)planeBytesPerRow length]);
      CVPixelBufferRef pixelBufferOut = 0;
      v50 = [v4 decodeObjectOfClasses:v8 forKey:@"Width"];
      v51 = [v4 decodeObjectOfClasses:v8 forKey:@"Height"];
      v52 = [v4 decodeObjectOfClasses:v8 forKey:@"BytesPerRow"];
      v53 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PixelFormat"];

      i = v53;
      planeHeight = (size_t *)[v53 integerValue];
      id v67 = v50;
      v54 = [v50 objectAtIndexedSubscript:0];
      id v55 = [v54 integerValue];
      v66 = v51;
      v56 = [(_SerializableCVPixelBuffer *)v51 objectAtIndexedSubscript:0];
      id v57 = [v56 integerValue];
      v65 = v52;
      v58 = [v52 objectAtIndexedSubscript:0];
      CVReturn v59 = CVPixelBufferCreateWithBytes(kCFAllocatorDefault, (size_t)v55, (size_t)v57, (OSType)planeHeight, planeWidth, (size_t)[v58 integerValue], (CVPixelBufferReleaseBytesCallback)sub_100006314, 0, 0, &pixelBufferOut);

      if (v59)
      {
        v60 = HRTFEnrollmentLog;
        if (os_log_type_enabled((os_log_t)HRTFEnrollmentLog, OS_LOG_TYPE_ERROR)) {
          sub_10000ADC0(v59, v60);
        }
        v44 = 0;
      }
      else
      {
        v75.receiver = self;
        v75.super_class = (Class)_SerializableCVPixelBuffer;
        v62 = [(_SerializableCVPixelBuffer *)&v75 init];
        if (v62) {
          v62->_pixelBuffer = pixelBufferOut;
        }
        self = v62;
        v44 = self;
      }
      v45 = v68;
      v46 = v69;
      v12 = planeBytesPerRow;
      v37 = i;
    }
  }
  else
  {
    v44 = 0;
  }

  return v44;
}

- (__CVBuffer)pixelBuffer
{
  return self->_pixelBuffer;
}

@end
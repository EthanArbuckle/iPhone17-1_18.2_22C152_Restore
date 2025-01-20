@interface HMDSnapshotFile
+ (id)logCategory;
- (BOOL)decodeIDSDataReceived:(id)a3 snapshotDataTransaction:(id)a4;
- (BOOL)externalFilePath;
- (BOOL)isEqual:(id)a3;
- (BOOL)isFilled;
- (BOOL)prepareParametersWithFilePath:(id)a3 snapshotData:(id)a4 directory:(id)a5 snapshotTimestamp:(id)a6 resize:(BOOL)a7 writeBack:(BOOL)a8;
- (HMDSnapshotFile)initWithImageDirectory:(id)a3;
- (HMDSnapshotFile)initWithImageDirectory:(id)a3 externalFilePath:(id)a4 snapshotTimestamp:(id)a5;
- (HMDSnapshotFile)initWithImageDirectory:(id)a3 filePath:(id)a4 snapshotTimestamp:(id)a5;
- (HMDSnapshotFile)initWithImageDirectory:(id)a3 snapshotData:(id)a4;
- (NSData)encodedDataForIDSSend;
- (NSDate)snapshotTimestamp;
- (NSNumber)aspectRatio;
- (NSNumber)slotIdentifier;
- (NSString)directory;
- (NSString)filePath;
- (id)attributeDescriptions;
- (id)copyFileAtPath:(id)a3 snapshotTimestamp:(id)a4;
- (unint64_t)hash;
- (void)clearSlot;
- (void)dealloc;
- (void)fillSlot;
- (void)setFilled:(BOOL)a3;
- (void)setSlotIdentifier:(id)a3;
- (void)updateSlotIdentifier;
@end

@implementation HMDSnapshotFile

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_aspectRatio, 0);
  objc_storeStrong((id *)&self->_slotIdentifier, 0);
  objc_storeStrong((id *)&self->_snapshotTimestamp, 0);
  objc_storeStrong((id *)&self->_filePath, 0);
  objc_storeStrong((id *)&self->_directory, 0);
}

- (void)setFilled:(BOOL)a3
{
  self->_filled = a3;
}

- (BOOL)isFilled
{
  return self->_filled;
}

- (BOOL)externalFilePath
{
  return self->_externalFilePath;
}

- (NSNumber)aspectRatio
{
  return (NSNumber *)objc_getProperty(self, a2, 48, 1);
}

- (void)setSlotIdentifier:(id)a3
{
}

- (NSNumber)slotIdentifier
{
  return (NSNumber *)objc_getProperty(self, a2, 40, 1);
}

- (NSDate)snapshotTimestamp
{
  return (NSDate *)objc_getProperty(self, a2, 32, 1);
}

- (NSString)filePath
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)directory
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (BOOL)decodeIDSDataReceived:(id)a3 snapshotDataTransaction:(id)a4
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)MEMORY[0x263F08928];
  v9 = getIDSSessionOptionsAllowedClasses();
  id v37 = 0;
  v10 = [v8 unarchivedObjectOfClasses:v9 fromData:v6 error:&v37];
  id v11 = v37;

  if (v10)
  {
    id v12 = v10;
    objc_opt_class();
    int v13 = objc_opt_isKindOfClass() & 1;
    if (v13) {
      v14 = v12;
    }
    else {
      v14 = 0;
    }
    id v15 = v14;

    if (v13)
    {
      v16 = [v12 objectForKeyedSubscript:@"timestamp"];
      uint64_t v17 = [v12 objectForKeyedSubscript:@"imageData"];
      v18 = (void *)v17;
      if (v16 && v17)
      {
        v19 = [[HMDCameraSnapshotData alloc] initWithSnapshotData:v17 videoResolution:0 snapshotDataTrasaction:v7];
        v20 = [(HMDSnapshotFile *)self directory];
        BOOL v21 = [(HMDSnapshotFile *)self prepareParametersWithFilePath:0 snapshotData:v19 directory:v20 snapshotTimestamp:v16 resize:0 writeBack:1];
      }
      else
      {
        v30 = (void *)MEMORY[0x230FBD990]();
        v31 = self;
        v32 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v33 = v36 = v30;
          uint64_t v34 = [v18 length];
          *(_DWORD *)buf = 138543874;
          v39 = v33;
          __int16 v40 = 2112;
          id v41 = v16;
          __int16 v42 = 2048;
          uint64_t v43 = v34;
          _os_log_impl(&dword_22F52A000, v32, OS_LOG_TYPE_ERROR, "%{public}@Either file timestamp %@ or file data %tu is missing", buf, 0x20u);

          v30 = v36;
        }

        BOOL v21 = 0;
      }
    }
    else
    {
      v26 = (void *)MEMORY[0x230FBD990]();
      v27 = self;
      v28 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        v29 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v39 = v29;
        __int16 v40 = 2112;
        id v41 = v12;
        _os_log_impl(&dword_22F52A000, v28, OS_LOG_TYPE_ERROR, "%{public}@Decoded object: %@ is not of type dictionary", buf, 0x16u);
      }
      BOOL v21 = 0;
    }
  }
  else
  {
    v22 = (void *)MEMORY[0x230FBD990]();
    v23 = self;
    v24 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      v25 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v39 = v25;
      __int16 v40 = 2112;
      id v41 = v11;
      _os_log_impl(&dword_22F52A000, v24, OS_LOG_TYPE_ERROR, "%{public}@Failed to unarchive allowed IDS session options from relay data: %@", buf, 0x16u);
    }
    BOOL v21 = 0;
  }

  return v21;
}

- (NSData)encodedDataForIDSSend
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  v3 = (void *)MEMORY[0x263EFF8F8];
  v4 = [(HMDSnapshotFile *)self filePath];
  id v16 = 0;
  v5 = [v3 dataWithContentsOfFile:v4 options:2 error:&v16];
  id v6 = v16;

  if (v6)
  {
    id v7 = (void *)MEMORY[0x230FBD990]();
    v8 = self;
    v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = HMFGetLogIdentifier();
      id v11 = [(HMDSnapshotFile *)v8 filePath];
      *(_DWORD *)buf = 138543874;
      v18 = v10;
      __int16 v19 = 2112;
      v20 = v11;
      __int16 v21 = 2112;
      id v22 = v6;
      _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_ERROR, "%{public}@Failed to get data from file at path: %@ error: %@", buf, 0x20u);
    }
    id v12 = 0;
  }
  else
  {
    int v13 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:2];
    v14 = [(HMDSnapshotFile *)self snapshotTimestamp];
    [v13 setObject:v14 forKeyedSubscript:@"timestamp"];

    [v13 setObject:v5 forKeyedSubscript:@"imageData"];
    id v12 = encodeRootObject();
  }
  return (NSData *)v12;
}

- (BOOL)prepareParametersWithFilePath:(id)a3 snapshotData:(id)a4 directory:(id)a5 snapshotTimestamp:(id)a6 resize:(BOOL)a7 writeBack:(BOOL)a8
{
  BOOL v8 = a8;
  BOOL v9 = a7;
  uint64_t v153 = *MEMORY[0x263EF8340];
  double v14 = COERCE_DOUBLE(a3);
  id v15 = (HMDCameraSnapshotData *)a4;
  id v16 = a5;
  id v17 = a6;
  v18 = v17;
  if (v14 == 0.0)
  {
    v20 = NSString;
    __int16 v19 = objc_msgSend(v17, "hmd_snapshotFileName");
    double v14 = [v20 stringWithFormat:@"%@/%@", v16, v19];
  }
  else
  {
    __int16 v19 = v15;
    id v15 = [[HMDCameraSnapshotData alloc] initWithSnapshotFile:*(void *)&v14 videoResolution:0];
  }

  id v21 = [(HMDCameraSnapshotData *)v15 snapshotData];
  if (![v21 length])
  {
    uint64_t v43 = (void *)MEMORY[0x230FBD990]();
    uint64_t v44 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
    {
      v45 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v146 = v45;
      __int16 v147 = 2112;
      double v148 = v14;
      v46 = "%{public}@Received file data for file path %@ is empty";
LABEL_67:
      _os_log_impl(&dword_22F52A000, v44, OS_LOG_TYPE_INFO, v46, buf, 0x16u);
    }
LABEL_68:

    BOOL v87 = 0;
    goto LABEL_69;
  }
  id obj = a6;
  v143 = self;
  double v22 = COERCE_DOUBLE(*(id *)&v14);
  BOOL v144 = v8;
  if (!v9)
  {
    id v21 = v21;
    v47 = CGImageSourceCreateWithData((CFDataRef)v21, 0);
    if (v47)
    {
      v48 = v47;
      ImageAtIndex = CGImageSourceCreateImageAtIndex(v47, 0, 0);
      if (ImageAtIndex)
      {
        v50 = ImageAtIndex;
        size_t Width = CGImageGetWidth(ImageAtIndex);
        id v52 = [NSNumber numberWithDouble:(double)Width / (double)CGImageGetHeight(v50)];
        CFRelease(v50);
      }
      else
      {
        v138 = v18;
        v75 = (void *)MEMORY[0x230FBD990]();
        v76 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v76, OS_LOG_TYPE_ERROR))
        {
          v77 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          v146 = v77;
          __int16 v147 = 2112;
          double v148 = v22;
          _os_log_impl(&dword_22F52A000, v76, OS_LOG_TYPE_ERROR, "%{public}@Failed to create image for file path %@", buf, 0x16u);
        }
        id v52 = 0;
        v18 = v138;
      }
      CFRelease(v48);
    }
    else
    {
      v57 = (void *)MEMORY[0x230FBD990]();
      v58 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
      {
        v59 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v146 = v59;
        __int16 v147 = 2112;
        double v148 = v22;
        _os_log_impl(&dword_22F52A000, v58, OS_LOG_TYPE_ERROR, "%{public}@Failed to create image source for file path %@", buf, 0x16u);
      }
      id v52 = 0;
    }

    if (!v52)
    {
LABEL_65:
      uint64_t v43 = (void *)MEMORY[0x230FBD990]();
      uint64_t v44 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
      {
        v45 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v146 = v45;
        __int16 v147 = 2112;
        double v148 = v22;
        v46 = "%{public}@Failed to find aspect ratio for snapshot file %@";
        goto LABEL_67;
      }
      goto LABEL_68;
    }
LABEL_40:
    id v141 = v21;
    if (v144)
    {
      v78 = +[HMDPersistentStore writeData:v21 toStorePath:*(void *)&v22 dataLabel:*(void *)&v22];
      if (![v78 unsignedIntegerValue])
      {
        double v88 = v14;
        v89 = v15;
        id v90 = v16;
        double v91 = v22;
        v92 = v18;
        v93 = (void *)MEMORY[0x230FBD990]();
        v94 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v94, OS_LOG_TYPE_INFO))
        {
          v95 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          v146 = v95;
          __int16 v147 = 2112;
          double v148 = v91;
          _os_log_impl(&dword_22F52A000, v94, OS_LOG_TYPE_INFO, "%{public}@Failed to save the file %@", buf, 0x16u);
        }

        BOOL v87 = 0;
        v18 = v92;
        id v16 = v90;
        id v15 = v89;
        double v14 = v88;
        goto LABEL_46;
      }
    }
    v79 = v15;
    id v80 = v16;
    double v81 = v22;
    v82 = v18;
    objc_storeStrong((id *)&v143->_filePath, *(id *)&v14);
    objc_storeStrong((id *)&v143->_snapshotTimestamp, obj);
    objc_storeStrong((id *)&v143->_aspectRatio, v52);
    v83 = (void *)MEMORY[0x230FBD990]();
    v84 = v143;
    v85 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v85, OS_LOG_TYPE_INFO))
    {
      v86 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138544130;
      v146 = v86;
      __int16 v147 = 2112;
      double v148 = v81;
      __int16 v149 = 2112;
      double v150 = *(double *)&v82;
      __int16 v151 = 2112;
      size_t v152 = (size_t)v52;
      _os_log_impl(&dword_22F52A000, v85, OS_LOG_TYPE_INFO, "%{public}@Initialized the snapshot file path %@, timestamp %@, aspect ratio %@", buf, 0x2Au);
    }

    BOOL v87 = 1;
    v18 = v82;
    id v16 = v80;
    id v15 = v79;
LABEL_46:
    id v21 = v141;
    goto LABEL_69;
  }
  uint64_t v23 = v15;
  CFDataRef v24 = [(HMDCameraSnapshotData *)v23 snapshotData];
  v25 = CGImageSourceCreateWithData(v24, 0);

  if (v25)
  {
    v26 = CGImageSourceCreateImageAtIndex(v25, 0, 0);
    if (v26)
    {
      v27 = v26;
      v135 = v25;
      v137 = v18;
      v139 = v23;
      id v132 = v16;
      *(double *)&size_t v28 = COERCE_DOUBLE(CGImageGetWidth(v26));
      image = v27;
      size_t Height = CGImageGetHeight(v27);
      id v133 = [NSNumber numberWithDouble:(double)v28 / (double)Height];
      v30 = (void *)MEMORY[0x230FBD990]();
      v31 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
      {
        v32 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138544130;
        v146 = v32;
        __int16 v147 = 2112;
        double v148 = v22;
        __int16 v149 = 2048;
        double v150 = *(double *)&v28;
        __int16 v151 = 2048;
        size_t v152 = Height;
        _os_log_impl(&dword_22F52A000, v31, OS_LOG_TYPE_INFO, "%{public}@Image at %@ is of width %lu, height %lu", buf, 0x2Au);
      }
      v33 = [(HMDCameraSnapshotData *)v139 videoResolution];
      uint64_t v34 = [v33 imageWidth];
      uint64_t v35 = [v34 unsignedIntegerValue];

      v36 = [(HMDCameraSnapshotData *)v139 videoResolution];
      id v37 = [v36 imageHeight];
      unint64_t v38 = [v37 unsignedIntegerValue];

      if (Height == v38 && v28 == v35 || v28 == v38 && Height == v35)
      {
        v39 = (void *)MEMORY[0x230FBD990]();
        __int16 v40 = HMFGetOSLogHandle();
        id v16 = v132;
        if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
        {
          id v41 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          v146 = v41;
          __int16 v147 = 2112;
          double v148 = v22;
          _os_log_impl(&dword_22F52A000, v40, OS_LOG_TYPE_INFO, "%{public}@Given data matches the expected resolution for file path %@", buf, 0x16u);
        }
        uint64_t v23 = v139;
        __int16 v42 = [(HMDCameraSnapshotData *)v139 snapshotData];
        v18 = v137;
      }
      else
      {
        CGColorSpaceRef ColorSpace = CGImageGetColorSpace(image);
        if (ColorSpace)
        {
          v97 = ColorSpace;
          float v98 = (float)(v38 * v28 / Height);
          float v99 = (float)v38;
          size_t v100 = (unint64_t)(float)v38;
          size_t BitsPerComponent = CGImageGetBitsPerComponent(image);
          size_t BytesPerRow = CGImageGetBytesPerRow(image);
          uint32_t AlphaInfo = CGImageGetAlphaInfo(image);
          v104 = CGBitmapContextCreate(0, (unint64_t)v98, v100, BitsPerComponent, BytesPerRow, v97, AlphaInfo);
          if (v104)
          {
            v105 = v104;
            v154.origin.x = 0.0;
            v154.origin.y = 0.0;
            v154.size.width = v98;
            v154.size.height = v99;
            CGContextDrawImage(v104, v154, image);
            v106 = CGBitmapContextCreateImage(v105);
            CGContextRelease(v105);
            if (v106)
            {
              v107 = (__CFData *)objc_alloc_init(MEMORY[0x263EFF990]);
              v108 = CGImageDestinationCreateWithData(v107, (CFStringRef)*MEMORY[0x263F01A80], 1uLL, 0);
              id v16 = v132;
              cf = v106;
              if (v108)
              {
                v109 = v108;
                v130 = v107;
                CGImageDestinationAddImage(v108, v106, 0);
                BOOL v110 = CGImageDestinationFinalize(v109);
                context = (void *)MEMORY[0x230FBD990]();
                v111 = HMFGetOSLogHandle();
                v112 = v111;
                if (v110)
                {
                  v113 = v135;
                  v18 = v137;
                  if (os_log_type_enabled(v111, OS_LOG_TYPE_INFO))
                  {
                    v114 = HMFGetLogIdentifier();
                    uint64_t v115 = [(__CFData *)v130 length];
                    *(_DWORD *)buf = 138544130;
                    v146 = v114;
                    __int16 v147 = 2048;
                    double v148 = v98;
                    __int16 v149 = 2048;
                    double v150 = v99;
                    __int16 v151 = 2048;
                    size_t v152 = v115;
                    _os_log_impl(&dword_22F52A000, v112, OS_LOG_TYPE_INFO, "%{public}@Returning JPEG image of width: %lf, height: %lf, %tu bytes", buf, 0x2Au);
                  }
                  v116 = v130;
                  __int16 v42 = v130;
                }
                else
                {
                  v113 = v135;
                  v18 = v137;
                  if (os_log_type_enabled(v111, OS_LOG_TYPE_ERROR))
                  {
                    v128 = HMFGetLogIdentifier();
                    *(_DWORD *)buf = 138543362;
                    v146 = v128;
                    _os_log_impl(&dword_22F52A000, v112, OS_LOG_TYPE_ERROR, "%{public}@Failing to finalize destination", buf, 0xCu);
                  }
                  __int16 v42 = 0;
                  v116 = v130;
                }

                CFRelease(v109);
                uint64_t v23 = v139;
              }
              else
              {
                v125 = (void *)MEMORY[0x230FBD990]();
                v126 = HMFGetOSLogHandle();
                uint64_t v23 = v139;
                if (os_log_type_enabled(v126, OS_LOG_TYPE_ERROR))
                {
                  v127 = HMFGetLogIdentifier();
                  *(_DWORD *)buf = 138543618;
                  v146 = v127;
                  __int16 v147 = 2112;
                  double v148 = v22;
                  _os_log_impl(&dword_22F52A000, v126, OS_LOG_TYPE_ERROR, "%{public}@Failed to create image destination for file path %@", buf, 0x16u);
                }

                __int16 v42 = 0;
                v113 = v135;
                v18 = v137;
              }
              v120 = image;
              CFRelease(cf);
LABEL_62:
              CFRelease(v120);
              CFRelease(v113);
              v64 = v133;
              if (v42) {
                goto LABEL_63;
              }
              goto LABEL_32;
            }
          }
        }
        v117 = (void *)MEMORY[0x230FBD990]();
        v118 = HMFGetOSLogHandle();
        id v16 = v132;
        if (os_log_type_enabled(v118, OS_LOG_TYPE_ERROR))
        {
          v119 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          v146 = v119;
          __int16 v147 = 2112;
          double v148 = v22;
          _os_log_impl(&dword_22F52A000, v118, OS_LOG_TYPE_ERROR, "%{public}@Failed to create resized image for file path %@", buf, 0x16u);
        }
        __int16 v42 = 0;
        v18 = v137;
        uint64_t v23 = v139;
      }
      v120 = image;
      v113 = v135;
      goto LABEL_62;
    }
    v60 = (void *)MEMORY[0x230FBD990]();
    v61 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v136 = v25;
      v63 = v62 = v18;
      *(_DWORD *)buf = 138543618;
      v146 = v63;
      __int16 v147 = 2112;
      double v148 = v22;
      _os_log_impl(&dword_22F52A000, v61, OS_LOG_TYPE_ERROR, "%{public}@Failed to create image for file path %@", buf, 0x16u);

      v18 = v62;
      v25 = v136;
    }

    CFRelease(v25);
  }
  else
  {
    v53 = (void *)MEMORY[0x230FBD990]();
    v54 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v56 = v55 = v18;
      *(_DWORD *)buf = 138543618;
      v146 = v56;
      __int16 v147 = 2112;
      double v148 = v22;
      _os_log_impl(&dword_22F52A000, v54, OS_LOG_TYPE_ERROR, "%{public}@Failed to create image source for file path %@", buf, 0x16u);

      v18 = v55;
    }
  }
  v64 = 0;
LABEL_32:
  v65 = (void *)MEMORY[0x230FBD990]();
  v66 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v66, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v140 = v23;
    id v67 = v21;
    v68 = v18;
    double v69 = v14;
    v70 = v15;
    id v71 = v16;
    double v72 = v22;
    v74 = v73 = v64;
    *(_DWORD *)buf = 138543362;
    v146 = v74;
    _os_log_impl(&dword_22F52A000, v66, OS_LOG_TYPE_INFO, "%{public}@Could not resize image, returning back the original", buf, 0xCu);

    v64 = v73;
    double v22 = v72;
    id v16 = v71;
    id v15 = v70;
    double v14 = v69;
    v18 = v68;
    id v21 = v67;
    uint64_t v23 = v140;
  }

  __int16 v42 = [(HMDCameraSnapshotData *)v23 snapshotData];
LABEL_63:

  id v52 = v64;
  if ([(__CFData *)v42 length])
  {
    id v21 = v42;
    if (!v52) {
      goto LABEL_65;
    }
    goto LABEL_40;
  }
  v122 = (void *)MEMORY[0x230FBD990]();
  v123 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v123, OS_LOG_TYPE_INFO))
  {
    v124 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v146 = v124;
    __int16 v147 = 2112;
    double v148 = v22;
    _os_log_impl(&dword_22F52A000, v123, OS_LOG_TYPE_INFO, "%{public}@Resizing file data for file path %@ resulted in 0 length data", buf, 0x16u);
  }

  BOOL v87 = 0;
  id v21 = v42;
LABEL_69:

  return v87;
}

- (unint64_t)hash
{
  v2 = [(HMDSnapshotFile *)self filePath];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (HMDSnapshotFile *)a3;
  if (self == v4)
  {
    BOOL v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = [(HMDSnapshotFile *)self filePath];
      id v6 = [(HMDSnapshotFile *)v4 filePath];
      BOOL v7 = v5 == v6;
    }
    else
    {
      BOOL v7 = 0;
    }
  }

  return v7;
}

- (id)attributeDescriptions
{
  v17[4] = *MEMORY[0x263EF8340];
  id v3 = objc_alloc(MEMORY[0x263F424F8]);
  v4 = [(HMDSnapshotFile *)self filePath];
  v5 = (void *)[v3 initWithName:@"File Path" value:v4];
  v17[0] = v5;
  id v6 = objc_alloc(MEMORY[0x263F424F8]);
  BOOL v7 = [(HMDSnapshotFile *)self slotIdentifier];
  BOOL v8 = (void *)[v6 initWithName:@"Slot" value:v7];
  v17[1] = v8;
  id v9 = objc_alloc(MEMORY[0x263F424F8]);
  v10 = [(HMDSnapshotFile *)self snapshotTimestamp];
  id v11 = (void *)[v9 initWithName:@"Timestamp" value:v10];
  v17[2] = v11;
  id v12 = objc_alloc(MEMORY[0x263F424F8]);
  int v13 = [(HMDSnapshotFile *)self aspectRatio];
  double v14 = (void *)[v12 initWithName:@"Aspect Ratio" value:v13];
  v17[3] = v14;
  id v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:4];

  return v15;
}

- (void)clearSlot
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = (void *)MEMORY[0x230FBD990](self, a2);
  v4 = self;
  v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = HMFGetLogIdentifier();
    int v9 = 138543618;
    v10 = v6;
    __int16 v11 = 2112;
    id v12 = v4;
    _os_log_impl(&dword_22F52A000, v5, OS_LOG_TYPE_INFO, "%{public}@Clearing snapshot slot for snapshot %@", (uint8_t *)&v9, 0x16u);
  }
  BOOL v7 = +[HMDSnapshotCATransactionHandler sharedHandler];
  BOOL v8 = [(HMDSnapshotFile *)v4 slotIdentifier];
  [v7 clearSlotWithIdentifier:v8];

  [(HMDSnapshotFile *)v4 setFilled:0];
}

- (void)fillSlot
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (![(HMDSnapshotFile *)self isFilled])
  {
    id v3 = (void *)MEMORY[0x230FBD990]();
    v4 = self;
    v5 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      id v6 = HMFGetLogIdentifier();
      int v10 = 138543618;
      __int16 v11 = v6;
      __int16 v12 = 2112;
      uint64_t v13 = v4;
      _os_log_impl(&dword_22F52A000, v5, OS_LOG_TYPE_INFO, "%{public}@Filling snapshot slot for snapshot %@", (uint8_t *)&v10, 0x16u);
    }
    BOOL v7 = +[HMDSnapshotCATransactionHandler sharedHandler];
    BOOL v8 = [(HMDSnapshotFile *)v4 slotIdentifier];
    int v9 = [(HMDSnapshotFile *)v4 filePath];
    [v7 fillSlotWithIdentifier:v8 filePath:v9];

    [(HMDSnapshotFile *)v4 setFilled:1];
  }
}

- (void)updateSlotIdentifier
{
  id v5 = +[HMDSnapshotCATransactionHandler sharedHandler];
  id v3 = [(HMDSnapshotFile *)self filePath];
  v4 = [v5 createSlotWithFilePath:v3];
  [(HMDSnapshotFile *)self setSlotIdentifier:v4];
}

- (void)dealloc
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v3 = (void *)MEMORY[0x230FBD990](self, a2);
  v4 = self;
  id v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v32 = v6;
    _os_log_impl(&dword_22F52A000, v5, OS_LOG_TYPE_INFO, "%{public}@Deallocating HMDSnapshotFile", buf, 0xCu);
  }
  BOOL v7 = [(HMDSnapshotFile *)v4 slotIdentifier];

  if (v7)
  {
    BOOL v8 = +[HMDSnapshotCATransactionHandler sharedHandler];
    int v9 = [(HMDSnapshotFile *)v4 slotIdentifier];
    int v10 = [(HMDSnapshotFile *)v4 filePath];
    [v8 deleteSlotWithIdentifier:v9 filePath:v10];
  }
  if (![(HMDSnapshotFile *)v4 externalFilePath])
  {
    __int16 v11 = [(HMDSnapshotFile *)v4 filePath];

    if (v11)
    {
      __int16 v12 = [MEMORY[0x263F08850] defaultManager];
      uint64_t v13 = [(HMDSnapshotFile *)v4 filePath];
      int v14 = [v12 fileExistsAtPath:v13];

      if (v14)
      {
        id v15 = (void *)MEMORY[0x230FBD990]();
        id v16 = v4;
        id v17 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          v18 = HMFGetLogIdentifier();
          __int16 v19 = [(HMDSnapshotFile *)v16 filePath];
          *(_DWORD *)buf = 138543618;
          v32 = v18;
          __int16 v33 = 2112;
          uint64_t v34 = v19;
          _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_INFO, "%{public}@Deleting snapshot file at %@", buf, 0x16u);
        }
        v20 = [MEMORY[0x263F08850] defaultManager];
        id v21 = [(HMDSnapshotFile *)v16 filePath];
        id v30 = 0;
        char v22 = [v20 removeItemAtPath:v21 error:&v30];
        id v23 = v30;

        if ((v22 & 1) == 0)
        {
          CFDataRef v24 = (void *)MEMORY[0x230FBD990]();
          v25 = v16;
          v26 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          {
            v27 = HMFGetLogIdentifier();
            size_t v28 = [(HMDSnapshotFile *)v25 filePath];
            *(_DWORD *)buf = 138543874;
            v32 = v27;
            __int16 v33 = 2112;
            uint64_t v34 = v28;
            __int16 v35 = 2112;
            id v36 = v23;
            _os_log_impl(&dword_22F52A000, v26, OS_LOG_TYPE_ERROR, "%{public}@Failed to delete snapshot file at %@: %@", buf, 0x20u);
          }
        }
      }
    }
  }
  v29.receiver = v4;
  v29.super_class = (Class)HMDSnapshotFile;
  [(HMDSnapshotFile *)&v29 dealloc];
}

- (id)copyFileAtPath:(id)a3 snapshotTimestamp:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  BOOL v8 = [[HMDCameraSnapshotData alloc] initWithSnapshotFile:v7 videoResolution:0];

  int v9 = [(HMDSnapshotFile *)self directory];
  LOBYTE(v7) = [(HMDSnapshotFile *)self prepareParametersWithFilePath:0 snapshotData:v8 directory:v9 snapshotTimestamp:v6 resize:0 writeBack:1];

  int v10 = 0;
  if ((v7 & 1) == 0)
  {
    int v10 = [MEMORY[0x263F087E8] hmInternalErrorWithCode:1035];
  }

  return v10;
}

- (HMDSnapshotFile)initWithImageDirectory:(id)a3 externalFilePath:(id)a4 snapshotTimestamp:(id)a5
{
  result = [(HMDSnapshotFile *)self initWithImageDirectory:a3 filePath:a4 snapshotTimestamp:a5];
  if (result) {
    result->_externalFilePath = 1;
  }
  return result;
}

- (HMDSnapshotFile)initWithImageDirectory:(id)a3 filePath:(id)a4 snapshotTimestamp:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  __int16 v11 = [(HMDSnapshotFile *)self initWithImageDirectory:v8];
  __int16 v12 = v11;
  if (!v11
    || (uint64_t v13 = 0,
        [(HMDSnapshotFile *)v11 prepareParametersWithFilePath:v9 snapshotData:0 directory:v8 snapshotTimestamp:v10 resize:0 writeBack:0]))
  {
    uint64_t v13 = v12;
  }

  return v13;
}

- (HMDSnapshotFile)initWithImageDirectory:(id)a3 snapshotData:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMDSnapshotFile *)self initWithImageDirectory:v6];
  if (!v8
    || ([MEMORY[0x263EFF910] date],
        id v9 = objc_claimAutoreleasedReturnValue(),
        v10 = [(HMDSnapshotFile *)v8 prepareParametersWithFilePath:0 snapshotData:v7 directory:v6 snapshotTimestamp:v9 resize:1 writeBack:1], v9, __int16 v11 = 0, v10))
  {
    __int16 v11 = v8;
  }

  return v11;
}

- (HMDSnapshotFile)initWithImageDirectory:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMDSnapshotFile;
  id v6 = [(HMDSnapshotFile *)&v9 init];
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_directory, a3);
  }

  return v7;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t0_109867 != -1) {
    dispatch_once(&logCategory__hmf_once_t0_109867, &__block_literal_global_109868);
  }
  v2 = (void *)logCategory__hmf_once_v1_109869;
  return v2;
}

void __30__HMDSnapshotFile_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v1_109869;
  logCategory__hmf_once_v1_109869 = v0;
}

@end
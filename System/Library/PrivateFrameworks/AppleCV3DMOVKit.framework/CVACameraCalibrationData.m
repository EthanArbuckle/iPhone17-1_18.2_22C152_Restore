@interface CVACameraCalibrationData
+ (BOOL)supportsSecureCoding;
+ (id)classes;
- (AVCameraCalibrationData)calibrationData;
- (CGPoint)lensDistortionCenter;
- (CGSize)intrinsicMatrixReferenceDimensions;
- (CVACameraCalibrationData)initWithAVCameraCalibrationData:(id)a3 timestamp:(double)a4 streamID:(id)a5;
- (CVACameraCalibrationData)initWithCoder:(id)a3;
- (NSData)inverseLensDistortionLookupTable;
- (NSData)lensDistortionLookupTable;
- (NSDictionary)calibrationDictionary;
- (NSString)streamID;
- (__n128)extrinsicMatrix;
- (__n128)intrinsicMatrix;
- (__n128)setExtrinsicMatrix:(__n128)a3;
- (__n128)setIntrinsicMatrix:(__n128)a3;
- (double)timestamp;
- (float)pixelSize;
- (id)debugDescription;
- (id)dictionary;
- (void)encodeWithCoder:(id)a3;
- (void)setCalibrationData:(id)a3;
- (void)setCalibrationDictionary:(id)a3;
- (void)setIntrinsicMatrixReferenceDimensions:(CGSize)a3;
- (void)setInverseLensDistortionLookupTable:(id)a3;
- (void)setLensDistortionCenter:(CGPoint)a3;
- (void)setLensDistortionLookupTable:(id)a3;
- (void)setPixelSize:(float)a3;
- (void)setStreamID:(id)a3;
- (void)setTimestamp:(double)a3;
- (void)updateProperties:(id)a3;
@end

@implementation CVACameraCalibrationData

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)classes
{
  if (qword_267C58BA8 == -1)
  {
    v2 = (void *)qword_267C58BA0;
  }
  else
  {
    dispatch_once(&qword_267C58BA8, &unk_26CB5E338);
    v2 = (void *)qword_267C58BA0;
  }
  return v2;
}

- (void)updateProperties:(id)a3
{
  id v4 = a3;
  [v4 intrinsicMatrix];
  *(_DWORD *)&self->_anon_60[8] = v5;
  *(_DWORD *)&self->_anon_60[24] = v6;
  *(void *)self->_anon_60 = v7;
  *(void *)&self->_anon_60[16] = v8;
  *(_DWORD *)&self->_anon_60[40] = v9;
  *(void *)&self->_anon_60[32] = v10;
  [v4 intrinsicMatrixReferenceDimensions];
  self->_intrinsicMatrixReferenceDimensions.width = v11;
  self->_intrinsicMatrixReferenceDimensions.height = v12;
  [v4 extrinsicMatrix];
  self[1]._pixelSize = v13;
  self[1].super.isa = v14;
  LODWORD(self[1]._timestamp) = v15;
  LODWORD(self[1]._calibrationData) = v16;
  self[1]._streamID = v17;
  self[1]._calibrationDictionary = v18;
  LODWORD(self[1]._inverseLensDistortionLookupTable) = v19;
  self[1]._lensDistortionLookupTable = v20;
  [v4 pixelSize];
  self->_pixelSize = v21;
  v22 = [v4 lensDistortionLookupTable];
  lensDistortionLookupTable = self->_lensDistortionLookupTable;
  self->_lensDistortionLookupTable = v22;

  v24 = [v4 inverseLensDistortionLookupTable];
  inverseLensDistortionLookupTable = self->_inverseLensDistortionLookupTable;
  self->_inverseLensDistortionLookupTable = v24;

  [v4 lensDistortionCenter];
  CGFloat v27 = v26;
  CGFloat v29 = v28;

  self->_lensDistortionCenter.x = v27;
  self->_lensDistortionCenter.y = v29;
}

- (CVACameraCalibrationData)initWithAVCameraCalibrationData:(id)a3 timestamp:(double)a4 streamID:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v15.receiver = self;
  v15.super_class = (Class)CVACameraCalibrationData;
  uint64_t v10 = [(CVACameraCalibrationData *)&v15 init];
  CGFloat v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_streamID, a5);
    v11->_timestamp = a4;
    [(CVACameraCalibrationData *)v11 updateProperties:v8];
    if (objc_opt_respondsToSelector())
    {
      uint64_t v12 = [v8 cameraCalibrationDataDictionary];
      calibrationDictionary = v11->_calibrationDictionary;
      v11->_calibrationDictionary = (NSDictionary *)v12;
    }
  }

  return v11;
}

- (CVACameraCalibrationData)initWithCoder:(id)a3
{
  id v4 = a3;
  v111.receiver = self;
  v111.super_class = (Class)CVACameraCalibrationData;
  int v5 = [(CVACameraCalibrationData *)&v111 init];
  if (v5)
  {
    int v6 = (void *)MEMORY[0x21D490BF0]();
    uint64_t v7 = [v4 decodeObjectForKey:@"si"];
    streamID = v5->_streamID;
    v5->_streamID = (NSString *)v7;

    [v4 decodeDoubleForKey:@"t"];
    v5->_timestamp = v9;
    uint64_t v10 = [v4 decodeObjectForKey:@"d"];
    calibrationDictionary = v5->_calibrationDictionary;
    v5->_calibrationDictionary = (NSDictionary *)v10;

    if (v5->_calibrationDictionary)
    {
      if ([MEMORY[0x263EFA548] instancesRespondToSelector:sel_initWithCameraCalibrationDataDictionary_error_])
      {
        id v12 = objc_alloc(MEMORY[0x263EFA548]);
        float v13 = v5->_calibrationDictionary;
        id v110 = 0;
        uint64_t v14 = [v12 initWithCameraCalibrationDataDictionary:v13 error:&v110];
        id v15 = v110;
        calibrationData = v5->_calibrationData;
        v5->_calibrationData = (AVCameraCalibrationData *)v14;

        if (v15)
        {
          NSLog(&cfstr_FailedToRecrea.isa, v15);
          NSLog(&cfstr_FailedToRecrea.isa, v15);
LABEL_15:

LABEL_19:
          goto LABEL_20;
        }
        [(CVACameraCalibrationData *)v5 updateProperties:v5->_calibrationData];
      }
      else
      {
        v88 = [MEMORY[0x263F08AB0] processInfo];
        v89 = [v88 operatingSystemVersionString];
        NSLog(&cfstr_FailedToRecrea_0.isa, v89);
      }
      [(CVACameraCalibrationData *)v5 updateProperties:v5->_calibrationData];
      goto LABEL_19;
    }
    v17 = [v4 decodeObjectForKey:@"im"];
    id v15 = v17;
    if (v17)
    {
      v18 = [v17 objectAtIndexedSubscript:0];
      [v18 floatValue];
      unsigned int v106 = v19;

      v20 = [v15 objectAtIndexedSubscript:1];
      [v20 floatValue];
      unsigned int v100 = v21;

      v22 = [v15 objectAtIndexedSubscript:2];
      [v22 floatValue];
      int v24 = v23;
      unint64_t v107 = __PAIR64__(v100, v106);

      v25 = [v15 objectAtIndexedSubscript:3];
      [v25 floatValue];
      unsigned int v101 = v26;

      CGFloat v27 = [v15 objectAtIndexedSubscript:4];
      [v27 floatValue];
      unsigned int v95 = v28;

      CGFloat v29 = [v15 objectAtIndexedSubscript:5];
      [v29 floatValue];
      int v31 = v30;
      unint64_t v102 = __PAIR64__(v95, v101);

      v32 = [v15 objectAtIndexedSubscript:6];
      [v32 floatValue];
      unsigned int v96 = v33;

      v34 = [v15 objectAtIndexedSubscript:7];
      [v34 floatValue];
      unsigned int v92 = v35;

      v36 = [v15 objectAtIndexedSubscript:8];
      [v36 floatValue];
      int v38 = v37;

      *(_DWORD *)&v5->_anon_60[8] = v24;
      *(void *)v5->_anon_60 = v107;
      *(_DWORD *)&v5->_anon_60[12] = 0;
      *(_DWORD *)&v5->_anon_60[24] = v31;
      *(void *)&v5->_anon_60[16] = v102;
      *(_DWORD *)&v5->_anon_60[28] = 0;
      *(_DWORD *)&v5->_anon_60[40] = v38;
      *(void *)&v5->_anon_60[32] = __PAIR64__(v92, v96);
      *(_DWORD *)&v5->_anon_60[44] = 0;
    }
    v39 = [v4 decodeObjectForKey:@"imrd"];
    v40 = v39;
    if (v39)
    {
      v41 = [v39 objectAtIndexedSubscript:0];
      [v41 floatValue];
      CGFloat v43 = v42;
      v44 = [v40 objectAtIndexedSubscript:1];
      [v44 floatValue];
      v5->_intrinsicMatrixReferenceDimensions.width = v43;
      v5->_intrinsicMatrixReferenceDimensions.height = v45;
    }
    v46 = [v4 decodeObjectForKey:@"em"];
    v47 = v46;
    if (v46)
    {
      v48 = [v46 objectAtIndexedSubscript:0];
      [v48 floatValue];
      unsigned int v108 = v49;

      v50 = [v47 objectAtIndexedSubscript:1];
      [v50 floatValue];
      unsigned int v103 = v51;

      v52 = [v47 objectAtIndexedSubscript:2];
      [v52 floatValue];
      float v54 = v53;
      unint64_t v109 = __PAIR64__(v103, v108);

      v55 = [v47 objectAtIndexedSubscript:3];
      [v55 floatValue];
      unsigned int v104 = v56;

      v57 = [v47 objectAtIndexedSubscript:4];
      [v57 floatValue];
      unsigned int v97 = v58;

      v59 = [v47 objectAtIndexedSubscript:5];
      [v59 floatValue];
      int v61 = v60;
      unint64_t v105 = __PAIR64__(v97, v104);

      v62 = [v47 objectAtIndexedSubscript:6];
      [v62 floatValue];
      unsigned int v98 = v63;

      v64 = [v47 objectAtIndexedSubscript:7];
      [v64 floatValue];
      unsigned int v93 = v65;

      v66 = [v47 objectAtIndexedSubscript:8];
      [v66 floatValue];
      int v68 = v67;
      unint64_t v99 = __PAIR64__(v93, v98);

      v69 = [v47 objectAtIndexedSubscript:9];
      [v69 floatValue];
      unsigned int v94 = v70;

      v71 = [v47 objectAtIndexedSubscript:10];
      [v71 floatValue];
      unsigned int v91 = v72;

      v73 = [v47 objectAtIndexedSubscript:11];
      [v73 floatValue];
      int v75 = v74;

      v5[1]._pixelSize = v54;
      v5[1].super.isa = (Class)v109;
      *((_DWORD *)&v5[1]._pixelSize + 1) = 0;
      LODWORD(v5[1]._timestamp) = v61;
      v5[1]._streamID = (NSString *)v105;
      HIDWORD(v5[1]._timestamp) = 0;
      LODWORD(v5[1]._calibrationData) = v68;
      v5[1]._calibrationDictionary = (NSDictionary *)v99;
      HIDWORD(v5[1]._calibrationData) = 0;
      LODWORD(v5[1]._inverseLensDistortionLookupTable) = v75;
      v5[1]._lensDistortionLookupTable = (NSData *)__PAIR64__(v91, v94);
      HIDWORD(v5[1]._inverseLensDistortionLookupTable) = 0;
    }
    [v4 decodeFloatForKey:@"ps"];
    v5->_pixelSize = v76;
    uint64_t v77 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ldlt"];
    lensDistortionLookupTable = v5->_lensDistortionLookupTable;
    v5->_lensDistortionLookupTable = (NSData *)v77;

    uint64_t v79 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ildlt"];
    inverseLensDistortionLookupTable = v5->_inverseLensDistortionLookupTable;
    v5->_inverseLensDistortionLookupTable = (NSData *)v79;

    v81 = [v4 decodeObjectForKey:@"ldc"];
    v82 = v81;
    if (v81)
    {
      v83 = [v81 objectAtIndexedSubscript:0];
      [v83 floatValue];
      CGFloat v85 = v84;
      v86 = [v82 objectAtIndexedSubscript:1];
      [v86 floatValue];
      v5->_lensDistortionCenter.x = v85;
      v5->_lensDistortionCenter.y = v87;
    }
    goto LABEL_15;
  }
LABEL_20:

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v62[9] = *MEMORY[0x263EF8340];
  id v4 = a3;
  int v5 = (void *)MEMORY[0x21D490BF0]();
  [v4 encodeObject:self->_streamID forKey:@"si"];
  [v4 encodeDouble:@"t" forKey:self->_timestamp];
  calibrationDictionary = self->_calibrationDictionary;
  if (calibrationDictionary)
  {
    [v4 encodeObject:calibrationDictionary forKey:@"d"];
  }
  else
  {
    LODWORD(v6) = *(_DWORD *)self->_anon_60;
    v55 = [NSNumber numberWithFloat:v6];
    v62[0] = v55;
    LODWORD(v8) = *(_DWORD *)&self->_anon_60[4];
    float v53 = [NSNumber numberWithFloat:v8];
    v62[1] = v53;
    LODWORD(v9) = *(_DWORD *)&self->_anon_60[8];
    unsigned int v51 = [NSNumber numberWithFloat:v9];
    v62[2] = v51;
    LODWORD(v10) = *(_DWORD *)&self->_anon_60[16];
    CGFloat v11 = [NSNumber numberWithFloat:v10];
    v62[3] = v11;
    LODWORD(v12) = *(_DWORD *)&self->_anon_60[20];
    [NSNumber numberWithFloat:v12];
    float v13 = v58 = v5;
    v62[4] = v13;
    LODWORD(v14) = *(_DWORD *)&self->_anon_60[24];
    id v15 = [NSNumber numberWithFloat:v14];
    v62[5] = v15;
    LODWORD(v16) = *(_DWORD *)&self->_anon_60[32];
    v17 = [NSNumber numberWithFloat:v16];
    v62[6] = v17;
    LODWORD(v18) = *(_DWORD *)&self->_anon_60[36];
    unsigned int v19 = [NSNumber numberWithFloat:v18];
    v62[7] = v19;
    LODWORD(v20) = *(_DWORD *)&self->_anon_60[40];
    unsigned int v21 = [NSNumber numberWithFloat:v20];
    v62[8] = v21;
    v57 = [MEMORY[0x263EFF8C0] arrayWithObjects:v62 count:9];

    [v4 encodeObject:v57 forKey:@"im"];
    v22 = [NSNumber numberWithDouble:self->_intrinsicMatrixReferenceDimensions.width];
    v61[0] = v22;
    int v23 = [NSNumber numberWithDouble:self->_intrinsicMatrixReferenceDimensions.height];
    v61[1] = v23;
    int v24 = [MEMORY[0x263EFF8C0] arrayWithObjects:v61 count:2];
    [v4 encodeObject:v24 forKey:@"imrd"];

    LODWORD(v25) = self[1].super.isa;
    unsigned int v56 = [NSNumber numberWithFloat:v25];
    v60[0] = v56;
    LODWORD(v26) = HIDWORD(self[1].super.isa);
    float v54 = [NSNumber numberWithFloat:v26];
    v60[1] = v54;
    *(float *)&double v27 = self[1]._pixelSize;
    v52 = [NSNumber numberWithFloat:v27];
    v60[2] = v52;
    LODWORD(v28) = self[1]._streamID;
    v50 = [NSNumber numberWithFloat:v28];
    v60[3] = v50;
    LODWORD(v29) = HIDWORD(self[1]._streamID);
    unsigned int v49 = [NSNumber numberWithFloat:v29];
    v60[4] = v49;
    LODWORD(v30) = LODWORD(self[1]._timestamp);
    int v31 = [NSNumber numberWithFloat:v30];
    v60[5] = v31;
    LODWORD(v32) = self[1]._calibrationDictionary;
    unsigned int v33 = [NSNumber numberWithFloat:v32];
    v60[6] = v33;
    LODWORD(v34) = HIDWORD(self[1]._calibrationDictionary);
    unsigned int v35 = [NSNumber numberWithFloat:v34];
    v60[7] = v35;
    LODWORD(v36) = self[1]._calibrationData;
    int v37 = [NSNumber numberWithFloat:v36];
    v60[8] = v37;
    LODWORD(v38) = self[1]._lensDistortionLookupTable;
    v39 = [NSNumber numberWithFloat:v38];
    v60[9] = v39;
    LODWORD(v40) = HIDWORD(self[1]._lensDistortionLookupTable);
    v41 = [NSNumber numberWithFloat:v40];
    v60[10] = v41;
    LODWORD(v42) = self[1]._inverseLensDistortionLookupTable;
    CGFloat v43 = [NSNumber numberWithFloat:v42];
    v60[11] = v43;
    v44 = [MEMORY[0x263EFF8C0] arrayWithObjects:v60 count:12];

    [v4 encodeObject:v44 forKey:@"em"];
    *(float *)&double v45 = self->_pixelSize;
    [v4 encodeFloat:@"ps" forKey:v45];
    [v4 encodeObject:self->_lensDistortionLookupTable forKey:@"ldlt"];
    [v4 encodeObject:self->_inverseLensDistortionLookupTable forKey:@"ildlt"];
    v46 = [NSNumber numberWithDouble:self->_lensDistortionCenter.x];
    v59[0] = v46;
    v47 = [NSNumber numberWithDouble:self->_lensDistortionCenter.y];
    v59[1] = v47;
    v48 = [MEMORY[0x263EFF8C0] arrayWithObjects:v59 count:2];
    [v4 encodeObject:v48 forKey:@"ldc"];

    int v5 = v58;
  }
}

- (id)dictionary
{
  v73[2] = *MEMORY[0x263EF8340];
  v3 = (void *)MEMORY[0x263EFF9A0];
  streamID = self->_streamID;
  v72[1] = @"t";
  v73[0] = streamID;
  v72[0] = @"si";
  int v5 = [NSNumber numberWithDouble:self->_timestamp];
  v73[1] = v5;
  double v6 = [NSDictionary dictionaryWithObjects:v73 forKeys:v72 count:2];
  uint64_t v7 = [v3 dictionaryWithDictionary:v6];

  calibrationDictionary = self->_calibrationDictionary;
  if (calibrationDictionary)
  {
    [v7 setObject:calibrationDictionary forKeyedSubscript:@"d"];
  }
  else
  {
    LODWORD(v8) = *(_DWORD *)self->_anon_60;
    unsigned int v63 = [NSNumber numberWithFloat:v8];
    v71[0] = v63;
    LODWORD(v10) = *(_DWORD *)&self->_anon_60[4];
    CGFloat v11 = [NSNumber numberWithFloat:v10];
    v71[1] = v11;
    LODWORD(v12) = *(_DWORD *)&self->_anon_60[8];
    float v13 = [NSNumber numberWithFloat:v12];
    v71[2] = v13;
    LODWORD(v14) = *(_DWORD *)&self->_anon_60[16];
    id v15 = [NSNumber numberWithFloat:v14];
    v71[3] = v15;
    LODWORD(v16) = *(_DWORD *)&self->_anon_60[20];
    v17 = [NSNumber numberWithFloat:v16];
    v71[4] = v17;
    LODWORD(v18) = *(_DWORD *)&self->_anon_60[24];
    unsigned int v19 = [NSNumber numberWithFloat:v18];
    v71[5] = v19;
    LODWORD(v20) = *(_DWORD *)&self->_anon_60[32];
    unsigned int v21 = [NSNumber numberWithFloat:v20];
    v71[6] = v21;
    LODWORD(v22) = *(_DWORD *)&self->_anon_60[36];
    int v23 = [NSNumber numberWithFloat:v22];
    v71[7] = v23;
    LODWORD(v24) = *(_DWORD *)&self->_anon_60[40];
    double v25 = [NSNumber numberWithFloat:v24];
    v71[8] = v25;
    unsigned int v65 = [MEMORY[0x263EFF8C0] arrayWithObjects:v71 count:9];

    LODWORD(v26) = self[1].super.isa;
    v64 = [NSNumber numberWithFloat:v26];
    v70[0] = v64;
    LODWORD(v27) = HIDWORD(self[1].super.isa);
    v62 = [NSNumber numberWithFloat:v27];
    v70[1] = v62;
    *(float *)&double v28 = self[1]._pixelSize;
    int v61 = [NSNumber numberWithFloat:v28];
    v70[2] = v61;
    LODWORD(v29) = self[1]._streamID;
    int v60 = [NSNumber numberWithFloat:v29];
    v70[3] = v60;
    LODWORD(v30) = HIDWORD(self[1]._streamID);
    v59 = [NSNumber numberWithFloat:v30];
    v70[4] = v59;
    LODWORD(v31) = LODWORD(self[1]._timestamp);
    double v32 = [NSNumber numberWithFloat:v31];
    v70[5] = v32;
    LODWORD(v33) = self[1]._calibrationDictionary;
    double v34 = [NSNumber numberWithFloat:v33];
    v70[6] = v34;
    LODWORD(v35) = HIDWORD(self[1]._calibrationDictionary);
    double v36 = [NSNumber numberWithFloat:v35];
    v70[7] = v36;
    LODWORD(v37) = self[1]._calibrationData;
    double v38 = [NSNumber numberWithFloat:v37];
    v70[8] = v38;
    LODWORD(v39) = self[1]._lensDistortionLookupTable;
    double v40 = [NSNumber numberWithFloat:v39];
    v70[9] = v40;
    LODWORD(v41) = HIDWORD(self[1]._lensDistortionLookupTable);
    double v42 = [NSNumber numberWithFloat:v41];
    v70[10] = v42;
    LODWORD(v43) = self[1]._inverseLensDistortionLookupTable;
    v44 = [NSNumber numberWithFloat:v43];
    v70[11] = v44;
    unsigned int v58 = [MEMORY[0x263EFF8C0] arrayWithObjects:v70 count:12];

    v69[0] = v65;
    v68[0] = @"im";
    v68[1] = @"imrd";
    double v45 = [NSNumber numberWithDouble:self->_intrinsicMatrixReferenceDimensions.width];
    v67[0] = v45;
    v46 = [NSNumber numberWithDouble:self->_intrinsicMatrixReferenceDimensions.height];
    v67[1] = v46;
    v47 = [MEMORY[0x263EFF8C0] arrayWithObjects:v67 count:2];
    v69[1] = v47;
    v69[2] = v58;
    v68[2] = @"em";
    v68[3] = @"ps";
    *(float *)&double v48 = self->_pixelSize;
    unsigned int v49 = [NSNumber numberWithFloat:v48];
    lensDistortionLookupTable = self->_lensDistortionLookupTable;
    inverseLensDistortionLookupTable = self->_inverseLensDistortionLookupTable;
    v69[3] = v49;
    v69[4] = lensDistortionLookupTable;
    v68[4] = @"ldlt";
    v68[5] = @"ildlt";
    v69[5] = inverseLensDistortionLookupTable;
    v68[6] = @"ldc";
    v52 = [NSNumber numberWithDouble:self->_lensDistortionCenter.x];
    v66[0] = v52;
    float v53 = [NSNumber numberWithDouble:self->_lensDistortionCenter.y];
    v66[1] = v53;
    float v54 = [MEMORY[0x263EFF8C0] arrayWithObjects:v66 count:2];
    v69[6] = v54;
    v55 = [NSDictionary dictionaryWithObjects:v69 forKeys:v68 count:7];
    [v7 addEntriesFromDictionary:v55];
  }
  unsigned int v56 = [NSDictionary dictionaryWithDictionary:v7];

  return v56;
}

- (id)debugDescription
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  int v5 = [(CVACameraCalibrationData *)self dictionary];
  double v6 = [v3 stringWithFormat:@"<%@: %@>", v4, v5];

  return v6;
}

- (NSString)streamID
{
  return self->_streamID;
}

- (void)setStreamID:(id)a3
{
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

- (NSDictionary)calibrationDictionary
{
  return self->_calibrationDictionary;
}

- (void)setCalibrationDictionary:(id)a3
{
}

- (AVCameraCalibrationData)calibrationData
{
  return self->_calibrationData;
}

- (void)setCalibrationData:(id)a3
{
}

- (__n128)intrinsicMatrix
{
  return a1[6];
}

- (__n128)setIntrinsicMatrix:(__n128)a3
{
  result[6] = a2;
  result[7] = a3;
  result[8] = a4;
  return result;
}

- (CGSize)intrinsicMatrixReferenceDimensions
{
  double width = self->_intrinsicMatrixReferenceDimensions.width;
  double height = self->_intrinsicMatrixReferenceDimensions.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setIntrinsicMatrixReferenceDimensions:(CGSize)a3
{
  self->_intrinsicMatrixReferenceDimensions = a3;
}

- (__n128)extrinsicMatrix
{
  return a1[9];
}

- (__n128)setExtrinsicMatrix:(__n128)a3
{
  result[9] = a2;
  result[10] = a3;
  result[11] = a4;
  result[12] = a5;
  return result;
}

- (float)pixelSize
{
  return self->_pixelSize;
}

- (void)setPixelSize:(float)a3
{
  self->_pixelSize = a3;
}

- (NSData)lensDistortionLookupTable
{
  return self->_lensDistortionLookupTable;
}

- (void)setLensDistortionLookupTable:(id)a3
{
}

- (NSData)inverseLensDistortionLookupTable
{
  return self->_inverseLensDistortionLookupTable;
}

- (void)setInverseLensDistortionLookupTable:(id)a3
{
}

- (CGPoint)lensDistortionCenter
{
  double x = self->_lensDistortionCenter.x;
  double y = self->_lensDistortionCenter.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setLensDistortionCenter:(CGPoint)a3
{
  self->_lensDistortionCenter = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inverseLensDistortionLookupTable, 0);
  objc_storeStrong((id *)&self->_lensDistortionLookupTable, 0);
  objc_storeStrong((id *)&self->_calibrationData, 0);
  objc_storeStrong((id *)&self->_calibrationDictionary, 0);
  objc_storeStrong((id *)&self->_streamID, 0);
}

@end
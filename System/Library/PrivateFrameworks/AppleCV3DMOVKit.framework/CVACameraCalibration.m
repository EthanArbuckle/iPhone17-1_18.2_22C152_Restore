@interface CVACameraCalibration
+ (BOOL)supportsSecureCoding;
+ (id)classes;
- (CVACameraCalibration)initWithCoder:(id)a3;
- (NSArray)cameraToIMURotation;
- (NSArray)cameraToIMUTranslation;
- (NSArray)chipOffset;
- (NSArray)lensOffset;
- (NSArray)radialDistortion;
- (NSArray)tangentialDistortion;
- (NSNumber)readoutTime;
- (NSString)metadataID;
- (double)focalLengthX;
- (double)focalLengthY;
- (double)principalPointX;
- (double)principalPointY;
- (double)timestampCorrection;
- (id)debugDescription;
- (id)dictionary;
- (int64_t)lensDistortionModel;
- (unsigned)imageHeight;
- (unsigned)imageWidth;
- (void)encodeWithCoder:(id)a3;
- (void)setCameraToIMURotation:(id)a3;
- (void)setCameraToIMUTranslation:(id)a3;
- (void)setChipOffset:(id)a3;
- (void)setFocalLengthX:(double)a3;
- (void)setFocalLengthY:(double)a3;
- (void)setImageHeight:(unsigned int)a3;
- (void)setImageWidth:(unsigned int)a3;
- (void)setLensDistortionModel:(int64_t)a3;
- (void)setLensOffset:(id)a3;
- (void)setMetadataID:(id)a3;
- (void)setPrincipalPointX:(double)a3;
- (void)setPrincipalPointY:(double)a3;
- (void)setRadialDistortion:(id)a3;
- (void)setReadoutTime:(id)a3;
- (void)setTangentialDistortion:(id)a3;
- (void)setTimestampCorrection:(double)a3;
@end

@implementation CVACameraCalibration

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)classes
{
  if (qword_267C58B78 == -1)
  {
    v2 = (void *)qword_267C58B70;
  }
  else
  {
    dispatch_once(&qword_267C58B78, &unk_26CB5E2D8);
    v2 = (void *)qword_267C58B70;
  }
  return v2;
}

- (CVACameraCalibration)initWithCoder:(id)a3
{
  id v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)CVACameraCalibration;
  v5 = [(CVACameraCalibration *)&v29 init];
  if (v5)
  {
    v6 = (void *)MEMORY[0x21D490BF0]();
    uint64_t v7 = [v4 decodeObjectForKey:@"id"];
    metadataID = v5->_metadataID;
    v5->_metadataID = (NSString *)v7;

    v5->_imageWidth = [v4 decodeIntForKey:@"w"];
    v5->_imageHeight = [v4 decodeIntForKey:@"h"];
    [v4 decodeDoubleForKey:@"px"];
    v5->_principalPointX = v9;
    [v4 decodeDoubleForKey:@"py"];
    v5->_principalPointY = v10;
    [v4 decodeDoubleForKey:@"fx"];
    v5->_focalLengthX = v11;
    [v4 decodeDoubleForKey:@"fy"];
    v5->_focalLengthY = v12;
    v5->_lensDistortionModel = [v4 decodeIntegerForKey:@"dm"];
    uint64_t v13 = [v4 decodeObjectForKey:@"rd"];
    radialDistortion = v5->_radialDistortion;
    v5->_radialDistortion = (NSArray *)v13;

    uint64_t v15 = [v4 decodeObjectForKey:@"td"];
    tangentialDistortion = v5->_tangentialDistortion;
    v5->_tangentialDistortion = (NSArray *)v15;

    uint64_t v17 = [v4 decodeObjectForKey:@"lo"];
    lensOffset = v5->_lensOffset;
    v5->_lensOffset = (NSArray *)v17;

    uint64_t v19 = [v4 decodeObjectForKey:@"co"];
    chipOffset = v5->_chipOffset;
    v5->_chipOffset = (NSArray *)v19;

    [v4 decodeDoubleForKey:@"tc"];
    v5->_timestampCorrection = v21;
    uint64_t v22 = [v4 decodeObjectForKey:@"rt"];
    readoutTime = v5->_readoutTime;
    v5->_readoutTime = (NSNumber *)v22;

    uint64_t v24 = [v4 decodeObjectForKey:@"r"];
    cameraToIMURotation = v5->_cameraToIMURotation;
    v5->_cameraToIMURotation = (NSArray *)v24;

    uint64_t v26 = [v4 decodeObjectForKey:@"t"];
    cameraToIMUTranslation = v5->_cameraToIMUTranslation;
    v5->_cameraToIMUTranslation = (NSArray *)v26;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  id v4 = (void *)MEMORY[0x21D490BF0]();
  [v5 encodeObject:self->_metadataID forKey:@"id"];
  [v5 encodeInteger:self->_imageWidth forKey:@"w"];
  [v5 encodeInteger:self->_imageHeight forKey:@"h"];
  [v5 encodeDouble:@"px" forKey:self->_principalPointX];
  [v5 encodeDouble:@"py" forKey:self->_principalPointY];
  [v5 encodeDouble:@"fx" forKey:self->_focalLengthX];
  [v5 encodeDouble:@"fy" forKey:self->_focalLengthY];
  [v5 encodeInteger:self->_lensDistortionModel forKey:@"dm"];
  [v5 encodeObject:self->_radialDistortion forKey:@"rd"];
  [v5 encodeObject:self->_tangentialDistortion forKey:@"td"];
  [v5 encodeObject:self->_lensOffset forKey:@"lo"];
  [v5 encodeObject:self->_chipOffset forKey:@"co"];
  [v5 encodeDouble:@"tc" forKey:self->_timestampCorrection];
  [v5 encodeObject:self->_readoutTime forKey:@"rt"];
  [v5 encodeObject:self->_cameraToIMURotation forKey:@"r"];
  [v5 encodeObject:self->_cameraToIMUTranslation forKey:@"t"];
}

- (id)dictionary
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  v16[0] = self->_metadataID;
  v3 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", self->_imageWidth, @"id", @"w");
  v16[1] = v3;
  v15[2] = @"h";
  id v4 = [NSNumber numberWithUnsignedInt:self->_imageHeight];
  v16[2] = v4;
  v15[3] = @"px";
  id v5 = [NSNumber numberWithDouble:self->_principalPointX];
  v16[3] = v5;
  v15[4] = @"py";
  v6 = [NSNumber numberWithDouble:self->_principalPointY];
  v16[4] = v6;
  v15[5] = @"fx";
  uint64_t v7 = [NSNumber numberWithDouble:self->_focalLengthX];
  v16[5] = v7;
  v15[6] = @"fy";
  v8 = [NSNumber numberWithDouble:self->_focalLengthY];
  v16[6] = v8;
  v15[7] = @"dm";
  double v9 = [NSNumber numberWithInteger:self->_lensDistortionModel];
  radialDistortion = self->_radialDistortion;
  v16[7] = v9;
  v16[8] = radialDistortion;
  v15[8] = @"rd";
  v15[9] = @"td";
  long long v17 = *(_OWORD *)&self->_tangentialDistortion;
  v15[10] = @"lo";
  v15[11] = @"co";
  chipOffset = self->_chipOffset;
  v15[12] = @"tc";
  double v11 = [NSNumber numberWithDouble:self->_timestampCorrection];
  long long v20 = *(_OWORD *)&self->_readoutTime;
  v15[13] = @"rt";
  v15[14] = @"r";
  v15[15] = @"t";
  cameraToIMUTranslation = self->_cameraToIMUTranslation;
  uint64_t v19 = v11;
  double v21 = cameraToIMUTranslation;
  uint64_t v13 = [NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:16];

  return v13;
}

- (id)debugDescription
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = [(CVACameraCalibration *)self dictionary];
  v6 = [v3 stringWithFormat:@"<%@: %@>", v4, v5];

  return v6;
}

- (NSString)metadataID
{
  return self->_metadataID;
}

- (void)setMetadataID:(id)a3
{
}

- (unsigned)imageWidth
{
  return self->_imageWidth;
}

- (void)setImageWidth:(unsigned int)a3
{
  self->_imageWidth = a3;
}

- (unsigned)imageHeight
{
  return self->_imageHeight;
}

- (void)setImageHeight:(unsigned int)a3
{
  self->_imageHeight = a3;
}

- (double)principalPointX
{
  return self->_principalPointX;
}

- (void)setPrincipalPointX:(double)a3
{
  self->_principalPointX = a3;
}

- (double)principalPointY
{
  return self->_principalPointY;
}

- (void)setPrincipalPointY:(double)a3
{
  self->_principalPointY = a3;
}

- (double)focalLengthX
{
  return self->_focalLengthX;
}

- (void)setFocalLengthX:(double)a3
{
  self->_focalLengthX = a3;
}

- (double)focalLengthY
{
  return self->_focalLengthY;
}

- (void)setFocalLengthY:(double)a3
{
  self->_focalLengthY = a3;
}

- (int64_t)lensDistortionModel
{
  return self->_lensDistortionModel;
}

- (void)setLensDistortionModel:(int64_t)a3
{
  self->_lensDistortionModel = a3;
}

- (NSArray)radialDistortion
{
  return self->_radialDistortion;
}

- (void)setRadialDistortion:(id)a3
{
}

- (NSArray)tangentialDistortion
{
  return self->_tangentialDistortion;
}

- (void)setTangentialDistortion:(id)a3
{
}

- (NSArray)lensOffset
{
  return self->_lensOffset;
}

- (void)setLensOffset:(id)a3
{
}

- (NSArray)chipOffset
{
  return self->_chipOffset;
}

- (void)setChipOffset:(id)a3
{
}

- (double)timestampCorrection
{
  return self->_timestampCorrection;
}

- (void)setTimestampCorrection:(double)a3
{
  self->_timestampCorrection = a3;
}

- (NSNumber)readoutTime
{
  return self->_readoutTime;
}

- (void)setReadoutTime:(id)a3
{
}

- (NSArray)cameraToIMURotation
{
  return self->_cameraToIMURotation;
}

- (void)setCameraToIMURotation:(id)a3
{
}

- (NSArray)cameraToIMUTranslation
{
  return self->_cameraToIMUTranslation;
}

- (void)setCameraToIMUTranslation:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cameraToIMUTranslation, 0);
  objc_storeStrong((id *)&self->_cameraToIMURotation, 0);
  objc_storeStrong((id *)&self->_readoutTime, 0);
  objc_storeStrong((id *)&self->_chipOffset, 0);
  objc_storeStrong((id *)&self->_lensOffset, 0);
  objc_storeStrong((id *)&self->_tangentialDistortion, 0);
  objc_storeStrong((id *)&self->_radialDistortion, 0);
  objc_storeStrong((id *)&self->_metadataID, 0);
}

@end
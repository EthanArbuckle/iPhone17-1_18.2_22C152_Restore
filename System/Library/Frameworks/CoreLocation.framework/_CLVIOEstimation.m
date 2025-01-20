@interface _CLVIOEstimation
+ (BOOL)supportsSecureCoding;
- ($32BA332289ABAE23D53D73F2D068366F)inertialCovarianceInfo;
- ($32BA332289ABAE23D53D73F2D068366F)inertialStateInfo;
- (CGSize)cameraImageResolution;
- (NSData)inertialCovariance;
- (NSData)inertialState;
- (_CLVIOEstimation)initWithCoder:(id)a3;
- (__n128)cameraIntrinsics;
- (__n128)cameraPose;
- (__n128)setCameraIntrinsics:(__n128)a3;
- (__n128)setCameraPose:(__n128)a3;
- (double)originTimestamp;
- (double)timestamp;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)descriptionWithMemberIndent:(id)a3 endIndent:(id)a4;
- (int)trackingState;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setCameraImageResolution:(CGSize)a3;
- (void)setInertialCovariance:(id)a3;
- (void)setInertialCovarianceInfo:(id *)a3;
- (void)setInertialState:(id)a3;
- (void)setInertialStateInfo:(id *)a3;
- (void)setOriginTimestamp:(double)a3;
- (void)setTimestamp:(double)a3;
- (void)setTrackingState:(int)a3;
@end

@implementation _CLVIOEstimation

- (id)descriptionWithMemberIndent:(id)a3 endIndent:(id)a4
{
  uint64_t v7 = [a3 stringByAppendingString:@"\t"];
  v75 = NSString;
  uint64_t v74 = [(_CLVIOEstimation *)self trackingState];
  [(_CLVIOEstimation *)self originTimestamp];
  uint64_t v73 = v8;
  [(_CLVIOEstimation *)self timestamp];
  uint64_t v72 = v9;
  if (self)
  {
    [(_CLVIOEstimation *)self inertialStateInfo];
    uint64_t v71 = v79;
    [(_CLVIOEstimation *)self inertialStateInfo];
    uint64_t v70 = v78;
  }
  else
  {
    uint64_t v70 = 0;
    uint64_t v71 = 0;
  }
  v10 = [(_CLVIOEstimation *)self inertialState];
  v11 = [(_CLVIOEstimation *)self inertialState];
  if (self)
  {
    [(_CLVIOEstimation *)self inertialCovarianceInfo];
    uint64_t v12 = v77;
    [(_CLVIOEstimation *)self inertialCovarianceInfo];
    uint64_t v13 = v76;
  }
  else
  {
    uint64_t v13 = 0;
    uint64_t v12 = 0;
  }
  v14 = [(_CLVIOEstimation *)self inertialCovariance];
  v15 = [(_CLVIOEstimation *)self inertialCovariance];
  [(_CLVIOEstimation *)self cameraPose];
  double v69 = v16;
  [(_CLVIOEstimation *)self cameraPose];
  double v68 = v17;
  [(_CLVIOEstimation *)self cameraPose];
  double v67 = v18;
  [(_CLVIOEstimation *)self cameraPose];
  double v66 = v19;
  [(_CLVIOEstimation *)self cameraPose];
  double v65 = v20;
  [(_CLVIOEstimation *)self cameraPose];
  double v64 = v21;
  [(_CLVIOEstimation *)self cameraPose];
  double v63 = v22;
  [(_CLVIOEstimation *)self cameraPose];
  double v62 = v23;
  [(_CLVIOEstimation *)self cameraPose];
  double v61 = v24;
  [(_CLVIOEstimation *)self cameraPose];
  double v60 = v25;
  [(_CLVIOEstimation *)self cameraPose];
  double v59 = v26;
  [(_CLVIOEstimation *)self cameraPose];
  double v58 = v27;
  [(_CLVIOEstimation *)self cameraPose];
  double v57 = v28;
  [(_CLVIOEstimation *)self cameraPose];
  double v56 = v29;
  [(_CLVIOEstimation *)self cameraPose];
  double v55 = v30;
  [(_CLVIOEstimation *)self cameraPose];
  double v54 = v31;
  [(_CLVIOEstimation *)self cameraIntrinsics];
  double v53 = v32;
  [(_CLVIOEstimation *)self cameraIntrinsics];
  double v52 = v33;
  [(_CLVIOEstimation *)self cameraIntrinsics];
  double v35 = v34;
  [(_CLVIOEstimation *)self cameraIntrinsics];
  double v37 = v36;
  [(_CLVIOEstimation *)self cameraIntrinsics];
  double v39 = v38;
  [(_CLVIOEstimation *)self cameraIntrinsics];
  double v41 = v40;
  [(_CLVIOEstimation *)self cameraIntrinsics];
  double v43 = v42;
  [(_CLVIOEstimation *)self cameraIntrinsics];
  double v45 = v44;
  [(_CLVIOEstimation *)self cameraIntrinsics];
  double v47 = v46;
  [(_CLVIOEstimation *)self cameraImageResolution];
  uint64_t v49 = v48;
  [(_CLVIOEstimation *)self cameraImageResolution];
  return (id)objc_msgSend(v75, "stringWithFormat:", @"<_CLVIOEstimation: %p> {\n%@.trackingState = %d,\n%@.originTimestamp = %f,\n%@.timestamp = %f,\n%@.inertialStateInfo = { .stateLengthInbytes = %lu, .stateLength = %d, ... },\n%@.inertialState = <NSData: %p> %@,\n%@.inertialCovarianceInfo = { .covarianceSizeInbytes = %lu, .covariance = %d, ... },\n%@.inertialCovariance = <NSData: %p> %@,\n%@.cameraPose = [%f, %f, %f, %f;\n%@%f, %f, %f, %f;\n%@%f, %f, %f, %f;\n%@%f, %f, %f, %f],\n%@.cameraIntrinsics = [%f, %f, %f;\n%@%f, %f, %f;\n%@%f, %f, %f],\n%@.cameraImageResolution = [%f, %f]\n%@}",
               self,
               a3,
               v74,
               a3,
               v73,
               a3,
               v72,
               a3,
               v71,
               v70,
               a3,
               v10,
               v11,
               a3,
               v12,
               v13,
               a3,
               v14,
               v15,
               a3,
               *(void *)&v69,
               *(void *)&v68,
               *(void *)&v67,
               *(void *)&v66,
               v7,
               *(void *)&v65,
               *(void *)&v64,
               *(void *)&v63,
               *(void *)&v62,
               v7,
               *(void *)&v61,
               *(void *)&v60,
               *(void *)&v59,
               *(void *)&v58,
               v7,
               *(void *)&v57,
               *(void *)&v56,
               *(void *)&v55,
               *(void *)&v54,
               a3,
               *(void *)&v53,
               *(void *)&v52,
               *(void *)&v35,
               v7,
               *(void *)&v37,
               *(void *)&v39,
               *(void *)&v41,
               v7,
               *(void *)&v43,
               *(void *)&v45,
               *(void *)&v47,
               a3,
               v49,
               v50,
               a4);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)_CLVIOEstimation;
  [(_CLVIOEstimation *)&v3 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(_DWORD *)(v5 + 8) = self->_trackingState;
  *(double *)(v5 + 16) = self->_originTimestamp;
  *(double *)(v5 + 24) = self->_timestamp;
  long long v6 = *(_OWORD *)&self->_inertialStateInfo.stateLengthInBytes;
  *(void *)(v5 + 80) = *(void *)&self->_inertialStateInfo.accelBiasLength;
  *(_OWORD *)(v5 + 64) = v6;
  *(void *)(v5 + 32) = [(NSData *)self->_inertialState copyWithZone:a3];
  uint64_t v7 = *(void *)&self->_inertialCovarianceInfo.accelBiasDof;
  *(_OWORD *)(v5 + 88) = *(_OWORD *)&self->_inertialCovarianceInfo.covarianceSizeInBytes;
  *(void *)(v5 + 104) = v7;
  *(void *)(v5 + 40) = [(NSData *)self->_inertialCovariance copyWithZone:a3];
  CGSize cameraImageResolution = self[1]._cameraImageResolution;
  long long v10 = *(_OWORD *)&self[1].super.isa;
  long long v9 = *(_OWORD *)&self[1]._originTimestamp;
  *(_OWORD *)(v5 + 192) = *(_OWORD *)&self[1]._inertialState;
  *(CGSize *)(v5 + 208) = cameraImageResolution;
  *(_OWORD *)(v5 + 160) = v10;
  *(_OWORD *)(v5 + 176) = v9;
  long long v12 = *(_OWORD *)&self->_anon_70[16];
  long long v11 = *(_OWORD *)&self->_anon_70[32];
  *(_OWORD *)(v5 + 112) = *(_OWORD *)self->_anon_70;
  *(_OWORD *)(v5 + 128) = v12;
  *(_OWORD *)(v5 + 144) = v11;
  *(CGSize *)(v5 + 48) = self->_cameraImageResolution;
  return (id)v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_CLVIOEstimation)initWithCoder:(id)a3
{
  v22.receiver = self;
  v22.super_class = (Class)_CLVIOEstimation;
  v4 = [(_CLVIOEstimation *)&v22 init];
  if (v4)
  {
    v4->_trackingState = [a3 decodeIntForKey:@"trackingState"];
    [a3 decodeDoubleForKey:@"originTimestamp"];
    v4->_originTimestamp = v5;
    [a3 decodeDoubleForKey:@"timestamp"];
    v4->_timestamp = v6;
    uint64_t v7 = (void *)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"inertialStateInfo"];
    if (!v7) {
      goto LABEL_20;
    }
    uint64_t v8 = v7;
    if ([v7 length] != 24) {
      goto LABEL_20;
    }
    [v8 getBytes:&v4->_inertialStateInfo length:24];
    long long v9 = (NSData *)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"inertialState"];
    if (v9)
    {
      long long v10 = v9;
      if ([(NSData *)v9 length] == v4->_inertialStateInfo.stateLengthInBytes) {
        long long v9 = v10;
      }
      else {
        long long v9 = 0;
      }
    }
    v4->_inertialState = v9;
    long long v11 = (void *)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"inertialCovarianceInfo"];
    if (!v11) {
      goto LABEL_20;
    }
    long long v12 = v11;
    if ([v11 length] != 24) {
      goto LABEL_20;
    }
    [v12 getBytes:&v4->_inertialCovarianceInfo length:24];
    uint64_t v13 = (NSData *)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"inertialCovariance"];
    if (v13)
    {
      v14 = v13;
      if ([(NSData *)v13 length] == v4->_inertialCovarianceInfo.covarianceSizeInBytes) {
        uint64_t v13 = v14;
      }
      else {
        uint64_t v13 = 0;
      }
    }
    v4->_inertialCovariance = v13;
    v15 = (void *)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"cameraPose"];
    if (!v15) {
      goto LABEL_20;
    }
    float v16 = v15;
    if ([v15 length] == 64
      && ([v16 getBytes:&v4[1] length:64],
          (float v17 = (void *)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"cameraIntrinsics"]) != 0)
      && (float v18 = v17, [v17 length] == 48)
      && ([v18 getBytes:v4->_anon_70 length:48],
          (float v19 = (void *)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"cameraImageResolutionKey"]) != 0)
      && (float v20 = v19, !strcmp((const char *)[v19 objCType], "{CGSize=dd}")))
    {
      [v20 getValue:&v4->_cameraImageResolution];
    }
    else
    {
LABEL_20:

      return 0;
    }
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  [a3 encodeInt:self->_trackingState forKey:@"trackingState"];
  [a3 encodeDouble:@"originTimestamp" forKey:self->_originTimestamp];
  [a3 encodeDouble:@"timestamp" forKey:self->_timestamp];
  objc_msgSend(a3, "encodeObject:forKey:", objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytes:length:", &self->_inertialStateInfo, 24), @"inertialStateInfo");
  [a3 encodeObject:self->_inertialState forKey:@"inertialState"];
  objc_msgSend(a3, "encodeObject:forKey:", objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytes:length:", &self->_inertialCovarianceInfo, 24), @"inertialCovarianceInfo");
  [a3 encodeObject:self->_inertialCovariance forKey:@"inertialCovariance"];
  objc_msgSend(a3, "encodeObject:forKey:", objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytes:length:", &self[1], 64), @"cameraPose");
  objc_msgSend(a3, "encodeObject:forKey:", objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytes:length:", self->_anon_70, 48), @"cameraIntrinsics");
  uint64_t v5 = [MEMORY[0x1E4F29238] value:&self->_cameraImageResolution withObjCType:"{CGSize=dd}"];

  [a3 encodeObject:v5 forKey:@"cameraImageResolutionKey"];
}

- (id)description
{
  return [(_CLVIOEstimation *)self descriptionWithMemberIndent:@"\t" endIndent:&stru_1EE006720];
}

- (int)trackingState
{
  return self->_trackingState;
}

- (void)setTrackingState:(int)a3
{
  self->_trackingState = a3;
}

- (double)originTimestamp
{
  return self->_originTimestamp;
}

- (void)setOriginTimestamp:(double)a3
{
  self->_originTimestamp = a3;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

- ($32BA332289ABAE23D53D73F2D068366F)inertialStateInfo
{
  *($D63A2728CA9665032051242DAECBF9E9 *)retstr = *($D63A2728CA9665032051242DAECBF9E9 *)((char *)self + 64);
  return self;
}

- (void)setInertialStateInfo:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0;
  *(void *)&self->_inertialStateInfo.accelBiasLength = *(void *)&a3->var9;
  *(_OWORD *)&self->_inertialStateInfo.stateLengthInBytes = v3;
}

- (NSData)inertialState
{
  return self->_inertialState;
}

- (void)setInertialState:(id)a3
{
}

- ($32BA332289ABAE23D53D73F2D068366F)inertialCovarianceInfo
{
  *($3FD82D8236BD1EB6D0991DFE4CE69973 *)retstr = *($3FD82D8236BD1EB6D0991DFE4CE69973 *)((char *)self + 88);
  return self;
}

- (void)setInertialCovarianceInfo:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0;
  *(void *)&self->_inertialCovarianceInfo.accelBiasDof = *(void *)&a3->var9;
  *(_OWORD *)&self->_inertialCovarianceInfo.covarianceSizeInBytes = v3;
}

- (NSData)inertialCovariance
{
  return self->_inertialCovariance;
}

- (void)setInertialCovariance:(id)a3
{
}

- (__n128)cameraPose
{
  return a1[10];
}

- (__n128)setCameraPose:(__n128)a3
{
  result[10] = a2;
  result[11] = a3;
  result[12] = a4;
  result[13] = a5;
  return result;
}

- (__n128)cameraIntrinsics
{
  return a1[7];
}

- (__n128)setCameraIntrinsics:(__n128)a3
{
  result[7] = a2;
  result[8] = a3;
  result[9] = a4;
  return result;
}

- (CGSize)cameraImageResolution
{
  double width = self->_cameraImageResolution.width;
  double height = self->_cameraImageResolution.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setCameraImageResolution:(CGSize)a3
{
  self->_CGSize cameraImageResolution = a3;
}

@end
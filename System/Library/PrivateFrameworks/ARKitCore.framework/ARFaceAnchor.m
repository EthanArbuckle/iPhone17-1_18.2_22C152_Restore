@interface ARFaceAnchor
+ (BOOL)supportsSecureCoding;
+ (id)blendShapeMapping;
+ (id)blendShapeToMirroredBlendShapeMapping;
+ (id)mirroredBlendShapeMapping;
- (ARFaceAnchor)initWithAnchor:(id)a3;
- (ARFaceAnchor)initWithCoder:(id)a3;
- (ARFaceAnchor)initWithExistingFaceAnchor:(id)a3 tracked:(BOOL)a4 trackingError:(id)a5;
- (ARFaceAnchor)initWithIdentifier:(id)a3 faceTrackingData:(id)a4;
- (ARFaceGeometry)geometry;
- (ARFaceTrackingDataProtocol)trackingData;
- (BOOL)isEqualToFaceAnchor:(id)a3;
- (BOOL)isTracked;
- (NSDictionary)blendShapes;
- (NSError)trackingError;
- (NSString)debugDescription;
- (id)copyWithTrackedState:(BOOL)a3;
- (id)faceTrackingData;
- (simd_float3)lookAtPoint;
- (simd_float4x4)leftEyeTransform;
- (simd_float4x4)rightEyeTransform;
- (uint64_t)gazePoint;
- (uint64_t)imageVertices;
- (void)encodeWithCoder:(id)a3;
- (void)setIsTracked:(BOOL)a3;
- (void)setTrackingData:(id)a3;
- (void)setTrackingError:(id)a3;
@end

@implementation ARFaceAnchor

- (ARFaceAnchor)initWithIdentifier:(id)a3 faceTrackingData:(id)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v32 = a3;
  id v6 = a4;
  if (ARFaceAnchorInitializeMaps(void)::onceToken != -1) {
    dispatch_once(&ARFaceAnchorInitializeMaps(void)::onceToken, &__block_literal_global_297);
  }
  if (!+[ARFaceTrackingTechnique isSupported]
    && !+[ARFaceTrackingInternalTechnique isSupported])
  {
    if (_ARLogGeneral(void)::onceToken != -1) {
      dispatch_once(&_ARLogGeneral(void)::onceToken, &__block_literal_global_300);
    }
    v21 = (id)_ARLogGeneral(void)::logObj;
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      v22 = (objc_class *)objc_opt_class();
      v23 = NSStringFromClass(v22);
      *(_DWORD *)buf = 138543618;
      v35 = v23;
      __int16 v36 = 2048;
      v37 = self;
      _os_log_impl(&dword_1B88A2000, v21, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Face tracking is not available.", buf, 0x16u);
    }
    goto LABEL_17;
  }
  if (![v6 isValid])
  {
LABEL_17:
    v24 = 0;
    goto LABEL_23;
  }
  [v6 transform];
  v33.receiver = self;
  v33.super_class = (Class)ARFaceAnchor;
  v7 = -[ARAnchor initWithIdentifier:transform:](&v33, sel_initWithIdentifier_transform_, v32);
  v8 = v7;
  v9 = v7;
  if (v7)
  {
    [(ARFaceAnchor *)v7 setIsTracked:1];
    p_trackingData = (id *)&v8->_trackingData;
    objc_storeStrong(p_trackingData, a4);
    v11 = [[ARFaceGeometry alloc] initWithFaceTrackingDataProtocol:*p_trackingData];
    geometry = v9->_geometry;
    v9->_geometry = v11;

    v13 = (NSDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(*p_trackingData, "blendShapeCoefficientsCount"));
    uint64_t v14 = [*p_trackingData blendShapeCoefficients];
    for (unint64_t i = 0; [*p_trackingData blendShapeCoefficientsCount] > i; ++i)
    {
      v16 = (void *)_indexToBlendShapeLocationMap;
      v17 = [NSNumber numberWithInt:i];
      v18 = [v16 objectForKeyedSubscript:v17];

      if (v18)
      {
        LODWORD(v19) = *(_DWORD *)(v14 + 4 * i);
        v20 = [NSNumber numberWithFloat:v19];
        [(NSDictionary *)v13 setObject:v20 forKey:v18];
      }
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v25 = (NSError *)v6;
      v26 = NSNumber;
      [(NSError *)v25 tongueOut];
      v27 = objc_msgSend(v26, "numberWithFloat:");
      uint64_t v28 = [(NSError *)v25 trackingError];
      trackingError = v9->_trackingError;
      v9->_trackingError = (NSError *)v28;
    }
    else
    {
      v25 = v9->_trackingError;
      v9->_trackingError = 0;
      v27 = &unk_1F125BAC8;
    }

    [(NSDictionary *)v13 setObject:v27 forKey:@"tongueOut"];
    blendShapeCoefficientsDictionary = v9->_blendShapeCoefficientsDictionary;
    v9->_blendShapeCoefficientsDictionary = v13;
  }
  self = v9;
  v24 = self;
LABEL_23:

  return v24;
}

- (ARFaceAnchor)initWithExistingFaceAnchor:(id)a3 tracked:(BOOL)a4 trackingError:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  v10 = [(ARFaceAnchor *)self initWithAnchor:v8];
  v11 = v10;
  if (v10)
  {
    [(ARFaceAnchor *)v10 setIsTracked:v6];
    objc_storeStrong((id *)&v11->_trackingError, a5);
  }

  return v11;
}

- (id)faceTrackingData
{
  return self->_trackingData;
}

- (id)copyWithTrackedState:(BOOL)a3
{
  BOOL v3 = a3;
  v4 = (void *)[(ARFaceAnchor *)self copy];
  v5 = v4;
  if (v4 && [v4 isTracked] != v3) {
    [v5 setIsTracked:v3];
  }
  return v5;
}

- (NSDictionary)blendShapes
{
  return self->_blendShapeCoefficientsDictionary;
}

- (uint64_t)imageVertices
{
  return [*(id *)(a1 + 200) imageVertices];
}

- (ARFaceTrackingDataProtocol)trackingData
{
  return (ARFaceTrackingDataProtocol *)[(ARFaceTrackingDataProtocol *)self->_trackingData trackingData];
}

+ (id)blendShapeMapping
{
  if (ARFaceAnchorInitializeMaps(void)::onceToken != -1) {
    dispatch_once(&ARFaceAnchorInitializeMaps(void)::onceToken, &__block_literal_global_297);
  }
  v2 = (void *)_blendShapeLocationToIndexMap;
  return v2;
}

+ (id)mirroredBlendShapeMapping
{
  if (+[ARFaceAnchor mirroredBlendShapeMapping]::onceToken != -1) {
    dispatch_once(&+[ARFaceAnchor mirroredBlendShapeMapping]::onceToken, &__block_literal_global_105);
  }
  v2 = (void *)+[ARFaceAnchor mirroredBlendShapeMapping]::mirroredBlendShapeMapping;
  return v2;
}

void __41__ARFaceAnchor_mirroredBlendShapeMapping__block_invoke()
{
  v55[51] = *MEMORY[0x1E4F143B8];
  v0 = +[ARFaceAnchor blendShapeMapping];
  v54[0] = @"browDown_L";
  v53 = [v0 objectForKeyedSubscript:@"browDown_R"];
  v55[0] = v53;
  v54[1] = @"browDown_R";
  v52 = [v0 objectForKeyedSubscript:@"browDown_L"];
  v55[1] = v52;
  v54[2] = @"browInnerUp";
  v51 = objc_msgSend(v0, "objectForKeyedSubscript:");
  v55[2] = v51;
  v54[3] = @"browOuterUp_L";
  v50 = [v0 objectForKeyedSubscript:@"browOuterUp_R"];
  v55[3] = v50;
  v54[4] = @"browOuterUp_R";
  v49 = [v0 objectForKeyedSubscript:@"browOuterUp_L"];
  v55[4] = v49;
  v54[5] = @"cheekPuff";
  v48 = objc_msgSend(v0, "objectForKeyedSubscript:");
  v55[5] = v48;
  v54[6] = @"cheekSquint_L";
  v47 = [v0 objectForKeyedSubscript:@"cheekSquint_R"];
  v55[6] = v47;
  v54[7] = @"cheekSquint_R";
  v46 = [v0 objectForKeyedSubscript:@"cheekSquint_L"];
  v55[7] = v46;
  v54[8] = @"eyeBlink_L";
  v45 = [v0 objectForKeyedSubscript:@"eyeBlink_R"];
  v55[8] = v45;
  v54[9] = @"eyeBlink_R";
  v44 = [v0 objectForKeyedSubscript:@"eyeBlink_L"];
  v55[9] = v44;
  v54[10] = @"eyeLookDown_L";
  v43 = [v0 objectForKeyedSubscript:@"eyeLookDown_R"];
  v55[10] = v43;
  v54[11] = @"eyeLookDown_R";
  v42 = [v0 objectForKeyedSubscript:@"eyeLookDown_L"];
  v55[11] = v42;
  v54[12] = @"eyeLookIn_L";
  v41 = [v0 objectForKeyedSubscript:@"eyeLookIn_R"];
  v55[12] = v41;
  v54[13] = @"eyeLookIn_R";
  v40 = [v0 objectForKeyedSubscript:@"eyeLookIn_L"];
  v55[13] = v40;
  v54[14] = @"eyeLookOut_L";
  v39 = [v0 objectForKeyedSubscript:@"eyeLookOut_R"];
  v55[14] = v39;
  v54[15] = @"eyeLookOut_R";
  uint64_t v38 = [v0 objectForKeyedSubscript:@"eyeLookOut_L"];
  v55[15] = v38;
  v54[16] = @"eyeLookUp_L";
  v37 = [v0 objectForKeyedSubscript:@"eyeLookUp_R"];
  v55[16] = v37;
  v54[17] = @"eyeLookUp_R";
  __int16 v36 = [v0 objectForKeyedSubscript:@"eyeLookUp_L"];
  v55[17] = v36;
  v54[18] = @"eyeSquint_L";
  v35 = [v0 objectForKeyedSubscript:@"eyeSquint_R"];
  v55[18] = v35;
  v54[19] = @"eyeSquint_R";
  v34 = [v0 objectForKeyedSubscript:@"eyeSquint_L"];
  v55[19] = v34;
  v54[20] = @"eyeWide_L";
  objc_super v33 = [v0 objectForKeyedSubscript:@"eyeWide_R"];
  v55[20] = v33;
  v54[21] = @"eyeWide_R";
  id v32 = [v0 objectForKeyedSubscript:@"eyeWide_L"];
  v55[21] = v32;
  v54[22] = @"jawForward";
  v31 = objc_msgSend(v0, "objectForKeyedSubscript:");
  v55[22] = v31;
  v54[23] = @"jawLeft";
  v30 = [v0 objectForKeyedSubscript:@"jawRight"];
  v55[23] = v30;
  v54[24] = @"jawOpen";
  v29 = objc_msgSend(v0, "objectForKeyedSubscript:");
  v55[24] = v29;
  v54[25] = @"jawRight";
  uint64_t v28 = [v0 objectForKeyedSubscript:@"jawLeft"];
  v55[25] = v28;
  v54[26] = @"mouthClose";
  v27 = objc_msgSend(v0, "objectForKeyedSubscript:");
  v55[26] = v27;
  v54[27] = @"mouthDimple_L";
  v26 = [v0 objectForKeyedSubscript:@"mouthDimple_R"];
  v55[27] = v26;
  v54[28] = @"mouthDimple_R";
  v25 = [v0 objectForKeyedSubscript:@"mouthDimple_L"];
  v55[28] = v25;
  v54[29] = @"mouthFrown_L";
  v24 = [v0 objectForKeyedSubscript:@"mouthFrown_R"];
  v55[29] = v24;
  v54[30] = @"mouthFrown_R";
  v23 = [v0 objectForKeyedSubscript:@"mouthFrown_L"];
  v55[30] = v23;
  v54[31] = @"mouthFunnel";
  v22 = objc_msgSend(v0, "objectForKeyedSubscript:");
  v55[31] = v22;
  v54[32] = @"mouthLeft";
  v21 = [v0 objectForKeyedSubscript:@"mouthRight"];
  v55[32] = v21;
  v54[33] = @"mouthLowerDown_L";
  v20 = [v0 objectForKeyedSubscript:@"mouthLowerDown_R"];
  v55[33] = v20;
  v54[34] = @"mouthLowerDown_R";
  double v19 = [v0 objectForKeyedSubscript:@"mouthLowerDown_L"];
  v55[34] = v19;
  v54[35] = @"mouthPress_L";
  v18 = [v0 objectForKeyedSubscript:@"mouthPress_R"];
  v55[35] = v18;
  v54[36] = @"mouthPress_R";
  v17 = [v0 objectForKeyedSubscript:@"mouthPress_L"];
  v55[36] = v17;
  v54[37] = @"mouthPucker";
  v16 = objc_msgSend(v0, "objectForKeyedSubscript:");
  v55[37] = v16;
  v54[38] = @"mouthRight";
  v15 = [v0 objectForKeyedSubscript:@"mouthLeft"];
  v55[38] = v15;
  v54[39] = @"mouthRollLower";
  uint64_t v14 = objc_msgSend(v0, "objectForKeyedSubscript:");
  v55[39] = v14;
  v54[40] = @"mouthRollUpper";
  v13 = objc_msgSend(v0, "objectForKeyedSubscript:");
  v55[40] = v13;
  v54[41] = @"mouthShrugLower";
  v12 = objc_msgSend(v0, "objectForKeyedSubscript:");
  v55[41] = v12;
  v54[42] = @"mouthShrugUpper";
  v1 = objc_msgSend(v0, "objectForKeyedSubscript:");
  v55[42] = v1;
  v54[43] = @"mouthSmile_L";
  v2 = [v0 objectForKeyedSubscript:@"mouthSmile_R"];
  v55[43] = v2;
  v54[44] = @"mouthSmile_R";
  BOOL v3 = [v0 objectForKeyedSubscript:@"mouthSmile_L"];
  v55[44] = v3;
  v54[45] = @"mouthStretch_L";
  v4 = [v0 objectForKeyedSubscript:@"mouthStretch_R"];
  v55[45] = v4;
  v54[46] = @"mouthStretch_R";
  v5 = [v0 objectForKeyedSubscript:@"mouthStretch_L"];
  v55[46] = v5;
  v54[47] = @"mouthUpperUp_L";
  BOOL v6 = [v0 objectForKeyedSubscript:@"mouthUpperUp_R"];
  v55[47] = v6;
  v54[48] = @"mouthUpperUp_R";
  v7 = [v0 objectForKeyedSubscript:@"mouthUpperUp_L"];
  v55[48] = v7;
  v54[49] = @"noseSneer_L";
  id v8 = [v0 objectForKeyedSubscript:@"noseSneer_R"];
  v55[49] = v8;
  v54[50] = @"noseSneer_R";
  id v9 = [v0 objectForKeyedSubscript:@"noseSneer_L"];
  v55[50] = v9;
  uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v55 forKeys:v54 count:51];
  v11 = (void *)+[ARFaceAnchor mirroredBlendShapeMapping]::mirroredBlendShapeMapping;
  +[ARFaceAnchor mirroredBlendShapeMapping]::mirroredBlendShapeMapping = v10;
}

+ (id)blendShapeToMirroredBlendShapeMapping
{
  if (+[ARFaceAnchor blendShapeToMirroredBlendShapeMapping]::onceToken != -1) {
    dispatch_once(&+[ARFaceAnchor blendShapeToMirroredBlendShapeMapping]::onceToken, &__block_literal_global_164_0);
  }
  v2 = (void *)+[ARFaceAnchor blendShapeToMirroredBlendShapeMapping]::blendShapeToMirroredBlendShapeMapping;
  return v2;
}

void __53__ARFaceAnchor_blendShapeToMirroredBlendShapeMapping__block_invoke()
{
  v0 = +[ARFaceAnchor blendShapeMapping];
  v1 = +[ARFaceAnchor mirroredBlendShapeMapping];
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  BOOL v3 = (void *)+[ARFaceAnchor blendShapeToMirroredBlendShapeMapping]::blendShapeToMirroredBlendShapeMapping;
  +[ARFaceAnchor blendShapeToMirroredBlendShapeMapping]::blendShapeToMirroredBlendShapeMapping = (uint64_t)v2;

  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __53__ARFaceAnchor_blendShapeToMirroredBlendShapeMapping__block_invoke_2;
  v5[3] = &unk_1E6188308;
  id v4 = v1;
  id v6 = v4;
  [v0 enumerateKeysAndObjectsUsingBlock:v5];
}

void __53__ARFaceAnchor_blendShapeToMirroredBlendShapeMapping__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  v5 = [*(id *)(a1 + 32) objectForKeyedSubscript:a2];
  [(id)+[ARFaceAnchor blendShapeToMirroredBlendShapeMapping]::blendShapeToMirroredBlendShapeMapping setObject:v5 forKeyedSubscript:v6];
}

- (simd_float4x4)leftEyeTransform
{
  [(ARFaceTrackingDataProtocol *)self->_trackingData leftEyeTransform];
  result.columns[3].i64[1] = v9;
  result.columns[3].i64[0] = v8;
  result.columns[2].i64[1] = v7;
  result.columns[2].i64[0] = v6;
  result.columns[1].i64[1] = v5;
  result.columns[1].i64[0] = v4;
  result.columns[0].i64[1] = v3;
  result.columns[0].i64[0] = v2;
  return result;
}

- (simd_float4x4)rightEyeTransform
{
  [(ARFaceTrackingDataProtocol *)self->_trackingData rightEyeTransform];
  result.columns[3].i64[1] = v9;
  result.columns[3].i64[0] = v8;
  result.columns[2].i64[1] = v7;
  result.columns[2].i64[0] = v6;
  result.columns[1].i64[1] = v5;
  result.columns[1].i64[0] = v4;
  result.columns[0].i64[1] = v3;
  result.columns[0].i64[0] = v2;
  return result;
}

- (simd_float3)lookAtPoint
{
  [(ARFaceTrackingDataProtocol *)self->_trackingData gazePoint];
  return result;
}

- (uint64_t)gazePoint
{
  return [*(id *)(a1 + 200) gazePoint];
}

- (ARFaceAnchor)initWithAnchor:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ARFaceAnchor;
  uint64_t v5 = [(ARAnchor *)&v8 initWithAnchor:v4];
  uint64_t v6 = v5;
  if (v5)
  {
    v5->_isTracked = *((unsigned char *)v4 + 184);
    objc_storeStrong((id *)&v5->_trackingData, *((id *)v4 + 25));
    objc_storeStrong((id *)&v6->_geometry, *((id *)v4 + 24));
    objc_storeStrong((id *)&v6->_blendShapeCoefficientsDictionary, *((id *)v4 + 22));
    objc_storeStrong((id *)&v6->_trackingError, *((id *)v4 + 26));
  }

  return v6;
}

- (NSString)debugDescription
{
  return (NSString *)&stru_1F120C8F0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)ARFaceAnchor;
  [(ARAnchor *)&v5 encodeWithCoder:v4];
  [v4 encodeObject:self->_blendShapeCoefficientsDictionary forKey:@"blendShapeCoefficientsDictionary"];
  [v4 encodeObject:self->_trackingData forKey:@"trackingData"];
  [v4 encodeBool:self->_isTracked forKey:@"isTracked"];
  [v4 encodeObject:self->_trackingError forKey:@"trackingError"];
}

- (ARFaceAnchor)initWithCoder:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)ARFaceAnchor;
  objc_super v5 = [(ARAnchor *)&v22 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_msgSend(v6, "setWithObjects:", v7, v8, v9, objc_opt_class(), 0);
    uint64_t v11 = [v4 decodeObjectOfClasses:v10 forKey:@"blendShapeCoefficientsDictionary"];
    blendShapeCoefficientsDictionary = v5->_blendShapeCoefficientsDictionary;
    v5->_blendShapeCoefficientsDictionary = (NSDictionary *)v11;

    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"trackingData"];
    trackingData = v5->_trackingData;
    v5->_trackingData = (ARFaceTrackingDataProtocol *)v13;

    v5->_isTracked = [v4 decodeBoolForKey:@"isTracked"];
    uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"geometry"];
    geometry = v5->_geometry;
    v5->_geometry = (ARFaceGeometry *)v15;

    if (!v5->_geometry)
    {
      v17 = [[ARFaceGeometry alloc] initWithFaceTrackingDataProtocol:v5->_trackingData];
      v18 = v5->_geometry;
      v5->_geometry = v17;
    }
    uint64_t v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"trackingError"];
    trackingError = v5->_trackingError;
    v5->_trackingError = (NSError *)v19;
  }
  return v5;
}

- (BOOL)isEqualToFaceAnchor:(id)a3
{
  id v4 = (id *)a3;
  if ([v4[22] isEqualToDictionary:self->_blendShapeCoefficientsDictionary]
    && [v4[25] isEqual:self->_trackingData]
    && [v4[24] isEqual:self->_geometry])
  {
    int v5 = [v4 isTracked];
    int v6 = v5 ^ [(ARFaceAnchor *)self isTracked] ^ 1;
  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (ARFaceGeometry)geometry
{
  return self->_geometry;
}

- (void)setTrackingData:(id)a3
{
}

- (BOOL)isTracked
{
  return self->_isTracked;
}

- (void)setIsTracked:(BOOL)a3
{
  self->_isTracked = a3;
}

- (NSError)trackingError
{
  return self->_trackingError;
}

- (void)setTrackingError:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trackingError, 0);
  objc_storeStrong((id *)&self->_trackingData, 0);
  objc_storeStrong((id *)&self->_geometry, 0);
  objc_storeStrong((id *)&self->_blendShapeCoefficientsDictionary, 0);
}

@end
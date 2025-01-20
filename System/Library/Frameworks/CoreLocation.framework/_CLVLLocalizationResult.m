@interface _CLVLLocalizationResult
+ (BOOL)supportsSecureCoding;
- ($153C3A5BC4E016D58A1B9CA554FFC462)location;
- ($4ED12C4C7630B45462BF021B0F75306B)covariance;
- (_CLVLLocalizationDebugInfo)debugInfo;
- (_CLVLLocalizationResult)initWithCoder:(id)a3;
- (_CLVLLocalizationResult)initWithTimestamp:(double)a3 localizationResult:(id)a4;
- (__n128)setTransform:(long long *)a3;
- (__n128)transform;
- (double)timestamp;
- (float)confidence;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)descriptionWithMemberIndent:(id)a3 endIndent:(id)a4;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setConfidence:(float)a3;
- (void)setCovariance:(id *)a3;
- (void)setDebugInfo:(id)a3;
- (void)setLocation:(id)a3;
- (void)setTimestamp:(double)a3;
@end

@implementation _CLVLLocalizationResult

- (_CLVLLocalizationResult)initWithTimestamp:(double)a3 localizationResult:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  v20.receiver = self;
  v20.super_class = (Class)_CLVLLocalizationResult;
  v6 = [(_CLVLLocalizationResult *)&v20 init];
  v7 = v6;
  if (v6)
  {
    if (a4)
    {
      v6->_timestamp = a3;
      [a4 location];
      long long v9 = v22;
      long long v8 = v23;
      *(_OWORD *)v7->_anon_20 = v21;
      *(_OWORD *)&v7->_anon_20[16] = v9;
      *(_OWORD *)&v7->_anon_20[32] = v8;
      [a4 transform];
      long long v10 = v26;
      *(_OWORD *)&v7->_anon_50[64] = v25;
      *(_OWORD *)&v7->_anon_50[80] = v10;
      long long v11 = v28;
      *(_OWORD *)&v7->_anon_50[96] = v27;
      *(_OWORD *)&v7->_anon_50[112] = v11;
      long long v12 = v22;
      *(_OWORD *)v7->_anon_50 = v21;
      *(_OWORD *)&v7->_anon_50[16] = v12;
      long long v13 = v24;
      *(_OWORD *)&v7->_anon_50[32] = v23;
      *(_OWORD *)&v7->_anon_50[48] = v13;
      [a4 confidence];
      v7->_confidence = v14;
      [a4 covariance];
      long long v15 = v28;
      *(_OWORD *)&v7->_covariance.v[4][0] = v27;
      *(_OWORD *)&v7->_covariance.v[4][4] = v15;
      *(_OWORD *)&v7->_covariance.v[5][2] = v29;
      long long v16 = v24;
      *(_OWORD *)&v7->_covariance.v[1][2] = v23;
      *(_OWORD *)&v7->_covariance.v[2][0] = v16;
      long long v17 = v26;
      *(_OWORD *)&v7->_covariance.v[2][4] = v25;
      *(_OWORD *)&v7->_covariance.v[3][2] = v17;
      long long v18 = v22;
      *(_OWORD *)&v7->_covariance.v[0][0] = v21;
      *(_OWORD *)&v7->_covariance.v[0][4] = v18;
      v7->_debugInfo = 0;
      if ([a4 debugInfo]) {
        v7->_debugInfo = -[_CLVLLocalizationDebugInfo initWithVLLocalizationDebugInfo:]([_CLVLLocalizationDebugInfo alloc], "initWithVLLocalizationDebugInfo:", [a4 debugInfo]);
      }
    }
    else
    {

      return 0;
    }
  }
  return v7;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)_CLVLLocalizationResult;
  [(_CLVLLocalizationResult *)&v3 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(double *)(v5 + 16) = self->_timestamp;
  long long v6 = *(_OWORD *)self->_anon_20;
  long long v7 = *(_OWORD *)&self->_anon_20[32];
  *(_OWORD *)(v5 + 48) = *(_OWORD *)&self->_anon_20[16];
  *(_OWORD *)(v5 + 64) = v7;
  *(_OWORD *)(v5 + 32) = v6;
  long long v9 = *(_OWORD *)&self->_anon_50[64];
  long long v8 = *(_OWORD *)&self->_anon_50[80];
  long long v10 = *(_OWORD *)&self->_anon_50[112];
  *(_OWORD *)(v5 + 176) = *(_OWORD *)&self->_anon_50[96];
  *(_OWORD *)(v5 + 192) = v10;
  *(_OWORD *)(v5 + 144) = v9;
  *(_OWORD *)(v5 + 160) = v8;
  long long v11 = *(_OWORD *)&self->_anon_50[16];
  long long v12 = *(_OWORD *)&self->_anon_50[32];
  long long v13 = *(_OWORD *)&self->_anon_50[48];
  *(_OWORD *)(v5 + 80) = *(_OWORD *)self->_anon_50;
  *(_OWORD *)(v5 + 96) = v11;
  *(_OWORD *)(v5 + 112) = v12;
  *(_OWORD *)(v5 + 128) = v13;
  *(_OWORD *)(v5 + 208) = *(_OWORD *)&self->_covariance.v[0][0];
  long long v14 = *(_OWORD *)&self->_covariance.v[2][4];
  long long v16 = *(_OWORD *)&self->_covariance.v[0][4];
  long long v15 = *(_OWORD *)&self->_covariance.v[1][2];
  *(_OWORD *)(v5 + 256) = *(_OWORD *)&self->_covariance.v[2][0];
  *(_OWORD *)(v5 + 272) = v14;
  *(_OWORD *)(v5 + 224) = v16;
  *(_OWORD *)(v5 + 240) = v15;
  long long v17 = *(_OWORD *)&self->_covariance.v[5][2];
  long long v19 = *(_OWORD *)&self->_covariance.v[3][2];
  long long v18 = *(_OWORD *)&self->_covariance.v[4][0];
  *(_OWORD *)(v5 + 320) = *(_OWORD *)&self->_covariance.v[4][4];
  *(_OWORD *)(v5 + 336) = v17;
  *(_OWORD *)(v5 + 288) = v19;
  *(_OWORD *)(v5 + 304) = v18;
  *(float *)(v5 + 8) = self->_confidence;
  *(void *)(v5 + 24) = [(_CLVLLocalizationDebugInfo *)self->_debugInfo copyWithZone:a3];
  return (id)v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_CLVLLocalizationResult)initWithCoder:(id)a3
{
  v14.receiver = self;
  v14.super_class = (Class)_CLVLLocalizationResult;
  v4 = [(_CLVLLocalizationResult *)&v14 init];
  if (v4)
  {
    [a3 decodeDoubleForKey:@"timestamp"];
    v4->_timestamp = v5;
    long long v6 = (void *)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"location"];
    if (v6
      && (long long v7 = v6, [v6 length] == 48)
      && ([v7 getBytes:v4->_anon_20 length:48],
          (long long v8 = (void *)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"transform"]) != 0)
      && (long long v9 = v8, [v8 length] == 128)
      && ([v9 getBytes:v4->_anon_50 length:128],
          (long long v10 = (void *)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"covariance"]) != 0)
      && (long long v11 = v10, [v10 length] == 144))
    {
      [v11 getBytes:&v4->_covariance length:144];
      [a3 decodeFloatForKey:@"confidence"];
      v4->_confidence = v12;
      if ([a3 containsValueForKey:@"debugInfo"]) {
        v4->_debugInfo = (_CLVLLocalizationDebugInfo *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"debugInfo"];
      }
      else {
        v4->_debugInfo = 0;
      }
    }
    else
    {

      return 0;
    }
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  [a3 encodeDouble:@"timestamp" forKey:self->_timestamp];
  objc_msgSend(a3, "encodeObject:forKey:", objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytes:length:", self->_anon_20, 48), @"location");
  objc_msgSend(a3, "encodeObject:forKey:", objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytes:length:", self->_anon_50, 128), @"transform");
  objc_msgSend(a3, "encodeObject:forKey:", objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytes:length:", &self->_covariance, 144), @"covariance");
  *(float *)&double v5 = self->_confidence;
  [a3 encodeFloat:@"confidence" forKey:v5];
  debugInfo = self->_debugInfo;

  [a3 encodeObject:debugInfo forKey:@"debugInfo"];
}

- (id)description
{
  return [(_CLVLLocalizationResult *)self descriptionWithMemberIndent:@"\t" endIndent:&stru_1EE006720];
}

- (id)descriptionWithMemberIndent:(id)a3 endIndent:(id)a4
{
  uint64_t v7 = [a3 stringByAppendingString:@"\t"];
  uint64_t v8 = [a4 stringByAppendingString:@"\t"];
  long long v9 = NSString;
  [(_CLVLLocalizationResult *)self timestamp];
  uint64_t v56 = v10;
  if (self)
  {
    [(_CLVLLocalizationResult *)self location];
    uint64_t v54 = v100;
    [(_CLVLLocalizationResult *)self location];
    *((void *)&v44 + 1) = v99;
    [(_CLVLLocalizationResult *)self location];
    uint64_t v53 = v98;
    [(_CLVLLocalizationResult *)self location];
    uint64_t v52 = v97;
    [(_CLVLLocalizationResult *)self transform];
    int64x2_t v51 = v96;
    [(_CLVLLocalizationResult *)self transform];
    int64x2_t v50 = v95;
    [(_CLVLLocalizationResult *)self transform];
    int64x2_t v49 = v94;
    [(_CLVLLocalizationResult *)self transform];
    int64x2_t v48 = v93;
    [(_CLVLLocalizationResult *)self transform];
    int64x2_t v47 = v92;
    [(_CLVLLocalizationResult *)self transform];
    int64x2_t v46 = v91;
    [(_CLVLLocalizationResult *)self transform];
    int64x2_t v43 = v90;
    [(_CLVLLocalizationResult *)self transform];
    int64x2_t v45 = v89;
    [(_CLVLLocalizationResult *)self transform];
    int64x2_t v40 = v88;
    [(_CLVLLocalizationResult *)self transform];
    int64x2_t v41 = v87;
    [(_CLVLLocalizationResult *)self transform];
    int64x2_t v38 = v86;
    [(_CLVLLocalizationResult *)self transform];
    int64x2_t v42 = v85;
    [(_CLVLLocalizationResult *)self transform];
    int64x2_t v36 = v84;
    [(_CLVLLocalizationResult *)self transform];
    int64x2_t v39 = v83;
    [(_CLVLLocalizationResult *)self transform];
    int64x2_t v55 = v82;
    [(_CLVLLocalizationResult *)self transform];
    int64x2_t v37 = v81;
    [(_CLVLLocalizationResult *)self covariance];
    [(_CLVLLocalizationResult *)self covariance];
    [(_CLVLLocalizationResult *)self covariance];
    [(_CLVLLocalizationResult *)self covariance];
    [(_CLVLLocalizationResult *)self covariance];
    [(_CLVLLocalizationResult *)self covariance];
    [(_CLVLLocalizationResult *)self covariance];
    [(_CLVLLocalizationResult *)self covariance];
    [(_CLVLLocalizationResult *)self covariance];
    [(_CLVLLocalizationResult *)self covariance];
    [(_CLVLLocalizationResult *)self covariance];
    [(_CLVLLocalizationResult *)self covariance];
    [(_CLVLLocalizationResult *)self covariance];
    [(_CLVLLocalizationResult *)self covariance];
    [(_CLVLLocalizationResult *)self covariance];
    [(_CLVLLocalizationResult *)self covariance];
    [(_CLVLLocalizationResult *)self covariance];
    [(_CLVLLocalizationResult *)self covariance];
    [(_CLVLLocalizationResult *)self covariance];
    [(_CLVLLocalizationResult *)self covariance];
    [(_CLVLLocalizationResult *)self covariance];
    [(_CLVLLocalizationResult *)self covariance];
    [(_CLVLLocalizationResult *)self covariance];
    [(_CLVLLocalizationResult *)self covariance];
    [(_CLVLLocalizationResult *)self covariance];
    [(_CLVLLocalizationResult *)self covariance];
    [(_CLVLLocalizationResult *)self covariance];
    [(_CLVLLocalizationResult *)self covariance];
    [(_CLVLLocalizationResult *)self covariance];
    [(_CLVLLocalizationResult *)self covariance];
    [(_CLVLLocalizationResult *)self covariance];
    [(_CLVLLocalizationResult *)self covariance];
    [(_CLVLLocalizationResult *)self covariance];
    [(_CLVLLocalizationResult *)self covariance];
    [(_CLVLLocalizationResult *)self covariance];
    [(_CLVLLocalizationResult *)self covariance];
    double v35 = v80;
    double v25 = v57;
    double v17 = v58;
    double v28 = v59;
    double v11 = v60;
    double v27 = v61;
    double v12 = v62;
    double v20 = v63;
    double v13 = v64;
    double v19 = v65;
    double v14 = v66;
    double v18 = v67;
    double v15 = v68;
    double v32 = v69;
    double v24 = v70;
    double v33 = v71;
    double v23 = v72;
    double v34 = v73;
    double v21 = v74;
    double v29 = v75;
    double v22 = v76;
    double v30 = v77;
    double v26 = v78;
    double v31 = v79;
  }
  else
  {
    int64x2_t v47 = 0u;
    int64x2_t v49 = 0u;
    int64x2_t v51 = 0u;
    uint64_t v53 = 0;
    uint64_t v54 = 0;
    uint64_t v52 = 0;
    int64x2_t v50 = 0u;
    int64x2_t v48 = 0u;
    int64x2_t v46 = 0u;
    int64x2_t v45 = 0u;
    int64x2_t v42 = 0u;
    int64x2_t v39 = 0u;
    int64x2_t v37 = 0u;
    double v34 = 0.0;
    double v33 = 0.0;
    double v27 = 0.0;
    double v28 = 0.0;
    double v25 = 0.0;
    double v32 = 0.0;
    double v18 = 0.0;
    double v19 = 0.0;
    double v20 = 0.0;
    double v31 = 0.0;
    double v30 = 0.0;
    double v29 = 0.0;
    double v26 = 0.0;
    double v35 = 0.0;
    int64x2_t v36 = 0u;
    int64x2_t v38 = 0u;
    int64x2_t v40 = 0u;
    int64x2_t v41 = 0u;
    int64x2_t v43 = 0u;
    long long v44 = 0u;
    double v14 = 0.0;
    double v15 = 0.0;
    double v24 = 0.0;
    double v23 = 0.0;
    double v21 = 0.0;
    double v22 = 0.0;
    double v17 = 0.0;
    double v11 = 0.0;
    double v12 = 0.0;
    double v13 = 0.0;
    int64x2_t v55 = 0u;
  }
  [(_CLVLLocalizationResult *)self confidence];
  [(_CLVLLocalizationDebugInfo *)[(_CLVLLocalizationResult *)self debugInfo] descriptionWithMemberIndent:v7 endIndent:v8];
  return (id)objc_msgSend(v9, "stringWithFormat:", @"<_CLVLLocalizationResult: %p> {\n%@.timestamp = %f,\n%@.location = {\n%@.coordinate = [%f, %f, %f],\n%@.horizontalAccuracy = %f\n%@},\n%@.transform = [%f, %f, %f, %f;\n%@%f, %f, %f, %f;\n%@%f, %f, %f, %f;\n%@%f, %f, %f, %f],\n%@.covariance = [%f, %f, %f, %f, %f, %f;\n%@%f, %f, %f, %f, %f, %f;\n%@%f, %f, %f, %f, %f, %f;\n%@%f, %f, %f, %f, %f, %f;\n%@%f, %f, %f, %f, %f, %f;\n%@%f, %f, %f, %f, %f, %f],\n%@.confidence = %f\n%@.debugInfo = %@\n%@}",
               self,
               a3,
               v56,
               a3,
               v7,
               v54,
               *((void *)&v44 + 1),
               v53,
               v7,
               v52,
               v8,
               a3,
               vzip1q_s64(v51, v50),
               vzip1q_s64(v49, v48),
               v7,
               vzip2q_s64(v47, v46),
               vzip2q_s64(v43, v45),
               v7,
               vzip1q_s64(v40, v41),
               vzip1q_s64(v38, v42),
               v7,
               vzip2q_s64(v36, v39),
               vzip2q_s64(v55, v37),
               a3,
               *(void *)&v35,
               *(void *)&v31,
               *(void *)&v26,
               *(void *)&v30,
               *(void *)&v22,
               *(void *)&v29,
               v7,
               *(void *)&v21,
               *(void *)&v34,
               *(void *)&v23,
               *(void *)&v33,
               *(void *)&v24,
               *(void *)&v32,
               v7,
               *(void *)&v15,
               *(void *)&v18,
               *(void *)&v14,
               *(void *)&v19,
               *(void *)&v13,
               *(void *)&v20,
               v7,
               *(void *)&v12,
               *(void *)&v27,
               *(void *)&v11,
               *(void *)&v28,
               *(void *)&v17,
               *(void *)&v25,
               v7);
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

- ($153C3A5BC4E016D58A1B9CA554FFC462)location
{
  long long v3 = *(_OWORD *)&self->_anon_20[16];
  _OWORD *v2 = *(_OWORD *)self->_anon_20;
  v2[1] = v3;
  long long v4 = *(_OWORD *)&self->_anon_20[32];
  v2[2] = v4;
  return ($153C3A5BC4E016D58A1B9CA554FFC462)v4;
}

- (void)setLocation:(id)a3
{
  long long v4 = *v3;
  long long v5 = v3[2];
  *(_OWORD *)&self->_anon_20[16] = v3[1];
  *(_OWORD *)&self->_anon_20[32] = v5;
  *(_OWORD *)self->_anon_20 = v4;
}

- (__n128)transform
{
  long long v2 = *(_OWORD *)(a1 + 160);
  *(_OWORD *)(a2 + 64) = *(_OWORD *)(a1 + 144);
  *(_OWORD *)(a2 + 80) = v2;
  long long v3 = *(_OWORD *)(a1 + 192);
  *(_OWORD *)(a2 + 96) = *(_OWORD *)(a1 + 176);
  *(_OWORD *)(a2 + 112) = v3;
  long long v4 = *(_OWORD *)(a1 + 96);
  *(_OWORD *)a2 = *(_OWORD *)(a1 + 80);
  *(_OWORD *)(a2 + 16) = v4;
  __n128 result = *(__n128 *)(a1 + 112);
  long long v6 = *(_OWORD *)(a1 + 128);
  *(__n128 *)(a2 + 32) = result;
  *(_OWORD *)(a2 + 48) = v6;
  return result;
}

- (__n128)setTransform:(long long *)a3
{
  long long v3 = *a3;
  long long v4 = a3[1];
  long long v5 = a3[3];
  *(_OWORD *)(a1 + 112) = a3[2];
  *(_OWORD *)(a1 + 128) = v5;
  *(_OWORD *)(a1 + 80) = v3;
  *(_OWORD *)(a1 + 96) = v4;
  __n128 result = (__n128)a3[4];
  long long v7 = a3[5];
  long long v8 = a3[7];
  *(_OWORD *)(a1 + 176) = a3[6];
  *(_OWORD *)(a1 + 192) = v8;
  *(__n128 *)(a1 + 144) = result;
  *(_OWORD *)(a1 + 160) = v7;
  return result;
}

- ($4ED12C4C7630B45462BF021B0F75306B)covariance
{
  long long v3 = *(_OWORD *)&self[2].var0[1][2];
  *(_OWORD *)&retstr->var0[4][0] = *(_OWORD *)&self[2].var0[0][4];
  *(_OWORD *)&retstr->var0[4][4] = v3;
  *(_OWORD *)&retstr->var0[5][2] = *(_OWORD *)&self[2].var0[2][0];
  long long v4 = *(_OWORD *)&self[1].var0[4][4];
  *(_OWORD *)&retstr->var0[1][2] = *(_OWORD *)&self[1].var0[4][0];
  *(_OWORD *)&retstr->var0[2][0] = v4;
  long long v5 = *(_OWORD *)&self[2].var0[0][0];
  *(_OWORD *)&retstr->var0[2][4] = *(_OWORD *)&self[1].var0[5][2];
  *(_OWORD *)&retstr->var0[3][2] = v5;
  long long v6 = *(_OWORD *)&self[1].var0[3][2];
  *(_OWORD *)&retstr->var0[0][0] = *(_OWORD *)&self[1].var0[2][4];
  *(_OWORD *)&retstr->var0[0][4] = v6;
  return self;
}

- (void)setCovariance:(id *)a3
{
  *(_OWORD *)&self->_covariance.v[0][0] = *(_OWORD *)&a3->var0[0][0];
  long long v3 = *(_OWORD *)&a3->var0[0][4];
  long long v4 = *(_OWORD *)&a3->var0[1][2];
  long long v5 = *(_OWORD *)&a3->var0[2][4];
  *(_OWORD *)&self->_covariance.v[2][0] = *(_OWORD *)&a3->var0[2][0];
  *(_OWORD *)&self->_covariance.v[2][4] = v5;
  *(_OWORD *)&self->_covariance.v[0][4] = v3;
  *(_OWORD *)&self->_covariance.v[1][2] = v4;
  long long v6 = *(_OWORD *)&a3->var0[3][2];
  long long v7 = *(_OWORD *)&a3->var0[4][0];
  long long v8 = *(_OWORD *)&a3->var0[5][2];
  *(_OWORD *)&self->_covariance.v[4][4] = *(_OWORD *)&a3->var0[4][4];
  *(_OWORD *)&self->_covariance.v[5][2] = v8;
  *(_OWORD *)&self->_covariance.v[3][2] = v6;
  *(_OWORD *)&self->_covariance.v[4][0] = v7;
}

- (float)confidence
{
  return self->_confidence;
}

- (void)setConfidence:(float)a3
{
  self->_confidence = a3;
}

- (_CLVLLocalizationDebugInfo)debugInfo
{
  return self->_debugInfo;
}

- (void)setDebugInfo:(id)a3
{
}

@end
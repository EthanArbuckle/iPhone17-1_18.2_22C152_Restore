@interface PARSmartSearchV2Parameters
+ (BOOL)supportsSecureCoding;
- (BOOL)enableCount;
- (BOOL)enabled;
- (PARSmartSearchV2Parameters)init;
- (PARSmartSearchV2Parameters)initWithCoder:(id)a3;
- (double)paramA;
- (double)paramB;
- (double)paramC;
- (double)paramK;
- (double)paramM;
- (double)paramQ;
- (double)paramV;
- (double)windowBucket;
- (id)initFromBag:(id)a3;
- (id)initFromEnabled:(BOOL)a3 enableCount:(BOOL)a4 minCount:(int64_t)a5;
- (id)initFromEnabled:(BOOL)a3 enableCount:(BOOL)a4 minCount:(int64_t)a5 zkwMinCount:(int64_t)a6;
- (int64_t)minCount;
- (int64_t)zkwMinCount;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PARSmartSearchV2Parameters

- (int64_t)zkwMinCount
{
  return self->_zkwMinCount;
}

- (int64_t)minCount
{
  return self->_minCount;
}

- (double)windowBucket
{
  return self->_windowBucket;
}

- (double)paramV
{
  return self->_paramV;
}

- (double)paramQ
{
  return self->_paramQ;
}

- (double)paramM
{
  return self->_paramM;
}

- (double)paramK
{
  return self->_paramK;
}

- (double)paramC
{
  return self->_paramC;
}

- (double)paramB
{
  return self->_paramB;
}

- (double)paramA
{
  return self->_paramA;
}

- (BOOL)enableCount
{
  return self->_enableCount;
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (void)encodeWithCoder:(id)a3
{
  BOOL enabled = self->_enabled;
  id v5 = a3;
  [v5 encodeBool:enabled forKey:@"_enabled"];
  [v5 encodeBool:self->_enableCount forKey:@"_enableCount"];
  [v5 encodeDouble:@"_paramA" forKey:self->_paramA];
  [v5 encodeDouble:@"_paramB" forKey:self->_paramB];
  [v5 encodeDouble:@"_paramC" forKey:self->_paramC];
  [v5 encodeDouble:@"_paramK" forKey:self->_paramK];
  [v5 encodeDouble:@"_paramM" forKey:self->_paramM];
  [v5 encodeDouble:@"_paramQ" forKey:self->_paramQ];
  [v5 encodeDouble:@"_paramV" forKey:self->_paramV];
  [v5 encodeDouble:@"_windowBucket" forKey:self->_windowBucket];
  [v5 encodeInteger:self->_minCount forKey:@"_minCount"];
  [v5 encodeInteger:self->_zkwMinCount forKey:@"_zkwMinCount"];
}

- (PARSmartSearchV2Parameters)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(PARSmartSearchV2Parameters *)self init];
  if (v5)
  {
    v5->_BOOL enabled = [v4 decodeBoolForKey:@"_enabled"];
    v5->_enableCount = [v4 decodeBoolForKey:@"_enableCount"];
    [v4 decodeDoubleForKey:@"_paramA"];
    v5->_paramA = v6;
    [v4 decodeDoubleForKey:@"_paramB"];
    v5->_paramB = v7;
    [v4 decodeDoubleForKey:@"_paramC"];
    v5->_paramC = v8;
    [v4 decodeDoubleForKey:@"_paramK"];
    v5->_paramK = v9;
    [v4 decodeDoubleForKey:@"_paramM"];
    v5->_paramM = v10;
    [v4 decodeDoubleForKey:@"_paramQ"];
    v5->_paramQ = v11;
    [v4 decodeDoubleForKey:@"_paramV"];
    v5->_paramV = v12;
    [v4 decodeDoubleForKey:@"_windowBucket"];
    v5->_windowBucket = v13;
    v5->_minCount = [v4 decodeIntegerForKey:@"_minCount"];
    v5->_zkwMinCount = [v4 decodeIntegerForKey:@"_zkwMinCount"];
  }

  return v5;
}

- (id)initFromBag:(id)a3
{
  id v4 = a3;
  id v5 = [(PARSmartSearchV2Parameters *)self init];
  if (v5)
  {
    double v6 = [v4 smartSearchV2Parameters];
    double v7 = v6;
    if (v6)
    {
      double v8 = [v6 objectForKeyedSubscript:@"smart_history_score_v2_enabled"];
      v28 = [v7 objectForKeyedSubscript:@"smart_history_score_v2_enable_count"];
      v27 = [v7 objectForKeyedSubscript:@"pqc_score_a"];
      v26 = [v7 objectForKeyedSubscript:@"pqc_score_b"];
      v25 = [v7 objectForKeyedSubscript:@"pqc_score_c"];
      v24 = [v7 objectForKeyedSubscript:@"pqc_score_k"];
      double v9 = [v7 objectForKeyedSubscript:@"pqc_score_m"];
      double v10 = [v7 objectForKeyedSubscript:@"pqc_score_q"];
      double v11 = [v7 objectForKeyedSubscript:@"pqc_score_v"];
      double v12 = [v7 objectForKeyedSubscript:@"pqc_window_bucket"];
      double v13 = [v7 objectForKeyedSubscript:@"pqc_score_min_count"];
      v14 = [v7 objectForKeyedSubscript:@"pqc_zkw_min_count"];
      if (v8
        && [v8 BOOLValue]
        && v28
        && v27
        && v26
        && v25
        && v24
        && v9
        && v10
        && v11
        && v12
        && v13)
      {
        v5->_BOOL enabled = [v8 BOOLValue];
        v5->_enableCount = [v28 BOOLValue];
        [v27 doubleValue];
        v5->_paramA = v15;
        [v26 doubleValue];
        v5->_paramB = v16;
        [v25 doubleValue];
        v5->_paramC = v17;
        [v24 doubleValue];
        v5->_paramK = v18;
        [v9 doubleValue];
        v5->_paramM = v19;
        [v10 doubleValue];
        v5->_paramQ = v20;
        [v11 doubleValue];
        v5->_paramV = v21;
        [v12 doubleValue];
        v5->_windowBucket = v22;
        v5->_minCount = [v13 integerValue];
        v5->_zkwMinCount = [v14 integerValue];
      }
    }
  }

  return v5;
}

- (PARSmartSearchV2Parameters)init
{
  v8.receiver = self;
  v8.super_class = (Class)PARSmartSearchV2Parameters;
  result = [(PARSmartSearchV2Parameters *)&v8 init];
  if (result)
  {
    *(_WORD *)&result->_BOOL enabled = 0;
    __asm { FMOV            V1.2D, #1.0 }
    *(_OWORD *)&result->_paramA = xmmword_19C8A5390;
    *(_OWORD *)&result->_paramC = _Q1;
    *(_OWORD *)&result->_paramM = xmmword_19C8A53A0;
    *(_OWORD *)&result->_paramV = xmmword_19C8A53B0;
    result->_minCount = 0;
    result->_zkwMinCount = 0;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)initFromEnabled:(BOOL)a3 enableCount:(BOOL)a4 minCount:(int64_t)a5 zkwMinCount:(int64_t)a6
{
  id result = [(PARSmartSearchV2Parameters *)self init];
  if (result)
  {
    *((unsigned char *)result + 8) = a3;
    *((unsigned char *)result + 9) = a4;
    *((void *)result + 10) = a5;
    *((void *)result + 11) = a6;
  }
  return result;
}

- (id)initFromEnabled:(BOOL)a3 enableCount:(BOOL)a4 minCount:(int64_t)a5
{
  id result = [(PARSmartSearchV2Parameters *)self init];
  if (result)
  {
    *((unsigned char *)result + 8) = a3;
    *((unsigned char *)result + 9) = a4;
    *((void *)result + 10) = a5;
  }
  return result;
}

@end
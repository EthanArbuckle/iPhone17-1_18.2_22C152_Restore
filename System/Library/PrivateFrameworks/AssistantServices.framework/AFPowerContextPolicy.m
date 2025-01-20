@interface AFPowerContextPolicy
+ (BOOL)supportsSecureCoding;
- (AFPowerContext)asrAssistantPolicy;
- (AFPowerContext)asrDictationPolicy;
- (AFPowerContext)siriUIPolicy;
- (AFPowerContext)ttsPolicy;
- (AFPowerContextPolicy)initWithAsrAssistantPolicy:(AFPowerContext *)a3 asrDictationPolicy:(AFPowerContext *)a4 ttsPolicy:(AFPowerContext *)a5;
- (AFPowerContextPolicy)initWithAsrAssistantPolicy:(AFPowerContext *)a3 asrDictationPolicy:(AFPowerContext *)a4 ttsPolicy:(AFPowerContext *)a5 platformContext:(unint64_t)a6;
- (AFPowerContextPolicy)initWithAsrAssistantPolicy:(AFPowerContext *)a3 asrDictationPolicy:(AFPowerContext *)a4 ttsPolicy:(AFPowerContext *)a5 siriUIPolicy:(AFPowerContext *)a6;
- (AFPowerContextPolicy)initWithAsrAssistantPolicy:(AFPowerContext *)a3 asrDictationPolicy:(AFPowerContext *)a4 ttsPolicy:(AFPowerContext *)a5 siriUIPolicy:(AFPowerContext *)a6 thermalMitigationLevel:(unint64_t)a7;
- (AFPowerContextPolicy)initWithAsrAssistantPolicy:(AFPowerContext *)a3 asrDictationPolicy:(AFPowerContext *)a4 ttsPolicy:(AFPowerContext *)a5 siriUIPolicy:(AFPowerContext *)a6 thermalMitigationLevel:(unint64_t)a7 platformContext:(unint64_t)a8;
- (AFPowerContextPolicy)initWithAsrAssistantPolicy:(AFPowerContext *)a3 asrDictationPolicy:(AFPowerContext *)a4 ttsPolicy:(AFPowerContext *)a5 thermalMitigationLevel:(unint64_t)a6;
- (AFPowerContextPolicy)initWithAsrAssistantPolicy:(AFPowerContext *)a3 asrDictationPolicy:(AFPowerContext *)a4 ttsPolicy:(AFPowerContext *)a5 thermalMitigationLevel:(unint64_t)a6 platformContext:(unint64_t)a7;
- (AFPowerContextPolicy)initWithCoder:(id)a3;
- (AFPowerContextPolicy)initWithEncodedPolicy:(unint64_t)a3;
- (BOOL)isEqual:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)encodePolicy;
- (unint64_t)platformContext;
- (unint64_t)thermalMitigationLevel;
- (void)encodeWithCoder:(id)a3;
@end

@implementation AFPowerContextPolicy

- (unint64_t)platformContext
{
  return self->_platformContext;
}

- (unint64_t)thermalMitigationLevel
{
  return self->_thermalMitigationLevel;
}

- (AFPowerContext)siriUIPolicy
{
  *retstr = self[4];
  return self;
}

- (AFPowerContext)ttsPolicy
{
  *retstr = self[3];
  return self;
}

- (AFPowerContext)asrDictationPolicy
{
  *retstr = self[2];
  return self;
}

- (AFPowerContext)asrAssistantPolicy
{
  *retstr = self[1];
  return self;
}

- (id)description
{
  v3 = (void *)MEMORY[0x1E4F28E78];
  v7.receiver = self;
  v7.super_class = (Class)AFPowerContextPolicy;
  v4 = [(AFPowerContextPolicy *)&v7 description];
  v5 = [v3 stringWithString:v4];

  [v5 appendFormat:@" -\nASR Assistant Power Context { cpu:%lu, ane:%lu, gpu:%lu }\n", self->_asrAssistantPolicy.cpuContext, self->_asrAssistantPolicy.aneContext, self->_asrAssistantPolicy.gpuContext];
  [v5 appendFormat:@"ASR Dictation Power Context { cpu:%lu, ane:%lu, gpu:%lu }\n", self->_asrDictationPolicy.cpuContext, self->_asrDictationPolicy.aneContext, self->_asrDictationPolicy.gpuContext];
  [v5 appendFormat:@"TTS Power Context { cpu:%lu, ane:%lu, gpu:%lu }\n", self->_ttsPolicy.cpuContext, self->_ttsPolicy.aneContext, self->_ttsPolicy.gpuContext];
  [v5 appendFormat:@"SiriUI Power Context { cpu:%lu, ane:%lu, gpu:%lu }\n", self->_siriUIPolicy.cpuContext, self->_siriUIPolicy.aneContext, self->_siriUIPolicy.gpuContext];
  objc_msgSend(v5, "appendFormat:", @"Thermal Mitigation Level #uxm #tml:%lu\n", self->_thermalMitigationLevel);
  objc_msgSend(v5, "appendFormat:", @"Encoded Platform Context:%lu", self->_platformContext);
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInt64:forKey:", -[AFPowerContextPolicy encodePolicy](self, "encodePolicy"), @"AFPowerContextPolicy::encodedPolicy");
}

- (AFPowerContextPolicy)initWithCoder:(id)a3
{
  uint64_t v4 = [a3 decodeInt64ForKey:@"AFPowerContextPolicy::encodedPolicy"];
  return [(AFPowerContextPolicy *)self initWithEncodedPolicy:v4];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = +[AFPowerContextPolicy allocWithZone:a3];
  unint64_t thermalMitigationLevel = self->_thermalMitigationLevel;
  unint64_t platformContext = self->_platformContext;
  AFPowerContext asrAssistantPolicy = self->_asrAssistantPolicy;
  AFPowerContext asrDictationPolicy = self->_asrDictationPolicy;
  AFPowerContext ttsPolicy = self->_ttsPolicy;
  AFPowerContext siriUIPolicy = self->_siriUIPolicy;
  return [(AFPowerContextPolicy *)v4 initWithAsrAssistantPolicy:&asrAssistantPolicy asrDictationPolicy:&asrDictationPolicy ttsPolicy:&ttsPolicy siriUIPolicy:&siriUIPolicy thermalMitigationLevel:thermalMitigationLevel platformContext:platformContext];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v5 = v4;
  unint64_t cpuContext = self->_asrAssistantPolicy.cpuContext;
  if (v4)
  {
    [v4 asrAssistantPolicy];
    if (cpuContext != v34) {
      goto LABEL_28;
    }
    unint64_t aneContext = self->_asrAssistantPolicy.aneContext;
    [v5 asrAssistantPolicy];
    if (aneContext != v33) {
      goto LABEL_28;
    }
    unint64_t gpuContext = self->_asrAssistantPolicy.gpuContext;
    [v5 asrAssistantPolicy];
    if (gpuContext != v32) {
      goto LABEL_28;
    }
    unint64_t v9 = self->_asrDictationPolicy.cpuContext;
    [v5 asrDictationPolicy];
    if (v9 != v31) {
      goto LABEL_28;
    }
    unint64_t v10 = self->_asrDictationPolicy.aneContext;
    [v5 asrDictationPolicy];
    if (v10 != v30) {
      goto LABEL_28;
    }
    unint64_t v11 = self->_asrDictationPolicy.gpuContext;
    [v5 asrDictationPolicy];
    if (v11 != v29) {
      goto LABEL_28;
    }
    unint64_t v12 = self->_ttsPolicy.cpuContext;
    [v5 ttsPolicy];
    if (v12 != v28) {
      goto LABEL_28;
    }
    unint64_t v13 = self->_ttsPolicy.aneContext;
    [v5 ttsPolicy];
    if (v13 != v27) {
      goto LABEL_28;
    }
    unint64_t v14 = self->_ttsPolicy.gpuContext;
    [v5 ttsPolicy];
    if (v14 != v26) {
      goto LABEL_28;
    }
    unint64_t v15 = self->_siriUIPolicy.cpuContext;
    [v5 siriUIPolicy];
    if (v15 != v25) {
      goto LABEL_28;
    }
    unint64_t v16 = self->_siriUIPolicy.aneContext;
    [v5 siriUIPolicy];
    if (v16 != v24) {
      goto LABEL_28;
    }
    unint64_t v17 = self->_siriUIPolicy.gpuContext;
    [v5 siriUIPolicy];
    unint64_t v18 = v23;
  }
  else
  {
    if (cpuContext) {
      goto LABEL_28;
    }
    if (self->_asrAssistantPolicy.aneContext) {
      goto LABEL_28;
    }
    if (self->_asrAssistantPolicy.gpuContext) {
      goto LABEL_28;
    }
    if (self->_asrDictationPolicy.cpuContext) {
      goto LABEL_28;
    }
    if (self->_asrDictationPolicy.aneContext) {
      goto LABEL_28;
    }
    if (self->_asrDictationPolicy.gpuContext) {
      goto LABEL_28;
    }
    if (self->_ttsPolicy.cpuContext) {
      goto LABEL_28;
    }
    if (self->_ttsPolicy.aneContext) {
      goto LABEL_28;
    }
    if (self->_ttsPolicy.gpuContext) {
      goto LABEL_28;
    }
    if (self->_siriUIPolicy.cpuContext) {
      goto LABEL_28;
    }
    unint64_t v18 = self->_siriUIPolicy.aneContext;
    if (v18) {
      goto LABEL_28;
    }
    unint64_t v17 = self->_siriUIPolicy.gpuContext;
  }
  if (v17 != v18
    || (unint64_t thermalMitigationLevel = self->_thermalMitigationLevel,
        thermalMitigationLevel != [v5 thermalMitigationLevel]))
  {
LABEL_28:
    BOOL v21 = 0;
    goto LABEL_29;
  }
  unint64_t platformContext = self->_platformContext;
  BOOL v21 = platformContext == [v5 platformContext];
LABEL_29:

  return v21;
}

- (unint64_t)encodePolicy
{
  return self->_asrAssistantPolicy.cpuContext
       + 0x1000000
       + vaddvq_s64(vaddq_s64(vaddq_s64(vaddq_s64((int64x2_t)vshlq_u64(*(uint64x2_t *)&self->_asrAssistantPolicy.aneContext, (uint64x2_t)xmmword_19D0E2420), (int64x2_t)vshlq_u64(*(uint64x2_t *)&self->_asrDictationPolicy.gpuContext, (uint64x2_t)xmmword_19D0E2410)), vaddq_s64((int64x2_t)vshlq_u64(*(uint64x2_t *)&self->_asrDictationPolicy.cpuContext, (uint64x2_t)xmmword_19D0E2440), (int64x2_t)vshlq_u64(*(uint64x2_t *)&self->_ttsPolicy.aneContext, (uint64x2_t)xmmword_19D0E2430))), vaddq_s64((int64x2_t)vshlq_u64(*(uint64x2_t *)&self->_siriUIPolicy.aneContext, (uint64x2_t)xmmword_19D0E2460), (int64x2_t)vshlq_u64(*(uint64x2_t *)&self->_thermalMitigationLevel, (uint64x2_t)xmmword_19D0E2450))))+ (self->_siriUIPolicy.cpuContext << 18);
}

- (AFPowerContextPolicy)initWithEncodedPolicy:(unint64_t)a3
{
  unint64_t v3 = a3;
  if (a3)
  {
    v8.receiver = self;
    v8.super_class = (Class)AFPowerContextPolicy;
    id v4 = [(AFPowerContextPolicy *)&v8 init];
    if (v4)
    {
      uint64x2_t v5 = (uint64x2_t)vdupq_n_s64(v3);
      *((void *)v4 + 3) = v3 & 3;
      int8x16_t v6 = (int8x16_t)vdupq_n_s64(3uLL);
      *((int8x16_t *)v4 + 2) = vandq_s8((int8x16_t)vshlq_u64(v5, (uint64x2_t)xmmword_19D0E2470), v6);
      *((int8x16_t *)v4 + 3) = vandq_s8((int8x16_t)vshlq_u64(v5, (uint64x2_t)xmmword_19D0E2480), v6);
      *((int8x16_t *)v4 + 4) = vandq_s8((int8x16_t)vshlq_u64(v5, (uint64x2_t)xmmword_19D0E2490), v6);
      *((int8x16_t *)v4 + 5) = vandq_s8((int8x16_t)vshlq_u64(v5, (uint64x2_t)xmmword_19D0E24A0), v6);
      *((int8x16_t *)v4 + 6) = vandq_s8((int8x16_t)vshlq_u64(v5, (uint64x2_t)xmmword_19D0E24B0), v6);
      *((void *)v4 + 14) = (v3 >> 22) & 3;
      *(int8x16_t *)(v4 + 8) = vandq_s8((int8x16_t)vshlq_u64(v5, (uint64x2_t)xmmword_19D0E24C0), (int8x16_t)xmmword_19D0E24D0);
    }
    self = v4;
    unint64_t v3 = (unint64_t)self;
  }

  return (AFPowerContextPolicy *)v3;
}

- (AFPowerContextPolicy)initWithAsrAssistantPolicy:(AFPowerContext *)a3 asrDictationPolicy:(AFPowerContext *)a4 ttsPolicy:(AFPowerContext *)a5 platformContext:(unint64_t)a6
{
  AFPowerContext v10 = *a3;
  AFPowerContext v9 = *a4;
  AFPowerContext v8 = *a5;
  memset(v7, 0, sizeof(v7));
  return [(AFPowerContextPolicy *)self initWithAsrAssistantPolicy:&v10 asrDictationPolicy:&v9 ttsPolicy:&v8 siriUIPolicy:v7 thermalMitigationLevel:0 platformContext:a6];
}

- (AFPowerContextPolicy)initWithAsrAssistantPolicy:(AFPowerContext *)a3 asrDictationPolicy:(AFPowerContext *)a4 ttsPolicy:(AFPowerContext *)a5
{
  AFPowerContext v9 = *a3;
  AFPowerContext v8 = *a4;
  AFPowerContext v7 = *a5;
  memset(v6, 0, sizeof(v6));
  return [(AFPowerContextPolicy *)self initWithAsrAssistantPolicy:&v9 asrDictationPolicy:&v8 ttsPolicy:&v7 siriUIPolicy:v6 thermalMitigationLevel:0 platformContext:0];
}

- (AFPowerContextPolicy)initWithAsrAssistantPolicy:(AFPowerContext *)a3 asrDictationPolicy:(AFPowerContext *)a4 ttsPolicy:(AFPowerContext *)a5 thermalMitigationLevel:(unint64_t)a6 platformContext:(unint64_t)a7
{
  AFPowerContext v11 = *a3;
  AFPowerContext v10 = *a4;
  AFPowerContext v9 = *a5;
  memset(v8, 0, sizeof(v8));
  return [(AFPowerContextPolicy *)self initWithAsrAssistantPolicy:&v11 asrDictationPolicy:&v10 ttsPolicy:&v9 siriUIPolicy:v8 thermalMitigationLevel:a6 platformContext:a7];
}

- (AFPowerContextPolicy)initWithAsrAssistantPolicy:(AFPowerContext *)a3 asrDictationPolicy:(AFPowerContext *)a4 ttsPolicy:(AFPowerContext *)a5 thermalMitigationLevel:(unint64_t)a6
{
  AFPowerContext v10 = *a3;
  AFPowerContext v9 = *a4;
  AFPowerContext v8 = *a5;
  memset(v7, 0, sizeof(v7));
  return [(AFPowerContextPolicy *)self initWithAsrAssistantPolicy:&v10 asrDictationPolicy:&v9 ttsPolicy:&v8 siriUIPolicy:v7 thermalMitigationLevel:a6 platformContext:0];
}

- (AFPowerContextPolicy)initWithAsrAssistantPolicy:(AFPowerContext *)a3 asrDictationPolicy:(AFPowerContext *)a4 ttsPolicy:(AFPowerContext *)a5 siriUIPolicy:(AFPowerContext *)a6
{
  AFPowerContext v10 = *a3;
  AFPowerContext v9 = *a4;
  AFPowerContext v8 = *a5;
  AFPowerContext v7 = *a6;
  return [(AFPowerContextPolicy *)self initWithAsrAssistantPolicy:&v10 asrDictationPolicy:&v9 ttsPolicy:&v8 siriUIPolicy:&v7 thermalMitigationLevel:0 platformContext:0];
}

- (AFPowerContextPolicy)initWithAsrAssistantPolicy:(AFPowerContext *)a3 asrDictationPolicy:(AFPowerContext *)a4 ttsPolicy:(AFPowerContext *)a5 siriUIPolicy:(AFPowerContext *)a6 thermalMitigationLevel:(unint64_t)a7
{
  AFPowerContext v11 = *a3;
  AFPowerContext v10 = *a4;
  AFPowerContext v9 = *a5;
  AFPowerContext v8 = *a6;
  return [(AFPowerContextPolicy *)self initWithAsrAssistantPolicy:&v11 asrDictationPolicy:&v10 ttsPolicy:&v9 siriUIPolicy:&v8 thermalMitigationLevel:a7 platformContext:0];
}

- (AFPowerContextPolicy)initWithAsrAssistantPolicy:(AFPowerContext *)a3 asrDictationPolicy:(AFPowerContext *)a4 ttsPolicy:(AFPowerContext *)a5 siriUIPolicy:(AFPowerContext *)a6 thermalMitigationLevel:(unint64_t)a7 platformContext:(unint64_t)a8
{
  v19.receiver = self;
  v19.super_class = (Class)AFPowerContextPolicy;
  result = [(AFPowerContextPolicy *)&v19 init];
  if (result)
  {
    long long v15 = *(_OWORD *)&a3->cpuContext;
    result->_asrAssistantPolicy.unint64_t gpuContext = a3->gpuContext;
    *(_OWORD *)&result->_asrAssistantPolicy.unint64_t cpuContext = v15;
    long long v16 = *(_OWORD *)&a4->cpuContext;
    result->_asrDictationPolicy.unint64_t gpuContext = a4->gpuContext;
    *(_OWORD *)&result->_asrDictationPolicy.unint64_t cpuContext = v16;
    long long v17 = *(_OWORD *)&a5->cpuContext;
    result->_ttsPolicy.unint64_t gpuContext = a5->gpuContext;
    *(_OWORD *)&result->_ttsPolicy.unint64_t cpuContext = v17;
    long long v18 = *(_OWORD *)&a6->cpuContext;
    result->_siriUIPolicy.unint64_t gpuContext = a6->gpuContext;
    *(_OWORD *)&result->_siriUIPolicy.unint64_t cpuContext = v18;
    result->_unint64_t thermalMitigationLevel = a7;
    result->_unint64_t platformContext = a8;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
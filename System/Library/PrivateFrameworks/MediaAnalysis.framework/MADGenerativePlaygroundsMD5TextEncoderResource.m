@interface MADGenerativePlaygroundsMD5TextEncoderResource
- (BOOL)supportsAgeTypePromptAdjustment;
- (id)additionalLayerNames;
- (id)tokensForAgeType_:(unsigned __int16)a3;
- (int64_t)revision;
- (int64_t)tokenEmbeddingType;
- (unint64_t)version;
@end

@implementation MADGenerativePlaygroundsMD5TextEncoderResource

- (int64_t)revision
{
  return 9;
}

- (id)additionalLayerNames
{
  return &unk_1F15EE640;
}

- (int64_t)tokenEmbeddingType
{
  return 6;
}

- (unint64_t)version
{
  return 5;
}

- (id)tokensForAgeType_:(unsigned __int16)a3
{
  v3 = &unk_1F15EE670;
  if (a3 != 2) {
    v3 = 0;
  }
  if (a3 == 1) {
    return &unk_1F15EE658;
  }
  else {
    return v3;
  }
}

- (BOOL)supportsAgeTypePromptAdjustment
{
  return 1;
}

@end
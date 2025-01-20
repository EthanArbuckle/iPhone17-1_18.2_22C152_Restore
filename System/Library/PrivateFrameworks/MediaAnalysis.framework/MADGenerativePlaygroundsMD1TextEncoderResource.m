@interface MADGenerativePlaygroundsMD1TextEncoderResource
- (BOOL)supportsAgeTypePromptAdjustment;
- (id)additionalLayerNames;
- (id)tokensForAgeType_:(unsigned __int16)a3;
- (int64_t)revision;
- (int64_t)tokenEmbeddingType;
- (unint64_t)version;
@end

@implementation MADGenerativePlaygroundsMD1TextEncoderResource

- (int64_t)revision
{
  return 7;
}

- (id)additionalLayerNames
{
  return &unk_1F15EE5B0;
}

- (int64_t)tokenEmbeddingType
{
  return 6;
}

- (unint64_t)version
{
  return 1;
}

- (id)tokensForAgeType_:(unsigned __int16)a3
{
  v3 = &unk_1F15EE5E0;
  if (a3 != 2) {
    v3 = 0;
  }
  if (a3 == 1) {
    return &unk_1F15EE5C8;
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
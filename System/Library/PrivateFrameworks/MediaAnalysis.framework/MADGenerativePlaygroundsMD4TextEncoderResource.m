@interface MADGenerativePlaygroundsMD4TextEncoderResource
- (BOOL)supportsAgeTypePromptAdjustment;
- (id)additionalLayerNames;
- (id)tokensForAgeType_:(unsigned __int16)a3;
- (int64_t)revision;
- (int64_t)tokenEmbeddingType;
- (unint64_t)version;
@end

@implementation MADGenerativePlaygroundsMD4TextEncoderResource

- (int64_t)revision
{
  return 8;
}

- (id)additionalLayerNames
{
  return &unk_1F15EE5F8;
}

- (int64_t)tokenEmbeddingType
{
  return 6;
}

- (unint64_t)version
{
  return 4;
}

- (id)tokensForAgeType_:(unsigned __int16)a3
{
  v3 = &unk_1F15EE628;
  if (a3 != 2) {
    v3 = 0;
  }
  if (a3 == 1) {
    return &unk_1F15EE610;
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
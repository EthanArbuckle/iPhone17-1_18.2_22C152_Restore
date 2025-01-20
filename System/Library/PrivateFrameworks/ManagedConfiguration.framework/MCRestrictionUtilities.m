@interface MCRestrictionUtilities
+ (id)intersectionFeatureForPayloadRestrictionKey:(id)a3;
+ (id)intersectionFeaturesWithPayloadRestictionKeyAlias;
+ (id)intersectionPayloadRestrictionKeysForFeature:(id)a3;
@end

@implementation MCRestrictionUtilities

+ (id)intersectionFeaturesWithPayloadRestictionKeyAlias
{
  v2 = _intersectionFeaturesToAlias();
  v3 = [v2 allKeys];

  return v3;
}

+ (id)intersectionPayloadRestrictionKeysForFeature:(id)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = _intersectionFeaturesToAlias();
  v5 = [v4 objectForKey:v3];
  v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    v10[0] = v3;
    id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
  }
  v8 = v7;

  return v8;
}

+ (id)intersectionFeatureForPayloadRestrictionKey:(id)a3
{
  uint64_t v3 = _intersectionAliasToFeatures_onceToken;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&_intersectionAliasToFeatures_onceToken, &__block_literal_global_11);
  }
  v5 = [(id)_intersectionAliasToFeatures_dict objectForKey:v4];
  v6 = v5;
  if (!v5) {
    v5 = v4;
  }
  id v7 = v5;

  return v7;
}

@end
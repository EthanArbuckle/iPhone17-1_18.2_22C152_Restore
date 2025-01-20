@interface IPiOSABNamePreferenceInfoProvider
+ (id)canonicalKeyToValueIdentifierToNumericValueMap;
+ (id)canonicalNameToNativeKeyName;
+ (id)domain;
+ (id)nativeKeyNameToCanonicalKeyName;
+ (id)valueIdentifierToValueMapFromCanonicalKey:(id)a3;
+ (id)valueToValueIdentifierMapFromCanonicalKey:(id)a3;
@end

@implementation IPiOSABNamePreferenceInfoProvider

+ (id)domain
{
  return @"com.apple.PeoplePicker";
}

+ (id)nativeKeyNameToCanonicalKeyName
{
  if (nativeKeyNameToCanonicalKeyName_onceToken != -1) {
    dispatch_once(&nativeKeyNameToCanonicalKeyName_onceToken, &__block_literal_global_2);
  }
  v2 = (void *)nativeKeyNameToCanonicalKeyName_sMapping;
  return v2;
}

void __68__IPiOSABNamePreferenceInfoProvider_nativeKeyNameToCanonicalKeyName__block_invoke()
{
  v3[4] = *MEMORY[0x1E4F143B8];
  v2[0] = @"personNameOrdering";
  v2[1] = @"personShortNameFormat";
  v3[0] = @"nameOrder";
  v3[1] = @"shortNameFormat";
  v2[2] = @"personShortNamePreferNicknames";
  v2[3] = @"personShortNameFormatEnabled";
  v3[2] = @"preferNicknames";
  v3[3] = @"shortNameEnabled";
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:4];
  v1 = (void *)nativeKeyNameToCanonicalKeyName_sMapping;
  nativeKeyNameToCanonicalKeyName_sMapping = v0;
}

+ (id)canonicalNameToNativeKeyName
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__IPiOSABNamePreferenceInfoProvider_canonicalNameToNativeKeyName__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (canonicalNameToNativeKeyName_onceToken != -1) {
    dispatch_once(&canonicalNameToNativeKeyName_onceToken, block);
  }
  v2 = (void *)canonicalNameToNativeKeyName_sMapping;
  return v2;
}

void __65__IPiOSABNamePreferenceInfoProvider_canonicalNameToNativeKeyName__block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) nativeKeyNameToCanonicalKeyName];
  uint64_t v1 = [v3 invertedDictionary];
  v2 = (void *)canonicalNameToNativeKeyName_sMapping;
  canonicalNameToNativeKeyName_sMapping = v1;
}

+ (id)valueIdentifierToValueMapFromCanonicalKey:(id)a3
{
  id v4 = a3;
  v5 = [a1 canonicalKeyToValueIdentifierToNumericValueMap];
  v6 = [v5 objectForKeyedSubscript:v4];

  return v6;
}

+ (id)valueToValueIdentifierMapFromCanonicalKey:(id)a3
{
  id v4 = a3;
  v5 = [a1 canonicalKeyToValueIdentifierToNumericValueMap];
  v6 = [v5 objectForKeyedSubscript:v4];

  v7 = [v6 invertedDictionary];

  return v7;
}

+ (id)canonicalKeyToValueIdentifierToNumericValueMap
{
  if (canonicalKeyToValueIdentifierToNumericValueMap_onceToken != -1) {
    dispatch_once(&canonicalKeyToValueIdentifierToNumericValueMap_onceToken, &__block_literal_global_79);
  }
  v2 = (void *)canonicalKeyToValueIdentifierToNumericValueMap_sMapping;
  return v2;
}

void __83__IPiOSABNamePreferenceInfoProvider_canonicalKeyToValueIdentifierToNumericValueMap__block_invoke()
{
  v15[4] = *MEMORY[0x1E4F143B8];
  v14[0] = @"nameOrder";
  v12[0] = @"givenFirst";
  v12[1] = @"familyFirst";
  v13[0] = &unk_1F19D8840;
  v13[1] = &unk_1F19D8858;
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:2];
  v15[0] = v0;
  v14[1] = @"shortNameFormat";
  v10[0] = @"givenNameFamilyInitial";
  v10[1] = @"familyNameGivenInitial";
  v11[0] = &unk_1F19D8840;
  v11[1] = &unk_1F19D8858;
  v10[2] = @"givenOnly";
  v10[3] = @"familyOnly";
  v11[2] = &unk_1F19D8870;
  v11[3] = &unk_1F19D8888;
  uint64_t v1 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:4];
  v15[1] = v1;
  v14[2] = @"preferNicknames";
  v8[0] = @"preferNicknamesEnabled";
  v8[1] = @"preferNicknamesDisabled";
  v9[0] = &unk_1F19D8858;
  v9[1] = &unk_1F19D8840;
  v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:2];
  v15[2] = v2;
  v14[3] = @"shortNameEnabled";
  v6[0] = @"shortNamesEnabled";
  v6[1] = @"shortNamesDisabled";
  v7[0] = &unk_1F19D8858;
  v7[1] = &unk_1F19D8840;
  id v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:2];
  v15[3] = v3;
  uint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:4];
  v5 = (void *)canonicalKeyToValueIdentifierToNumericValueMap_sMapping;
  canonicalKeyToValueIdentifierToNumericValueMap_sMapping = v4;
}

@end
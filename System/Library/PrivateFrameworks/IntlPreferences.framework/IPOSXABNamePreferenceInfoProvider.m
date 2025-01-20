@interface IPOSXABNamePreferenceInfoProvider
+ (id)canonicalKeyToValueIdentifierToNumericValueMap;
+ (id)canonicalNameToNativeKeyName;
+ (id)domain;
+ (id)nativeKeyNameToCanonicalKeyName;
+ (id)valueIdentifierToValueMapFromCanonicalKey:(id)a3;
+ (id)valueToValueIdentifierMapFromCanonicalKey:(id)a3;
@end

@implementation IPOSXABNamePreferenceInfoProvider

+ (id)domain
{
  return @"com.apple.AddressBook";
}

+ (id)nativeKeyNameToCanonicalKeyName
{
  if (nativeKeyNameToCanonicalKeyName_onceToken_144 != -1) {
    dispatch_once(&nativeKeyNameToCanonicalKeyName_onceToken_144, &__block_literal_global_146);
  }
  v2 = (void *)nativeKeyNameToCanonicalKeyName_sMapping_143;
  return v2;
}

void __68__IPOSXABNamePreferenceInfoProvider_nativeKeyNameToCanonicalKeyName__block_invoke()
{
  v3[3] = *MEMORY[0x1E4F143B8];
  v2[0] = @"ABNameDisplay";
  v2[1] = @"ABShortNameStyle";
  v3[0] = @"nameOrder";
  v3[1] = @"shortNameFormat";
  v2[2] = @"ABShortNamePrefersNickname";
  v3[2] = @"preferNicknames";
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:3];
  v1 = (void *)nativeKeyNameToCanonicalKeyName_sMapping_143;
  nativeKeyNameToCanonicalKeyName_sMapping_143 = v0;
}

+ (id)canonicalNameToNativeKeyName
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__IPOSXABNamePreferenceInfoProvider_canonicalNameToNativeKeyName__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (canonicalNameToNativeKeyName_onceToken_157 != -1) {
    dispatch_once(&canonicalNameToNativeKeyName_onceToken_157, block);
  }
  v2 = (void *)canonicalNameToNativeKeyName_sMapping_156;
  return v2;
}

void __65__IPOSXABNamePreferenceInfoProvider_canonicalNameToNativeKeyName__block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) nativeKeyNameToCanonicalKeyName];
  uint64_t v1 = [v3 invertedDictionary];
  v2 = (void *)canonicalNameToNativeKeyName_sMapping_156;
  canonicalNameToNativeKeyName_sMapping_156 = v1;
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
  if (canonicalKeyToValueIdentifierToNumericValueMap_onceToken_159 != -1) {
    dispatch_once(&canonicalKeyToValueIdentifierToNumericValueMap_onceToken_159, &__block_literal_global_161);
  }
  v2 = (void *)canonicalKeyToValueIdentifierToNumericValueMap_sMapping_158;
  return v2;
}

void __83__IPOSXABNamePreferenceInfoProvider_canonicalKeyToValueIdentifierToNumericValueMap__block_invoke()
{
  v15[4] = *MEMORY[0x1E4F143B8];
  v12[0] = @"givenFirst";
  v12[1] = @"familyFirst";
  v13[0] = &unk_1F19D8840;
  v13[1] = &unk_1F19D8858;
  v14[0] = @"nameOrder";
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:2];
  v14[1] = @"shortNameFormat";
  v10[0] = @"unset";
  v10[1] = @"givenNameFamilyInitial";
  v10[2] = @"familyNameGivenInitial";
  v10[3] = @"givenOnly";
  v15[0] = v0;
  v11[2] = &unk_1F19D8870;
  v11[3] = &unk_1F19D8888;
  v11[0] = &unk_1F19D8840;
  v11[1] = &unk_1F19D8858;
  v10[4] = @"familyOnly";
  v11[4] = &unk_1F19D88A0;
  uint64_t v1 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:5];
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
  v5 = (void *)canonicalKeyToValueIdentifierToNumericValueMap_sMapping_158;
  canonicalKeyToValueIdentifierToNumericValueMap_sMapping_158 = v4;
}

@end
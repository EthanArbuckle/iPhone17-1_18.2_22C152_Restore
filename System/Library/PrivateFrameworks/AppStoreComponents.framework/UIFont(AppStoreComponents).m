@interface UIFont(AppStoreComponents)
+ (id)asc_fontDerivedFromTextStyle:()AppStoreComponents byApplyingFontWeight:;
+ (id)asc_fontDerivedFromTextStyle:()AppStoreComponents byApplyingFontWeight:compatibleWithTraitCollection:;
+ (id)asc_preferredFontForTextStyle:()AppStoreComponents withTraits:;
+ (id)asc_preferredFontForTextStyle:()AppStoreComponents withTraits:compatibleWithTraitCollection:;
+ (uint64_t)asc_preferredFontForTextStyle:()AppStoreComponents compatibleWithTraitCollection:;
@end

@implementation UIFont(AppStoreComponents)

+ (id)asc_fontDerivedFromTextStyle:()AppStoreComponents byApplyingFontWeight:compatibleWithTraitCollection:
{
  v19[2] = *MEMORY[0x1E4F143B8];
  v4 = objc_msgSend(MEMORY[0x1E4FB17A0], "preferredFontDescriptorWithTextStyle:compatibleWithTraitCollection:");
  id v5 = objc_alloc(MEMORY[0x1E4FB17A0]);
  v18[0] = *MEMORY[0x1E4FB2870];
  v6 = NSNumber;
  [v4 pointSize];
  v7 = objc_msgSend(v6, "numberWithDouble:");
  v19[0] = v7;
  v18[1] = *MEMORY[0x1E4FB2880];
  uint64_t v8 = *MEMORY[0x1E4FB28C0];
  v17[0] = *MEMORY[0x1E4FB28B8];
  uint64_t v9 = *MEMORY[0x1E4FB29E0];
  v16[0] = v8;
  v16[1] = v9;
  v10 = [NSNumber numberWithDouble:a2];
  v17[1] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:2];
  v19[1] = v11;
  v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:2];
  v13 = (void *)[v5 initWithFontAttributes:v12];

  v14 = [a1 fontWithDescriptor:v13 size:0.0];

  return v14;
}

+ (id)asc_fontDerivedFromTextStyle:()AppStoreComponents byApplyingFontWeight:
{
  void v16[2] = *MEMORY[0x1E4F143B8];
  v4 = objc_msgSend(MEMORY[0x1E4FB17A0], "preferredFontDescriptorWithTextStyle:");
  id v5 = objc_alloc(MEMORY[0x1E4F1CA60]);
  v6 = [v4 fontAttributes];
  v7 = (void *)[v5 initWithDictionary:v6];

  uint64_t v8 = *MEMORY[0x1E4FB28B8];
  uint64_t v9 = *MEMORY[0x1E4FB29E0];
  v15[0] = *MEMORY[0x1E4FB28C0];
  v15[1] = v9;
  v16[0] = v8;
  v10 = [NSNumber numberWithDouble:a2];
  v16[1] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:2];
  [v7 setObject:v11 forKeyedSubscript:*MEMORY[0x1E4FB2880]];

  v12 = (void *)[objc_alloc(MEMORY[0x1E4FB17A0]) initWithFontAttributes:v7];
  v13 = [a1 fontWithDescriptor:v12 size:0.0];

  return v13;
}

+ (uint64_t)asc_preferredFontForTextStyle:()AppStoreComponents compatibleWithTraitCollection:
{
  return objc_msgSend(MEMORY[0x1E4FB1798], "preferredFontForTextStyle:compatibleWithTraitCollection:");
}

+ (id)asc_preferredFontForTextStyle:()AppStoreComponents withTraits:compatibleWithTraitCollection:
{
  id v8 = a3;
  uint64_t v9 = [MEMORY[0x1E4FB17A0] preferredFontDescriptorWithTextStyle:v8 compatibleWithTraitCollection:a5];
  v10 = [v9 fontDescriptorWithSymbolicTraits:a4];
  if (v10)
  {
    v11 = a1;
    v12 = v10;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      +[UIFont(AppStoreComponents) asc_preferredFontForTextStyle:withTraits:compatibleWithTraitCollection:]();
    }
    v11 = a1;
    v12 = v9;
  }
  v13 = [v11 fontWithDescriptor:v12 size:0.0];

  return v13;
}

+ (id)asc_preferredFontForTextStyle:()AppStoreComponents withTraits:
{
  id v6 = a3;
  v7 = [MEMORY[0x1E4FB17A0] preferredFontDescriptorWithTextStyle:v6];
  id v8 = [v7 fontDescriptorWithSymbolicTraits:a4];
  if (v8)
  {
    uint64_t v9 = a1;
    v10 = v8;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      +[UIFont(AppStoreComponents) asc_preferredFontForTextStyle:withTraits:compatibleWithTraitCollection:]();
    }
    uint64_t v9 = a1;
    v10 = v7;
  }
  v11 = [v9 fontWithDescriptor:v10 size:0.0];

  return v11;
}

+ (void)asc_preferredFontForTextStyle:()AppStoreComponents withTraits:compatibleWithTraitCollection:.cold.1()
{
  uint64_t v1 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0_5();
  _os_log_error_impl(&dword_1C2B8D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Could not apply symbolic traits %d to %@", v0, 0x12u);
}

@end
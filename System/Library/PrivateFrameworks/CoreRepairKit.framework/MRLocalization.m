@interface MRLocalization
- (id)localizedStringWithKey:(id)a3 defaultString:(id)a4;
@end

@implementation MRLocalization

- (id)localizedStringWithKey:(id)a3 defaultString:(id)a4
{
  id v5 = a4;
  v6 = (void *)MEMORY[0x1E4F28B50];
  id v7 = a3;
  v10 = objc_msgSend_bundleWithPath_(v6, v8, @"/System/Library/PrivateFrameworks/CoreRepairKit.framework", v9);
  v11 = (void *)MEMORY[0x1E4F28B50];
  v15 = objc_msgSend_localizations(v10, v12, v13, v14);
  v19 = objc_msgSend_preferredLanguages(MEMORY[0x1E4F1CA20], v16, v17, v18);
  v21 = objc_msgSend_preferredLocalizationsFromArray_forPreferences_(v11, v20, (uint64_t)v15, (uint64_t)v19);

  v24 = objc_msgSend_objectAtIndexedSubscript_(v21, v22, 0, v23);
  v26 = objc_msgSend_localizedStringForKey_value_table_localization_(v10, v25, (uint64_t)v7, @"NOTFOUND", @"Localizable", v24);

  if (objc_msgSend_isEqualToString_(v26, v27, @"NOTFOUND", v28))
  {
    id v29 = v5;

    v26 = v29;
  }

  return v26;
}

@end
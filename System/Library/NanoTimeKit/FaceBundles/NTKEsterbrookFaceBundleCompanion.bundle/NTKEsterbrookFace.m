@interface NTKEsterbrookFace
+ (BOOL)isRestrictedForDevice:(id)a3;
+ (id)pigmentFaceDomain;
- (BOOL)supportsPigmentEditOption;
- (Class)_optionClassForCustomEditMode:(int64_t)a3;
- (id)_customEditModes;
- (id)_defaultOptionForCustomEditMode:(int64_t)a3 slot:(id)a4;
- (id)_faceDescription;
- (id)_faceDescriptionKey;
- (id)_optionAtIndex:(unint64_t)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (id)faceSharingName;
- (unint64_t)_indexOfOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (unint64_t)_numberOfOptionsForCustomEditMode:(int64_t)a3 slot:(id)a4;
@end

@implementation NTKEsterbrookFace

- (id)_faceDescriptionKey
{
  return @"FACE_STYLE_ESTERBROOK_DESCRIPTION";
}

- (id)faceSharingName
{
  return (id)objc_msgSend_localizedStringForKey_comment_(NTKEsterbrookFaceBundle, a2, @"FACE_STYLE_ESTERBROOK_IN_TITLE_CASE", @"Esterbrook");
}

- (id)_faceDescription
{
  v4 = objc_msgSend__faceDescriptionKey(self, a2, v2, v3);
  v6 = objc_msgSend_localizedStringForKey_comment_(NTKEsterbrookFaceBundle, v5, (uint64_t)v4, (uint64_t)v4);

  return v6;
}

+ (BOOL)isRestrictedForDevice:(id)a3
{
  id v3 = a3;
  uint64_t v7 = objc_msgSend_deviceCategory(v3, v4, v5, v6);
  char v8 = _os_feature_enabled_impl();
  id v9 = objc_alloc(MEMORY[0x263F08C38]);
  v12 = objc_msgSend_initWithUUIDString_(v9, v10, @"E7B1CD81-445C-4840-9F24-3A32B510B6A1", v11);
  char v15 = objc_msgSend_supportsCapability_(v3, v13, (uint64_t)v12, v14);

  id v16 = objc_alloc(MEMORY[0x263F08C38]);
  v19 = objc_msgSend_initWithUUIDString_(v16, v17, @"31001ED2-BD9E-4705-B297-53032117179E", v18);
  char v22 = objc_msgSend_supportsCapability_(v3, v20, (uint64_t)v19, v21);

  if (v7 == 1) {
    char v23 = 0;
  }
  else {
    char v23 = v8;
  }
  return v23 & v15 & v22 ^ 1;
}

- (id)_customEditModes
{
  return &unk_26FB08F10;
}

- (id)_defaultOptionForCustomEditMode:(int64_t)a3 slot:(id)a4
{
  uint64_t v6 = objc_msgSend_device(self, a2, a3, (uint64_t)a4);
  if (a3 == 11)
  {
    uint64_t v7 = objc_msgSend_optionWithDensity_forDevice_(NTKEsterbrookDensityEditOption, v5, 1, (uint64_t)v6);
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (unint64_t)_numberOfOptionsForCustomEditMode:(int64_t)a3 slot:(id)a4
{
  uint64_t v5 = objc_msgSend__optionClassForCustomEditMode_(self, a2, a3, (uint64_t)a4);
  id v9 = objc_msgSend_device(self, v6, v7, v8);
  unint64_t v12 = objc_msgSend_numberOfOptionsForDevice_(v5, v10, (uint64_t)v9, v11);

  return v12;
}

- (id)_optionAtIndex:(unint64_t)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  uint64_t v7 = objc_msgSend__optionClassForCustomEditMode_(self, a2, a4, a4, a5);
  uint64_t v11 = objc_msgSend_device(self, v8, v9, v10);
  v13 = objc_msgSend_optionAtIndex_forDevice_(v7, v12, a3, (uint64_t)v11);

  return v13;
}

- (unint64_t)_indexOfOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  id v7 = a3;
  uint64_t v10 = objc_msgSend__optionClassForCustomEditMode_(self, v8, a4, v9);
  uint64_t v14 = objc_msgSend_device(self, v11, v12, v13);
  unint64_t v16 = objc_msgSend_indexOfOption_forDevice_(v10, v15, (uint64_t)v7, (uint64_t)v14);

  return v16;
}

- (Class)_optionClassForCustomEditMode:(int64_t)a3
{
  if (a3 == 11)
  {
    v4 = objc_opt_class();
  }
  else
  {
    v4 = 0;
  }
  return (Class)v4;
}

- (BOOL)supportsPigmentEditOption
{
  return 1;
}

+ (id)pigmentFaceDomain
{
  return @"esterbrook";
}

@end
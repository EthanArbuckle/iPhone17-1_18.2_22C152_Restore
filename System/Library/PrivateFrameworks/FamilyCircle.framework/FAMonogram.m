@interface FAMonogram
+ (id)monogramForContact:(id)a3 diameter:(double)a4 scale:(double)a5;
+ (id)monogramWithFirstName:(id)a3 lastName:(id)a4 diameter:(double)a5 scale:(double)a6;
+ (id)silhouetteMonogramWithDiameter:(double)a3 scale:(double)a4;
@end

@implementation FAMonogram

+ (id)monogramForContact:(id)a3 diameter:(double)a4 scale:(double)a5
{
  v32[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = objc_alloc_init(MEMORY[0x1E4F1BA40]);
  objc_msgSend(v8, "setContactType:", objc_msgSend(v7, "contactType"));
  v9 = [v7 givenName];
  [v8 setGivenName:v9];

  v10 = [v7 middleName];
  [v8 setMiddleName:v10];

  v11 = [v7 familyName];
  [v8 setFamilyName:v11];

  v12 = [v7 namePrefix];
  [v8 setNamePrefix:v12];

  v13 = [v7 nameSuffix];
  [v8 setNameSuffix:v13];

  v14 = [v7 nickname];
  [v8 setNickname:v14];

  v15 = (void *)MEMORY[0x1E4F1CA20];
  v16 = [MEMORY[0x1E4F1CA20] currentLocale];
  v17 = [v16 languageCode];
  uint64_t v18 = [v15 characterDirectionForLanguage:v17];

  uint64_t v28 = 0;
  v29 = &v28;
  uint64_t v30 = 0x2050000000;
  v19 = (void *)getCNAvatarImageRenderingScopeClass_softClass;
  uint64_t v31 = getCNAvatarImageRenderingScopeClass_softClass;
  if (!getCNAvatarImageRenderingScopeClass_softClass)
  {
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __getCNAvatarImageRenderingScopeClass_block_invoke;
    v27[3] = &unk_1E69253D8;
    v27[4] = &v28;
    __getCNAvatarImageRenderingScopeClass_block_invoke((uint64_t)v27);
    v19 = (void *)v29[3];
  }
  id v20 = v19;
  _Block_object_dispose(&v28, 8);
  v21 = objc_msgSend(v20, "scopeWithPointSize:scale:rightToLeft:style:", v18 == 2, 0, a4, a4, a5);
  id v22 = objc_alloc_init((Class)getCNAvatarImageRendererClass());
  v32[0] = v8;
  v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:1];
  v24 = [v22 avatarImageForContacts:v23 scope:v21];
  v25 = _weakUIImagePNGRepresentation(v24);

  return v25;
}

+ (id)silhouetteMonogramWithDiameter:(double)a3 scale:(double)a4
{
  id v6 = objc_alloc_init((Class)getCNAvatarImageRendererClass());
  id v7 = [v6 placeholderImageProvider];
  id v8 = objc_msgSend(v7, "imageForSize:scale:", a3, a3, a4);
  v9 = _weakUIImagePNGRepresentation(v8);

  return v9;
}

+ (id)monogramWithFirstName:(id)a3 lastName:(id)a4 diameter:(double)a5 scale:(double)a6
{
  v10 = (objc_class *)MEMORY[0x1E4F1BA40];
  id v11 = a4;
  id v12 = a3;
  id v13 = objc_alloc_init(v10);
  [v13 setContactType:0];
  [v13 setGivenName:v12];

  [v13 setFamilyName:v11];
  v14 = [a1 monogramForContact:v13 diameter:a5 scale:a6];

  return v14;
}

@end
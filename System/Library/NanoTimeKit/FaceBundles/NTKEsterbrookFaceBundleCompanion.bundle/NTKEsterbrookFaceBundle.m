@interface NTKEsterbrookFaceBundle
+ (id)logCategoryName;
- (Class)faceClass;
- (Class)faceViewClass;
- (id)defaultFaceForDevice:(id)a3;
- (id)galleryDescriptionText;
- (id)galleryFacesForDevice:(id)a3;
- (id)galleryTitle;
- (id)heroFacesForDevice:(id)a3;
@end

@implementation NTKEsterbrookFaceBundle

- (Class)faceClass
{
  return (Class)objc_opt_class();
}

- (Class)faceViewClass
{
  return (Class)objc_opt_class();
}

- (id)defaultFaceForDevice:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_class();
  v8 = objc_msgSend_identifier(v4, v5, v6, v7);
  v9 = objc_opt_class();
  v13 = objc_msgSend_analyticsIdentifier(v9, v10, v11, v12);
  v15 = objc_msgSend_bundledFaceWithIdentifier_analyticsIdentifier_forDevice_initCustomization_(NTKEsterbrookFace, v14, (uint64_t)v8, (uint64_t)v13, v3, 0);

  return v15;
}

- (id)heroFacesForDevice:(id)a3
{
  v22[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = objc_alloc(MEMORY[0x263F08C38]);
  v8 = objc_msgSend_initWithUUIDString_(v5, v6, @"DAB81146-4105-445B-94AD-14033A199AC4", v7);
  char v11 = objc_msgSend_supportsCapability_(v4, v9, (uint64_t)v8, v10);

  if (v11)
  {
    v14 = (void *)MEMORY[0x263EFFA68];
  }
  else
  {
    v15 = objc_msgSend_defaultFaceForDevice_(self, v12, (uint64_t)v4, v13);
    id v16 = objc_alloc(MEMORY[0x263F579E8]);
    uint64_t v18 = objc_msgSend_initWithFace_priority_(v16, v17, (uint64_t)v15, 200);
    v20 = (void *)v18;
    if (v18)
    {
      v22[0] = v18;
      v14 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v19, (uint64_t)v22, 1);
    }
    else
    {
      v14 = (void *)MEMORY[0x263EFFA68];
    }
  }

  return v14;
}

- (id)galleryTitle
{
  return (id)objc_msgSend_localizedStringForKey_comment_(NTKEsterbrookFaceBundle, a2, @"FACE_STYLE_ESTERBROOK_IN_TITLE_CASE", @"Esterbrook");
}

- (id)galleryDescriptionText
{
  return (id)objc_msgSend_localizedStringForKey_comment_(NTKEsterbrookFaceBundle, a2, @"FACE_GALLERY_ESTERBROOK_DESCRIPTION", @"Esterbrook Description");
}

- (id)galleryFacesForDevice:(id)a3
{
  v8[1] = *MEMORY[0x263EF8340];
  id v4 = objc_msgSend_defaultFaceForDevice_(self, a2, (uint64_t)a3, v3);
  v8[0] = v4;
  uint64_t v6 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v5, (uint64_t)v8, 1);

  return v6;
}

+ (id)logCategoryName
{
  return @"Esterbrook.Face";
}

@end
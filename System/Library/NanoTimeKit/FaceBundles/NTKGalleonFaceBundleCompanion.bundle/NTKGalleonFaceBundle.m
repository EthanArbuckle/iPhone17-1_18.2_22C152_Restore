@interface NTKGalleonFaceBundle
- (Class)faceClass;
- (Class)faceViewClass;
- (id)defaultFaceForDevice:(id)a3;
- (id)galleryDescriptionText;
- (id)galleryTitle;
- (id)heroFacesForDevice:(id)a3;
@end

@implementation NTKGalleonFaceBundle

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
  v15 = objc_msgSend_bundledFaceWithIdentifier_analyticsIdentifier_forDevice_initCustomization_(NTKGalleonFace, v14, (uint64_t)v8, (uint64_t)v13, v3, 0);

  return v15;
}

- (id)galleryDescriptionText
{
  return (id)objc_msgSend_localizedStringForKey_comment_(NTKGalleonFaceBundle, a2, @"FACE_STYLE_GALLEON_DESCRIPTION", @"Galleon Gallery Description");
}

- (id)galleryTitle
{
  return (id)objc_msgSend_localizedStringForKey_comment_(NTKGalleonFaceBundle, a2, @"FACE_STYLE_GALLEON_IN_TITLE_CASE", @"Galleon");
}

- (id)heroFacesForDevice:(id)a3
{
  v21[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = objc_alloc(MEMORY[0x263F08C38]);
  v8 = objc_msgSend_initWithUUIDString_(v5, v6, @"E7B1CD81-445C-4840-9F24-3A32B510B6A1", v7);
  char v11 = objc_msgSend_supportsCapability_(v4, v9, (uint64_t)v8, v10);

  if (v11)
  {
    v14 = (void *)MEMORY[0x263EFFA68];
  }
  else
  {
    v15 = objc_msgSend_defaultFaceForDevice_(self, v12, (uint64_t)v4, v13);
    id v16 = objc_alloc(MEMORY[0x263F579E8]);
    v18 = objc_msgSend_initWithFace_priority_(v16, v17, (uint64_t)v15, 800);
    v21[0] = v18;
    v14 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v19, (uint64_t)v21, 1);
  }

  return v14;
}

@end
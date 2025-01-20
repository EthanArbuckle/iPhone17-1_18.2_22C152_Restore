@interface NTKGalleonHeadingImageGenerator
+ (id)_generatePrerenderedLookup;
+ (id)_imageForHeadingString:(id)a3 font:(id)a4;
+ (id)sharedGenerator;
- (id)_init;
- (id)imageForHeading:(unint64_t)a3;
@end

@implementation NTKGalleonHeadingImageGenerator

+ (id)sharedGenerator
{
  id v2 = a1;
  objc_sync_enter(v2);
  WeakRetained = objc_loadWeakRetained(&qword_2691D5910);
  if (!WeakRetained)
  {
    v4 = [NTKGalleonHeadingImageGenerator alloc];
    WeakRetained = objc_msgSend__init(v4, v5, v6, v7);
    objc_storeWeak(&qword_2691D5910, WeakRetained);
  }
  objc_sync_exit(v2);

  return WeakRetained;
}

- (id)imageForHeading:(unint64_t)a3
{
  imageLookup = self->_imageLookup;
  v5 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, a2, a3, v3);
  v8 = objc_msgSend_objectForKey_(imageLookup, v6, (uint64_t)v5, v7);

  return v8;
}

- (id)_init
{
  v9.receiver = self;
  v9.super_class = (Class)NTKGalleonHeadingImageGenerator;
  v5 = [(NTKGalleonHeadingImageGenerator *)&v9 init];
  if (v5)
  {
    uint64_t v6 = objc_msgSend__generatePrerenderedLookup(NTKGalleonHeadingImageGenerator, v2, v3, v4);
    imageLookup = v5->_imageLookup;
    v5->_imageLookup = (NSDictionary *)v6;
  }
  return v5;
}

+ (id)_generatePrerenderedLookup
{
  v5 = objc_msgSend_dictionary(MEMORY[0x263EFF9A0], a2, v2, v3);
  objc_super v9 = objc_msgSend_sharedGenerator(NTKGalleonHeadingGenerator, v6, v7, v8);
  v15 = objc_msgSend_galleon_headingFont(MEMORY[0x263EFD198], v10, v11, v12);
  for (uint64_t i = 0; i != 360; ++i)
  {
    v17 = objc_msgSend_stringForHeading_(v9, v13, i, v14);
    v19 = objc_msgSend__imageForHeadingString_font_(a1, v18, (uint64_t)v17, (uint64_t)v15);
    v22 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v20, i, v21);
    objc_msgSend_setObject_forKey_(v5, v23, (uint64_t)v19, (uint64_t)v22);
  }
  v24 = objc_msgSend_stringForHeading_(v9, v13, -1, v14);
  v26 = objc_msgSend__imageForHeadingString_font_(a1, v25, (uint64_t)v24, (uint64_t)v15);
  objc_msgSend_setObject_forKey_(v5, v27, (uint64_t)v26, (uint64_t)&unk_26FB19350);

  v31 = objc_msgSend_copy(v5, v28, v29, v30);

  return v31;
}

+ (id)_imageForHeadingString:(id)a3 font:(id)a4
{
  v44[2] = *MEMORY[0x263EF8340];
  id v5 = a3;
  uint64_t v6 = *MEMORY[0x263F1C238];
  v44[0] = a4;
  uint64_t v7 = *MEMORY[0x263F1C240];
  v43[0] = v6;
  v43[1] = v7;
  uint64_t v8 = (void *)MEMORY[0x263F1C550];
  id v9 = a4;
  v13 = objc_msgSend_whiteColor(v8, v10, v11, v12);
  v44[1] = v13;
  v15 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v14, (uint64_t)v44, (uint64_t)v43, 2);

  objc_msgSend_sizeWithAttributes_(v5, v16, (uint64_t)v15, v17);
  double v19 = v18;
  double v21 = v20;
  id v22 = objc_alloc(MEMORY[0x263F1C680]);
  v26 = objc_msgSend_initWithSize_(v22, v23, v24, v25, v19, v21);
  v36[0] = MEMORY[0x263EF8330];
  v36[1] = 3221225472;
  v36[2] = sub_246B37C04;
  v36[3] = &unk_2651F8E10;
  uint64_t v39 = 0;
  uint64_t v40 = 0;
  double v41 = v19;
  double v42 = v21;
  id v37 = v5;
  id v38 = v15;
  id v27 = v15;
  id v28 = v5;
  v31 = objc_msgSend_imageWithActions_(v26, v29, (uint64_t)v36, v30);
  v34 = objc_msgSend_imageWithRenderingMode_(v31, v32, 2, v33);

  return v34;
}

- (void).cxx_destruct
{
}

@end
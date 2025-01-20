@interface NTKParmesanFontLoader
+ (id)_fontVariationAttributesFromDictionary:(id)a3;
+ (id)newyorkFontDescriptorWithAttributes:(id)a3;
+ (id)softFontDescriptorWithAttributes:(id)a3;
+ (id)tokyoFontDescriptorWithAttributes:(id)a3;
@end

@implementation NTKParmesanFontLoader

+ (id)softFontDescriptorWithAttributes:(id)a3
{
  uint64_t v4 = qword_2691D8E88;
  id v7 = a3;
  if (v4 != -1) {
    dispatch_once(&qword_2691D8E88, &unk_26FB1C260);
  }
  v8 = objc_msgSend__fontVariationAttributesFromDictionary_(a1, v5, (uint64_t)v7, v6);

  v10 = objc_msgSend_dictionaryWithObject_forKey_(NSDictionary, v9, (uint64_t)v8, *MEMORY[0x263F03BC0]);
  v13 = objc_msgSend_fontDescriptorByAddingAttributes_((void *)qword_2691D8E80, v11, (uint64_t)v10, v12);

  return v13;
}

+ (id)newyorkFontDescriptorWithAttributes:(id)a3
{
  uint64_t v4 = qword_2691D8E98;
  id v7 = a3;
  if (v4 != -1) {
    dispatch_once(&qword_2691D8E98, &unk_26FB1C280);
  }
  v8 = objc_msgSend__fontVariationAttributesFromDictionary_(a1, v5, (uint64_t)v7, v6);

  v10 = objc_msgSend_dictionaryWithObject_forKey_(NSDictionary, v9, (uint64_t)v8, *MEMORY[0x263F03BC0]);
  v13 = objc_msgSend_fontDescriptorByAddingAttributes_((void *)qword_2691D8E90, v11, (uint64_t)v10, v12);

  return v13;
}

+ (id)tokyoFontDescriptorWithAttributes:(id)a3
{
  uint64_t v4 = qword_2691D8EA8;
  id v7 = a3;
  if (v4 != -1) {
    dispatch_once(&qword_2691D8EA8, &unk_26FB1C2A0);
  }
  v8 = objc_msgSend__fontVariationAttributesFromDictionary_(a1, v5, (uint64_t)v7, v6);

  v10 = objc_msgSend_dictionaryWithObject_forKey_(NSDictionary, v9, (uint64_t)v8, *MEMORY[0x263F03BC0]);
  v13 = objc_msgSend_fontDescriptorByAddingAttributes_((void *)qword_2691D8EA0, v11, (uint64_t)v10, v12);

  return v13;
}

+ (id)_fontVariationAttributesFromDictionary:(id)a3
{
  id v3 = a3;
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x3032000000;
  uint64_t v12 = sub_246B76070;
  v13 = sub_246B76080;
  id v14 = (id)objc_opt_new();
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = sub_246B76088;
  v8[3] = &unk_2651FC360;
  v8[4] = &v9;
  objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v3, v4, (uint64_t)v8, v5);
  id v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

@end
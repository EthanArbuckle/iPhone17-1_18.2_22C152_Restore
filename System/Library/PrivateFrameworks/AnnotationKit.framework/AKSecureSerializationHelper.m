@interface AKSecureSerializationHelper
+ (id)_decodeAttributedStringFromRTFData:(id)a3;
+ (id)_decodeTextAttributesFromRTFData:(id)a3;
+ (id)_encodeAttributedStringAsRTFData:(id)a3;
+ (id)_encodeTextAttributesAsRTFData:(id)a3;
+ (id)dataForSecureCodingCompliantObject:(id)a3 withOptionalKey:(id)a4;
+ (id)decodeColor:(id)a3;
+ (id)decodeFont:(id)a3;
+ (id)decodeTextAttributes:(id)a3;
+ (id)encodeColor:(id)a3;
+ (id)encodeFont:(id)a3;
+ (id)encodeTextAttributes:(id)a3;
+ (id)secureCodingCompliantObjectForData:(id)a3 ofClasses:(id)a4 withOptionalKey:(id)a5;
+ (void)_decodeRTFTextPropertiesWithSecureCoder:(id)a3 annotationTextRTF:(id *)a4 typingAttributesRTF:(id *)a5;
+ (void)_decodeTextPropertiesForAnnotation:(id)a3 withSecureCoder:(id)a4;
+ (void)decodeTextPropertiesOfAnnotation:(id)a3 withSecureCoder:(id)a4;
+ (void)encodeTextPropertiesOfAnnotation:(id)a3 withCoder:(id)a4;
@end

@implementation AKSecureSerializationHelper

+ (id)dataForSecureCodingCompliantObject:(id)a3 withOptionalKey:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v5)
  {
    v7 = (void *)MEMORY[0x237E1DFC0]();
    v8 = (void *)[objc_alloc(MEMORY[0x263F08910]) initRequiringSecureCoding:1];
    v9 = (void *)*MEMORY[0x263F081D0];
    if (v6) {
      v9 = v6;
    }
    id v10 = v9;
    [v8 encodeObject:v5 forKey:v10];
    v11 = [v8 encodedData];
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (id)secureCodingCompliantObjectForData:(id)a3 ofClasses:(id)a4 withOptionalKey:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (v7)
  {
    id v10 = (void *)MEMORY[0x237E1DFC0]();
    v11 = (void *)[objc_alloc(MEMORY[0x263F08928]) initForReadingFromData:v7 error:0];
    v12 = (void *)*MEMORY[0x263F081D0];
    if (v9) {
      v12 = v9;
    }
    id v13 = v12;
    v14 = [MEMORY[0x263EFFA08] setWithArray:v8];
    v15 = [v11 decodeObjectOfClasses:v14 forKey:v13];

    [v11 finishDecoding];
    if (!v15)
    {
      v16 = os_log_create("com.apple.annotationkit", "Serialization");
      if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
        sub_2376DA020((uint64_t)v8, v16, v17, v18, v19, v20, v21, v22);
      }
    }
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

+ (void)encodeTextPropertiesOfAnnotation:(id)a3 withCoder:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  id v7 = [v13 annotationText];
  id v8 = v7;
  if (v7 && [v7 length])
  {
    id v9 = (void *)[objc_alloc(MEMORY[0x263F086A0]) initWithAttributedString:v8];
    id v10 = [a1 _encodeAttributedStringAsRTFData:v9];
    [v6 encodeObject:v10 forKey:@"annotationTextRTF"];
    [v6 encodeObject:v9 forKey:@"attributedString"];
  }
  v11 = [v13 typingAttributes];
  v12 = [a1 _encodeTextAttributesAsRTFData:v11];
  [v6 encodeObject:v12 forKey:@"typingAttributesRTF"];
  [v6 encodeObject:v11 forKey:@"typingAttributes"];
}

+ (void)decodeTextPropertiesOfAnnotation:(id)a3 withSecureCoder:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v7 requiresSecureCoding])
  {
    [a1 _decodeTextPropertiesForAnnotation:v6 withSecureCoder:v7];
  }
  else
  {
    id v8 = os_log_create("com.apple.annotationkit", "Serialization");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_2376DA08C();
    }

    [v6 setEditingDisabled:1];
  }
}

+ (id)encodeColor:(id)a3
{
  id v4 = [a3 colorUsingSRGBColorSpace];
  uint64_t v5 = [v4 CGColor];
  id v6 = [MEMORY[0x263F00608] colorWithCGColor:v5];
  id v7 = [a1 dataForSecureCodingCompliantObject:v6 withOptionalKey:0];

  return v7;
}

+ (id)decodeColor:(id)a3
{
  v9[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v9[0] = objc_opt_class();
  uint64_t v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:1];
  id v6 = [a1 secureCodingCompliantObjectForData:v4 ofClasses:v5 withOptionalKey:0];

  if (v6 && [v6 isMemberOfClass:objc_opt_class()])
  {
    id v7 = [MEMORY[0x263F1C550] akColorWithCIColor:v6];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

+ (id)encodeFont:(id)a3
{
  id v4 = [a3 fontDescriptor];
  uint64_t v5 = [a1 dataForSecureCodingCompliantObject:v4 withOptionalKey:0];

  return v5;
}

+ (id)decodeFont:(id)a3
{
  v9[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v9[0] = objc_opt_class();
  uint64_t v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:1];
  id v6 = [a1 secureCodingCompliantObjectForData:v4 ofClasses:v5 withOptionalKey:0];

  if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v7 = [MEMORY[0x263F1C658] fontWithDescriptor:v6 size:0.0];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

+ (id)encodeTextAttributes:(id)a3
{
  if (a3)
  {
    id v4 = objc_msgSend(a1, "_encodeTextAttributesAsRTFData:");
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

+ (id)decodeTextAttributes:(id)a3
{
  if (a3)
  {
    id v4 = objc_msgSend(a1, "_decodeTextAttributesFromRTFData:");
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

+ (void)_decodeTextPropertiesForAnnotation:(id)a3 withSecureCoder:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 akSerializationVersion] < 1)
  {
    v14 = os_log_create("com.apple.annotationkit", "Serialization");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_2376DA08C();
    }
    goto LABEL_16;
  }
  id v23 = 0;
  id v24 = 0;
  [a1 _decodeRTFTextPropertiesWithSecureCoder:v7 annotationTextRTF:&v24 typingAttributesRTF:&v23];
  id v8 = v24;
  id v9 = v23;
  if (!v9)
  {
    v15 = os_log_create("com.apple.annotationkit", "Serialization");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_2376DA0C0(v15);
    }

    v14 = os_log_create("com.apple.annotationkit", "Serialization");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_2376DA08C();
    }
LABEL_16:

    [v6 setEditingDisabled:1];
    goto LABEL_17;
  }
  id v10 = v9;
  if (v8)
  {
    v11 = [a1 _decodeAttributedStringFromRTFData:v8];
    if (v11)
    {
      id v12 = +[AKTextAnnotationAttributeHelper newTextStorageOriginalFontSavvyWithAttributedString:v11];
      [v6 setAnnotationText:v12];
    }
  }
  id v13 = [a1 _decodeTextAttributesFromRTFData:v10];
  if (v13) {
    [v6 setTypingAttributes:v13];
  }

LABEL_17:
  uint64_t v16 = [v6 typingAttributes];
  if (!v16
    || (uint64_t v17 = (void *)v16,
        [v6 typingAttributes],
        uint64_t v18 = objc_claimAutoreleasedReturnValue(),
        uint64_t v19 = [v18 count],
        v18,
        v17,
        !v19))
  {
    uint64_t v20 = [v6 annotationText];

    if (v20)
    {
      uint64_t v21 = [v6 annotationText];
      uint64_t v22 = [v21 attributesAtIndex:0 effectiveRange:0];
      [v6 setTypingAttributes:v22];
    }
    else
    {
      uint64_t v21 = +[AKAttributeController defaultTextAttributes];
      [v6 setTypingAttributes:v21];
    }
  }
}

+ (void)_decodeRTFTextPropertiesWithSecureCoder:(id)a3 annotationTextRTF:(id *)a4 typingAttributesRTF:(id *)a5
{
  id v9 = a3;
  if ([v9 containsValueForKey:@"annotationTextRTF"])
  {
    id v7 = [v9 decodeObjectOfClass:objc_opt_class() forKey:@"annotationTextRTF"];
  }
  else
  {
    id v7 = 0;
  }
  if (![v9 containsValueForKey:@"typingAttributesRTF"])
  {
    id v8 = 0;
    if (!a4) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  id v8 = [v9 decodeObjectOfClass:objc_opt_class() forKey:@"typingAttributesRTF"];
  if (a4) {
LABEL_8:
  }
    *a4 = v7;
LABEL_9:
  if (a5) {
    *a5 = v8;
  }
}

+ (id)_encodeAttributedStringAsRTFData:(id)a3
{
  v28[3] = *MEMORY[0x263EF8340];
  if (a3)
  {
    uint64_t v3 = (objc_class *)MEMORY[0x263F089B8];
    id v4 = a3;
    uint64_t v5 = (void *)[[v3 alloc] initWithAttributedString:v4];
    uint64_t v6 = [v4 length];
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = sub_237638B60;
    v25[3] = &unk_264CDAF80;
    id v7 = v5;
    id v26 = v7;
    objc_msgSend(v4, "enumerateAttributesInRange:options:usingBlock:", 0, v6, 0x100000, v25);

    uint64_t v8 = [v7 length];
    uint64_t v9 = *MEMORY[0x263F1C230];
    v28[0] = *MEMORY[0x263F1C278];
    uint64_t v10 = *MEMORY[0x263F1C288];
    v27[0] = v9;
    v27[1] = v10;
    v11 = [NSNumber numberWithInt:0];
    v28[1] = v11;
    v27[2] = *MEMORY[0x263F1C2B0];
    id v12 = [NSNumber numberWithInt:0];
    v28[2] = v12;
    id v13 = [NSDictionary dictionaryWithObjects:v28 forKeys:v27 count:3];
    id v24 = 0;
    v14 = objc_msgSend(v7, "dataFromRange:documentAttributes:error:", 0, v8, v13, &v24);
    id v15 = v24;

    if (v15)
    {
      uint64_t v16 = os_log_create("com.apple.annotationkit", "Serialization");
      if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
        sub_2376DA144((uint64_t)v15, v16, v17, v18, v19, v20, v21, v22);
      }

      v14 = 0;
    }
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

+ (id)_decodeAttributedStringFromRTFData:(id)a3
{
  v31[3] = *MEMORY[0x263EF8340];
  if (!a3)
  {
    uint64_t v20 = 0;
    goto LABEL_13;
  }
  uint64_t v3 = (objc_class *)MEMORY[0x263F086A0];
  id v4 = a3;
  id v5 = [v3 alloc];
  uint64_t v6 = *MEMORY[0x263F1C230];
  v31[0] = *MEMORY[0x263F1C278];
  uint64_t v7 = *MEMORY[0x263F1C288];
  v30[0] = v6;
  v30[1] = v7;
  uint64_t v8 = [NSNumber numberWithInt:0];
  v31[1] = v8;
  v30[2] = *MEMORY[0x263F1C2B0];
  uint64_t v9 = [NSNumber numberWithInt:0];
  v31[2] = v9;
  uint64_t v10 = [NSDictionary dictionaryWithObjects:v31 forKeys:v30 count:3];
  id v29 = 0;
  v11 = (void *)[v5 initWithData:v4 options:v10 documentAttributes:0 error:&v29];

  id v12 = v29;
  if (v12)
  {
    id v13 = os_log_create("com.apple.annotationkit", "Serialization");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
      sub_2376DA1B0((uint64_t)v12, v13, v14, v15, v16, v17, v18, v19);
    }
    uint64_t v20 = 0;
    uint64_t v21 = v11;
  }
  else
  {
    if (!v11)
    {
      uint64_t v20 = 0;
      goto LABEL_12;
    }
    uint64_t v21 = (void *)[v11 mutableCopy];
    uint64_t v22 = [v21 attributesAtIndex:0 effectiveRange:0];
    id v13 = [v22 mutableCopy];

    uint64_t v23 = *MEMORY[0x263F1C2D0];
    id v24 = [v13 objectForKeyedSubscript:*MEMORY[0x263F1C2D0]];

    if (v24) {
      [v13 removeObjectForKey:v23];
    }
    uint64_t v25 = *MEMORY[0x263F1C268];
    id v26 = [v13 objectForKeyedSubscript:*MEMORY[0x263F1C268]];
    v27 = (void *)[v26 mutableCopy];

    [v27 setDefaultTabInterval:0.0];
    [v27 setAllowsDefaultTighteningForTruncation:1];
    [v13 setObject:v27 forKeyedSubscript:v25];
    objc_msgSend(v21, "setAttributes:range:", v13, 0, objc_msgSend(v21, "length"));
    uint64_t v20 = (void *)[v21 copy];
  }
LABEL_12:

LABEL_13:

  return v20;
}

+ (id)_encodeTextAttributesAsRTFData:(id)a3
{
  if (a3)
  {
    id v4 = (objc_class *)MEMORY[0x263F086A0];
    id v5 = a3;
    uint64_t v6 = (void *)[[v4 alloc] initWithString:@"a" attributes:v5];

    uint64_t v7 = [a1 _encodeAttributedStringAsRTFData:v6];
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

+ (id)_decodeTextAttributesFromRTFData:(id)a3
{
  uint64_t v3 = [a1 _decodeAttributedStringFromRTFData:a3];
  id v4 = v3;
  if (v3)
  {
    if ([v3 length] == 1)
    {
      id v5 = [v4 attributesAtIndex:0 effectiveRange:0];
      goto LABEL_8;
    }
    uint64_t v6 = os_log_create("com.apple.annotationkit", "Serialization");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_2376DA21C();
    }

    id v4 = 0;
  }
  id v5 = 0;
LABEL_8:

  return v5;
}

@end
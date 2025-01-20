@interface IKTextParser
+ (id)textWithAttributedString:(id)a3;
+ (id)textWithDOMElement:(id)a3 usingParseBlock:(id)a4;
- (BOOL)isEqual:(id)a3;
- (NSAttributedString)attributedString;
- (NSString)string;
- (id)_attributedStringFromDomElement:(id)a3 usingParseBlock:(id)a4;
- (id)_attributedStringWithDefaultAttributes:(id)a3 fontHandler:(id)a4 style:(id)a5;
- (id)_attributesWithFont:(id)a3 style:(id)a4;
- (id)_attributesWithFont:(id)a3 style:(id)a4 foregroundColor:(id)a5 textAlignment:(int64_t)a6;
- (id)_stringFromDateElement:(id)a3 unformattedString:(id)a4;
- (id)_stringFromDurationElement:(id)a3 unformattedString:(id)a4;
- (id)_stringFromNumberElement:(id)a3 unformattedString:(id)a4;
- (id)attributedStringWithFont:(id)a3 foregroundColor:(id)a4 textAlignment:(int64_t)a5 style:(id)a6;
- (id)attributedStringWithFont:(id)a3 style:(id)a4;
- (id)attributedStringWithFontHandler:(id)a3 style:(id)a4;
- (id)attributedStringWithFontHandler:(id)a3 style:(id)a4 defaultAttributes:(id *)a5;
- (id)attributedStringWithFontHandler:(id)a3 style:(id)a4 foregroundColor:(id)a5 textAlignment:(int64_t)a6;
- (id)attributedStringWithFontHandler:(id)a3 style:(id)a4 foregroundColor:(id)a5 textAlignment:(int64_t)a6 defaultAttributes:(id *)a7;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
@end

@implementation IKTextParser

+ (id)textWithDOMElement:(id)a3 usingParseBlock:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = objc_alloc_init((Class)a1);
  uint64_t v9 = [v8 _attributedStringFromDomElement:v7 usingParseBlock:v6];

  v10 = (void *)v8[1];
  v8[1] = v9;

  return v8;
}

+ (id)textWithAttributedString:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init((Class)a1);
  id v6 = (void *)v5[1];
  v5[1] = v4;

  return v5;
}

- (NSString)string
{
  v2 = [(IKTextParser *)self attributedString];
  v3 = [v2 string];

  return (NSString *)v3;
}

- (id)attributedStringWithFont:(id)a3 style:(id)a4
{
  id v6 = a4;
  id v7 = [(IKTextParser *)self _attributesWithFont:a3 style:v6];
  v8 = [(IKTextParser *)self _attributedStringWithDefaultAttributes:v7 fontHandler:0 style:v6];

  return v8;
}

- (id)attributedStringWithFont:(id)a3 foregroundColor:(id)a4 textAlignment:(int64_t)a5 style:(id)a6
{
  id v10 = a6;
  v11 = [(IKTextParser *)self _attributesWithFont:a3 style:v10 foregroundColor:a4 textAlignment:a5];
  v12 = [(IKTextParser *)self _attributedStringWithDefaultAttributes:v11 fontHandler:0 style:v10];

  return v12;
}

- (id)attributedStringWithFontHandler:(id)a3 style:(id)a4
{
  return [(IKTextParser *)self attributedStringWithFontHandler:a3 style:a4 defaultAttributes:0];
}

- (id)attributedStringWithFontHandler:(id)a3 style:(id)a4 defaultAttributes:(id *)a5
{
  v8 = (void (*)(void))*((void *)a3 + 2);
  id v9 = a4;
  id v10 = a3;
  v11 = v8();
  v12 = [(IKTextParser *)self _attributesWithFont:v11 style:v9];

  if (a5) {
    *a5 = v12;
  }
  v13 = [(IKTextParser *)self _attributedStringWithDefaultAttributes:v12 fontHandler:v10 style:v9];

  return v13;
}

- (id)attributedStringWithFontHandler:(id)a3 style:(id)a4 foregroundColor:(id)a5 textAlignment:(int64_t)a6
{
  return [(IKTextParser *)self attributedStringWithFontHandler:a3 style:a4 foregroundColor:a5 textAlignment:a6 defaultAttributes:0];
}

- (id)attributedStringWithFontHandler:(id)a3 style:(id)a4 foregroundColor:(id)a5 textAlignment:(int64_t)a6 defaultAttributes:(id *)a7
{
  v12 = (void (*)(id, id))*((void *)a3 + 2);
  id v13 = a5;
  id v14 = a4;
  v15 = v12(a3, v14);
  v16 = [(IKTextParser *)self _attributesWithFont:v15 style:v14 foregroundColor:v13 textAlignment:a6];

  if (a7) {
    *a7 = v16;
  }
  v17 = [(IKTextParser *)self _attributedStringWithDefaultAttributes:v16 fontHandler:0 style:v14];

  return v17;
}

- (id)_attributesWithFont:(id)a3 style:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [v6 ikColor];
  id v9 = [v8 color];

  uint64_t v10 = [v6 textAlignment];
  if ((unint64_t)(v10 - 1) >= 4) {
    uint64_t v11 = 4;
  }
  else {
    uint64_t v11 = v10 - 1;
  }
  v12 = [(IKTextParser *)self _attributesWithFont:v7 style:v6 foregroundColor:v9 textAlignment:v11];

  return v12;
}

- (id)_attributesWithFont:(id)a3 style:(id)a4 foregroundColor:(id)a5 textAlignment:(int64_t)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = [MEMORY[0x1E4F1CA60] dictionary];
  id v13 = v12;
  if (v9) {
    [v12 setObject:v9 forKeyedSubscript:*MEMORY[0x1E4F42508]];
  }
  if (v11) {
    [v13 setObject:v11 forKeyedSubscript:*MEMORY[0x1E4F42510]];
  }
  id v14 = [v10 textShadow];
  v15 = [v10 letterSpacing];
  if (v14) {
    [v13 setObject:v14 forKeyedSubscript:*MEMORY[0x1E4F42560]];
  }
  if (v15) {
    [v13 setObject:v15 forKeyedSubscript:*MEMORY[0x1E4F42520]];
  }
  v16 = [MEMORY[0x1E4F42678] defaultParagraphStyle];
  v17 = (void *)[v16 mutableCopy];

  objc_msgSend(v17, "ik_applyViewElementStyle:", v10);
  [v17 setAlignment:a6];
  [v17 setLineBreakMode:4];
  [v13 setObject:v17 forKeyedSubscript:*MEMORY[0x1E4F42540]];
  v18 = (void *)[v13 copy];

  return v18;
}

- (id)_attributedStringWithDefaultAttributes:(id)a3 fontHandler:(id)a4 style:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  id v11 = [(IKTextParser *)self attributedString];
  v12 = (void *)[v11 mutableCopy];

  uint64_t v13 = [v12 length];
  objc_msgSend(v12, "addAttributes:range:", v10, 0, v13);
  id v14 = [v10 objectForKeyedSubscript:*MEMORY[0x1E4F42508]];
  v15 = [v10 objectForKeyedSubscript:*MEMORY[0x1E4F42510]];

  if (v14)
  {
    attributedString = self->_attributedString;
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __73__IKTextParser__attributedStringWithDefaultAttributes_fontHandler_style___block_invoke;
    v19[3] = &unk_1E6DE5CD8;
    id v20 = v9;
    id v21 = v14;
    id v24 = v8;
    id v22 = v15;
    id v23 = v12;
    -[NSAttributedString enumerateAttributesInRange:options:usingBlock:](attributedString, "enumerateAttributesInRange:options:usingBlock:", 0, v13, 0, v19);
  }
  objc_msgSend(v12, "removeAttribute:range:", @"bold", 0, v13);
  objc_msgSend(v12, "removeAttribute:range:", @"italic", 0, v13);
  objc_msgSend(v12, "removeAttribute:range:", @"span", 0, v13);
  v17 = (void *)[v12 copy];

  return v17;
}

void __73__IKTextParser__attributedStringWithDefaultAttributes_fontHandler_style___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v36 = a2;
  [*(id *)(a1 + 32) fontSize];
  double v8 = v7;
  uint64_t v9 = *MEMORY[0x1E4F42508];
  id v10 = [v36 valueForKey:*MEMORY[0x1E4F42508]];
  id v11 = v10;
  if (!v10) {
    id v11 = *(void **)(a1 + 40);
  }
  id v12 = v11;

  uint64_t v13 = [v36 objectForKeyedSubscript:@"styleableElement"];
  id v14 = [v13 textElement];
  v15 = [v14 style];

  if (v15 && (uint64_t v16 = *(void *)(a1 + 64)) != 0)
  {
    v17 = (*(void (**)(uint64_t, void *))(v16 + 16))(v16, v15);
    v18 = v17;
    if (v17)
    {
      id v19 = v17;

      double v8 = 0.0;
      id v12 = v19;
    }
  }
  else
  {
    [v12 pointSize];
    if (v8 == v20) {
      double v8 = 0.0;
    }
  }
  id v21 = [v12 fontDescriptor];
  uint64_t v22 = *MEMORY[0x1E4F42510];
  id v23 = [v36 valueForKey:*MEMORY[0x1E4F42510]];
  if (v23
    || ([v15 ikColor],
        id v24 = objc_claimAutoreleasedReturnValue(),
        [v24 color],
        id v23 = objc_claimAutoreleasedReturnValue(),
        v24,
        v23))
  {
    if (v23 != *(void **)(a1 + 48)) {
      objc_msgSend(*(id *)(a1 + 56), "addAttribute:value:range:", v22, v23, a3, a4);
    }
  }
  v25 = [v36 objectForKey:@"strike"];

  if (v25) {
    objc_msgSend(*(id *)(a1 + 56), "addAttribute:value:range:", *MEMORY[0x1E4F42568], &unk_1F3E3DCC8, a3, a4);
  }
  v26 = [v36 objectForKey:@"bold"];
  BOOL v27 = v26 != 0;

  v28 = [v36 objectForKey:@"italic"];

  uint64_t v29 = (v28 != 0) | (2 * v27);
  if (v29 || v8 > 0.0)
  {
    id v30 = v21;
    v31 = v30;
    if (v29)
    {
      uint64_t v32 = [v30 fontDescriptorWithSymbolicTraits:v29];

      v31 = (void *)v32;
    }
    if (v8 == 0.0)
    {
      [v12 pointSize];
      double v8 = v33;
    }
    v34 = *(void **)(a1 + 56);
    v35 = [MEMORY[0x1E4F42A30] fontWithDescriptor:v31 size:v8];
    objc_msgSend(v34, "addAttribute:value:range:", v9, v35, a3, a4);
  }
  else if (v12 != *(id *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 56), "addAttribute:value:range:", v9, v12, a3, a4);
  }
}

- (id)_attributedStringFromDomElement:(id)a3 usingParseBlock:(id)a4
{
  v45[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  double v7 = (void (**)(id, IKTextParser *, id, char *))a4;
  id v8 = objc_alloc_init(MEMORY[0x1E4F28E48]);
  char v36 = 1;
  uint64_t v9 = [v6 childNodesAsArray];
  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v7[2](v7, self, v6, &v36);
    id v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(__CFString *)v10 string];
      uint64_t v11 = (uint64_t)v10;
      id v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      uint64_t v11 = 0;
    }
    if (!v36)
    {

      uint64_t v9 = 0;
    }
  }
  else
  {
    uint64_t v11 = 0;
    id v10 = 0;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && v36)
  {
    uint64_t v12 = [v6 textContent];

    id v10 = (__CFString *)v12;
  }
  uint64_t v13 = [v6 nodeName];
  if ([v13 isEqualToString:@"b"])
  {
    v44 = @"bold";
    v45[0] = MEMORY[0x1E4F1CC38];
    id v14 = (void *)MEMORY[0x1E4F1C9E8];
    v15 = v45;
    uint64_t v16 = &v44;
LABEL_20:
    v17 = [v14 dictionaryWithObjects:v15 forKeys:v16 count:1];
    goto LABEL_21;
  }
  if ([v13 isEqualToString:@"i"])
  {
    v42 = @"italic";
    uint64_t v43 = MEMORY[0x1E4F1CC38];
    id v14 = (void *)MEMORY[0x1E4F1C9E8];
    v15 = &v43;
    uint64_t v16 = &v42;
    goto LABEL_20;
  }
  if ([v13 isEqualToString:@"span"])
  {
    v40 = @"span";
    uint64_t v41 = MEMORY[0x1E4F1CC38];
    id v14 = (void *)MEMORY[0x1E4F1C9E8];
    v15 = &v41;
    uint64_t v16 = &v40;
    goto LABEL_20;
  }
  if ([v13 isEqualToString:@"strike"])
  {
    v38 = @"strike";
    uint64_t v39 = MEMORY[0x1E4F1CC38];
    id v14 = (void *)MEMORY[0x1E4F1C9E8];
    v15 = &v39;
    uint64_t v16 = &v38;
    goto LABEL_20;
  }
  if ([v13 isEqualToString:@"date"])
  {
    v26 = [(IKTextParser *)self _stringFromDateElement:v6 unformattedString:v10];
  }
  else if ([v13 isEqualToString:@"duration"])
  {
    v26 = [(IKTextParser *)self _stringFromDurationElement:v6 unformattedString:v10];
  }
  else
  {
    if (![v13 isEqualToString:@"number"])
    {
      if ([v13 isEqualToString:@"br"])
      {

        v17 = 0;
        id v10 = @"\n";
      }
      else
      {
        v17 = 0;
      }
      goto LABEL_21;
    }
    v26 = [(IKTextParser *)self _stringFromNumberElement:v6 unformattedString:v10];
  }
  BOOL v27 = v26;
  if (v26)
  {
    v28 = v26;

    id v10 = v28;
  }

  v17 = 0;
  uint64_t v9 = 0;
LABEL_21:
  id v30 = v10;
  v31 = v6;
  if ([(__CFString *)v10 length])
  {
    if (!v11) {
      uint64_t v11 = [objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v10 attributes:0];
    }
    v18 = v13;
    uint64_t v29 = (void *)v11;
    [v8 appendAttributedString:v11];
  }
  else
  {
    v18 = v13;
    uint64_t v29 = (void *)v11;
  }
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v19 = v9;
  uint64_t v20 = [v19 countByEnumeratingWithState:&v32 objects:v37 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v21; ++i)
      {
        if (*(void *)v33 != v22) {
          objc_enumerationMutation(v19);
        }
        id v24 = [(IKTextParser *)self _attributedStringFromDomElement:*(void *)(*((void *)&v32 + 1) + 8 * i) usingParseBlock:v7];
        [v8 appendAttributedString:v24];
      }
      uint64_t v21 = [v19 countByEnumeratingWithState:&v32 objects:v37 count:16];
    }
    while (v21);
  }

  if (v17) {
    objc_msgSend(v8, "addAttributes:range:", v17, 0, objc_msgSend(v8, "length"));
  }

  return v8;
}

- (id)_stringFromDateElement:(id)a3 unformattedString:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (!_stringFromDateElement_unformattedString__sSimpleInputFormatter)
  {
    id v7 = objc_alloc_init(MEMORY[0x1E4F28C10]);
    id v8 = (void *)_stringFromDateElement_unformattedString__sSimpleInputFormatter;
    _stringFromDateElement_unformattedString__sSimpleInputFormatter = (uint64_t)v7;

    [(id)_stringFromDateElement_unformattedString__sSimpleInputFormatter setDateFormat:@"yyyy-MM-dd"];
  }
  uint64_t v9 = [v5 getAttribute:@"locale"];
  if ([v9 length]) {
    [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:v9];
  }
  else {
  id v10 = [MEMORY[0x1E4F1CA20] currentLocale];
  }
  [(id)_stringFromDateElement_unformattedString__sSimpleInputFormatter setLocale:v10];
  if (!v6)
  {
    id v6 = [v5 textContent];
  }
  uint64_t v11 = [(id)_stringFromDateElement_unformattedString__sSimpleInputFormatter dateFromString:v6];
  if (v11) {
    goto LABEL_11;
  }
  uint64_t v12 = +[IKFormatting isoDateFormatter];
  uint64_t v11 = [v12 dateFromString:v6];

  if (v11
    || (+[IKFormatting rfc1123DateFormatter],
        uint64_t v13 = objc_claimAutoreleasedReturnValue(),
        [v13 dateFromString:v6],
        uint64_t v11 = objc_claimAutoreleasedReturnValue(),
        v13,
        v11))
  {
LABEL_11:
    id v14 = +[IKFormatting sharedInstance];
    v15 = [v5 getAttribute:@"format"];
    uint64_t v16 = [v14 formatDate:v11 format:v15];
  }
  else
  {
    uint64_t v16 = 0;
  }
  if (v16) {
    v17 = v16;
  }
  else {
    v17 = v6;
  }
  id v18 = v17;

  return v18;
}

- (id)_stringFromDurationElement:(id)a3 unformattedString:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = v6;
  if (_stringFromDurationElement_unformattedString__sInputFormatter)
  {
    if (v6) {
      goto LABEL_3;
    }
  }
  else
  {
    id v11 = objc_alloc_init(MEMORY[0x1E4F28EE0]);
    uint64_t v12 = (void *)_stringFromDurationElement_unformattedString__sInputFormatter;
    _stringFromDurationElement_unformattedString__sInputFormatter = (uint64_t)v11;

    if (v7) {
      goto LABEL_3;
    }
  }
  id v7 = [v5 textContent];
LABEL_3:
  id v8 = [(id)_stringFromDurationElement_unformattedString__sInputFormatter numberFromString:v7];
  if (v8)
  {
    uint64_t v9 = +[IKFormatting sharedInstance];
    id v10 = [v9 formatDuration:v8];
  }
  else
  {
    id v10 = 0;
  }
  if (v10) {
    uint64_t v13 = v10;
  }
  else {
    uint64_t v13 = v7;
  }
  id v14 = v13;

  return v14;
}

- (id)_stringFromNumberElement:(id)a3 unformattedString:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = v6;
  if (_stringFromNumberElement_unformattedString__sInputFormatter)
  {
    if (v6) {
      goto LABEL_3;
    }
  }
  else
  {
    id v14 = objc_alloc_init(MEMORY[0x1E4F28EE0]);
    v15 = (void *)_stringFromNumberElement_unformattedString__sInputFormatter;
    _stringFromNumberElement_unformattedString__sInputFormatter = (uint64_t)v14;

    if (v7) {
      goto LABEL_3;
    }
  }
  id v7 = [v5 textContent];
LABEL_3:
  id v8 = [(id)_stringFromNumberElement_unformattedString__sInputFormatter numberFromString:v7];
  if (v8)
  {
    uint64_t v9 = +[IKFormatting sharedInstance];
    id v10 = [v5 getAttribute:@"style"];
    id v11 = [v5 getAttribute:@"postiveFormat"];
    uint64_t v12 = [v5 getAttribute:@"negativeFormat"];
    uint64_t v13 = [v9 formatNumber:v8 style:v10 postiveFormat:v11 negativeFormat:v12];
  }
  else
  {
    uint64_t v13 = 0;
  }
  if (v13) {
    uint64_t v16 = v13;
  }
  else {
    uint64_t v16 = v7;
  }
  id v17 = v16;

  return v17;
}

- (unint64_t)hash
{
  return [(NSAttributedString *)self->_attributedString hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (IKTextParser *)a3;
  if (self == v4) {
    goto LABEL_5;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    char v6 = 0;
    goto LABEL_7;
  }
  attributedString = self->_attributedString;
  if (attributedString == v4->_attributedString) {
LABEL_5:
  }
    char v6 = 1;
  else {
    char v6 = -[NSAttributedString isEqualToAttributedString:](attributedString, "isEqualToAttributedString:");
  }
LABEL_7:

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_alloc_init((Class)objc_opt_class());
  uint64_t v6 = [(NSAttributedString *)self->_attributedString mutableCopyWithZone:a3];
  id v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (NSAttributedString)attributedString
{
  return self->_attributedString;
}

- (void).cxx_destruct
{
}

@end
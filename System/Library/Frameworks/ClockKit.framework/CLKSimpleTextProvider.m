@interface CLKSimpleTextProvider
+ (BOOL)supportsSecureCoding;
+ (CLKSimpleTextProvider)textProviderWithText:(NSString *)text;
+ (CLKSimpleTextProvider)textProviderWithText:(NSString *)text shortText:(NSString *)shortText;
+ (CLKSimpleTextProvider)textProviderWithText:(NSString *)text shortText:(NSString *)shortText accessibilityLabel:(NSString *)accessibilityLabel;
+ (id)finalizedTextProviderWithText:(id)a3;
+ (id)finalizedTextProviderWithText:(id)a3 monospaceNumbers:(BOOL)a4;
- (BOOL)_validate;
- (BOOL)isEqual:(id)a3;
- (BOOL)useAllSmallCaps;
- (BOOL)useLowercaseSmallCaps;
- (BOOL)useNoContentDashFormatting;
- (CLKSimpleTextProvider)initWithCoder:(id)a3;
- (CLKSimpleTextProvider)initWithText:(NSString *)text;
- (CLKSimpleTextProvider)initWithText:(NSString *)text shortText:(NSString *)shortText;
- (CLKSimpleTextProvider)initWithText:(NSString *)text shortText:(NSString *)shortText accessibilityLabel:(NSString *)accessibilityLabel;
- (NSString)shortText;
- (NSString)text;
- (id)JSONObjectRepresentation;
- (id)_initWithJSONObjectRepresentation:(id)a3;
- (id)_sessionAttributedTextForIndex:(unint64_t)a3 withStyle:(id)a4;
- (id)attributedString;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)_validate;
- (void)encodeWithCoder:(id)a3;
- (void)setShortText:(NSString *)shortText;
- (void)setText:(NSString *)text;
- (void)setUseAllSmallCaps:(BOOL)a3;
- (void)setUseLowercaseSmallCaps:(BOOL)a3;
- (void)setUseNoContentDashFormatting:(BOOL)a3;
@end

@implementation CLKSimpleTextProvider

- (CLKSimpleTextProvider)initWithText:(NSString *)text
{
  return [(CLKSimpleTextProvider *)self initWithText:text shortText:0 accessibilityLabel:0];
}

- (CLKSimpleTextProvider)initWithText:(NSString *)text shortText:(NSString *)shortText
{
  return [(CLKSimpleTextProvider *)self initWithText:text shortText:shortText accessibilityLabel:0];
}

- (CLKSimpleTextProvider)initWithText:(NSString *)text shortText:(NSString *)shortText accessibilityLabel:(NSString *)accessibilityLabel
{
  v8 = text;
  v9 = shortText;
  v10 = accessibilityLabel;
  v14.receiver = self;
  v14.super_class = (Class)CLKSimpleTextProvider;
  v11 = [(CLKTextProvider *)&v14 initPrivate];
  v12 = v11;
  if (v11)
  {
    [(CLKSimpleTextProvider *)v11 setText:v8];
    [(CLKSimpleTextProvider *)v12 setShortText:v9];
    [(CLKTextProvider *)v12 setAccessibilityLabel:v10];
  }

  return v12;
}

+ (CLKSimpleTextProvider)textProviderWithText:(NSString *)text
{
  return (CLKSimpleTextProvider *)[a1 textProviderWithText:text shortText:0];
}

+ (CLKSimpleTextProvider)textProviderWithText:(NSString *)text shortText:(NSString *)shortText
{
  return (CLKSimpleTextProvider *)[a1 textProviderWithText:text shortText:shortText accessibilityLabel:0];
}

+ (CLKSimpleTextProvider)textProviderWithText:(NSString *)text shortText:(NSString *)shortText accessibilityLabel:(NSString *)accessibilityLabel
{
  v8 = accessibilityLabel;
  v9 = shortText;
  v10 = text;
  v11 = (void *)[objc_alloc((Class)a1) initWithText:v10 shortText:v9 accessibilityLabel:v8];

  return (CLKSimpleTextProvider *)v11;
}

+ (id)finalizedTextProviderWithText:(id)a3
{
  return (id)[a1 finalizedTextProviderWithText:a3 monospaceNumbers:0];
}

+ (id)finalizedTextProviderWithText:(id)a3 monospaceNumbers:(BOOL)a4
{
  v4 = objc_msgSend(a1, "textProviderWithText:", a3, a4);
  [v4 finalize];

  return v4;
}

- (id)_sessionAttributedTextForIndex:(unint64_t)a3 withStyle:(id)a4
{
  v83[2] = *MEMORY[0x263EF8340];
  id v6 = a4;
  if (a3)
  {
    if (a3 != 1)
    {
      v8 = 0;
      goto LABEL_7;
    }
    v7 = &OBJC_IVAR___CLKSimpleTextProvider__shortText;
  }
  else
  {
    v7 = &OBJC_IVAR___CLKSimpleTextProvider__text;
  }
  v8 = *(Class *)((char *)&self->super.super.isa + *v7);
LABEL_7:
  id v9 = v8;
  if ([v6 uppercase]
    && ![(CLKTextProvider *)self ignoreUppercaseStyle])
  {
    int v10 = ![(CLKSimpleTextProvider *)self useLowercaseSmallCaps];
  }
  else
  {
    int v10 = 0;
  }
  BOOL v11 = self->_useAllSmallCaps && CLKSmallCapsAllowed() && !self->_useNoContentDashFormatting;
  BOOL v12 = self->_useLowercaseSmallCaps && CLKSmallCapsAllowed() && !self->_useNoContentDashFormatting;
  if ((v10 | v11) == 1)
  {
    v13 = [MEMORY[0x263EFF960] currentLocale];
    uint64_t v14 = [v9 uppercaseStringWithLocale:v13];

    id v9 = (id)v14;
  }
  if (!v9)
  {
    v20 = 0;
    goto LABEL_52;
  }
  uint64_t v15 = [v6 font];
  v16 = (void *)v15;
  v17 = (uint64_t *)MEMORY[0x263F82270];
  if (v11)
  {
    v18 = [v6 smallCapsBaseFont];
    uint64_t v19 = [v18 CLKFontWithLocalizedSmallCaps];
  }
  else
  {
    if (!v12)
    {
      v26 = 0;
      v21 = (void *)v15;
      goto LABEL_38;
    }
    v18 = [v6 smallCapsBaseFont];
    uint64_t v19 = [v18 CLKFontWithLocalizedLowerCaseSmallCaps];
  }
  v21 = (void *)v19;

  if (CLKUsesFauxSmallCaps())
  {
    v22 = [v6 smallCapsBaseFont];
    v23 = [v6 font];
    int v24 = [v22 isEqual:v23];

    if (v24)
    {
      [v21 pointSize];
      [v21 fontWithSize:v25 + -2.5];
    }
    else
    {
      [v6 smallCapsBaseFont];
    v27 = };
    uint64_t v28 = *v17;
    v83[0] = v27;
    uint64_t v29 = *MEMORY[0x263F03998];
    v82[0] = v28;
    v82[1] = v29;
    uint64_t v80 = *MEMORY[0x263F03990];
    v81 = v27;
    v30 = [NSDictionary dictionaryWithObjects:&v81 forKeys:&v80 count:1];
    v83[1] = v30;
    v31 = NSDictionary;
    v32 = v83;
    v33 = v82;
    goto LABEL_36;
  }
  if (!v11 && !v12)
  {
    v26 = 0;
    goto LABEL_38;
  }
  if (CTFontGetSymbolicTraits((CTFontRef)v21))
  {
    [v21 pointSize];
    v27 = [v21 fontWithSize:v67 * 0.75];
    uint64_t v68 = *v17;
    v79[0] = v27;
    uint64_t v69 = *MEMORY[0x263F03998];
    v78[0] = v68;
    v78[1] = v69;
    uint64_t v76 = *MEMORY[0x263F03990];
    v77 = v27;
    v30 = [NSDictionary dictionaryWithObjects:&v77 forKeys:&v76 count:1];
    v79[1] = v30;
    v31 = NSDictionary;
    v32 = v79;
    v33 = v78;
LABEL_36:
    v26 = [v31 dictionaryWithObjects:v32 forKeys:v33 count:2];

    goto LABEL_38;
  }
  uint64_t v74 = *v17;
  v75 = v21;
  v26 = [NSDictionary dictionaryWithObjects:&v75 forKeys:&v74 count:1];
LABEL_38:
  v34 = [(CLKTextProvider *)self fontFeatures];

  if (v34)
  {
    v35 = [(CLKTextProvider *)self fontFeatures];
    v36 = [v21 CLKFontByApplyingFeatureSettings:v35];

    if (v26)
    {
      v37 = (void *)[v26 mutableCopy];
      uint64_t v38 = *v17;
      [v37 objectForKeyedSubscript:*v17];
      v40 = id v39 = v6;
      v41 = [(CLKTextProvider *)self fontFeatures];
      [v40 CLKFontByApplyingFeatureSettings:v41];
      v42 = v26;
      v44 = id v43 = v9;
      [v37 setObject:v44 forKeyedSubscript:v38];

      id v9 = v43;
      id v6 = v39;

      v26 = v37;
    }
  }
  else
  {
    v36 = v21;
  }
  v71 = v36;
  if (self->_useNoContentDashFormatting)
  {
    v45 = [v36 fontDescriptor];
    v46 = _AlternatePunctuationAttributes();
    [v45 fontDescriptorByAddingAttributes:v46];
    v47 = id v70 = v6;

    v48 = [MEMORY[0x263F82760] fontWithDescriptor:v47 size:0.0];
    v49 = (void *)[objc_alloc(MEMORY[0x263F089B8]) initWithString:v9];
    id v50 = v9;
    uint64_t v51 = [v9 length];
    double v52 = 305.0 / (double)CTFontGetUnitsPerEm((CTFontRef)v36);
    [v36 pointSize];
    v54 = v26;
    uint64_t v55 = *MEMORY[0x263F82288];
    v56 = [NSNumber numberWithDouble:v53 * v52];
    uint64_t v57 = v55;
    v26 = v54;
    objc_msgSend(v49, "addAttribute:value:range:", v57, v56, 0, v51);

    objc_msgSend(v49, "addAttribute:value:range:", *MEMORY[0x263F82270], v48, 0, v51);
    id v6 = v70;
  }
  else
  {
    id v58 = objc_alloc(MEMORY[0x263F086A0]);
    v59 = v58;
    if (v26)
    {
      id v50 = v9;
      v49 = (void *)[v58 initWithString:v9 attributes:v26];
    }
    else
    {
      uint64_t v72 = *MEMORY[0x263F82270];
      v73 = v36;
      v60 = [NSDictionary dictionaryWithObjects:&v73 forKeys:&v72 count:1];
      id v50 = v9;
      v49 = (void *)[v59 initWithString:v9 attributes:v60];
    }
  }
  v20 = objc_msgSend(v49, "_attributedStringWithOtherAttributesFromStyle:", v6, v70);

  if ([v6 shouldEmbedTintColors])
  {
    v61 = [(CLKTextProvider *)self tintColor];

    id v9 = v50;
    v62 = v71;
    if (v61)
    {
      v63 = [(CLKTextProvider *)self tintColor];
      [v20 _attributedStringWithForegroundColor:v63];
      uint64_t v65 = v64 = v26;

      v20 = (void *)v65;
      v26 = v64;
    }
  }
  else
  {
    id v9 = v50;
    v62 = v71;
  }

LABEL_52:

  return v20;
}

- (BOOL)_validate
{
  text = self->_text;
  if (!text)
  {
    v4 = CLKLoggingObjectForDomain(10);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
      [(CLKSimpleTextProvider *)(uint64_t)self _validate];
    }
  }
  return text != 0;
}

- (id)description
{
  v4.receiver = self;
  v4.super_class = (Class)CLKSimpleTextProvider;
  v2 = [(CLKTextProvider *)&v4 description];

  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CLKSimpleTextProvider;
  objc_super v4 = [(CLKTextProvider *)&v7 copyWithZone:a3];
  v5 = v4;
  if (v4 != self)
  {
    objc_storeStrong((id *)&v4->_text, self->_text);
    objc_storeStrong((id *)&v5->_shortText, self->_shortText);
    v5->_useNoContentDashFormatting = self->_useNoContentDashFormatting;
    v5->_useAllSmallCaps = self->_useAllSmallCaps;
    v5->_useLowercaseSmallCaps = self->_useLowercaseSmallCaps;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  objc_super v4 = (void **)a3;
  v7.receiver = self;
  v7.super_class = (Class)CLKSimpleTextProvider;
  BOOL v5 = [(CLKTextProvider *)&v7 isEqual:v4]
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && CLKEqualObjects(self->_text, v4[17])
    && CLKEqualObjects(self->_shortText, v4[18])
    && self->_useNoContentDashFormatting == *((unsigned __int8 *)v4 + 128)
    && self->_useAllSmallCaps == *((unsigned __int8 *)v4 + 129)
    && self->_useLowercaseSmallCaps == *((unsigned __int8 *)v4 + 130);

  return v5;
}

- (unint64_t)hash
{
  v6.receiver = self;
  v6.super_class = (Class)CLKSimpleTextProvider;
  id v3 = [(CLKTextProvider *)&v6 hash];
  NSUInteger v4 = (NSUInteger)v3 + [(NSString *)self->_text hash];
  return v4
       + 4 * [(NSString *)self->_shortText hash]
       + 32 * self->_useNoContentDashFormatting
       + ((unint64_t)self->_useAllSmallCaps << 6)
       + ((unint64_t)self->_useLowercaseSmallCaps << 7);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CLKSimpleTextProvider;
  id v4 = a3;
  [(CLKTextProvider *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_text, @"_text", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_shortText forKey:@"_shortText"];
  [v4 encodeBool:self->_useNoContentDashFormatting forKey:@"useNoContentDashFormatting"];
  [v4 encodeBool:self->_useAllSmallCaps forKey:@"useAllSmallCaps"];
  [v4 encodeBool:self->_useLowercaseSmallCaps forKey:@"useLowercaseSmallCaps"];
}

- (CLKSimpleTextProvider)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CLKSimpleTextProvider;
  objc_super v5 = [(CLKTextProvider *)&v11 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_text"];
    text = v5->_text;
    v5->_text = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_shortText"];
    shortText = v5->_shortText;
    v5->_shortText = (NSString *)v8;

    v5->_useNoContentDashFormatting = [v4 decodeBoolForKey:@"useNoContentDashFormatting"];
    v5->_useAllSmallCaps = [v4 decodeBoolForKey:@"useAllSmallCaps"];
    v5->_useLowercaseSmallCaps = [v4 decodeBoolForKey:@"useLowercaseSmallCaps"];
  }

  return v5;
}

- (id)attributedString
{
  id v3 = objc_alloc(MEMORY[0x263F086A0]);
  id v4 = v3;
  if (self->_text)
  {
    objc_super v5 = objc_msgSend(v3, "initWithString:");
  }
  else
  {
    uint64_t v6 = CLKLocalizedString(@"EMPTY_TEXT_DASHES");
    objc_super v5 = (void *)[v4 initWithString:v6];
  }

  return v5;
}

- (id)_initWithJSONObjectRepresentation:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CLKSimpleTextProvider;
  objc_super v5 = [(CLKTextProvider *)&v10 _initWithJSONObjectRepresentation:v4];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"text"];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      [MEMORY[0x263EFF940] raise:@"CLKComplicationBundleException", @"value for key '%@' must be a string - invalid value: %@", @"text", v6 format];
    }
    objc_storeStrong(v5 + 17, v6);
    objc_super v7 = [v4 objectForKeyedSubscript:@"shortText"];
    if (v7)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        [MEMORY[0x263EFF940] raise:@"CLKComplicationBundleException", @"value for key '%@' must be a string - invalid value: %@", @"shortText", v7 format];
      }
      objc_storeStrong(v5 + 18, v7);
    }
    uint64_t v8 = [v4 objectForKeyedSubscript:@"smallCaps"];
    if (v8)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        [MEMORY[0x263EFF940] raise:@"CLKComplicationBundleException", @"value for key '%@' must be a number - invalid value: %@", @"smallCaps", v7 format];
      }
      *((unsigned char *)v5 + 130) = [v8 BOOLValue];
    }
  }
  return v5;
}

- (id)JSONObjectRepresentation
{
  v5.receiver = self;
  v5.super_class = (Class)CLKSimpleTextProvider;
  id v3 = [(CLKTextProvider *)&v5 JSONObjectRepresentation];
  [v3 setObject:self->_text forKeyedSubscript:@"text"];
  [v3 setObject:self->_shortText forKeyedSubscript:@"shortText"];
  if (self->_useLowercaseSmallCaps) {
    [v3 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"smallCaps"];
  }

  return v3;
}

- (NSString)text
{
  return self->_text;
}

- (void)setText:(NSString *)text
{
}

- (NSString)shortText
{
  return self->_shortText;
}

- (void)setShortText:(NSString *)shortText
{
}

- (BOOL)useNoContentDashFormatting
{
  return self->_useNoContentDashFormatting;
}

- (void)setUseNoContentDashFormatting:(BOOL)a3
{
  self->_useNoContentDashFormatting = a3;
}

- (BOOL)useAllSmallCaps
{
  return self->_useAllSmallCaps;
}

- (void)setUseAllSmallCaps:(BOOL)a3
{
  self->_useAllSmallCaps = a3;
}

- (BOOL)useLowercaseSmallCaps
{
  return self->_useLowercaseSmallCaps;
}

- (void)setUseLowercaseSmallCaps:(BOOL)a3
{
  self->_useLowercaseSmallCaps = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shortText, 0);

  objc_storeStrong((id *)&self->_text, 0);
}

- (void)_validate
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = objc_opt_class();
  id v4 = v3;
  int v6 = 138412802;
  objc_super v7 = @"text";
  __int16 v8 = 2112;
  id v9 = v3;
  __int16 v10 = 2112;
  id v11 = (id)objc_opt_class();
  id v5 = v11;
  _os_log_fault_impl(&dword_21C599000, a2, OS_LOG_TYPE_FAULT, "Property '%@' is not set on %@. This property must not be nil when passing %@ to the complication data handler.", (uint8_t *)&v6, 0x20u);
}

@end
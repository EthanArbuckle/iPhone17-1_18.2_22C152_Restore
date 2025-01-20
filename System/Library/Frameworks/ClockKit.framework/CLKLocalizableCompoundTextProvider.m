@interface CLKLocalizableCompoundTextProvider
+ (BOOL)supportsSecureCoding;
- (BOOL)_validate;
- (BOOL)isEqual:(id)a3;
- (CLKLocalizableCompoundTextProvider)initWithCoder:(id)a3;
- (CLKLocalizableCompoundTextProvider)initWithFormatKey:(id)a3 textProviders:(id)a4;
- (id)JSONObjectRepresentation;
- (id)_arrayOfTextProviderJSONObjectRepresentations;
- (id)_initWithJSONObjectRepresentation:(id)a3;
- (id)_localizedStringForKey:(id)a3 withBundle:(id)a4 forLocalization:(id)a5;
- (id)_localizedTextProviderWithBundle:(id)a3 forLocalization:(id)a4;
- (id)_sessionAttributedTextForIndex:(unint64_t)a3 withStyle:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CLKLocalizableCompoundTextProvider

- (CLKLocalizableCompoundTextProvider)initWithFormatKey:(id)a3 textProviders:(id)a4
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v25.receiver = self;
  v25.super_class = (Class)CLKLocalizableCompoundTextProvider;
  v8 = [(CLKTextProvider *)&v25 initPrivate];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    formatKey = v8->_formatKey;
    v8->_formatKey = (NSString *)v9;

    v11 = [MEMORY[0x263EFF980] array];
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v12 = v7;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v21 objects:v26 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v22;
      do
      {
        uint64_t v16 = 0;
        do
        {
          if (*(void *)v22 != v15) {
            objc_enumerationMutation(v12);
          }
          v17 = objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * v16), "finalizedCopy", (void)v21);
          [v11 addObject:v17];

          ++v16;
        }
        while (v14 != v16);
        uint64_t v14 = [v12 countByEnumeratingWithState:&v21 objects:v26 count:16];
      }
      while (v14);
    }

    uint64_t v18 = [v11 copy];
    textProviders = v8->_textProviders;
    v8->_textProviders = (NSArray *)v18;
  }
  return v8;
}

- (id)_localizedStringForKey:(id)a3 withBundle:(id)a4 forLocalization:(id)a5
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = v9;
  if (!v7)
  {
    id v17 = 0;
    goto LABEL_19;
  }
  if (!v8) {
    goto LABEL_18;
  }
  if (v9)
  {
    v11 = [v8 bundlePath];
    id v12 = [NSString stringWithFormat:@"%@.lproj", v10];
    uint64_t v13 = [v11 stringByAppendingPathComponent:v12];

    uint64_t v14 = [MEMORY[0x263F086E0] bundleWithPath:v13];
    uint64_t v15 = v14;
    if (v14)
    {
      uint64_t v16 = [v14 localizedStringForKey:v7 value:v7 table:@"ckcomplication"];
      if (v16)
      {
        id v17 = (id)v16;

        goto LABEL_19;
      }
      uint64_t v18 = CLKLoggingObjectForDomain(4);
      if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_13;
      }
      *(_DWORD *)buf = 138412546;
      id v26 = v7;
      __int16 v27 = 2112;
      v28 = v13;
      v19 = "Didn't find entry for '%@' in %@";
      v20 = v18;
      uint32_t v21 = 22;
    }
    else
    {
      uint64_t v18 = CLKLoggingObjectForDomain(4);
      if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
LABEL_13:

        goto LABEL_14;
      }
      *(_DWORD *)buf = 138412290;
      id v26 = v13;
      v19 = "Didn't find requested localization bundle at path %@";
      v20 = v18;
      uint32_t v21 = 12;
    }
    _os_log_impl(&dword_21C599000, v20, OS_LOG_TYPE_DEFAULT, v19, buf, v21);
    goto LABEL_13;
  }
LABEL_14:
  id v17 = [v8 localizedStringForKey:v7 value:v7 table:@"ckcomplication"];
  if (v17) {
    goto LABEL_19;
  }
  long long v22 = CLKLoggingObjectForDomain(4);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    long long v23 = [v8 bundlePath];
    *(_DWORD *)buf = 138412546;
    id v26 = v7;
    __int16 v27 = 2112;
    v28 = v23;
    _os_log_impl(&dword_21C599000, v22, OS_LOG_TYPE_DEFAULT, "Didn't find entry for '%@' in %@", buf, 0x16u);
  }
LABEL_18:
  id v17 = v7;
LABEL_19:

  return v17;
}

- (id)_localizedTextProviderWithBundle:(id)a3 forLocalization:(id)a4
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v22 = a3;
  id v6 = a4;
  id v7 = -[CLKLocalizableCompoundTextProvider _localizedStringForKey:withBundle:forLocalization:](self, "_localizedStringForKey:withBundle:forLocalization:", self->_formatKey, v22);
  id v8 = CLKLoggingObjectForDomain(4);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    formatKey = self->_formatKey;
    *(_DWORD *)buf = 138412546;
    uint64_t v29 = formatKey;
    __int16 v30 = 2112;
    v31 = v7;
    _os_log_impl(&dword_21C599000, v8, OS_LOG_TYPE_DEFAULT, "Localized format '%@' to '%@'", buf, 0x16u);
  }

  if (!v7) {
    goto LABEL_27;
  }
  v10 = objc_opt_new();
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  v11 = self->_textProviders;
  uint64_t v12 = [(NSArray *)v11 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (!v12)
  {

    goto LABEL_23;
  }
  uint64_t v13 = v12;
  char v14 = 0;
  uint64_t v15 = *(void *)v24;
  do
  {
    for (uint64_t i = 0; i != v13; ++i)
    {
      if (*(void *)v24 != v15) {
        objc_enumerationMutation(v11);
      }
      id v17 = *(void **)(*((void *)&v23 + 1) + 8 * i);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v18 = [v17 localizedTextProviderWithBundle:v22 forLocalization:v6];
        if (v18)
        {
          [v10 addObject:v18];
          goto LABEL_18;
        }
        v19 = CLKLoggingObjectForDomain(4);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v29 = (NSString *)v17;
          _os_log_error_impl(&dword_21C599000, v19, OS_LOG_TYPE_ERROR, "Error: %@ returned nil when being localized", buf, 0xCu);
        }
      }
      else
      {
        uint64_t v18 = CLKLoggingObjectForDomain(4);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v29 = (NSString *)v17;
          _os_log_error_impl(&dword_21C599000, v18, OS_LOG_TYPE_ERROR, "Error: %@ not a CLKTextProvider", buf, 0xCu);
        }
      }
      char v14 = 1;
LABEL_18:
    }
    uint64_t v13 = [(NSArray *)v11 countByEnumeratingWithState:&v23 objects:v27 count:16];
  }
  while (v13);

  if (v14)
  {
LABEL_26:

    goto LABEL_27;
  }
LABEL_23:
  if (![v10 count]) {
    goto LABEL_26;
  }
  v20 = +[CLKCompoundTextProvider compoundProviderWithLocalizedFormat:v7 localizedTextProviders:v10];

  if (!v20)
  {
LABEL_27:
    v20 = +[CLKSimpleTextProvider textProviderWithText:&stru_26CCC52F8];
  }

  return v20;
}

- (id)_sessionAttributedTextForIndex:(unint64_t)a3 withStyle:(id)a4
{
  return 0;
}

- (BOOL)_validate
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v14.receiver = self;
  v14.super_class = (Class)CLKLocalizableCompoundTextProvider;
  if (![(CLKTextProvider *)&v14 _validate]) {
    return 0;
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v3 = self->_textProviders;
  uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v10 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        if (!objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * i), "validate", (void)v10))
        {
          BOOL v8 = 0;
          goto LABEL_13;
        }
      }
      uint64_t v5 = [(NSArray *)v3 countByEnumeratingWithState:&v10 objects:v15 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  BOOL v8 = 1;
LABEL_13:

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CLKLocalizableCompoundTextProvider;
  uint64_t v4 = [(CLKTextProvider *)&v8 copyWithZone:a3];
  if (v4 != self)
  {
    uint64_t v5 = [(NSArray *)self->_textProviders copy];
    textProviders = v4->_textProviders;
    v4->_textProviders = (NSArray *)v5;

    objc_storeStrong((id *)&v4->_formatKey, self->_formatKey);
  }
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (void **)a3;
  v7.receiver = self;
  v7.super_class = (Class)CLKLocalizableCompoundTextProvider;
  if ([(CLKTextProvider *)&v7 isEqual:v4]
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && CLKEqualObjects(self->_textProviders, v4[16]))
  {
    char v5 = CLKEqualObjects(self->_formatKey, v4[17]);
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (unint64_t)hash
{
  v6.receiver = self;
  v6.super_class = (Class)CLKLocalizableCompoundTextProvider;
  v3 = [(CLKTextProvider *)&v6 hash];
  uint64_t v4 = &v3[[(NSArray *)self->_textProviders hash]];
  return (unint64_t)&v4[4 * [(NSString *)self->_formatKey hash]];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CLKLocalizableCompoundTextProvider;
  id v4 = a3;
  [(CLKTextProvider *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_textProviders, @"_textProviders", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_formatKey forKey:@"_formatKey"];
}

- (CLKLocalizableCompoundTextProvider)initWithCoder:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CLKLocalizableCompoundTextProvider;
  objc_super v5 = [(CLKTextProvider *)&v16 initWithCoder:v4];
  if (v5)
  {
    objc_super v6 = (void *)MEMORY[0x263EFFA08];
    uint64_t v7 = objc_opt_class();
    objc_super v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"_textProviders"];
    textProviders = v5->_textProviders;
    v5->_textProviders = (NSArray *)v9;

    long long v11 = v5->_textProviders;
    uint64_t v12 = objc_opt_class();
    CLKValidateArray(v11, v12);
    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_formatKey"];
    formatKey = v5->_formatKey;
    v5->_formatKey = (NSString *)v13;
  }
  return v5;
}

- (id)_initWithJSONObjectRepresentation:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)CLKLocalizableCompoundTextProvider;
  objc_super v5 = [(CLKTextProvider *)&v20 _initWithJSONObjectRepresentation:v4];
  if (v5)
  {
    objc_super v6 = [v4 objectForKeyedSubscript:@"formatKey"];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      [MEMORY[0x263EFF940] raise:@"CLKComplicationBundleException", @"key in '%@' dictionary must be a string - invalid value: %@", @"formatKey", v6 format];
    }
    objc_storeStrong(v5 + 17, v6);
    uint64_t v7 = objc_msgSend(v4, "objectForKeyedSubscript:");
    if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)) {
      [MEMORY[0x263EFF940] raise:@"CLKComplicationBundleException", @"key in '%@' dictionary must be an array - invalid value: %@", @"textProviders", v7 format];
    }
    objc_super v8 = objc_opt_new();
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v9 = v7;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v21 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v17 != v11) {
            objc_enumerationMutation(v9);
          }
          uint64_t v13 = +[CLKTextProvider providerWithJSONObjectRepresentation:*(void *)(*((void *)&v16 + 1) + 8 * i)];
          [v8 addObject:v13];
        }
        uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v21 count:16];
      }
      while (v10);
    }

    id v14 = v5[16];
    v5[16] = v8;
  }
  return v5;
}

- (id)JSONObjectRepresentation
{
  v6.receiver = self;
  v6.super_class = (Class)CLKLocalizableCompoundTextProvider;
  v3 = [(CLKTextProvider *)&v6 JSONObjectRepresentation];
  id v4 = [(CLKLocalizableCompoundTextProvider *)self _arrayOfTextProviderJSONObjectRepresentations];
  [v3 setObject:v4 forKeyedSubscript:@"textProviders"];

  [v3 setObject:self->_formatKey forKeyedSubscript:@"formatKey"];

  return v3;
}

- (id)_arrayOfTextProviderJSONObjectRepresentations
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v3 = objc_opt_new();
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = self->_textProviders;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "JSONObjectRepresentation", (void)v11);
        [v3 addObject:v9];
      }
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_formatKey, 0);

  objc_storeStrong((id *)&self->_textProviders, 0);
}

@end
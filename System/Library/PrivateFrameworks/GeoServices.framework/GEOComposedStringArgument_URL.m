@interface GEOComposedStringArgument_URL
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (GEOComposedStringArgument_URL)initWithCoder:(id)a3;
- (NSString)linkAttributeName;
- (NSString)overrideDisplayTitle;
- (NSURL)overrideURL;
- (id)_attributedStringReplacementWithOptions:(id)a3;
- (id)_initWithGeoFormatArgument:(id)a3;
- (id)_stringReplacementWithOptions:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setLinkAttributeName:(id)a3;
- (void)setOverrideDisplayTitle:(id)a3;
- (void)setOverrideURL:(id)a3;
@end

@implementation GEOComposedStringArgument_URL

- (id)_initWithGeoFormatArgument:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)GEOComposedStringArgument_URL;
  v5 = [(GEOComposedStringArgument *)&v16 _initWithGeoFormatArgument:v4];
  if (v5)
  {
    v6 = [v4 urlData];
    uint64_t v7 = [v6 displayTitle];
    v8 = (void *)v5[4];
    v5[4] = v7;

    v9 = (void *)MEMORY[0x1E4F1CB10];
    v10 = [v4 urlData];
    v11 = [v10 url];
    uint64_t v12 = [v9 URLWithString:v11];
    v13 = (void *)v5[5];
    v5[5] = v12;

    v14 = v5;
  }

  return v5;
}

- (id)_stringReplacementWithOptions:(id)a3
{
  overrideDisplayTitle = self->_overrideDisplayTitle;
  if (!overrideDisplayTitle)
  {
    if (a3 && *((unsigned char *)a3 + 9)) {
      return self->_defaultDisplayTitle;
    }
    overrideDisplayTitle = 0;
  }
  return overrideDisplayTitle;
}

- (id)_attributedStringReplacementWithOptions:(id)a3
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  overrideDisplayTitle = self->_overrideDisplayTitle;
  if (!overrideDisplayTitle) {
    overrideDisplayTitle = self->_defaultDisplayTitle;
  }
  v6 = overrideDisplayTitle;
  overrideURL = self->_overrideURL;
  if (!overrideURL) {
    overrideURL = self->_defaultURL;
  }
  v8 = overrideURL;
  v9 = v8;
  if (v6) {
    BOOL v10 = v8 == 0;
  }
  else {
    BOOL v10 = 1;
  }
  if (!v10)
  {
    if (self->_linkAttributeName)
    {
      id v11 = objc_alloc(MEMORY[0x1E4F28B18]);
      linkAttributeName = self->_linkAttributeName;
      v18[0] = v9;
      uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:&linkAttributeName count:1];
      v13 = (void *)[v11 initWithString:v6 attributes:v12];

      goto LABEL_16;
    }
    if (qword_1EB29DE20 != -1) {
      dispatch_once(&qword_1EB29DE20, &__block_literal_global_156);
    }
    v14 = _MergedGlobals_3_1;
    if (os_log_type_enabled((os_log_t)_MergedGlobals_3_1, OS_LOG_TYPE_ERROR))
    {
      __int16 v16 = 0;
    }
  }
  v13 = 0;
LABEL_16:

  return v13;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v16.receiver = self;
  v16.super_class = (Class)GEOComposedStringArgument_URL;
  id v4 = [(GEOComposedStringArgument *)&v16 copyWithZone:a3];
  uint64_t v5 = [(NSString *)self->_defaultDisplayTitle copy];
  v6 = (void *)v4[4];
  v4[4] = v5;

  uint64_t v7 = [(NSURL *)self->_defaultURL copy];
  v8 = (void *)v4[5];
  v4[5] = v7;

  uint64_t v9 = [(NSString *)self->_overrideDisplayTitle copy];
  BOOL v10 = (void *)v4[6];
  v4[6] = v9;

  uint64_t v11 = [(NSURL *)self->_overrideURL copy];
  uint64_t v12 = (void *)v4[7];
  v4[7] = v11;

  uint64_t v13 = [(NSString *)self->_linkAttributeName copy];
  v14 = (void *)v4[8];
  v4[8] = v13;

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)GEOComposedStringArgument_URL;
  id v4 = a3;
  [(GEOComposedStringArgument *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_defaultDisplayTitle, @"_defaultDisplayTitle", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_defaultURL forKey:@"_defaultURL"];
  [v4 encodeObject:self->_overrideDisplayTitle forKey:@"_overrideDisplayTitle"];
  [v4 encodeObject:self->_overrideURL forKey:@"_overrideURL"];
  [v4 encodeObject:self->_linkAttributeName forKey:@"_linkAttributeName"];
}

- (GEOComposedStringArgument_URL)initWithCoder:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)GEOComposedStringArgument_URL;
  objc_super v5 = [(GEOComposedStringArgument *)&v18 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_defaultDisplayTitle"];
    defaultDisplayTitle = v5->_defaultDisplayTitle;
    v5->_defaultDisplayTitle = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_defaultURL"];
    defaultURL = v5->_defaultURL;
    v5->_defaultURL = (NSURL *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_overrideDisplayTitle"];
    overrideDisplayTitle = v5->_overrideDisplayTitle;
    v5->_overrideDisplayTitle = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_overrideURL"];
    overrideURL = v5->_overrideURL;
    v5->_overrideURL = (NSURL *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_linkAttributeName"];
    linkAttributeName = v5->_linkAttributeName;
    v5->_linkAttributeName = (NSString *)v14;

    objc_super v16 = v5;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_super v5 = v4;
    v32.receiver = self;
    v32.super_class = (Class)GEOComposedStringArgument_URL;
    if (![(GEOComposedStringArgument *)&v32 isEqual:v5]) {
      goto LABEL_14;
    }
    uint64_t v6 = (void *)v5[4];
    unint64_t v7 = self->_defaultDisplayTitle;
    unint64_t v8 = v6;
    if (v7 | v8)
    {
      uint64_t v9 = (void *)v8;
      int v10 = [(id)v7 isEqual:v8];

      if (!v10) {
        goto LABEL_14;
      }
    }
    uint64_t v11 = (void *)v5[5];
    unint64_t v12 = self->_defaultURL;
    unint64_t v13 = v11;
    if (v12 | v13)
    {
      uint64_t v14 = (void *)v13;
      int v15 = [(id)v12 isEqual:v13];

      if (!v15) {
        goto LABEL_14;
      }
    }
    objc_super v16 = (void *)v5[6];
    unint64_t v17 = self->_overrideDisplayTitle;
    unint64_t v18 = v16;
    if (v17 | v18)
    {
      v19 = (void *)v18;
      int v20 = [(id)v17 isEqual:v18];

      if (!v20) {
        goto LABEL_14;
      }
    }
    v21 = (void *)v5[7];
    unint64_t v22 = self->_overrideURL;
    unint64_t v23 = v21;
    if (!(v22 | v23)
      || (v24 = (void *)v23, int v25 = [(id)v22 isEqual:v23], v24, (id)v22, v25))
    {
      linkAttributeName = self->_linkAttributeName;
      uint64_t v27 = v5[8];
      id v28 = linkAttributeName;
      v29 = v28;
      if ((unint64_t)v28 | v27) {
        char v30 = [v28 isEqual:v27];
      }
      else {
        char v30 = 1;
      }
    }
    else
    {
LABEL_14:
      char v30 = 0;
    }
  }
  else
  {
    char v30 = 0;
  }

  return v30;
}

- (NSString)overrideDisplayTitle
{
  return self->_overrideDisplayTitle;
}

- (void)setOverrideDisplayTitle:(id)a3
{
}

- (NSURL)overrideURL
{
  return self->_overrideURL;
}

- (void)setOverrideURL:(id)a3
{
}

- (NSString)linkAttributeName
{
  return self->_linkAttributeName;
}

- (void)setLinkAttributeName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_linkAttributeName, 0);
  objc_storeStrong((id *)&self->_overrideURL, 0);
  objc_storeStrong((id *)&self->_overrideDisplayTitle, 0);
  objc_storeStrong((id *)&self->_defaultURL, 0);

  objc_storeStrong((id *)&self->_defaultDisplayTitle, 0);
}

@end
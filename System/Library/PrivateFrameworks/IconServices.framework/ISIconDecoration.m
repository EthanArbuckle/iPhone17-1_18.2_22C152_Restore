@interface ISIconDecoration
+ (BOOL)supportsSecureCoding;
- (ISIconDecoration)init;
- (ISIconDecoration)initWithBundleIdentifier:(id)a3;
- (ISIconDecoration)initWithCoder:(id)a3;
- (ISIconDecoration)initWithKind:(unint64_t)a3 identifier:(id)a4;
- (ISIconDecoration)initWithResourceURL:(id)a3;
- (ISIconDecoration)initWithType:(id)a3;
- (ISScalableCompositorResource)compositorResource;
- (NSString)description;
- (NSString)identifier;
- (NSURL)resourceURL;
- (NSUUID)resourceToken;
- (NSUUID)uuid;
- (id)copyWithZone:(_NSZone *)a3;
- (id)imageForDescriptor:(id)a3;
- (id)resourceFingerprint;
- (int64_t)mode;
- (int64_t)position;
- (unint64_t)identifierKind;
- (void)encodeWithCoder:(id)a3;
- (void)setMode:(int64_t)a3;
- (void)setPosition:(int64_t)a3;
@end

@implementation ISIconDecoration

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ISIconDecoration)init
{
  v6.receiver = self;
  v6.super_class = (Class)ISIconDecoration;
  v2 = [(ISIconDecoration *)&v6 init];
  v3 = v2;
  if (v2)
  {
    identifier = v2->_identifier;
    v2->_identifier = (NSString *)&stru_1F06391F0;
    v2->_identifierKind = 0;

    v3->_position = 0;
    v3->_mode = 0;
  }
  return v3;
}

- (ISIconDecoration)initWithType:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ISIconDecoration;
  v5 = [(ISIconDecoration *)&v10 init];
  objc_super v6 = v5;
  if (v5)
  {
    v5->_identifierKind = 2;
    uint64_t v7 = [v4 copy];
    identifier = v6->_identifier;
    v6->_identifier = (NSString *)v7;

    v6->_position = 0;
    v6->_mode = 0;
  }

  return v6;
}

- (ISIconDecoration)initWithKind:(unint64_t)a3 identifier:(id)a4
{
  id v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ISIconDecoration;
  uint64_t v7 = [(ISIconDecoration *)&v12 init];
  v8 = v7;
  if (v7)
  {
    v7->_identifierKind = a3;
    uint64_t v9 = [v6 copy];
    identifier = v8->_identifier;
    v8->_identifier = (NSString *)v9;

    v8->_position = 0;
    v8->_mode = 0;
  }

  return v8;
}

- (ISIconDecoration)initWithBundleIdentifier:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ISIconDecoration;
  v5 = [(ISIconDecoration *)&v10 init];
  id v6 = v5;
  if (v5)
  {
    v5->_identifierKind = 1;
    uint64_t v7 = [v4 copy];
    identifier = v6->_identifier;
    v6->_identifier = (NSString *)v7;

    v6->_position = 0;
    v6->_mode = 0;
  }

  return v6;
}

- (ISIconDecoration)initWithResourceURL:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ISIconDecoration;
  id v6 = [(ISIconDecoration *)&v10 init];
  uint64_t v7 = v6;
  if (v6)
  {
    v6->_identifierKind = 3;
    objc_storeStrong((id *)&v6->_resourceURL, a3);
    identifier = v7->_identifier;
    v7->_identifier = (NSString *)@"com.apple.icon-decoration.folderbadge";
  }
  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(ISIconDecoration);
  objc_storeStrong((id *)&v4->_identifier, self->_identifier);
  v4->_identifierKind = self->_identifierKind;
  v4->_mode = self->_mode;
  v4->_position = self->_position;
  objc_storeStrong((id *)&v4->_resourceURL, self->_resourceURL);
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t identifierKind = self->_identifierKind;
  id v5 = a3;
  [v5 encodeInteger:identifierKind forKey:@"_identifierKind"];
  [v5 encodeObject:self->_identifier forKey:@"_identifier"];
  [v5 encodeInteger:self->_position forKey:@"_position"];
  [v5 encodeInteger:self->_mode forKey:@"_mode"];
  id v6 = [(NSURL *)self->_resourceURL absoluteString];
  [v5 encodeObject:v6 forKey:@"_resourceURL"];
}

- (ISIconDecoration)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(ISIconDecoration *)self init];
  if (v5)
  {
    v5->_unint64_t identifierKind = [v4 decodeIntegerForKey:@"_identifierKind"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_identifier"];
    uint64_t v7 = (void *)v6;
    if (v6) {
      v8 = (__CFString *)v6;
    }
    else {
      v8 = &stru_1F06391F0;
    }
    objc_storeStrong((id *)&v5->_identifier, v8);

    v5->_position = [v4 decodeIntegerForKey:@"_position"];
    v5->_mode = [v4 decodeIntegerForKey:@"_mode"];
    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_resourceURL"];
    if (v9)
    {
      uint64_t v10 = [MEMORY[0x1E4F1CB10] URLWithString:v9];
      resourceURL = v5->_resourceURL;
      v5->_resourceURL = (NSURL *)v10;
    }
  }

  return v5;
}

- (NSUUID)uuid
{
  v14[2] = *MEMORY[0x1E4F143B8];
  v3 = [NSString stringWithFormat:@"%@-%ld-%ld-%ld", self->_identifier, self->_identifierKind, self->_position, self->_mode];
  resourceURL = self->_resourceURL;
  id v5 = (void *)MEMORY[0x1E4F29128];
  uint64_t v6 = objc_msgSend(MEMORY[0x1E4F29128], "_IF_UUIDWithString:", v3);
  uint64_t v7 = (void *)v6;
  if (resourceURL)
  {
    v14[0] = v6;
    v8 = (void *)MEMORY[0x1E4F29128];
    uint64_t v9 = [(NSURL *)self->_resourceURL absoluteString];
    uint64_t v10 = objc_msgSend(v8, "_IF_UUIDWithString:", v9);
    v14[1] = v10;
    v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:2];
    uint64_t v12 = objc_msgSend(v5, "_IF_UUIDByXORingUUIDs:", v11);

    uint64_t v7 = (void *)v12;
  }

  return (NSUUID *)v7;
}

- (NSString)description
{
  unint64_t v2 = self->_identifierKind - 1;
  if (v2 > 2)
  {
    v3 = &stru_1F06391F0;
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", off_1E5F09578[v2], *(Class *)((char *)&self->super.isa + qword_1AE7C4F08[v2]));
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return (NSString *)v3;
}

- (id)resourceFingerprint
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  unint64_t identifierKind = self->_identifierKind;
  if (identifierKind == 3)
  {
    v17 = (void *)MEMORY[0x1E4F29128];
    v18 = [(NSURL *)self->_resourceURL absoluteString];
    v16 = objc_msgSend(v17, "_IF_UUIDWithString:", v18);
  }
  else if (identifierKind == 2)
  {
    CFURLRef v3 = UTTypeCopyDeclaringBundleURL((CFStringRef)self->_identifier);
    uint64_t v4 = [(__CFURL *)v3 absoluteString];
    id v5 = (void *)v4;
    if (v4) {
      uint64_t v6 = (__CFString *)v4;
    }
    else {
      uint64_t v6 = &stru_1F06391F0;
    }
    v20 = v6;
    uint64_t v7 = _UTTypeCopyIconName();
    v8 = (void *)v7;
    if (v7) {
      uint64_t v9 = (__CFString *)v7;
    }
    else {
      uint64_t v9 = &stru_1F06391F0;
    }
    v21 = v9;
    uint64_t v10 = _UTTypeCopyGlyphName();
    v11 = (void *)v10;
    if (v10) {
      uint64_t v12 = (__CFString *)v10;
    }
    else {
      uint64_t v12 = &stru_1F06391F0;
    }
    v22 = v12;
    v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v20 count:3];

    v14 = (void *)MEMORY[0x1E4F29128];
    v15 = objc_msgSend(v13, "componentsJoinedByString:", &stru_1F06391F0, v20, v21);
    v16 = objc_msgSend(v14, "_IF_UUIDWithString:", v15);
  }
  else
  {
    v16 = objc_msgSend(MEMORY[0x1E4F29128], "_IF_nullUUID");
  }
  return v16;
}

- (ISScalableCompositorResource)compositorResource
{
  if (self->_identifierKind == 2)
  {
    unint64_t v2 = [MEMORY[0x1E4F22490] typeRecordWithIdentifier:self->_identifier];
    CFURLRef v3 = [v2 iconResourceBundleURL];
    uint64_t v4 = [v2 iconDictionary];
    id v5 = +[ISResourceProvider resourceWithBundleURL:v3 iconDictionary:v4 options:0];
  }
  else
  {
    id v5 = 0;
  }
  return (ISScalableCompositorResource *)v5;
}

- (int64_t)position
{
  return self->_position;
}

- (void)setPosition:(int64_t)a3
{
  self->_position = a3;
}

- (int64_t)mode
{
  return self->_mode;
}

- (void)setMode:(int64_t)a3
{
  self->_mode = a3;
}

- (NSURL)resourceURL
{
  return (NSURL *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (unint64_t)identifierKind
{
  return self->_identifierKind;
}

- (NSUUID)resourceToken
{
  return (NSUUID *)objc_getProperty(self, a2, 48, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resourceToken, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_resourceURL, 0);
}

- (id)imageForDescriptor:(id)a3
{
  id v4 = a3;
  id v5 = [(ISIconDecoration *)self compositorResource];
  [v4 size];
  double v7 = v6;
  double v9 = v8;
  [v4 scale];
  double v11 = v10;

  uint64_t v12 = objc_msgSend(v5, "imageForSize:scale:", v7, v9, v11);

  return v12;
}

@end
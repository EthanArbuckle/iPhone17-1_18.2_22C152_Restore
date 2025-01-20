@interface BBAttachmentMetadata
+ (BOOL)supportsSecureCoding;
- (BBAttachmentMetadata)init;
- (BBAttachmentMetadata)initWithCoder:(id)a3;
- (BOOL)hasContentModificationsRelativeTo:(id)a3;
- (BOOL)hiddenFromDefaultExpandedView;
- (BOOL)isEqual:(id)a3;
- (BOOL)thumbnailHidden;
- (NSDictionary)thumbnailGeneratorUserInfo;
- (NSString)identifier;
- (NSString)uniformType;
- (NSURL)URL;
- (NSUUID)UUID;
- (id)_initWithType:(int64_t)a3 URL:(id)a4 identifier:(id)a5 uniformType:(id)a6 thumbnailGeneratorUserInfo:(id)a7 thumbnailHidden:(BOOL)a8 hiddenFromDefaultExpandedView:(BOOL)a9;
- (id)description;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (int64_t)type;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation BBAttachmentMetadata

- (BBAttachmentMetadata)init
{
  LOBYTE(v3) = 0;
  return (BBAttachmentMetadata *)[(BBAttachmentMetadata *)self _initWithType:0 URL:0 identifier:0 uniformType:0 thumbnailGeneratorUserInfo:0 thumbnailHidden:0 hiddenFromDefaultExpandedView:v3];
}

- (id)_initWithType:(int64_t)a3 URL:(id)a4 identifier:(id)a5 uniformType:(id)a6 thumbnailGeneratorUserInfo:(id)a7 thumbnailHidden:(BOOL)a8 hiddenFromDefaultExpandedView:(BOOL)a9
{
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  v31.receiver = self;
  v31.super_class = (Class)BBAttachmentMetadata;
  v19 = [(BBAttachmentMetadata *)&v31 init];
  if (v19)
  {
    uint64_t v20 = [MEMORY[0x263F08C38] UUID];
    UUID = v19->_UUID;
    v19->_UUID = (NSUUID *)v20;

    v19->_type = a3;
    uint64_t v22 = [v15 copy];
    URL = v19->_URL;
    v19->_URL = (NSURL *)v22;

    uint64_t v24 = [v16 copy];
    identifier = v19->_identifier;
    v19->_identifier = (NSString *)v24;

    uint64_t v26 = [v17 copy];
    uniformType = v19->_uniformType;
    v19->_uniformType = (NSString *)v26;

    uint64_t v28 = [v18 copy];
    thumbnailGeneratorUserInfo = v19->_thumbnailGeneratorUserInfo;
    v19->_thumbnailGeneratorUserInfo = (NSDictionary *)v28;

    v19->_thumbnailHidden = a8;
    v19->_hiddenFromDefaultExpandedView = a9;
  }

  return v19;
}

- (unint64_t)hash
{
  int64_t v3 = [(BBAttachmentMetadata *)self type];
  v4 = [(BBAttachmentMetadata *)self URL];
  unint64_t v5 = [v4 hash] ^ v3;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (BBAttachmentMetadata *)a3;
  if (self == v4)
  {
    char v9 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass()))
    {
      unint64_t v5 = v4;
      int64_t v6 = [(BBAttachmentMetadata *)self type];
      if (v6 == [(BBAttachmentMetadata *)v5 type])
      {
        v7 = [(BBAttachmentMetadata *)self URL];
        v8 = [(BBAttachmentMetadata *)v5 URL];
        char v9 = BSEqualObjects();
      }
      else
      {
        char v9 = 0;
      }
    }
    else
    {
      char v9 = 0;
    }
  }

  return v9;
}

- (BOOL)hasContentModificationsRelativeTo:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(BBAttachmentMetadata *)self type];
  if (v5 == [v4 type])
  {
    int64_t v6 = [(BBAttachmentMetadata *)self URL];
    v7 = [v4 URL];
    int v8 = BSEqualObjects() ^ 1;
  }
  else
  {
    LOBYTE(v8) = 1;
  }

  return v8;
}

- (id)description
{
  int64_t v3 = [MEMORY[0x263F29C40] builderWithObject:self];
  id v4 = (id)objc_msgSend(v3, "appendInteger:withName:", -[BBAttachmentMetadata type](self, "type"), @"type");
  int64_t v5 = [(BBAttachmentMetadata *)self URL];
  id v6 = (id)[v3 appendObject:v5 withName:@"URL"];

  v7 = [v3 build];

  return v7;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = +[BBMutableAttachmentMetadata allocWithZone:a3];
  int64_t v5 = [(BBAttachmentMetadata *)self type];
  id v6 = [(BBAttachmentMetadata *)self URL];
  v7 = [(BBAttachmentMetadata *)self identifier];
  int v8 = [(BBAttachmentMetadata *)self uniformType];
  char v9 = [(BBAttachmentMetadata *)self thumbnailGeneratorUserInfo];
  BOOL v10 = [(BBAttachmentMetadata *)self thumbnailHidden];
  LOBYTE(v13) = [(BBAttachmentMetadata *)self hiddenFromDefaultExpandedView];
  id v11 = [(BBAttachmentMetadata *)v4 _initWithType:v5 URL:v6 identifier:v7 uniformType:v8 thumbnailGeneratorUserInfo:v9 thumbnailHidden:v10 hiddenFromDefaultExpandedView:v13];

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v8 = a3;
  objc_msgSend(v8, "encodeInteger:forKey:", -[BBAttachmentMetadata type](self, "type"), @"type");
  id v4 = [(BBAttachmentMetadata *)self URL];
  [v8 encodeObject:v4 forKey:@"URL"];

  int64_t v5 = [(BBAttachmentMetadata *)self identifier];
  [v8 encodeObject:v5 forKey:@"identifier"];

  id v6 = [(BBAttachmentMetadata *)self uniformType];
  [v8 encodeObject:v6 forKey:@"uniformType"];

  v7 = [(BBAttachmentMetadata *)self thumbnailGeneratorUserInfo];
  [v8 encodeObject:v7 forKey:@"thumbnailGeneratorUserInfo"];

  objc_msgSend(v8, "encodeBool:forKey:", -[BBAttachmentMetadata thumbnailHidden](self, "thumbnailHidden"), @"thumbnailHidden");
  objc_msgSend(v8, "encodeBool:forKey:", -[BBAttachmentMetadata hiddenFromDefaultExpandedView](self, "hiddenFromDefaultExpandedView"), @"hiddenFromDefaultExpandedView");
}

- (BBAttachmentMetadata)initWithCoder:(id)a3
{
  id v3 = a3;
  uint64_t v18 = [v3 decodeIntegerForKey:@"type"];
  id v4 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"URL"];
  int64_t v5 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
  id v6 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"uniformType"];
  v7 = (void *)MEMORY[0x263EFFA08];
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  v12 = objc_msgSend(v7, "setWithObjects:", v8, v9, v10, v11, objc_opt_class(), 0);
  uint64_t v13 = [v3 decodeObjectOfClasses:v12 forKey:@"thumbnailGeneratorUserInfo"];

  uint64_t v14 = [v3 decodeBoolForKey:@"thumbnailHidden"];
  LOBYTE(v8) = [v3 decodeBoolForKey:@"hiddenFromDefaultExpandedView"];

  LOBYTE(v17) = v8;
  id v15 = [(BBAttachmentMetadata *)self _initWithType:v18 URL:v4 identifier:v5 uniformType:v6 thumbnailGeneratorUserInfo:v13 thumbnailHidden:v14 hiddenFromDefaultExpandedView:v17];

  return v15;
}

- (int64_t)type
{
  return self->_type;
}

- (NSURL)URL
{
  return self->_URL;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)uniformType
{
  return self->_uniformType;
}

- (NSDictionary)thumbnailGeneratorUserInfo
{
  return self->_thumbnailGeneratorUserInfo;
}

- (BOOL)thumbnailHidden
{
  return self->_thumbnailHidden;
}

- (BOOL)hiddenFromDefaultExpandedView
{
  return self->_hiddenFromDefaultExpandedView;
}

- (NSUUID)UUID
{
  return self->_UUID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_UUID, 0);
  objc_storeStrong((id *)&self->_thumbnailGeneratorUserInfo, 0);
  objc_storeStrong((id *)&self->_uniformType, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_URL, 0);
}

@end
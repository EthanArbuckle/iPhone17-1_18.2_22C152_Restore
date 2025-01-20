@interface IMCollaborationNoticeMetadata
+ (BOOL)supportsSecureCoding;
+ (id)metadataWithType:(int64_t)a3 bundleIdentifier:(id)a4 contentURL:(id)a5 contentTitle:(id)a6 contentType:(id)a7 messageGUID:(id)a8;
- (BOOL)isEqual:(id)a3;
- (IMCollaborationNoticeMetadata)initWithCoder:(id)a3;
- (IMCollaborationNoticeMetadata)initWithNoticeType:(int64_t)a3 bundleIdentifier:(id)a4 contentURL:(id)a5 contentTitle:(id)a6 contentType:(id)a7 messageGUID:(id)a8;
- (NSNumber)typeNumber;
- (NSString)bundleIdentifier;
- (NSString)contentTitle;
- (NSString)messageGUID;
- (NSURL)contentURL;
- (UTType)contentType;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)type;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setBundleIdentifier:(id)a3;
- (void)setContentTitle:(id)a3;
- (void)setContentType:(id)a3;
- (void)setContentURL:(id)a3;
- (void)setMessageGUID:(id)a3;
- (void)setType:(int64_t)a3;
- (void)setTypeNumber:(id)a3;
@end

@implementation IMCollaborationNoticeMetadata

+ (id)metadataWithType:(int64_t)a3 bundleIdentifier:(id)a4 contentURL:(id)a5 contentTitle:(id)a6 contentType:(id)a7 messageGUID:(id)a8
{
  id v13 = a8;
  id v14 = a7;
  id v15 = a6;
  id v16 = a5;
  id v17 = a4;
  v18 = [[IMCollaborationNoticeMetadata alloc] initWithNoticeType:a3 bundleIdentifier:v17 contentURL:v16 contentTitle:v15 contentType:v14 messageGUID:v13];

  return v18;
}

- (IMCollaborationNoticeMetadata)initWithNoticeType:(int64_t)a3 bundleIdentifier:(id)a4 contentURL:(id)a5 contentTitle:(id)a6 contentType:(id)a7 messageGUID:(id)a8
{
  id v25 = a4;
  id v24 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  v26.receiver = self;
  v26.super_class = (Class)IMCollaborationNoticeMetadata;
  v18 = [(IMCollaborationNoticeMetadata *)&v26 init];
  v19 = v18;
  if (v18)
  {
    if ((unint64_t)a3 >= 0xA) {
      int64_t v20 = -1;
    }
    else {
      int64_t v20 = a3;
    }
    v18->_type = v20;
    uint64_t v21 = objc_msgSend(NSNumber, "numberWithInteger:", v24, v25);
    typeNumber = v19->_typeNumber;
    v19->_typeNumber = (NSNumber *)v21;

    objc_storeStrong((id *)&v19->_bundleIdentifier, a4);
    objc_storeStrong((id *)&v19->_contentURL, a5);
    objc_storeStrong((id *)&v19->_contentTitle, a6);
    objc_storeStrong((id *)&v19->_contentType, a7);
    objc_storeStrong((id *)&v19->_messageGUID, a8);
  }

  return v19;
}

- (void)setType:(int64_t)a3
{
  if (self->_type != a3)
  {
    self->_type = a3;
    objc_msgSend(NSNumber, "numberWithInteger:");
    v4 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    typeNumber = self->_typeNumber;
    self->_typeNumber = v4;
    MEMORY[0x1F41817F8](v4, typeNumber);
  }
}

- (BOOL)isEqual:(id)a3
{
  v4 = (IMCollaborationNoticeMetadata *)a3;
  if (v4 == self)
  {
    char v21 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      int64_t v6 = [(IMCollaborationNoticeMetadata *)self type];
      if (v6 != [(IMCollaborationNoticeMetadata *)v5 type]) {
        goto LABEL_11;
      }
      v7 = [(IMCollaborationNoticeMetadata *)self bundleIdentifier];
      v8 = [(IMCollaborationNoticeMetadata *)v5 bundleIdentifier];
      int v9 = [v7 isEqualToString:v8];

      if (!v9) {
        goto LABEL_11;
      }
      v10 = [(IMCollaborationNoticeMetadata *)self contentURL];
      v11 = [(IMCollaborationNoticeMetadata *)v5 contentURL];
      int v12 = [v10 isEqual:v11];

      if (!v12) {
        goto LABEL_11;
      }
      id v13 = [(IMCollaborationNoticeMetadata *)self contentTitle];
      id v14 = [(IMCollaborationNoticeMetadata *)v5 contentTitle];
      int v15 = [v13 isEqualToString:v14];

      if (!v15) {
        goto LABEL_11;
      }
      id v16 = [(IMCollaborationNoticeMetadata *)self contentType];
      id v17 = [(IMCollaborationNoticeMetadata *)v5 contentType];
      int v18 = [v16 isEqual:v17];

      if (v18)
      {
        v19 = [(IMCollaborationNoticeMetadata *)self messageGUID];
        int64_t v20 = [(IMCollaborationNoticeMetadata *)v5 messageGUID];
        char v21 = [v19 isEqual:v20];
      }
      else
      {
LABEL_11:
        char v21 = 0;
      }
    }
    else
    {
      char v21 = 0;
    }
  }

  return v21;
}

- (unint64_t)hash
{
  v3 = [(IMCollaborationNoticeMetadata *)self typeNumber];
  uint64_t v4 = [v3 hash];
  v5 = [(IMCollaborationNoticeMetadata *)self bundleIdentifier];
  uint64_t v6 = [v5 hash] ^ v4;
  v7 = [(IMCollaborationNoticeMetadata *)self contentURL];
  uint64_t v8 = [v7 hash];
  int v9 = [(IMCollaborationNoticeMetadata *)self contentTitle];
  uint64_t v10 = v6 ^ v8 ^ [v9 hash];
  v11 = [(IMCollaborationNoticeMetadata *)self contentType];
  uint64_t v12 = [v11 hash];
  id v13 = [(IMCollaborationNoticeMetadata *)self messageGUID];
  unint64_t v14 = v10 ^ v12 ^ [v13 hash];

  return v14;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_msgSend(NSNumber, "numberWithInteger:", -[IMCollaborationNoticeMetadata type](self, "type"));
  v5 = [(IMCollaborationNoticeMetadata *)self bundleIdentifier];
  uint64_t v6 = [(IMCollaborationNoticeMetadata *)self contentURL];
  v7 = [(IMCollaborationNoticeMetadata *)self contentTitle];
  uint64_t v8 = [(IMCollaborationNoticeMetadata *)self contentType];
  int v9 = [(IMCollaborationNoticeMetadata *)self messageGUID];
  uint64_t v10 = [v3 stringWithFormat:@"type: %@, bundleIdentifier: %@, contentURL: %@, contentTitle: %@, contentType: %@, messageGUID: %@", v4, v5, v6, v7, v8, v9];

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[IMCollaborationNoticeMetadata type](self, "type"), @"t");
  v5 = [(IMCollaborationNoticeMetadata *)self bundleIdentifier];
  [v4 encodeObject:v5 forKey:@"b"];

  uint64_t v6 = [(IMCollaborationNoticeMetadata *)self contentURL];
  [v4 encodeObject:v6 forKey:@"u"];

  v7 = [(IMCollaborationNoticeMetadata *)self contentTitle];
  [v4 encodeObject:v7 forKey:@"c"];

  uint64_t v8 = [(IMCollaborationNoticeMetadata *)self contentType];
  [v4 encodeObject:v8 forKey:@"y"];

  id v9 = [(IMCollaborationNoticeMetadata *)self messageGUID];
  [v4 encodeObject:v9 forKey:@"m"];
}

- (IMCollaborationNoticeMetadata)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)IMCollaborationNoticeMetadata;
  v5 = [(IMCollaborationNoticeMetadata *)&v12 init];
  if (v5)
  {
    -[IMCollaborationNoticeMetadata setType:](v5, "setType:", [v4 decodeIntegerForKey:@"t"]);
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"b"];
    [(IMCollaborationNoticeMetadata *)v5 setBundleIdentifier:v6];

    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"u"];
    [(IMCollaborationNoticeMetadata *)v5 setContentURL:v7];

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"c"];
    [(IMCollaborationNoticeMetadata *)v5 setContentTitle:v8];

    id v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"y"];
    [(IMCollaborationNoticeMetadata *)v5 setContentType:v9];

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"m"];
    [(IMCollaborationNoticeMetadata *)v5 setMessageGUID:v10];
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v4, "setType:", -[IMCollaborationNoticeMetadata type](self, "type"));
  v5 = [(IMCollaborationNoticeMetadata *)self bundleIdentifier];
  [v4 setBundleIdentifier:v5];

  uint64_t v6 = [(IMCollaborationNoticeMetadata *)self contentURL];
  [v4 setContentURL:v6];

  v7 = [(IMCollaborationNoticeMetadata *)self contentTitle];
  [v4 setContentTitle:v7];

  uint64_t v8 = [(IMCollaborationNoticeMetadata *)self contentType];
  [v4 setContentType:v8];

  id v9 = [(IMCollaborationNoticeMetadata *)self messageGUID];
  [v4 setMessageGUID:v9];

  return v4;
}

- (int64_t)type
{
  return self->_type;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
}

- (NSURL)contentURL
{
  return self->_contentURL;
}

- (void)setContentURL:(id)a3
{
}

- (NSString)contentTitle
{
  return self->_contentTitle;
}

- (void)setContentTitle:(id)a3
{
}

- (UTType)contentType
{
  return self->_contentType;
}

- (void)setContentType:(id)a3
{
}

- (NSString)messageGUID
{
  return self->_messageGUID;
}

- (void)setMessageGUID:(id)a3
{
}

- (NSNumber)typeNumber
{
  return self->_typeNumber;
}

- (void)setTypeNumber:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_typeNumber, 0);
  objc_storeStrong((id *)&self->_messageGUID, 0);
  objc_storeStrong((id *)&self->_contentType, 0);
  objc_storeStrong((id *)&self->_contentTitle, 0);
  objc_storeStrong((id *)&self->_contentURL, 0);

  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end
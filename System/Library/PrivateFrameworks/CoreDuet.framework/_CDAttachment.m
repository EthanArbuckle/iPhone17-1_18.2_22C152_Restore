@interface _CDAttachment
+ (BOOL)supportsSecureCoding;
+ (id)attachmentWithIdentifier:(id)a3 cloudIdentifier:(id)a4 type:(id)a5 sizeInBytes:(id)a6 creationDate:(id)a7;
+ (id)attachmentWithIdentifier:(id)a3 cloudIdentifier:(id)a4 type:(id)a5 sizeInBytes:(id)a6 creationDate:(id)a7 contentURL:(id)a8 contentText:(id)a9;
- (BOOL)isEqual:(id)a3;
- (NSDate)creationDate;
- (NSNumber)size;
- (NSString)contentText;
- (NSString)personInPhoto;
- (NSString)photoLocalIdentifier;
- (NSString)photoSceneDescriptor;
- (NSString)uti;
- (NSURL)contentURL;
- (NSUUID)cloudIdentifier;
- (NSUUID)identifier;
- (_CDAttachment)initWithCoder:(id)a3;
- (_CDAttachment)initWithIdentifier:(id)a3 cloudIdentifier:(id)a4 photoLocalIdentifier:(id)a5 type:(id)a6 sizeInBytes:(id)a7 creationDate:(id)a8 contentURL:(id)a9 contentText:(id)a10;
- (_CDAttachment)initWithIdentifier:(id)a3 cloudIdentifier:(id)a4 photoLocalIdentifier:(id)a5 type:(id)a6 sizeInBytes:(id)a7 creationDate:(id)a8 contentURL:(id)a9 contentText:(id)a10 photoSceneDescriptor:(id)a11 personInPhoto:(id)a12;
- (_CDAttachment)initWithIdentifier:(id)a3 cloudIdentifier:(id)a4 type:(id)a5 sizeInBytes:(id)a6 creationDate:(id)a7 contentURL:(id)a8 contentText:(id)a9;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)descriptionRedacted:(BOOL)a3;
- (id)redactedDescription;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setCloudIdentifier:(id)a3;
- (void)setContentText:(id)a3;
- (void)setContentURL:(id)a3;
- (void)setCreationDate:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setPersonInPhoto:(id)a3;
- (void)setPhotoLocalIdentifier:(id)a3;
- (void)setPhotoSceneDescriptor:(id)a3;
- (void)setSize:(id)a3;
- (void)setUti:(id)a3;
@end

@implementation _CDAttachment

+ (id)attachmentWithIdentifier:(id)a3 cloudIdentifier:(id)a4 type:(id)a5 sizeInBytes:(id)a6 creationDate:(id)a7
{
  id v11 = a7;
  id v12 = a6;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  v16 = (void *)[objc_alloc((Class)objc_opt_class()) initWithIdentifier:v15 cloudIdentifier:v14 type:v13 sizeInBytes:v12 creationDate:v11 contentURL:0 contentText:0];

  return v16;
}

+ (id)attachmentWithIdentifier:(id)a3 cloudIdentifier:(id)a4 type:(id)a5 sizeInBytes:(id)a6 creationDate:(id)a7 contentURL:(id)a8 contentText:(id)a9
{
  id v15 = a9;
  id v16 = a8;
  id v17 = a7;
  id v18 = a6;
  id v19 = a5;
  id v20 = a4;
  id v21 = a3;
  v22 = (void *)[objc_alloc((Class)objc_opt_class()) initWithIdentifier:v21 cloudIdentifier:v20 type:v19 sizeInBytes:v18 creationDate:v17 contentURL:v16 contentText:v15];

  return v22;
}

- (_CDAttachment)initWithIdentifier:(id)a3 cloudIdentifier:(id)a4 type:(id)a5 sizeInBytes:(id)a6 creationDate:(id)a7 contentURL:(id)a8 contentText:(id)a9
{
  return [(_CDAttachment *)self initWithIdentifier:a3 cloudIdentifier:a4 photoLocalIdentifier:0 type:a5 sizeInBytes:a6 creationDate:a7 contentURL:a8 contentText:a9];
}

- (_CDAttachment)initWithIdentifier:(id)a3 cloudIdentifier:(id)a4 photoLocalIdentifier:(id)a5 type:(id)a6 sizeInBytes:(id)a7 creationDate:(id)a8 contentURL:(id)a9 contentText:(id)a10
{
  return [(_CDAttachment *)self initWithIdentifier:a3 cloudIdentifier:a4 photoLocalIdentifier:0 type:a6 sizeInBytes:a7 creationDate:a8 contentURL:a9 contentText:a10 photoSceneDescriptor:0 personInPhoto:0];
}

- (_CDAttachment)initWithIdentifier:(id)a3 cloudIdentifier:(id)a4 photoLocalIdentifier:(id)a5 type:(id)a6 sizeInBytes:(id)a7 creationDate:(id)a8 contentURL:(id)a9 contentText:(id)a10 photoSceneDescriptor:(id)a11 personInPhoto:(id)a12
{
  id v34 = a3;
  id obj = a4;
  id v33 = a4;
  id v27 = a5;
  id v32 = a5;
  id v31 = a6;
  id v18 = a8;
  id v30 = a7;
  id v29 = a8;
  id v19 = a9;
  id v20 = a10;
  id v21 = a11;
  id v22 = a12;
  v35.receiver = self;
  v35.super_class = (Class)_CDAttachment;
  v23 = [(_CDAttachment *)&v35 init];
  v24 = v23;
  if (v23)
  {
    objc_storeStrong((id *)&v23->_identifier, a3);
    objc_storeStrong((id *)&v24->_cloudIdentifier, obj);
    objc_storeStrong((id *)&v24->_photoLocalIdentifier, v27);
    objc_storeStrong((id *)&v24->_uti, a6);
    objc_storeStrong((id *)&v24->_creationDate, v18);
    objc_storeStrong((id *)&v24->_size, a7);
    objc_storeStrong((id *)&v24->_contentURL, a9);
    [(_CDAttachment *)v24 setContentText:v20];
    objc_storeStrong((id *)&v24->_photoSceneDescriptor, a11);
    objc_storeStrong((id *)&v24->_personInPhoto, a12);
  }

  return v24;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_CDAttachment)initWithCoder:(id)a3
{
  id v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)_CDAttachment;
  v5 = [(_CDAttachment *)&v27 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSUUID *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"cloudIdentifier"];
    cloudIdentifier = v5->_cloudIdentifier;
    v5->_cloudIdentifier = (NSUUID *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"photoLocalIdentifier"];
    photoLocalIdentifier = v5->_photoLocalIdentifier;
    v5->_photoLocalIdentifier = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"uti"];
    uti = v5->_uti;
    v5->_uti = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"size"];
    size = v5->_size;
    v5->_size = (NSNumber *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"creationDate"];
    creationDate = v5->_creationDate;
    v5->_creationDate = (NSDate *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"contentURL"];
    contentURL = v5->_contentURL;
    v5->_contentURL = (NSURL *)v18;

    id v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"contentText"];
    [(_CDAttachment *)v5 setContentText:v20];

    uint64_t v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"personInPhoto"];
    personInPhoto = v5->_personInPhoto;
    v5->_personInPhoto = (NSString *)v21;

    uint64_t v23 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"photoSceneDescriptor"];
    photoSceneDescriptor = v5->_photoSceneDescriptor;
    v5->_photoSceneDescriptor = (NSString *)v23;

    v25 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  identifier = self->_identifier;
  id v6 = a3;
  [v6 encodeObject:identifier forKey:@"identifier"];
  [v6 encodeObject:self->_cloudIdentifier forKey:@"cloudIdentifier"];
  [v6 encodeObject:self->_photoLocalIdentifier forKey:@"photoLocalIdentifier"];
  [v6 encodeObject:self->_uti forKey:@"uti"];
  [v6 encodeObject:self->_size forKey:@"size"];
  [v6 encodeObject:self->_creationDate forKey:@"creationDate"];
  [v6 encodeObject:self->_contentURL forKey:@"contentURL"];
  v5 = [(_CDAttachment *)self contentText];
  [v6 encodeObject:v5 forKey:@"contentText"];

  [v6 encodeObject:self->_personInPhoto forKey:@"personInPhoto"];
  [v6 encodeObject:self->_photoSceneDescriptor forKey:@"photoSceneDescriptor"];
}

- (NSString)contentText
{
  return self->_contentText;
}

- (void)setContentText:(id)a3
{
  if (a3) {
    v3 = &stru_1EDDE58B8;
  }
  else {
    v3 = 0;
  }
  objc_storeStrong((id *)&self->_contentText, v3);
}

- (id)description
{
  return [(_CDAttachment *)self descriptionRedacted:0];
}

- (id)redactedDescription
{
  return [(_CDAttachment *)self descriptionRedacted:1];
}

- (id)descriptionRedacted:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  objc_msgSend(v5, "appendString:", @"(");
  id v6 = [(_CDAttachment *)self identifier];

  if (v6)
  {
    v7 = [(_CDAttachment *)self identifier];
    [v5 appendFormat:@"identifier: %@ ", v7];
  }
  uint64_t v8 = [(_CDAttachment *)self cloudIdentifier];

  if (v8)
  {
    v9 = [(_CDAttachment *)self cloudIdentifier];
    [v5 appendFormat:@"cloudIdentifier: %@ ", v9];
  }
  uint64_t v10 = [(_CDAttachment *)self photoLocalIdentifier];

  if (v10)
  {
    id v11 = [(_CDAttachment *)self photoLocalIdentifier];
    [v5 appendFormat:@"photoLocalIdentifier: %@ ", v11];
  }
  uint64_t v12 = [(_CDAttachment *)self uti];

  if (v12)
  {
    id v13 = [(_CDAttachment *)self uti];
    [v5 appendFormat:@"UTI: %@ ", v13];
  }
  uint64_t v14 = [(_CDAttachment *)self size];

  if (v14)
  {
    id v15 = [(_CDAttachment *)self size];
    [v5 appendFormat:@"size: %@ ", v15];
  }
  uint64_t v16 = [(_CDAttachment *)self creationDate];

  if (v16)
  {
    id v17 = [(_CDAttachment *)self creationDate];
    [v5 appendFormat:@"creationDate: %@ ", v17];
  }
  uint64_t v18 = [(_CDAttachment *)self contentURL];

  if (v18)
  {
    if (v3)
    {
      [v5 appendFormat:@"contentURL: %@ ", @"redacted"];
    }
    else
    {
      id v19 = [(_CDAttachment *)self contentURL];
      [v5 appendFormat:@"contentURL: %@ ", v19];
    }
  }
  id v20 = [(_CDAttachment *)self contentText];

  if (v20)
  {
    if (v3)
    {
      [v5 appendFormat:@"contentText: %@ ", @"redacted"];
    }
    else
    {
      uint64_t v21 = [(_CDAttachment *)self contentText];
      [v5 appendFormat:@"contentText: %@ ", v21];
    }
  }
  id v22 = [(_CDAttachment *)self personInPhoto];

  if (v22)
  {
    if (v3)
    {
      [v5 appendFormat:@"personInPhoto: %@ ", @"redacted"];
    }
    else
    {
      uint64_t v23 = [(_CDAttachment *)self personInPhoto];
      [v5 appendFormat:@"personInPhoto: %@ ", v23];
    }
  }
  v24 = [(_CDAttachment *)self photoSceneDescriptor];

  if (v24)
  {
    if (v3)
    {
      [v5 appendFormat:@"photoSceneDescriptor: %@ ", @"redacted"];
    }
    else
    {
      v25 = [(_CDAttachment *)self photoSceneDescriptor];
      [v5 appendFormat:@"photoSceneDescriptor: %@ ", v25];
    }
  }
  [v5 appendString:@""]);
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [+[_CDAttachment allocWithZone:a3] init];
  id v5 = [(_CDAttachment *)self identifier];
  [(_CDAttachment *)v4 setIdentifier:v5];

  id v6 = [(_CDAttachment *)self cloudIdentifier];
  [(_CDAttachment *)v4 setCloudIdentifier:v6];

  v7 = [(_CDAttachment *)self uti];
  [(_CDAttachment *)v4 setUti:v7];

  uint64_t v8 = [(_CDAttachment *)self size];
  [(_CDAttachment *)v4 setSize:v8];

  v9 = [(_CDAttachment *)self creationDate];
  [(_CDAttachment *)v4 setCreationDate:v9];

  uint64_t v10 = [(_CDAttachment *)self contentURL];
  [(_CDAttachment *)v4 setContentURL:v10];

  id v11 = [(_CDAttachment *)self contentText];
  [(_CDAttachment *)v4 setContentText:v11];

  uint64_t v12 = [(_CDAttachment *)self personInPhoto];
  [(_CDAttachment *)v4 setPersonInPhoto:v12];

  id v13 = [(_CDAttachment *)self photoSceneDescriptor];
  [(_CDAttachment *)v4 setPhotoSceneDescriptor:v13];

  return v4;
}

- (unint64_t)hash
{
  uint64_t v3 = 31 * [(NSUUID *)self->_identifier hash];
  uint64_t v4 = [(NSUUID *)self->_cloudIdentifier hash];
  NSUInteger v5 = v4 ^ [(NSString *)self->_uti hash];
  uint64_t v6 = v5 ^ [(NSNumber *)self->_size hash] ^ v3;
  uint64_t v7 = [(NSDate *)self->_creationDate hash];
  uint64_t v8 = [(_CDAttachment *)self personInPhoto];
  uint64_t v9 = v7 ^ [v8 hash];
  uint64_t v10 = [(_CDAttachment *)self photoSceneDescriptor];
  unint64_t v11 = v6 ^ v9 ^ [v10 hash];

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (_CDAttachment *)a3;
  if (v4 == self)
  {
    char v11 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      NSUInteger v5 = v4;
      identifier = self->_identifier;
      uint64_t v7 = v5->_identifier;
      if (identifier == v7)
      {
      }
      else
      {
        uint64_t v8 = v7;
        uint64_t v9 = identifier;
        char v10 = [(NSUUID *)v9 isEqual:v8];

        if ((v10 & 1) == 0) {
          goto LABEL_35;
        }
      }
      cloudIdentifier = self->_cloudIdentifier;
      id v13 = v5->_cloudIdentifier;
      if (cloudIdentifier == v13)
      {
      }
      else
      {
        uint64_t v14 = v13;
        id v15 = cloudIdentifier;
        char v16 = [(NSUUID *)v15 isEqual:v14];

        if ((v16 & 1) == 0) {
          goto LABEL_35;
        }
      }
      uti = self->_uti;
      uint64_t v18 = v5->_uti;
      if (uti == v18)
      {
      }
      else
      {
        id v19 = v18;
        id v20 = uti;
        char v21 = [(NSString *)v20 isEqual:v19];

        if ((v21 & 1) == 0) {
          goto LABEL_35;
        }
      }
      size = self->_size;
      uint64_t v23 = v5->_size;
      if (size == v23)
      {
      }
      else
      {
        v24 = v23;
        v25 = size;
        char v26 = [(NSNumber *)v25 isEqual:v24];

        if ((v26 & 1) == 0) {
          goto LABEL_35;
        }
      }
      creationDate = self->_creationDate;
      v28 = v5->_creationDate;
      if (creationDate == v28)
      {
      }
      else
      {
        id v29 = v28;
        id v30 = creationDate;
        char v31 = [(NSDate *)v30 isEqual:v29];

        if ((v31 & 1) == 0) {
          goto LABEL_35;
        }
      }
      contentURL = self->_contentURL;
      id v33 = v5->_contentURL;
      if (contentURL == v33)
      {
      }
      else
      {
        id v34 = v33;
        objc_super v35 = contentURL;
        char v36 = [(NSURL *)v35 isEqual:v34];

        if ((v36 & 1) == 0) {
          goto LABEL_35;
        }
      }
      contentText = self->_contentText;
      v38 = v5->_contentText;
      if (contentText == v38)
      {
      }
      else
      {
        v39 = v38;
        v40 = contentText;
        char v41 = [(NSString *)v40 isEqual:v39];

        if ((v41 & 1) == 0) {
          goto LABEL_35;
        }
      }
      photoSceneDescriptor = self->_photoSceneDescriptor;
      v43 = v5->_photoSceneDescriptor;
      if (photoSceneDescriptor == v43)
      {
      }
      else
      {
        v44 = v43;
        v45 = photoSceneDescriptor;
        char v46 = [(NSString *)v45 isEqual:v44];

        if ((v46 & 1) == 0)
        {
LABEL_35:
          char v11 = 0;
LABEL_36:

          goto LABEL_37;
        }
      }
      v48 = self->_personInPhoto;
      v49 = v48;
      if (v48 == v5->_personInPhoto) {
        char v11 = 1;
      }
      else {
        char v11 = -[NSString isEqual:](v48, "isEqual:");
      }

      goto LABEL_36;
    }
    char v11 = 0;
  }
LABEL_37:

  return v11;
}

- (NSDate)creationDate
{
  return (NSDate *)objc_getProperty(self, a2, 16, 1);
}

- (void)setCreationDate:(id)a3
{
}

- (NSString)uti
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setUti:(id)a3
{
}

- (NSUUID)identifier
{
  return (NSUUID *)objc_getProperty(self, a2, 32, 1);
}

- (void)setIdentifier:(id)a3
{
}

- (NSUUID)cloudIdentifier
{
  return (NSUUID *)objc_getProperty(self, a2, 40, 1);
}

- (void)setCloudIdentifier:(id)a3
{
}

- (NSString)photoLocalIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setPhotoLocalIdentifier:(id)a3
{
}

- (NSNumber)size
{
  return (NSNumber *)objc_getProperty(self, a2, 56, 1);
}

- (void)setSize:(id)a3
{
}

- (NSURL)contentURL
{
  return (NSURL *)objc_getProperty(self, a2, 64, 1);
}

- (void)setContentURL:(id)a3
{
}

- (NSString)photoSceneDescriptor
{
  return self->_photoSceneDescriptor;
}

- (void)setPhotoSceneDescriptor:(id)a3
{
}

- (NSString)personInPhoto
{
  return self->_personInPhoto;
}

- (void)setPersonInPhoto:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_personInPhoto, 0);
  objc_storeStrong((id *)&self->_photoSceneDescriptor, 0);
  objc_storeStrong((id *)&self->_contentURL, 0);
  objc_storeStrong((id *)&self->_size, 0);
  objc_storeStrong((id *)&self->_photoLocalIdentifier, 0);
  objc_storeStrong((id *)&self->_cloudIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_uti, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_contentText, 0);
}

@end
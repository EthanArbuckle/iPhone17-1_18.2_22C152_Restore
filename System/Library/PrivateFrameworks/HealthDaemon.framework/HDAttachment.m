@interface HDAttachment
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (HDAttachment)initWithCoder:(id)a3;
- (HDAttachment)initWithIdentifier:(id)a3 name:(id)a4 type:(id)a5 hash:(id)a6 size:(unint64_t)a7 creationDate:(id)a8 metadata:(id)a9 encryptionKey:(id)a10;
- (HDEncryptedArchiveSymmetricKey)encryptionKey;
- (NSDate)creationDate;
- (NSDictionary)metadata;
- (NSString)fileHash;
- (NSString)name;
- (NSString)type;
- (NSUUID)identifier;
- (id)hkAttachment;
- (unint64_t)hash;
- (unint64_t)size;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HDAttachment

- (HDAttachment)initWithIdentifier:(id)a3 name:(id)a4 type:(id)a5 hash:(id)a6 size:(unint64_t)a7 creationDate:(id)a8 metadata:(id)a9 encryptionKey:(id)a10
{
  id v30 = a3;
  id v29 = a4;
  id v28 = a5;
  id v16 = a6;
  id v17 = a8;
  id v18 = a9;
  id v19 = a10;
  v31.receiver = self;
  v31.super_class = (Class)HDAttachment;
  v20 = [(HDAttachment *)&v31 init];
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_identifier, a3);
    objc_storeStrong((id *)&v21->_name, a4);
    objc_storeStrong((id *)&v21->_type, a5);
    objc_storeStrong((id *)&v21->_fileHash, a6);
    v21->_size = a7;
    objc_storeStrong((id *)&v21->_creationDate, a8);
    uint64_t v22 = [v18 copy];
    metadata = v21->_metadata;
    v21->_metadata = (NSDictionary *)v22;

    uint64_t v24 = [v19 copy];
    encryptionKey = v21->_encryptionKey;
    v21->_encryptionKey = (HDEncryptedArchiveSymmetricKey *)v24;
  }
  return v21;
}

- (id)hkAttachment
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F2AC00]) initWithIdentifier:self->_identifier name:self->_name typeIdentifier:self->_type size:self->_size creationDate:self->_creationDate metadata:self->_metadata];

  return v2;
}

- (unint64_t)hash
{
  return [(NSUUID *)self->_identifier hash];
}

- (BOOL)isEqual:(id)a3
{
  v5 = (HDAttachment *)a3;
  if (self == v5)
  {
    char v14 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v6 = v5;
      identifier = self->_identifier;
      v8 = [(HDAttachment *)v6 identifier];
      if (![(NSUUID *)identifier isEqual:v8])
      {
        char v14 = 0;
LABEL_54:

        goto LABEL_55;
      }
      name = self->_name;
      v10 = [(HDAttachment *)v6 name];
      if (name != v10)
      {
        uint64_t v11 = [(HDAttachment *)v6 name];
        if (!v11)
        {
          char v14 = 0;
          goto LABEL_53;
        }
        v54 = (void *)v11;
        v12 = self->_name;
        v13 = [(HDAttachment *)v6 name];
        if (![(NSString *)v12 isEqualToString:v13])
        {
          char v14 = 0;
LABEL_52:

          goto LABEL_53;
        }
        v53 = v13;
      }
      type = self->_type;
      id v16 = [(HDAttachment *)v6 type];
      if (type != v16)
      {
        uint64_t v17 = [(HDAttachment *)v6 type];
        if (!v17)
        {
LABEL_31:

LABEL_32:
          char v14 = 0;
          goto LABEL_51;
        }
        v50 = (void *)v17;
        id v18 = self->_type;
        v3 = [(HDAttachment *)v6 type];
        if (![(NSString *)v18 isEqualToString:v3])
        {
LABEL_30:

          goto LABEL_31;
        }
      }
      v52 = type;
      fileHash = self->_fileHash;
      v51 = [(HDAttachment *)v6 fileHash];
      if (fileHash == v51)
      {
        v49 = fileHash;
        unint64_t size = self->_size;
        if (size == [(HDAttachment *)v6 size]) {
          goto LABEL_23;
        }
      }
      else
      {
        uint64_t v20 = [(HDAttachment *)v6 fileHash];
        if (v20)
        {
          v48 = (void *)v20;
          v49 = fileHash;
          v21 = self->_fileHash;
          uint64_t v22 = [(HDAttachment *)v6 fileHash];
          if (![(NSString *)v21 isEqualToString:v22])
          {

            if (v52 == v16)
            {

              goto LABEL_32;
            }
            goto LABEL_30;
          }
          v47 = v22;
          unint64_t v23 = self->_size;
          if (v23 != [(HDAttachment *)v6 size])
          {
            char v14 = 0;
            uint64_t v24 = v51;
LABEL_46:

LABEL_47:
            goto LABEL_48;
          }
LABEL_23:
          creationDate = self->_creationDate;
          uint64_t v27 = [(HDAttachment *)v6 creationDate];
          id v28 = creationDate;
          id v29 = (void *)v27;
          if ([(NSDate *)v28 isEqualToDate:v27])
          {
            metadata = self->_metadata;
            [(HDAttachment *)v6 metadata];
            v46 = v45 = v29;
            v44 = metadata;
            if (metadata != v46)
            {
              uint64_t v31 = [(HDAttachment *)v6 metadata];
              if (!v31)
              {
                char v14 = 0;
LABEL_44:
                uint64_t v24 = v51;

LABEL_45:
                uint64_t v22 = v47;
                if (v49 != v24) {
                  goto LABEL_46;
                }
LABEL_48:

                if (v52 != v16)
                {
                }
LABEL_51:
                v13 = v53;
                if (name != v10) {
                  goto LABEL_52;
                }
LABEL_53:

                goto LABEL_54;
              }
              v43 = (void *)v31;
              v32 = self->_metadata;
              metadata = [(HDAttachment *)v6 metadata];
              if (([(NSDictionary *)v32 isEqual:metadata] & 1) == 0)
              {

                char v14 = 0;
LABEL_59:
                uint64_t v24 = v51;
                if (v49 == v51) {
                  goto LABEL_48;
                }

                goto LABEL_47;
              }
            }
            encryptionKey = self->_encryptionKey;
            uint64_t v34 = [(HDAttachment *)v6 encryptionKey];
            v35 = encryptionKey;
            char v14 = encryptionKey == (HDEncryptedArchiveSymmetricKey *)v34;
            if (!v14)
            {
              v42 = (HDEncryptedArchiveSymmetricKey *)v34;
              uint64_t v36 = [(HDAttachment *)v6 encryptionKey];
              if (v36)
              {
                v41 = metadata;
                v37 = self->_encryptionKey;
                v38 = (void *)v36;
                v39 = [(HDAttachment *)v6 encryptionKey];
                char v14 = [(HDEncryptedArchiveSymmetricKey *)v37 isEqual:v39];

                if (v44 == v46)
                {
                }
                else
                {
                }
                goto LABEL_59;
              }
              v35 = v42;
            }

            if (v44 != v46)
            {

              goto LABEL_44;
            }
          }
          else
          {

            char v14 = 0;
          }
          uint64_t v24 = v51;
          goto LABEL_45;
        }
      }
      char v14 = 0;
      uint64_t v24 = v51;
      goto LABEL_48;
    }
    char v14 = 0;
  }
LABEL_55:

  return v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  identifier = self->_identifier;
  id v5 = a3;
  [v5 encodeObject:identifier forKey:@"Identifier"];
  [v5 encodeObject:self->_name forKey:@"Name"];
  [v5 encodeObject:self->_type forKey:@"Type"];
  [v5 encodeObject:self->_fileHash forKey:@"Hash"];
  [v5 encodeInteger:self->_size forKey:@"Size"];
  [v5 encodeObject:self->_creationDate forKey:@"CreationDate"];
  [v5 encodeObject:self->_metadata forKey:@"Metadata"];
  [v5 encodeObject:self->_encryptionKey forKey:@"EncryptionKey"];
}

- (HDAttachment)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Identifier"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Name"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Type"];
  v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Hash"];
  uint64_t v9 = [v4 decodeIntegerForKey:@"Size"];
  v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CreationDate"];
  uint64_t v11 = objc_msgSend(MEMORY[0x1E4F1C9E8], "hk_secureAttachmentCodingClasses");
  v12 = [v4 decodeObjectOfClasses:v11 forKey:@"Metadata"];

  v13 = 0;
  if (v5 && v6 && v7 && v8 && v9 >= 1 && v10)
  {
    char v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"EncryptionKey"];
    self = [(HDAttachment *)self initWithIdentifier:v5 name:v6 type:v7 hash:v8 size:v9 creationDate:v10 metadata:v12 encryptionKey:v14];

    v13 = self;
  }

  return v13;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)type
{
  return self->_type;
}

- (NSString)fileHash
{
  return self->_fileHash;
}

- (unint64_t)size
{
  return self->_size;
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (NSDictionary)metadata
{
  return self->_metadata;
}

- (HDEncryptedArchiveSymmetricKey)encryptionKey
{
  return self->_encryptionKey;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_encryptionKey, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_fileHash, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_name, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
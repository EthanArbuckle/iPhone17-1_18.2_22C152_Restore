@interface AVTStickerRecord
+ (BOOL)supportsSecureCoding;
+ (id)matchingIdentifierTest:(id)a3;
- (AVTStickerRecord)initWithCoder:(id)a3;
- (AVTStickerRecord)initWithIdentifier:(id)a3 avatarRecordIdentifier:(id)a4 stickerConfigurationIdentifier:(id)a5 frequencySum:(id)a6 serializationVersion:(id)a7;
- (BOOL)isEqual:(id)a3;
- (NSNumber)frequencySum;
- (NSNumber)serializationVersion;
- (NSString)avatarRecordIdentifier;
- (NSString)description;
- (NSString)identifier;
- (NSString)stickerConfigurationIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation AVTStickerRecord

+ (id)matchingIdentifierTest:(id)a3
{
  id v3 = a3;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __43__AVTStickerRecord_matchingIdentifierTest___block_invoke;
  v7[3] = &unk_2647C3DE8;
  id v8 = v3;
  id v4 = v3;
  v5 = (void *)MEMORY[0x22A660070](v7);

  return v5;
}

uint64_t __43__AVTStickerRecord_matchingIdentifierTest___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 identifier];
  uint64_t v4 = [v3 isEqual:*(void *)(a1 + 32)];

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AVTStickerRecord)initWithIdentifier:(id)a3 avatarRecordIdentifier:(id)a4 stickerConfigurationIdentifier:(id)a5 frequencySum:(id)a6 serializationVersion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  v15 = (NSNumber *)a6;
  v16 = (NSNumber *)a7;
  v25.receiver = self;
  v25.super_class = (Class)AVTStickerRecord;
  v17 = [(AVTStickerRecord *)&v25 init];
  if (v17)
  {
    uint64_t v18 = [v12 copy];
    identifier = v17->_identifier;
    v17->_identifier = (NSString *)v18;

    uint64_t v20 = [v13 copy];
    avatarRecordIdentifier = v17->_avatarRecordIdentifier;
    v17->_avatarRecordIdentifier = (NSString *)v20;

    uint64_t v22 = [v14 copy];
    stickerConfigurationIdentifier = v17->_stickerConfigurationIdentifier;
    v17->_stickerConfigurationIdentifier = (NSString *)v22;

    v17->_frequencySum = v15;
    v17->_serializationVersion = v16;
  }

  return v17;
}

- (AVTStickerRecord)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"avatarRecordIdentifier"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"stickerConfigurationIdentifier"];
  id v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"frequencySum"];
  v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"serializationVersion"];

  v10 = [(AVTStickerRecord *)self initWithIdentifier:v5 avatarRecordIdentifier:v6 stickerConfigurationIdentifier:v7 frequencySum:v8 serializationVersion:v9];
  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(AVTStickerRecord *)self identifier];
  [v4 encodeObject:v5 forKey:@"identifier"];

  v6 = [(AVTStickerRecord *)self avatarRecordIdentifier];
  [v4 encodeObject:v6 forKey:@"avatarRecordIdentifier"];

  v7 = [(AVTStickerRecord *)self stickerConfigurationIdentifier];
  [v4 encodeObject:v7 forKey:@"stickerConfigurationIdentifier"];

  id v8 = [(AVTStickerRecord *)self frequencySum];
  [v4 encodeObject:v8 forKey:@"frequencySum"];

  id v9 = [(AVTStickerRecord *)self serializationVersion];
  [v4 encodeObject:v9 forKey:@"serializationVersion"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [AVTStickerRecord alloc];
  v5 = [(AVTStickerRecord *)self identifier];
  v6 = [(AVTStickerRecord *)self avatarRecordIdentifier];
  v7 = [(AVTStickerRecord *)self stickerConfigurationIdentifier];
  id v8 = [(AVTStickerRecord *)self frequencySum];
  id v9 = [(AVTStickerRecord *)self serializationVersion];
  v10 = [(AVTStickerRecord *)v4 initWithIdentifier:v5 avatarRecordIdentifier:v6 stickerConfigurationIdentifier:v7 frequencySum:v8 serializationVersion:v9];

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  v5 = (AVTStickerRecord *)a3;
  if (v5 != self)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v6 = [(AVTStickerRecord *)self identifier];
      if (v6
        || ([(AVTStickerRecord *)v5 identifier], (id v3 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        v7 = [(AVTStickerRecord *)self identifier];
        id v8 = [(AVTStickerRecord *)v5 identifier];
        int v9 = [v7 isEqual:v8];

        if (v6)
        {

          if (!v9) {
            goto LABEL_19;
          }
        }
        else
        {

          if ((v9 & 1) == 0) {
            goto LABEL_19;
          }
        }
      }
      v11 = [(AVTStickerRecord *)self avatarRecordIdentifier];
      if (!v11)
      {
        id v3 = [(AVTStickerRecord *)v5 avatarRecordIdentifier];
        if (!v3)
        {
LABEL_14:
          v15 = [(AVTStickerRecord *)self stickerConfigurationIdentifier];
          if (v15
            || ([(AVTStickerRecord *)v5 stickerConfigurationIdentifier],
                (id v3 = objc_claimAutoreleasedReturnValue()) != 0))
          {
            v16 = [(AVTStickerRecord *)self stickerConfigurationIdentifier];
            v17 = [(AVTStickerRecord *)v5 stickerConfigurationIdentifier];
            char v10 = [v16 isEqual:v17];

            if (v15)
            {
LABEL_23:

              goto LABEL_20;
            }
          }
          else
          {
            char v10 = 1;
          }

          goto LABEL_23;
        }
      }
      id v12 = [(AVTStickerRecord *)self avatarRecordIdentifier];
      id v13 = [(AVTStickerRecord *)v5 avatarRecordIdentifier];
      int v14 = [v12 isEqual:v13];

      if (v11)
      {

        if (v14) {
          goto LABEL_14;
        }
      }
      else
      {

        if (v14) {
          goto LABEL_14;
        }
      }
    }
LABEL_19:
    char v10 = 0;
    goto LABEL_20;
  }
  char v10 = 1;
LABEL_20:

  return v10;
}

- (unint64_t)hash
{
  id v3 = [(AVTStickerRecord *)self identifier];
  uint64_t v4 = [v3 hash];
  v5 = [(AVTStickerRecord *)self identifier];
  *((void *)&v7 + 1) = v4;
  *(void *)&long long v7 = [v5 hash];
  uint64_t v6 = v7 >> 43;
  id v8 = [(AVTStickerRecord *)self avatarRecordIdentifier];
  uint64_t v9 = [v8 hash];
  char v10 = [(AVTStickerRecord *)self avatarRecordIdentifier];
  *((void *)&v7 + 1) = v9;
  *(void *)&long long v7 = [v10 hash];
  v11 = [(AVTStickerRecord *)self stickerConfigurationIdentifier];
  unint64_t v12 = (v7 >> 32) ^ v6 ^ [v11 hash];

  return v12;
}

- (NSString)description
{
  v13.receiver = self;
  v13.super_class = (Class)AVTStickerRecord;
  id v3 = [(AVTStickerRecord *)&v13 description];
  uint64_t v4 = (void *)[v3 mutableCopy];

  v5 = [(AVTStickerRecord *)self identifier];
  uint64_t v6 = [(AVTStickerRecord *)self avatarRecordIdentifier];
  long long v7 = [(AVTStickerRecord *)self stickerConfigurationIdentifier];
  id v8 = [(AVTStickerRecord *)self frequencySum];
  uint64_t v9 = [v8 unsignedIntegerValue];
  char v10 = [(AVTStickerRecord *)self serializationVersion];
  [v4 appendFormat:@" identifer:%@ ari:%@ sci:%@ frequencySum:%ld version:%ld", v5, v6, v7, v9, objc_msgSend(v10, "integerValue")];

  v11 = (void *)[v4 copy];

  return (NSString *)v11;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)avatarRecordIdentifier
{
  return self->_avatarRecordIdentifier;
}

- (NSString)stickerConfigurationIdentifier
{
  return self->_stickerConfigurationIdentifier;
}

- (NSNumber)frequencySum
{
  return self->_frequencySum;
}

- (NSNumber)serializationVersion
{
  return self->_serializationVersion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stickerConfigurationIdentifier, 0);
  objc_storeStrong((id *)&self->_avatarRecordIdentifier, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
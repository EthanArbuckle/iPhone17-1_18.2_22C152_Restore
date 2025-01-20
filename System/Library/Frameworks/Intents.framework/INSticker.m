@interface INSticker
+ (BOOL)supportsSecureCoding;
+ (id)_intents_decodeWithJSONDecoder:(id)a3 codableDescription:(id)a4 from:(id)a5;
- (BOOL)isEqual:(id)a3;
- (INSticker)init;
- (INSticker)initWithCoder:(id)a3;
- (INSticker)initWithType:(int64_t)a3 avatarDescriptor:(id)a4 appBundleID:(id)a5 stickerDescription:(id)a6 emoji:(id)a7;
- (INSticker)initWithType:(int64_t)a3 emoji:(id)a4;
- (NSString)appBundleID;
- (NSString)avatarDescriptor;
- (NSString)description;
- (NSString)emoji;
- (NSString)stickerDescription;
- (id)_dictionaryRepresentation;
- (id)_intents_encodeWithJSONEncoder:(id)a3 codableDescription:(id)a4;
- (id)descriptionAtIndent:(unint64_t)a3;
- (int64_t)type;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation INSticker

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stickerDescription, 0);
  objc_storeStrong((id *)&self->_appBundleID, 0);
  objc_storeStrong((id *)&self->_avatarDescriptor, 0);

  objc_storeStrong((id *)&self->_emoji, 0);
}

- (NSString)stickerDescription
{
  return self->_stickerDescription;
}

- (NSString)appBundleID
{
  return self->_appBundleID;
}

- (NSString)avatarDescriptor
{
  return self->_avatarDescriptor;
}

- (NSString)emoji
{
  return self->_emoji;
}

- (int64_t)type
{
  return self->_type;
}

- (id)_dictionaryRepresentation
{
  v15[5] = *MEMORY[0x1E4F143B8];
  v14[0] = @"type";
  v3 = [NSNumber numberWithInteger:self->_type];
  v15[0] = v3;
  v14[1] = @"avatarDescriptor";
  avatarDescriptor = self->_avatarDescriptor;
  v5 = avatarDescriptor;
  if (!avatarDescriptor)
  {
    v5 = [MEMORY[0x1E4F1CA98] null];
  }
  v15[1] = v5;
  v14[2] = @"appBundleID";
  appBundleID = self->_appBundleID;
  v7 = appBundleID;
  if (!appBundleID)
  {
    v7 = [MEMORY[0x1E4F1CA98] null];
  }
  v15[2] = v7;
  v14[3] = @"stickerDescription";
  stickerDescription = self->_stickerDescription;
  v9 = stickerDescription;
  if (!stickerDescription)
  {
    v9 = [MEMORY[0x1E4F1CA98] null];
  }
  v15[3] = v9;
  v14[4] = @"emoji";
  emoji = self->_emoji;
  v11 = emoji;
  if (!emoji)
  {
    v11 = [MEMORY[0x1E4F1CA98] null];
  }
  v15[4] = v11;
  v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:5];
  if (emoji)
  {
    if (stickerDescription) {
      goto LABEL_11;
    }
  }
  else
  {

    if (stickerDescription)
    {
LABEL_11:
      if (appBundleID) {
        goto LABEL_12;
      }
LABEL_18:

      if (avatarDescriptor) {
        goto LABEL_13;
      }
      goto LABEL_19;
    }
  }

  if (!appBundleID) {
    goto LABEL_18;
  }
LABEL_12:
  if (avatarDescriptor) {
    goto LABEL_13;
  }
LABEL_19:

LABEL_13:

  return v12;
}

- (id)descriptionAtIndent:(unint64_t)a3
{
  v5 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)INSticker;
  v6 = [(INSticker *)&v11 description];
  v7 = [(INSticker *)self _dictionaryRepresentation];
  v8 = [v7 descriptionAtIndent:a3];
  v9 = [v5 stringWithFormat:@"%@ %@", v6, v8];

  return v9;
}

- (NSString)description
{
  return (NSString *)[(INSticker *)self descriptionAtIndent:0];
}

- (id)_intents_encodeWithJSONEncoder:(id)a3 codableDescription:(id)a4
{
  v5 = (void *)MEMORY[0x1E4F1CA60];
  id v6 = a3;
  v7 = [v5 dictionary];
  v8 = INStickerTypeGetName(self->_type);
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v8, @"type");

  v9 = [v6 encodeObject:self->_avatarDescriptor];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v9, @"avatarDescriptor");

  v10 = [v6 encodeObject:self->_appBundleID];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v10, @"appBundleID");

  objc_super v11 = [v6 encodeObject:self->_stickerDescription];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v11, @"stickerDescription");

  v12 = [v6 encodeObject:self->_emoji];

  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v12, @"emoji");

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t type = self->_type;
  id v5 = a3;
  [v5 encodeInteger:type forKey:@"type"];
  [v5 encodeObject:self->_avatarDescriptor forKey:@"avatarDescriptor"];
  [v5 encodeObject:self->_appBundleID forKey:@"appBundleID"];
  [v5 encodeObject:self->_stickerDescription forKey:@"stickerDescription"];
  [v5 encodeObject:self->_emoji forKey:@"emoji"];
}

- (INSticker)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeIntegerForKey:@"type"];
  id v6 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v7 = objc_opt_class();
  v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
  v9 = [v4 decodeObjectOfClasses:v8 forKey:@"avatarDescriptor"];

  v10 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v11 = objc_opt_class();
  v12 = objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
  v13 = [v4 decodeObjectOfClasses:v12 forKey:@"appBundleID"];

  v14 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v15 = objc_opt_class();
  v16 = objc_msgSend(v14, "setWithObjects:", v15, objc_opt_class(), 0);
  v17 = [v4 decodeObjectOfClasses:v16 forKey:@"stickerDescription"];

  v18 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v19 = objc_opt_class();
  v20 = objc_msgSend(v18, "setWithObjects:", v19, objc_opt_class(), 0);
  v21 = [v4 decodeObjectOfClasses:v20 forKey:@"emoji"];

  v22 = [(INSticker *)self initWithType:v5 avatarDescriptor:v9 appBundleID:v13 stickerDescription:v17 emoji:v21];
  return v22;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (INSticker *)a3;
  if (v4 == self)
  {
    BOOL v10 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = v4;
      BOOL v10 = 0;
      if (self->_type == v5->_type)
      {
        avatarDescriptor = self->_avatarDescriptor;
        if (avatarDescriptor == v5->_avatarDescriptor
          || -[NSString isEqual:](avatarDescriptor, "isEqual:"))
        {
          appBundleID = self->_appBundleID;
          if (appBundleID == v5->_appBundleID || -[NSString isEqual:](appBundleID, "isEqual:"))
          {
            stickerDescription = self->_stickerDescription;
            if (stickerDescription == v5->_stickerDescription
              || -[NSString isEqual:](stickerDescription, "isEqual:"))
            {
              emoji = self->_emoji;
              if (emoji == v5->_emoji || -[NSString isEqual:](emoji, "isEqual:")) {
                BOOL v10 = 1;
              }
            }
          }
        }
      }
    }
    else
    {
      BOOL v10 = 0;
    }
  }

  return v10;
}

- (unint64_t)hash
{
  v3 = [NSNumber numberWithInteger:self->_type];
  uint64_t v4 = [v3 hash];
  NSUInteger v5 = [(NSString *)self->_avatarDescriptor hash];
  NSUInteger v6 = v5 ^ [(NSString *)self->_appBundleID hash];
  NSUInteger v7 = v6 ^ [(NSString *)self->_stickerDescription hash] ^ v4;
  NSUInteger v8 = v7 ^ [(NSString *)self->_emoji hash];

  return v8;
}

- (INSticker)initWithType:(int64_t)a3 avatarDescriptor:(id)a4 appBundleID:(id)a5 stickerDescription:(id)a6 emoji:(id)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  v27.receiver = self;
  v27.super_class = (Class)INSticker;
  v16 = [(INSticker *)&v27 init];
  v17 = v16;
  if (v16)
  {
    v16->_int64_t type = a3;
    uint64_t v18 = [v12 copy];
    avatarDescriptor = v17->_avatarDescriptor;
    v17->_avatarDescriptor = (NSString *)v18;

    uint64_t v20 = [v13 copy];
    appBundleID = v17->_appBundleID;
    v17->_appBundleID = (NSString *)v20;

    uint64_t v22 = [v14 copy];
    stickerDescription = v17->_stickerDescription;
    v17->_stickerDescription = (NSString *)v22;

    uint64_t v24 = [v15 copy];
    emoji = v17->_emoji;
    v17->_emoji = (NSString *)v24;
  }
  return v17;
}

- (INSticker)initWithType:(int64_t)a3 emoji:(id)a4
{
  id v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)INSticker;
  NSUInteger v7 = [(INSticker *)&v12 init];
  NSUInteger v8 = v7;
  if (v7)
  {
    v7->_int64_t type = a3;
    uint64_t v9 = [v6 copy];
    emoji = v8->_emoji;
    v8->_emoji = (NSString *)v9;
  }
  return v8;
}

- (INSticker)init
{
  v3.receiver = self;
  v3.super_class = (Class)INSticker;
  return [(INSticker *)&v3 init];
}

+ (id)_intents_decodeWithJSONDecoder:(id)a3 codableDescription:(id)a4 from:(id)a5
{
  id v6 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    NSUInteger v7 = [v6 objectForKeyedSubscript:@"type"];
    uint64_t v8 = INStickerTypeWithString(v7);

    uint64_t v9 = [v6 objectForKeyedSubscript:@"avatarDescriptor"];
    BOOL v10 = [v6 objectForKeyedSubscript:@"appBundleID"];
    uint64_t v11 = [v6 objectForKeyedSubscript:@"stickerDescription"];
    objc_super v12 = [v6 objectForKeyedSubscript:@"emoji"];
    id v13 = (void *)[objc_alloc((Class)a1) initWithType:v8 avatarDescriptor:v9 appBundleID:v10 stickerDescription:v11 emoji:v12];
  }
  else
  {
    id v13 = 0;
  }

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
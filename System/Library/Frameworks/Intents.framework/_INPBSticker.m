@interface _INPBSticker
+ (BOOL)supportsSecureCoding;
- (BOOL)hasAppBundleID;
- (BOOL)hasAvatarDescriptor;
- (BOOL)hasEmoji;
- (BOOL)hasStickerDescription;
- (BOOL)hasType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)appBundleID;
- (NSString)avatarDescriptor;
- (NSString)emoji;
- (NSString)stickerDescription;
- (_INPBSticker)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (id)typeAsString:(int)a3;
- (int)StringAsType:(id)a3;
- (int)type;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setAppBundleID:(id)a3;
- (void)setAvatarDescriptor:(id)a3;
- (void)setEmoji:(id)a3;
- (void)setHasType:(BOOL)a3;
- (void)setStickerDescription:(id)a3;
- (void)setType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBSticker

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stickerDescription, 0);
  objc_storeStrong((id *)&self->_emoji, 0);
  objc_storeStrong((id *)&self->_avatarDescriptor, 0);

  objc_storeStrong((id *)&self->_appBundleID, 0);
}

- (int)type
{
  return self->_type;
}

- (NSString)stickerDescription
{
  return self->_stickerDescription;
}

- (NSString)emoji
{
  return self->_emoji;
}

- (NSString)avatarDescriptor
{
  return self->_avatarDescriptor;
}

- (NSString)appBundleID
{
  return self->_appBundleID;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (self->_appBundleID)
  {
    v4 = [(_INPBSticker *)self appBundleID];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"appBundleID"];
  }
  if (self->_avatarDescriptor)
  {
    v6 = [(_INPBSticker *)self avatarDescriptor];
    v7 = (void *)[v6 copy];
    [v3 setObject:v7 forKeyedSubscript:@"avatarDescriptor"];
  }
  if (self->_emoji)
  {
    v8 = [(_INPBSticker *)self emoji];
    v9 = (void *)[v8 copy];
    [v3 setObject:v9 forKeyedSubscript:@"emoji"];
  }
  if (self->_stickerDescription)
  {
    v10 = [(_INPBSticker *)self stickerDescription];
    v11 = (void *)[v10 copy];
    [v3 setObject:v11 forKeyedSubscript:@"stickerDescription"];
  }
  if ([(_INPBSticker *)self hasType])
  {
    uint64_t v12 = [(_INPBSticker *)self type];
    if (v12 >= 7)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v12);
      v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = off_1E5520FE0[v12];
    }
    [v3 setObject:v13 forKeyedSubscript:@"type"];
  }

  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_appBundleID hash];
  NSUInteger v4 = [(NSString *)self->_avatarDescriptor hash];
  NSUInteger v5 = [(NSString *)self->_emoji hash];
  NSUInteger v6 = [(NSString *)self->_stickerDescription hash];
  if ([(_INPBSticker *)self hasType]) {
    uint64_t v7 = 2654435761 * self->_type;
  }
  else {
    uint64_t v7 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_22;
  }
  NSUInteger v5 = [(_INPBSticker *)self appBundleID];
  NSUInteger v6 = [v4 appBundleID];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_21;
  }
  uint64_t v7 = [(_INPBSticker *)self appBundleID];
  if (v7)
  {
    v8 = (void *)v7;
    v9 = [(_INPBSticker *)self appBundleID];
    v10 = [v4 appBundleID];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_22;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_INPBSticker *)self avatarDescriptor];
  NSUInteger v6 = [v4 avatarDescriptor];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_21;
  }
  uint64_t v12 = [(_INPBSticker *)self avatarDescriptor];
  if (v12)
  {
    v13 = (void *)v12;
    v14 = [(_INPBSticker *)self avatarDescriptor];
    v15 = [v4 avatarDescriptor];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_22;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_INPBSticker *)self emoji];
  NSUInteger v6 = [v4 emoji];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_21;
  }
  uint64_t v17 = [(_INPBSticker *)self emoji];
  if (v17)
  {
    v18 = (void *)v17;
    v19 = [(_INPBSticker *)self emoji];
    v20 = [v4 emoji];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_22;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_INPBSticker *)self stickerDescription];
  NSUInteger v6 = [v4 stickerDescription];
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_21:

    goto LABEL_22;
  }
  uint64_t v22 = [(_INPBSticker *)self stickerDescription];
  if (v22)
  {
    v23 = (void *)v22;
    v24 = [(_INPBSticker *)self stickerDescription];
    v25 = [v4 stickerDescription];
    int v26 = [v24 isEqual:v25];

    if (!v26) {
      goto LABEL_22;
    }
  }
  else
  {
  }
  int v29 = [(_INPBSticker *)self hasType];
  if (v29 == [v4 hasType])
  {
    if (![(_INPBSticker *)self hasType]
      || ![v4 hasType]
      || (int type = self->_type, type == [v4 type]))
    {
      BOOL v27 = 1;
      goto LABEL_23;
    }
  }
LABEL_22:
  BOOL v27 = 0;
LABEL_23:

  return v27;
}

- (id)copyWithZone:(_NSZone *)a3
{
  NSUInteger v5 = [+[_INPBSticker allocWithZone:](_INPBSticker, "allocWithZone:") init];
  NSUInteger v6 = (void *)[(NSString *)self->_appBundleID copyWithZone:a3];
  [(_INPBSticker *)v5 setAppBundleID:v6];

  uint64_t v7 = (void *)[(NSString *)self->_avatarDescriptor copyWithZone:a3];
  [(_INPBSticker *)v5 setAvatarDescriptor:v7];

  v8 = (void *)[(NSString *)self->_emoji copyWithZone:a3];
  [(_INPBSticker *)v5 setEmoji:v8];

  v9 = (void *)[(NSString *)self->_stickerDescription copyWithZone:a3];
  [(_INPBSticker *)v5 setStickerDescription:v9];

  if ([(_INPBSticker *)self hasType]) {
    [(_INPBSticker *)v5 setType:[(_INPBSticker *)self type]];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBSticker *)self data];
  NSUInteger v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBSticker)initWithCoder:(id)a3
{
  id v4 = a3;
  NSUInteger v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBSticker *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBSticker *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBSticker *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  id v4 = [(_INPBSticker *)self appBundleID];

  if (v4) {
    PBDataWriterWriteStringField();
  }
  NSUInteger v5 = [(_INPBSticker *)self avatarDescriptor];

  if (v5) {
    PBDataWriterWriteStringField();
  }
  id v6 = [(_INPBSticker *)self emoji];

  if (v6) {
    PBDataWriterWriteStringField();
  }
  uint64_t v7 = [(_INPBSticker *)self stickerDescription];

  if (v7) {
    PBDataWriterWriteStringField();
  }
  if ([(_INPBSticker *)self hasType]) {
    PBDataWriterWriteInt32Field();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBStickerReadFrom(self, (uint64_t)a3);
}

- (int)StringAsType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"EMOJI"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"MEMOJI"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"APP_BASED"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"GENERATED"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"GENERIC"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"CUSTOM"])
  {
    int v4 = 6;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)typeAsString:(int)a3
{
  if (a3 >= 7)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E5520FE0[a3];
  }

  return v3;
}

- (void)setHasType:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasType
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setType:(int)a3
{
  char has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(unsigned char *)&self->_char has = has & 0xFE;
  }
  else
  {
    *(unsigned char *)&self->_char has = has | 1;
    self->_int type = a3;
  }
}

- (BOOL)hasStickerDescription
{
  return self->_stickerDescription != 0;
}

- (void)setStickerDescription:(id)a3
{
  int v4 = (NSString *)[a3 copy];
  stickerDescription = self->_stickerDescription;
  self->_stickerDescription = v4;

  MEMORY[0x1F41817F8](v4, stickerDescription);
}

- (BOOL)hasEmoji
{
  return self->_emoji != 0;
}

- (void)setEmoji:(id)a3
{
  int v4 = (NSString *)[a3 copy];
  emoji = self->_emoji;
  self->_emoji = v4;

  MEMORY[0x1F41817F8](v4, emoji);
}

- (BOOL)hasAvatarDescriptor
{
  return self->_avatarDescriptor != 0;
}

- (void)setAvatarDescriptor:(id)a3
{
  int v4 = (NSString *)[a3 copy];
  avatarDescriptor = self->_avatarDescriptor;
  self->_avatarDescriptor = v4;

  MEMORY[0x1F41817F8](v4, avatarDescriptor);
}

- (BOOL)hasAppBundleID
{
  return self->_appBundleID != 0;
}

- (void)setAppBundleID:(id)a3
{
  int v4 = (NSString *)[a3 copy];
  appBundleID = self->_appBundleID;
  self->_appBundleID = v4;

  MEMORY[0x1F41817F8](v4, appBundleID);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
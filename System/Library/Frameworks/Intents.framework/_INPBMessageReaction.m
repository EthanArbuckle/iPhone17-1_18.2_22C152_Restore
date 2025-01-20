@interface _INPBMessageReaction
+ (BOOL)supportsSecureCoding;
- (BOOL)hasEmoji;
- (BOOL)hasReactionDescription;
- (BOOL)hasReactionType;
- (BOOL)hasSticker;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)emoji;
- (NSString)reactionDescription;
- (_INPBMessageReaction)initWithCoder:(id)a3;
- (_INPBSticker)sticker;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (id)reactionTypeAsString:(int)a3;
- (int)StringAsReactionType:(id)a3;
- (int)reactionType;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setEmoji:(id)a3;
- (void)setHasReactionType:(BOOL)a3;
- (void)setReactionDescription:(id)a3;
- (void)setReactionType:(int)a3;
- (void)setSticker:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBMessageReaction

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sticker, 0);
  objc_storeStrong((id *)&self->_reactionDescription, 0);

  objc_storeStrong((id *)&self->_emoji, 0);
}

- (_INPBSticker)sticker
{
  return self->_sticker;
}

- (int)reactionType
{
  return self->_reactionType;
}

- (NSString)reactionDescription
{
  return self->_reactionDescription;
}

- (NSString)emoji
{
  return self->_emoji;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (self->_emoji)
  {
    v4 = [(_INPBMessageReaction *)self emoji];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"emoji"];
  }
  if (self->_reactionDescription)
  {
    v6 = [(_INPBMessageReaction *)self reactionDescription];
    v7 = (void *)[v6 copy];
    [v3 setObject:v7 forKeyedSubscript:@"reactionDescription"];
  }
  if ([(_INPBMessageReaction *)self hasReactionType])
  {
    uint64_t v8 = [(_INPBMessageReaction *)self reactionType];
    if ((v8 - 1) >= 0xB)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v8);
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = off_1E551A9C8[(v8 - 1)];
    }
    [v3 setObject:v9 forKeyedSubscript:@"reactionType"];
  }
  v10 = [(_INPBMessageReaction *)self sticker];
  v11 = [v10 dictionaryRepresentation];
  [v3 setObject:v11 forKeyedSubscript:@"sticker"];

  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_emoji hash];
  NSUInteger v4 = [(NSString *)self->_reactionDescription hash];
  if ([(_INPBMessageReaction *)self hasReactionType]) {
    uint64_t v5 = 2654435761 * self->_reactionType;
  }
  else {
    uint64_t v5 = 0;
  }
  return v4 ^ v3 ^ v5 ^ [(_INPBSticker *)self->_sticker hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_21;
  }
  uint64_t v5 = [(_INPBMessageReaction *)self emoji];
  v6 = [v4 emoji];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_20;
  }
  uint64_t v7 = [(_INPBMessageReaction *)self emoji];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    v9 = [(_INPBMessageReaction *)self emoji];
    v10 = [v4 emoji];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_21;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_INPBMessageReaction *)self reactionDescription];
  v6 = [v4 reactionDescription];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_20;
  }
  uint64_t v12 = [(_INPBMessageReaction *)self reactionDescription];
  if (v12)
  {
    v13 = (void *)v12;
    v14 = [(_INPBMessageReaction *)self reactionDescription];
    v15 = [v4 reactionDescription];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_21;
    }
  }
  else
  {
  }
  int v17 = [(_INPBMessageReaction *)self hasReactionType];
  if (v17 != [v4 hasReactionType]) {
    goto LABEL_21;
  }
  if ([(_INPBMessageReaction *)self hasReactionType])
  {
    if ([v4 hasReactionType])
    {
      int reactionType = self->_reactionType;
      if (reactionType != [v4 reactionType]) {
        goto LABEL_21;
      }
    }
  }
  uint64_t v5 = [(_INPBMessageReaction *)self sticker];
  v6 = [v4 sticker];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v19 = [(_INPBMessageReaction *)self sticker];
    if (!v19)
    {

LABEL_24:
      BOOL v24 = 1;
      goto LABEL_22;
    }
    v20 = (void *)v19;
    v21 = [(_INPBMessageReaction *)self sticker];
    v22 = [v4 sticker];
    char v23 = [v21 isEqual:v22];

    if (v23) {
      goto LABEL_24;
    }
  }
  else
  {
LABEL_20:
  }
LABEL_21:
  BOOL v24 = 0;
LABEL_22:

  return v24;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = [+[_INPBMessageReaction allocWithZone:](_INPBMessageReaction, "allocWithZone:") init];
  v6 = (void *)[(NSString *)self->_emoji copyWithZone:a3];
  [(_INPBMessageReaction *)v5 setEmoji:v6];

  uint64_t v7 = (void *)[(NSString *)self->_reactionDescription copyWithZone:a3];
  [(_INPBMessageReaction *)v5 setReactionDescription:v7];

  if ([(_INPBMessageReaction *)self hasReactionType]) {
    [(_INPBMessageReaction *)v5 setReactionType:[(_INPBMessageReaction *)self reactionType]];
  }
  id v8 = [(_INPBSticker *)self->_sticker copyWithZone:a3];
  [(_INPBMessageReaction *)v5 setSticker:v8];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBMessageReaction *)self data];
  uint64_t v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBMessageReaction)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBMessageReaction *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        id v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBMessageReaction *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBMessageReaction *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  id v9 = a3;
  id v4 = [(_INPBMessageReaction *)self emoji];

  if (v4) {
    PBDataWriterWriteStringField();
  }
  uint64_t v5 = [(_INPBMessageReaction *)self reactionDescription];

  if (v5) {
    PBDataWriterWriteStringField();
  }
  if ([(_INPBMessageReaction *)self hasReactionType]) {
    PBDataWriterWriteInt32Field();
  }
  id v6 = [(_INPBMessageReaction *)self sticker];

  uint64_t v7 = v9;
  if (v6)
  {
    id v8 = [(_INPBMessageReaction *)self sticker];
    PBDataWriterWriteSubmessage();

    uint64_t v7 = v9;
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBMessageReactionReadFrom(self, (uint64_t)a3);
}

- (BOOL)hasSticker
{
  return self->_sticker != 0;
}

- (void)setSticker:(id)a3
{
}

- (int)StringAsReactionType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"TAPBACK_LIKED_REACTION"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"TAPBACK_DISLIKED_REACTION"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"TAPBACK_EMPHASIZED_REACTION"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"TAPBACK_LOVED_REACTION"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"TAPBACK_QUESTIONED_REACTION"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"TAPBACK_LAUGHED_REACTION"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"DROPPED_STICKER"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"TAPBACK_STICKER"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"TAPBACK_GENERATED_EMOJI"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"EMOJI"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"GENERIC"])
  {
    int v4 = 11;
  }
  else
  {
    int v4 = 1;
  }

  return v4;
}

- (id)reactionTypeAsString:(int)a3
{
  if ((a3 - 1) >= 0xB)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E551A9C8[a3 - 1];
  }

  return v3;
}

- (void)setHasReactionType:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasReactionType
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setReactionType:(int)a3
{
  char has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(unsigned char *)&self->_char has = has & 0xFE;
  }
  else
  {
    *(unsigned char *)&self->_char has = has | 1;
    self->_int reactionType = a3;
  }
}

- (BOOL)hasReactionDescription
{
  return self->_reactionDescription != 0;
}

- (void)setReactionDescription:(id)a3
{
  int v4 = (NSString *)[a3 copy];
  reactionDescription = self->_reactionDescription;
  self->_reactionDescription = v4;

  MEMORY[0x1F41817F8](v4, reactionDescription);
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

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
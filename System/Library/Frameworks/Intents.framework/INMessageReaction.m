@interface INMessageReaction
+ (BOOL)supportsSecureCoding;
+ (id)_intents_decodeWithJSONDecoder:(id)a3 codableDescription:(id)a4 from:(id)a5;
- (BOOL)isEqual:(id)a3;
- (INMessageReaction)init;
- (INMessageReaction)initWithCoder:(id)a3;
- (INMessageReaction)initWithReactionType:(int64_t)a3 reactionDescription:(id)a4 emoji:(id)a5;
- (INMessageReaction)initWithReactionType:(int64_t)a3 reactionDescription:(id)a4 emoji:(id)a5 sticker:(id)a6;
- (INSticker)sticker;
- (NSString)description;
- (NSString)emoji;
- (NSString)reactionDescription;
- (id)_dictionaryRepresentation;
- (id)_intents_encodeWithJSONEncoder:(id)a3 codableDescription:(id)a4;
- (id)descriptionAtIndent:(unint64_t)a3;
- (int64_t)reactionType;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation INMessageReaction

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sticker, 0);
  objc_storeStrong((id *)&self->_emoji, 0);

  objc_storeStrong((id *)&self->_reactionDescription, 0);
}

- (INSticker)sticker
{
  return self->_sticker;
}

- (NSString)emoji
{
  return self->_emoji;
}

- (NSString)reactionDescription
{
  return self->_reactionDescription;
}

- (int64_t)reactionType
{
  return self->_reactionType;
}

- (id)_dictionaryRepresentation
{
  v13[4] = *MEMORY[0x1E4F143B8];
  v12[0] = @"reactionType";
  v3 = [NSNumber numberWithInteger:self->_reactionType];
  v13[0] = v3;
  v12[1] = @"reactionDescription";
  reactionDescription = self->_reactionDescription;
  v5 = reactionDescription;
  if (!reactionDescription)
  {
    v5 = [MEMORY[0x1E4F1CA98] null];
  }
  v13[1] = v5;
  v12[2] = @"emoji";
  emoji = self->_emoji;
  v7 = emoji;
  if (!emoji)
  {
    v7 = [MEMORY[0x1E4F1CA98] null];
  }
  v13[2] = v7;
  v12[3] = @"sticker";
  sticker = self->_sticker;
  v9 = sticker;
  if (!sticker)
  {
    v9 = [MEMORY[0x1E4F1CA98] null];
  }
  v13[3] = v9;
  v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:4];
  if (sticker)
  {
    if (emoji) {
      goto LABEL_9;
    }
LABEL_14:

    if (reactionDescription) {
      goto LABEL_10;
    }
    goto LABEL_15;
  }

  if (!emoji) {
    goto LABEL_14;
  }
LABEL_9:
  if (reactionDescription) {
    goto LABEL_10;
  }
LABEL_15:

LABEL_10:

  return v10;
}

- (id)descriptionAtIndent:(unint64_t)a3
{
  v5 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)INMessageReaction;
  v6 = [(INMessageReaction *)&v11 description];
  v7 = [(INMessageReaction *)self _dictionaryRepresentation];
  v8 = [v7 descriptionAtIndent:a3];
  v9 = [v5 stringWithFormat:@"%@ %@", v6, v8];

  return v9;
}

- (NSString)description
{
  return (NSString *)[(INMessageReaction *)self descriptionAtIndent:0];
}

- (id)_intents_encodeWithJSONEncoder:(id)a3 codableDescription:(id)a4
{
  v5 = (void *)MEMORY[0x1E4F1CA60];
  id v6 = a3;
  v7 = [v5 dictionary];
  v8 = INMessageReactionTypeGetName(self->_reactionType);
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v8, @"reactionType");

  v9 = [v6 encodeObject:self->_reactionDescription];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v9, @"reactionDescription");

  v10 = [v6 encodeObject:self->_emoji];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v10, @"emoji");

  objc_super v11 = [v6 encodeObject:self->_sticker];

  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v11, @"sticker");

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t reactionType = self->_reactionType;
  id v5 = a3;
  [v5 encodeInteger:reactionType forKey:@"reactionType"];
  [v5 encodeObject:self->_reactionDescription forKey:@"reactionDescription"];
  [v5 encodeObject:self->_emoji forKey:@"emoji"];
  [v5 encodeObject:self->_sticker forKey:@"sticker"];
}

- (INMessageReaction)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeIntegerForKey:@"reactionType"];
  id v6 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v7 = objc_opt_class();
  v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
  v9 = [v4 decodeObjectOfClasses:v8 forKey:@"reactionDescription"];

  v10 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v11 = objc_opt_class();
  v12 = objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
  v13 = [v4 decodeObjectOfClasses:v12 forKey:@"emoji"];

  v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sticker"];

  v15 = [(INMessageReaction *)self initWithReactionType:v5 reactionDescription:v9 emoji:v13 sticker:v14];
  return v15;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (INMessageReaction *)a3;
  if (v4 == self)
  {
    BOOL v9 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = v4;
      BOOL v9 = 0;
      if (self->_reactionType == v5->_reactionType)
      {
        reactionDescription = self->_reactionDescription;
        if (reactionDescription == v5->_reactionDescription
          || -[NSString isEqual:](reactionDescription, "isEqual:"))
        {
          emoji = self->_emoji;
          if (emoji == v5->_emoji || -[NSString isEqual:](emoji, "isEqual:"))
          {
            sticker = self->_sticker;
            if (sticker == v5->_sticker || -[INSticker isEqual:](sticker, "isEqual:")) {
              BOOL v9 = 1;
            }
          }
        }
      }
    }
    else
    {
      BOOL v9 = 0;
    }
  }

  return v9;
}

- (unint64_t)hash
{
  v3 = [NSNumber numberWithInteger:self->_reactionType];
  uint64_t v4 = [v3 hash];
  NSUInteger v5 = [(NSString *)self->_reactionDescription hash];
  NSUInteger v6 = v5 ^ [(NSString *)self->_emoji hash];
  unint64_t v7 = v6 ^ [(INSticker *)self->_sticker hash] ^ v4;

  return v7;
}

- (INMessageReaction)initWithReactionType:(int64_t)a3 reactionDescription:(id)a4 emoji:(id)a5 sticker:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v22.receiver = self;
  v22.super_class = (Class)INMessageReaction;
  v13 = [(INMessageReaction *)&v22 init];
  v14 = v13;
  if (v13)
  {
    v13->_int64_t reactionType = a3;
    uint64_t v15 = [v10 copy];
    reactionDescription = v14->_reactionDescription;
    v14->_reactionDescription = (NSString *)v15;

    uint64_t v17 = [v11 copy];
    emoji = v14->_emoji;
    v14->_emoji = (NSString *)v17;

    uint64_t v19 = [v12 copy];
    sticker = v14->_sticker;
    v14->_sticker = (INSticker *)v19;
  }
  return v14;
}

- (INMessageReaction)initWithReactionType:(int64_t)a3 reactionDescription:(id)a4 emoji:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v17.receiver = self;
  v17.super_class = (Class)INMessageReaction;
  id v10 = [(INMessageReaction *)&v17 init];
  id v11 = v10;
  if (v10)
  {
    v10->_int64_t reactionType = a3;
    uint64_t v12 = [v8 copy];
    reactionDescription = v11->_reactionDescription;
    v11->_reactionDescription = (NSString *)v12;

    uint64_t v14 = [v9 copy];
    emoji = v11->_emoji;
    v11->_emoji = (NSString *)v14;
  }
  return v11;
}

- (INMessageReaction)init
{
  v3.receiver = self;
  v3.super_class = (Class)INMessageReaction;
  return [(INMessageReaction *)&v3 init];
}

+ (id)_intents_decodeWithJSONDecoder:(id)a3 codableDescription:(id)a4 from:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = [v8 objectForKeyedSubscript:@"reactionType"];
    uint64_t v10 = INMessageReactionTypeWithString(v9);

    id v11 = [v8 objectForKeyedSubscript:@"reactionDescription"];
    uint64_t v12 = [v8 objectForKeyedSubscript:@"emoji"];
    uint64_t v13 = objc_opt_class();
    uint64_t v14 = [v8 objectForKeyedSubscript:@"sticker"];
    uint64_t v15 = [v7 decodeObjectOfClass:v13 from:v14];

    v16 = (void *)[objc_alloc((Class)a1) initWithReactionType:v10 reactionDescription:v11 emoji:v12 sticker:v15];
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
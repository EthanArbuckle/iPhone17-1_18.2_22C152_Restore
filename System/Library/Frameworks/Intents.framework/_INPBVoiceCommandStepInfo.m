@interface _INPBVoiceCommandStepInfo
+ (BOOL)supportsSecureCoding;
- (BOOL)hasApplicationIdentifier;
- (BOOL)hasCategory;
- (BOOL)hasName;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)applicationIdentifier;
- (NSString)name;
- (_INPBVoiceCommandStepInfo)initWithCoder:(id)a3;
- (id)categoryAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (int)StringAsCategory:(id)a3;
- (int)category;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setApplicationIdentifier:(id)a3;
- (void)setCategory:(int)a3;
- (void)setHasCategory:(BOOL)a3;
- (void)setName:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBVoiceCommandStepInfo

- (_INPBVoiceCommandStepInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBVoiceCommandStepInfo *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        v6 = (_INPBVoiceCommandStepInfo *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBVoiceCommandStepInfo *)self initWithData:v6];

    v6 = self;
  }

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (self->_applicationIdentifier)
  {
    id v4 = [(_INPBVoiceCommandStepInfo *)self applicationIdentifier];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"applicationIdentifier"];
  }
  if ([(_INPBVoiceCommandStepInfo *)self hasCategory])
  {
    uint64_t v6 = [(_INPBVoiceCommandStepInfo *)self category];
    int v7 = v6 - 1;
    if (v6 - 1) < 0x15 && ((0x1FFDFFu >> v7))
    {
      v8 = off_1E551EEE0[v7];
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v6);
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    [v3 setObject:v8 forKeyedSubscript:@"category"];
  }
  if (self->_name)
  {
    v9 = [(_INPBVoiceCommandStepInfo *)self name];
    v10 = (void *)[v9 copy];
    [v3 setObject:v10 forKeyedSubscript:@"name"];
  }

  return v3;
}

- (void)writeTo:(id)a3
{
  id v7 = a3;
  id v4 = [(_INPBVoiceCommandStepInfo *)self applicationIdentifier];

  if (v4) {
    PBDataWriterWriteStringField();
  }
  if ([(_INPBVoiceCommandStepInfo *)self hasCategory]) {
    PBDataWriterWriteInt32Field();
  }
  v5 = [(_INPBVoiceCommandStepInfo *)self name];

  uint64_t v6 = v7;
  if (v5)
  {
    PBDataWriterWriteStringField();
    uint64_t v6 = v7;
  }
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBVoiceCommandStepInfo *)self data];
  v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);

  objc_storeStrong((id *)&self->_applicationIdentifier, 0);
}

- (NSString)name
{
  return self->_name;
}

- (int)category
{
  return self->_category;
}

- (NSString)applicationIdentifier
{
  return self->_applicationIdentifier;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_applicationIdentifier hash];
  if ([(_INPBVoiceCommandStepInfo *)self hasCategory]) {
    uint64_t v4 = 2654435761 * self->_category;
  }
  else {
    uint64_t v4 = 0;
  }
  return v4 ^ v3 ^ [(NSString *)self->_name hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_16;
  }
  v5 = [(_INPBVoiceCommandStepInfo *)self applicationIdentifier];
  id v6 = [v4 applicationIdentifier];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_15;
  }
  uint64_t v7 = [(_INPBVoiceCommandStepInfo *)self applicationIdentifier];
  if (v7)
  {
    v8 = (void *)v7;
    v9 = [(_INPBVoiceCommandStepInfo *)self applicationIdentifier];
    v10 = [v4 applicationIdentifier];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_16;
    }
  }
  else
  {
  }
  int v12 = [(_INPBVoiceCommandStepInfo *)self hasCategory];
  if (v12 != [v4 hasCategory]) {
    goto LABEL_16;
  }
  if ([(_INPBVoiceCommandStepInfo *)self hasCategory])
  {
    if ([v4 hasCategory])
    {
      int category = self->_category;
      if (category != [v4 category]) {
        goto LABEL_16;
      }
    }
  }
  v5 = [(_INPBVoiceCommandStepInfo *)self name];
  id v6 = [v4 name];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v14 = [(_INPBVoiceCommandStepInfo *)self name];
    if (!v14)
    {

LABEL_19:
      BOOL v19 = 1;
      goto LABEL_17;
    }
    v15 = (void *)v14;
    v16 = [(_INPBVoiceCommandStepInfo *)self name];
    v17 = [v4 name];
    char v18 = [v16 isEqual:v17];

    if (v18) {
      goto LABEL_19;
    }
  }
  else
  {
LABEL_15:
  }
LABEL_16:
  BOOL v19 = 0;
LABEL_17:

  return v19;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [+[_INPBVoiceCommandStepInfo allocWithZone:](_INPBVoiceCommandStepInfo, "allocWithZone:") init];
  id v6 = (void *)[(NSString *)self->_applicationIdentifier copyWithZone:a3];
  [(_INPBVoiceCommandStepInfo *)v5 setApplicationIdentifier:v6];

  if ([(_INPBVoiceCommandStepInfo *)self hasCategory]) {
    [(_INPBVoiceCommandStepInfo *)v5 setCategory:[(_INPBVoiceCommandStepInfo *)self category]];
  }
  uint64_t v7 = (void *)[(NSString *)self->_name copyWithZone:a3];
  [(_INPBVoiceCommandStepInfo *)v5 setName:v7];

  return v5;
}

- (BOOL)readFrom:(id)a3
{
  return _INPBVoiceCommandStepInfoReadFrom(self, (uint64_t)a3);
}

- (BOOL)hasName
{
  return self->_name != 0;
}

- (void)setName:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  name = self->_name;
  self->_name = v4;

  MEMORY[0x1F41817F8](v4, name);
}

- (int)StringAsCategory:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"CATEGORY_INFORMATION"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"CATEGORY_PLAY_AUDIO"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"CATEGORY_PLAY_VIDEO"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"CATEGORY_ORDER"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"CATEGORY_NAVIGATION"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"CATEGORY_START"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"CATEGORY_SHARE"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"CATEGORY_CREATE"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"CATEGORY_SEARCH"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"CATEGORY_TOGGLE"])
  {
    int v4 = 11;
  }
  else if ([v3 isEqualToString:@"CATEGORY_DOWNLOAD"])
  {
    int v4 = 12;
  }
  else if ([v3 isEqualToString:@"CATEGORY_LOG"])
  {
    int v4 = 13;
  }
  else if ([v3 isEqualToString:@"CATEGORY_CHECK_IN"])
  {
    int v4 = 14;
  }
  else if ([v3 isEqualToString:@"CATEGORY_WORKFLOW"])
  {
    int v4 = 15;
  }
  else if ([v3 isEqualToString:@"CATEGORY_REQUEST"])
  {
    int v4 = 16;
  }
  else if ([v3 isEqualToString:@"CATEGORY_SET"])
  {
    int v4 = 17;
  }
  else if ([v3 isEqualToString:@"CATEGORY_CALL_AUDIO"])
  {
    int v4 = 18;
  }
  else if ([v3 isEqualToString:@"CATEGORY_CALL_VIDEO"])
  {
    int v4 = 19;
  }
  else if ([v3 isEqualToString:@"CATEGORY_PLAY_SOUND"])
  {
    int v4 = 20;
  }
  else if ([v3 isEqualToString:@"CATEGORY_USER_ACTIVITY"])
  {
    int v4 = 21;
  }
  else
  {
    int v4 = 1;
  }

  return v4;
}

- (id)categoryAsString:(int)a3
{
  int v3 = a3 - 1;
  if (a3 - 1) < 0x15 && ((0x1FFDFFu >> v3))
  {
    int v4 = off_1E551EEE0[v3];
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    int v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  return v4;
}

- (void)setHasCategory:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCategory
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setCategory:(int)a3
{
  char has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(unsigned char *)&self->_char has = has & 0xFE;
  }
  else
  {
    *(unsigned char *)&self->_char has = has | 1;
    self->_int category = a3;
  }
}

- (BOOL)hasApplicationIdentifier
{
  return self->_applicationIdentifier != 0;
}

- (void)setApplicationIdentifier:(id)a3
{
  int v4 = (NSString *)[a3 copy];
  applicationIdentifier = self->_applicationIdentifier;
  self->_applicationIdentifier = v4;

  MEMORY[0x1F41817F8](v4, applicationIdentifier);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
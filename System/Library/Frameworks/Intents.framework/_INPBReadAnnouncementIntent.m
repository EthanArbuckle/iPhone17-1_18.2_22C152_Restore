@interface _INPBReadAnnouncementIntent
+ (BOOL)supportsSecureCoding;
- (BOOL)hasIntentMetadata;
- (BOOL)hasReadType;
- (BOOL)hasStartAnnouncementIdentifier;
- (BOOL)hasUserNotificationType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)startAnnouncementIdentifier;
- (_INPBIntentMetadata)intentMetadata;
- (_INPBReadAnnouncementIntent)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (id)readTypeAsString:(int)a3;
- (id)userNotificationTypeAsString:(int)a3;
- (int)StringAsReadType:(id)a3;
- (int)StringAsUserNotificationType:(id)a3;
- (int)readType;
- (int)userNotificationType;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setHasReadType:(BOOL)a3;
- (void)setHasUserNotificationType:(BOOL)a3;
- (void)setIntentMetadata:(id)a3;
- (void)setReadType:(int)a3;
- (void)setStartAnnouncementIdentifier:(id)a3;
- (void)setUserNotificationType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBReadAnnouncementIntent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_startAnnouncementIdentifier, 0);

  objc_storeStrong((id *)&self->_intentMetadata, 0);
}

- (int)userNotificationType
{
  return self->_userNotificationType;
}

- (NSString)startAnnouncementIdentifier
{
  return self->_startAnnouncementIdentifier;
}

- (int)readType
{
  return self->_readType;
}

- (_INPBIntentMetadata)intentMetadata
{
  return self->_intentMetadata;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = [(_INPBReadAnnouncementIntent *)self intentMetadata];
  v5 = [v4 dictionaryRepresentation];
  [v3 setObject:v5 forKeyedSubscript:@"intentMetadata"];

  if ([(_INPBReadAnnouncementIntent *)self hasReadType])
  {
    uint64_t v6 = [(_INPBReadAnnouncementIntent *)self readType];
    if (v6 == 1)
    {
      v7 = @"READ";
    }
    else if (v6 == 2)
    {
      v7 = @"REPEAT";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v6);
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    [v3 setObject:v7 forKeyedSubscript:@"readType"];
  }
  if (self->_startAnnouncementIdentifier)
  {
    v8 = [(_INPBReadAnnouncementIntent *)self startAnnouncementIdentifier];
    v9 = (void *)[v8 copy];
    [v3 setObject:v9 forKeyedSubscript:@"startAnnouncementIdentifier"];
  }
  if ([(_INPBReadAnnouncementIntent *)self hasUserNotificationType])
  {
    uint64_t v10 = [(_INPBReadAnnouncementIntent *)self userNotificationType];
    if (v10 == 1)
    {
      v11 = @"ANNOUNCEMENT";
    }
    else if (v10 == 2)
    {
      v11 = @"DELIVERY_FAILURE";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v10);
      v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    [v3 setObject:v11 forKeyedSubscript:@"userNotificationType"];
  }

  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(_INPBIntentMetadata *)self->_intentMetadata hash];
  if ([(_INPBReadAnnouncementIntent *)self hasReadType]) {
    uint64_t v4 = 2654435761 * self->_readType;
  }
  else {
    uint64_t v4 = 0;
  }
  NSUInteger v5 = [(NSString *)self->_startAnnouncementIdentifier hash];
  if ([(_INPBReadAnnouncementIntent *)self hasUserNotificationType]) {
    uint64_t v6 = 2654435761 * self->_userNotificationType;
  }
  else {
    uint64_t v6 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_16;
  }
  NSUInteger v5 = [(_INPBReadAnnouncementIntent *)self intentMetadata];
  uint64_t v6 = [v4 intentMetadata];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_15;
  }
  uint64_t v7 = [(_INPBReadAnnouncementIntent *)self intentMetadata];
  if (v7)
  {
    v8 = (void *)v7;
    v9 = [(_INPBReadAnnouncementIntent *)self intentMetadata];
    uint64_t v10 = [v4 intentMetadata];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_16;
    }
  }
  else
  {
  }
  int v12 = [(_INPBReadAnnouncementIntent *)self hasReadType];
  if (v12 != [v4 hasReadType]) {
    goto LABEL_16;
  }
  if ([(_INPBReadAnnouncementIntent *)self hasReadType])
  {
    if ([v4 hasReadType])
    {
      int readType = self->_readType;
      if (readType != [v4 readType]) {
        goto LABEL_16;
      }
    }
  }
  NSUInteger v5 = [(_INPBReadAnnouncementIntent *)self startAnnouncementIdentifier];
  uint64_t v6 = [v4 startAnnouncementIdentifier];
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_15:

    goto LABEL_16;
  }
  uint64_t v14 = [(_INPBReadAnnouncementIntent *)self startAnnouncementIdentifier];
  if (v14)
  {
    v15 = (void *)v14;
    v16 = [(_INPBReadAnnouncementIntent *)self startAnnouncementIdentifier];
    v17 = [v4 startAnnouncementIdentifier];
    int v18 = [v16 isEqual:v17];

    if (!v18) {
      goto LABEL_16;
    }
  }
  else
  {
  }
  int v21 = [(_INPBReadAnnouncementIntent *)self hasUserNotificationType];
  if (v21 == [v4 hasUserNotificationType])
  {
    if (![(_INPBReadAnnouncementIntent *)self hasUserNotificationType]
      || ![v4 hasUserNotificationType]
      || (int userNotificationType = self->_userNotificationType,
          userNotificationType == [v4 userNotificationType]))
    {
      BOOL v19 = 1;
      goto LABEL_17;
    }
  }
LABEL_16:
  BOOL v19 = 0;
LABEL_17:

  return v19;
}

- (id)copyWithZone:(_NSZone *)a3
{
  NSUInteger v5 = [+[_INPBReadAnnouncementIntent allocWithZone:](_INPBReadAnnouncementIntent, "allocWithZone:") init];
  id v6 = [(_INPBIntentMetadata *)self->_intentMetadata copyWithZone:a3];
  [(_INPBReadAnnouncementIntent *)v5 setIntentMetadata:v6];

  if ([(_INPBReadAnnouncementIntent *)self hasReadType]) {
    [(_INPBReadAnnouncementIntent *)v5 setReadType:[(_INPBReadAnnouncementIntent *)self readType]];
  }
  uint64_t v7 = (void *)[(NSString *)self->_startAnnouncementIdentifier copyWithZone:a3];
  [(_INPBReadAnnouncementIntent *)v5 setStartAnnouncementIdentifier:v7];

  if ([(_INPBReadAnnouncementIntent *)self hasUserNotificationType]) {
    [(_INPBReadAnnouncementIntent *)v5 setUserNotificationType:[(_INPBReadAnnouncementIntent *)self userNotificationType]];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBReadAnnouncementIntent *)self data];
  NSUInteger v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBReadAnnouncementIntent)initWithCoder:(id)a3
{
  id v4 = a3;
  NSUInteger v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBReadAnnouncementIntent *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBReadAnnouncementIntent *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBReadAnnouncementIntent *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  id v7 = a3;
  id v4 = [(_INPBReadAnnouncementIntent *)self intentMetadata];

  if (v4)
  {
    NSUInteger v5 = [(_INPBReadAnnouncementIntent *)self intentMetadata];
    PBDataWriterWriteSubmessage();
  }
  if ([(_INPBReadAnnouncementIntent *)self hasReadType]) {
    PBDataWriterWriteInt32Field();
  }
  id v6 = [(_INPBReadAnnouncementIntent *)self startAnnouncementIdentifier];

  if (v6) {
    PBDataWriterWriteStringField();
  }
  if ([(_INPBReadAnnouncementIntent *)self hasUserNotificationType]) {
    PBDataWriterWriteInt32Field();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBReadAnnouncementIntentReadFrom(self, (uint64_t)a3);
}

- (int)StringAsUserNotificationType:(id)a3
{
  id v3 = a3;
  int v4 = 1;
  if (([v3 isEqualToString:@"ANNOUNCEMENT"] & 1) == 0)
  {
    if ([v3 isEqualToString:@"DELIVERY_FAILURE"]) {
      int v4 = 2;
    }
    else {
      int v4 = 1;
    }
  }

  return v4;
}

- (id)userNotificationTypeAsString:(int)a3
{
  if (a3 == 1)
  {
    int v4 = @"ANNOUNCEMENT";
  }
  else if (a3 == 2)
  {
    int v4 = @"DELIVERY_FAILURE";
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    int v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (void)setHasUserNotificationType:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasUserNotificationType
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setUserNotificationType:(int)a3
{
  char has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(unsigned char *)&self->_char has = has & 0xFD;
  }
  else
  {
    *(unsigned char *)&self->_char has = has | 2;
    self->_int userNotificationType = a3;
  }
}

- (BOOL)hasStartAnnouncementIdentifier
{
  return self->_startAnnouncementIdentifier != 0;
}

- (void)setStartAnnouncementIdentifier:(id)a3
{
  int v4 = (NSString *)[a3 copy];
  startAnnouncementIdentifier = self->_startAnnouncementIdentifier;
  self->_startAnnouncementIdentifier = v4;

  MEMORY[0x1F41817F8](v4, startAnnouncementIdentifier);
}

- (int)StringAsReadType:(id)a3
{
  id v3 = a3;
  int v4 = 1;
  if (([v3 isEqualToString:@"READ"] & 1) == 0)
  {
    if ([v3 isEqualToString:@"REPEAT"]) {
      int v4 = 2;
    }
    else {
      int v4 = 1;
    }
  }

  return v4;
}

- (id)readTypeAsString:(int)a3
{
  if (a3 == 1)
  {
    int v4 = @"READ";
  }
  else if (a3 == 2)
  {
    int v4 = @"REPEAT";
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    int v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (void)setHasReadType:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasReadType
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setReadType:(int)a3
{
  char has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(unsigned char *)&self->_char has = has & 0xFE;
  }
  else
  {
    *(unsigned char *)&self->_char has = has | 1;
    self->_int readType = a3;
  }
}

- (BOOL)hasIntentMetadata
{
  return self->_intentMetadata != 0;
}

- (void)setIntentMetadata:(id)a3
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
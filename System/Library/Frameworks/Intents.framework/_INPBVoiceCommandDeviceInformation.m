@interface _INPBVoiceCommandDeviceInformation
+ (BOOL)supportsSecureCoding;
- (BOOL)hasDeviceIdiom;
- (BOOL)hasIsHomePodInUltimateMode;
- (BOOL)isEqual:(id)a3;
- (BOOL)isHomePodInUltimateMode;
- (BOOL)readFrom:(id)a3;
- (_INPBVoiceCommandDeviceInformation)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)deviceIdiomAsString:(int)a3;
- (id)dictionaryRepresentation;
- (int)StringAsDeviceIdiom:(id)a3;
- (int)deviceIdiom;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setDeviceIdiom:(int)a3;
- (void)setHasDeviceIdiom:(BOOL)a3;
- (void)setHasIsHomePodInUltimateMode:(BOOL)a3;
- (void)setIsHomePodInUltimateMode:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBVoiceCommandDeviceInformation

- (BOOL)isHomePodInUltimateMode
{
  return self->_isHomePodInUltimateMode;
}

- (int)deviceIdiom
{
  return self->_deviceIdiom;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(_INPBVoiceCommandDeviceInformation *)self hasDeviceIdiom])
  {
    uint64_t v4 = [(_INPBVoiceCommandDeviceInformation *)self deviceIdiom];
    if ((v4 - 1) >= 7)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v4);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = off_1E55165A0[(v4 - 1)];
    }
    [v3 setObject:v5 forKeyedSubscript:@"deviceIdiom"];
  }
  if ([(_INPBVoiceCommandDeviceInformation *)self hasIsHomePodInUltimateMode])
  {
    v6 = objc_msgSend(NSNumber, "numberWithBool:", -[_INPBVoiceCommandDeviceInformation isHomePodInUltimateMode](self, "isHomePodInUltimateMode"));
    [v3 setObject:v6 forKeyedSubscript:@"isHomePodInUltimateMode"];
  }

  return v3;
}

- (unint64_t)hash
{
  if ([(_INPBVoiceCommandDeviceInformation *)self hasDeviceIdiom]) {
    uint64_t v3 = 2654435761 * self->_deviceIdiom;
  }
  else {
    uint64_t v3 = 0;
  }
  if ([(_INPBVoiceCommandDeviceInformation *)self hasIsHomePodInUltimateMode]) {
    uint64_t v4 = 2654435761 * self->_isHomePodInUltimateMode;
  }
  else {
    uint64_t v4 = 0;
  }
  return v4 ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  BOOL v8 = 0;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    int v5 = [(_INPBVoiceCommandDeviceInformation *)self hasDeviceIdiom];
    if (v5 == [v4 hasDeviceIdiom])
    {
      if (![(_INPBVoiceCommandDeviceInformation *)self hasDeviceIdiom]
        || ![v4 hasDeviceIdiom]
        || (int deviceIdiom = self->_deviceIdiom, deviceIdiom == [v4 deviceIdiom]))
      {
        int v7 = [(_INPBVoiceCommandDeviceInformation *)self hasIsHomePodInUltimateMode];
        if (v7 == [v4 hasIsHomePodInUltimateMode])
        {
          if (![(_INPBVoiceCommandDeviceInformation *)self hasIsHomePodInUltimateMode]
            || ![v4 hasIsHomePodInUltimateMode]
            || (int isHomePodInUltimateMode = self->_isHomePodInUltimateMode,
                isHomePodInUltimateMode == [v4 isHomePodInUltimateMode]))
          {
            BOOL v8 = 1;
          }
        }
      }
    }
  }

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [+[_INPBVoiceCommandDeviceInformation allocWithZone:a3] init];
  if ([(_INPBVoiceCommandDeviceInformation *)self hasDeviceIdiom]) {
    [(_INPBVoiceCommandDeviceInformation *)v4 setDeviceIdiom:[(_INPBVoiceCommandDeviceInformation *)self deviceIdiom]];
  }
  if ([(_INPBVoiceCommandDeviceInformation *)self hasIsHomePodInUltimateMode]) {
    [(_INPBVoiceCommandDeviceInformation *)v4 setIsHomePodInUltimateMode:[(_INPBVoiceCommandDeviceInformation *)self isHomePodInUltimateMode]];
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBVoiceCommandDeviceInformation *)self data];
  int v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBVoiceCommandDeviceInformation)initWithCoder:(id)a3
{
  id v4 = a3;
  int v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBVoiceCommandDeviceInformation *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        BOOL v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBVoiceCommandDeviceInformation *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBVoiceCommandDeviceInformation *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if ([(_INPBVoiceCommandDeviceInformation *)self hasDeviceIdiom]) {
    PBDataWriterWriteInt32Field();
  }
  if ([(_INPBVoiceCommandDeviceInformation *)self hasIsHomePodInUltimateMode]) {
    PBDataWriterWriteBOOLField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBVoiceCommandDeviceInformationReadFrom(self, (uint64_t)a3);
}

- (void)setHasIsHomePodInUltimateMode:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasIsHomePodInUltimateMode
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setIsHomePodInUltimateMode:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_int isHomePodInUltimateMode = a3;
}

- (int)StringAsDeviceIdiom:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"PHONE"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"PAD"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"WATCH"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"HOME_POD"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"CARPLAY"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"APPLE_TV"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"MAC"])
  {
    int v4 = 7;
  }
  else
  {
    int v4 = 1;
  }

  return v4;
}

- (id)deviceIdiomAsString:(int)a3
{
  if ((a3 - 1) >= 7)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E55165A0[a3 - 1];
  }

  return v3;
}

- (void)setHasDeviceIdiom:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDeviceIdiom
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setDeviceIdiom:(int)a3
{
  char has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(unsigned char *)&self->_char has = has & 0xFE;
  }
  else
  {
    *(unsigned char *)&self->_char has = has | 1;
    self->_int deviceIdiom = a3;
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
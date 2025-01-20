@interface _INPBContactHandle
+ (BOOL)supportsSecureCoding;
- (BOOL)hasEmergencyType;
- (BOOL)hasFaceTimeType;
- (BOOL)hasLabel;
- (BOOL)hasSuggested;
- (BOOL)hasType;
- (BOOL)hasValue;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)suggested;
- (NSString)label;
- (NSString)value;
- (_INPBContactHandle)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (id)emergencyTypeAsString:(int)a3;
- (id)faceTimeTypeAsString:(int)a3;
- (id)typeAsString:(int)a3;
- (int)StringAsEmergencyType:(id)a3;
- (int)StringAsFaceTimeType:(id)a3;
- (int)StringAsType:(id)a3;
- (int)emergencyType;
- (int)faceTimeType;
- (int)type;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setEmergencyType:(int)a3;
- (void)setFaceTimeType:(int)a3;
- (void)setHasEmergencyType:(BOOL)a3;
- (void)setHasFaceTimeType:(BOOL)a3;
- (void)setHasSuggested:(BOOL)a3;
- (void)setHasType:(BOOL)a3;
- (void)setLabel:(id)a3;
- (void)setSuggested:(BOOL)a3;
- (void)setType:(int)a3;
- (void)setValue:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBContactHandle

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);

  objc_storeStrong((id *)&self->_label, 0);
}

- (NSString)value
{
  return self->_value;
}

- (int)type
{
  return self->_type;
}

- (BOOL)suggested
{
  return self->_suggested;
}

- (NSString)label
{
  return self->_label;
}

- (int)faceTimeType
{
  return self->_faceTimeType;
}

- (int)emergencyType
{
  return self->_emergencyType;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(_INPBContactHandle *)self hasEmergencyType])
  {
    uint64_t v4 = [(_INPBContactHandle *)self emergencyType];
    if (v4 >= 3)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v4);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = off_1E5517DB0[v4];
    }
    [v3 setObject:v5 forKeyedSubscript:@"emergencyType"];
  }
  if ([(_INPBContactHandle *)self hasFaceTimeType])
  {
    uint64_t v6 = [(_INPBContactHandle *)self faceTimeType];
    if (v6 >= 3)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v6);
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = off_1E5517DC8[v6];
    }
    [v3 setObject:v7 forKeyedSubscript:@"faceTimeType"];
  }
  if (self->_label)
  {
    v8 = [(_INPBContactHandle *)self label];
    v9 = (void *)[v8 copy];
    [v3 setObject:v9 forKeyedSubscript:@"label"];
  }
  if ([(_INPBContactHandle *)self hasSuggested])
  {
    v10 = objc_msgSend(NSNumber, "numberWithBool:", -[_INPBContactHandle suggested](self, "suggested"));
    [v3 setObject:v10 forKeyedSubscript:@"suggested"];
  }
  if ([(_INPBContactHandle *)self hasType])
  {
    uint64_t v11 = [(_INPBContactHandle *)self type];
    if (v11 >= 5)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v11);
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = off_1E5517DE0[v11];
    }
    [v3 setObject:v12 forKeyedSubscript:@"type"];
  }
  if (self->_value)
  {
    v13 = [(_INPBContactHandle *)self value];
    v14 = (void *)[v13 copy];
    [v3 setObject:v14 forKeyedSubscript:@"value"];
  }

  return v3;
}

- (unint64_t)hash
{
  if ([(_INPBContactHandle *)self hasEmergencyType]) {
    uint64_t v3 = 2654435761 * self->_emergencyType;
  }
  else {
    uint64_t v3 = 0;
  }
  if ([(_INPBContactHandle *)self hasFaceTimeType]) {
    uint64_t v4 = 2654435761 * self->_faceTimeType;
  }
  else {
    uint64_t v4 = 0;
  }
  NSUInteger v5 = [(NSString *)self->_label hash];
  if ([(_INPBContactHandle *)self hasSuggested]) {
    uint64_t v6 = 2654435761 * self->_suggested;
  }
  else {
    uint64_t v6 = 0;
  }
  if ([(_INPBContactHandle *)self hasType]) {
    uint64_t v7 = 2654435761 * self->_type;
  }
  else {
    uint64_t v7 = 0;
  }
  return v4 ^ v3 ^ v6 ^ v7 ^ v5 ^ [(NSString *)self->_value hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_28;
  }
  int v5 = [(_INPBContactHandle *)self hasEmergencyType];
  if (v5 != [v4 hasEmergencyType]) {
    goto LABEL_28;
  }
  if ([(_INPBContactHandle *)self hasEmergencyType])
  {
    if ([v4 hasEmergencyType])
    {
      int emergencyType = self->_emergencyType;
      if (emergencyType != [v4 emergencyType]) {
        goto LABEL_28;
      }
    }
  }
  int v7 = [(_INPBContactHandle *)self hasFaceTimeType];
  if (v7 != [v4 hasFaceTimeType]) {
    goto LABEL_28;
  }
  if ([(_INPBContactHandle *)self hasFaceTimeType])
  {
    if ([v4 hasFaceTimeType])
    {
      int faceTimeType = self->_faceTimeType;
      if (faceTimeType != [v4 faceTimeType]) {
        goto LABEL_28;
      }
    }
  }
  v9 = [(_INPBContactHandle *)self label];
  v10 = [v4 label];
  if ((v9 == 0) == (v10 != 0)) {
    goto LABEL_27;
  }
  uint64_t v11 = [(_INPBContactHandle *)self label];
  if (v11)
  {
    v12 = (void *)v11;
    v13 = [(_INPBContactHandle *)self label];
    v14 = [v4 label];
    int v15 = [v13 isEqual:v14];

    if (!v15) {
      goto LABEL_28;
    }
  }
  else
  {
  }
  int v16 = [(_INPBContactHandle *)self hasSuggested];
  if (v16 != [v4 hasSuggested]) {
    goto LABEL_28;
  }
  if ([(_INPBContactHandle *)self hasSuggested])
  {
    if ([v4 hasSuggested])
    {
      int suggested = self->_suggested;
      if (suggested != [v4 suggested]) {
        goto LABEL_28;
      }
    }
  }
  int v18 = [(_INPBContactHandle *)self hasType];
  if (v18 != [v4 hasType]) {
    goto LABEL_28;
  }
  if ([(_INPBContactHandle *)self hasType])
  {
    if ([v4 hasType])
    {
      int type = self->_type;
      if (type != [v4 type]) {
        goto LABEL_28;
      }
    }
  }
  v9 = [(_INPBContactHandle *)self value];
  v10 = [v4 value];
  if ((v9 == 0) != (v10 != 0))
  {
    uint64_t v20 = [(_INPBContactHandle *)self value];
    if (!v20)
    {

LABEL_31:
      BOOL v25 = 1;
      goto LABEL_29;
    }
    v21 = (void *)v20;
    v22 = [(_INPBContactHandle *)self value];
    v23 = [v4 value];
    char v24 = [v22 isEqual:v23];

    if (v24) {
      goto LABEL_31;
    }
  }
  else
  {
LABEL_27:
  }
LABEL_28:
  BOOL v25 = 0;
LABEL_29:

  return v25;
}

- (id)copyWithZone:(_NSZone *)a3
{
  int v5 = [+[_INPBContactHandle allocWithZone:](_INPBContactHandle, "allocWithZone:") init];
  if ([(_INPBContactHandle *)self hasEmergencyType]) {
    [(_INPBContactHandle *)v5 setEmergencyType:[(_INPBContactHandle *)self emergencyType]];
  }
  if ([(_INPBContactHandle *)self hasFaceTimeType]) {
    [(_INPBContactHandle *)v5 setFaceTimeType:[(_INPBContactHandle *)self faceTimeType]];
  }
  uint64_t v6 = (void *)[(NSString *)self->_label copyWithZone:a3];
  [(_INPBContactHandle *)v5 setLabel:v6];

  if ([(_INPBContactHandle *)self hasSuggested]) {
    [(_INPBContactHandle *)v5 setSuggested:[(_INPBContactHandle *)self suggested]];
  }
  if ([(_INPBContactHandle *)self hasType]) {
    [(_INPBContactHandle *)v5 setType:[(_INPBContactHandle *)self type]];
  }
  int v7 = (void *)[(NSString *)self->_value copyWithZone:a3];
  [(_INPBContactHandle *)v5 setValue:v7];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBContactHandle *)self data];
  int v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBContactHandle)initWithCoder:(id)a3
{
  id v4 = a3;
  int v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBContactHandle *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBContactHandle *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBContactHandle *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  id v7 = a3;
  if ([(_INPBContactHandle *)self hasEmergencyType]) {
    PBDataWriterWriteInt32Field();
  }
  if ([(_INPBContactHandle *)self hasFaceTimeType]) {
    PBDataWriterWriteInt32Field();
  }
  id v4 = [(_INPBContactHandle *)self label];

  if (v4) {
    PBDataWriterWriteStringField();
  }
  if ([(_INPBContactHandle *)self hasSuggested]) {
    PBDataWriterWriteBOOLField();
  }
  if ([(_INPBContactHandle *)self hasType]) {
    PBDataWriterWriteInt32Field();
  }
  int v5 = [(_INPBContactHandle *)self value];

  id v6 = v7;
  if (v5)
  {
    PBDataWriterWriteStringField();
    id v6 = v7;
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBContactHandleReadFrom(self, (uint64_t)a3);
}

- (BOOL)hasValue
{
  return self->_value != 0;
}

- (void)setValue:(id)a3
{
  self->_value = (NSString *)[a3 copy];

  MEMORY[0x1F41817F8]();
}

- (int)StringAsType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Unknown"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"EmailAddress"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"PhoneNumber"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"Website"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"InstantMessage"])
  {
    int v4 = 4;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)typeAsString:(int)a3
{
  if (a3 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E5517DE0[a3];
  }

  return v3;
}

- (void)setHasType:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasType
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setType:(int)a3
{
  char has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(unsigned char *)&self->_char has = has & 0xF7;
  }
  else
  {
    *(unsigned char *)&self->_char has = has | 8;
    self->_int type = a3;
  }
}

- (void)setHasSuggested:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasSuggested
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setSuggested:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_int suggested = a3;
}

- (BOOL)hasLabel
{
  return self->_label != 0;
}

- (void)setLabel:(id)a3
{
  self->_label = (NSString *)[a3 copy];

  MEMORY[0x1F41817F8]();
}

- (int)StringAsFaceTimeType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Undefined"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"FaceTimeHandle"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"NonFaceTimeHandle"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)faceTimeTypeAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E5517DC8[a3];
  }

  return v3;
}

- (void)setHasFaceTimeType:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasFaceTimeType
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setFaceTimeType:(int)a3
{
  char has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(unsigned char *)&self->_char has = has & 0xFD;
  }
  else
  {
    *(unsigned char *)&self->_char has = has | 2;
    self->_int faceTimeType = a3;
  }
}

- (int)StringAsEmergencyType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"None"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"LocalEmergency"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"NonLocalEmergency"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)emergencyTypeAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E5517DB0[a3];
  }

  return v3;
}

- (void)setHasEmergencyType:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasEmergencyType
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setEmergencyType:(int)a3
{
  char has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(unsigned char *)&self->_char has = has & 0xFE;
  }
  else
  {
    *(unsigned char *)&self->_char has = has | 1;
    self->_int emergencyType = a3;
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
@interface AWDSymptomsDiagnosticIncidentEvent
- (BOOL)hasDetectedName;
- (BOOL)hasEffectiveName;
- (BOOL)hasName;
- (BOOL)hasState;
- (BOOL)hasStatus;
- (BOOL)hasTimestamp;
- (BOOL)hasType;
- (BOOL)hasValue;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)detectedName;
- (NSString)effectiveName;
- (NSString)name;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)stateAsString:(int)a3;
- (id)statusAsString:(int)a3;
- (id)typeAsString:(int)a3;
- (int)StringAsState:(id)a3;
- (int)StringAsStatus:(id)a3;
- (int)StringAsType:(id)a3;
- (int)state;
- (int)status;
- (int)type;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (unint64_t)value;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDetectedName:(id)a3;
- (void)setEffectiveName:(id)a3;
- (void)setHasState:(BOOL)a3;
- (void)setHasStatus:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setHasType:(BOOL)a3;
- (void)setHasValue:(BOOL)a3;
- (void)setName:(id)a3;
- (void)setState:(int)a3;
- (void)setStatus:(int)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)setType:(int)a3;
- (void)setValue:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDSymptomsDiagnosticIncidentEvent

- (void)setTimestamp:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTimestamp
{
  return *(unsigned char *)&self->_has & 1;
}

- (int)type
{
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
    return self->_type;
  }
  else {
    return 1;
  }
}

- (void)setType:(int)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_type = a3;
}

- (void)setHasType:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasType
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (id)typeAsString:(int)a3
{
  if (a3 == 1)
  {
    v4 = @"Trigger";
  }
  else if (a3 == 2)
  {
    v4 = @"Action";
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (int)StringAsType:(id)a3
{
  id v3 = a3;
  int v4 = 1;
  if (([v3 isEqualToString:@"Trigger"] & 1) == 0)
  {
    if ([v3 isEqualToString:@"Action"]) {
      int v4 = 2;
    }
    else {
      int v4 = 1;
    }
  }

  return v4;
}

- (BOOL)hasName
{
  return self->_name != 0;
}

- (void)setValue:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_value = a3;
}

- (void)setHasValue:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasValue
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (int)status
{
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    return self->_status;
  }
  else {
    return 1;
  }
}

- (void)setStatus:(int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_status = a3;
}

- (void)setHasStatus:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasStatus
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (id)statusAsString:(int)a3
{
  if ((a3 - 1) >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_263FC30E0[a3 - 1];
  }

  return v3;
}

- (int)StringAsStatus:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Success"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"Fail"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"Undetermined"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 1;
  }

  return v4;
}

- (int)state
{
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    return self->_state;
  }
  else {
    return 1;
  }
}

- (void)setState:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_state = a3;
}

- (void)setHasState:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasState
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (id)stateAsString:(int)a3
{
  if (a3 == 1)
  {
    int v4 = @"Started";
  }
  else if (a3 == 2)
  {
    int v4 = @"Ended";
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    int v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (int)StringAsState:(id)a3
{
  id v3 = a3;
  int v4 = 1;
  if (([v3 isEqualToString:@"Started"] & 1) == 0)
  {
    if ([v3 isEqualToString:@"Ended"]) {
      int v4 = 2;
    }
    else {
      int v4 = 1;
    }
  }

  return v4;
}

- (BOOL)hasDetectedName
{
  return self->_detectedName != 0;
}

- (BOOL)hasEffectiveName
{
  return self->_effectiveName != 0;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)AWDSymptomsDiagnosticIncidentEvent;
  int v4 = [(AWDSymptomsDiagnosticIncidentEvent *)&v8 description];
  v5 = [(AWDSymptomsDiagnosticIncidentEvent *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = [MEMORY[0x263EFF9A0] dictionary];
  char has = (char)self->_has;
  if (has)
  {
    v5 = [NSNumber numberWithUnsignedLongLong:self->_timestamp];
    [v3 setObject:v5 forKey:@"timestamp"];

    char has = (char)self->_has;
  }
  if ((has & 0x10) != 0)
  {
    int type = self->_type;
    if (type == 1)
    {
      v7 = @"Trigger";
    }
    else if (type == 2)
    {
      v7 = @"Action";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_type);
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    [v3 setObject:v7 forKey:@"type"];
  }
  name = self->_name;
  if (name) {
    [v3 setObject:name forKey:@"name"];
  }
  char v9 = (char)self->_has;
  if ((v9 & 2) != 0)
  {
    v10 = [NSNumber numberWithUnsignedLongLong:self->_value];
    [v3 setObject:v10 forKey:@"value"];

    char v9 = (char)self->_has;
    if ((v9 & 8) == 0)
    {
LABEL_14:
      if ((v9 & 4) == 0) {
        goto LABEL_27;
      }
      goto LABEL_21;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_14;
  }
  unsigned int v11 = self->_status - 1;
  if (v11 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_status);
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = off_263FC30E0[v11];
  }
  [v3 setObject:v12 forKey:@"status"];

  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_21:
    int state = self->_state;
    if (state == 1)
    {
      v14 = @"Started";
    }
    else if (state == 2)
    {
      v14 = @"Ended";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_state);
      v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    [v3 setObject:v14 forKey:@"state"];
  }
LABEL_27:
  detectedName = self->_detectedName;
  if (detectedName) {
    [v3 setObject:detectedName forKey:@"detectedName"];
  }
  effectiveName = self->_effectiveName;
  if (effectiveName) {
    [v3 setObject:effectiveName forKey:@"effectiveName"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDSymptomsDiagnosticIncidentEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  id v7 = v4;
  if (has)
  {
    PBDataWriterWriteUint64Field();
    id v4 = v7;
    char has = (char)self->_has;
  }
  if ((has & 0x10) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v7;
  }
  if (self->_name)
  {
    PBDataWriterWriteStringField();
    id v4 = v7;
  }
  char v6 = (char)self->_has;
  if ((v6 & 2) != 0)
  {
    PBDataWriterWriteUint64Field();
    id v4 = v7;
    char v6 = (char)self->_has;
    if ((v6 & 8) == 0)
    {
LABEL_9:
      if ((v6 & 4) == 0) {
        goto LABEL_11;
      }
      goto LABEL_10;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_9;
  }
  PBDataWriterWriteInt32Field();
  id v4 = v7;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_10:
    PBDataWriterWriteInt32Field();
    id v4 = v7;
  }
LABEL_11:
  if (self->_detectedName)
  {
    PBDataWriterWriteStringField();
    id v4 = v7;
  }
  if (self->_effectiveName)
  {
    PBDataWriterWriteStringField();
    id v4 = v7;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if (has)
  {
    v4[1] = self->_timestamp;
    *((unsigned char *)v4 + 60) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 0x10) != 0)
  {
    *((_DWORD *)v4 + 14) = self->_type;
    *((unsigned char *)v4 + 60) |= 0x10u;
  }
  id v7 = v4;
  if (self->_name)
  {
    objc_msgSend(v4, "setName:");
    id v4 = v7;
  }
  char v6 = (char)self->_has;
  if ((v6 & 2) != 0)
  {
    v4[2] = self->_value;
    *((unsigned char *)v4 + 60) |= 2u;
    char v6 = (char)self->_has;
    if ((v6 & 8) == 0)
    {
LABEL_9:
      if ((v6 & 4) == 0) {
        goto LABEL_11;
      }
      goto LABEL_10;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_9;
  }
  *((_DWORD *)v4 + 13) = self->_status;
  *((unsigned char *)v4 + 60) |= 8u;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_10:
    *((_DWORD *)v4 + 12) = self->_state;
    *((unsigned char *)v4 + 60) |= 4u;
  }
LABEL_11:
  if (self->_detectedName)
  {
    objc_msgSend(v7, "setDetectedName:");
    id v4 = v7;
  }
  if (self->_effectiveName)
  {
    objc_msgSend(v7, "setEffectiveName:");
    id v4 = v7;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  char has = (char)self->_has;
  if (has)
  {
    *(void *)(v5 + 8) = self->_timestamp;
    *(unsigned char *)(v5 + 60) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 0x10) != 0)
  {
    *(_DWORD *)(v5 + 56) = self->_type;
    *(unsigned char *)(v5 + 60) |= 0x10u;
  }
  uint64_t v8 = [(NSString *)self->_name copyWithZone:a3];
  char v9 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v8;

  char v10 = (char)self->_has;
  if ((v10 & 2) == 0)
  {
    if ((*(unsigned char *)&self->_has & 8) == 0) {
      goto LABEL_7;
    }
LABEL_11:
    *(_DWORD *)(v6 + 52) = self->_status;
    *(unsigned char *)(v6 + 60) |= 8u;
    if ((*(unsigned char *)&self->_has & 4) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  *(void *)(v6 + 16) = self->_value;
  *(unsigned char *)(v6 + 60) |= 2u;
  char v10 = (char)self->_has;
  if ((v10 & 8) != 0) {
    goto LABEL_11;
  }
LABEL_7:
  if ((v10 & 4) != 0)
  {
LABEL_8:
    *(_DWORD *)(v6 + 48) = self->_state;
    *(unsigned char *)(v6 + 60) |= 4u;
  }
LABEL_9:
  uint64_t v11 = [(NSString *)self->_detectedName copyWithZone:a3];
  v12 = *(void **)(v6 + 24);
  *(void *)(v6 + 24) = v11;

  uint64_t v13 = [(NSString *)self->_effectiveName copyWithZone:a3];
  v14 = *(void **)(v6 + 32);
  *(void *)(v6 + 32) = v13;

  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_34;
  }
  char has = (char)self->_has;
  if (has)
  {
    if ((*((unsigned char *)v4 + 60) & 1) == 0 || self->_timestamp != *((void *)v4 + 1)) {
      goto LABEL_34;
    }
  }
  else if (*((unsigned char *)v4 + 60))
  {
    goto LABEL_34;
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 60) & 0x10) == 0 || self->_type != *((_DWORD *)v4 + 14)) {
      goto LABEL_34;
    }
  }
  else if ((*((unsigned char *)v4 + 60) & 0x10) != 0)
  {
    goto LABEL_34;
  }
  name = self->_name;
  if ((unint64_t)name | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](name, "isEqual:"))
    {
LABEL_34:
      char v9 = 0;
      goto LABEL_35;
    }
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 60) & 2) == 0 || self->_value != *((void *)v4 + 2)) {
      goto LABEL_34;
    }
  }
  else if ((*((unsigned char *)v4 + 60) & 2) != 0)
  {
    goto LABEL_34;
  }
  if ((has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 60) & 8) == 0 || self->_status != *((_DWORD *)v4 + 13)) {
      goto LABEL_34;
    }
  }
  else if ((*((unsigned char *)v4 + 60) & 8) != 0)
  {
    goto LABEL_34;
  }
  if ((has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 60) & 4) == 0 || self->_state != *((_DWORD *)v4 + 12)) {
      goto LABEL_34;
    }
  }
  else if ((*((unsigned char *)v4 + 60) & 4) != 0)
  {
    goto LABEL_34;
  }
  detectedName = self->_detectedName;
  if ((unint64_t)detectedName | *((void *)v4 + 3)
    && !-[NSString isEqual:](detectedName, "isEqual:"))
  {
    goto LABEL_34;
  }
  effectiveName = self->_effectiveName;
  if ((unint64_t)effectiveName | *((void *)v4 + 4)) {
    char v9 = -[NSString isEqual:](effectiveName, "isEqual:");
  }
  else {
    char v9 = 1;
  }
LABEL_35:

  return v9;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    unint64_t v3 = 2654435761u * self->_timestamp;
    if ((*(unsigned char *)&self->_has & 0x10) != 0) {
      goto LABEL_3;
    }
  }
  else
  {
    unint64_t v3 = 0;
    if ((*(unsigned char *)&self->_has & 0x10) != 0)
    {
LABEL_3:
      uint64_t v4 = 2654435761 * self->_type;
      goto LABEL_6;
    }
  }
  uint64_t v4 = 0;
LABEL_6:
  NSUInteger v5 = [(NSString *)self->_name hash];
  if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    unint64_t v6 = 0;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_8;
    }
LABEL_11:
    uint64_t v7 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_9;
    }
LABEL_12:
    uint64_t v8 = 0;
    goto LABEL_13;
  }
  unint64_t v6 = 2654435761u * self->_value;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_11;
  }
LABEL_8:
  uint64_t v7 = 2654435761 * self->_status;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_12;
  }
LABEL_9:
  uint64_t v8 = 2654435761 * self->_state;
LABEL_13:
  unint64_t v9 = v4 ^ v3 ^ v6 ^ v7 ^ v8 ^ v5;
  NSUInteger v10 = [(NSString *)self->_detectedName hash];
  return v9 ^ v10 ^ [(NSString *)self->_effectiveName hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 60);
  if (v5)
  {
    self->_timestamp = *((void *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
    char v5 = *((unsigned char *)v4 + 60);
  }
  if ((v5 & 0x10) != 0)
  {
    self->_int type = *((_DWORD *)v4 + 14);
    *(unsigned char *)&self->_has |= 0x10u;
  }
  id v7 = v4;
  if (*((void *)v4 + 5))
  {
    -[AWDSymptomsDiagnosticIncidentEvent setName:](self, "setName:");
    id v4 = v7;
  }
  char v6 = *((unsigned char *)v4 + 60);
  if ((v6 & 2) != 0)
  {
    self->_value = *((void *)v4 + 2);
    *(unsigned char *)&self->_has |= 2u;
    char v6 = *((unsigned char *)v4 + 60);
    if ((v6 & 8) == 0)
    {
LABEL_9:
      if ((v6 & 4) == 0) {
        goto LABEL_11;
      }
      goto LABEL_10;
    }
  }
  else if ((*((unsigned char *)v4 + 60) & 8) == 0)
  {
    goto LABEL_9;
  }
  self->_status = *((_DWORD *)v4 + 13);
  *(unsigned char *)&self->_has |= 8u;
  if ((*((unsigned char *)v4 + 60) & 4) != 0)
  {
LABEL_10:
    self->_int state = *((_DWORD *)v4 + 12);
    *(unsigned char *)&self->_has |= 4u;
  }
LABEL_11:
  if (*((void *)v4 + 3))
  {
    -[AWDSymptomsDiagnosticIncidentEvent setDetectedName:](self, "setDetectedName:");
    id v4 = v7;
  }
  if (*((void *)v4 + 4))
  {
    -[AWDSymptomsDiagnosticIncidentEvent setEffectiveName:](self, "setEffectiveName:");
    id v4 = v7;
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (unint64_t)value
{
  return self->_value;
}

- (NSString)detectedName
{
  return self->_detectedName;
}

- (void)setDetectedName:(id)a3
{
}

- (NSString)effectiveName
{
  return self->_effectiveName;
}

- (void)setEffectiveName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_effectiveName, 0);

  objc_storeStrong((id *)&self->_detectedName, 0);
}

@end
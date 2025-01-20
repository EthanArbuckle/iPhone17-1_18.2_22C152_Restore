@interface HMImmutableSettingsProtoBoundedIntegerSettingEvent
- (BOOL)hasMaxValue;
- (BOOL)hasMinValue;
- (BOOL)hasStepValue;
- (BOOL)hasValue;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (HMImmutableSettingsProtoIntegerValueEvent)value;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int64_t)maxValue;
- (int64_t)minValue;
- (int64_t)stepValue;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasMaxValue:(BOOL)a3;
- (void)setHasMinValue:(BOOL)a3;
- (void)setHasStepValue:(BOOL)a3;
- (void)setMaxValue:(int64_t)a3;
- (void)setMinValue:(int64_t)a3;
- (void)setStepValue:(int64_t)a3;
- (void)setValue:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation HMImmutableSettingsProtoBoundedIntegerSettingEvent

- (void).cxx_destruct
{
}

- (int64_t)stepValue
{
  return self->_stepValue;
}

- (int64_t)maxValue
{
  return self->_maxValue;
}

- (int64_t)minValue
{
  return self->_minValue;
}

- (void)setValue:(id)a3
{
}

- (HMImmutableSettingsProtoIntegerValueEvent)value
{
  return self->_value;
}

- (void)mergeFrom:(id)a3
{
  v4 = a3;
  value = self->_value;
  uint64_t v6 = v4[4];
  if (value)
  {
    if (!v6) {
      goto LABEL_7;
    }
    v8 = v4;
    value = (HMImmutableSettingsProtoIntegerValueEvent *)-[HMImmutableSettingsProtoIntegerValueEvent mergeFrom:](value, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    v8 = v4;
    value = (HMImmutableSettingsProtoIntegerValueEvent *)-[HMImmutableSettingsProtoBoundedIntegerSettingEvent setValue:](self, "setValue:");
  }
  v4 = v8;
LABEL_7:
  char v7 = *((unsigned char *)v4 + 40);
  if ((v7 & 2) != 0)
  {
    self->_minValue = v4[2];
    *(unsigned char *)&self->_has |= 2u;
    char v7 = *((unsigned char *)v4 + 40);
    if ((v7 & 1) == 0)
    {
LABEL_9:
      if ((v7 & 4) == 0) {
        goto LABEL_11;
      }
      goto LABEL_10;
    }
  }
  else if ((v4[5] & 1) == 0)
  {
    goto LABEL_9;
  }
  self->_maxValue = v4[1];
  *(unsigned char *)&self->_has |= 1u;
  if ((v4[5] & 4) != 0)
  {
LABEL_10:
    self->_stepValue = v4[3];
    *(unsigned char *)&self->_has |= 4u;
  }
LABEL_11:

  MEMORY[0x1F41817F8](value, v4);
}

- (unint64_t)hash
{
  unint64_t v3 = [(HMImmutableSettingsProtoIntegerValueEvent *)self->_value hash];
  if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    uint64_t v4 = 0;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v5 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_4;
    }
LABEL_7:
    uint64_t v6 = 0;
    return v4 ^ v3 ^ v5 ^ v6;
  }
  uint64_t v4 = 2654435761 * self->_minValue;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v5 = 2654435761 * self->_maxValue;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v6 = 2654435761 * self->_stepValue;
  return v4 ^ v3 ^ v5 ^ v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_18;
  }
  value = self->_value;
  if ((unint64_t)value | *((void *)v4 + 4))
  {
    if (!-[HMImmutableSettingsProtoIntegerValueEvent isEqual:](value, "isEqual:")) {
      goto LABEL_18;
    }
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 40) & 2) == 0 || self->_minValue != *((void *)v4 + 2)) {
      goto LABEL_18;
    }
  }
  else if ((*((unsigned char *)v4 + 40) & 2) != 0)
  {
LABEL_18:
    BOOL v6 = 0;
    goto LABEL_19;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 40) & 1) == 0 || self->_maxValue != *((void *)v4 + 1)) {
      goto LABEL_18;
    }
  }
  else if (*((unsigned char *)v4 + 40))
  {
    goto LABEL_18;
  }
  BOOL v6 = (*((unsigned char *)v4 + 40) & 4) == 0;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 40) & 4) == 0 || self->_stepValue != *((void *)v4 + 3)) {
      goto LABEL_18;
    }
    BOOL v6 = 1;
  }
LABEL_19:

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(HMImmutableSettingsProtoIntegerValueEvent *)self->_value copyWithZone:a3];
  char v7 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v6;

  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
    if ((*(unsigned char *)&self->_has & 1) == 0) {
      goto LABEL_3;
    }
LABEL_7:
    *(void *)(v5 + 8) = self->_maxValue;
    *(unsigned char *)(v5 + 40) |= 1u;
    if ((*(unsigned char *)&self->_has & 4) == 0) {
      return (id)v5;
    }
    goto LABEL_4;
  }
  *(void *)(v5 + 16) = self->_minValue;
  *(unsigned char *)(v5 + 40) |= 2u;
  char has = (char)self->_has;
  if (has) {
    goto LABEL_7;
  }
LABEL_3:
  if ((has & 4) != 0)
  {
LABEL_4:
    *(void *)(v5 + 24) = self->_stepValue;
    *(unsigned char *)(v5 + 40) |= 4u;
  }
  return (id)v5;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (self->_value)
  {
    id v6 = v4;
    objc_msgSend(v4, "setValue:");
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((void *)v4 + 2) = self->_minValue;
    *((unsigned char *)v4 + 40) |= 2u;
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_5:
      if ((has & 4) == 0) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_5;
  }
  *((void *)v4 + 1) = self->_maxValue;
  *((unsigned char *)v4 + 40) |= 1u;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_6:
    *((void *)v4 + 3) = self->_stepValue;
    *((unsigned char *)v4 + 40) |= 4u;
  }
LABEL_7:
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_value)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt64Field();
    id v4 = v6;
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_5:
      if ((has & 4) == 0) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteInt64Field();
  id v4 = v6;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_6:
    PBDataWriterWriteInt64Field();
    id v4 = v6;
  }
LABEL_7:
}

- (BOOL)readFrom:(id)a3
{
  return HMImmutableSettingsProtoBoundedIntegerSettingEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  unint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  value = self->_value;
  if (value)
  {
    uint64_t v5 = [(HMImmutableSettingsProtoIntegerValueEvent *)value dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"value"];
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v9 = [NSNumber numberWithLongLong:self->_minValue];
    [v3 setObject:v9 forKey:@"minValue"];

    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_5:
      if ((has & 4) == 0) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_5;
  }
  v10 = [NSNumber numberWithLongLong:self->_maxValue];
  [v3 setObject:v10 forKey:@"maxValue"];

  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_6:
    char v7 = [NSNumber numberWithLongLong:self->_stepValue];
    [v3 setObject:v7 forKey:@"stepValue"];
  }
LABEL_7:

  return v3;
}

- (id)description
{
  unint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HMImmutableSettingsProtoBoundedIntegerSettingEvent;
  id v4 = [(HMImmutableSettingsProtoBoundedIntegerSettingEvent *)&v8 description];
  uint64_t v5 = [(HMImmutableSettingsProtoBoundedIntegerSettingEvent *)self dictionaryRepresentation];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasStepValue
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setHasStepValue:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (void)setStepValue:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_stepValue = a3;
}

- (BOOL)hasMaxValue
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasMaxValue:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setMaxValue:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_maxValue = a3;
}

- (BOOL)hasMinValue
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHasMinValue:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (void)setMinValue:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_minValue = a3;
}

- (BOOL)hasValue
{
  return self->_value != 0;
}

@end
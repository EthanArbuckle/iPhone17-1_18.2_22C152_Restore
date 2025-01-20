@interface HMImmutableSettingsProtoValueEvent
- (BOOL)hasBoolValueEvent;
- (BOOL)hasIntegerValueEvent;
- (BOOL)hasLanguageValueEvent;
- (BOOL)hasSettingValueEvent;
- (BOOL)hasStringValueEvent;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (HMImmutableSettingsProtoBoolValueEvent)BOOLValueEvent;
- (HMImmutableSettingsProtoIntegerValueEvent)integerValueEvent;
- (HMImmutableSettingsProtoLanguageValueEvent)languageValueEvent;
- (HMImmutableSettingsProtoStringValueEvent)stringValueEvent;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)settingValueEventAsString:(int)a3;
- (int)StringAsSettingValueEvent:(id)a3;
- (int)settingValueEvent;
- (unint64_t)hash;
- (void)clearOneofValuesForSettingValueEvent;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setBoolValueEvent:(id)a3;
- (void)setHasSettingValueEvent:(BOOL)a3;
- (void)setIntegerValueEvent:(id)a3;
- (void)setLanguageValueEvent:(id)a3;
- (void)setSettingValueEvent:(int)a3;
- (void)setStringValueEvent:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation HMImmutableSettingsProtoValueEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stringValueEvent, 0);
  objc_storeStrong((id *)&self->_languageValueEvent, 0);
  objc_storeStrong((id *)&self->_integerValueEvent, 0);

  objc_storeStrong((id *)&self->_BOOLValueEvent, 0);
}

- (HMImmutableSettingsProtoLanguageValueEvent)languageValueEvent
{
  return self->_languageValueEvent;
}

- (HMImmutableSettingsProtoBoolValueEvent)BOOLValueEvent
{
  return self->_BOOLValueEvent;
}

- (HMImmutableSettingsProtoIntegerValueEvent)integerValueEvent
{
  return self->_integerValueEvent;
}

- (HMImmutableSettingsProtoStringValueEvent)stringValueEvent
{
  return self->_stringValueEvent;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (*((unsigned char *)v4 + 48))
  {
    self->_settingValueEvent = *((_DWORD *)v4 + 8);
    *(unsigned char *)&self->_has |= 1u;
  }
  stringValueEvent = self->_stringValueEvent;
  uint64_t v7 = v5[5];
  v14 = v5;
  if (stringValueEvent)
  {
    if (!v7) {
      goto LABEL_9;
    }
    -[HMImmutableSettingsProtoStringValueEvent mergeFrom:](stringValueEvent, "mergeFrom:");
  }
  else
  {
    if (!v7) {
      goto LABEL_9;
    }
    -[HMImmutableSettingsProtoValueEvent setStringValueEvent:](self, "setStringValueEvent:");
  }
  v5 = v14;
LABEL_9:
  integerValueEvent = self->_integerValueEvent;
  uint64_t v9 = v5[2];
  if (integerValueEvent)
  {
    if (!v9) {
      goto LABEL_15;
    }
    -[HMImmutableSettingsProtoIntegerValueEvent mergeFrom:](integerValueEvent, "mergeFrom:");
  }
  else
  {
    if (!v9) {
      goto LABEL_15;
    }
    -[HMImmutableSettingsProtoValueEvent setIntegerValueEvent:](self, "setIntegerValueEvent:");
  }
  v5 = v14;
LABEL_15:
  BOOLValueEvent = self->_BOOLValueEvent;
  uint64_t v11 = v5[1];
  if (BOOLValueEvent)
  {
    if (!v11) {
      goto LABEL_21;
    }
    -[HMImmutableSettingsProtoBoolValueEvent mergeFrom:](BOOLValueEvent, "mergeFrom:");
  }
  else
  {
    if (!v11) {
      goto LABEL_21;
    }
    -[HMImmutableSettingsProtoValueEvent setBoolValueEvent:](self, "setBoolValueEvent:");
  }
  v5 = v14;
LABEL_21:
  languageValueEvent = self->_languageValueEvent;
  uint64_t v13 = v5[3];
  if (languageValueEvent)
  {
    if (!v13) {
      goto LABEL_27;
    }
    languageValueEvent = (HMImmutableSettingsProtoLanguageValueEvent *)-[HMImmutableSettingsProtoLanguageValueEvent mergeFrom:](languageValueEvent, "mergeFrom:");
  }
  else
  {
    if (!v13) {
      goto LABEL_27;
    }
    languageValueEvent = (HMImmutableSettingsProtoLanguageValueEvent *)-[HMImmutableSettingsProtoValueEvent setLanguageValueEvent:](self, "setLanguageValueEvent:");
  }
  v5 = v14;
LABEL_27:

  MEMORY[0x1F41817F8](languageValueEvent, v5);
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v3 = 2654435761 * self->_settingValueEvent;
  }
  else {
    uint64_t v3 = 0;
  }
  unint64_t v4 = [(HMImmutableSettingsProtoStringValueEvent *)self->_stringValueEvent hash] ^ v3;
  unint64_t v5 = [(HMImmutableSettingsProtoIntegerValueEvent *)self->_integerValueEvent hash];
  unint64_t v6 = v4 ^ v5 ^ [(HMImmutableSettingsProtoBoolValueEvent *)self->_BOOLValueEvent hash];
  return v6 ^ [(HMImmutableSettingsProtoLanguageValueEvent *)self->_languageValueEvent hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_15;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 48) & 1) == 0 || self->_settingValueEvent != *((_DWORD *)v4 + 8)) {
      goto LABEL_15;
    }
  }
  else if (*((unsigned char *)v4 + 48))
  {
LABEL_15:
    char v9 = 0;
    goto LABEL_16;
  }
  stringValueEvent = self->_stringValueEvent;
  if ((unint64_t)stringValueEvent | *((void *)v4 + 5)
    && !-[HMImmutableSettingsProtoStringValueEvent isEqual:](stringValueEvent, "isEqual:"))
  {
    goto LABEL_15;
  }
  integerValueEvent = self->_integerValueEvent;
  if ((unint64_t)integerValueEvent | *((void *)v4 + 2))
  {
    if (!-[HMImmutableSettingsProtoIntegerValueEvent isEqual:](integerValueEvent, "isEqual:")) {
      goto LABEL_15;
    }
  }
  BOOLValueEvent = self->_BOOLValueEvent;
  if ((unint64_t)BOOLValueEvent | *((void *)v4 + 1))
  {
    if (!-[HMImmutableSettingsProtoBoolValueEvent isEqual:](BOOLValueEvent, "isEqual:")) {
      goto LABEL_15;
    }
  }
  languageValueEvent = self->_languageValueEvent;
  if ((unint64_t)languageValueEvent | *((void *)v4 + 3)) {
    char v9 = -[HMImmutableSettingsProtoLanguageValueEvent isEqual:](languageValueEvent, "isEqual:");
  }
  else {
    char v9 = 1;
  }
LABEL_16:

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  unint64_t v6 = (void *)v5;
  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 32) = self->_settingValueEvent;
    *(unsigned char *)(v5 + 48) |= 1u;
  }
  id v7 = [(HMImmutableSettingsProtoStringValueEvent *)self->_stringValueEvent copyWithZone:a3];
  v8 = (void *)v6[5];
  v6[5] = v7;

  id v9 = [(HMImmutableSettingsProtoIntegerValueEvent *)self->_integerValueEvent copyWithZone:a3];
  v10 = (void *)v6[2];
  v6[2] = v9;

  id v11 = [(HMImmutableSettingsProtoBoolValueEvent *)self->_BOOLValueEvent copyWithZone:a3];
  v12 = (void *)v6[1];
  v6[1] = v11;

  id v13 = [(HMImmutableSettingsProtoLanguageValueEvent *)self->_languageValueEvent copyWithZone:a3];
  v14 = (void *)v6[3];
  v6[3] = v13;

  return v6;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has)
  {
    v4[8] = self->_settingValueEvent;
    *((unsigned char *)v4 + 48) |= 1u;
  }
  uint64_t v5 = v4;
  if (self->_stringValueEvent)
  {
    objc_msgSend(v4, "setStringValueEvent:");
    id v4 = v5;
  }
  if (self->_integerValueEvent)
  {
    objc_msgSend(v5, "setIntegerValueEvent:");
    id v4 = v5;
  }
  if (self->_BOOLValueEvent)
  {
    objc_msgSend(v5, "setBoolValueEvent:");
    id v4 = v5;
  }
  if (self->_languageValueEvent)
  {
    objc_msgSend(v5, "setLanguageValueEvent:");
    id v4 = v5;
  }
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_stringValueEvent)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_integerValueEvent)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_BOOLValueEvent)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_languageValueEvent)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
}

- (BOOL)readFrom:(id)a3
{
  return HMImmutableSettingsProtoValueEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  stringValueEvent = self->_stringValueEvent;
  if (stringValueEvent)
  {
    id v5 = [(HMImmutableSettingsProtoStringValueEvent *)stringValueEvent dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"stringValueEvent"];
  }
  integerValueEvent = self->_integerValueEvent;
  if (integerValueEvent)
  {
    id v7 = [(HMImmutableSettingsProtoIntegerValueEvent *)integerValueEvent dictionaryRepresentation];
    [v3 setObject:v7 forKey:@"integerValueEvent"];
  }
  BOOLValueEvent = self->_BOOLValueEvent;
  if (BOOLValueEvent)
  {
    id v9 = [(HMImmutableSettingsProtoBoolValueEvent *)BOOLValueEvent dictionaryRepresentation];
    [v3 setObject:v9 forKey:@"BOOLValueEvent"];
  }
  languageValueEvent = self->_languageValueEvent;
  if (languageValueEvent)
  {
    id v11 = [(HMImmutableSettingsProtoLanguageValueEvent *)languageValueEvent dictionaryRepresentation];
    [v3 setObject:v11 forKey:@"languageValueEvent"];
  }
  if (*(unsigned char *)&self->_has)
  {
    uint64_t settingValueEvent = self->_settingValueEvent;
    if (settingValueEvent >= 5)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_settingValueEvent);
      id v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v13 = off_1E5943B28[settingValueEvent];
    }
    [v3 setObject:v13 forKey:@"SettingValueEvent"];
  }

  return v3;
}

- (id)description
{
  uint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HMImmutableSettingsProtoValueEvent;
  id v4 = [(HMImmutableSettingsProtoValueEvent *)&v8 description];
  id v5 = [(HMImmutableSettingsProtoValueEvent *)self dictionaryRepresentation];
  unint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (void)clearOneofValuesForSettingValueEvent
{
  *(unsigned char *)&self->_has &= ~1u;
  self->_uint64_t settingValueEvent = 0;
  stringValueEvent = self->_stringValueEvent;
  self->_stringValueEvent = 0;

  integerValueEvent = self->_integerValueEvent;
  self->_integerValueEvent = 0;

  BOOLValueEvent = self->_BOOLValueEvent;
  self->_BOOLValueEvent = 0;

  languageValueEvent = self->_languageValueEvent;
  self->_languageValueEvent = 0;
}

- (int)StringAsSettingValueEvent:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"PBUNSET"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"stringValueEvent"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"integerValueEvent"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"BOOLValueEvent"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"languageValueEvent"])
  {
    int v4 = 4;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)settingValueEventAsString:(int)a3
{
  if (a3 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E5943B28[a3];
  }

  return v3;
}

- (BOOL)hasSettingValueEvent
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasSettingValueEvent:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setSettingValueEvent:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_uint64_t settingValueEvent = a3;
}

- (int)settingValueEvent
{
  if (*(unsigned char *)&self->_has) {
    return self->_settingValueEvent;
  }
  else {
    return 0;
  }
}

- (void)setLanguageValueEvent:(id)a3
{
  int v4 = (HMImmutableSettingsProtoLanguageValueEvent *)a3;
  [(HMImmutableSettingsProtoValueEvent *)self clearOneofValuesForSettingValueEvent];
  *(unsigned char *)&self->_has |= 1u;
  self->_uint64_t settingValueEvent = 4;
  languageValueEvent = self->_languageValueEvent;
  self->_languageValueEvent = v4;
}

- (BOOL)hasLanguageValueEvent
{
  return self->_languageValueEvent != 0;
}

- (void)setBoolValueEvent:(id)a3
{
  int v4 = (HMImmutableSettingsProtoBoolValueEvent *)a3;
  [(HMImmutableSettingsProtoValueEvent *)self clearOneofValuesForSettingValueEvent];
  *(unsigned char *)&self->_has |= 1u;
  self->_uint64_t settingValueEvent = 3;
  BOOLValueEvent = self->_BOOLValueEvent;
  self->_BOOLValueEvent = v4;
}

- (BOOL)hasBoolValueEvent
{
  return self->_BOOLValueEvent != 0;
}

- (void)setIntegerValueEvent:(id)a3
{
  int v4 = (HMImmutableSettingsProtoIntegerValueEvent *)a3;
  [(HMImmutableSettingsProtoValueEvent *)self clearOneofValuesForSettingValueEvent];
  *(unsigned char *)&self->_has |= 1u;
  self->_uint64_t settingValueEvent = 2;
  integerValueEvent = self->_integerValueEvent;
  self->_integerValueEvent = v4;
}

- (BOOL)hasIntegerValueEvent
{
  return self->_integerValueEvent != 0;
}

- (void)setStringValueEvent:(id)a3
{
  int v4 = (HMImmutableSettingsProtoStringValueEvent *)a3;
  [(HMImmutableSettingsProtoValueEvent *)self clearOneofValuesForSettingValueEvent];
  *(unsigned char *)&self->_has |= 1u;
  self->_uint64_t settingValueEvent = 1;
  stringValueEvent = self->_stringValueEvent;
  self->_stringValueEvent = v4;
}

- (BOOL)hasStringValueEvent
{
  return self->_stringValueEvent != 0;
}

@end
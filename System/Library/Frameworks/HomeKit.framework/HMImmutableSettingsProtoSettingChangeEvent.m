@interface HMImmutableSettingsProtoSettingChangeEvent
- (BOOL)hasAvailableLanguages;
- (BOOL)hasBoolSetting;
- (BOOL)hasBoundedIntegerSetting;
- (BOOL)hasKeyPath;
- (BOOL)hasLanguageSetting;
- (BOOL)hasReadOnly;
- (BOOL)hasSettingChangeEvent;
- (BOOL)hasStringSetting;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)readOnly;
- (HMImmutableSettingsProtoAvailableLanguageListEvent)availableLanguages;
- (HMImmutableSettingsProtoBoolSettingEvent)BOOLSetting;
- (HMImmutableSettingsProtoBoundedIntegerSettingEvent)boundedIntegerSetting;
- (HMImmutableSettingsProtoLanguageSettingEvent)languageSetting;
- (HMImmutableSettingsProtoStringSettingEvent)stringSetting;
- (NSString)keyPath;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)settingChangeEventAsString:(int)a3;
- (int)StringAsSettingChangeEvent:(id)a3;
- (int)settingChangeEvent;
- (unint64_t)hash;
- (void)clearOneofValuesForSettingChangeEvent;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAvailableLanguages:(id)a3;
- (void)setBoolSetting:(id)a3;
- (void)setBoundedIntegerSetting:(id)a3;
- (void)setHasReadOnly:(BOOL)a3;
- (void)setHasSettingChangeEvent:(BOOL)a3;
- (void)setKeyPath:(id)a3;
- (void)setLanguageSetting:(id)a3;
- (void)setReadOnly:(BOOL)a3;
- (void)setSettingChangeEvent:(int)a3;
- (void)setStringSetting:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation HMImmutableSettingsProtoSettingChangeEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stringSetting, 0);
  objc_storeStrong((id *)&self->_languageSetting, 0);
  objc_storeStrong((id *)&self->_keyPath, 0);
  objc_storeStrong((id *)&self->_boundedIntegerSetting, 0);
  objc_storeStrong((id *)&self->_BOOLSetting, 0);

  objc_storeStrong((id *)&self->_availableLanguages, 0);
}

- (HMImmutableSettingsProtoAvailableLanguageListEvent)availableLanguages
{
  return self->_availableLanguages;
}

- (HMImmutableSettingsProtoLanguageSettingEvent)languageSetting
{
  return self->_languageSetting;
}

- (HMImmutableSettingsProtoBoolSettingEvent)BOOLSetting
{
  return self->_BOOLSetting;
}

- (HMImmutableSettingsProtoBoundedIntegerSettingEvent)boundedIntegerSetting
{
  return self->_boundedIntegerSetting;
}

- (HMImmutableSettingsProtoStringSettingEvent)stringSetting
{
  return self->_stringSetting;
}

- (BOOL)readOnly
{
  return self->_readOnly;
}

- (void)setKeyPath:(id)a3
{
}

- (NSString)keyPath
{
  return self->_keyPath;
}

- (void)mergeFrom:(id)a3
{
  v4 = a3;
  v5 = v4;
  if (v4[17])
  {
    self->_settingChangeEvent = v4[12];
    *(unsigned char *)&self->_has |= 1u;
  }
  v16 = v4;
  if (*((void *)v4 + 4))
  {
    -[HMImmutableSettingsProtoSettingChangeEvent setKeyPath:](self, "setKeyPath:");
    v5 = v16;
  }
  if ((v5[17] & 2) != 0)
  {
    self->_readOnly = *((unsigned char *)v5 + 64);
    *(unsigned char *)&self->_has |= 2u;
  }
  stringSetting = self->_stringSetting;
  uint64_t v7 = *((void *)v5 + 7);
  if (stringSetting)
  {
    if (!v7) {
      goto LABEL_13;
    }
    -[HMImmutableSettingsProtoStringSettingEvent mergeFrom:](stringSetting, "mergeFrom:");
  }
  else
  {
    if (!v7) {
      goto LABEL_13;
    }
    -[HMImmutableSettingsProtoSettingChangeEvent setStringSetting:](self, "setStringSetting:");
  }
  v5 = v16;
LABEL_13:
  boundedIntegerSetting = self->_boundedIntegerSetting;
  uint64_t v9 = *((void *)v5 + 3);
  if (boundedIntegerSetting)
  {
    if (!v9) {
      goto LABEL_19;
    }
    -[HMImmutableSettingsProtoBoundedIntegerSettingEvent mergeFrom:](boundedIntegerSetting, "mergeFrom:");
  }
  else
  {
    if (!v9) {
      goto LABEL_19;
    }
    -[HMImmutableSettingsProtoSettingChangeEvent setBoundedIntegerSetting:](self, "setBoundedIntegerSetting:");
  }
  v5 = v16;
LABEL_19:
  BOOLSetting = self->_BOOLSetting;
  uint64_t v11 = *((void *)v5 + 2);
  if (BOOLSetting)
  {
    if (!v11) {
      goto LABEL_25;
    }
    -[HMImmutableSettingsProtoBoolSettingEvent mergeFrom:](BOOLSetting, "mergeFrom:");
  }
  else
  {
    if (!v11) {
      goto LABEL_25;
    }
    -[HMImmutableSettingsProtoSettingChangeEvent setBoolSetting:](self, "setBoolSetting:");
  }
  v5 = v16;
LABEL_25:
  languageSetting = self->_languageSetting;
  uint64_t v13 = *((void *)v5 + 5);
  if (languageSetting)
  {
    if (!v13) {
      goto LABEL_31;
    }
    -[HMImmutableSettingsProtoLanguageSettingEvent mergeFrom:](languageSetting, "mergeFrom:");
  }
  else
  {
    if (!v13) {
      goto LABEL_31;
    }
    -[HMImmutableSettingsProtoSettingChangeEvent setLanguageSetting:](self, "setLanguageSetting:");
  }
  v5 = v16;
LABEL_31:
  availableLanguages = self->_availableLanguages;
  uint64_t v15 = *((void *)v5 + 1);
  if (availableLanguages)
  {
    if (!v15) {
      goto LABEL_37;
    }
    availableLanguages = (HMImmutableSettingsProtoAvailableLanguageListEvent *)-[HMImmutableSettingsProtoAvailableLanguageListEvent mergeFrom:](availableLanguages, "mergeFrom:");
  }
  else
  {
    if (!v15) {
      goto LABEL_37;
    }
    availableLanguages = (HMImmutableSettingsProtoAvailableLanguageListEvent *)-[HMImmutableSettingsProtoSettingChangeEvent setAvailableLanguages:](self, "setAvailableLanguages:");
  }
  v5 = v16;
LABEL_37:

  MEMORY[0x1F41817F8](availableLanguages, v5);
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v3 = 2654435761 * self->_settingChangeEvent;
  }
  else {
    uint64_t v3 = 0;
  }
  NSUInteger v4 = [(NSString *)self->_keyPath hash];
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v5 = 2654435761 * self->_readOnly;
  }
  else {
    uint64_t v5 = 0;
  }
  unint64_t v6 = v4 ^ v3 ^ v5 ^ [(HMImmutableSettingsProtoStringSettingEvent *)self->_stringSetting hash];
  unint64_t v7 = [(HMImmutableSettingsProtoBoundedIntegerSettingEvent *)self->_boundedIntegerSetting hash];
  unint64_t v8 = v7 ^ [(HMImmutableSettingsProtoBoolSettingEvent *)self->_BOOLSetting hash];
  unint64_t v9 = v6 ^ v8 ^ [(HMImmutableSettingsProtoLanguageSettingEvent *)self->_languageSetting hash];
  return v9 ^ [(HMImmutableSettingsProtoAvailableLanguageListEvent *)self->_availableLanguages hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_28;
  }
  char has = (char)self->_has;
  char v6 = *((unsigned char *)v4 + 68);
  if (has)
  {
    if ((*((unsigned char *)v4 + 68) & 1) == 0 || self->_settingChangeEvent != *((_DWORD *)v4 + 12)) {
      goto LABEL_28;
    }
  }
  else if (*((unsigned char *)v4 + 68))
  {
    goto LABEL_28;
  }
  keyPath = self->_keyPath;
  if ((unint64_t)keyPath | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](keyPath, "isEqual:")) {
      goto LABEL_28;
    }
    char has = (char)self->_has;
    char v6 = *((unsigned char *)v4 + 68);
  }
  if ((has & 2) != 0)
  {
    if ((v6 & 2) != 0)
    {
      if (self->_readOnly)
      {
        if (!*((unsigned char *)v4 + 64)) {
          goto LABEL_28;
        }
        goto LABEL_18;
      }
      if (!*((unsigned char *)v4 + 64)) {
        goto LABEL_18;
      }
    }
LABEL_28:
    char v13 = 0;
    goto LABEL_29;
  }
  if ((v6 & 2) != 0) {
    goto LABEL_28;
  }
LABEL_18:
  stringSetting = self->_stringSetting;
  if ((unint64_t)stringSetting | *((void *)v4 + 7)
    && !-[HMImmutableSettingsProtoStringSettingEvent isEqual:](stringSetting, "isEqual:"))
  {
    goto LABEL_28;
  }
  boundedIntegerSetting = self->_boundedIntegerSetting;
  if ((unint64_t)boundedIntegerSetting | *((void *)v4 + 3))
  {
    if (!-[HMImmutableSettingsProtoBoundedIntegerSettingEvent isEqual:](boundedIntegerSetting, "isEqual:")) {
      goto LABEL_28;
    }
  }
  BOOLSetting = self->_BOOLSetting;
  if ((unint64_t)BOOLSetting | *((void *)v4 + 2))
  {
    if (!-[HMImmutableSettingsProtoBoolSettingEvent isEqual:](BOOLSetting, "isEqual:")) {
      goto LABEL_28;
    }
  }
  languageSetting = self->_languageSetting;
  if ((unint64_t)languageSetting | *((void *)v4 + 5))
  {
    if (!-[HMImmutableSettingsProtoLanguageSettingEvent isEqual:](languageSetting, "isEqual:")) {
      goto LABEL_28;
    }
  }
  availableLanguages = self->_availableLanguages;
  if ((unint64_t)availableLanguages | *((void *)v4 + 1)) {
    char v13 = -[HMImmutableSettingsProtoAvailableLanguageListEvent isEqual:](availableLanguages, "isEqual:");
  }
  else {
    char v13 = 1;
  }
LABEL_29:

  return v13;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 48) = self->_settingChangeEvent;
    *(unsigned char *)(v5 + 68) |= 1u;
  }
  uint64_t v7 = [(NSString *)self->_keyPath copyWithZone:a3];
  unint64_t v8 = *(void **)(v6 + 32);
  *(void *)(v6 + 32) = v7;

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *(unsigned char *)(v6 + 64) = self->_readOnly;
    *(unsigned char *)(v6 + 68) |= 2u;
  }
  id v9 = [(HMImmutableSettingsProtoStringSettingEvent *)self->_stringSetting copyWithZone:a3];
  v10 = *(void **)(v6 + 56);
  *(void *)(v6 + 56) = v9;

  id v11 = [(HMImmutableSettingsProtoBoundedIntegerSettingEvent *)self->_boundedIntegerSetting copyWithZone:a3];
  v12 = *(void **)(v6 + 24);
  *(void *)(v6 + 24) = v11;

  id v13 = [(HMImmutableSettingsProtoBoolSettingEvent *)self->_BOOLSetting copyWithZone:a3];
  v14 = *(void **)(v6 + 16);
  *(void *)(v6 + 16) = v13;

  id v15 = [(HMImmutableSettingsProtoLanguageSettingEvent *)self->_languageSetting copyWithZone:a3];
  v16 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v15;

  id v17 = [(HMImmutableSettingsProtoAvailableLanguageListEvent *)self->_availableLanguages copyWithZone:a3];
  v18 = *(void **)(v6 + 8);
  *(void *)(v6 + 8) = v17;

  return (id)v6;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has)
  {
    v4[12] = self->_settingChangeEvent;
    *((unsigned char *)v4 + 68) |= 1u;
  }
  uint64_t v5 = v4;
  if (self->_keyPath)
  {
    objc_msgSend(v4, "setKeyPath:");
    id v4 = v5;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *((unsigned char *)v4 + 64) = self->_readOnly;
    *((unsigned char *)v4 + 68) |= 2u;
  }
  if (self->_stringSetting)
  {
    objc_msgSend(v5, "setStringSetting:");
    id v4 = v5;
  }
  if (self->_boundedIntegerSetting)
  {
    objc_msgSend(v5, "setBoundedIntegerSetting:");
    id v4 = v5;
  }
  if (self->_BOOLSetting)
  {
    objc_msgSend(v5, "setBoolSetting:");
    id v4 = v5;
  }
  if (self->_languageSetting)
  {
    objc_msgSend(v5, "setLanguageSetting:");
    id v4 = v5;
  }
  if (self->_availableLanguages)
  {
    objc_msgSend(v5, "setAvailableLanguages:");
    id v4 = v5;
  }
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_keyPath)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v5;
  }
  if (self->_stringSetting)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_boundedIntegerSetting)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_BOOLSetting)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_languageSetting)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_availableLanguages)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
}

- (BOOL)readFrom:(id)a3
{
  return HMImmutableSettingsProtoSettingChangeEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  keyPath = self->_keyPath;
  if (keyPath) {
    [v3 setObject:keyPath forKey:@"keyPath"];
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v6 = [NSNumber numberWithBool:self->_readOnly];
    [v4 setObject:v6 forKey:@"readOnly"];
  }
  stringSetting = self->_stringSetting;
  if (stringSetting)
  {
    unint64_t v8 = [(HMImmutableSettingsProtoStringSettingEvent *)stringSetting dictionaryRepresentation];
    [v4 setObject:v8 forKey:@"stringSetting"];
  }
  boundedIntegerSetting = self->_boundedIntegerSetting;
  if (boundedIntegerSetting)
  {
    v10 = [(HMImmutableSettingsProtoBoundedIntegerSettingEvent *)boundedIntegerSetting dictionaryRepresentation];
    [v4 setObject:v10 forKey:@"boundedIntegerSetting"];
  }
  BOOLSetting = self->_BOOLSetting;
  if (BOOLSetting)
  {
    v12 = [(HMImmutableSettingsProtoBoolSettingEvent *)BOOLSetting dictionaryRepresentation];
    [v4 setObject:v12 forKey:@"BOOLSetting"];
  }
  languageSetting = self->_languageSetting;
  if (languageSetting)
  {
    v14 = [(HMImmutableSettingsProtoLanguageSettingEvent *)languageSetting dictionaryRepresentation];
    [v4 setObject:v14 forKey:@"languageSetting"];
  }
  availableLanguages = self->_availableLanguages;
  if (availableLanguages)
  {
    v16 = [(HMImmutableSettingsProtoAvailableLanguageListEvent *)availableLanguages dictionaryRepresentation];
    [v4 setObject:v16 forKey:@"availableLanguages"];
  }
  if (*(unsigned char *)&self->_has)
  {
    uint64_t settingChangeEvent = self->_settingChangeEvent;
    if (settingChangeEvent >= 6)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_settingChangeEvent);
      v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v18 = off_1E5944228[settingChangeEvent];
    }
    [v4 setObject:v18 forKey:@"SettingChangeEvent"];
  }

  return v4;
}

- (id)description
{
  uint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HMImmutableSettingsProtoSettingChangeEvent;
  id v4 = [(HMImmutableSettingsProtoSettingChangeEvent *)&v8 description];
  id v5 = [(HMImmutableSettingsProtoSettingChangeEvent *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (void)clearOneofValuesForSettingChangeEvent
{
  *(unsigned char *)&self->_has &= ~1u;
  self->_uint64_t settingChangeEvent = 0;
  stringSetting = self->_stringSetting;
  self->_stringSetting = 0;

  boundedIntegerSetting = self->_boundedIntegerSetting;
  self->_boundedIntegerSetting = 0;

  BOOLSetting = self->_BOOLSetting;
  self->_BOOLSetting = 0;

  languageSetting = self->_languageSetting;
  self->_languageSetting = 0;

  availableLanguages = self->_availableLanguages;
  self->_availableLanguages = 0;
}

- (int)StringAsSettingChangeEvent:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"PBUNSET"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"stringSetting"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"boundedIntegerSetting"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"BOOLSetting"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"languageSetting"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"availableLanguages"])
  {
    int v4 = 5;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)settingChangeEventAsString:(int)a3
{
  if (a3 >= 6)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E5944228[a3];
  }

  return v3;
}

- (BOOL)hasSettingChangeEvent
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasSettingChangeEvent:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setSettingChangeEvent:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_uint64_t settingChangeEvent = a3;
}

- (int)settingChangeEvent
{
  if (*(unsigned char *)&self->_has) {
    return self->_settingChangeEvent;
  }
  else {
    return 0;
  }
}

- (void)setAvailableLanguages:(id)a3
{
  int v4 = (HMImmutableSettingsProtoAvailableLanguageListEvent *)a3;
  [(HMImmutableSettingsProtoSettingChangeEvent *)self clearOneofValuesForSettingChangeEvent];
  *(unsigned char *)&self->_has |= 1u;
  self->_uint64_t settingChangeEvent = 5;
  availableLanguages = self->_availableLanguages;
  self->_availableLanguages = v4;
}

- (BOOL)hasAvailableLanguages
{
  return self->_availableLanguages != 0;
}

- (void)setLanguageSetting:(id)a3
{
  int v4 = (HMImmutableSettingsProtoLanguageSettingEvent *)a3;
  [(HMImmutableSettingsProtoSettingChangeEvent *)self clearOneofValuesForSettingChangeEvent];
  *(unsigned char *)&self->_has |= 1u;
  self->_uint64_t settingChangeEvent = 4;
  languageSetting = self->_languageSetting;
  self->_languageSetting = v4;
}

- (BOOL)hasLanguageSetting
{
  return self->_languageSetting != 0;
}

- (void)setBoolSetting:(id)a3
{
  int v4 = (HMImmutableSettingsProtoBoolSettingEvent *)a3;
  [(HMImmutableSettingsProtoSettingChangeEvent *)self clearOneofValuesForSettingChangeEvent];
  *(unsigned char *)&self->_has |= 1u;
  self->_uint64_t settingChangeEvent = 3;
  BOOLSetting = self->_BOOLSetting;
  self->_BOOLSetting = v4;
}

- (BOOL)hasBoolSetting
{
  return self->_BOOLSetting != 0;
}

- (void)setBoundedIntegerSetting:(id)a3
{
  int v4 = (HMImmutableSettingsProtoBoundedIntegerSettingEvent *)a3;
  [(HMImmutableSettingsProtoSettingChangeEvent *)self clearOneofValuesForSettingChangeEvent];
  *(unsigned char *)&self->_has |= 1u;
  self->_uint64_t settingChangeEvent = 2;
  boundedIntegerSetting = self->_boundedIntegerSetting;
  self->_boundedIntegerSetting = v4;
}

- (BOOL)hasBoundedIntegerSetting
{
  return self->_boundedIntegerSetting != 0;
}

- (void)setStringSetting:(id)a3
{
  int v4 = (HMImmutableSettingsProtoStringSettingEvent *)a3;
  [(HMImmutableSettingsProtoSettingChangeEvent *)self clearOneofValuesForSettingChangeEvent];
  *(unsigned char *)&self->_has |= 1u;
  self->_uint64_t settingChangeEvent = 1;
  stringSetting = self->_stringSetting;
  self->_stringSetting = v4;
}

- (BOOL)hasStringSetting
{
  return self->_stringSetting != 0;
}

- (BOOL)hasReadOnly
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHasReadOnly:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (void)setReadOnly:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_readOnly = a3;
}

- (BOOL)hasKeyPath
{
  return self->_keyPath != 0;
}

@end
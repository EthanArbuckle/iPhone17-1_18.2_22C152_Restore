@interface _ADPBDeviceOutputVoiceInfo
- (AFVoiceInfo)_ad_voiceInfo;
- (BOOL)hasGender;
- (BOOL)hasLanguageCode;
- (BOOL)hasVoiceName;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)languageCode;
- (NSString)voiceName;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)genderAsString:(int)a3;
- (int)StringAsGender:(id)a3;
- (int)gender;
- (unint64_t)hash;
- (void)_ad_setVoiceInfo:(id)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setGender:(int)a3;
- (void)setHasGender:(BOOL)a3;
- (void)setLanguageCode:(id)a3;
- (void)setVoiceName:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _ADPBDeviceOutputVoiceInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_voiceName, 0);
  objc_storeStrong((id *)&self->_languageCode, 0);
}

- (void)setVoiceName:(id)a3
{
}

- (NSString)voiceName
{
  return self->_voiceName;
}

- (void)setLanguageCode:(id)a3
{
}

- (NSString)languageCode
{
  return self->_languageCode;
}

- (void)mergeFrom:(id)a3
{
  v4 = (int *)a3;
  v5 = v4;
  if (*((void *)v4 + 2))
  {
    -[_ADPBDeviceOutputVoiceInfo setLanguageCode:](self, "setLanguageCode:");
    v4 = v5;
  }
  if (v4[8])
  {
    self->_gender = v4[2];
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 3))
  {
    -[_ADPBDeviceOutputVoiceInfo setVoiceName:](self, "setVoiceName:");
    v4 = v5;
  }
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_languageCode hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v4 = 2654435761 * self->_gender;
  }
  else {
    uint64_t v4 = 0;
  }
  return v4 ^ v3 ^ [(NSString *)self->_voiceName hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_11;
  }
  languageCode = self->_languageCode;
  if ((unint64_t)languageCode | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](languageCode, "isEqual:")) {
      goto LABEL_11;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 32) & 1) == 0 || self->_gender != *((_DWORD *)v4 + 2)) {
      goto LABEL_11;
    }
  }
  else if (*((unsigned char *)v4 + 32))
  {
LABEL_11:
    unsigned __int8 v7 = 0;
    goto LABEL_12;
  }
  voiceName = self->_voiceName;
  if ((unint64_t)voiceName | *((void *)v4 + 3)) {
    unsigned __int8 v7 = -[NSString isEqual:](voiceName, "isEqual:");
  }
  else {
    unsigned __int8 v7 = 1;
  }
LABEL_12:

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(NSString *)self->_languageCode copyWithZone:a3];
  unsigned __int8 v7 = (void *)v5[2];
  v5[2] = v6;

  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v5 + 2) = self->_gender;
    *((unsigned char *)v5 + 32) |= 1u;
  }
  id v8 = [(NSString *)self->_voiceName copyWithZone:a3];
  v9 = (void *)v5[3];
  v5[3] = v8;

  return v5;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_languageCode)
  {
    objc_msgSend(v4, "setLanguageCode:");
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v4 + 2) = self->_gender;
    *((unsigned char *)v4 + 32) |= 1u;
  }
  if (self->_voiceName)
  {
    objc_msgSend(v5, "setVoiceName:");
    id v4 = v5;
  }
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_languageCode)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_voiceName)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (BOOL)readFrom:(id)a3
{
  return sub_100126FD8((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  NSUInteger v3 = +[NSMutableDictionary dictionary];
  id v4 = v3;
  languageCode = self->_languageCode;
  if (languageCode) {
    [v3 setObject:languageCode forKey:@"language_code"];
  }
  if (*(unsigned char *)&self->_has)
  {
    uint64_t gender = self->_gender;
    if (gender >= 4)
    {
      unsigned __int8 v7 = +[NSString stringWithFormat:@"(unknown: %i)", self->_gender];
    }
    else
    {
      unsigned __int8 v7 = *(&off_100502D50 + gender);
    }
    [v4 setObject:v7 forKey:@"gender"];
  }
  voiceName = self->_voiceName;
  if (voiceName) {
    [v4 setObject:voiceName forKey:@"voice_name"];
  }
  return v4;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)_ADPBDeviceOutputVoiceInfo;
  NSUInteger v3 = [(_ADPBDeviceOutputVoiceInfo *)&v7 description];
  id v4 = [(_ADPBDeviceOutputVoiceInfo *)self dictionaryRepresentation];
  id v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (BOOL)hasVoiceName
{
  return self->_voiceName != 0;
}

- (int)StringAsGender:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"MALE"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"FEMALE"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"NEUTRAL"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)genderAsString:(int)a3
{
  if (a3 >= 4)
  {
    id v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else
  {
    id v3 = *(&off_100502D50 + a3);
  }
  return v3;
}

- (BOOL)hasGender
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasGender:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setGender:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_uint64_t gender = a3;
}

- (int)gender
{
  if (*(unsigned char *)&self->_has) {
    return self->_gender;
  }
  else {
    return 0;
  }
}

- (BOOL)hasLanguageCode
{
  return self->_languageCode != 0;
}

- (void)_ad_setVoiceInfo:(id)a3
{
  id v8 = a3;
  int v4 = [v8 languageCode];
  [(_ADPBDeviceOutputVoiceInfo *)self setLanguageCode:v4];

  id v5 = (char *)[v8 gender] - 1;
  if ((unint64_t)v5 < 3) {
    uint64_t v6 = (v5 + 1);
  }
  else {
    uint64_t v6 = 0;
  }
  [(_ADPBDeviceOutputVoiceInfo *)self setGender:v6];
  objc_super v7 = [v8 name];
  [(_ADPBDeviceOutputVoiceInfo *)self setVoiceName:v7];
}

- (AFVoiceInfo)_ad_voiceInfo
{
  id v3 = objc_alloc((Class)AFVoiceInfo);
  int v4 = [(_ADPBDeviceOutputVoiceInfo *)self languageCode];
  uint64_t v5 = [(_ADPBDeviceOutputVoiceInfo *)self gender] - 1;
  if (v5 < 3) {
    uint64_t v6 = v5 + 1;
  }
  else {
    uint64_t v6 = 0;
  }
  objc_super v7 = [(_ADPBDeviceOutputVoiceInfo *)self voiceName];
  id v8 = [v3 initWithLanguageCode:v4 gender:v6 isCustom:1 name:v7 footprint:0 contentVersion:0 masteredVersion:0];

  return (AFVoiceInfo *)v8;
}

@end
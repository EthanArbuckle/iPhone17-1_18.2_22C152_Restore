@interface HMImmutableSettingsProtoLanguageValueEvent
- (BOOL)hasInputLanguageCode;
- (BOOL)hasOutputVoiceGenderCode;
- (BOOL)hasOutputVoiceLanguageCode;
- (BOOL)hasVoiceName;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)inputLanguageCode;
- (NSString)outputVoiceGenderCode;
- (NSString)outputVoiceLanguageCode;
- (NSString)voiceName;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setInputLanguageCode:(id)a3;
- (void)setOutputVoiceGenderCode:(id)a3;
- (void)setOutputVoiceLanguageCode:(id)a3;
- (void)setVoiceName:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation HMImmutableSettingsProtoLanguageValueEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_voiceName, 0);
  objc_storeStrong((id *)&self->_outputVoiceLanguageCode, 0);
  objc_storeStrong((id *)&self->_outputVoiceGenderCode, 0);

  objc_storeStrong((id *)&self->_inputLanguageCode, 0);
}

- (void)setVoiceName:(id)a3
{
}

- (NSString)voiceName
{
  return self->_voiceName;
}

- (void)setOutputVoiceGenderCode:(id)a3
{
}

- (NSString)outputVoiceGenderCode
{
  return self->_outputVoiceGenderCode;
}

- (void)setOutputVoiceLanguageCode:(id)a3
{
}

- (NSString)outputVoiceLanguageCode
{
  return self->_outputVoiceLanguageCode;
}

- (void)setInputLanguageCode:(id)a3
{
}

- (NSString)inputLanguageCode
{
  return self->_inputLanguageCode;
}

- (void)mergeFrom:(id)a3
{
  v4 = a3;
  if (v4[1]) {
    -[HMImmutableSettingsProtoLanguageValueEvent setInputLanguageCode:](self, "setInputLanguageCode:");
  }
  if (v4[3]) {
    -[HMImmutableSettingsProtoLanguageValueEvent setOutputVoiceLanguageCode:](self, "setOutputVoiceLanguageCode:");
  }
  if (v4[2]) {
    -[HMImmutableSettingsProtoLanguageValueEvent setOutputVoiceGenderCode:](self, "setOutputVoiceGenderCode:");
  }
  if (v4[4]) {
    -[HMImmutableSettingsProtoLanguageValueEvent setVoiceName:](self, "setVoiceName:");
  }
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_inputLanguageCode hash];
  NSUInteger v4 = [(NSString *)self->_outputVoiceLanguageCode hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_outputVoiceGenderCode hash];
  return v4 ^ v5 ^ [(NSString *)self->_voiceName hash];
}

- (BOOL)isEqual:(id)a3
{
  NSUInteger v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((inputLanguageCode = self->_inputLanguageCode, !((unint64_t)inputLanguageCode | v4[1]))
     || -[NSString isEqual:](inputLanguageCode, "isEqual:"))
    && ((outputVoiceLanguageCode = self->_outputVoiceLanguageCode, !((unint64_t)outputVoiceLanguageCode | v4[3]))
     || -[NSString isEqual:](outputVoiceLanguageCode, "isEqual:"))
    && ((outputVoiceGenderCode = self->_outputVoiceGenderCode, !((unint64_t)outputVoiceGenderCode | v4[2]))
     || -[NSString isEqual:](outputVoiceGenderCode, "isEqual:")))
  {
    voiceName = self->_voiceName;
    if ((unint64_t)voiceName | v4[4]) {
      char v9 = -[NSString isEqual:](voiceName, "isEqual:");
    }
    else {
      char v9 = 1;
    }
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  NSUInteger v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_inputLanguageCode copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  uint64_t v8 = [(NSString *)self->_outputVoiceLanguageCode copyWithZone:a3];
  char v9 = (void *)v5[3];
  v5[3] = v8;

  uint64_t v10 = [(NSString *)self->_outputVoiceGenderCode copyWithZone:a3];
  v11 = (void *)v5[2];
  v5[2] = v10;

  uint64_t v12 = [(NSString *)self->_voiceName copyWithZone:a3];
  v13 = (void *)v5[4];
  v5[4] = v12;

  return v5;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_inputLanguageCode)
  {
    objc_msgSend(v4, "setInputLanguageCode:");
    id v4 = v5;
  }
  if (self->_outputVoiceLanguageCode)
  {
    objc_msgSend(v5, "setOutputVoiceLanguageCode:");
    id v4 = v5;
  }
  if (self->_outputVoiceGenderCode)
  {
    objc_msgSend(v5, "setOutputVoiceGenderCode:");
    id v4 = v5;
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
  if (self->_inputLanguageCode)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_outputVoiceLanguageCode)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_outputVoiceGenderCode)
  {
    PBDataWriterWriteStringField();
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
  return HMImmutableSettingsProtoLanguageValueEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  NSUInteger v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  inputLanguageCode = self->_inputLanguageCode;
  if (inputLanguageCode) {
    [v3 setObject:inputLanguageCode forKey:@"inputLanguageCode"];
  }
  outputVoiceLanguageCode = self->_outputVoiceLanguageCode;
  if (outputVoiceLanguageCode) {
    [v4 setObject:outputVoiceLanguageCode forKey:@"outputVoiceLanguageCode"];
  }
  outputVoiceGenderCode = self->_outputVoiceGenderCode;
  if (outputVoiceGenderCode) {
    [v4 setObject:outputVoiceGenderCode forKey:@"outputVoiceGenderCode"];
  }
  voiceName = self->_voiceName;
  if (voiceName) {
    [v4 setObject:voiceName forKey:@"voiceName"];
  }

  return v4;
}

- (id)description
{
  NSUInteger v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HMImmutableSettingsProtoLanguageValueEvent;
  id v4 = [(HMImmutableSettingsProtoLanguageValueEvent *)&v8 description];
  id v5 = [(HMImmutableSettingsProtoLanguageValueEvent *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasVoiceName
{
  return self->_voiceName != 0;
}

- (BOOL)hasOutputVoiceGenderCode
{
  return self->_outputVoiceGenderCode != 0;
}

- (BOOL)hasOutputVoiceLanguageCode
{
  return self->_outputVoiceLanguageCode != 0;
}

- (BOOL)hasInputLanguageCode
{
  return self->_inputLanguageCode != 0;
}

@end
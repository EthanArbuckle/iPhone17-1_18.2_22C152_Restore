@interface _INPBRunVoiceCommandIntent
+ (BOOL)supportsSecureCoding;
- (BOOL)hasExecutionResult;
- (BOOL)hasIntentMetadata;
- (BOOL)hasOriginDevice;
- (BOOL)hasPreviousIntentIdentifier;
- (BOOL)hasVoiceCommand;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)previousIntentIdentifier;
- (_INPBDataString)voiceCommand;
- (_INPBIntentExecutionResult)executionResult;
- (_INPBIntentMetadata)intentMetadata;
- (_INPBRunVoiceCommandIntent)initWithCoder:(id)a3;
- (_INPBVoiceCommandDeviceInformation)originDevice;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setExecutionResult:(id)a3;
- (void)setIntentMetadata:(id)a3;
- (void)setOriginDevice:(id)a3;
- (void)setPreviousIntentIdentifier:(id)a3;
- (void)setVoiceCommand:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBRunVoiceCommandIntent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_voiceCommand, 0);
  objc_storeStrong((id *)&self->_previousIntentIdentifier, 0);
  objc_storeStrong((id *)&self->_originDevice, 0);
  objc_storeStrong((id *)&self->_intentMetadata, 0);

  objc_storeStrong((id *)&self->_executionResult, 0);
}

- (_INPBDataString)voiceCommand
{
  return self->_voiceCommand;
}

- (NSString)previousIntentIdentifier
{
  return self->_previousIntentIdentifier;
}

- (_INPBVoiceCommandDeviceInformation)originDevice
{
  return self->_originDevice;
}

- (_INPBIntentMetadata)intentMetadata
{
  return self->_intentMetadata;
}

- (_INPBIntentExecutionResult)executionResult
{
  return self->_executionResult;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = [(_INPBRunVoiceCommandIntent *)self executionResult];
  v5 = [v4 dictionaryRepresentation];
  [v3 setObject:v5 forKeyedSubscript:@"executionResult"];

  v6 = [(_INPBRunVoiceCommandIntent *)self intentMetadata];
  v7 = [v6 dictionaryRepresentation];
  [v3 setObject:v7 forKeyedSubscript:@"intentMetadata"];

  v8 = [(_INPBRunVoiceCommandIntent *)self originDevice];
  v9 = [v8 dictionaryRepresentation];
  [v3 setObject:v9 forKeyedSubscript:@"originDevice"];

  if (self->_previousIntentIdentifier)
  {
    v10 = [(_INPBRunVoiceCommandIntent *)self previousIntentIdentifier];
    v11 = (void *)[v10 copy];
    [v3 setObject:v11 forKeyedSubscript:@"previousIntentIdentifier"];
  }
  v12 = [(_INPBRunVoiceCommandIntent *)self voiceCommand];
  v13 = [v12 dictionaryRepresentation];
  [v3 setObject:v13 forKeyedSubscript:@"voiceCommand"];

  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(_INPBIntentExecutionResult *)self->_executionResult hash];
  unint64_t v4 = [(_INPBIntentMetadata *)self->_intentMetadata hash] ^ v3;
  unint64_t v5 = [(_INPBVoiceCommandDeviceInformation *)self->_originDevice hash];
  NSUInteger v6 = v4 ^ v5 ^ [(NSString *)self->_previousIntentIdentifier hash];
  return v6 ^ [(_INPBDataString *)self->_voiceCommand hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_27;
  }
  unint64_t v5 = [(_INPBRunVoiceCommandIntent *)self executionResult];
  NSUInteger v6 = [v4 executionResult];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_26;
  }
  uint64_t v7 = [(_INPBRunVoiceCommandIntent *)self executionResult];
  if (v7)
  {
    v8 = (void *)v7;
    v9 = [(_INPBRunVoiceCommandIntent *)self executionResult];
    v10 = [v4 executionResult];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_27;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBRunVoiceCommandIntent *)self intentMetadata];
  NSUInteger v6 = [v4 intentMetadata];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_26;
  }
  uint64_t v12 = [(_INPBRunVoiceCommandIntent *)self intentMetadata];
  if (v12)
  {
    v13 = (void *)v12;
    v14 = [(_INPBRunVoiceCommandIntent *)self intentMetadata];
    v15 = [v4 intentMetadata];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_27;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBRunVoiceCommandIntent *)self originDevice];
  NSUInteger v6 = [v4 originDevice];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_26;
  }
  uint64_t v17 = [(_INPBRunVoiceCommandIntent *)self originDevice];
  if (v17)
  {
    v18 = (void *)v17;
    v19 = [(_INPBRunVoiceCommandIntent *)self originDevice];
    v20 = [v4 originDevice];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_27;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBRunVoiceCommandIntent *)self previousIntentIdentifier];
  NSUInteger v6 = [v4 previousIntentIdentifier];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_26;
  }
  uint64_t v22 = [(_INPBRunVoiceCommandIntent *)self previousIntentIdentifier];
  if (v22)
  {
    v23 = (void *)v22;
    v24 = [(_INPBRunVoiceCommandIntent *)self previousIntentIdentifier];
    v25 = [v4 previousIntentIdentifier];
    int v26 = [v24 isEqual:v25];

    if (!v26) {
      goto LABEL_27;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBRunVoiceCommandIntent *)self voiceCommand];
  NSUInteger v6 = [v4 voiceCommand];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v27 = [(_INPBRunVoiceCommandIntent *)self voiceCommand];
    if (!v27)
    {

LABEL_30:
      BOOL v32 = 1;
      goto LABEL_28;
    }
    v28 = (void *)v27;
    v29 = [(_INPBRunVoiceCommandIntent *)self voiceCommand];
    v30 = [v4 voiceCommand];
    char v31 = [v29 isEqual:v30];

    if (v31) {
      goto LABEL_30;
    }
  }
  else
  {
LABEL_26:
  }
LABEL_27:
  BOOL v32 = 0;
LABEL_28:

  return v32;
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v5 = [+[_INPBRunVoiceCommandIntent allocWithZone:](_INPBRunVoiceCommandIntent, "allocWithZone:") init];
  id v6 = [(_INPBIntentExecutionResult *)self->_executionResult copyWithZone:a3];
  [(_INPBRunVoiceCommandIntent *)v5 setExecutionResult:v6];

  id v7 = [(_INPBIntentMetadata *)self->_intentMetadata copyWithZone:a3];
  [(_INPBRunVoiceCommandIntent *)v5 setIntentMetadata:v7];

  id v8 = [(_INPBVoiceCommandDeviceInformation *)self->_originDevice copyWithZone:a3];
  [(_INPBRunVoiceCommandIntent *)v5 setOriginDevice:v8];

  v9 = (void *)[(NSString *)self->_previousIntentIdentifier copyWithZone:a3];
  [(_INPBRunVoiceCommandIntent *)v5 setPreviousIntentIdentifier:v9];

  id v10 = [(_INPBDataString *)self->_voiceCommand copyWithZone:a3];
  [(_INPBRunVoiceCommandIntent *)v5 setVoiceCommand:v10];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBRunVoiceCommandIntent *)self data];
  unint64_t v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBRunVoiceCommandIntent)initWithCoder:(id)a3
{
  id v4 = a3;
  unint64_t v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBRunVoiceCommandIntent *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        id v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBRunVoiceCommandIntent *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBRunVoiceCommandIntent *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  id v13 = a3;
  id v4 = [(_INPBRunVoiceCommandIntent *)self executionResult];

  if (v4)
  {
    unint64_t v5 = [(_INPBRunVoiceCommandIntent *)self executionResult];
    PBDataWriterWriteSubmessage();
  }
  id v6 = [(_INPBRunVoiceCommandIntent *)self intentMetadata];

  if (v6)
  {
    uint64_t v7 = [(_INPBRunVoiceCommandIntent *)self intentMetadata];
    PBDataWriterWriteSubmessage();
  }
  id v8 = [(_INPBRunVoiceCommandIntent *)self originDevice];

  if (v8)
  {
    v9 = [(_INPBRunVoiceCommandIntent *)self originDevice];
    PBDataWriterWriteSubmessage();
  }
  id v10 = [(_INPBRunVoiceCommandIntent *)self previousIntentIdentifier];

  if (v10) {
    PBDataWriterWriteStringField();
  }
  int v11 = [(_INPBRunVoiceCommandIntent *)self voiceCommand];

  if (v11)
  {
    uint64_t v12 = [(_INPBRunVoiceCommandIntent *)self voiceCommand];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBRunVoiceCommandIntentReadFrom(self, (uint64_t)a3);
}

- (BOOL)hasVoiceCommand
{
  return self->_voiceCommand != 0;
}

- (void)setVoiceCommand:(id)a3
{
}

- (BOOL)hasPreviousIntentIdentifier
{
  return self->_previousIntentIdentifier != 0;
}

- (void)setPreviousIntentIdentifier:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  previousIntentIdentifier = self->_previousIntentIdentifier;
  self->_previousIntentIdentifier = v4;

  MEMORY[0x1F41817F8](v4, previousIntentIdentifier);
}

- (BOOL)hasOriginDevice
{
  return self->_originDevice != 0;
}

- (void)setOriginDevice:(id)a3
{
}

- (BOOL)hasIntentMetadata
{
  return self->_intentMetadata != 0;
}

- (void)setIntentMetadata:(id)a3
{
}

- (BOOL)hasExecutionResult
{
  return self->_executionResult != 0;
}

- (void)setExecutionResult:(id)a3
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
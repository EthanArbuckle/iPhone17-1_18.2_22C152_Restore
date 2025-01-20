@interface _INPBSettingMetadata
+ (BOOL)supportsSecureCoding;
- (BOOL)hasSettingId;
- (BOOL)hasTargetApp;
- (BOOL)hasTargetDevice;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)settingId;
- (_INPBAppIdentifier)targetApp;
- (_INPBDevice)targetDevice;
- (_INPBSettingMetadata)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setSettingId:(id)a3;
- (void)setTargetApp:(id)a3;
- (void)setTargetDevice:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBSettingMetadata

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetDevice, 0);
  objc_storeStrong((id *)&self->_targetApp, 0);

  objc_storeStrong((id *)&self->_settingId, 0);
}

- (_INPBDevice)targetDevice
{
  return self->_targetDevice;
}

- (_INPBAppIdentifier)targetApp
{
  return self->_targetApp;
}

- (NSString)settingId
{
  return self->_settingId;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (self->_settingId)
  {
    v4 = [(_INPBSettingMetadata *)self settingId];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"settingId"];
  }
  v6 = [(_INPBSettingMetadata *)self targetApp];
  v7 = [v6 dictionaryRepresentation];
  [v3 setObject:v7 forKeyedSubscript:@"targetApp"];

  v8 = [(_INPBSettingMetadata *)self targetDevice];
  v9 = [v8 dictionaryRepresentation];
  [v3 setObject:v9 forKeyedSubscript:@"targetDevice"];

  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_settingId hash];
  unint64_t v4 = [(_INPBAppIdentifier *)self->_targetApp hash] ^ v3;
  return v4 ^ [(_INPBDevice *)self->_targetDevice hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_17;
  }
  v5 = [(_INPBSettingMetadata *)self settingId];
  v6 = [v4 settingId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_16;
  }
  uint64_t v7 = [(_INPBSettingMetadata *)self settingId];
  if (v7)
  {
    v8 = (void *)v7;
    v9 = [(_INPBSettingMetadata *)self settingId];
    v10 = [v4 settingId];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  v5 = [(_INPBSettingMetadata *)self targetApp];
  v6 = [v4 targetApp];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_16;
  }
  uint64_t v12 = [(_INPBSettingMetadata *)self targetApp];
  if (v12)
  {
    v13 = (void *)v12;
    v14 = [(_INPBSettingMetadata *)self targetApp];
    v15 = [v4 targetApp];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  v5 = [(_INPBSettingMetadata *)self targetDevice];
  v6 = [v4 targetDevice];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v17 = [(_INPBSettingMetadata *)self targetDevice];
    if (!v17)
    {

LABEL_20:
      BOOL v22 = 1;
      goto LABEL_18;
    }
    v18 = (void *)v17;
    v19 = [(_INPBSettingMetadata *)self targetDevice];
    v20 = [v4 targetDevice];
    char v21 = [v19 isEqual:v20];

    if (v21) {
      goto LABEL_20;
    }
  }
  else
  {
LABEL_16:
  }
LABEL_17:
  BOOL v22 = 0;
LABEL_18:

  return v22;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [+[_INPBSettingMetadata allocWithZone:](_INPBSettingMetadata, "allocWithZone:") init];
  v6 = (void *)[(NSString *)self->_settingId copyWithZone:a3];
  [(_INPBSettingMetadata *)v5 setSettingId:v6];

  id v7 = [(_INPBAppIdentifier *)self->_targetApp copyWithZone:a3];
  [(_INPBSettingMetadata *)v5 setTargetApp:v7];

  id v8 = [(_INPBDevice *)self->_targetDevice copyWithZone:a3];
  [(_INPBSettingMetadata *)v5 setTargetDevice:v8];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBSettingMetadata *)self data];
  v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBSettingMetadata)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBSettingMetadata *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        id v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBSettingMetadata *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBSettingMetadata *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  id v9 = a3;
  id v4 = [(_INPBSettingMetadata *)self settingId];

  if (v4) {
    PBDataWriterWriteStringField();
  }
  v5 = [(_INPBSettingMetadata *)self targetApp];

  if (v5)
  {
    id v6 = [(_INPBSettingMetadata *)self targetApp];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v7 = [(_INPBSettingMetadata *)self targetDevice];

  if (v7)
  {
    id v8 = [(_INPBSettingMetadata *)self targetDevice];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBSettingMetadataReadFrom(self, (uint64_t)a3);
}

- (BOOL)hasTargetDevice
{
  return self->_targetDevice != 0;
}

- (void)setTargetDevice:(id)a3
{
}

- (BOOL)hasTargetApp
{
  return self->_targetApp != 0;
}

- (void)setTargetApp:(id)a3
{
}

- (BOOL)hasSettingId
{
  return self->_settingId != 0;
}

- (void)setSettingId:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  settingId = self->_settingId;
  self->_settingId = v4;

  MEMORY[0x1F41817F8](v4, settingId);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
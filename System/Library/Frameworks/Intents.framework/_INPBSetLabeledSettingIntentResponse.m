@interface _INPBSetLabeledSettingIntentResponse
+ (BOOL)supportsSecureCoding;
- (BOOL)hasErrorDetail;
- (BOOL)hasOldValue;
- (BOOL)hasUpdatedValue;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)errorDetail;
- (NSString)oldValue;
- (NSString)updatedValue;
- (_INPBSetLabeledSettingIntentResponse)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setErrorDetail:(id)a3;
- (void)setOldValue:(id)a3;
- (void)setUpdatedValue:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBSetLabeledSettingIntentResponse

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updatedValue, 0);
  objc_storeStrong((id *)&self->_oldValue, 0);

  objc_storeStrong((id *)&self->_errorDetail, 0);
}

- (NSString)updatedValue
{
  return self->_updatedValue;
}

- (NSString)oldValue
{
  return self->_oldValue;
}

- (NSString)errorDetail
{
  return self->_errorDetail;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (self->_errorDetail)
  {
    v4 = [(_INPBSetLabeledSettingIntentResponse *)self errorDetail];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"errorDetail"];
  }
  if (self->_oldValue)
  {
    v6 = [(_INPBSetLabeledSettingIntentResponse *)self oldValue];
    v7 = (void *)[v6 copy];
    [v3 setObject:v7 forKeyedSubscript:@"oldValue"];
  }
  if (self->_updatedValue)
  {
    v8 = [(_INPBSetLabeledSettingIntentResponse *)self updatedValue];
    v9 = (void *)[v8 copy];
    [v3 setObject:v9 forKeyedSubscript:@"updatedValue"];
  }

  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_errorDetail hash];
  NSUInteger v4 = [(NSString *)self->_oldValue hash] ^ v3;
  return v4 ^ [(NSString *)self->_updatedValue hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_17;
  }
  v5 = [(_INPBSetLabeledSettingIntentResponse *)self errorDetail];
  v6 = [v4 errorDetail];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_16;
  }
  uint64_t v7 = [(_INPBSetLabeledSettingIntentResponse *)self errorDetail];
  if (v7)
  {
    v8 = (void *)v7;
    v9 = [(_INPBSetLabeledSettingIntentResponse *)self errorDetail];
    v10 = [v4 errorDetail];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  v5 = [(_INPBSetLabeledSettingIntentResponse *)self oldValue];
  v6 = [v4 oldValue];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_16;
  }
  uint64_t v12 = [(_INPBSetLabeledSettingIntentResponse *)self oldValue];
  if (v12)
  {
    v13 = (void *)v12;
    v14 = [(_INPBSetLabeledSettingIntentResponse *)self oldValue];
    v15 = [v4 oldValue];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  v5 = [(_INPBSetLabeledSettingIntentResponse *)self updatedValue];
  v6 = [v4 updatedValue];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v17 = [(_INPBSetLabeledSettingIntentResponse *)self updatedValue];
    if (!v17)
    {

LABEL_20:
      BOOL v22 = 1;
      goto LABEL_18;
    }
    v18 = (void *)v17;
    v19 = [(_INPBSetLabeledSettingIntentResponse *)self updatedValue];
    v20 = [v4 updatedValue];
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
  v5 = [+[_INPBSetLabeledSettingIntentResponse allocWithZone:](_INPBSetLabeledSettingIntentResponse, "allocWithZone:") init];
  v6 = (void *)[(NSString *)self->_errorDetail copyWithZone:a3];
  [(_INPBSetLabeledSettingIntentResponse *)v5 setErrorDetail:v6];

  uint64_t v7 = (void *)[(NSString *)self->_oldValue copyWithZone:a3];
  [(_INPBSetLabeledSettingIntentResponse *)v5 setOldValue:v7];

  v8 = (void *)[(NSString *)self->_updatedValue copyWithZone:a3];
  [(_INPBSetLabeledSettingIntentResponse *)v5 setUpdatedValue:v8];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBSetLabeledSettingIntentResponse *)self data];
  v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBSetLabeledSettingIntentResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBSetLabeledSettingIntentResponse *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBSetLabeledSettingIntentResponse *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBSetLabeledSettingIntentResponse *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  id v4 = [(_INPBSetLabeledSettingIntentResponse *)self errorDetail];

  if (v4) {
    PBDataWriterWriteStringField();
  }
  v5 = [(_INPBSetLabeledSettingIntentResponse *)self oldValue];

  if (v5) {
    PBDataWriterWriteStringField();
  }
  id v6 = [(_INPBSetLabeledSettingIntentResponse *)self updatedValue];

  uint64_t v7 = v8;
  if (v6)
  {
    PBDataWriterWriteStringField();
    uint64_t v7 = v8;
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBSetLabeledSettingIntentResponseReadFrom(self, (uint64_t)a3);
}

- (BOOL)hasUpdatedValue
{
  return self->_updatedValue != 0;
}

- (void)setUpdatedValue:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  updatedValue = self->_updatedValue;
  self->_updatedValue = v4;

  MEMORY[0x1F41817F8](v4, updatedValue);
}

- (BOOL)hasOldValue
{
  return self->_oldValue != 0;
}

- (void)setOldValue:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  oldValue = self->_oldValue;
  self->_oldValue = v4;

  MEMORY[0x1F41817F8](v4, oldValue);
}

- (BOOL)hasErrorDetail
{
  return self->_errorDetail != 0;
}

- (void)setErrorDetail:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  errorDetail = self->_errorDetail;
  self->_errorDetail = v4;

  MEMORY[0x1F41817F8](v4, errorDetail);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
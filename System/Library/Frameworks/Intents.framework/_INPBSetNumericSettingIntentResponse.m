@interface _INPBSetNumericSettingIntentResponse
+ (BOOL)supportsSecureCoding;
- (BOOL)hasErrorDetail;
- (BOOL)hasMaxValue;
- (BOOL)hasMinValue;
- (BOOL)hasOldValue;
- (BOOL)hasUpdatedValue;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)errorDetail;
- (_INPBNumericSettingValue)maxValue;
- (_INPBNumericSettingValue)minValue;
- (_INPBNumericSettingValue)oldValue;
- (_INPBNumericSettingValue)updatedValue;
- (_INPBSetNumericSettingIntentResponse)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setErrorDetail:(id)a3;
- (void)setMaxValue:(id)a3;
- (void)setMinValue:(id)a3;
- (void)setOldValue:(id)a3;
- (void)setUpdatedValue:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBSetNumericSettingIntentResponse

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updatedValue, 0);
  objc_storeStrong((id *)&self->_oldValue, 0);
  objc_storeStrong((id *)&self->_minValue, 0);
  objc_storeStrong((id *)&self->_maxValue, 0);

  objc_storeStrong((id *)&self->_errorDetail, 0);
}

- (_INPBNumericSettingValue)updatedValue
{
  return self->_updatedValue;
}

- (_INPBNumericSettingValue)oldValue
{
  return self->_oldValue;
}

- (_INPBNumericSettingValue)minValue
{
  return self->_minValue;
}

- (_INPBNumericSettingValue)maxValue
{
  return self->_maxValue;
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
    v4 = [(_INPBSetNumericSettingIntentResponse *)self errorDetail];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"errorDetail"];
  }
  v6 = [(_INPBSetNumericSettingIntentResponse *)self maxValue];
  v7 = [v6 dictionaryRepresentation];
  [v3 setObject:v7 forKeyedSubscript:@"maxValue"];

  v8 = [(_INPBSetNumericSettingIntentResponse *)self minValue];
  v9 = [v8 dictionaryRepresentation];
  [v3 setObject:v9 forKeyedSubscript:@"minValue"];

  v10 = [(_INPBSetNumericSettingIntentResponse *)self oldValue];
  v11 = [v10 dictionaryRepresentation];
  [v3 setObject:v11 forKeyedSubscript:@"oldValue"];

  v12 = [(_INPBSetNumericSettingIntentResponse *)self updatedValue];
  v13 = [v12 dictionaryRepresentation];
  [v3 setObject:v13 forKeyedSubscript:@"updatedValue"];

  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_errorDetail hash];
  unint64_t v4 = [(_INPBNumericSettingValue *)self->_maxValue hash] ^ v3;
  unint64_t v5 = [(_INPBNumericSettingValue *)self->_minValue hash];
  unint64_t v6 = v4 ^ v5 ^ [(_INPBNumericSettingValue *)self->_oldValue hash];
  return v6 ^ [(_INPBNumericSettingValue *)self->_updatedValue hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_27;
  }
  unint64_t v5 = [(_INPBSetNumericSettingIntentResponse *)self errorDetail];
  unint64_t v6 = [v4 errorDetail];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_26;
  }
  uint64_t v7 = [(_INPBSetNumericSettingIntentResponse *)self errorDetail];
  if (v7)
  {
    v8 = (void *)v7;
    v9 = [(_INPBSetNumericSettingIntentResponse *)self errorDetail];
    v10 = [v4 errorDetail];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_27;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBSetNumericSettingIntentResponse *)self maxValue];
  unint64_t v6 = [v4 maxValue];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_26;
  }
  uint64_t v12 = [(_INPBSetNumericSettingIntentResponse *)self maxValue];
  if (v12)
  {
    v13 = (void *)v12;
    v14 = [(_INPBSetNumericSettingIntentResponse *)self maxValue];
    v15 = [v4 maxValue];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_27;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBSetNumericSettingIntentResponse *)self minValue];
  unint64_t v6 = [v4 minValue];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_26;
  }
  uint64_t v17 = [(_INPBSetNumericSettingIntentResponse *)self minValue];
  if (v17)
  {
    v18 = (void *)v17;
    v19 = [(_INPBSetNumericSettingIntentResponse *)self minValue];
    v20 = [v4 minValue];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_27;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBSetNumericSettingIntentResponse *)self oldValue];
  unint64_t v6 = [v4 oldValue];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_26;
  }
  uint64_t v22 = [(_INPBSetNumericSettingIntentResponse *)self oldValue];
  if (v22)
  {
    v23 = (void *)v22;
    v24 = [(_INPBSetNumericSettingIntentResponse *)self oldValue];
    v25 = [v4 oldValue];
    int v26 = [v24 isEqual:v25];

    if (!v26) {
      goto LABEL_27;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBSetNumericSettingIntentResponse *)self updatedValue];
  unint64_t v6 = [v4 updatedValue];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v27 = [(_INPBSetNumericSettingIntentResponse *)self updatedValue];
    if (!v27)
    {

LABEL_30:
      BOOL v32 = 1;
      goto LABEL_28;
    }
    v28 = (void *)v27;
    v29 = [(_INPBSetNumericSettingIntentResponse *)self updatedValue];
    v30 = [v4 updatedValue];
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
  unint64_t v5 = [+[_INPBSetNumericSettingIntentResponse allocWithZone:](_INPBSetNumericSettingIntentResponse, "allocWithZone:") init];
  unint64_t v6 = (void *)[(NSString *)self->_errorDetail copyWithZone:a3];
  [(_INPBSetNumericSettingIntentResponse *)v5 setErrorDetail:v6];

  id v7 = [(_INPBNumericSettingValue *)self->_maxValue copyWithZone:a3];
  [(_INPBSetNumericSettingIntentResponse *)v5 setMaxValue:v7];

  id v8 = [(_INPBNumericSettingValue *)self->_minValue copyWithZone:a3];
  [(_INPBSetNumericSettingIntentResponse *)v5 setMinValue:v8];

  id v9 = [(_INPBNumericSettingValue *)self->_oldValue copyWithZone:a3];
  [(_INPBSetNumericSettingIntentResponse *)v5 setOldValue:v9];

  id v10 = [(_INPBNumericSettingValue *)self->_updatedValue copyWithZone:a3];
  [(_INPBSetNumericSettingIntentResponse *)v5 setUpdatedValue:v10];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBSetNumericSettingIntentResponse *)self data];
  unint64_t v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBSetNumericSettingIntentResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  unint64_t v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBSetNumericSettingIntentResponse *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        id v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBSetNumericSettingIntentResponse *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBSetNumericSettingIntentResponse *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  id v13 = a3;
  id v4 = [(_INPBSetNumericSettingIntentResponse *)self errorDetail];

  if (v4) {
    PBDataWriterWriteStringField();
  }
  unint64_t v5 = [(_INPBSetNumericSettingIntentResponse *)self maxValue];

  if (v5)
  {
    id v6 = [(_INPBSetNumericSettingIntentResponse *)self maxValue];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v7 = [(_INPBSetNumericSettingIntentResponse *)self minValue];

  if (v7)
  {
    id v8 = [(_INPBSetNumericSettingIntentResponse *)self minValue];
    PBDataWriterWriteSubmessage();
  }
  id v9 = [(_INPBSetNumericSettingIntentResponse *)self oldValue];

  if (v9)
  {
    id v10 = [(_INPBSetNumericSettingIntentResponse *)self oldValue];
    PBDataWriterWriteSubmessage();
  }
  int v11 = [(_INPBSetNumericSettingIntentResponse *)self updatedValue];

  if (v11)
  {
    uint64_t v12 = [(_INPBSetNumericSettingIntentResponse *)self updatedValue];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBSetNumericSettingIntentResponseReadFrom(self, (uint64_t)a3);
}

- (BOOL)hasUpdatedValue
{
  return self->_updatedValue != 0;
}

- (void)setUpdatedValue:(id)a3
{
}

- (BOOL)hasOldValue
{
  return self->_oldValue != 0;
}

- (void)setOldValue:(id)a3
{
}

- (BOOL)hasMinValue
{
  return self->_minValue != 0;
}

- (void)setMinValue:(id)a3
{
}

- (BOOL)hasMaxValue
{
  return self->_maxValue != 0;
}

- (void)setMaxValue:(id)a3
{
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
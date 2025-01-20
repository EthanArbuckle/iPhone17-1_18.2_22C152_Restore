@interface _INPBSetTemporalSettingIntentResponse
+ (BOOL)supportsSecureCoding;
- (BOOL)hasErrorDetail;
- (BOOL)hasOldValue;
- (BOOL)hasUpdatedValue;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)errorDetail;
- (_INPBDateTimeRange)oldValue;
- (_INPBDateTimeRange)updatedValue;
- (_INPBSetTemporalSettingIntentResponse)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setErrorDetail:(id)a3;
- (void)setOldValue:(id)a3;
- (void)setUpdatedValue:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBSetTemporalSettingIntentResponse

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updatedValue, 0);
  objc_storeStrong((id *)&self->_oldValue, 0);

  objc_storeStrong((id *)&self->_errorDetail, 0);
}

- (_INPBDateTimeRange)updatedValue
{
  return self->_updatedValue;
}

- (_INPBDateTimeRange)oldValue
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
    v4 = [(_INPBSetTemporalSettingIntentResponse *)self errorDetail];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"errorDetail"];
  }
  v6 = [(_INPBSetTemporalSettingIntentResponse *)self oldValue];
  v7 = [v6 dictionaryRepresentation];
  [v3 setObject:v7 forKeyedSubscript:@"oldValue"];

  v8 = [(_INPBSetTemporalSettingIntentResponse *)self updatedValue];
  v9 = [v8 dictionaryRepresentation];
  [v3 setObject:v9 forKeyedSubscript:@"updatedValue"];

  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_errorDetail hash];
  unint64_t v4 = [(_INPBDateTimeRange *)self->_oldValue hash] ^ v3;
  return v4 ^ [(_INPBDateTimeRange *)self->_updatedValue hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_17;
  }
  v5 = [(_INPBSetTemporalSettingIntentResponse *)self errorDetail];
  v6 = [v4 errorDetail];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_16;
  }
  uint64_t v7 = [(_INPBSetTemporalSettingIntentResponse *)self errorDetail];
  if (v7)
  {
    v8 = (void *)v7;
    v9 = [(_INPBSetTemporalSettingIntentResponse *)self errorDetail];
    v10 = [v4 errorDetail];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  v5 = [(_INPBSetTemporalSettingIntentResponse *)self oldValue];
  v6 = [v4 oldValue];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_16;
  }
  uint64_t v12 = [(_INPBSetTemporalSettingIntentResponse *)self oldValue];
  if (v12)
  {
    v13 = (void *)v12;
    v14 = [(_INPBSetTemporalSettingIntentResponse *)self oldValue];
    v15 = [v4 oldValue];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  v5 = [(_INPBSetTemporalSettingIntentResponse *)self updatedValue];
  v6 = [v4 updatedValue];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v17 = [(_INPBSetTemporalSettingIntentResponse *)self updatedValue];
    if (!v17)
    {

LABEL_20:
      BOOL v22 = 1;
      goto LABEL_18;
    }
    v18 = (void *)v17;
    v19 = [(_INPBSetTemporalSettingIntentResponse *)self updatedValue];
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
  v5 = [+[_INPBSetTemporalSettingIntentResponse allocWithZone:](_INPBSetTemporalSettingIntentResponse, "allocWithZone:") init];
  v6 = (void *)[(NSString *)self->_errorDetail copyWithZone:a3];
  [(_INPBSetTemporalSettingIntentResponse *)v5 setErrorDetail:v6];

  id v7 = [(_INPBDateTimeRange *)self->_oldValue copyWithZone:a3];
  [(_INPBSetTemporalSettingIntentResponse *)v5 setOldValue:v7];

  id v8 = [(_INPBDateTimeRange *)self->_updatedValue copyWithZone:a3];
  [(_INPBSetTemporalSettingIntentResponse *)v5 setUpdatedValue:v8];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBSetTemporalSettingIntentResponse *)self data];
  v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBSetTemporalSettingIntentResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBSetTemporalSettingIntentResponse *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        id v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBSetTemporalSettingIntentResponse *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBSetTemporalSettingIntentResponse *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  id v9 = a3;
  id v4 = [(_INPBSetTemporalSettingIntentResponse *)self errorDetail];

  if (v4) {
    PBDataWriterWriteStringField();
  }
  v5 = [(_INPBSetTemporalSettingIntentResponse *)self oldValue];

  if (v5)
  {
    id v6 = [(_INPBSetTemporalSettingIntentResponse *)self oldValue];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v7 = [(_INPBSetTemporalSettingIntentResponse *)self updatedValue];

  if (v7)
  {
    id v8 = [(_INPBSetTemporalSettingIntentResponse *)self updatedValue];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBSetTemporalSettingIntentResponseReadFrom(self, (uint64_t)a3);
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
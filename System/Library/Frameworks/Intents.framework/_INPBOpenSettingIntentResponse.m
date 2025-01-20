@interface _INPBOpenSettingIntentResponse
+ (BOOL)supportsSecureCoding;
- (BOOL)hasErrorDetail;
- (BOOL)hasPunchoutUrl;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)errorDetail;
- (NSString)punchoutUrl;
- (_INPBOpenSettingIntentResponse)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setErrorDetail:(id)a3;
- (void)setPunchoutUrl:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBOpenSettingIntentResponse

- (void)writeTo:(id)a3
{
  id v6 = a3;
  v4 = [(_INPBOpenSettingIntentResponse *)self errorDetail];

  if (v4) {
    PBDataWriterWriteStringField();
  }
  v5 = [(_INPBOpenSettingIntentResponse *)self punchoutUrl];

  if (v5) {
    PBDataWriterWriteStringField();
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_punchoutUrl, 0);

  objc_storeStrong((id *)&self->_errorDetail, 0);
}

- (NSString)punchoutUrl
{
  return self->_punchoutUrl;
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
    v4 = [(_INPBOpenSettingIntentResponse *)self errorDetail];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"errorDetail"];
  }
  if (self->_punchoutUrl)
  {
    id v6 = [(_INPBOpenSettingIntentResponse *)self punchoutUrl];
    v7 = (void *)[v6 copy];
    [v3 setObject:v7 forKeyedSubscript:@"punchoutUrl"];
  }

  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_errorDetail hash];
  return [(NSString *)self->_punchoutUrl hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  v5 = [(_INPBOpenSettingIntentResponse *)self errorDetail];
  id v6 = [v4 errorDetail];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_11;
  }
  uint64_t v7 = [(_INPBOpenSettingIntentResponse *)self errorDetail];
  if (v7)
  {
    v8 = (void *)v7;
    v9 = [(_INPBOpenSettingIntentResponse *)self errorDetail];
    v10 = [v4 errorDetail];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  v5 = [(_INPBOpenSettingIntentResponse *)self punchoutUrl];
  id v6 = [v4 punchoutUrl];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v12 = [(_INPBOpenSettingIntentResponse *)self punchoutUrl];
    if (!v12)
    {

LABEL_15:
      BOOL v17 = 1;
      goto LABEL_13;
    }
    v13 = (void *)v12;
    v14 = [(_INPBOpenSettingIntentResponse *)self punchoutUrl];
    v15 = [v4 punchoutUrl];
    char v16 = [v14 isEqual:v15];

    if (v16) {
      goto LABEL_15;
    }
  }
  else
  {
LABEL_11:
  }
LABEL_12:
  BOOL v17 = 0;
LABEL_13:

  return v17;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [+[_INPBOpenSettingIntentResponse allocWithZone:](_INPBOpenSettingIntentResponse, "allocWithZone:") init];
  id v6 = (void *)[(NSString *)self->_errorDetail copyWithZone:a3];
  [(_INPBOpenSettingIntentResponse *)v5 setErrorDetail:v6];

  uint64_t v7 = (void *)[(NSString *)self->_punchoutUrl copyWithZone:a3];
  [(_INPBOpenSettingIntentResponse *)v5 setPunchoutUrl:v7];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBOpenSettingIntentResponse *)self data];
  v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBOpenSettingIntentResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBOpenSettingIntentResponse *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBOpenSettingIntentResponse *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBOpenSettingIntentResponse *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return _INPBOpenSettingIntentResponseReadFrom(self, (uint64_t)a3);
}

- (BOOL)hasPunchoutUrl
{
  return self->_punchoutUrl != 0;
}

- (void)setPunchoutUrl:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  punchoutUrl = self->_punchoutUrl;
  self->_punchoutUrl = v4;

  MEMORY[0x1F41817F8](v4, punchoutUrl);
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
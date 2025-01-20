@interface _INPBGetSettingIntentResponse
+ (BOOL)supportsSecureCoding;
+ (Class)settingResponseDataType;
- (BOOL)hasErrorDetail;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)settingResponseDatas;
- (NSString)errorDetail;
- (_INPBGetSettingIntentResponse)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (id)settingResponseDataAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)settingResponseDatasCount;
- (void)addSettingResponseData:(id)a3;
- (void)clearSettingResponseDatas;
- (void)encodeWithCoder:(id)a3;
- (void)setErrorDetail:(id)a3;
- (void)setSettingResponseDatas:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBGetSettingIntentResponse

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_settingResponseDatas, 0);

  objc_storeStrong((id *)&self->_errorDetail, 0);
}

- (NSArray)settingResponseDatas
{
  return self->_settingResponseDatas;
}

- (NSString)errorDetail
{
  return self->_errorDetail;
}

- (id)dictionaryRepresentation
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (self->_errorDetail)
  {
    v4 = [(_INPBGetSettingIntentResponse *)self errorDetail];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"errorDetail"];
  }
  if ([(NSArray *)self->_settingResponseDatas count])
  {
    v6 = [MEMORY[0x1E4F1CA48] array];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    v7 = self->_settingResponseDatas;
    uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v15 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "dictionaryRepresentation", (void)v14);
          [v6 addObject:v12];
        }
        uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v9);
    }

    [v3 setObject:v6 forKeyedSubscript:@"settingResponseData"];
  }

  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_errorDetail hash];
  return [(NSArray *)self->_settingResponseDatas hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  v5 = [(_INPBGetSettingIntentResponse *)self errorDetail];
  v6 = [v4 errorDetail];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_11;
  }
  uint64_t v7 = [(_INPBGetSettingIntentResponse *)self errorDetail];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    uint64_t v9 = [(_INPBGetSettingIntentResponse *)self errorDetail];
    uint64_t v10 = [v4 errorDetail];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  v5 = [(_INPBGetSettingIntentResponse *)self settingResponseDatas];
  v6 = [v4 settingResponseDatas];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v12 = [(_INPBGetSettingIntentResponse *)self settingResponseDatas];
    if (!v12)
    {

LABEL_15:
      BOOL v17 = 1;
      goto LABEL_13;
    }
    v13 = (void *)v12;
    long long v14 = [(_INPBGetSettingIntentResponse *)self settingResponseDatas];
    long long v15 = [v4 settingResponseDatas];
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
  v5 = [+[_INPBGetSettingIntentResponse allocWithZone:](_INPBGetSettingIntentResponse, "allocWithZone:") init];
  v6 = (void *)[(NSString *)self->_errorDetail copyWithZone:a3];
  [(_INPBGetSettingIntentResponse *)v5 setErrorDetail:v6];

  uint64_t v7 = (void *)[(NSArray *)self->_settingResponseDatas copyWithZone:a3];
  [(_INPBGetSettingIntentResponse *)v5 setSettingResponseDatas:v7];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBGetSettingIntentResponse *)self data];
  v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBGetSettingIntentResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBGetSettingIntentResponse *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        uint64_t v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBGetSettingIntentResponse *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBGetSettingIntentResponse *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(_INPBGetSettingIntentResponse *)self errorDetail];

  if (v5) {
    PBDataWriterWriteStringField();
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v6 = self->_settingResponseDatas;
  uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        PBDataWriterWriteSubmessage();
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBGetSettingIntentResponseReadFrom(self, (uint64_t)a3);
}

- (id)settingResponseDataAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_settingResponseDatas objectAtIndexedSubscript:a3];
}

- (unint64_t)settingResponseDatasCount
{
  return [(NSArray *)self->_settingResponseDatas count];
}

- (void)addSettingResponseData:(id)a3
{
  id v4 = a3;
  settingResponseDatas = self->_settingResponseDatas;
  id v8 = v4;
  if (!settingResponseDatas)
  {
    id v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_settingResponseDatas;
    self->_settingResponseDatas = v6;

    id v4 = v8;
    settingResponseDatas = self->_settingResponseDatas;
  }
  [(NSArray *)settingResponseDatas addObject:v4];
}

- (void)clearSettingResponseDatas
{
}

- (void)setSettingResponseDatas:(id)a3
{
  id v4 = (NSArray *)[a3 mutableCopy];
  settingResponseDatas = self->_settingResponseDatas;
  self->_settingResponseDatas = v4;

  MEMORY[0x1F41817F8](v4, settingResponseDatas);
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

+ (Class)settingResponseDataType
{
  return (Class)objc_opt_class();
}

@end
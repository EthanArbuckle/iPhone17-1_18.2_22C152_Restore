@interface _INPBIntentExecutionResult
+ (BOOL)supportsSecureCoding;
- (BOOL)hasEncodedIntent;
- (BOOL)hasEncodedIntentResponse;
- (BOOL)hasEncodingFormat;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)encodedIntent;
- (NSString)encodedIntentResponse;
- (_INPBIntentExecutionResult)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (id)encodingFormatAsString:(int)a3;
- (int)StringAsEncodingFormat:(id)a3;
- (int)encodingFormat;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setEncodedIntent:(id)a3;
- (void)setEncodedIntentResponse:(id)a3;
- (void)setEncodingFormat:(int)a3;
- (void)setHasEncodingFormat:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBIntentExecutionResult

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_encodedIntentResponse, 0);

  objc_storeStrong((id *)&self->_encodedIntent, 0);
}

- (int)encodingFormat
{
  return self->_encodingFormat;
}

- (NSString)encodedIntentResponse
{
  return self->_encodedIntentResponse;
}

- (NSString)encodedIntent
{
  return self->_encodedIntent;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (self->_encodedIntent)
  {
    v4 = [(_INPBIntentExecutionResult *)self encodedIntent];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"encodedIntent"];
  }
  if (self->_encodedIntentResponse)
  {
    v6 = [(_INPBIntentExecutionResult *)self encodedIntentResponse];
    v7 = (void *)[v6 copy];
    [v3 setObject:v7 forKeyedSubscript:@"encodedIntentResponse"];
  }
  if ([(_INPBIntentExecutionResult *)self hasEncodingFormat])
  {
    uint64_t v8 = [(_INPBIntentExecutionResult *)self encodingFormat];
    if (v8 == 1)
    {
      v9 = @"JSON_STRING";
    }
    else if (v8 == 2)
    {
      v9 = @"PROTOBUF_STRING";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v8);
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    [v3 setObject:v9 forKeyedSubscript:@"encodingFormat"];
  }

  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_encodedIntent hash];
  NSUInteger v4 = [(NSString *)self->_encodedIntentResponse hash];
  if ([(_INPBIntentExecutionResult *)self hasEncodingFormat]) {
    uint64_t v5 = 2654435761 * self->_encodingFormat;
  }
  else {
    uint64_t v5 = 0;
  }
  return v4 ^ v3 ^ v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  uint64_t v5 = [(_INPBIntentExecutionResult *)self encodedIntent];
  v6 = [v4 encodedIntent];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_11;
  }
  uint64_t v7 = [(_INPBIntentExecutionResult *)self encodedIntent];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    v9 = [(_INPBIntentExecutionResult *)self encodedIntent];
    v10 = [v4 encodedIntent];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_INPBIntentExecutionResult *)self encodedIntentResponse];
  v6 = [v4 encodedIntentResponse];
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_11:

    goto LABEL_12;
  }
  uint64_t v12 = [(_INPBIntentExecutionResult *)self encodedIntentResponse];
  if (v12)
  {
    v13 = (void *)v12;
    v14 = [(_INPBIntentExecutionResult *)self encodedIntentResponse];
    v15 = [v4 encodedIntentResponse];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  int v19 = [(_INPBIntentExecutionResult *)self hasEncodingFormat];
  if (v19 == [v4 hasEncodingFormat])
  {
    if (![(_INPBIntentExecutionResult *)self hasEncodingFormat]
      || ![v4 hasEncodingFormat]
      || (int encodingFormat = self->_encodingFormat, encodingFormat == [v4 encodingFormat]))
    {
      BOOL v17 = 1;
      goto LABEL_13;
    }
  }
LABEL_12:
  BOOL v17 = 0;
LABEL_13:

  return v17;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = [+[_INPBIntentExecutionResult allocWithZone:](_INPBIntentExecutionResult, "allocWithZone:") init];
  v6 = (void *)[(NSString *)self->_encodedIntent copyWithZone:a3];
  [(_INPBIntentExecutionResult *)v5 setEncodedIntent:v6];

  uint64_t v7 = (void *)[(NSString *)self->_encodedIntentResponse copyWithZone:a3];
  [(_INPBIntentExecutionResult *)v5 setEncodedIntentResponse:v7];

  if ([(_INPBIntentExecutionResult *)self hasEncodingFormat]) {
    [(_INPBIntentExecutionResult *)v5 setEncodingFormat:[(_INPBIntentExecutionResult *)self encodingFormat]];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBIntentExecutionResult *)self data];
  uint64_t v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBIntentExecutionResult)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBIntentExecutionResult *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        uint64_t v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBIntentExecutionResult *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBIntentExecutionResult *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  id v6 = a3;
  id v4 = [(_INPBIntentExecutionResult *)self encodedIntent];

  if (v4) {
    PBDataWriterWriteStringField();
  }
  uint64_t v5 = [(_INPBIntentExecutionResult *)self encodedIntentResponse];

  if (v5) {
    PBDataWriterWriteStringField();
  }
  if ([(_INPBIntentExecutionResult *)self hasEncodingFormat]) {
    PBDataWriterWriteInt32Field();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBIntentExecutionResultReadFrom(self, (uint64_t)a3);
}

- (int)StringAsEncodingFormat:(id)a3
{
  id v3 = a3;
  int v4 = 1;
  if (([v3 isEqualToString:@"JSON_STRING"] & 1) == 0)
  {
    if ([v3 isEqualToString:@"PROTOBUF_STRING"]) {
      int v4 = 2;
    }
    else {
      int v4 = 1;
    }
  }

  return v4;
}

- (id)encodingFormatAsString:(int)a3
{
  if (a3 == 1)
  {
    int v4 = @"JSON_STRING";
  }
  else if (a3 == 2)
  {
    int v4 = @"PROTOBUF_STRING";
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    int v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (void)setHasEncodingFormat:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasEncodingFormat
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setEncodingFormat:(int)a3
{
  char has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(unsigned char *)&self->_char has = has & 0xFE;
  }
  else
  {
    *(unsigned char *)&self->_char has = has | 1;
    self->_int encodingFormat = a3;
  }
}

- (BOOL)hasEncodedIntentResponse
{
  return self->_encodedIntentResponse != 0;
}

- (void)setEncodedIntentResponse:(id)a3
{
  int v4 = (NSString *)[a3 copy];
  encodedIntentResponse = self->_encodedIntentResponse;
  self->_encodedIntentResponse = v4;

  MEMORY[0x1F41817F8](v4, encodedIntentResponse);
}

- (BOOL)hasEncodedIntent
{
  return self->_encodedIntent != 0;
}

- (void)setEncodedIntent:(id)a3
{
  int v4 = (NSString *)[a3 copy];
  encodedIntent = self->_encodedIntent;
  self->_encodedIntent = v4;

  MEMORY[0x1F41817F8](v4, encodedIntent);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
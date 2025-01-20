@interface _INPBIntentExecutionRequest
+ (BOOL)supportsSecureCoding;
- (BOOL)hasAppIdentifier;
- (BOOL)hasEncodedIntent;
- (BOOL)hasEncodedIntentDefinition;
- (BOOL)hasEncodingFormat;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)encodedIntent;
- (NSString)encodedIntentDefinition;
- (_INPBAppIdentifier)appIdentifier;
- (_INPBIntentExecutionRequest)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (id)encodingFormatAsString:(int)a3;
- (int)StringAsEncodingFormat:(id)a3;
- (int)encodingFormat;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setAppIdentifier:(id)a3;
- (void)setEncodedIntent:(id)a3;
- (void)setEncodedIntentDefinition:(id)a3;
- (void)setEncodingFormat:(int)a3;
- (void)setHasEncodingFormat:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBIntentExecutionRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_encodedIntentDefinition, 0);
  objc_storeStrong((id *)&self->_encodedIntent, 0);

  objc_storeStrong((id *)&self->_appIdentifier, 0);
}

- (int)encodingFormat
{
  return self->_encodingFormat;
}

- (NSString)encodedIntentDefinition
{
  return self->_encodedIntentDefinition;
}

- (NSString)encodedIntent
{
  return self->_encodedIntent;
}

- (_INPBAppIdentifier)appIdentifier
{
  return self->_appIdentifier;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = [(_INPBIntentExecutionRequest *)self appIdentifier];
  v5 = [v4 dictionaryRepresentation];
  [v3 setObject:v5 forKeyedSubscript:@"appIdentifier"];

  if (self->_encodedIntent)
  {
    v6 = [(_INPBIntentExecutionRequest *)self encodedIntent];
    v7 = (void *)[v6 copy];
    [v3 setObject:v7 forKeyedSubscript:@"encodedIntent"];
  }
  if (self->_encodedIntentDefinition)
  {
    v8 = [(_INPBIntentExecutionRequest *)self encodedIntentDefinition];
    v9 = (void *)[v8 copy];
    [v3 setObject:v9 forKeyedSubscript:@"encodedIntentDefinition"];
  }
  if ([(_INPBIntentExecutionRequest *)self hasEncodingFormat])
  {
    uint64_t v10 = [(_INPBIntentExecutionRequest *)self encodingFormat];
    if (v10 == 1)
    {
      v11 = @"JSON_STRING";
    }
    else if (v10 == 2)
    {
      v11 = @"PROTOBUF_STRING";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v10);
      v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    [v3 setObject:v11 forKeyedSubscript:@"encodingFormat"];
  }

  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(_INPBAppIdentifier *)self->_appIdentifier hash];
  NSUInteger v4 = [(NSString *)self->_encodedIntent hash];
  NSUInteger v5 = [(NSString *)self->_encodedIntentDefinition hash];
  if ([(_INPBIntentExecutionRequest *)self hasEncodingFormat]) {
    uint64_t v6 = 2654435761 * self->_encodingFormat;
  }
  else {
    uint64_t v6 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_17;
  }
  NSUInteger v5 = [(_INPBIntentExecutionRequest *)self appIdentifier];
  uint64_t v6 = [v4 appIdentifier];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_16;
  }
  uint64_t v7 = [(_INPBIntentExecutionRequest *)self appIdentifier];
  if (v7)
  {
    v8 = (void *)v7;
    v9 = [(_INPBIntentExecutionRequest *)self appIdentifier];
    uint64_t v10 = [v4 appIdentifier];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_INPBIntentExecutionRequest *)self encodedIntent];
  uint64_t v6 = [v4 encodedIntent];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_16;
  }
  uint64_t v12 = [(_INPBIntentExecutionRequest *)self encodedIntent];
  if (v12)
  {
    v13 = (void *)v12;
    v14 = [(_INPBIntentExecutionRequest *)self encodedIntent];
    v15 = [v4 encodedIntent];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_INPBIntentExecutionRequest *)self encodedIntentDefinition];
  uint64_t v6 = [v4 encodedIntentDefinition];
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_16:

    goto LABEL_17;
  }
  uint64_t v17 = [(_INPBIntentExecutionRequest *)self encodedIntentDefinition];
  if (v17)
  {
    v18 = (void *)v17;
    v19 = [(_INPBIntentExecutionRequest *)self encodedIntentDefinition];
    v20 = [v4 encodedIntentDefinition];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  int v24 = [(_INPBIntentExecutionRequest *)self hasEncodingFormat];
  if (v24 == [v4 hasEncodingFormat])
  {
    if (![(_INPBIntentExecutionRequest *)self hasEncodingFormat]
      || ![v4 hasEncodingFormat]
      || (int encodingFormat = self->_encodingFormat, encodingFormat == [v4 encodingFormat]))
    {
      BOOL v22 = 1;
      goto LABEL_18;
    }
  }
LABEL_17:
  BOOL v22 = 0;
LABEL_18:

  return v22;
}

- (id)copyWithZone:(_NSZone *)a3
{
  NSUInteger v5 = [+[_INPBIntentExecutionRequest allocWithZone:](_INPBIntentExecutionRequest, "allocWithZone:") init];
  id v6 = [(_INPBAppIdentifier *)self->_appIdentifier copyWithZone:a3];
  [(_INPBIntentExecutionRequest *)v5 setAppIdentifier:v6];

  uint64_t v7 = (void *)[(NSString *)self->_encodedIntent copyWithZone:a3];
  [(_INPBIntentExecutionRequest *)v5 setEncodedIntent:v7];

  v8 = (void *)[(NSString *)self->_encodedIntentDefinition copyWithZone:a3];
  [(_INPBIntentExecutionRequest *)v5 setEncodedIntentDefinition:v8];

  if ([(_INPBIntentExecutionRequest *)self hasEncodingFormat]) {
    [(_INPBIntentExecutionRequest *)v5 setEncodingFormat:[(_INPBIntentExecutionRequest *)self encodingFormat]];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBIntentExecutionRequest *)self data];
  NSUInteger v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBIntentExecutionRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  NSUInteger v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBIntentExecutionRequest *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBIntentExecutionRequest *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBIntentExecutionRequest *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  id v4 = [(_INPBIntentExecutionRequest *)self appIdentifier];

  if (v4)
  {
    NSUInteger v5 = [(_INPBIntentExecutionRequest *)self appIdentifier];
    PBDataWriterWriteSubmessage();
  }
  id v6 = [(_INPBIntentExecutionRequest *)self encodedIntent];

  if (v6) {
    PBDataWriterWriteStringField();
  }
  uint64_t v7 = [(_INPBIntentExecutionRequest *)self encodedIntentDefinition];

  if (v7) {
    PBDataWriterWriteStringField();
  }
  if ([(_INPBIntentExecutionRequest *)self hasEncodingFormat]) {
    PBDataWriterWriteInt32Field();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBIntentExecutionRequestReadFrom(self, (uint64_t)a3);
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

- (BOOL)hasEncodedIntentDefinition
{
  return self->_encodedIntentDefinition != 0;
}

- (void)setEncodedIntentDefinition:(id)a3
{
  int v4 = (NSString *)[a3 copy];
  encodedIntentDefinition = self->_encodedIntentDefinition;
  self->_encodedIntentDefinition = v4;

  MEMORY[0x1F41817F8](v4, encodedIntentDefinition);
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

- (BOOL)hasAppIdentifier
{
  return self->_appIdentifier != 0;
}

- (void)setAppIdentifier:(id)a3
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
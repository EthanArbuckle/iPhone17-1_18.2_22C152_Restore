@interface _INPBIntent
+ (BOOL)supportsSecureCoding;
- (BOOL)hasAppIdentifier;
- (BOOL)hasEncodedIntent;
- (BOOL)hasEncodedIntentDefinition;
- (BOOL)hasEncodingFormat;
- (BOOL)hasIntentTypeName;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)encodedIntent;
- (NSString)encodedIntentDefinition;
- (NSString)intentTypeName;
- (_INPBAppIdentifier)appIdentifier;
- (_INPBIntent)initWithCoder:(id)a3;
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
- (void)setIntentTypeName:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBIntent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_intentTypeName, 0);
  objc_storeStrong((id *)&self->_encodedIntentDefinition, 0);
  objc_storeStrong((id *)&self->_encodedIntent, 0);

  objc_storeStrong((id *)&self->_appIdentifier, 0);
}

- (NSString)intentTypeName
{
  return self->_intentTypeName;
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
  v4 = [(_INPBIntent *)self appIdentifier];
  v5 = [v4 dictionaryRepresentation];
  [v3 setObject:v5 forKeyedSubscript:@"appIdentifier"];

  if (self->_encodedIntent)
  {
    v6 = [(_INPBIntent *)self encodedIntent];
    v7 = (void *)[v6 copy];
    [v3 setObject:v7 forKeyedSubscript:@"encodedIntent"];
  }
  if (self->_encodedIntentDefinition)
  {
    v8 = [(_INPBIntent *)self encodedIntentDefinition];
    v9 = (void *)[v8 copy];
    [v3 setObject:v9 forKeyedSubscript:@"encodedIntentDefinition"];
  }
  if ([(_INPBIntent *)self hasEncodingFormat])
  {
    uint64_t v10 = [(_INPBIntent *)self encodingFormat];
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
  if (self->_intentTypeName)
  {
    v12 = [(_INPBIntent *)self intentTypeName];
    v13 = (void *)[v12 copy];
    [v3 setObject:v13 forKeyedSubscript:@"intentTypeName"];
  }

  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(_INPBAppIdentifier *)self->_appIdentifier hash];
  NSUInteger v4 = [(NSString *)self->_encodedIntent hash];
  NSUInteger v5 = [(NSString *)self->_encodedIntentDefinition hash];
  if ([(_INPBIntent *)self hasEncodingFormat]) {
    uint64_t v6 = 2654435761 * self->_encodingFormat;
  }
  else {
    uint64_t v6 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ [(NSString *)self->_intentTypeName hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_26;
  }
  NSUInteger v5 = [(_INPBIntent *)self appIdentifier];
  uint64_t v6 = [v4 appIdentifier];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_25;
  }
  uint64_t v7 = [(_INPBIntent *)self appIdentifier];
  if (v7)
  {
    v8 = (void *)v7;
    v9 = [(_INPBIntent *)self appIdentifier];
    uint64_t v10 = [v4 appIdentifier];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_26;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_INPBIntent *)self encodedIntent];
  uint64_t v6 = [v4 encodedIntent];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_25;
  }
  uint64_t v12 = [(_INPBIntent *)self encodedIntent];
  if (v12)
  {
    v13 = (void *)v12;
    v14 = [(_INPBIntent *)self encodedIntent];
    v15 = [v4 encodedIntent];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_26;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_INPBIntent *)self encodedIntentDefinition];
  uint64_t v6 = [v4 encodedIntentDefinition];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_25;
  }
  uint64_t v17 = [(_INPBIntent *)self encodedIntentDefinition];
  if (v17)
  {
    v18 = (void *)v17;
    v19 = [(_INPBIntent *)self encodedIntentDefinition];
    v20 = [v4 encodedIntentDefinition];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_26;
    }
  }
  else
  {
  }
  int v22 = [(_INPBIntent *)self hasEncodingFormat];
  if (v22 != [v4 hasEncodingFormat]) {
    goto LABEL_26;
  }
  if ([(_INPBIntent *)self hasEncodingFormat])
  {
    if ([v4 hasEncodingFormat])
    {
      int encodingFormat = self->_encodingFormat;
      if (encodingFormat != [v4 encodingFormat]) {
        goto LABEL_26;
      }
    }
  }
  NSUInteger v5 = [(_INPBIntent *)self intentTypeName];
  uint64_t v6 = [v4 intentTypeName];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v24 = [(_INPBIntent *)self intentTypeName];
    if (!v24)
    {

LABEL_29:
      BOOL v29 = 1;
      goto LABEL_27;
    }
    v25 = (void *)v24;
    v26 = [(_INPBIntent *)self intentTypeName];
    v27 = [v4 intentTypeName];
    char v28 = [v26 isEqual:v27];

    if (v28) {
      goto LABEL_29;
    }
  }
  else
  {
LABEL_25:
  }
LABEL_26:
  BOOL v29 = 0;
LABEL_27:

  return v29;
}

- (id)copyWithZone:(_NSZone *)a3
{
  NSUInteger v5 = [+[_INPBIntent allocWithZone:](_INPBIntent, "allocWithZone:") init];
  id v6 = [(_INPBAppIdentifier *)self->_appIdentifier copyWithZone:a3];
  [(_INPBIntent *)v5 setAppIdentifier:v6];

  uint64_t v7 = (void *)[(NSString *)self->_encodedIntent copyWithZone:a3];
  [(_INPBIntent *)v5 setEncodedIntent:v7];

  v8 = (void *)[(NSString *)self->_encodedIntentDefinition copyWithZone:a3];
  [(_INPBIntent *)v5 setEncodedIntentDefinition:v8];

  if ([(_INPBIntent *)self hasEncodingFormat]) {
    [(_INPBIntent *)v5 setEncodingFormat:[(_INPBIntent *)self encodingFormat]];
  }
  v9 = (void *)[(NSString *)self->_intentTypeName copyWithZone:a3];
  [(_INPBIntent *)v5 setIntentTypeName:v9];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBIntent *)self data];
  NSUInteger v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBIntent)initWithCoder:(id)a3
{
  id v4 = a3;
  NSUInteger v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBIntent *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBIntent *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBIntent *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  id v10 = a3;
  id v4 = [(_INPBIntent *)self appIdentifier];

  if (v4)
  {
    NSUInteger v5 = [(_INPBIntent *)self appIdentifier];
    PBDataWriterWriteSubmessage();
  }
  id v6 = [(_INPBIntent *)self encodedIntent];

  if (v6) {
    PBDataWriterWriteStringField();
  }
  uint64_t v7 = [(_INPBIntent *)self encodedIntentDefinition];

  if (v7) {
    PBDataWriterWriteStringField();
  }
  if ([(_INPBIntent *)self hasEncodingFormat]) {
    PBDataWriterWriteInt32Field();
  }
  v8 = [(_INPBIntent *)self intentTypeName];

  v9 = v10;
  if (v8)
  {
    PBDataWriterWriteStringField();
    v9 = v10;
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBIntentReadFrom(self, (uint64_t)a3);
}

- (BOOL)hasIntentTypeName
{
  return self->_intentTypeName != 0;
}

- (void)setIntentTypeName:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  intentTypeName = self->_intentTypeName;
  self->_intentTypeName = v4;

  MEMORY[0x1F41817F8](v4, intentTypeName);
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
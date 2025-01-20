@interface _INPBIntentResponsePayloadFailure
+ (BOOL)supportsSecureCoding;
- (BOOL)appLaunchRequested;
- (BOOL)hasAppLaunchRequested;
- (BOOL)hasEnumTypeName;
- (BOOL)hasErrorCode;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)enumTypeName;
- (_INPBIntentResponsePayloadFailure)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (int)errorCode;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setAppLaunchRequested:(BOOL)a3;
- (void)setEnumTypeName:(id)a3;
- (void)setErrorCode:(int)a3;
- (void)setHasAppLaunchRequested:(BOOL)a3;
- (void)setHasErrorCode:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBIntentResponsePayloadFailure

- (void).cxx_destruct
{
}

- (int)errorCode
{
  return self->_errorCode;
}

- (NSString)enumTypeName
{
  return self->_enumTypeName;
}

- (BOOL)appLaunchRequested
{
  return self->_appLaunchRequested;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(_INPBIntentResponsePayloadFailure *)self hasAppLaunchRequested])
  {
    v4 = objc_msgSend(NSNumber, "numberWithBool:", -[_INPBIntentResponsePayloadFailure appLaunchRequested](self, "appLaunchRequested"));
    [v3 setObject:v4 forKeyedSubscript:@"app_launch_requested"];
  }
  if (self->_enumTypeName)
  {
    v5 = [(_INPBIntentResponsePayloadFailure *)self enumTypeName];
    v6 = (void *)[v5 copy];
    [v3 setObject:v6 forKeyedSubscript:@"enum_type_name"];
  }
  if ([(_INPBIntentResponsePayloadFailure *)self hasErrorCode])
  {
    v7 = objc_msgSend(NSNumber, "numberWithInt:", -[_INPBIntentResponsePayloadFailure errorCode](self, "errorCode"));
    [v3 setObject:v7 forKeyedSubscript:@"error_code"];
  }

  return v3;
}

- (unint64_t)hash
{
  if ([(_INPBIntentResponsePayloadFailure *)self hasAppLaunchRequested]) {
    uint64_t v3 = 2654435761 * self->_appLaunchRequested;
  }
  else {
    uint64_t v3 = 0;
  }
  NSUInteger v4 = [(NSString *)self->_enumTypeName hash];
  if ([(_INPBIntentResponsePayloadFailure *)self hasErrorCode]) {
    uint64_t v5 = 2654435761 * self->_errorCode;
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
    goto LABEL_13;
  }
  int v5 = [(_INPBIntentResponsePayloadFailure *)self hasAppLaunchRequested];
  if (v5 != [v4 hasAppLaunchRequested]) {
    goto LABEL_13;
  }
  if ([(_INPBIntentResponsePayloadFailure *)self hasAppLaunchRequested])
  {
    if ([v4 hasAppLaunchRequested])
    {
      int appLaunchRequested = self->_appLaunchRequested;
      if (appLaunchRequested != [v4 appLaunchRequested]) {
        goto LABEL_13;
      }
    }
  }
  v7 = [(_INPBIntentResponsePayloadFailure *)self enumTypeName];
  v8 = [v4 enumTypeName];
  v9 = v8;
  if ((v7 == 0) != (v8 != 0))
  {
    uint64_t v10 = [(_INPBIntentResponsePayloadFailure *)self enumTypeName];
    if (v10)
    {
      v11 = (void *)v10;
      v12 = [(_INPBIntentResponsePayloadFailure *)self enumTypeName];
      v13 = [v4 enumTypeName];
      int v14 = [v12 isEqual:v13];

      if (!v14) {
        goto LABEL_13;
      }
    }
    else
    {
    }
    int v15 = [(_INPBIntentResponsePayloadFailure *)self hasErrorCode];
    if (v15 == [v4 hasErrorCode])
    {
      if (![(_INPBIntentResponsePayloadFailure *)self hasErrorCode]
        || ![v4 hasErrorCode]
        || (int errorCode = self->_errorCode, errorCode == [v4 errorCode]))
      {
        BOOL v16 = 1;
        goto LABEL_14;
      }
    }
  }
  else
  {
  }
LABEL_13:
  BOOL v16 = 0;
LABEL_14:

  return v16;
}

- (id)copyWithZone:(_NSZone *)a3
{
  int v5 = [+[_INPBIntentResponsePayloadFailure allocWithZone:](_INPBIntentResponsePayloadFailure, "allocWithZone:") init];
  if ([(_INPBIntentResponsePayloadFailure *)self hasAppLaunchRequested]) {
    [(_INPBIntentResponsePayloadFailure *)v5 setAppLaunchRequested:[(_INPBIntentResponsePayloadFailure *)self appLaunchRequested]];
  }
  v6 = (void *)[(NSString *)self->_enumTypeName copyWithZone:a3];
  [(_INPBIntentResponsePayloadFailure *)v5 setEnumTypeName:v6];

  if ([(_INPBIntentResponsePayloadFailure *)self hasErrorCode]) {
    [(_INPBIntentResponsePayloadFailure *)v5 setErrorCode:[(_INPBIntentResponsePayloadFailure *)self errorCode]];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBIntentResponsePayloadFailure *)self data];
  int v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBIntentResponsePayloadFailure)initWithCoder:(id)a3
{
  id v4 = a3;
  int v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBIntentResponsePayloadFailure *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBIntentResponsePayloadFailure *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBIntentResponsePayloadFailure *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  if ([(_INPBIntentResponsePayloadFailure *)self hasAppLaunchRequested]) {
    PBDataWriterWriteBOOLField();
  }
  id v4 = [(_INPBIntentResponsePayloadFailure *)self enumTypeName];

  if (v4) {
    PBDataWriterWriteStringField();
  }
  if ([(_INPBIntentResponsePayloadFailure *)self hasErrorCode]) {
    PBDataWriterWriteInt32Field();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBIntentResponsePayloadFailureReadFrom(self, (uint64_t)a3);
}

- (void)setHasErrorCode:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasErrorCode
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setErrorCode:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_int errorCode = a3;
}

- (BOOL)hasEnumTypeName
{
  return self->_enumTypeName != 0;
}

- (void)setEnumTypeName:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  enumTypeName = self->_enumTypeName;
  self->_enumTypeName = v4;

  MEMORY[0x1F41817F8](v4, enumTypeName);
}

- (void)setHasAppLaunchRequested:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAppLaunchRequested
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setAppLaunchRequested:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int appLaunchRequested = a3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
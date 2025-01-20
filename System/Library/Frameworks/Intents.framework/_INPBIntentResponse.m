@interface _INPBIntentResponse
+ (BOOL)supportsSecureCoding;
- (BOOL)hasPayloadFailure;
- (BOOL)hasPayloadSuccess;
- (BOOL)hasRequiresAuthentication;
- (BOOL)hasRequiresProtectedData;
- (BOOL)hasType;
- (BOOL)hasUserActivity;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)requiresAuthentication;
- (BOOL)requiresProtectedData;
- (_INPBIntentResponse)initWithCoder:(id)a3;
- (_INPBIntentResponsePayloadFailure)payloadFailure;
- (_INPBIntentResponsePayloadSuccess)payloadSuccess;
- (_INPBUserActivity)userActivity;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (id)typeAsString:(int)a3;
- (int)StringAsType:(id)a3;
- (int)type;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setHasRequiresAuthentication:(BOOL)a3;
- (void)setHasRequiresProtectedData:(BOOL)a3;
- (void)setHasType:(BOOL)a3;
- (void)setPayloadFailure:(id)a3;
- (void)setPayloadSuccess:(id)a3;
- (void)setRequiresAuthentication:(BOOL)a3;
- (void)setRequiresProtectedData:(BOOL)a3;
- (void)setType:(int)a3;
- (void)setUserActivity:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBIntentResponse

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userActivity, 0);
  objc_storeStrong((id *)&self->_payloadSuccess, 0);

  objc_storeStrong((id *)&self->_payloadFailure, 0);
}

- (_INPBUserActivity)userActivity
{
  return self->_userActivity;
}

- (int)type
{
  return self->_type;
}

- (BOOL)requiresProtectedData
{
  return self->_requiresProtectedData;
}

- (BOOL)requiresAuthentication
{
  return self->_requiresAuthentication;
}

- (_INPBIntentResponsePayloadSuccess)payloadSuccess
{
  return self->_payloadSuccess;
}

- (_INPBIntentResponsePayloadFailure)payloadFailure
{
  return self->_payloadFailure;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = [(_INPBIntentResponse *)self payloadFailure];
  v5 = [v4 dictionaryRepresentation];
  [v3 setObject:v5 forKeyedSubscript:@"_payloadFailure"];

  v6 = [(_INPBIntentResponse *)self payloadSuccess];
  v7 = [v6 dictionaryRepresentation];
  [v3 setObject:v7 forKeyedSubscript:@"_payloadSuccess"];

  if ([(_INPBIntentResponse *)self hasRequiresAuthentication])
  {
    v8 = objc_msgSend(NSNumber, "numberWithBool:", -[_INPBIntentResponse requiresAuthentication](self, "requiresAuthentication"));
    [v3 setObject:v8 forKeyedSubscript:@"requiresAuthentication"];
  }
  if ([(_INPBIntentResponse *)self hasRequiresProtectedData])
  {
    v9 = objc_msgSend(NSNumber, "numberWithBool:", -[_INPBIntentResponse requiresProtectedData](self, "requiresProtectedData"));
    [v3 setObject:v9 forKeyedSubscript:@"requires_protected_data"];
  }
  if ([(_INPBIntentResponse *)self hasType])
  {
    uint64_t v10 = [(_INPBIntentResponse *)self type];
    if (v10 >= 8)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v10);
      v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = off_1E5518CB8[v10];
    }
    [v3 setObject:v11 forKeyedSubscript:@"type"];
  }
  v12 = [(_INPBIntentResponse *)self userActivity];
  v13 = [v12 dictionaryRepresentation];
  [v3 setObject:v13 forKeyedSubscript:@"userActivity"];

  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(_INPBIntentResponsePayloadFailure *)self->_payloadFailure hash];
  unint64_t v4 = [(_INPBIntentResponsePayloadSuccess *)self->_payloadSuccess hash];
  if ([(_INPBIntentResponse *)self hasRequiresAuthentication]) {
    uint64_t v5 = 2654435761 * self->_requiresAuthentication;
  }
  else {
    uint64_t v5 = 0;
  }
  if ([(_INPBIntentResponse *)self hasRequiresProtectedData]) {
    uint64_t v6 = 2654435761 * self->_requiresProtectedData;
  }
  else {
    uint64_t v6 = 0;
  }
  if ([(_INPBIntentResponse *)self hasType]) {
    uint64_t v7 = 2654435761 * self->_type;
  }
  else {
    uint64_t v7 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ [(_INPBUserActivity *)self->_userActivity hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_29;
  }
  uint64_t v5 = [(_INPBIntentResponse *)self payloadFailure];
  uint64_t v6 = [v4 payloadFailure];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_28;
  }
  uint64_t v7 = [(_INPBIntentResponse *)self payloadFailure];
  if (v7)
  {
    v8 = (void *)v7;
    v9 = [(_INPBIntentResponse *)self payloadFailure];
    uint64_t v10 = [v4 payloadFailure];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_29;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_INPBIntentResponse *)self payloadSuccess];
  uint64_t v6 = [v4 payloadSuccess];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_28;
  }
  uint64_t v12 = [(_INPBIntentResponse *)self payloadSuccess];
  if (v12)
  {
    v13 = (void *)v12;
    v14 = [(_INPBIntentResponse *)self payloadSuccess];
    v15 = [v4 payloadSuccess];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_29;
    }
  }
  else
  {
  }
  int v17 = [(_INPBIntentResponse *)self hasRequiresAuthentication];
  if (v17 != [v4 hasRequiresAuthentication]) {
    goto LABEL_29;
  }
  if ([(_INPBIntentResponse *)self hasRequiresAuthentication])
  {
    if ([v4 hasRequiresAuthentication])
    {
      int requiresAuthentication = self->_requiresAuthentication;
      if (requiresAuthentication != [v4 requiresAuthentication]) {
        goto LABEL_29;
      }
    }
  }
  int v19 = [(_INPBIntentResponse *)self hasRequiresProtectedData];
  if (v19 != [v4 hasRequiresProtectedData]) {
    goto LABEL_29;
  }
  if ([(_INPBIntentResponse *)self hasRequiresProtectedData])
  {
    if ([v4 hasRequiresProtectedData])
    {
      int requiresProtectedData = self->_requiresProtectedData;
      if (requiresProtectedData != [v4 requiresProtectedData]) {
        goto LABEL_29;
      }
    }
  }
  int v21 = [(_INPBIntentResponse *)self hasType];
  if (v21 != [v4 hasType]) {
    goto LABEL_29;
  }
  if ([(_INPBIntentResponse *)self hasType])
  {
    if ([v4 hasType])
    {
      int type = self->_type;
      if (type != [v4 type]) {
        goto LABEL_29;
      }
    }
  }
  uint64_t v5 = [(_INPBIntentResponse *)self userActivity];
  uint64_t v6 = [v4 userActivity];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v23 = [(_INPBIntentResponse *)self userActivity];
    if (!v23)
    {

LABEL_32:
      BOOL v28 = 1;
      goto LABEL_30;
    }
    v24 = (void *)v23;
    v25 = [(_INPBIntentResponse *)self userActivity];
    v26 = [v4 userActivity];
    char v27 = [v25 isEqual:v26];

    if (v27) {
      goto LABEL_32;
    }
  }
  else
  {
LABEL_28:
  }
LABEL_29:
  BOOL v28 = 0;
LABEL_30:

  return v28;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = [+[_INPBIntentResponse allocWithZone:](_INPBIntentResponse, "allocWithZone:") init];
  id v6 = [(_INPBIntentResponsePayloadFailure *)self->_payloadFailure copyWithZone:a3];
  [(_INPBIntentResponse *)v5 setPayloadFailure:v6];

  id v7 = [(_INPBIntentResponsePayloadSuccess *)self->_payloadSuccess copyWithZone:a3];
  [(_INPBIntentResponse *)v5 setPayloadSuccess:v7];

  if ([(_INPBIntentResponse *)self hasRequiresAuthentication]) {
    [(_INPBIntentResponse *)v5 setRequiresAuthentication:[(_INPBIntentResponse *)self requiresAuthentication]];
  }
  if ([(_INPBIntentResponse *)self hasRequiresProtectedData]) {
    [(_INPBIntentResponse *)v5 setRequiresProtectedData:[(_INPBIntentResponse *)self requiresProtectedData]];
  }
  if ([(_INPBIntentResponse *)self hasType]) {
    [(_INPBIntentResponse *)v5 setType:[(_INPBIntentResponse *)self type]];
  }
  id v8 = [(_INPBUserActivity *)self->_userActivity copyWithZone:a3];
  [(_INPBIntentResponse *)v5 setUserActivity:v8];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBIntentResponse *)self data];
  uint64_t v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBIntentResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBIntentResponse *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        id v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBIntentResponse *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBIntentResponse *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  id v11 = a3;
  id v4 = [(_INPBIntentResponse *)self payloadFailure];

  if (v4)
  {
    uint64_t v5 = [(_INPBIntentResponse *)self payloadFailure];
    PBDataWriterWriteSubmessage();
  }
  id v6 = [(_INPBIntentResponse *)self payloadSuccess];

  if (v6)
  {
    uint64_t v7 = [(_INPBIntentResponse *)self payloadSuccess];
    PBDataWriterWriteSubmessage();
  }
  if ([(_INPBIntentResponse *)self hasRequiresAuthentication]) {
    PBDataWriterWriteBOOLField();
  }
  if ([(_INPBIntentResponse *)self hasRequiresProtectedData]) {
    PBDataWriterWriteBOOLField();
  }
  if ([(_INPBIntentResponse *)self hasType]) {
    PBDataWriterWriteInt32Field();
  }
  id v8 = [(_INPBIntentResponse *)self userActivity];

  v9 = v11;
  if (v8)
  {
    uint64_t v10 = [(_INPBIntentResponse *)self userActivity];
    PBDataWriterWriteSubmessage();

    v9 = v11;
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBIntentResponseReadFrom(self, (uint64_t)a3);
}

- (BOOL)hasUserActivity
{
  return self->_userActivity != 0;
}

- (void)setUserActivity:(id)a3
{
}

- (int)StringAsType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"SUCCESS"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"FAILURE"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"IN_PROGRESS"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"UNSPECIFIED"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"CONTINUE_IN_APP"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"READY"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"AUTHENTICATION_REQUIRED"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"USER_CONFIRMATION_REQUIRED"])
  {
    int v4 = 7;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)typeAsString:(int)a3
{
  if (a3 >= 8)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E5518CB8[a3];
  }

  return v3;
}

- (void)setHasType:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasType
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setType:(int)a3
{
  char has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(unsigned char *)&self->_char has = has & 0xFB;
  }
  else
  {
    *(unsigned char *)&self->_char has = has | 4;
    self->_int type = a3;
  }
}

- (void)setHasRequiresProtectedData:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasRequiresProtectedData
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setRequiresProtectedData:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_int requiresProtectedData = a3;
}

- (void)setHasRequiresAuthentication:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasRequiresAuthentication
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setRequiresAuthentication:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int requiresAuthentication = a3;
}

- (BOOL)hasPayloadSuccess
{
  return self->_payloadSuccess != 0;
}

- (void)setPayloadSuccess:(id)a3
{
}

- (BOOL)hasPayloadFailure
{
  return self->_payloadFailure != 0;
}

- (void)setPayloadFailure:(id)a3
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
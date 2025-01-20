@interface _INPBStartCallIntentResponse
+ (BOOL)supportsSecureCoding;
+ (Class)restrictedContactsType;
- (BOOL)hasConfirmationReason;
- (BOOL)hasShouldDoEmergencyCountdown;
- (BOOL)hasStartedCall;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)shouldDoEmergencyCountdown;
- (NSArray)restrictedContacts;
- (_INPBConnectedCall)startedCall;
- (_INPBStartCallIntentResponse)initWithCoder:(id)a3;
- (id)confirmationReasonAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (id)restrictedContactsAtIndex:(unint64_t)a3;
- (int)StringAsConfirmationReason:(id)a3;
- (int)confirmationReason;
- (unint64_t)hash;
- (unint64_t)restrictedContactsCount;
- (void)addRestrictedContacts:(id)a3;
- (void)clearRestrictedContacts;
- (void)encodeWithCoder:(id)a3;
- (void)setConfirmationReason:(int)a3;
- (void)setHasConfirmationReason:(BOOL)a3;
- (void)setHasShouldDoEmergencyCountdown:(BOOL)a3;
- (void)setRestrictedContacts:(id)a3;
- (void)setShouldDoEmergencyCountdown:(BOOL)a3;
- (void)setStartedCall:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBStartCallIntentResponse

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_startedCall, 0);

  objc_storeStrong((id *)&self->_restrictedContacts, 0);
}

- (_INPBConnectedCall)startedCall
{
  return self->_startedCall;
}

- (BOOL)shouldDoEmergencyCountdown
{
  return self->_shouldDoEmergencyCountdown;
}

- (NSArray)restrictedContacts
{
  return self->_restrictedContacts;
}

- (int)confirmationReason
{
  return self->_confirmationReason;
}

- (id)dictionaryRepresentation
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(_INPBStartCallIntentResponse *)self hasConfirmationReason])
  {
    uint64_t v4 = [(_INPBStartCallIntentResponse *)self confirmationReason];
    if ((v4 - 1) >= 4)
    {
      v5 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v4);
    }
    else
    {
      v5 = *(&off_1E551F660 + (v4 - 1));
    }
    [v3 setObject:v5 forKeyedSubscript:@"confirmationReason"];
  }
  if ([(NSArray *)self->_restrictedContacts count])
  {
    v6 = [MEMORY[0x1E4F1CA48] array];
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    v7 = self->_restrictedContacts;
    uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v18 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = [*(id *)(*((void *)&v17 + 1) + 8 * i) dictionaryRepresentation];
          [v6 addObject:v12];
        }
        uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v9);
    }

    [v3 setObject:v6 forKeyedSubscript:@"restrictedContacts"];
  }
  if ([(_INPBStartCallIntentResponse *)self hasShouldDoEmergencyCountdown])
  {
    v13 = objc_msgSend(NSNumber, "numberWithBool:", -[_INPBStartCallIntentResponse shouldDoEmergencyCountdown](self, "shouldDoEmergencyCountdown"));
    [v3 setObject:v13 forKeyedSubscript:@"shouldDoEmergencyCountdown"];
  }
  v14 = [(_INPBStartCallIntentResponse *)self startedCall];
  v15 = [v14 dictionaryRepresentation];
  [v3 setObject:v15 forKeyedSubscript:@"startedCall"];

  return v3;
}

- (unint64_t)hash
{
  if ([(_INPBStartCallIntentResponse *)self hasConfirmationReason]) {
    uint64_t v3 = 2654435761 * self->_confirmationReason;
  }
  else {
    uint64_t v3 = 0;
  }
  uint64_t v4 = [(NSArray *)self->_restrictedContacts hash];
  if ([(_INPBStartCallIntentResponse *)self hasShouldDoEmergencyCountdown]) {
    uint64_t v5 = 2654435761 * self->_shouldDoEmergencyCountdown;
  }
  else {
    uint64_t v5 = 0;
  }
  return v4 ^ v3 ^ v5 ^ [(_INPBConnectedCall *)self->_startedCall hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_20;
  }
  int v5 = [(_INPBStartCallIntentResponse *)self hasConfirmationReason];
  if (v5 != [v4 hasConfirmationReason]) {
    goto LABEL_20;
  }
  if ([(_INPBStartCallIntentResponse *)self hasConfirmationReason])
  {
    if ([v4 hasConfirmationReason])
    {
      int confirmationReason = self->_confirmationReason;
      if (confirmationReason != [v4 confirmationReason]) {
        goto LABEL_20;
      }
    }
  }
  v7 = [(_INPBStartCallIntentResponse *)self restrictedContacts];
  uint64_t v8 = [v4 restrictedContacts];
  if ((v7 == 0) == (v8 != 0)) {
    goto LABEL_19;
  }
  uint64_t v9 = [(_INPBStartCallIntentResponse *)self restrictedContacts];
  if (v9)
  {
    uint64_t v10 = (void *)v9;
    v11 = [(_INPBStartCallIntentResponse *)self restrictedContacts];
    v12 = [v4 restrictedContacts];
    int v13 = [v11 isEqual:v12];

    if (!v13) {
      goto LABEL_20;
    }
  }
  else
  {
  }
  int v14 = [(_INPBStartCallIntentResponse *)self hasShouldDoEmergencyCountdown];
  if (v14 != [v4 hasShouldDoEmergencyCountdown]) {
    goto LABEL_20;
  }
  if ([(_INPBStartCallIntentResponse *)self hasShouldDoEmergencyCountdown])
  {
    if ([v4 hasShouldDoEmergencyCountdown])
    {
      int shouldDoEmergencyCountdown = self->_shouldDoEmergencyCountdown;
      if (shouldDoEmergencyCountdown != [v4 shouldDoEmergencyCountdown]) {
        goto LABEL_20;
      }
    }
  }
  v7 = [(_INPBStartCallIntentResponse *)self startedCall];
  uint64_t v8 = [v4 startedCall];
  if ((v7 == 0) != (v8 != 0))
  {
    uint64_t v16 = [(_INPBStartCallIntentResponse *)self startedCall];
    if (!v16)
    {

LABEL_23:
      BOOL v21 = 1;
      goto LABEL_21;
    }
    long long v17 = (void *)v16;
    long long v18 = [(_INPBStartCallIntentResponse *)self startedCall];
    long long v19 = [v4 startedCall];
    char v20 = [v18 isEqual:v19];

    if (v20) {
      goto LABEL_23;
    }
  }
  else
  {
LABEL_19:
  }
LABEL_20:
  BOOL v21 = 0;
LABEL_21:

  return v21;
}

- (id)copyWithZone:(_NSZone *)a3
{
  int v5 = [+[_INPBStartCallIntentResponse allocWithZone:](_INPBStartCallIntentResponse, "allocWithZone:") init];
  if ([(_INPBStartCallIntentResponse *)self hasConfirmationReason]) {
    [(_INPBStartCallIntentResponse *)v5 setConfirmationReason:[(_INPBStartCallIntentResponse *)self confirmationReason]];
  }
  v6 = (void *)[(NSArray *)self->_restrictedContacts copyWithZone:a3];
  [(_INPBStartCallIntentResponse *)v5 setRestrictedContacts:v6];

  if ([(_INPBStartCallIntentResponse *)self hasShouldDoEmergencyCountdown]) {
    [(_INPBStartCallIntentResponse *)v5 setShouldDoEmergencyCountdown:[(_INPBStartCallIntentResponse *)self shouldDoEmergencyCountdown]];
  }
  id v7 = [(_INPBConnectedCall *)self->_startedCall copyWithZone:a3];
  [(_INPBStartCallIntentResponse *)v5 setStartedCall:v7];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBStartCallIntentResponse *)self data];
  int v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBStartCallIntentResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  int v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBStartCallIntentResponse *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        uint64_t v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBStartCallIntentResponse *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBStartCallIntentResponse *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(_INPBStartCallIntentResponse *)self hasConfirmationReason]) {
    PBDataWriterWriteInt32Field();
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  int v5 = self->_restrictedContacts;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  if ([(_INPBStartCallIntentResponse *)self hasShouldDoEmergencyCountdown]) {
    PBDataWriterWriteBOOLField();
  }
  uint64_t v10 = [(_INPBStartCallIntentResponse *)self startedCall];

  if (v10)
  {
    v11 = [(_INPBStartCallIntentResponse *)self startedCall];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBStartCallIntentResponseReadFrom(self, (uint64_t)a3);
}

- (BOOL)hasStartedCall
{
  return self->_startedCall != 0;
}

- (void)setStartedCall:(id)a3
{
}

- (void)setHasShouldDoEmergencyCountdown:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasShouldDoEmergencyCountdown
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setShouldDoEmergencyCountdown:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_int shouldDoEmergencyCountdown = a3;
}

- (id)restrictedContactsAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_restrictedContacts objectAtIndexedSubscript:a3];
}

- (unint64_t)restrictedContactsCount
{
  return [(NSArray *)self->_restrictedContacts count];
}

- (void)addRestrictedContacts:(id)a3
{
  id v4 = a3;
  restrictedContacts = self->_restrictedContacts;
  id v8 = v4;
  if (!restrictedContacts)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_restrictedContacts;
    self->_restrictedContacts = v6;

    id v4 = v8;
    restrictedContacts = self->_restrictedContacts;
  }
  [(NSArray *)restrictedContacts addObject:v4];
}

- (void)clearRestrictedContacts
{
}

- (void)setRestrictedContacts:(id)a3
{
  id v4 = (NSArray *)[a3 mutableCopy];
  restrictedContacts = self->_restrictedContacts;
  self->_restrictedContacts = v4;

  MEMORY[0x1F41817F8](v4, restrictedContacts);
}

- (int)StringAsConfirmationReason:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"CALLS_ON_HOMEPOD"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"REDIAL_EMERGENCY"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"CALL_BACK_EMERGENCY"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"HAS_RESTRICTED_CONTACTS"])
  {
    int v4 = 4;
  }
  else
  {
    int v4 = 1;
  }

  return v4;
}

- (id)confirmationReasonAsString:(int)a3
{
  if ((a3 - 1) >= 4)
  {
    id v3 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
  }
  else
  {
    id v3 = *(&off_1E551F660 + (a3 - 1));
  }

  return v3;
}

- (void)setHasConfirmationReason:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasConfirmationReason
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setConfirmationReason:(int)a3
{
  char has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(unsigned char *)&self->_char has = has & 0xFE;
  }
  else
  {
    *(unsigned char *)&self->_char has = has | 1;
    self->_int confirmationReason = a3;
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (Class)restrictedContactsType
{
  return (Class)objc_opt_class();
}

@end
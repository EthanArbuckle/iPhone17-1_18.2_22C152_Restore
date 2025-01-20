@interface _INPBIntentSlotResolutionResult
+ (BOOL)supportsSecureCoding;
- (BOOL)hasPayloadConfirmation;
- (BOOL)hasPayloadNeedsDisambiguation;
- (BOOL)hasPayloadNeedsExecuteIntent;
- (BOOL)hasPayloadNeedsValue;
- (BOOL)hasPayloadSuccess;
- (BOOL)hasPayloadUnsupported;
- (BOOL)hasType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (_INPBIntentSlotResolutionResult)initWithCoder:(id)a3;
- (_INPBPayloadConfirmation)payloadConfirmation;
- (_INPBPayloadNeedsDisambiguation)payloadNeedsDisambiguation;
- (_INPBPayloadNeedsExecuteIntent)payloadNeedsExecuteIntent;
- (_INPBPayloadNeedsValue)payloadNeedsValue;
- (_INPBPayloadSuccess)payloadSuccess;
- (_INPBPayloadUnsupported)payloadUnsupported;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (id)typeAsString:(int)a3;
- (int)StringAsType:(id)a3;
- (int)type;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setHasType:(BOOL)a3;
- (void)setPayloadConfirmation:(id)a3;
- (void)setPayloadNeedsDisambiguation:(id)a3;
- (void)setPayloadNeedsExecuteIntent:(id)a3;
- (void)setPayloadNeedsValue:(id)a3;
- (void)setPayloadSuccess:(id)a3;
- (void)setPayloadUnsupported:(id)a3;
- (void)setType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBIntentSlotResolutionResult

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = [(_INPBIntentSlotResolutionResult *)self payloadConfirmation];
  v5 = [v4 dictionaryRepresentation];
  [v3 setObject:v5 forKeyedSubscript:@"_payloadConfirmation"];

  v6 = [(_INPBIntentSlotResolutionResult *)self payloadNeedsDisambiguation];
  v7 = [v6 dictionaryRepresentation];
  [v3 setObject:v7 forKeyedSubscript:@"_payloadNeedsDisambiguation"];

  v8 = [(_INPBIntentSlotResolutionResult *)self payloadNeedsExecuteIntent];
  v9 = [v8 dictionaryRepresentation];
  [v3 setObject:v9 forKeyedSubscript:@"_payloadNeedsExecuteIntent"];

  v10 = [(_INPBIntentSlotResolutionResult *)self payloadNeedsValue];
  v11 = [v10 dictionaryRepresentation];
  [v3 setObject:v11 forKeyedSubscript:@"_payloadNeedsValue"];

  v12 = [(_INPBIntentSlotResolutionResult *)self payloadSuccess];
  v13 = [v12 dictionaryRepresentation];
  [v3 setObject:v13 forKeyedSubscript:@"_payloadSuccess"];

  v14 = [(_INPBIntentSlotResolutionResult *)self payloadUnsupported];
  v15 = [v14 dictionaryRepresentation];
  [v3 setObject:v15 forKeyedSubscript:@"_payloadUnsupported"];

  if ([(_INPBIntentSlotResolutionResult *)self hasType])
  {
    uint64_t v16 = [(_INPBIntentSlotResolutionResult *)self type];
    int v17 = v16 - 1;
    if (v16 - 1) < 0xB && ((0x7EFu >> v17))
    {
      v18 = off_1E551C130[v17];
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v16);
      v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    [v3 setObject:v18 forKeyedSubscript:@"type"];
  }

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadUnsupported, 0);
  objc_storeStrong((id *)&self->_payloadSuccess, 0);
  objc_storeStrong((id *)&self->_payloadNeedsValue, 0);
  objc_storeStrong((id *)&self->_payloadNeedsExecuteIntent, 0);
  objc_storeStrong((id *)&self->_payloadNeedsDisambiguation, 0);

  objc_storeStrong((id *)&self->_payloadConfirmation, 0);
}

- (int)type
{
  return self->_type;
}

- (_INPBPayloadUnsupported)payloadUnsupported
{
  return self->_payloadUnsupported;
}

- (_INPBPayloadSuccess)payloadSuccess
{
  return self->_payloadSuccess;
}

- (_INPBPayloadNeedsValue)payloadNeedsValue
{
  return self->_payloadNeedsValue;
}

- (_INPBPayloadNeedsExecuteIntent)payloadNeedsExecuteIntent
{
  return self->_payloadNeedsExecuteIntent;
}

- (_INPBPayloadNeedsDisambiguation)payloadNeedsDisambiguation
{
  return self->_payloadNeedsDisambiguation;
}

- (_INPBPayloadConfirmation)payloadConfirmation
{
  return self->_payloadConfirmation;
}

- (unint64_t)hash
{
  unint64_t v3 = [(_INPBPayloadConfirmation *)self->_payloadConfirmation hash];
  unint64_t v4 = [(_INPBPayloadNeedsDisambiguation *)self->_payloadNeedsDisambiguation hash];
  unint64_t v5 = [(_INPBPayloadNeedsExecuteIntent *)self->_payloadNeedsExecuteIntent hash];
  unint64_t v6 = [(_INPBPayloadNeedsValue *)self->_payloadNeedsValue hash];
  unint64_t v7 = [(_INPBPayloadSuccess *)self->_payloadSuccess hash];
  unint64_t v8 = [(_INPBPayloadUnsupported *)self->_payloadUnsupported hash];
  if ([(_INPBIntentSlotResolutionResult *)self hasType]) {
    uint64_t v9 = 2654435761 * self->_type;
  }
  else {
    uint64_t v9 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_32;
  }
  unint64_t v5 = [(_INPBIntentSlotResolutionResult *)self payloadConfirmation];
  unint64_t v6 = [v4 payloadConfirmation];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_31;
  }
  uint64_t v7 = [(_INPBIntentSlotResolutionResult *)self payloadConfirmation];
  if (v7)
  {
    unint64_t v8 = (void *)v7;
    uint64_t v9 = [(_INPBIntentSlotResolutionResult *)self payloadConfirmation];
    v10 = [v4 payloadConfirmation];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_32;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBIntentSlotResolutionResult *)self payloadNeedsDisambiguation];
  unint64_t v6 = [v4 payloadNeedsDisambiguation];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_31;
  }
  uint64_t v12 = [(_INPBIntentSlotResolutionResult *)self payloadNeedsDisambiguation];
  if (v12)
  {
    v13 = (void *)v12;
    v14 = [(_INPBIntentSlotResolutionResult *)self payloadNeedsDisambiguation];
    v15 = [v4 payloadNeedsDisambiguation];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_32;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBIntentSlotResolutionResult *)self payloadNeedsExecuteIntent];
  unint64_t v6 = [v4 payloadNeedsExecuteIntent];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_31;
  }
  uint64_t v17 = [(_INPBIntentSlotResolutionResult *)self payloadNeedsExecuteIntent];
  if (v17)
  {
    v18 = (void *)v17;
    v19 = [(_INPBIntentSlotResolutionResult *)self payloadNeedsExecuteIntent];
    v20 = [v4 payloadNeedsExecuteIntent];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_32;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBIntentSlotResolutionResult *)self payloadNeedsValue];
  unint64_t v6 = [v4 payloadNeedsValue];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_31;
  }
  uint64_t v22 = [(_INPBIntentSlotResolutionResult *)self payloadNeedsValue];
  if (v22)
  {
    v23 = (void *)v22;
    v24 = [(_INPBIntentSlotResolutionResult *)self payloadNeedsValue];
    v25 = [v4 payloadNeedsValue];
    int v26 = [v24 isEqual:v25];

    if (!v26) {
      goto LABEL_32;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBIntentSlotResolutionResult *)self payloadSuccess];
  unint64_t v6 = [v4 payloadSuccess];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_31;
  }
  uint64_t v27 = [(_INPBIntentSlotResolutionResult *)self payloadSuccess];
  if (v27)
  {
    v28 = (void *)v27;
    v29 = [(_INPBIntentSlotResolutionResult *)self payloadSuccess];
    v30 = [v4 payloadSuccess];
    int v31 = [v29 isEqual:v30];

    if (!v31) {
      goto LABEL_32;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBIntentSlotResolutionResult *)self payloadUnsupported];
  unint64_t v6 = [v4 payloadUnsupported];
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_31:

    goto LABEL_32;
  }
  uint64_t v32 = [(_INPBIntentSlotResolutionResult *)self payloadUnsupported];
  if (v32)
  {
    v33 = (void *)v32;
    v34 = [(_INPBIntentSlotResolutionResult *)self payloadUnsupported];
    v35 = [v4 payloadUnsupported];
    int v36 = [v34 isEqual:v35];

    if (!v36) {
      goto LABEL_32;
    }
  }
  else
  {
  }
  int v39 = [(_INPBIntentSlotResolutionResult *)self hasType];
  if (v39 == [v4 hasType])
  {
    if (![(_INPBIntentSlotResolutionResult *)self hasType]
      || ![v4 hasType]
      || (int type = self->_type, type == [v4 type]))
    {
      BOOL v37 = 1;
      goto LABEL_33;
    }
  }
LABEL_32:
  BOOL v37 = 0;
LABEL_33:

  return v37;
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v5 = [+[_INPBIntentSlotResolutionResult allocWithZone:](_INPBIntentSlotResolutionResult, "allocWithZone:") init];
  id v6 = [(_INPBPayloadConfirmation *)self->_payloadConfirmation copyWithZone:a3];
  [(_INPBIntentSlotResolutionResult *)v5 setPayloadConfirmation:v6];

  id v7 = [(_INPBPayloadNeedsDisambiguation *)self->_payloadNeedsDisambiguation copyWithZone:a3];
  [(_INPBIntentSlotResolutionResult *)v5 setPayloadNeedsDisambiguation:v7];

  id v8 = [(_INPBPayloadNeedsExecuteIntent *)self->_payloadNeedsExecuteIntent copyWithZone:a3];
  [(_INPBIntentSlotResolutionResult *)v5 setPayloadNeedsExecuteIntent:v8];

  id v9 = [(_INPBPayloadNeedsValue *)self->_payloadNeedsValue copyWithZone:a3];
  [(_INPBIntentSlotResolutionResult *)v5 setPayloadNeedsValue:v9];

  id v10 = [(_INPBPayloadSuccess *)self->_payloadSuccess copyWithZone:a3];
  [(_INPBIntentSlotResolutionResult *)v5 setPayloadSuccess:v10];

  id v11 = [(_INPBPayloadUnsupported *)self->_payloadUnsupported copyWithZone:a3];
  [(_INPBIntentSlotResolutionResult *)v5 setPayloadUnsupported:v11];

  if ([(_INPBIntentSlotResolutionResult *)self hasType]) {
    [(_INPBIntentSlotResolutionResult *)v5 setType:[(_INPBIntentSlotResolutionResult *)self type]];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBIntentSlotResolutionResult *)self data];
  unint64_t v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBIntentSlotResolutionResult)initWithCoder:(id)a3
{
  id v4 = a3;
  unint64_t v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBIntentSlotResolutionResult *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        id v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBIntentSlotResolutionResult *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBIntentSlotResolutionResult *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  id v16 = a3;
  id v4 = [(_INPBIntentSlotResolutionResult *)self payloadConfirmation];

  if (v4)
  {
    unint64_t v5 = [(_INPBIntentSlotResolutionResult *)self payloadConfirmation];
    PBDataWriterWriteSubmessage();
  }
  id v6 = [(_INPBIntentSlotResolutionResult *)self payloadNeedsDisambiguation];

  if (v6)
  {
    uint64_t v7 = [(_INPBIntentSlotResolutionResult *)self payloadNeedsDisambiguation];
    PBDataWriterWriteSubmessage();
  }
  id v8 = [(_INPBIntentSlotResolutionResult *)self payloadNeedsExecuteIntent];

  if (v8)
  {
    id v9 = [(_INPBIntentSlotResolutionResult *)self payloadNeedsExecuteIntent];
    PBDataWriterWriteSubmessage();
  }
  id v10 = [(_INPBIntentSlotResolutionResult *)self payloadNeedsValue];

  if (v10)
  {
    id v11 = [(_INPBIntentSlotResolutionResult *)self payloadNeedsValue];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v12 = [(_INPBIntentSlotResolutionResult *)self payloadSuccess];

  if (v12)
  {
    v13 = [(_INPBIntentSlotResolutionResult *)self payloadSuccess];
    PBDataWriterWriteSubmessage();
  }
  v14 = [(_INPBIntentSlotResolutionResult *)self payloadUnsupported];

  if (v14)
  {
    v15 = [(_INPBIntentSlotResolutionResult *)self payloadUnsupported];
    PBDataWriterWriteSubmessage();
  }
  if ([(_INPBIntentSlotResolutionResult *)self hasType]) {
    PBDataWriterWriteInt32Field();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBIntentSlotResolutionResultReadFrom(self, (uint64_t)a3);
}

- (int)StringAsType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Success"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"Unsupported"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"NeedsValue"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"NeedsDisambiguation"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"NeedsConfirmation"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"NotRequired"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"CallerToResolve"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"CalleeNotImplemented"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"AuthenticationRequired"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"NeedsExecuteIntent"])
  {
    int v4 = 11;
  }
  else
  {
    int v4 = 1;
  }

  return v4;
}

- (id)typeAsString:(int)a3
{
  int v3 = a3 - 1;
  if (a3 - 1) < 0xB && ((0x7EFu >> v3))
  {
    int v4 = off_1E551C130[v3];
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    int v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  return v4;
}

- (void)setHasType:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasType
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setType:(int)a3
{
  char has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(unsigned char *)&self->_char has = has & 0xFE;
  }
  else
  {
    *(unsigned char *)&self->_char has = has | 1;
    self->_int type = a3;
  }
}

- (BOOL)hasPayloadUnsupported
{
  return self->_payloadUnsupported != 0;
}

- (void)setPayloadUnsupported:(id)a3
{
}

- (BOOL)hasPayloadSuccess
{
  return self->_payloadSuccess != 0;
}

- (void)setPayloadSuccess:(id)a3
{
}

- (BOOL)hasPayloadNeedsValue
{
  return self->_payloadNeedsValue != 0;
}

- (void)setPayloadNeedsValue:(id)a3
{
}

- (BOOL)hasPayloadNeedsExecuteIntent
{
  return self->_payloadNeedsExecuteIntent != 0;
}

- (void)setPayloadNeedsExecuteIntent:(id)a3
{
}

- (BOOL)hasPayloadNeedsDisambiguation
{
  return self->_payloadNeedsDisambiguation != 0;
}

- (void)setPayloadNeedsDisambiguation:(id)a3
{
}

- (BOOL)hasPayloadConfirmation
{
  return self->_payloadConfirmation != 0;
}

- (void)setPayloadConfirmation:(id)a3
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
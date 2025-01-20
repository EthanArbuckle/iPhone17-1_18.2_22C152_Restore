@interface _INPBSetSeatSettingsInCarIntent
+ (BOOL)supportsSecureCoding;
- (BOOL)enableCooling;
- (BOOL)enableHeating;
- (BOOL)enableMassage;
- (BOOL)hasCarName;
- (BOOL)hasEnableCooling;
- (BOOL)hasEnableHeating;
- (BOOL)hasEnableMassage;
- (BOOL)hasIntentMetadata;
- (BOOL)hasLevel;
- (BOOL)hasRelativeLevelSetting;
- (BOOL)hasSeat;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (_INPBDataString)carName;
- (_INPBInteger)level;
- (_INPBIntentMetadata)intentMetadata;
- (_INPBSetSeatSettingsInCarIntent)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (id)relativeLevelSettingAsString:(int)a3;
- (id)seatAsString:(int)a3;
- (int)StringAsRelativeLevelSetting:(id)a3;
- (int)StringAsSeat:(id)a3;
- (int)relativeLevelSetting;
- (int)seat;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setCarName:(id)a3;
- (void)setEnableCooling:(BOOL)a3;
- (void)setEnableHeating:(BOOL)a3;
- (void)setEnableMassage:(BOOL)a3;
- (void)setHasEnableCooling:(BOOL)a3;
- (void)setHasEnableHeating:(BOOL)a3;
- (void)setHasEnableMassage:(BOOL)a3;
- (void)setHasRelativeLevelSetting:(BOOL)a3;
- (void)setHasSeat:(BOOL)a3;
- (void)setIntentMetadata:(id)a3;
- (void)setLevel:(id)a3;
- (void)setRelativeLevelSetting:(int)a3;
- (void)setSeat:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBSetSeatSettingsInCarIntent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_level, 0);
  objc_storeStrong((id *)&self->_intentMetadata, 0);

  objc_storeStrong((id *)&self->_carName, 0);
}

- (int)seat
{
  return self->_seat;
}

- (int)relativeLevelSetting
{
  return self->_relativeLevelSetting;
}

- (_INPBInteger)level
{
  return self->_level;
}

- (_INPBIntentMetadata)intentMetadata
{
  return self->_intentMetadata;
}

- (BOOL)enableMassage
{
  return self->_enableMassage;
}

- (BOOL)enableHeating
{
  return self->_enableHeating;
}

- (BOOL)enableCooling
{
  return self->_enableCooling;
}

- (_INPBDataString)carName
{
  return self->_carName;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = [(_INPBSetSeatSettingsInCarIntent *)self carName];
  v5 = [v4 dictionaryRepresentation];
  [v3 setObject:v5 forKeyedSubscript:@"carName"];

  if ([(_INPBSetSeatSettingsInCarIntent *)self hasEnableCooling])
  {
    v6 = objc_msgSend(NSNumber, "numberWithBool:", -[_INPBSetSeatSettingsInCarIntent enableCooling](self, "enableCooling"));
    [v3 setObject:v6 forKeyedSubscript:@"enableCooling"];
  }
  if ([(_INPBSetSeatSettingsInCarIntent *)self hasEnableHeating])
  {
    v7 = objc_msgSend(NSNumber, "numberWithBool:", -[_INPBSetSeatSettingsInCarIntent enableHeating](self, "enableHeating"));
    [v3 setObject:v7 forKeyedSubscript:@"enableHeating"];
  }
  if ([(_INPBSetSeatSettingsInCarIntent *)self hasEnableMassage])
  {
    v8 = objc_msgSend(NSNumber, "numberWithBool:", -[_INPBSetSeatSettingsInCarIntent enableMassage](self, "enableMassage"));
    [v3 setObject:v8 forKeyedSubscript:@"enableMassage"];
  }
  v9 = [(_INPBSetSeatSettingsInCarIntent *)self intentMetadata];
  v10 = [v9 dictionaryRepresentation];
  [v3 setObject:v10 forKeyedSubscript:@"intentMetadata"];

  v11 = [(_INPBSetSeatSettingsInCarIntent *)self level];
  v12 = [v11 dictionaryRepresentation];
  [v3 setObject:v12 forKeyedSubscript:@"level"];

  if ([(_INPBSetSeatSettingsInCarIntent *)self hasRelativeLevelSetting])
  {
    uint64_t v13 = [(_INPBSetSeatSettingsInCarIntent *)self relativeLevelSetting];
    if ((v13 - 1) >= 4)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v13);
      v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v14 = off_1E551E1C8[(v13 - 1)];
    }
    [v3 setObject:v14 forKeyedSubscript:@"relativeLevelSetting"];
  }
  if ([(_INPBSetSeatSettingsInCarIntent *)self hasSeat])
  {
    uint64_t v15 = [(_INPBSetSeatSettingsInCarIntent *)self seat];
    int v16 = v15 - 1;
    if (v15 - 1) < 0x16 && ((0x3F8383u >> v16))
    {
      v17 = off_1E551E1E8[v16];
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v15);
      v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    [v3 setObject:v17 forKeyedSubscript:@"seat"];
  }

  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(_INPBDataString *)self->_carName hash];
  if ([(_INPBSetSeatSettingsInCarIntent *)self hasEnableCooling]) {
    uint64_t v4 = 2654435761 * self->_enableCooling;
  }
  else {
    uint64_t v4 = 0;
  }
  if ([(_INPBSetSeatSettingsInCarIntent *)self hasEnableHeating]) {
    uint64_t v5 = 2654435761 * self->_enableHeating;
  }
  else {
    uint64_t v5 = 0;
  }
  if ([(_INPBSetSeatSettingsInCarIntent *)self hasEnableMassage]) {
    uint64_t v6 = 2654435761 * self->_enableMassage;
  }
  else {
    uint64_t v6 = 0;
  }
  unint64_t v7 = [(_INPBIntentMetadata *)self->_intentMetadata hash];
  unint64_t v8 = [(_INPBInteger *)self->_level hash];
  if ([(_INPBSetSeatSettingsInCarIntent *)self hasRelativeLevelSetting]) {
    uint64_t v9 = 2654435761 * self->_relativeLevelSetting;
  }
  else {
    uint64_t v9 = 0;
  }
  if ([(_INPBSetSeatSettingsInCarIntent *)self hasSeat]) {
    uint64_t v10 = 2654435761 * self->_seat;
  }
  else {
    uint64_t v10 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_29;
  }
  uint64_t v5 = [(_INPBSetSeatSettingsInCarIntent *)self carName];
  uint64_t v6 = [v4 carName];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_28;
  }
  uint64_t v7 = [(_INPBSetSeatSettingsInCarIntent *)self carName];
  if (v7)
  {
    unint64_t v8 = (void *)v7;
    uint64_t v9 = [(_INPBSetSeatSettingsInCarIntent *)self carName];
    uint64_t v10 = [v4 carName];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_29;
    }
  }
  else
  {
  }
  int v12 = [(_INPBSetSeatSettingsInCarIntent *)self hasEnableCooling];
  if (v12 != [v4 hasEnableCooling]) {
    goto LABEL_29;
  }
  if ([(_INPBSetSeatSettingsInCarIntent *)self hasEnableCooling])
  {
    if ([v4 hasEnableCooling])
    {
      int enableCooling = self->_enableCooling;
      if (enableCooling != [v4 enableCooling]) {
        goto LABEL_29;
      }
    }
  }
  int v14 = [(_INPBSetSeatSettingsInCarIntent *)self hasEnableHeating];
  if (v14 != [v4 hasEnableHeating]) {
    goto LABEL_29;
  }
  if ([(_INPBSetSeatSettingsInCarIntent *)self hasEnableHeating])
  {
    if ([v4 hasEnableHeating])
    {
      int enableHeating = self->_enableHeating;
      if (enableHeating != [v4 enableHeating]) {
        goto LABEL_29;
      }
    }
  }
  int v16 = [(_INPBSetSeatSettingsInCarIntent *)self hasEnableMassage];
  if (v16 != [v4 hasEnableMassage]) {
    goto LABEL_29;
  }
  if ([(_INPBSetSeatSettingsInCarIntent *)self hasEnableMassage])
  {
    if ([v4 hasEnableMassage])
    {
      int enableMassage = self->_enableMassage;
      if (enableMassage != [v4 enableMassage]) {
        goto LABEL_29;
      }
    }
  }
  uint64_t v5 = [(_INPBSetSeatSettingsInCarIntent *)self intentMetadata];
  uint64_t v6 = [v4 intentMetadata];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_28;
  }
  uint64_t v18 = [(_INPBSetSeatSettingsInCarIntent *)self intentMetadata];
  if (v18)
  {
    v19 = (void *)v18;
    v20 = [(_INPBSetSeatSettingsInCarIntent *)self intentMetadata];
    v21 = [v4 intentMetadata];
    int v22 = [v20 isEqual:v21];

    if (!v22) {
      goto LABEL_29;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_INPBSetSeatSettingsInCarIntent *)self level];
  uint64_t v6 = [v4 level];
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_28:

    goto LABEL_29;
  }
  uint64_t v23 = [(_INPBSetSeatSettingsInCarIntent *)self level];
  if (v23)
  {
    v24 = (void *)v23;
    v25 = [(_INPBSetSeatSettingsInCarIntent *)self level];
    v26 = [v4 level];
    int v27 = [v25 isEqual:v26];

    if (!v27) {
      goto LABEL_29;
    }
  }
  else
  {
  }
  int v30 = [(_INPBSetSeatSettingsInCarIntent *)self hasRelativeLevelSetting];
  if (v30 == [v4 hasRelativeLevelSetting])
  {
    if (![(_INPBSetSeatSettingsInCarIntent *)self hasRelativeLevelSetting]
      || ![v4 hasRelativeLevelSetting]
      || (int relativeLevelSetting = self->_relativeLevelSetting,
          relativeLevelSetting == [v4 relativeLevelSetting]))
    {
      int v32 = [(_INPBSetSeatSettingsInCarIntent *)self hasSeat];
      if (v32 == [v4 hasSeat])
      {
        if (![(_INPBSetSeatSettingsInCarIntent *)self hasSeat]
          || ![v4 hasSeat]
          || (int seat = self->_seat, seat == [v4 seat]))
        {
          BOOL v28 = 1;
          goto LABEL_30;
        }
      }
    }
  }
LABEL_29:
  BOOL v28 = 0;
LABEL_30:

  return v28;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = [+[_INPBSetSeatSettingsInCarIntent allocWithZone:](_INPBSetSeatSettingsInCarIntent, "allocWithZone:") init];
  id v6 = [(_INPBDataString *)self->_carName copyWithZone:a3];
  [(_INPBSetSeatSettingsInCarIntent *)v5 setCarName:v6];

  if ([(_INPBSetSeatSettingsInCarIntent *)self hasEnableCooling]) {
    [(_INPBSetSeatSettingsInCarIntent *)v5 setEnableCooling:[(_INPBSetSeatSettingsInCarIntent *)self enableCooling]];
  }
  if ([(_INPBSetSeatSettingsInCarIntent *)self hasEnableHeating]) {
    [(_INPBSetSeatSettingsInCarIntent *)v5 setEnableHeating:[(_INPBSetSeatSettingsInCarIntent *)self enableHeating]];
  }
  if ([(_INPBSetSeatSettingsInCarIntent *)self hasEnableMassage]) {
    [(_INPBSetSeatSettingsInCarIntent *)v5 setEnableMassage:[(_INPBSetSeatSettingsInCarIntent *)self enableMassage]];
  }
  id v7 = [(_INPBIntentMetadata *)self->_intentMetadata copyWithZone:a3];
  [(_INPBSetSeatSettingsInCarIntent *)v5 setIntentMetadata:v7];

  id v8 = [(_INPBInteger *)self->_level copyWithZone:a3];
  [(_INPBSetSeatSettingsInCarIntent *)v5 setLevel:v8];

  if ([(_INPBSetSeatSettingsInCarIntent *)self hasRelativeLevelSetting]) {
    [(_INPBSetSeatSettingsInCarIntent *)v5 setRelativeLevelSetting:[(_INPBSetSeatSettingsInCarIntent *)self relativeLevelSetting]];
  }
  if ([(_INPBSetSeatSettingsInCarIntent *)self hasSeat]) {
    [(_INPBSetSeatSettingsInCarIntent *)v5 setSeat:[(_INPBSetSeatSettingsInCarIntent *)self seat]];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBSetSeatSettingsInCarIntent *)self data];
  uint64_t v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBSetSeatSettingsInCarIntent)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBSetSeatSettingsInCarIntent *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        id v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBSetSeatSettingsInCarIntent *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBSetSeatSettingsInCarIntent *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  id v10 = a3;
  id v4 = [(_INPBSetSeatSettingsInCarIntent *)self carName];

  if (v4)
  {
    uint64_t v5 = [(_INPBSetSeatSettingsInCarIntent *)self carName];
    PBDataWriterWriteSubmessage();
  }
  if ([(_INPBSetSeatSettingsInCarIntent *)self hasEnableCooling]) {
    PBDataWriterWriteBOOLField();
  }
  if ([(_INPBSetSeatSettingsInCarIntent *)self hasEnableHeating]) {
    PBDataWriterWriteBOOLField();
  }
  if ([(_INPBSetSeatSettingsInCarIntent *)self hasEnableMassage]) {
    PBDataWriterWriteBOOLField();
  }
  id v6 = [(_INPBSetSeatSettingsInCarIntent *)self intentMetadata];

  if (v6)
  {
    uint64_t v7 = [(_INPBSetSeatSettingsInCarIntent *)self intentMetadata];
    PBDataWriterWriteSubmessage();
  }
  id v8 = [(_INPBSetSeatSettingsInCarIntent *)self level];

  if (v8)
  {
    uint64_t v9 = [(_INPBSetSeatSettingsInCarIntent *)self level];
    PBDataWriterWriteSubmessage();
  }
  if ([(_INPBSetSeatSettingsInCarIntent *)self hasRelativeLevelSetting]) {
    PBDataWriterWriteInt32Field();
  }
  if ([(_INPBSetSeatSettingsInCarIntent *)self hasSeat]) {
    PBDataWriterWriteInt32Field();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBSetSeatSettingsInCarIntentReadFrom(self, (uint64_t)a3);
}

- (int)StringAsSeat:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"DRIVER"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"PASSENGER"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"FRONT_LEFT"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"FRONT_RIGHT"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"FRONT"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"REAR_LEFT"])
  {
    int v4 = 16;
  }
  else if ([v3 isEqualToString:@"REAR_RIGHT"])
  {
    int v4 = 17;
  }
  else if ([v3 isEqualToString:@"REAR"])
  {
    int v4 = 18;
  }
  else if ([v3 isEqualToString:@"THIRD_ROW_LEFT"])
  {
    int v4 = 19;
  }
  else if ([v3 isEqualToString:@"THIRD_ROW_RIGHT"])
  {
    int v4 = 20;
  }
  else if ([v3 isEqualToString:@"THIRD_ROW"])
  {
    int v4 = 21;
  }
  else if ([v3 isEqualToString:@"ALL"])
  {
    int v4 = 22;
  }
  else
  {
    int v4 = 1;
  }

  return v4;
}

- (id)seatAsString:(int)a3
{
  int v3 = a3 - 1;
  if (a3 - 1) < 0x16 && ((0x3F8383u >> v3))
  {
    int v4 = off_1E551E1E8[v3];
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    int v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  return v4;
}

- (void)setHasSeat:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasSeat
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setSeat:(int)a3
{
  char has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(unsigned char *)&self->_char has = has & 0xEF;
  }
  else
  {
    *(unsigned char *)&self->_char has = has | 0x10;
    self->_int seat = a3;
  }
}

- (int)StringAsRelativeLevelSetting:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"LOWEST"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"LOWER"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"HIGHER"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"HIGHEST"])
  {
    int v4 = 4;
  }
  else
  {
    int v4 = 1;
  }

  return v4;
}

- (id)relativeLevelSettingAsString:(int)a3
{
  if ((a3 - 1) >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E551E1C8[a3 - 1];
  }

  return v3;
}

- (void)setHasRelativeLevelSetting:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasRelativeLevelSetting
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setRelativeLevelSetting:(int)a3
{
  char has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(unsigned char *)&self->_char has = has & 0xF7;
  }
  else
  {
    *(unsigned char *)&self->_char has = has | 8;
    self->_int relativeLevelSetting = a3;
  }
}

- (BOOL)hasLevel
{
  return self->_level != 0;
}

- (void)setLevel:(id)a3
{
}

- (BOOL)hasIntentMetadata
{
  return self->_intentMetadata != 0;
}

- (void)setIntentMetadata:(id)a3
{
}

- (void)setHasEnableMassage:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasEnableMassage
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setEnableMassage:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_int enableMassage = a3;
}

- (void)setHasEnableHeating:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasEnableHeating
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setEnableHeating:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_int enableHeating = a3;
}

- (void)setHasEnableCooling:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasEnableCooling
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setEnableCooling:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int enableCooling = a3;
}

- (BOOL)hasCarName
{
  return self->_carName != 0;
}

- (void)setCarName:(id)a3
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
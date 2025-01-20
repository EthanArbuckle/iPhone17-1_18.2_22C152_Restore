@interface _INPBSetRadioStationIntent
+ (BOOL)supportsSecureCoding;
- (BOOL)hasChannel;
- (BOOL)hasFrequency;
- (BOOL)hasIntentMetadata;
- (BOOL)hasPresetNumber;
- (BOOL)hasRadioType;
- (BOOL)hasStationName;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (_INPBDouble)frequency;
- (_INPBInteger)presetNumber;
- (_INPBIntentMetadata)intentMetadata;
- (_INPBSetRadioStationIntent)initWithCoder:(id)a3;
- (_INPBString)channel;
- (_INPBString)stationName;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (id)radioTypeAsString:(int)a3;
- (int)StringAsRadioType:(id)a3;
- (int)radioType;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setChannel:(id)a3;
- (void)setFrequency:(id)a3;
- (void)setHasRadioType:(BOOL)a3;
- (void)setIntentMetadata:(id)a3;
- (void)setPresetNumber:(id)a3;
- (void)setRadioType:(int)a3;
- (void)setStationName:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBSetRadioStationIntent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stationName, 0);
  objc_storeStrong((id *)&self->_presetNumber, 0);
  objc_storeStrong((id *)&self->_intentMetadata, 0);
  objc_storeStrong((id *)&self->_frequency, 0);

  objc_storeStrong((id *)&self->_channel, 0);
}

- (_INPBString)stationName
{
  return self->_stationName;
}

- (int)radioType
{
  return self->_radioType;
}

- (_INPBInteger)presetNumber
{
  return self->_presetNumber;
}

- (_INPBIntentMetadata)intentMetadata
{
  return self->_intentMetadata;
}

- (_INPBDouble)frequency
{
  return self->_frequency;
}

- (_INPBString)channel
{
  return self->_channel;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = [(_INPBSetRadioStationIntent *)self channel];
  v5 = [v4 dictionaryRepresentation];
  [v3 setObject:v5 forKeyedSubscript:@"channel"];

  v6 = [(_INPBSetRadioStationIntent *)self frequency];
  v7 = [v6 dictionaryRepresentation];
  [v3 setObject:v7 forKeyedSubscript:@"frequency"];

  v8 = [(_INPBSetRadioStationIntent *)self intentMetadata];
  v9 = [v8 dictionaryRepresentation];
  [v3 setObject:v9 forKeyedSubscript:@"intentMetadata"];

  v10 = [(_INPBSetRadioStationIntent *)self presetNumber];
  v11 = [v10 dictionaryRepresentation];
  [v3 setObject:v11 forKeyedSubscript:@"presetNumber"];

  if ([(_INPBSetRadioStationIntent *)self hasRadioType])
  {
    uint64_t v12 = [(_INPBSetRadioStationIntent *)self radioType];
    if ((v12 - 1) >= 5)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v12);
      v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = off_1E551B868[(v12 - 1)];
    }
    [v3 setObject:v13 forKeyedSubscript:@"radioType"];
  }
  v14 = [(_INPBSetRadioStationIntent *)self stationName];
  v15 = [v14 dictionaryRepresentation];
  [v3 setObject:v15 forKeyedSubscript:@"stationName"];

  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(_INPBString *)self->_channel hash];
  unint64_t v4 = [(_INPBDouble *)self->_frequency hash];
  unint64_t v5 = [(_INPBIntentMetadata *)self->_intentMetadata hash];
  unint64_t v6 = [(_INPBInteger *)self->_presetNumber hash];
  if ([(_INPBSetRadioStationIntent *)self hasRadioType]) {
    uint64_t v7 = 2654435761 * self->_radioType;
  }
  else {
    uint64_t v7 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ [(_INPBString *)self->_stationName hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_31;
  }
  unint64_t v5 = [(_INPBSetRadioStationIntent *)self channel];
  unint64_t v6 = [v4 channel];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_30;
  }
  uint64_t v7 = [(_INPBSetRadioStationIntent *)self channel];
  if (v7)
  {
    v8 = (void *)v7;
    v9 = [(_INPBSetRadioStationIntent *)self channel];
    v10 = [v4 channel];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_31;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBSetRadioStationIntent *)self frequency];
  unint64_t v6 = [v4 frequency];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_30;
  }
  uint64_t v12 = [(_INPBSetRadioStationIntent *)self frequency];
  if (v12)
  {
    v13 = (void *)v12;
    v14 = [(_INPBSetRadioStationIntent *)self frequency];
    v15 = [v4 frequency];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_31;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBSetRadioStationIntent *)self intentMetadata];
  unint64_t v6 = [v4 intentMetadata];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_30;
  }
  uint64_t v17 = [(_INPBSetRadioStationIntent *)self intentMetadata];
  if (v17)
  {
    v18 = (void *)v17;
    v19 = [(_INPBSetRadioStationIntent *)self intentMetadata];
    v20 = [v4 intentMetadata];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_31;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBSetRadioStationIntent *)self presetNumber];
  unint64_t v6 = [v4 presetNumber];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_30;
  }
  uint64_t v22 = [(_INPBSetRadioStationIntent *)self presetNumber];
  if (v22)
  {
    v23 = (void *)v22;
    v24 = [(_INPBSetRadioStationIntent *)self presetNumber];
    v25 = [v4 presetNumber];
    int v26 = [v24 isEqual:v25];

    if (!v26) {
      goto LABEL_31;
    }
  }
  else
  {
  }
  int v27 = [(_INPBSetRadioStationIntent *)self hasRadioType];
  if (v27 != [v4 hasRadioType]) {
    goto LABEL_31;
  }
  if ([(_INPBSetRadioStationIntent *)self hasRadioType])
  {
    if ([v4 hasRadioType])
    {
      int radioType = self->_radioType;
      if (radioType != [v4 radioType]) {
        goto LABEL_31;
      }
    }
  }
  unint64_t v5 = [(_INPBSetRadioStationIntent *)self stationName];
  unint64_t v6 = [v4 stationName];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v29 = [(_INPBSetRadioStationIntent *)self stationName];
    if (!v29)
    {

LABEL_34:
      BOOL v34 = 1;
      goto LABEL_32;
    }
    v30 = (void *)v29;
    v31 = [(_INPBSetRadioStationIntent *)self stationName];
    v32 = [v4 stationName];
    char v33 = [v31 isEqual:v32];

    if (v33) {
      goto LABEL_34;
    }
  }
  else
  {
LABEL_30:
  }
LABEL_31:
  BOOL v34 = 0;
LABEL_32:

  return v34;
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v5 = [+[_INPBSetRadioStationIntent allocWithZone:](_INPBSetRadioStationIntent, "allocWithZone:") init];
  id v6 = [(_INPBString *)self->_channel copyWithZone:a3];
  [(_INPBSetRadioStationIntent *)v5 setChannel:v6];

  id v7 = [(_INPBDouble *)self->_frequency copyWithZone:a3];
  [(_INPBSetRadioStationIntent *)v5 setFrequency:v7];

  id v8 = [(_INPBIntentMetadata *)self->_intentMetadata copyWithZone:a3];
  [(_INPBSetRadioStationIntent *)v5 setIntentMetadata:v8];

  id v9 = [(_INPBInteger *)self->_presetNumber copyWithZone:a3];
  [(_INPBSetRadioStationIntent *)v5 setPresetNumber:v9];

  if ([(_INPBSetRadioStationIntent *)self hasRadioType]) {
    [(_INPBSetRadioStationIntent *)v5 setRadioType:[(_INPBSetRadioStationIntent *)self radioType]];
  }
  id v10 = [(_INPBString *)self->_stationName copyWithZone:a3];
  [(_INPBSetRadioStationIntent *)v5 setStationName:v10];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBSetRadioStationIntent *)self data];
  unint64_t v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBSetRadioStationIntent)initWithCoder:(id)a3
{
  id v4 = a3;
  unint64_t v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBSetRadioStationIntent *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        id v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBSetRadioStationIntent *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBSetRadioStationIntent *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  id v15 = a3;
  id v4 = [(_INPBSetRadioStationIntent *)self channel];

  if (v4)
  {
    unint64_t v5 = [(_INPBSetRadioStationIntent *)self channel];
    PBDataWriterWriteSubmessage();
  }
  id v6 = [(_INPBSetRadioStationIntent *)self frequency];

  if (v6)
  {
    uint64_t v7 = [(_INPBSetRadioStationIntent *)self frequency];
    PBDataWriterWriteSubmessage();
  }
  id v8 = [(_INPBSetRadioStationIntent *)self intentMetadata];

  if (v8)
  {
    id v9 = [(_INPBSetRadioStationIntent *)self intentMetadata];
    PBDataWriterWriteSubmessage();
  }
  id v10 = [(_INPBSetRadioStationIntent *)self presetNumber];

  if (v10)
  {
    int v11 = [(_INPBSetRadioStationIntent *)self presetNumber];
    PBDataWriterWriteSubmessage();
  }
  if ([(_INPBSetRadioStationIntent *)self hasRadioType]) {
    PBDataWriterWriteInt32Field();
  }
  uint64_t v12 = [(_INPBSetRadioStationIntent *)self stationName];

  v13 = v15;
  if (v12)
  {
    v14 = [(_INPBSetRadioStationIntent *)self stationName];
    PBDataWriterWriteSubmessage();

    v13 = v15;
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBSetRadioStationIntentReadFrom(self, (uint64_t)a3);
}

- (BOOL)hasStationName
{
  return self->_stationName != 0;
}

- (void)setStationName:(id)a3
{
}

- (int)StringAsRadioType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"AM"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"FM"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"HD"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"SATELLITE"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"DAB"])
  {
    int v4 = 5;
  }
  else
  {
    int v4 = 1;
  }

  return v4;
}

- (id)radioTypeAsString:(int)a3
{
  if ((a3 - 1) >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E551B868[a3 - 1];
  }

  return v3;
}

- (void)setHasRadioType:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasRadioType
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setRadioType:(int)a3
{
  char has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(unsigned char *)&self->_char has = has & 0xFE;
  }
  else
  {
    *(unsigned char *)&self->_char has = has | 1;
    self->_int radioType = a3;
  }
}

- (BOOL)hasPresetNumber
{
  return self->_presetNumber != 0;
}

- (void)setPresetNumber:(id)a3
{
}

- (BOOL)hasIntentMetadata
{
  return self->_intentMetadata != 0;
}

- (void)setIntentMetadata:(id)a3
{
}

- (BOOL)hasFrequency
{
  return self->_frequency != 0;
}

- (void)setFrequency:(id)a3
{
}

- (BOOL)hasChannel
{
  return self->_channel != 0;
}

- (void)setChannel:(id)a3
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
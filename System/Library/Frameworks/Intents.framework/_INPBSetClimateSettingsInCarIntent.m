@interface _INPBSetClimateSettingsInCarIntent
+ (BOOL)supportsSecureCoding;
- (BOOL)enableAirConditioner;
- (BOOL)enableAutoMode;
- (BOOL)enableClimateControl;
- (BOOL)enableFan;
- (BOOL)hasAirCirculationMode;
- (BOOL)hasCarName;
- (BOOL)hasClimateZone;
- (BOOL)hasEnableAirConditioner;
- (BOOL)hasEnableAutoMode;
- (BOOL)hasEnableClimateControl;
- (BOOL)hasEnableFan;
- (BOOL)hasFanSpeedIndex;
- (BOOL)hasFanSpeedPercentage;
- (BOOL)hasIntentMetadata;
- (BOOL)hasRelativeFanSpeedSetting;
- (BOOL)hasRelativeTemperatureSetting;
- (BOOL)hasTemperature;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (_INPBDataString)carName;
- (_INPBDouble)fanSpeedPercentage;
- (_INPBInteger)fanSpeedIndex;
- (_INPBIntentMetadata)intentMetadata;
- (_INPBSetClimateSettingsInCarIntent)initWithCoder:(id)a3;
- (_INPBTemperature)temperature;
- (id)airCirculationModeAsString:(int)a3;
- (id)climateZoneAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (id)relativeFanSpeedSettingAsString:(int)a3;
- (id)relativeTemperatureSettingAsString:(int)a3;
- (int)StringAsAirCirculationMode:(id)a3;
- (int)StringAsClimateZone:(id)a3;
- (int)StringAsRelativeFanSpeedSetting:(id)a3;
- (int)StringAsRelativeTemperatureSetting:(id)a3;
- (int)airCirculationMode;
- (int)climateZone;
- (int)relativeFanSpeedSetting;
- (int)relativeTemperatureSetting;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setAirCirculationMode:(int)a3;
- (void)setCarName:(id)a3;
- (void)setClimateZone:(int)a3;
- (void)setEnableAirConditioner:(BOOL)a3;
- (void)setEnableAutoMode:(BOOL)a3;
- (void)setEnableClimateControl:(BOOL)a3;
- (void)setEnableFan:(BOOL)a3;
- (void)setFanSpeedIndex:(id)a3;
- (void)setFanSpeedPercentage:(id)a3;
- (void)setHasAirCirculationMode:(BOOL)a3;
- (void)setHasClimateZone:(BOOL)a3;
- (void)setHasEnableAirConditioner:(BOOL)a3;
- (void)setHasEnableAutoMode:(BOOL)a3;
- (void)setHasEnableClimateControl:(BOOL)a3;
- (void)setHasEnableFan:(BOOL)a3;
- (void)setHasRelativeFanSpeedSetting:(BOOL)a3;
- (void)setHasRelativeTemperatureSetting:(BOOL)a3;
- (void)setIntentMetadata:(id)a3;
- (void)setRelativeFanSpeedSetting:(int)a3;
- (void)setRelativeTemperatureSetting:(int)a3;
- (void)setTemperature:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBSetClimateSettingsInCarIntent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_temperature, 0);
  objc_storeStrong((id *)&self->_intentMetadata, 0);
  objc_storeStrong((id *)&self->_fanSpeedPercentage, 0);
  objc_storeStrong((id *)&self->_fanSpeedIndex, 0);

  objc_storeStrong((id *)&self->_carName, 0);
}

- (_INPBTemperature)temperature
{
  return self->_temperature;
}

- (int)relativeTemperatureSetting
{
  return self->_relativeTemperatureSetting;
}

- (int)relativeFanSpeedSetting
{
  return self->_relativeFanSpeedSetting;
}

- (_INPBIntentMetadata)intentMetadata
{
  return self->_intentMetadata;
}

- (_INPBDouble)fanSpeedPercentage
{
  return self->_fanSpeedPercentage;
}

- (_INPBInteger)fanSpeedIndex
{
  return self->_fanSpeedIndex;
}

- (BOOL)enableFan
{
  return self->_enableFan;
}

- (BOOL)enableClimateControl
{
  return self->_enableClimateControl;
}

- (BOOL)enableAutoMode
{
  return self->_enableAutoMode;
}

- (BOOL)enableAirConditioner
{
  return self->_enableAirConditioner;
}

- (int)climateZone
{
  return self->_climateZone;
}

- (_INPBDataString)carName
{
  return self->_carName;
}

- (int)airCirculationMode
{
  return self->_airCirculationMode;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(_INPBSetClimateSettingsInCarIntent *)self hasAirCirculationMode])
  {
    uint64_t v4 = [(_INPBSetClimateSettingsInCarIntent *)self airCirculationMode];
    if (v4 == 1)
    {
      v5 = @"FRESH_AIR";
    }
    else if (v4 == 2)
    {
      v5 = @"RECIRCULATE_AIR";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v4);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    [v3 setObject:v5 forKeyedSubscript:@"airCirculationMode"];
  }
  v6 = [(_INPBSetClimateSettingsInCarIntent *)self carName];
  v7 = [v6 dictionaryRepresentation];
  [v3 setObject:v7 forKeyedSubscript:@"carName"];

  if ([(_INPBSetClimateSettingsInCarIntent *)self hasClimateZone])
  {
    uint64_t v8 = [(_INPBSetClimateSettingsInCarIntent *)self climateZone];
    int v9 = v8 - 1;
    if (v8 - 1) < 0x16 && ((0x3F8383u >> v9))
    {
      v10 = off_1E5519120[v9];
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v8);
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    [v3 setObject:v10 forKeyedSubscript:@"climateZone"];
  }
  if ([(_INPBSetClimateSettingsInCarIntent *)self hasEnableAirConditioner])
  {
    v11 = objc_msgSend(NSNumber, "numberWithBool:", -[_INPBSetClimateSettingsInCarIntent enableAirConditioner](self, "enableAirConditioner"));
    [v3 setObject:v11 forKeyedSubscript:@"enableAirConditioner"];
  }
  if ([(_INPBSetClimateSettingsInCarIntent *)self hasEnableAutoMode])
  {
    v12 = objc_msgSend(NSNumber, "numberWithBool:", -[_INPBSetClimateSettingsInCarIntent enableAutoMode](self, "enableAutoMode"));
    [v3 setObject:v12 forKeyedSubscript:@"enableAutoMode"];
  }
  if ([(_INPBSetClimateSettingsInCarIntent *)self hasEnableClimateControl])
  {
    v13 = objc_msgSend(NSNumber, "numberWithBool:", -[_INPBSetClimateSettingsInCarIntent enableClimateControl](self, "enableClimateControl"));
    [v3 setObject:v13 forKeyedSubscript:@"enableClimateControl"];
  }
  if ([(_INPBSetClimateSettingsInCarIntent *)self hasEnableFan])
  {
    v14 = objc_msgSend(NSNumber, "numberWithBool:", -[_INPBSetClimateSettingsInCarIntent enableFan](self, "enableFan"));
    [v3 setObject:v14 forKeyedSubscript:@"enableFan"];
  }
  v15 = [(_INPBSetClimateSettingsInCarIntent *)self fanSpeedIndex];
  v16 = [v15 dictionaryRepresentation];
  [v3 setObject:v16 forKeyedSubscript:@"fanSpeedIndex"];

  v17 = [(_INPBSetClimateSettingsInCarIntent *)self fanSpeedPercentage];
  v18 = [v17 dictionaryRepresentation];
  [v3 setObject:v18 forKeyedSubscript:@"fanSpeedPercentage"];

  v19 = [(_INPBSetClimateSettingsInCarIntent *)self intentMetadata];
  v20 = [v19 dictionaryRepresentation];
  [v3 setObject:v20 forKeyedSubscript:@"intentMetadata"];

  if ([(_INPBSetClimateSettingsInCarIntent *)self hasRelativeFanSpeedSetting])
  {
    uint64_t v21 = [(_INPBSetClimateSettingsInCarIntent *)self relativeFanSpeedSetting];
    if ((v21 - 1) >= 4)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v21);
      v22 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v22 = off_1E55191D0[(v21 - 1)];
    }
    [v3 setObject:v22 forKeyedSubscript:@"relativeFanSpeedSetting"];
  }
  if ([(_INPBSetClimateSettingsInCarIntent *)self hasRelativeTemperatureSetting])
  {
    uint64_t v23 = [(_INPBSetClimateSettingsInCarIntent *)self relativeTemperatureSetting];
    if ((v23 - 1) >= 4)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v23);
      v24 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v24 = off_1E55191D0[(v23 - 1)];
    }
    [v3 setObject:v24 forKeyedSubscript:@"relativeTemperatureSetting"];
  }
  v25 = [(_INPBSetClimateSettingsInCarIntent *)self temperature];
  v26 = [v25 dictionaryRepresentation];
  [v3 setObject:v26 forKeyedSubscript:@"temperature"];

  return v3;
}

- (unint64_t)hash
{
  if ([(_INPBSetClimateSettingsInCarIntent *)self hasAirCirculationMode]) {
    uint64_t v15 = 2654435761 * self->_airCirculationMode;
  }
  else {
    uint64_t v15 = 0;
  }
  unint64_t v14 = [(_INPBDataString *)self->_carName hash];
  if ([(_INPBSetClimateSettingsInCarIntent *)self hasClimateZone]) {
    uint64_t v13 = 2654435761 * self->_climateZone;
  }
  else {
    uint64_t v13 = 0;
  }
  if ([(_INPBSetClimateSettingsInCarIntent *)self hasEnableAirConditioner]) {
    uint64_t v3 = 2654435761 * self->_enableAirConditioner;
  }
  else {
    uint64_t v3 = 0;
  }
  if ([(_INPBSetClimateSettingsInCarIntent *)self hasEnableAutoMode]) {
    uint64_t v4 = 2654435761 * self->_enableAutoMode;
  }
  else {
    uint64_t v4 = 0;
  }
  if ([(_INPBSetClimateSettingsInCarIntent *)self hasEnableClimateControl]) {
    uint64_t v5 = 2654435761 * self->_enableClimateControl;
  }
  else {
    uint64_t v5 = 0;
  }
  if ([(_INPBSetClimateSettingsInCarIntent *)self hasEnableFan]) {
    uint64_t v6 = 2654435761 * self->_enableFan;
  }
  else {
    uint64_t v6 = 0;
  }
  unint64_t v7 = [(_INPBInteger *)self->_fanSpeedIndex hash];
  unint64_t v8 = [(_INPBDouble *)self->_fanSpeedPercentage hash];
  unint64_t v9 = [(_INPBIntentMetadata *)self->_intentMetadata hash];
  if ([(_INPBSetClimateSettingsInCarIntent *)self hasRelativeFanSpeedSetting]) {
    uint64_t v10 = 2654435761 * self->_relativeFanSpeedSetting;
  }
  else {
    uint64_t v10 = 0;
  }
  if ([(_INPBSetClimateSettingsInCarIntent *)self hasRelativeTemperatureSetting]) {
    uint64_t v11 = 2654435761 * self->_relativeTemperatureSetting;
  }
  else {
    uint64_t v11 = 0;
  }
  return v14 ^ v15 ^ v13 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ [(_INPBTemperature *)self->_temperature hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_59;
  }
  int v5 = [(_INPBSetClimateSettingsInCarIntent *)self hasAirCirculationMode];
  if (v5 != [v4 hasAirCirculationMode]) {
    goto LABEL_59;
  }
  if ([(_INPBSetClimateSettingsInCarIntent *)self hasAirCirculationMode])
  {
    if ([v4 hasAirCirculationMode])
    {
      int airCirculationMode = self->_airCirculationMode;
      if (airCirculationMode != [v4 airCirculationMode]) {
        goto LABEL_59;
      }
    }
  }
  unint64_t v7 = [(_INPBSetClimateSettingsInCarIntent *)self carName];
  unint64_t v8 = [v4 carName];
  if ((v7 == 0) == (v8 != 0)) {
    goto LABEL_58;
  }
  uint64_t v9 = [(_INPBSetClimateSettingsInCarIntent *)self carName];
  if (v9)
  {
    uint64_t v10 = (void *)v9;
    uint64_t v11 = [(_INPBSetClimateSettingsInCarIntent *)self carName];
    v12 = [v4 carName];
    int v13 = [v11 isEqual:v12];

    if (!v13) {
      goto LABEL_59;
    }
  }
  else
  {
  }
  int v14 = [(_INPBSetClimateSettingsInCarIntent *)self hasClimateZone];
  if (v14 != [v4 hasClimateZone]) {
    goto LABEL_59;
  }
  if ([(_INPBSetClimateSettingsInCarIntent *)self hasClimateZone])
  {
    if ([v4 hasClimateZone])
    {
      int climateZone = self->_climateZone;
      if (climateZone != [v4 climateZone]) {
        goto LABEL_59;
      }
    }
  }
  int v16 = [(_INPBSetClimateSettingsInCarIntent *)self hasEnableAirConditioner];
  if (v16 != [v4 hasEnableAirConditioner]) {
    goto LABEL_59;
  }
  if ([(_INPBSetClimateSettingsInCarIntent *)self hasEnableAirConditioner])
  {
    if ([v4 hasEnableAirConditioner])
    {
      int enableAirConditioner = self->_enableAirConditioner;
      if (enableAirConditioner != [v4 enableAirConditioner]) {
        goto LABEL_59;
      }
    }
  }
  int v18 = [(_INPBSetClimateSettingsInCarIntent *)self hasEnableAutoMode];
  if (v18 != [v4 hasEnableAutoMode]) {
    goto LABEL_59;
  }
  if ([(_INPBSetClimateSettingsInCarIntent *)self hasEnableAutoMode])
  {
    if ([v4 hasEnableAutoMode])
    {
      int enableAutoMode = self->_enableAutoMode;
      if (enableAutoMode != [v4 enableAutoMode]) {
        goto LABEL_59;
      }
    }
  }
  int v20 = [(_INPBSetClimateSettingsInCarIntent *)self hasEnableClimateControl];
  if (v20 != [v4 hasEnableClimateControl]) {
    goto LABEL_59;
  }
  if ([(_INPBSetClimateSettingsInCarIntent *)self hasEnableClimateControl])
  {
    if ([v4 hasEnableClimateControl])
    {
      int enableClimateControl = self->_enableClimateControl;
      if (enableClimateControl != [v4 enableClimateControl]) {
        goto LABEL_59;
      }
    }
  }
  int v22 = [(_INPBSetClimateSettingsInCarIntent *)self hasEnableFan];
  if (v22 != [v4 hasEnableFan]) {
    goto LABEL_59;
  }
  if ([(_INPBSetClimateSettingsInCarIntent *)self hasEnableFan])
  {
    if ([v4 hasEnableFan])
    {
      int enableFan = self->_enableFan;
      if (enableFan != [v4 enableFan]) {
        goto LABEL_59;
      }
    }
  }
  unint64_t v7 = [(_INPBSetClimateSettingsInCarIntent *)self fanSpeedIndex];
  unint64_t v8 = [v4 fanSpeedIndex];
  if ((v7 == 0) == (v8 != 0)) {
    goto LABEL_58;
  }
  uint64_t v24 = [(_INPBSetClimateSettingsInCarIntent *)self fanSpeedIndex];
  if (v24)
  {
    v25 = (void *)v24;
    v26 = [(_INPBSetClimateSettingsInCarIntent *)self fanSpeedIndex];
    v27 = [v4 fanSpeedIndex];
    int v28 = [v26 isEqual:v27];

    if (!v28) {
      goto LABEL_59;
    }
  }
  else
  {
  }
  unint64_t v7 = [(_INPBSetClimateSettingsInCarIntent *)self fanSpeedPercentage];
  unint64_t v8 = [v4 fanSpeedPercentage];
  if ((v7 == 0) == (v8 != 0)) {
    goto LABEL_58;
  }
  uint64_t v29 = [(_INPBSetClimateSettingsInCarIntent *)self fanSpeedPercentage];
  if (v29)
  {
    v30 = (void *)v29;
    v31 = [(_INPBSetClimateSettingsInCarIntent *)self fanSpeedPercentage];
    v32 = [v4 fanSpeedPercentage];
    int v33 = [v31 isEqual:v32];

    if (!v33) {
      goto LABEL_59;
    }
  }
  else
  {
  }
  unint64_t v7 = [(_INPBSetClimateSettingsInCarIntent *)self intentMetadata];
  unint64_t v8 = [v4 intentMetadata];
  if ((v7 == 0) == (v8 != 0)) {
    goto LABEL_58;
  }
  uint64_t v34 = [(_INPBSetClimateSettingsInCarIntent *)self intentMetadata];
  if (v34)
  {
    v35 = (void *)v34;
    v36 = [(_INPBSetClimateSettingsInCarIntent *)self intentMetadata];
    v37 = [v4 intentMetadata];
    int v38 = [v36 isEqual:v37];

    if (!v38) {
      goto LABEL_59;
    }
  }
  else
  {
  }
  int v39 = [(_INPBSetClimateSettingsInCarIntent *)self hasRelativeFanSpeedSetting];
  if (v39 != [v4 hasRelativeFanSpeedSetting]) {
    goto LABEL_59;
  }
  if ([(_INPBSetClimateSettingsInCarIntent *)self hasRelativeFanSpeedSetting])
  {
    if ([v4 hasRelativeFanSpeedSetting])
    {
      int relativeFanSpeedSetting = self->_relativeFanSpeedSetting;
      if (relativeFanSpeedSetting != [v4 relativeFanSpeedSetting]) {
        goto LABEL_59;
      }
    }
  }
  int v41 = [(_INPBSetClimateSettingsInCarIntent *)self hasRelativeTemperatureSetting];
  if (v41 != [v4 hasRelativeTemperatureSetting]) {
    goto LABEL_59;
  }
  if ([(_INPBSetClimateSettingsInCarIntent *)self hasRelativeTemperatureSetting])
  {
    if ([v4 hasRelativeTemperatureSetting])
    {
      int relativeTemperatureSetting = self->_relativeTemperatureSetting;
      if (relativeTemperatureSetting != [v4 relativeTemperatureSetting]) {
        goto LABEL_59;
      }
    }
  }
  unint64_t v7 = [(_INPBSetClimateSettingsInCarIntent *)self temperature];
  unint64_t v8 = [v4 temperature];
  if ((v7 == 0) != (v8 != 0))
  {
    uint64_t v43 = [(_INPBSetClimateSettingsInCarIntent *)self temperature];
    if (!v43)
    {

LABEL_62:
      BOOL v48 = 1;
      goto LABEL_60;
    }
    v44 = (void *)v43;
    v45 = [(_INPBSetClimateSettingsInCarIntent *)self temperature];
    v46 = [v4 temperature];
    char v47 = [v45 isEqual:v46];

    if (v47) {
      goto LABEL_62;
    }
  }
  else
  {
LABEL_58:
  }
LABEL_59:
  BOOL v48 = 0;
LABEL_60:

  return v48;
}

- (id)copyWithZone:(_NSZone *)a3
{
  int v5 = [+[_INPBSetClimateSettingsInCarIntent allocWithZone:](_INPBSetClimateSettingsInCarIntent, "allocWithZone:") init];
  if ([(_INPBSetClimateSettingsInCarIntent *)self hasAirCirculationMode]) {
    [(_INPBSetClimateSettingsInCarIntent *)v5 setAirCirculationMode:[(_INPBSetClimateSettingsInCarIntent *)self airCirculationMode]];
  }
  id v6 = [(_INPBDataString *)self->_carName copyWithZone:a3];
  [(_INPBSetClimateSettingsInCarIntent *)v5 setCarName:v6];

  if ([(_INPBSetClimateSettingsInCarIntent *)self hasClimateZone]) {
    [(_INPBSetClimateSettingsInCarIntent *)v5 setClimateZone:[(_INPBSetClimateSettingsInCarIntent *)self climateZone]];
  }
  if ([(_INPBSetClimateSettingsInCarIntent *)self hasEnableAirConditioner]) {
    [(_INPBSetClimateSettingsInCarIntent *)v5 setEnableAirConditioner:[(_INPBSetClimateSettingsInCarIntent *)self enableAirConditioner]];
  }
  if ([(_INPBSetClimateSettingsInCarIntent *)self hasEnableAutoMode]) {
    [(_INPBSetClimateSettingsInCarIntent *)v5 setEnableAutoMode:[(_INPBSetClimateSettingsInCarIntent *)self enableAutoMode]];
  }
  if ([(_INPBSetClimateSettingsInCarIntent *)self hasEnableClimateControl]) {
    [(_INPBSetClimateSettingsInCarIntent *)v5 setEnableClimateControl:[(_INPBSetClimateSettingsInCarIntent *)self enableClimateControl]];
  }
  if ([(_INPBSetClimateSettingsInCarIntent *)self hasEnableFan]) {
    [(_INPBSetClimateSettingsInCarIntent *)v5 setEnableFan:[(_INPBSetClimateSettingsInCarIntent *)self enableFan]];
  }
  id v7 = [(_INPBInteger *)self->_fanSpeedIndex copyWithZone:a3];
  [(_INPBSetClimateSettingsInCarIntent *)v5 setFanSpeedIndex:v7];

  id v8 = [(_INPBDouble *)self->_fanSpeedPercentage copyWithZone:a3];
  [(_INPBSetClimateSettingsInCarIntent *)v5 setFanSpeedPercentage:v8];

  id v9 = [(_INPBIntentMetadata *)self->_intentMetadata copyWithZone:a3];
  [(_INPBSetClimateSettingsInCarIntent *)v5 setIntentMetadata:v9];

  if ([(_INPBSetClimateSettingsInCarIntent *)self hasRelativeFanSpeedSetting]) {
    [(_INPBSetClimateSettingsInCarIntent *)v5 setRelativeFanSpeedSetting:[(_INPBSetClimateSettingsInCarIntent *)self relativeFanSpeedSetting]];
  }
  if ([(_INPBSetClimateSettingsInCarIntent *)self hasRelativeTemperatureSetting]) {
    [(_INPBSetClimateSettingsInCarIntent *)v5 setRelativeTemperatureSetting:[(_INPBSetClimateSettingsInCarIntent *)self relativeTemperatureSetting]];
  }
  id v10 = [(_INPBTemperature *)self->_temperature copyWithZone:a3];
  [(_INPBSetClimateSettingsInCarIntent *)v5 setTemperature:v10];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBSetClimateSettingsInCarIntent *)self data];
  int v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBSetClimateSettingsInCarIntent)initWithCoder:(id)a3
{
  id v4 = a3;
  int v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBSetClimateSettingsInCarIntent *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        id v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBSetClimateSettingsInCarIntent *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBSetClimateSettingsInCarIntent *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  id v15 = a3;
  if ([(_INPBSetClimateSettingsInCarIntent *)self hasAirCirculationMode]) {
    PBDataWriterWriteInt32Field();
  }
  id v4 = [(_INPBSetClimateSettingsInCarIntent *)self carName];

  if (v4)
  {
    int v5 = [(_INPBSetClimateSettingsInCarIntent *)self carName];
    PBDataWriterWriteSubmessage();
  }
  if ([(_INPBSetClimateSettingsInCarIntent *)self hasClimateZone]) {
    PBDataWriterWriteInt32Field();
  }
  if ([(_INPBSetClimateSettingsInCarIntent *)self hasEnableAirConditioner]) {
    PBDataWriterWriteBOOLField();
  }
  if ([(_INPBSetClimateSettingsInCarIntent *)self hasEnableAutoMode]) {
    PBDataWriterWriteBOOLField();
  }
  if ([(_INPBSetClimateSettingsInCarIntent *)self hasEnableClimateControl]) {
    PBDataWriterWriteBOOLField();
  }
  if ([(_INPBSetClimateSettingsInCarIntent *)self hasEnableFan]) {
    PBDataWriterWriteBOOLField();
  }
  id v6 = [(_INPBSetClimateSettingsInCarIntent *)self fanSpeedIndex];

  if (v6)
  {
    uint64_t v7 = [(_INPBSetClimateSettingsInCarIntent *)self fanSpeedIndex];
    PBDataWriterWriteSubmessage();
  }
  id v8 = [(_INPBSetClimateSettingsInCarIntent *)self fanSpeedPercentage];

  if (v8)
  {
    id v9 = [(_INPBSetClimateSettingsInCarIntent *)self fanSpeedPercentage];
    PBDataWriterWriteSubmessage();
  }
  id v10 = [(_INPBSetClimateSettingsInCarIntent *)self intentMetadata];

  if (v10)
  {
    uint64_t v11 = [(_INPBSetClimateSettingsInCarIntent *)self intentMetadata];
    PBDataWriterWriteSubmessage();
  }
  if ([(_INPBSetClimateSettingsInCarIntent *)self hasRelativeFanSpeedSetting]) {
    PBDataWriterWriteInt32Field();
  }
  if ([(_INPBSetClimateSettingsInCarIntent *)self hasRelativeTemperatureSetting]) {
    PBDataWriterWriteInt32Field();
  }
  v12 = [(_INPBSetClimateSettingsInCarIntent *)self temperature];

  int v13 = v15;
  if (v12)
  {
    int v14 = [(_INPBSetClimateSettingsInCarIntent *)self temperature];
    PBDataWriterWriteSubmessage();

    int v13 = v15;
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBSetClimateSettingsInCarIntentReadFrom(self, (uint64_t)a3);
}

- (BOOL)hasTemperature
{
  return self->_temperature != 0;
}

- (void)setTemperature:(id)a3
{
}

- (int)StringAsRelativeTemperatureSetting:(id)a3
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

- (id)relativeTemperatureSettingAsString:(int)a3
{
  if ((a3 - 1) >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E55191D0[a3 - 1];
  }

  return v3;
}

- (void)setHasRelativeTemperatureSetting:(BOOL)a3
{
  if (a3) {
    char v3 = 0x80;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = v3 & 0x80 | *(unsigned char *)&self->_has & 0x7F;
}

- (BOOL)hasRelativeTemperatureSetting
{
  return *(unsigned char *)&self->_has >> 7;
}

- (void)setRelativeTemperatureSetting:(int)a3
{
  char has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(unsigned char *)&self->_char has = has & 0x7F;
  }
  else
  {
    *(unsigned char *)&self->_char has = has | 0x80;
    self->_int relativeTemperatureSetting = a3;
  }
}

- (int)StringAsRelativeFanSpeedSetting:(id)a3
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

- (id)relativeFanSpeedSettingAsString:(int)a3
{
  if ((a3 - 1) >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E55191D0[a3 - 1];
  }

  return v3;
}

- (void)setHasRelativeFanSpeedSetting:(BOOL)a3
{
  if (a3) {
    char v3 = 64;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xBF | v3;
}

- (BOOL)hasRelativeFanSpeedSetting
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (void)setRelativeFanSpeedSetting:(int)a3
{
  char has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(unsigned char *)&self->_char has = has & 0xBF;
  }
  else
  {
    *(unsigned char *)&self->_char has = has | 0x40;
    self->_int relativeFanSpeedSetting = a3;
  }
}

- (BOOL)hasIntentMetadata
{
  return self->_intentMetadata != 0;
}

- (void)setIntentMetadata:(id)a3
{
}

- (BOOL)hasFanSpeedPercentage
{
  return self->_fanSpeedPercentage != 0;
}

- (void)setFanSpeedPercentage:(id)a3
{
}

- (BOOL)hasFanSpeedIndex
{
  return self->_fanSpeedIndex != 0;
}

- (void)setFanSpeedIndex:(id)a3
{
}

- (void)setHasEnableFan:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasEnableFan
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setEnableFan:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_int enableFan = a3;
}

- (void)setHasEnableClimateControl:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasEnableClimateControl
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setEnableClimateControl:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_int enableClimateControl = a3;
}

- (void)setHasEnableAutoMode:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasEnableAutoMode
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setEnableAutoMode:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_int enableAutoMode = a3;
}

- (void)setHasEnableAirConditioner:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasEnableAirConditioner
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setEnableAirConditioner:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_int enableAirConditioner = a3;
}

- (int)StringAsClimateZone:(id)a3
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

- (id)climateZoneAsString:(int)a3
{
  int v3 = a3 - 1;
  if (a3 - 1) < 0x16 && ((0x3F8383u >> v3))
  {
    int v4 = off_1E5519120[v3];
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    int v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  return v4;
}

- (void)setHasClimateZone:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasClimateZone
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setClimateZone:(int)a3
{
  char has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(unsigned char *)&self->_char has = has & 0xFD;
  }
  else
  {
    *(unsigned char *)&self->_char has = has | 2;
    self->_int climateZone = a3;
  }
}

- (BOOL)hasCarName
{
  return self->_carName != 0;
}

- (void)setCarName:(id)a3
{
}

- (int)StringAsAirCirculationMode:(id)a3
{
  id v3 = a3;
  int v4 = 1;
  if (([v3 isEqualToString:@"FRESH_AIR"] & 1) == 0)
  {
    if ([v3 isEqualToString:@"RECIRCULATE_AIR"]) {
      int v4 = 2;
    }
    else {
      int v4 = 1;
    }
  }

  return v4;
}

- (id)airCirculationModeAsString:(int)a3
{
  if (a3 == 1)
  {
    int v4 = @"FRESH_AIR";
  }
  else if (a3 == 2)
  {
    int v4 = @"RECIRCULATE_AIR";
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    int v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (void)setHasAirCirculationMode:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAirCirculationMode
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setAirCirculationMode:(int)a3
{
  char has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(unsigned char *)&self->_char has = has & 0xFE;
  }
  else
  {
    *(unsigned char *)&self->_char has = has | 1;
    self->_int airCirculationMode = a3;
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
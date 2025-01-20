@interface _INPBCar
+ (BOOL)supportsSecureCoding;
+ (Class)powerPerConnectorType;
- (BOOL)hasCarIdentifier;
- (BOOL)hasColor;
- (BOOL)hasDisplayName;
- (BOOL)hasHeadUnit;
- (BOOL)hasMake;
- (BOOL)hasModel;
- (BOOL)hasYear;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)powerPerConnectors;
- (NSArray)supportedChargingConnectors;
- (NSString)carIdentifier;
- (NSString)displayName;
- (NSString)make;
- (NSString)model;
- (NSString)year;
- (_INPBCar)initWithCoder:(id)a3;
- (_INPBCarHeadUnit)headUnit;
- (_INPBColor)color;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (id)powerPerConnectorAtIndex:(unint64_t)a3;
- (id)supportedChargingConnectorsAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)powerPerConnectorsCount;
- (unint64_t)supportedChargingConnectorsCount;
- (void)addPowerPerConnector:(id)a3;
- (void)addSupportedChargingConnectors:(id)a3;
- (void)clearPowerPerConnectors;
- (void)clearSupportedChargingConnectors;
- (void)encodeWithCoder:(id)a3;
- (void)setCarIdentifier:(id)a3;
- (void)setColor:(id)a3;
- (void)setDisplayName:(id)a3;
- (void)setHeadUnit:(id)a3;
- (void)setMake:(id)a3;
- (void)setModel:(id)a3;
- (void)setPowerPerConnectors:(id)a3;
- (void)setSupportedChargingConnectors:(id)a3;
- (void)setYear:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBCar

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_year, 0);
  objc_storeStrong((id *)&self->_supportedChargingConnectors, 0);
  objc_storeStrong((id *)&self->_powerPerConnectors, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_make, 0);
  objc_storeStrong((id *)&self->_headUnit, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_color, 0);

  objc_storeStrong((id *)&self->_carIdentifier, 0);
}

- (NSString)year
{
  return self->_year;
}

- (NSArray)supportedChargingConnectors
{
  return self->_supportedChargingConnectors;
}

- (NSArray)powerPerConnectors
{
  return self->_powerPerConnectors;
}

- (NSString)model
{
  return self->_model;
}

- (NSString)make
{
  return self->_make;
}

- (_INPBCarHeadUnit)headUnit
{
  return self->_headUnit;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (_INPBColor)color
{
  return self->_color;
}

- (NSString)carIdentifier
{
  return self->_carIdentifier;
}

- (id)dictionaryRepresentation
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (self->_carIdentifier)
  {
    v4 = [(_INPBCar *)self carIdentifier];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"carIdentifier"];
  }
  v6 = [(_INPBCar *)self color];
  v7 = [v6 dictionaryRepresentation];
  [v3 setObject:v7 forKeyedSubscript:@"color"];

  if (self->_displayName)
  {
    v8 = [(_INPBCar *)self displayName];
    v9 = (void *)[v8 copy];
    [v3 setObject:v9 forKeyedSubscript:@"displayName"];
  }
  v10 = [(_INPBCar *)self headUnit];
  v11 = [v10 dictionaryRepresentation];
  [v3 setObject:v11 forKeyedSubscript:@"headUnit"];

  if (self->_make)
  {
    v12 = [(_INPBCar *)self make];
    v13 = (void *)[v12 copy];
    [v3 setObject:v13 forKeyedSubscript:@"make"];
  }
  if (self->_model)
  {
    v14 = [(_INPBCar *)self model];
    v15 = (void *)[v14 copy];
    [v3 setObject:v15 forKeyedSubscript:@"model"];
  }
  if ([(NSArray *)self->_powerPerConnectors count])
  {
    v16 = [MEMORY[0x1E4F1CA48] array];
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    v17 = self->_powerPerConnectors;
    uint64_t v18 = [(NSArray *)v17 countByEnumeratingWithState:&v28 objects:v32 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v29 != v20) {
            objc_enumerationMutation(v17);
          }
          v22 = objc_msgSend(*(id *)(*((void *)&v28 + 1) + 8 * i), "dictionaryRepresentation", (void)v28);
          [v16 addObject:v22];
        }
        uint64_t v19 = [(NSArray *)v17 countByEnumeratingWithState:&v28 objects:v32 count:16];
      }
      while (v19);
    }

    [v3 setObject:v16 forKeyedSubscript:@"powerPerConnector"];
  }
  if (self->_supportedChargingConnectors)
  {
    v23 = [(_INPBCar *)self supportedChargingConnectors];
    v24 = (void *)[v23 copy];
    [v3 setObject:v24 forKeyedSubscript:@"supportedChargingConnectors"];
  }
  if (self->_year)
  {
    v25 = [(_INPBCar *)self year];
    v26 = (void *)[v25 copy];
    [v3 setObject:v26 forKeyedSubscript:@"year"];
  }

  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_carIdentifier hash];
  unint64_t v4 = [(_INPBColor *)self->_color hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_displayName hash];
  unint64_t v6 = v4 ^ v5 ^ [(_INPBCarHeadUnit *)self->_headUnit hash];
  NSUInteger v7 = [(NSString *)self->_make hash];
  NSUInteger v8 = v7 ^ [(NSString *)self->_model hash];
  uint64_t v9 = v6 ^ v8 ^ [(NSArray *)self->_powerPerConnectors hash];
  uint64_t v10 = [(NSArray *)self->_supportedChargingConnectors hash];
  return v9 ^ v10 ^ [(NSString *)self->_year hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_47;
  }
  NSUInteger v5 = [(_INPBCar *)self carIdentifier];
  unint64_t v6 = [v4 carIdentifier];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_46;
  }
  uint64_t v7 = [(_INPBCar *)self carIdentifier];
  if (v7)
  {
    NSUInteger v8 = (void *)v7;
    uint64_t v9 = [(_INPBCar *)self carIdentifier];
    uint64_t v10 = [v4 carIdentifier];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_47;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_INPBCar *)self color];
  unint64_t v6 = [v4 color];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_46;
  }
  uint64_t v12 = [(_INPBCar *)self color];
  if (v12)
  {
    v13 = (void *)v12;
    v14 = [(_INPBCar *)self color];
    v15 = [v4 color];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_47;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_INPBCar *)self displayName];
  unint64_t v6 = [v4 displayName];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_46;
  }
  uint64_t v17 = [(_INPBCar *)self displayName];
  if (v17)
  {
    uint64_t v18 = (void *)v17;
    uint64_t v19 = [(_INPBCar *)self displayName];
    uint64_t v20 = [v4 displayName];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_47;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_INPBCar *)self headUnit];
  unint64_t v6 = [v4 headUnit];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_46;
  }
  uint64_t v22 = [(_INPBCar *)self headUnit];
  if (v22)
  {
    v23 = (void *)v22;
    v24 = [(_INPBCar *)self headUnit];
    v25 = [v4 headUnit];
    int v26 = [v24 isEqual:v25];

    if (!v26) {
      goto LABEL_47;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_INPBCar *)self make];
  unint64_t v6 = [v4 make];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_46;
  }
  uint64_t v27 = [(_INPBCar *)self make];
  if (v27)
  {
    long long v28 = (void *)v27;
    long long v29 = [(_INPBCar *)self make];
    long long v30 = [v4 make];
    int v31 = [v29 isEqual:v30];

    if (!v31) {
      goto LABEL_47;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_INPBCar *)self model];
  unint64_t v6 = [v4 model];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_46;
  }
  uint64_t v32 = [(_INPBCar *)self model];
  if (v32)
  {
    uint64_t v33 = (void *)v32;
    v34 = [(_INPBCar *)self model];
    v35 = [v4 model];
    int v36 = [v34 isEqual:v35];

    if (!v36) {
      goto LABEL_47;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_INPBCar *)self powerPerConnectors];
  unint64_t v6 = [v4 powerPerConnectors];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_46;
  }
  uint64_t v37 = [(_INPBCar *)self powerPerConnectors];
  if (v37)
  {
    v38 = (void *)v37;
    v39 = [(_INPBCar *)self powerPerConnectors];
    v40 = [v4 powerPerConnectors];
    int v41 = [v39 isEqual:v40];

    if (!v41) {
      goto LABEL_47;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_INPBCar *)self supportedChargingConnectors];
  unint64_t v6 = [v4 supportedChargingConnectors];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_46;
  }
  uint64_t v42 = [(_INPBCar *)self supportedChargingConnectors];
  if (v42)
  {
    v43 = (void *)v42;
    v44 = [(_INPBCar *)self supportedChargingConnectors];
    v45 = [v4 supportedChargingConnectors];
    int v46 = [v44 isEqual:v45];

    if (!v46) {
      goto LABEL_47;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_INPBCar *)self year];
  unint64_t v6 = [v4 year];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v47 = [(_INPBCar *)self year];
    if (!v47)
    {

LABEL_50:
      BOOL v52 = 1;
      goto LABEL_48;
    }
    v48 = (void *)v47;
    v49 = [(_INPBCar *)self year];
    v50 = [v4 year];
    char v51 = [v49 isEqual:v50];

    if (v51) {
      goto LABEL_50;
    }
  }
  else
  {
LABEL_46:
  }
LABEL_47:
  BOOL v52 = 0;
LABEL_48:

  return v52;
}

- (id)copyWithZone:(_NSZone *)a3
{
  NSUInteger v5 = [+[_INPBCar allocWithZone:](_INPBCar, "allocWithZone:") init];
  unint64_t v6 = (void *)[(NSString *)self->_carIdentifier copyWithZone:a3];
  [(_INPBCar *)v5 setCarIdentifier:v6];

  id v7 = [(_INPBColor *)self->_color copyWithZone:a3];
  [(_INPBCar *)v5 setColor:v7];

  NSUInteger v8 = (void *)[(NSString *)self->_displayName copyWithZone:a3];
  [(_INPBCar *)v5 setDisplayName:v8];

  id v9 = [(_INPBCarHeadUnit *)self->_headUnit copyWithZone:a3];
  [(_INPBCar *)v5 setHeadUnit:v9];

  uint64_t v10 = (void *)[(NSString *)self->_make copyWithZone:a3];
  [(_INPBCar *)v5 setMake:v10];

  int v11 = (void *)[(NSString *)self->_model copyWithZone:a3];
  [(_INPBCar *)v5 setModel:v11];

  uint64_t v12 = (void *)[(NSArray *)self->_powerPerConnectors copyWithZone:a3];
  [(_INPBCar *)v5 setPowerPerConnectors:v12];

  v13 = (void *)[(NSArray *)self->_supportedChargingConnectors copyWithZone:a3];
  [(_INPBCar *)v5 setSupportedChargingConnectors:v13];

  v14 = (void *)[(NSString *)self->_year copyWithZone:a3];
  [(_INPBCar *)v5 setYear:v14];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBCar *)self data];
  NSUInteger v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBCar)initWithCoder:(id)a3
{
  id v4 = a3;
  NSUInteger v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBCar *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        NSUInteger v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBCar *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBCar *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  NSUInteger v5 = [(_INPBCar *)self carIdentifier];

  if (v5) {
    PBDataWriterWriteStringField();
  }
  id v6 = [(_INPBCar *)self color];

  if (v6)
  {
    uint64_t v7 = [(_INPBCar *)self color];
    PBDataWriterWriteSubmessage();
  }
  NSUInteger v8 = [(_INPBCar *)self displayName];

  if (v8) {
    PBDataWriterWriteStringField();
  }
  id v9 = [(_INPBCar *)self headUnit];

  if (v9)
  {
    uint64_t v10 = [(_INPBCar *)self headUnit];
    PBDataWriterWriteSubmessage();
  }
  int v11 = [(_INPBCar *)self make];

  if (v11) {
    PBDataWriterWriteStringField();
  }
  uint64_t v12 = [(_INPBCar *)self model];

  if (v12) {
    PBDataWriterWriteStringField();
  }
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  v13 = self->_powerPerConnectors;
  uint64_t v14 = [(NSArray *)v13 countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v29;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v29 != v16) {
          objc_enumerationMutation(v13);
        }
        PBDataWriterWriteSubmessage();
        ++v17;
      }
      while (v15 != v17);
      uint64_t v15 = [(NSArray *)v13 countByEnumeratingWithState:&v28 objects:v33 count:16];
    }
    while (v15);
  }

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v18 = self->_supportedChargingConnectors;
  uint64_t v19 = [(NSArray *)v18 countByEnumeratingWithState:&v24 objects:v32 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v25;
    do
    {
      uint64_t v22 = 0;
      do
      {
        if (*(void *)v25 != v21) {
          objc_enumerationMutation(v18);
        }
        PBDataWriterWriteStringField();
        ++v22;
      }
      while (v20 != v22);
      uint64_t v20 = [(NSArray *)v18 countByEnumeratingWithState:&v24 objects:v32 count:16];
    }
    while (v20);
  }

  v23 = [(_INPBCar *)self year];

  if (v23) {
    PBDataWriterWriteStringField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBCarReadFrom(self, (uint64_t)a3);
}

- (BOOL)hasYear
{
  return self->_year != 0;
}

- (void)setYear:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  year = self->_year;
  self->_year = v4;

  MEMORY[0x1F41817F8](v4, year);
}

- (id)supportedChargingConnectorsAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_supportedChargingConnectors objectAtIndexedSubscript:a3];
}

- (unint64_t)supportedChargingConnectorsCount
{
  return [(NSArray *)self->_supportedChargingConnectors count];
}

- (void)addSupportedChargingConnectors:(id)a3
{
  id v4 = a3;
  supportedChargingConnectors = self->_supportedChargingConnectors;
  id v8 = v4;
  if (!supportedChargingConnectors)
  {
    id v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_supportedChargingConnectors;
    self->_supportedChargingConnectors = v6;

    id v4 = v8;
    supportedChargingConnectors = self->_supportedChargingConnectors;
  }
  [(NSArray *)supportedChargingConnectors addObject:v4];
}

- (void)clearSupportedChargingConnectors
{
}

- (void)setSupportedChargingConnectors:(id)a3
{
  id v4 = (NSArray *)[a3 mutableCopy];
  supportedChargingConnectors = self->_supportedChargingConnectors;
  self->_supportedChargingConnectors = v4;

  MEMORY[0x1F41817F8](v4, supportedChargingConnectors);
}

- (id)powerPerConnectorAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_powerPerConnectors objectAtIndexedSubscript:a3];
}

- (unint64_t)powerPerConnectorsCount
{
  return [(NSArray *)self->_powerPerConnectors count];
}

- (void)addPowerPerConnector:(id)a3
{
  id v4 = a3;
  powerPerConnectors = self->_powerPerConnectors;
  id v8 = v4;
  if (!powerPerConnectors)
  {
    id v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_powerPerConnectors;
    self->_powerPerConnectors = v6;

    id v4 = v8;
    powerPerConnectors = self->_powerPerConnectors;
  }
  [(NSArray *)powerPerConnectors addObject:v4];
}

- (void)clearPowerPerConnectors
{
}

- (void)setPowerPerConnectors:(id)a3
{
  id v4 = (NSArray *)[a3 mutableCopy];
  powerPerConnectors = self->_powerPerConnectors;
  self->_powerPerConnectors = v4;

  MEMORY[0x1F41817F8](v4, powerPerConnectors);
}

- (BOOL)hasModel
{
  return self->_model != 0;
}

- (void)setModel:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  model = self->_model;
  self->_model = v4;

  MEMORY[0x1F41817F8](v4, model);
}

- (BOOL)hasMake
{
  return self->_make != 0;
}

- (void)setMake:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  make = self->_make;
  self->_make = v4;

  MEMORY[0x1F41817F8](v4, make);
}

- (BOOL)hasHeadUnit
{
  return self->_headUnit != 0;
}

- (void)setHeadUnit:(id)a3
{
}

- (BOOL)hasDisplayName
{
  return self->_displayName != 0;
}

- (void)setDisplayName:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  displayName = self->_displayName;
  self->_displayName = v4;

  MEMORY[0x1F41817F8](v4, displayName);
}

- (BOOL)hasColor
{
  return self->_color != 0;
}

- (void)setColor:(id)a3
{
}

- (BOOL)hasCarIdentifier
{
  return self->_carIdentifier != 0;
}

- (void)setCarIdentifier:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  carIdentifier = self->_carIdentifier;
  self->_carIdentifier = v4;

  MEMORY[0x1F41817F8](v4, carIdentifier);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (Class)powerPerConnectorType
{
  return (Class)objc_opt_class();
}

@end
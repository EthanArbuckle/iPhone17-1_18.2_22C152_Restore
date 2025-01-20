@interface INCar
+ (BOOL)supportsSecureCoding;
+ (id)_intents_decodeWithJSONDecoder:(id)a3 codableDescription:(id)a4 from:(id)a5;
- (BOOL)isEqual:(id)a3;
- (CGColorRef)color;
- (INCar)initWithCarIdentifier:(NSString *)carIdentifier displayName:(NSString *)displayName year:(NSString *)year make:(NSString *)make model:(NSString *)model color:(CGColorRef)color headUnit:(INCarHeadUnit *)headUnit supportedChargingConnectors:(NSArray *)supportedChargingConnectors;
- (INCar)initWithCarIdentifier:(id)a3 displayName:(id)a4 year:(id)a5 make:(id)a6 model:(id)a7 color:(CGColor *)a8 headUnit:(id)a9 supportedChargingConnectors:(id)a10 powerPerConnectors:(id)a11;
- (INCar)initWithCoder:(id)a3;
- (INCarHeadUnit)headUnit;
- (NSArray)powerPerConnectors;
- (NSArray)supportedChargingConnectors;
- (NSMeasurement)maximumPowerForChargingConnectorType:(INCarChargingConnectorType)chargingConnectorType;
- (NSString)carIdentifier;
- (NSString)description;
- (NSString)displayName;
- (NSString)make;
- (NSString)model;
- (NSString)year;
- (id)_colorDictionaryRepresentation;
- (id)_dictionaryRepresentation;
- (id)_intents_cacheableObjects;
- (id)_intents_encodeWithJSONEncoder:(id)a3 codableDescription:(id)a4;
- (id)descriptionAtIndent:(unint64_t)a3;
- (unint64_t)hash;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setMaximumPower:(NSMeasurement *)power forChargingConnectorType:(INCarChargingConnectorType)chargingConnectorType;
@end

@implementation INCar

- (id)_intents_cacheableObjects
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_powerPerConnectors, 0);
  objc_storeStrong((id *)&self->_supportedChargingConnectors, 0);
  objc_storeStrong((id *)&self->_headUnit, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_make, 0);
  objc_storeStrong((id *)&self->_year, 0);
  objc_storeStrong((id *)&self->_displayName, 0);

  objc_storeStrong((id *)&self->_carIdentifier, 0);
}

- (NSArray)powerPerConnectors
{
  return self->_powerPerConnectors;
}

- (NSArray)supportedChargingConnectors
{
  return self->_supportedChargingConnectors;
}

- (INCarHeadUnit)headUnit
{
  return self->_headUnit;
}

- (CGColorRef)color
{
  return self->_color;
}

- (NSString)model
{
  return self->_model;
}

- (NSString)make
{
  return self->_make;
}

- (NSString)year
{
  return self->_year;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (NSString)carIdentifier
{
  return self->_carIdentifier;
}

- (id)_colorDictionaryRepresentation
{
  color = self->_color;
  if (color)
  {
    uint64_t v13 = 0;
    v14 = &v13;
    uint64_t v15 = 0x2020000000;
    v3 = (uint64_t (*)(CGColor *))getCGColorGetComponentsSymbolLoc_ptr_136570;
    v16 = getCGColorGetComponentsSymbolLoc_ptr_136570;
    if (!getCGColorGetComponentsSymbolLoc_ptr_136570)
    {
      v4 = (void *)CoreGraphicsLibrary_136572();
      v14[3] = (uint64_t)dlsym(v4, "CGColorGetComponents");
      getCGColorGetComponentsSymbolLoc_ptr_136570 = (_UNKNOWN *)v14[3];
      v3 = (uint64_t (*)(CGColor *))v14[3];
    }
    _Block_object_dispose(&v13, 8);
    if (!v3)
    {
      dlerror();
      v12 = (_Unwind_Exception *)abort_report_np();
      _Block_object_dispose(&v13, 8);
      _Unwind_Resume(v12);
    }
    v5 = (double *)v3(color);
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = [NSNumber numberWithDouble:*v5];
    [v6 addObject:v7];

    v8 = [NSNumber numberWithDouble:v5[1]];
    [v6 addObject:v8];

    v9 = [NSNumber numberWithDouble:v5[2]];
    [v6 addObject:v9];

    v10 = [NSNumber numberWithDouble:v5[3]];
    [v6 addObject:v10];
  }
  else
  {
    id v6 = (id)MEMORY[0x1E4F1CBF0];
  }

  return v6;
}

- (NSMeasurement)maximumPowerForChargingConnectorType:(INCarChargingConnectorType)chargingConnectorType
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v4 = chargingConnectorType;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v5 = [(INCar *)self powerPerConnectors];
  id v6 = (void *)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        v10 = [v9 chargingConnector];
        char v11 = [v10 isEqualToString:v4];

        if (v11)
        {
          id v6 = [v9 maximumPower];
          goto LABEL_11;
        }
      }
      id v6 = (void *)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return (NSMeasurement *)v6;
}

- (void)setMaximumPower:(NSMeasurement *)power forChargingConnectorType:(INCarChargingConnectorType)chargingConnectorType
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = power;
  uint64_t v7 = chargingConnectorType;
  v8 = [[INCarChargingConnectorPower alloc] initWithChargingConnector:v7 maximumPower:v6];
  [(INCar *)self mutableArrayValueForKey:@"powerPerConnectors"];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v18;
    while (2)
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v9);
        }
        long long v14 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        long long v15 = objc_msgSend(v14, "chargingConnector", (void)v17);
        int v16 = [v15 isEqualToString:v7];

        if (v16)
        {
          [v9 removeObject:v14];
          goto LABEL_11;
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  [v9 addObject:v8];
}

- (id)_dictionaryRepresentation
{
  v28[9] = *MEMORY[0x1E4F143B8];
  uint64_t carIdentifier = (uint64_t)self->_carIdentifier;
  uint64_t v26 = carIdentifier;
  v27[0] = @"carIdentifier";
  if (!carIdentifier)
  {
    uint64_t carIdentifier = [MEMORY[0x1E4F1CA98] null];
  }
  v23 = (void *)carIdentifier;
  v28[0] = carIdentifier;
  v27[1] = @"displayName";
  uint64_t displayName = (uint64_t)self->_displayName;
  uint64_t v25 = displayName;
  if (!displayName)
  {
    uint64_t displayName = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v22 = (void *)displayName;
  v28[1] = displayName;
  v27[2] = @"year";
  uint64_t year = (uint64_t)self->_year;
  uint64_t v24 = year;
  if (!year)
  {
    uint64_t year = [MEMORY[0x1E4F1CA98] null];
  }
  v21 = (void *)year;
  v28[2] = year;
  v27[3] = @"make";
  make = self->_make;
  uint64_t v7 = (uint64_t)make;
  if (!make)
  {
    uint64_t v7 = [MEMORY[0x1E4F1CA98] null];
  }
  long long v20 = (void *)v7;
  v28[3] = v7;
  v27[4] = @"model";
  model = self->_model;
  uint64_t v9 = (uint64_t)model;
  if (!model)
  {
    uint64_t v9 = [MEMORY[0x1E4F1CA98] null];
  }
  v28[4] = v9;
  v27[5] = @"color";
  uint64_t v10 = [(INCar *)self _colorDictionaryRepresentation];
  v28[5] = v10;
  v27[6] = @"headUnit";
  headUnit = self->_headUnit;
  uint64_t v12 = headUnit;
  if (!headUnit)
  {
    uint64_t v12 = [MEMORY[0x1E4F1CA98] null];
  }
  v28[6] = v12;
  v27[7] = @"supportedChargingConnectors";
  supportedChargingConnectors = self->_supportedChargingConnectors;
  long long v14 = supportedChargingConnectors;
  if (!supportedChargingConnectors)
  {
    long long v14 = [MEMORY[0x1E4F1CA98] null];
  }
  v28[7] = v14;
  v27[8] = @"powerPerConnectors";
  powerPerConnectors = self->_powerPerConnectors;
  int v16 = powerPerConnectors;
  if (!powerPerConnectors)
  {
    int v16 = [MEMORY[0x1E4F1CA98] null];
  }
  v28[8] = v16;
  long long v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:v27 count:9];
  if (powerPerConnectors)
  {
    if (supportedChargingConnectors) {
      goto LABEL_19;
    }
LABEL_32:

    if (headUnit) {
      goto LABEL_20;
    }
    goto LABEL_33;
  }

  if (!supportedChargingConnectors) {
    goto LABEL_32;
  }
LABEL_19:
  if (headUnit) {
    goto LABEL_20;
  }
LABEL_33:

LABEL_20:
  if (model)
  {
    if (make) {
      goto LABEL_22;
    }
  }
  else
  {

    if (make) {
      goto LABEL_22;
    }
  }

LABEL_22:
  if (!v24) {

  }
  if (!v25) {
  if (!v26)
  }

  return v17;
}

- (id)descriptionAtIndent:(unint64_t)a3
{
  v5 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)INCar;
  id v6 = [(INCar *)&v11 description];
  uint64_t v7 = [(INCar *)self _dictionaryRepresentation];
  v8 = [v7 descriptionAtIndent:a3];
  uint64_t v9 = [v5 stringWithFormat:@"%@ %@", v6, v8];

  return v9;
}

- (NSString)description
{
  return (NSString *)[(INCar *)self descriptionAtIndent:0];
}

- (id)_intents_encodeWithJSONEncoder:(id)a3 codableDescription:(id)a4
{
  v5 = (void *)MEMORY[0x1E4F1CA60];
  id v6 = a3;
  uint64_t v7 = [v5 dictionary];
  v8 = [v6 encodeObject:self->_carIdentifier];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v8, @"carIdentifier");

  uint64_t v9 = [v6 encodeObject:self->_displayName];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v9, @"displayName");

  uint64_t v10 = [v6 encodeObject:self->_year];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v10, @"year");

  objc_super v11 = [v6 encodeObject:self->_make];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v11, @"make");

  uint64_t v12 = [v6 encodeObject:self->_model];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v12, @"model");

  long long v13 = [(INCar *)self _colorDictionaryRepresentation];
  long long v14 = [v6 encodeObject:v13];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v14, @"color");

  long long v15 = [v6 encodeObject:self->_headUnit];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v15, @"headUnit");

  int v16 = [v6 encodeObject:self->_supportedChargingConnectors];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v16, @"supportedChargingConnectors");

  long long v17 = [v6 encodeObject:self->_powerPerConnectors];

  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v17, @"powerPerConnectors");

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t carIdentifier = self->_carIdentifier;
  id v6 = a3;
  [v6 encodeObject:carIdentifier forKey:@"carIdentifier"];
  [v6 encodeObject:self->_displayName forKey:@"displayName"];
  [v6 encodeObject:self->_year forKey:@"year"];
  [v6 encodeObject:self->_make forKey:@"make"];
  [v6 encodeObject:self->_model forKey:@"model"];
  v5 = [(INCar *)self _colorDictionaryRepresentation];
  [v6 encodeObject:v5 forKey:@"color"];

  [v6 encodeObject:self->_headUnit forKey:@"headUnit"];
  [v6 encodeObject:self->_supportedChargingConnectors forKey:@"supportedChargingConnectors"];
  [v6 encodeObject:self->_powerPerConnectors forKey:@"powerPerConnectors"];
}

- (INCar)initWithCoder:(id)a3
{
  v53[3] = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1E4F1CAD0];
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  id v6 = objc_msgSend(v3, "setWithObjects:", v5, objc_opt_class(), 0);
  v50 = [v4 decodeObjectOfClasses:v6 forKey:@"carIdentifier"];

  uint64_t v7 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
  v49 = [v4 decodeObjectOfClasses:v9 forKey:@"displayName"];

  uint64_t v10 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
  v48 = [v4 decodeObjectOfClasses:v12 forKey:@"year"];

  long long v13 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v14 = objc_opt_class();
  long long v15 = objc_msgSend(v13, "setWithObjects:", v14, objc_opt_class(), 0);
  v47 = [v4 decodeObjectOfClasses:v15 forKey:@"make"];

  int v16 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v17 = objc_opt_class();
  long long v18 = objc_msgSend(v16, "setWithObjects:", v17, objc_opt_class(), 0);
  long long v19 = [v4 decodeObjectOfClasses:v18 forKey:@"model"];

  long long v20 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v21 = objc_opt_class();
  uint64_t v22 = objc_msgSend(v20, "setWithObjects:", v21, objc_opt_class(), 0);
  v23 = [v4 decodeObjectOfClasses:v22 forKey:@"color"];

  uint64_t v24 = [v23 objectAtIndexedSubscript:0];
  [v24 doubleValue];
  double v26 = v25;
  v27 = [v23 objectAtIndexedSubscript:1];
  [v27 doubleValue];
  double v29 = v28;
  v30 = [v23 objectAtIndexedSubscript:2];
  [v30 doubleValue];
  double v32 = v31;
  v33 = [v23 objectAtIndexedSubscript:3];
  [v33 doubleValue];
  uint64_t SRGB = soft_CGColorCreateSRGB(v26, v29, v32, v34);

  v35 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"headUnit"];
  v36 = (void *)MEMORY[0x1E4F1CAD0];
  v53[0] = objc_opt_class();
  v53[1] = objc_opt_class();
  v53[2] = objc_opt_class();
  v37 = [MEMORY[0x1E4F1C978] arrayWithObjects:v53 count:3];
  v38 = [v36 setWithArray:v37];
  v39 = [v4 decodeObjectOfClasses:v38 forKey:@"supportedChargingConnectors"];

  v40 = (void *)MEMORY[0x1E4F1CAD0];
  v52[0] = objc_opt_class();
  v52[1] = objc_opt_class();
  v41 = [MEMORY[0x1E4F1C978] arrayWithObjects:v52 count:2];
  v42 = [v40 setWithArray:v41];
  v43 = [v4 decodeObjectOfClasses:v42 forKey:@"powerPerConnectors"];

  v44 = [(INCar *)self initWithCarIdentifier:v50 displayName:v49 year:v48 make:v47 model:v19 color:SRGB headUnit:v35 supportedChargingConnectors:v39 powerPerConnectors:v43];
  return v44;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (INCar *)a3;
  if (v4 == self)
  {
    BOOL v11 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = v4;
      uint64_t carIdentifier = self->_carIdentifier;
      BOOL v11 = 0;
      if (carIdentifier == v5->_carIdentifier || -[NSString isEqual:](carIdentifier, "isEqual:"))
      {
        uint64_t displayName = self->_displayName;
        if (displayName == v5->_displayName || -[NSString isEqual:](displayName, "isEqual:"))
        {
          uint64_t year = self->_year;
          if (year == v5->_year || -[NSString isEqual:](year, "isEqual:"))
          {
            make = self->_make;
            if (make == v5->_make || -[NSString isEqual:](make, "isEqual:"))
            {
              model = self->_model;
              if ((model == v5->_model || -[NSString isEqual:](model, "isEqual:"))
                && self->_color == v5->_color)
              {
                headUnit = self->_headUnit;
                if (headUnit == v5->_headUnit || -[INCarHeadUnit isEqual:](headUnit, "isEqual:"))
                {
                  supportedChargingConnectors = self->_supportedChargingConnectors;
                  if (supportedChargingConnectors == v5->_supportedChargingConnectors
                    || -[NSArray isEqual:](supportedChargingConnectors, "isEqual:"))
                  {
                    powerPerConnectors = self->_powerPerConnectors;
                    if (powerPerConnectors == v5->_powerPerConnectors
                      || -[NSArray isEqual:](powerPerConnectors, "isEqual:"))
                    {
                      BOOL v11 = 1;
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
    else
    {
      BOOL v11 = 0;
    }
  }

  return v11;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_carIdentifier hash];
  NSUInteger v4 = [(NSString *)self->_displayName hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_year hash];
  NSUInteger v6 = v4 ^ v5 ^ [(NSString *)self->_make hash];
  NSUInteger v7 = [(NSString *)self->_model hash];
  uint64_t v8 = [(INCar *)self _colorDictionaryRepresentation];
  uint64_t v9 = v7 ^ [v8 hash];
  unint64_t v10 = v6 ^ v9 ^ [(INCarHeadUnit *)self->_headUnit hash];
  uint64_t v11 = [(NSArray *)self->_supportedChargingConnectors hash];
  unint64_t v12 = v10 ^ v11 ^ [(NSArray *)self->_powerPerConnectors hash];

  return v12;
}

- (void)dealloc
{
  CGColorRelease(self->_color);
  v3.receiver = self;
  v3.super_class = (Class)INCar;
  [(INCar *)&v3 dealloc];
}

- (INCar)initWithCarIdentifier:(id)a3 displayName:(id)a4 year:(id)a5 make:(id)a6 model:(id)a7 color:(CGColor *)a8 headUnit:(id)a9 supportedChargingConnectors:(id)a10 powerPerConnectors:(id)a11
{
  id v17 = a3;
  id v18 = a4;
  id v19 = a5;
  id v20 = a6;
  id v21 = a7;
  id v22 = a9;
  id v23 = a10;
  id v24 = a11;
  v43.receiver = self;
  v43.super_class = (Class)INCar;
  double v25 = [(INCar *)&v43 init];
  if (v25)
  {
    uint64_t v26 = [v17 copy];
    uint64_t carIdentifier = v25->_carIdentifier;
    v25->_uint64_t carIdentifier = (NSString *)v26;

    uint64_t v28 = [v18 copy];
    uint64_t displayName = v25->_displayName;
    v25->_uint64_t displayName = (NSString *)v28;

    uint64_t v30 = [v19 copy];
    uint64_t year = v25->_year;
    v25->_uint64_t year = (NSString *)v30;

    uint64_t v32 = [v20 copy];
    make = v25->_make;
    v25->_make = (NSString *)v32;

    uint64_t v34 = [v21 copy];
    model = v25->_model;
    v25->_model = (NSString *)v34;

    v25->_color = CGColorRetain(a8);
    uint64_t v36 = [v22 copy];
    headUnit = v25->_headUnit;
    v25->_headUnit = (INCarHeadUnit *)v36;

    uint64_t v38 = [v23 copy];
    supportedChargingConnectors = v25->_supportedChargingConnectors;
    v25->_supportedChargingConnectors = (NSArray *)v38;

    uint64_t v40 = [v24 copy];
    powerPerConnectors = v25->_powerPerConnectors;
    v25->_powerPerConnectors = (NSArray *)v40;
  }
  return v25;
}

- (INCar)initWithCarIdentifier:(NSString *)carIdentifier displayName:(NSString *)displayName year:(NSString *)year make:(NSString *)make model:(NSString *)model color:(CGColorRef)color headUnit:(INCarHeadUnit *)headUnit supportedChargingConnectors:(NSArray *)supportedChargingConnectors
{
  int v16 = carIdentifier;
  id v17 = displayName;
  id v18 = year;
  id v19 = make;
  id v20 = model;
  id v21 = headUnit;
  id v22 = supportedChargingConnectors;
  v39.receiver = self;
  v39.super_class = (Class)INCar;
  id v23 = [(INCar *)&v39 init];
  if (v23)
  {
    uint64_t v24 = [(NSString *)v16 copy];
    double v25 = v23->_carIdentifier;
    v23->_uint64_t carIdentifier = (NSString *)v24;

    uint64_t v26 = [(NSString *)v17 copy];
    v27 = v23->_displayName;
    v23->_uint64_t displayName = (NSString *)v26;

    uint64_t v28 = [(NSString *)v18 copy];
    double v29 = v23->_year;
    v23->_uint64_t year = (NSString *)v28;

    uint64_t v30 = [(NSString *)v19 copy];
    double v31 = v23->_make;
    v23->_make = (NSString *)v30;

    uint64_t v32 = [(NSString *)v20 copy];
    v33 = v23->_model;
    v23->_model = (NSString *)v32;

    v23->_color = CGColorRetain(color);
    uint64_t v34 = [(INCarHeadUnit *)v21 copy];
    v35 = v23->_headUnit;
    v23->_headUnit = (INCarHeadUnit *)v34;

    uint64_t v36 = [(NSArray *)v22 copy];
    v37 = v23->_supportedChargingConnectors;
    v23->_supportedChargingConnectors = (NSArray *)v36;
  }
  return v23;
}

+ (id)_intents_decodeWithJSONDecoder:(id)a3 codableDescription:(id)a4 from:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v30 = [v8 objectForKeyedSubscript:@"carIdentifier"];
    uint64_t v9 = [v8 objectForKeyedSubscript:@"displayName"];
    v35 = [v8 objectForKeyedSubscript:@"year"];
    uint64_t v34 = [v8 objectForKeyedSubscript:@"make"];
    v33 = [v8 objectForKeyedSubscript:@"model"];
    uint64_t v32 = [v8 objectForKeyedSubscript:@"color"];
    unint64_t v10 = [v32 objectAtIndexedSubscript:0];
    [v10 doubleValue];
    double v12 = v11;
    long long v13 = [v32 objectAtIndexedSubscript:1];
    [v13 doubleValue];
    double v15 = v14;
    int v16 = [v32 objectAtIndexedSubscript:2];
    [v16 doubleValue];
    double v18 = v17;
    id v19 = [v32 objectAtIndexedSubscript:3];
    [v19 doubleValue];
    uint64_t SRGB = soft_CGColorCreateSRGB(v12, v15, v18, v20);

    uint64_t v21 = objc_opt_class();
    id v22 = [v8 objectForKeyedSubscript:@"headUnit"];
    id v23 = [v7 decodeObjectOfClass:v21 from:v22];

    uint64_t v24 = [v8 objectForKeyedSubscript:@"supportedChargingConnectors"];
    uint64_t v25 = objc_opt_class();
    uint64_t v26 = [v8 objectForKeyedSubscript:@"powerPerConnectors"];
    v27 = [v7 decodeObjectsOfClass:v25 from:v26];

    uint64_t v28 = (void *)[objc_alloc((Class)a1) initWithCarIdentifier:v30 displayName:v9 year:v35 make:v34 model:v33 color:SRGB headUnit:v23 supportedChargingConnectors:v24 powerPerConnectors:v27];
  }
  else
  {
    uint64_t v28 = 0;
  }

  return v28;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
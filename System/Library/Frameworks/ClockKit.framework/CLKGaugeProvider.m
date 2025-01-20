@interface CLKGaugeProvider
+ (BOOL)supportsSecureCoding;
+ (CLKGaugeProvider)providerWithJSONObjectRepresentation:(id)a3 bundle:(id)a4;
- (BOOL)finalized;
- (BOOL)isEqual:(id)a3;
- (BOOL)needsTimerUpdates;
- (BOOL)paused;
- (BOOL)validate;
- (CLKGaugeProvider)initWithCoder:(id)a3;
- (CLKGaugeProvider)initWithJSONObjectRepresentation:(id)a3;
- (CLKGaugeProviderStyle)style;
- (NSArray)gaugeColorLocations;
- (NSArray)gaugeColors;
- (NSString)accessibilityLabel;
- (double)progressFractionForNow:(id)a3;
- (id)JSONObjectRepresentation;
- (id)_init;
- (id)copyWithZone:(_NSZone *)a3;
- (id)startUpdatesWithHandler:(id)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)finalize;
- (void)setAccessibilityLabel:(NSString *)accessibilityLabel;
- (void)setFinalized:(BOOL)a3;
- (void)setGaugeColorLocations:(id)a3;
- (void)setGaugeColors:(id)a3;
- (void)setPaused:(BOOL)a3;
- (void)setStyle:(int64_t)a3;
- (void)stopUpdatesForToken:(id)a3;
@end

@implementation CLKGaugeProvider

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)_init
{
  v3.receiver = self;
  v3.super_class = (Class)CLKGaugeProvider;
  return [(CLKGaugeProvider *)&v3 init];
}

- (void)encodeWithCoder:(id)a3
{
  int64_t style = self->_style;
  id v5 = a3;
  [v5 encodeInteger:style forKey:@"_StyleKey"];
  [v5 encodeObject:self->_gaugeColors forKey:@"_GaugeColorsKey"];
  [v5 encodeObject:self->_gaugeColorLocations forKey:@"_GaugeColorLocationsKey"];
  [v5 encodeBool:self->_finalized forKey:@"Finalized"];
  [v5 encodeObject:self->_accessibilityLabel forKey:@"AccessibilityLabel"];
}

- (CLKGaugeProvider)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(CLKGaugeProvider *)self _init];
  if (v5)
  {
    v5->_int64_t style = [v4 decodeIntegerForKey:@"_StyleKey"];
    v6 = (void *)MEMORY[0x263EFFA08];
    uint64_t v7 = objc_opt_class();
    v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"_GaugeColorsKey"];
    gaugeColors = v5->_gaugeColors;
    v5->_gaugeColors = (NSArray *)v9;

    v11 = (void *)MEMORY[0x263EFFA08];
    uint64_t v12 = objc_opt_class();
    v13 = objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
    uint64_t v14 = [v4 decodeObjectOfClasses:v13 forKey:@"_GaugeColorLocationsKey"];
    gaugeColorLocations = v5->_gaugeColorLocations;
    v5->_gaugeColorLocations = (NSArray *)v14;

    v5->_finalized = [v4 decodeBoolForKey:@"Finalized"];
    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AccessibilityLabel"];
    accessibilityLabel = v5->_accessibilityLabel;
    v5->_accessibilityLabel = (NSString *)v16;
  }
  return v5;
}

- (BOOL)needsTimerUpdates
{
  return 0;
}

- (double)progressFractionForNow:(id)a3
{
  return 0.0;
}

- (id)startUpdatesWithHandler:(id)a3
{
  return &unk_26CCDB698;
}

- (void)stopUpdatesForToken:(id)a3
{
  objc_opt_class();

  CLKRequestConcreteImplementation(self);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (int64_t style = self->_style, style == [v4 style]))
  {
    gaugeColors = self->_gaugeColors;
    uint64_t v7 = [v4 gaugeColors];
    if (CLKEqualObjects(gaugeColors, v7))
    {
      gaugeColorLocations = self->_gaugeColorLocations;
      uint64_t v9 = [v4 gaugeColorLocations];
      if (CLKEqualObjects(gaugeColorLocations, v9))
      {
        accessibilityLabel = self->_accessibilityLabel;
        v11 = [v4 accessibilityLabel];
        char v12 = CLKEqualObjects(accessibilityLabel, v11);
      }
      else
      {
        char v12 = 0;
      }
    }
    else
    {
      char v12 = 0;
    }
  }
  else
  {
    char v12 = 0;
  }

  return v12;
}

- (unint64_t)hash
{
  objc_super v3 = [NSNumber numberWithInteger:self->_style];
  double v4 = (double)(unint64_t)[v3 hash];
  double v5 = (double)(unint64_t)[(NSArray *)self->_gaugeColors hash] * 1000000.0 + v4 * 10000000.0;
  double v6 = v5 + (double)(unint64_t)[(NSArray *)self->_gaugeColorLocations hash] * 100000.0;
  unint64_t v7 = (unint64_t)(v6 + (double)[(NSString *)self->_accessibilityLabel hash] * 10000.0);

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  if (self->_finalized)
  {
    return self;
  }
  else
  {
    uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
    *(void *)(v4 + 16) = self->_style;
    objc_storeStrong((id *)(v4 + 24), self->_gaugeColors);
    objc_storeStrong((id *)(v4 + 32), self->_gaugeColorLocations);
    uint64_t v5 = [(NSString *)self->_accessibilityLabel copy];
    double v6 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v5;

    return (id)v4;
  }
}

+ (CLKGaugeProvider)providerWithJSONObjectRepresentation:(id)a3 bundle:(id)a4
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    [MEMORY[0x263EFF940] raise:@"CLKComplicationBundleException", @"must be a dictionary. Invalid value: %@", v4 format];
  }
  uint64_t v5 = [v4 objectForKeyedSubscript:@"class"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    [MEMORY[0x263EFF940] raise:@"CLKComplicationBundleException", @"value for key '%@' must be a string - invalid value: %@", @"class", v5 format];
  }
  Class v6 = NSClassFromString(v5);
  if (([(objc_class *)v6 isSubclassOfClass:objc_opt_class()] & 1) == 0) {
    [MEMORY[0x263EFF940] raise:@"CLKComplicationBundleException", @"class: %@ must be a CLKGaugeProvider class", v5 format];
  }
  unint64_t v7 = (void *)[[v6 alloc] initWithJSONObjectRepresentation:v4];

  return (CLKGaugeProvider *)v7;
}

- (CLKGaugeProvider)initWithJSONObjectRepresentation:(id)a3
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v26 = [(CLKGaugeProvider *)self _init];
  if (v26)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      [MEMORY[0x263EFF940] raise:@"CLKComplicationBundleException", @"must be a dictionary. Invalid value: %@", v4 format];
    }
    v27 = v4;
    v24 = [v4 objectForKeyedSubscript:@"gaugeStyle"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v26->_int64_t style = [v24 integerValue];
    }
    else {
      [MEMORY[0x263EFF940] raise:@"CLKComplicationBundleException", @"value for key '%@' must be a integer - invalid value: %@", @"gaugeStyle", v24 format];
    }
    v25 = [v4 objectForKeyedSubscript:@"gaugeColors"];
    if (v25)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v5 = [MEMORY[0x263EFF980] array];
        long long v34 = 0u;
        long long v35 = 0u;
        long long v32 = 0u;
        long long v33 = 0u;
        id v6 = v25;
        uint64_t v7 = [v6 countByEnumeratingWithState:&v32 objects:v37 count:16];
        if (v7)
        {
          uint64_t v8 = *(void *)v33;
          do
          {
            for (uint64_t i = 0; i != v7; ++i)
            {
              if (*(void *)v33 != v8) {
                objc_enumerationMutation(v6);
              }
              uint64_t v10 = *(void *)(*((void *)&v32 + 1) + 8 * i);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v11 = (void *)[objc_alloc(MEMORY[0x263F825C8]) initWithJSONObjectRepresentation:v10];
                [(NSArray *)v5 addObject:v11];
              }
              else
              {
                [MEMORY[0x263EFF940] raise:@"CLKComplicationBundleException", @"value in key '%@' must be a dictionary - invalid value: %@", @"gaugeColors", v10 format];
              }
            }
            uint64_t v7 = [v6 countByEnumeratingWithState:&v32 objects:v37 count:16];
          }
          while (v7);
        }

        gaugeColors = v26->_gaugeColors;
        v26->_gaugeColors = v5;
      }
      else
      {
        [MEMORY[0x263EFF940] raise:@"CLKComplicationBundleException", @"value for key '%@' must be a array - invalid value: %@", @"gaugeColors", v25 format];
      }
    }
    v13 = [v27 objectForKeyedSubscript:@"gaugeColorLocations"];
    if (v13)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v14 = objc_alloc_init(MEMORY[0x263EFF980]);
        long long v30 = 0u;
        long long v31 = 0u;
        long long v28 = 0u;
        long long v29 = 0u;
        id v15 = v13;
        uint64_t v16 = [v15 countByEnumeratingWithState:&v28 objects:v36 count:16];
        if (v16)
        {
          uint64_t v17 = *(void *)v29;
          do
          {
            for (uint64_t j = 0; j != v16; ++j)
            {
              if (*(void *)v29 != v17) {
                objc_enumerationMutation(v15);
              }
              uint64_t v19 = *(void *)(*((void *)&v28 + 1) + 8 * j);
              objc_opt_class();
              if (objc_opt_isKindOfClass()) {
                [v14 addObject:v19];
              }
              else {
                [MEMORY[0x263EFF940] raise:@"CLKComplicationBundleException", @"value for gaugeColorLocation must be a number - invalid value: %@", v19 format];
              }
            }
            uint64_t v16 = [v15 countByEnumeratingWithState:&v28 objects:v36 count:16];
          }
          while (v16);
        }

        if ([v14 count])
        {
          uint64_t v20 = [objc_alloc(MEMORY[0x263EFF8C0]) initWithArray:v14];
          gaugeColorLocations = v26->_gaugeColorLocations;
          v26->_gaugeColorLocations = (NSArray *)v20;
        }
      }
      else
      {
        [MEMORY[0x263EFF940] raise:@"CLKComplicationBundleException", @"value for key '%@' must be a array - invalid value: %@", @"gaugeColorLocations", v13 format];
      }
    }
    v22 = [v27 objectForKeyedSubscript:@"accessibilityLabel"];
    if (v22)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        [MEMORY[0x263EFF940] raise:@"CLKComplicationBundleException", @"value for key '%@' must be a string - invalid value: %@", @"accessibilityLabel", v22 format];
      }
      objc_storeStrong((id *)&v26->_accessibilityLabel, v22);
    }

    id v4 = v27;
  }

  return v26;
}

- (id)JSONObjectRepresentation
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  objc_super v3 = objc_opt_new();
  id v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  [v3 setObject:v5 forKeyedSubscript:@"class"];

  id v6 = [NSNumber numberWithInteger:self->_style];
  [v3 setObject:v6 forKeyedSubscript:@"gaugeStyle"];

  uint64_t v7 = [MEMORY[0x263EFF980] array];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v8 = self->_gaugeColors;
  uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "JSONObjectRepresentation", (void)v16);
        [v7 addObject:v13];
      }
      uint64_t v10 = [(NSArray *)v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v10);
  }

  [v3 setObject:v7 forKeyedSubscript:@"gaugeColors"];
  gaugeColorLocations = self->_gaugeColorLocations;
  if (gaugeColorLocations) {
    [v3 setObject:gaugeColorLocations forKeyedSubscript:@"gaugeColorLocations"];
  }
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_accessibilityLabel, @"accessibilityLabel", (void)v16);

  return v3;
}

- (BOOL)validate
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  gaugeColors = self->_gaugeColors;
  if (!gaugeColors) {
    return 1;
  }
  if (!self->_gaugeColorLocations) {
    return 1;
  }
  uint64_t v4 = [(NSArray *)gaugeColors count];
  if (v4 == [(NSArray *)self->_gaugeColorLocations count]) {
    return 1;
  }
  id v6 = CLKLoggingObjectForDomain(10);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
  {
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = self->_gaugeColors;
    id v9 = v7;
    uint64_t v10 = [(NSArray *)v8 count];
    NSUInteger v11 = [(NSArray *)self->_gaugeColorLocations count];
    int v13 = 138413570;
    id v14 = @"gaugeColors";
    __int16 v15 = 2112;
    long long v16 = @"gaugeColorLocations";
    __int16 v17 = 2112;
    long long v18 = v7;
    __int16 v19 = 2048;
    uint64_t v20 = v10;
    __int16 v21 = 2048;
    NSUInteger v22 = v11;
    __int16 v23 = 2112;
    id v24 = (id)objc_opt_class();
    id v12 = v24;
    _os_log_fault_impl(&dword_21C599000, v6, OS_LOG_TYPE_FAULT, "Properties '%@' and '%@' on %@ have different counts (%lu and %lu). They must have the same count when passing %@ to the complication data handler.", (uint8_t *)&v13, 0x3Eu);
  }
  return 0;
}

- (void)finalize
{
  self->_finalized = 1;
}

- (CLKGaugeProviderStyle)style
{
  return self->_style;
}

- (void)setStyle:(int64_t)a3
{
  self->_int64_t style = a3;
}

- (NSArray)gaugeColors
{
  return self->_gaugeColors;
}

- (void)setGaugeColors:(id)a3
{
}

- (NSArray)gaugeColorLocations
{
  return self->_gaugeColorLocations;
}

- (void)setGaugeColorLocations:(id)a3
{
}

- (NSString)accessibilityLabel
{
  return self->_accessibilityLabel;
}

- (void)setAccessibilityLabel:(NSString *)accessibilityLabel
{
}

- (BOOL)paused
{
  return self->_paused;
}

- (void)setPaused:(BOOL)a3
{
  self->_paused = a3;
}

- (BOOL)finalized
{
  return self->_finalized;
}

- (void)setFinalized:(BOOL)a3
{
  self->_finalized = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessibilityLabel, 0);
  objc_storeStrong((id *)&self->_gaugeColorLocations, 0);

  objc_storeStrong((id *)&self->_gaugeColors, 0);
}

@end
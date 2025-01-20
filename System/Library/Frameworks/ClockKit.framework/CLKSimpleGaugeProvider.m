@interface CLKSimpleGaugeProvider
+ (BOOL)supportsSecureCoding;
+ (CLKSimpleGaugeProvider)gaugeProviderWithStyle:(CLKGaugeProviderStyle)style gaugeColor:(UIColor *)color fillFraction:(float)fillFraction;
+ (CLKSimpleGaugeProvider)gaugeProviderWithStyle:(CLKGaugeProviderStyle)style gaugeColors:(NSArray *)gaugeColors gaugeColorLocations:(NSArray *)gaugeColorLocations fillFraction:(float)fillFraction;
- (BOOL)isEqual:(id)a3;
- (BOOL)needsTimerUpdates;
- (BOOL)validate;
- (CLKSimpleGaugeProvider)initWithCoder:(id)a3;
- (CLKSimpleGaugeProvider)initWithJSONObjectRepresentation:(id)a3;
- (double)progressFractionForNow:(id)a3;
- (float)fillFraction;
- (id)JSONObjectRepresentation;
- (id)copyWithZone:(_NSZone *)a3;
- (id)startUpdatesWithHandler:(id)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setFillFraction:(float)a3;
- (void)validate;
@end

@implementation CLKSimpleGaugeProvider

+ (CLKSimpleGaugeProvider)gaugeProviderWithStyle:(CLKGaugeProviderStyle)style gaugeColors:(NSArray *)gaugeColors gaugeColorLocations:(NSArray *)gaugeColorLocations fillFraction:(float)fillFraction
{
  v9 = gaugeColorLocations;
  v10 = gaugeColors;
  id v11 = [(CLKGaugeProvider *)[CLKSimpleGaugeProvider alloc] _init];
  [v11 setStyle:style];
  [v11 setGaugeColors:v10];

  [v11 setGaugeColorLocations:v9];
  *(float *)&double v12 = fillFraction;
  [v11 setFillFraction:v12];

  return (CLKSimpleGaugeProvider *)v11;
}

+ (CLKSimpleGaugeProvider)gaugeProviderWithStyle:(CLKGaugeProviderStyle)style gaugeColor:(UIColor *)color fillFraction:(float)fillFraction
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  v14 = color;
  v8 = (void *)MEMORY[0x263EFF8C0];
  v9 = color;
  v10 = [v8 arrayWithObjects:&v14 count:1];

  *(float *)&double v11 = fillFraction;
  double v12 = objc_msgSend(a1, "gaugeProviderWithStyle:gaugeColors:gaugeColorLocations:fillFraction:", style, v10, 0, v11, v14, v15);

  return (CLKSimpleGaugeProvider *)v12;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CLKSimpleGaugeProvider;
  id v4 = a3;
  [(CLKGaugeProvider *)&v6 encodeWithCoder:v4];
  *(float *)&double v5 = self->_fillFraction;
  objc_msgSend(v4, "encodeFloat:forKey:", @"_FillFractionKey", v5, v6.receiver, v6.super_class);
}

- (CLKSimpleGaugeProvider)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CLKSimpleGaugeProvider;
  double v5 = [(CLKGaugeProvider *)&v8 initWithCoder:v4];
  if (v5)
  {
    [v4 decodeFloatForKey:@"_FillFractionKey"];
    v5->_fillFraction = v6;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)needsTimerUpdates
{
  return 0;
}

- (double)progressFractionForNow:(id)a3
{
  return self->_fillFraction;
}

- (id)startUpdatesWithHandler:(id)a3
{
  return &unk_26CCDBFC8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CLKSimpleGaugeProvider;
  if ([(CLKGaugeProvider *)&v9 isEqual:v4] && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    float fillFraction = self->_fillFraction;
    [v4 fillFraction];
    BOOL v7 = fillFraction == v6;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  v8.receiver = self;
  v8.super_class = (Class)CLKSimpleGaugeProvider;
  double v3 = (double)[(CLKGaugeProvider *)&v8 hash];
  *(float *)&double v4 = self->_fillFraction;
  double v5 = [NSNumber numberWithFloat:v4];
  unint64_t v6 = (unint64_t)(v3 + (double)(unint64_t)[v5 hash] * 10000.0);

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CLKSimpleGaugeProvider;
  id result = [(CLKGaugeProvider *)&v5 copyWithZone:a3];
  if (result != self) {
    *((_DWORD *)result + 12) = LODWORD(self->_fillFraction);
  }
  return result;
}

- (CLKSimpleGaugeProvider)initWithJSONObjectRepresentation:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CLKSimpleGaugeProvider;
  objc_super v5 = [(CLKGaugeProvider *)&v9 initWithJSONObjectRepresentation:v4];
  if (v5)
  {
    unint64_t v6 = [v4 objectForKeyedSubscript:@"gaugeFillFraction"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v6 floatValue];
      v5->_float fillFraction = v7;
    }
    else
    {
      [MEMORY[0x263EFF940] raise:@"gaugeColorLocations", @"value for key '%@' must be a number - invalid value: %@", @"gaugeFillFraction", v6 format];
    }
  }
  return v5;
}

- (id)JSONObjectRepresentation
{
  v8.receiver = self;
  v8.super_class = (Class)CLKSimpleGaugeProvider;
  double v3 = [(CLKGaugeProvider *)&v8 JSONObjectRepresentation];
  id v4 = (void *)[v3 mutableCopy];

  *(float *)&double v5 = self->_fillFraction;
  unint64_t v6 = [NSNumber numberWithFloat:v5];
  [v4 setObject:v6 forKeyedSubscript:@"gaugeFillFraction"];

  return v4;
}

- (BOOL)validate
{
  v8.receiver = self;
  v8.super_class = (Class)CLKSimpleGaugeProvider;
  BOOL v3 = [(CLKGaugeProvider *)&v8 validate];
  if (v3)
  {
    float fillFraction = self->_fillFraction;
    if (fillFraction == -1.0 || (fillFraction >= 0.0 ? (BOOL v5 = fillFraction <= 1.0) : (BOOL v5 = 0), v5))
    {
      LOBYTE(v3) = 1;
    }
    else
    {
      unint64_t v6 = CLKLoggingObjectForDomain(10);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
        [(CLKSimpleGaugeProvider *)(uint64_t)self validate];
      }

      LOBYTE(v3) = 0;
    }
  }
  return v3;
}

- (float)fillFraction
{
  return self->_fillFraction;
}

- (void)setFillFraction:(float)a3
{
  self->_float fillFraction = a3;
}

- (void)validate
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  BOOL v3 = objc_opt_class();
  id v4 = v3;
  int v6 = 138412546;
  float v7 = v3;
  __int16 v8 = 2112;
  id v9 = (id)objc_opt_class();
  id v5 = v9;
  _os_log_fault_impl(&dword_21C599000, a2, OS_LOG_TYPE_FAULT, "Property 'fillFraction' on %@ must have a value between 0 and 1 when passing %@ to the complication data handler", (uint8_t *)&v6, 0x16u);
}

@end
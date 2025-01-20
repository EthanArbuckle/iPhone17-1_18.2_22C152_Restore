@interface CLKTimeIntervalGaugeProvider
+ (BOOL)supportsSecureCoding;
+ (CLKTimeIntervalGaugeProvider)gaugeProviderWithStyle:(CLKGaugeProviderStyle)style gaugeColors:(NSArray *)gaugeColors gaugeColorLocations:(NSArray *)gaugeColorLocations startDate:(NSDate *)startDate endDate:(NSDate *)endDate;
+ (CLKTimeIntervalGaugeProvider)gaugeProviderWithStyle:(CLKGaugeProviderStyle)style gaugeColors:(NSArray *)gaugeColors gaugeColorLocations:(NSArray *)gaugeColorLocations startDate:(NSDate *)startDate startFillFraction:(float)startFillFraction endDate:(NSDate *)endDate endFillFraction:(float)endFillFraction;
- (BOOL)isEqual:(id)a3;
- (BOOL)needsTimerUpdates;
- (BOOL)paused;
- (BOOL)validate;
- (CLKTimeIntervalGaugeProvider)initWithCoder:(id)a3;
- (CLKTimeIntervalGaugeProvider)initWithJSONObjectRepresentation:(id)a3;
- (NSDate)endDate;
- (NSDate)startDate;
- (double)progressFractionForNow:(id)a3;
- (float)endFillFraction;
- (float)startFillFraction;
- (id)JSONObjectRepresentation;
- (id)copyWithZone:(_NSZone *)a3;
- (id)startUpdatesWithHandler:(id)a3;
- (unint64_t)hash;
- (void)_maybeStartOrStopUpdates;
- (void)_update;
- (void)encodeWithCoder:(id)a3;
- (void)setEndDate:(id)a3;
- (void)setEndFillFraction:(float)a3;
- (void)setPaused:(BOOL)a3;
- (void)setStartDate:(id)a3;
- (void)setStartFillFraction:(float)a3;
- (void)stopUpdatesForToken:(id)a3;
- (void)validate;
@end

@implementation CLKTimeIntervalGaugeProvider

+ (CLKTimeIntervalGaugeProvider)gaugeProviderWithStyle:(CLKGaugeProviderStyle)style gaugeColors:(NSArray *)gaugeColors gaugeColorLocations:(NSArray *)gaugeColorLocations startDate:(NSDate *)startDate startFillFraction:(float)startFillFraction endDate:(NSDate *)endDate endFillFraction:(float)endFillFraction
{
  v15 = endDate;
  v16 = startDate;
  v17 = gaugeColorLocations;
  v18 = gaugeColors;
  id v19 = [(CLKGaugeProvider *)[CLKTimeIntervalGaugeProvider alloc] _init];
  [v19 setStyle:style];
  [v19 setGaugeColors:v18];

  [v19 setGaugeColorLocations:v17];
  [v19 setStartDate:v16];

  [v19 setEndDate:v15];
  *(float *)&double v20 = startFillFraction;
  [v19 setStartFillFraction:v20];
  *(float *)&double v21 = endFillFraction;
  [v19 setEndFillFraction:v21];

  return (CLKTimeIntervalGaugeProvider *)v19;
}

+ (CLKTimeIntervalGaugeProvider)gaugeProviderWithStyle:(CLKGaugeProviderStyle)style gaugeColors:(NSArray *)gaugeColors gaugeColorLocations:(NSArray *)gaugeColorLocations startDate:(NSDate *)startDate endDate:(NSDate *)endDate
{
  LODWORD(v7) = 1.0;
  return (CLKTimeIntervalGaugeProvider *)[a1 gaugeProviderWithStyle:style gaugeColors:gaugeColors gaugeColorLocations:gaugeColorLocations startDate:startDate startFillFraction:endDate endDate:0.0 endFillFraction:v7];
}

- (void)encodeWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CLKTimeIntervalGaugeProvider;
  id v4 = a3;
  [(CLKGaugeProvider *)&v7 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_startDate, @"_StartDateKey", v7.receiver, v7.super_class);
  *(float *)&double v5 = self->_startFillFraction;
  [v4 encodeFloat:@"_StartFillFractionKey" forKey:v5];
  [v4 encodeObject:self->_endDate forKey:@"_EndDateKey"];
  *(float *)&double v6 = self->_endFillFraction;
  [v4 encodeFloat:@"_EndFillFractionKey" forKey:v6];
}

- (CLKTimeIntervalGaugeProvider)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CLKTimeIntervalGaugeProvider;
  double v5 = [(CLKGaugeProvider *)&v13 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_StartDateKey"];
    startDate = v5->_startDate;
    v5->_startDate = (NSDate *)v6;

    [v4 decodeFloatForKey:@"_StartFillFractionKey"];
    v5->_startFillFraction = v8;
    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_EndDateKey"];
    endDate = v5->_endDate;
    v5->_endDate = (NSDate *)v9;

    [v4 decodeFloatForKey:@"_EndFillFractionKey"];
    v5->_endFillFraction = v11;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setPaused:(BOOL)a3
{
  if (self->_paused != a3)
  {
    self->_paused = a3;
    [(CLKTimeIntervalGaugeProvider *)self _maybeStartOrStopUpdates];
  }
}

- (BOOL)paused
{
  return self->_paused;
}

- (BOOL)needsTimerUpdates
{
  return 1;
}

- (double)progressFractionForNow:(id)a3
{
  [a3 timeIntervalSinceDate:self->_startDate];
  double v5 = v4;
  if (v4 < 0.00000011920929)
  {
    uint64_t v6 = 76;
    return *(float *)((char *)&self->super.super.isa + v6);
  }
  [(NSDate *)self->_endDate timeIntervalSinceDate:self->_startDate];
  if (v7 < 0.00000011920929)
  {
    uint64_t v6 = 80;
    return *(float *)((char *)&self->super.super.isa + v6);
  }
  double v10 = v5 / v7;
  double v11 = v7 + -0.00000011920929;
  float endFillFraction = self->_endFillFraction;
  if (v10 > v11) {
    return endFillFraction;
  }
  return self->_startFillFraction + v10 * (float)(endFillFraction - self->_startFillFraction);
}

- (id)startUpdatesWithHandler:(id)a3
{
  id v4 = a3;
  double v5 = [NSNumber numberWithUnsignedInteger:self->_nextUpdateToken];
  ++self->_nextUpdateToken;
  if (!self->_updateHandlersByToken)
  {
    uint64_t v6 = [MEMORY[0x263EFF9A0] dictionary];
    updateHandlersByToken = self->_updateHandlersByToken;
    self->_updateHandlersByToken = v6;
  }
  float v8 = (void *)[v4 copy];
  uint64_t v9 = (void *)MEMORY[0x21D4AACC0]();
  [(NSMutableDictionary *)self->_updateHandlersByToken setObject:v9 forKeyedSubscript:v5];

  [(CLKTimeIntervalGaugeProvider *)self _maybeStartOrStopUpdates];

  return v5;
}

- (void)stopUpdatesForToken:(id)a3
{
  [(NSMutableDictionary *)self->_updateHandlersByToken removeObjectForKey:a3];

  [(CLKTimeIntervalGaugeProvider *)self _maybeStartOrStopUpdates];
}

- (void)_maybeStartOrStopUpdates
{
  if ([(NSMutableDictionary *)self->_updateHandlersByToken count]
    && ![(CLKTimeIntervalGaugeProvider *)self paused])
  {
    if (!self->_timerToken)
    {
      objc_initWeak(&location, self);
      double v5 = +[CLKClockTimer sharedInstance];
      v10[0] = MEMORY[0x263EF8330];
      v10[1] = 3221225472;
      v10[2] = __56__CLKTimeIntervalGaugeProvider__maybeStartOrStopUpdates__block_invoke;
      v10[3] = &unk_26440E3C0;
      objc_copyWeak(&v11, &location);
      v8[0] = MEMORY[0x263EF8330];
      v8[1] = 3221225472;
      v8[2] = __56__CLKTimeIntervalGaugeProvider__maybeStartOrStopUpdates__block_invoke_17;
      v8[3] = &unk_26440E3E8;
      objc_copyWeak(&v9, &location);
      uint64_t v6 = [v5 startUpdatesWithUpdateFrequency:1 withHandler:v10 identificationLog:v8];
      timerToken = self->_timerToken;
      self->_timerToken = v6;

      objc_destroyWeak(&v9);
      objc_destroyWeak(&v11);
      objc_destroyWeak(&location);
    }
  }
  else if (self->_timerToken)
  {
    v3 = +[CLKClockTimer sharedInstance];
    [v3 stopUpdatesForToken:self->_timerToken];

    id v4 = self->_timerToken;
    self->_timerToken = 0;
  }
}

void __56__CLKTimeIntervalGaugeProvider__maybeStartOrStopUpdates__block_invoke(uint64_t a1, void *a2, id *a3)
{
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _update];
}

id __56__CLKTimeIntervalGaugeProvider__maybeStartOrStopUpdates__block_invoke_17(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained description];

  return v2;
}

- (void)_update
{
  updateHandlersByToken = self->_updateHandlersByToken;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __39__CLKTimeIntervalGaugeProvider__update__block_invoke;
  v4[3] = &unk_26440E410;
  v4[4] = self;
  [(NSMutableDictionary *)updateHandlersByToken enumerateKeysAndObjectsUsingBlock:v4];
  [(CLKTimeIntervalGaugeProvider *)self _maybeStartOrStopUpdates];
}

uint64_t __39__CLKTimeIntervalGaugeProvider__update__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(uint64_t, void))(a3 + 16))(a3, *(void *)(a1 + 32));
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CLKTimeIntervalGaugeProvider;
  if ([(CLKGaugeProvider *)&v15 isEqual:v4] && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    startDate = self->_startDate;
    id v6 = [v4 startDate];
    if (startDate == v6)
    {
      endDate = self->_endDate;
      id v9 = [v4 endDate];
      if (endDate == v9
        && (float startFillFraction = self->_startFillFraction, [v4 startFillFraction],
                                                          startFillFraction == v11))
      {
        float endFillFraction = self->_endFillFraction;
        [v4 endFillFraction];
        BOOL v7 = endFillFraction == v13;
      }
      else
      {
        BOOL v7 = 0;
      }
    }
    else
    {
      BOOL v7 = 0;
    }
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  v13.receiver = self;
  v13.super_class = (Class)CLKTimeIntervalGaugeProvider;
  double v3 = (double)[(CLKGaugeProvider *)&v13 hash];
  *(float *)&double v4 = self->_startFillFraction;
  double v5 = [NSNumber numberWithFloat:v4];
  double v6 = (double)(unint64_t)[v5 hash];
  double v7 = v3 + v6 * 100000.0;
  *(float *)&double v6 = self->_endFillFraction;
  float v8 = [NSNumber numberWithFloat:v6];
  double v9 = v7 + (double)(unint64_t)[v8 hash] * 10000.0;
  double v10 = v9 + (double)(unint64_t)[(NSDate *)self->_startDate hash] * 1000.0;
  unint64_t v11 = (unint64_t)(v10 + (double)(unint64_t)[(NSDate *)self->_endDate hash] * 100.0);

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CLKTimeIntervalGaugeProvider;
  double v4 = [(CLKGaugeProvider *)&v7 copyWithZone:a3];
  double v5 = v4;
  if (v4 != self)
  {
    objc_storeStrong((id *)&v4->_startDate, self->_startDate);
    objc_storeStrong((id *)&v5->_endDate, self->_endDate);
    v5->_float startFillFraction = self->_startFillFraction;
    v5->_float endFillFraction = self->_endFillFraction;
  }
  return v5;
}

- (CLKTimeIntervalGaugeProvider)initWithJSONObjectRepresentation:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)CLKTimeIntervalGaugeProvider;
  double v5 = [(CLKGaugeProvider *)&v17 initWithJSONObjectRepresentation:v4];
  if (v5)
  {
    double v6 = [v4 objectForKeyedSubscript:@"gaugeStartDate"];
    if (v6)
    {
      uint64_t v7 = [objc_alloc(MEMORY[0x263EFF910]) initWithJSONObjectRepresentation:v6];
      startDate = v5->_startDate;
      v5->_startDate = (NSDate *)v7;
    }
    double v9 = [v4 objectForKeyedSubscript:@"gaugeEndDate"];
    if (v9)
    {
      uint64_t v10 = [objc_alloc(MEMORY[0x263EFF910]) initWithJSONObjectRepresentation:v9];
      endDate = v5->_endDate;
      v5->_endDate = (NSDate *)v10;
    }
    v12 = [v4 objectForKeyedSubscript:@"gaugeStartFillFraction"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v12 floatValue];
      v5->_float startFillFraction = v13;
    }
    else
    {
      [MEMORY[0x263EFF940] raise:@"gaugeColorLocations", @"value for key '%@' must be a number - invalid value: %@", @"gaugeStartFillFraction", v12 format];
    }
    v14 = [v4 objectForKeyedSubscript:@"gaugeEndFillFraction"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v14 floatValue];
      v5->_float endFillFraction = v15;
    }
    else
    {
      [MEMORY[0x263EFF940] raise:@"gaugeColorLocations", @"value for key '%@' must be a number - invalid value: %@", @"gaugeEndFillFraction", v14 format];
    }
  }
  return v5;
}

- (id)JSONObjectRepresentation
{
  v14.receiver = self;
  v14.super_class = (Class)CLKTimeIntervalGaugeProvider;
  double v3 = [(CLKGaugeProvider *)&v14 JSONObjectRepresentation];
  id v4 = (void *)[v3 mutableCopy];

  startDate = self->_startDate;
  if (startDate)
  {
    uint64_t v7 = [(NSDate *)startDate JSONObjectRepresentation];
    [v4 setObject:v7 forKeyedSubscript:@"gaugeStartDate"];
  }
  endDate = self->_endDate;
  if (endDate)
  {
    double v9 = [(NSDate *)endDate JSONObjectRepresentation];
    [v4 setObject:v9 forKeyedSubscript:@"gaugeEndDate"];
  }
  *(float *)&double v5 = self->_startFillFraction;
  uint64_t v10 = [NSNumber numberWithFloat:v5];
  [v4 setObject:v10 forKeyedSubscript:@"gaugeStartFillFraction"];

  *(float *)&double v11 = self->_endFillFraction;
  v12 = [NSNumber numberWithFloat:v11];
  [v4 setObject:v12 forKeyedSubscript:@"gaugeEndFillFraction"];

  return v4;
}

- (BOOL)validate
{
  v11.receiver = self;
  v11.super_class = (Class)CLKTimeIntervalGaugeProvider;
  BOOL v3 = [(CLKGaugeProvider *)&v11 validate];
  if (v3)
  {
    startDate = self->_startDate;
    if (!startDate)
    {
      double v5 = CLKLoggingObjectForDomain(10);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
        -[CLKTimeIntervalGaugeProvider validate]();
      }
      goto LABEL_23;
    }
    if (!self->_endDate)
    {
      double v5 = CLKLoggingObjectForDomain(10);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
        -[CLKTimeIntervalGaugeProvider validate]();
      }
      goto LABEL_23;
    }
    if (-[NSDate compare:](startDate, "compare:") != NSOrderedAscending)
    {
      double v5 = CLKLoggingObjectForDomain(10);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
        [(CLKTimeIntervalGaugeProvider *)(uint64_t)self validate];
      }
LABEL_23:

      LOBYTE(v3) = 0;
      return v3;
    }
    float startFillFraction = self->_startFillFraction;
    if (startFillFraction < 0.0 || startFillFraction > 1.0)
    {
      double v5 = CLKLoggingObjectForDomain(10);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
        -[CLKTimeIntervalGaugeProvider validate]();
      }
      goto LABEL_23;
    }
    float endFillFraction = self->_endFillFraction;
    if (endFillFraction < 0.0 || endFillFraction > 1.0)
    {
      double v5 = CLKLoggingObjectForDomain(10);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
        -[CLKTimeIntervalGaugeProvider validate].cold.4();
      }
      goto LABEL_23;
    }
    LOBYTE(v3) = 1;
  }
  return v3;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (void)setEndDate:(id)a3
{
}

- (float)startFillFraction
{
  return self->_startFillFraction;
}

- (void)setStartFillFraction:(float)a3
{
  self->_float startFillFraction = a3;
}

- (float)endFillFraction
{
  return self->_endFillFraction;
}

- (void)setEndFillFraction:(float)a3
{
  self->_float endFillFraction = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_timerToken, 0);

  objc_storeStrong((id *)&self->_updateHandlersByToken, 0);
}

- (void)validate
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v4 = 138412290;
  id v5 = (id)objc_opt_class();
  id v3 = v5;
  _os_log_fault_impl(&dword_21C599000, a2, OS_LOG_TYPE_FAULT, "Value of 'startDate' must be earlier than 'endDate' on %@.", (uint8_t *)&v4, 0xCu);
}

@end
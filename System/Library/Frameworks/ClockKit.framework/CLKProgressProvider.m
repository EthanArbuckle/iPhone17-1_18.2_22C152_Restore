@interface CLKProgressProvider
+ (BOOL)supportsSecureCoding;
- (BOOL)_needsUpdates;
- (BOOL)isEqual:(id)a3;
- (BOOL)paused;
- (BOOL)validate;
- (CLKProgressProvider)init;
- (CLKProgressProvider)initWithCoder:(id)a3;
- (UIColor)tintColor;
- (double)_progressFractionForNow:(id)a3;
- (double)backgroundRingAlpha;
- (id)JSONObjectRepresentation;
- (id)copyWithZone:(_NSZone *)a3;
- (id)startUpdatesWithHandler:(id)a3;
- (int64_t)timeTravelUpdateFrequency;
- (unint64_t)hash;
- (void)_commonInit;
- (void)_maybeStartOrStopUpdates;
- (void)_update;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)finalize;
- (void)setBackgroundRingAlpha:(double)a3;
- (void)setPaused:(BOOL)a3;
- (void)setTintColor:(id)a3;
- (void)stopUpdatesForToken:(id)a3;
@end

@implementation CLKProgressProvider

- (CLKProgressProvider)init
{
  v5.receiver = self;
  v5.super_class = (Class)CLKProgressProvider;
  v2 = [(CLKProgressProvider *)&v5 init];
  v3 = v2;
  if (v2) {
    [(CLKProgressProvider *)v2 _commonInit];
  }
  return v3;
}

- (void)_commonInit
{
  self->_paused = 1;
  self->_backgroundRingAlpha = -1.0;
  v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
  updateHandlersByToken = self->_updateHandlersByToken;
  self->_updateHandlersByToken = v3;

  MEMORY[0x270F9A758](v3, updateHandlersByToken);
}

- (void)dealloc
{
  if (self->_timerToken)
  {
    v3 = +[CLKClockTimer sharedInstance];
    [v3 stopUpdatesForToken:self->_timerToken];
  }
  v4.receiver = self;
  v4.super_class = (Class)CLKProgressProvider;
  [(CLKProgressProvider *)&v4 dealloc];
}

- (void)setPaused:(BOOL)a3
{
  if (self->_paused != a3)
  {
    self->_paused = a3;
    [(CLKProgressProvider *)self _maybeStartOrStopUpdates];
  }
}

- (id)startUpdatesWithHandler:(id)a3
{
  objc_super v4 = NSNumber;
  unint64_t nextUpdateToken = self->_nextUpdateToken;
  id v6 = a3;
  v7 = [v4 numberWithUnsignedInteger:nextUpdateToken];
  ++self->_nextUpdateToken;
  v8 = (void *)[v6 copy];

  v9 = (void *)MEMORY[0x21D4AACC0](v8);
  [(NSMutableDictionary *)self->_updateHandlersByToken setObject:v9 forKeyedSubscript:v7];

  [(CLKProgressProvider *)self _maybeStartOrStopUpdates];

  return v7;
}

- (void)stopUpdatesForToken:(id)a3
{
  [(NSMutableDictionary *)self->_updateHandlersByToken removeObjectForKey:a3];

  [(CLKProgressProvider *)self _maybeStartOrStopUpdates];
}

- (BOOL)validate
{
  return 1;
}

- (void)finalize
{
  self->_finalized = 1;
}

- (int64_t)timeTravelUpdateFrequency
{
  if ([(CLKProgressProvider *)self _needsUpdates]) {
    return 2;
  }
  else {
    return 0;
  }
}

- (void)_maybeStartOrStopUpdates
{
  if ([(NSMutableDictionary *)self->_updateHandlersByToken count]
    && !self->_paused
    && [(CLKProgressProvider *)self _needsUpdates])
  {
    if (!self->_timerToken)
    {
      objc_initWeak(&location, self);
      v3 = +[CLKClockTimer sharedInstance];
      v10[0] = MEMORY[0x263EF8330];
      v10[1] = 3221225472;
      v10[2] = __47__CLKProgressProvider__maybeStartOrStopUpdates__block_invoke;
      v10[3] = &unk_26440E3C0;
      objc_copyWeak(&v11, &location);
      v8[0] = MEMORY[0x263EF8330];
      v8[1] = 3221225472;
      v8[2] = __47__CLKProgressProvider__maybeStartOrStopUpdates__block_invoke_5;
      v8[3] = &unk_26440E3E8;
      objc_copyWeak(&v9, &location);
      objc_super v4 = [v3 startUpdatesWithUpdateFrequency:1 withHandler:v10 identificationLog:v8];
      timerToken = self->_timerToken;
      self->_timerToken = v4;

      objc_destroyWeak(&v9);
      objc_destroyWeak(&v11);
      objc_destroyWeak(&location);
    }
  }
  else if (self->_timerToken)
  {
    id v6 = +[CLKClockTimer sharedInstance];
    [v6 stopUpdatesForToken:self->_timerToken];

    v7 = self->_timerToken;
    self->_timerToken = 0;
  }
}

void __47__CLKProgressProvider__maybeStartOrStopUpdates__block_invoke(uint64_t a1, void *a2, id *a3)
{
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _update];
}

id __47__CLKProgressProvider__maybeStartOrStopUpdates__block_invoke_5(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained description];

  return v2;
}

- (void)_update
{
  [(NSMutableDictionary *)self->_updateHandlersByToken enumerateKeysAndObjectsUsingBlock:&__block_literal_global_5];

  [(CLKProgressProvider *)self _maybeStartOrStopUpdates];
}

uint64_t __30__CLKProgressProvider__update__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(uint64_t))(a3 + 16))(a3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  if (self->_finalized)
  {
    return self;
  }
  else
  {
    objc_super v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
    [v4 setTintColor:self->_tintColor];
    [v4 setBackgroundRingAlpha:self->_backgroundRingAlpha];
    return v4;
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    tintColor = self->_tintColor;
    id v6 = [v4 tintColor];
    if (CLKEqualObjects(tintColor, v6))
    {
      double backgroundRingAlpha = self->_backgroundRingAlpha;
      [v4 backgroundRingAlpha];
      BOOL v9 = CLKFloatEqualsFloat(backgroundRingAlpha, v8);
    }
    else
    {
      BOOL v9 = 0;
    }
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  double v3 = (double)(unint64_t)[(UIColor *)self->_tintColor hash];
  id v4 = [NSNumber numberWithDouble:self->_backgroundRingAlpha];
  unint64_t v5 = (unint64_t)((double)(unint64_t)[v4 hash] * 100.0 + v3 * 1000.0);

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  tintColor = self->_tintColor;
  id v5 = a3;
  [v5 encodeObject:tintColor forKey:@"TintColor"];
  id v6 = [NSNumber numberWithDouble:self->_backgroundRingAlpha];
  [v5 encodeObject:v6 forKey:@"BackgroundRingAlpha"];
}

- (CLKProgressProvider)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CLKProgressProvider;
  id v5 = [(CLKProgressProvider *)&v12 init];
  id v6 = v5;
  if (v5)
  {
    [(CLKProgressProvider *)v5 _commonInit];
    uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"TintColor"];
    tintColor = v6->_tintColor;
    v6->_tintColor = (UIColor *)v7;

    BOOL v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"BackgroundRingAlpha"];
    [v9 floatValue];
    v6->_double backgroundRingAlpha = v10;
  }
  return v6;
}

- (id)JSONObjectRepresentation
{
  double v3 = objc_opt_new();
  id v4 = [MEMORY[0x263EFF9A0] dictionaryWithDictionary:v3];

  id v5 = [(UIColor *)self->_tintColor JSONObjectRepresentation];
  [v4 setObject:v5 forKeyedSubscript:@"tintColor"];

  id v6 = [NSNumber numberWithDouble:self->_backgroundRingAlpha];
  [v4 setObject:v6 forKeyedSubscript:@"backgroundAlpha"];

  return v4;
}

- (BOOL)_needsUpdates
{
  return 0;
}

- (double)_progressFractionForNow:(id)a3
{
  return 0.0;
}

- (UIColor)tintColor
{
  return self->_tintColor;
}

- (void)setTintColor:(id)a3
{
}

- (double)backgroundRingAlpha
{
  return self->_backgroundRingAlpha;
}

- (void)setBackgroundRingAlpha:(double)a3
{
  self->_double backgroundRingAlpha = a3;
}

- (BOOL)paused
{
  return self->_paused;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tintColor, 0);
  objc_storeStrong((id *)&self->_timerToken, 0);

  objc_storeStrong((id *)&self->_updateHandlersByToken, 0);
}

@end
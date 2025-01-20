@interface DRSTaskingLimitingParameters
+ (id)_customerParameters;
+ (id)_disabledParameters;
+ (id)_internalParameters;
+ (id)_seedParameters;
+ (id)defaultDeviceParameters;
+ (id)parametersForPlatform:(unsigned __int8)a3 isInternal:(BOOL)a4 isSeed:(BOOL)a5 isCarrier:(BOOL)a6 taskingIsEnabled:(BOOL)a7;
- (BOOL)isEqual:(id)a3;
- (DRSTaskingLimitingParameters)initWithAcceptConfigCountCap:(unint64_t)a3 taskingHysteresisInterval:(double)a4;
- (double)perTeamTaskingHysteresisInterval;
- (double)taskingHysteresisInterval;
- (unint64_t)acceptedConfigCountCap;
@end

@implementation DRSTaskingLimitingParameters

- (DRSTaskingLimitingParameters)initWithAcceptConfigCountCap:(unint64_t)a3 taskingHysteresisInterval:(double)a4
{
  v7.receiver = self;
  v7.super_class = (Class)DRSTaskingLimitingParameters;
  result = [(DRSTaskingLimitingParameters *)&v7 init];
  if (result)
  {
    result->_acceptedConfigCountCap = a3;
    result->_taskingHysteresisInterval = a4;
  }
  return result;
}

+ (id)defaultDeviceParameters
{
  v3 = +[DRSSystemProfile sharedInstance];
  v4 = objc_msgSend(a1, "parametersForPlatform:isInternal:isSeed:isCarrier:taskingIsEnabled:", objc_msgSend(v3, "platform"), objc_msgSend(v3, "isInternal"), objc_msgSend(v3, "isSeed"), objc_msgSend(v3, "isCarrier"), objc_msgSend(v3, "isTaskingEnabled"));

  return v4;
}

+ (id)_disabledParameters
{
  if (_disabledParameters_onceToken != -1) {
    dispatch_once(&_disabledParameters_onceToken, &__block_literal_global_7);
  }
  v2 = (void *)_disabledParameters_parameters;

  return v2;
}

void __51__DRSTaskingLimitingParameters__disabledParameters__block_invoke()
{
  v0 = [[DRSTaskingLimitingParameters alloc] initWithAcceptConfigCountCap:0 taskingHysteresisInterval:3600.0];
  v1 = (void *)_disabledParameters_parameters;
  _disabledParameters_parameters = (uint64_t)v0;
}

+ (id)_internalParameters
{
  if (_internalParameters_onceToken != -1) {
    dispatch_once(&_internalParameters_onceToken, &__block_literal_global_178);
  }
  v2 = (void *)_internalParameters_parameters;

  return v2;
}

void __51__DRSTaskingLimitingParameters__internalParameters__block_invoke()
{
  v0 = [[DRSTaskingLimitingParameters alloc] initWithAcceptConfigCountCap:5 taskingHysteresisInterval:3600.0];
  v1 = (void *)_internalParameters_parameters;
  _internalParameters_parameters = (uint64_t)v0;
}

+ (id)_seedParameters
{
  if (_seedParameters_onceToken != -1) {
    dispatch_once(&_seedParameters_onceToken, &__block_literal_global_180);
  }
  v2 = (void *)_seedParameters_parameters;

  return v2;
}

void __47__DRSTaskingLimitingParameters__seedParameters__block_invoke()
{
  v0 = [[DRSTaskingLimitingParameters alloc] initWithAcceptConfigCountCap:2 taskingHysteresisInterval:3600.0];
  v1 = (void *)_seedParameters_parameters;
  _seedParameters_parameters = (uint64_t)v0;
}

+ (id)_customerParameters
{
  if (_customerParameters_onceToken != -1) {
    dispatch_once(&_customerParameters_onceToken, &__block_literal_global_182);
  }
  v2 = (void *)_customerParameters_parameters;

  return v2;
}

void __51__DRSTaskingLimitingParameters__customerParameters__block_invoke()
{
  v0 = [[DRSTaskingLimitingParameters alloc] initWithAcceptConfigCountCap:2 taskingHysteresisInterval:3600.0];
  v1 = (void *)_customerParameters_parameters;
  _customerParameters_parameters = (uint64_t)v0;
}

+ (id)parametersForPlatform:(unsigned __int8)a3 isInternal:(BOOL)a4 isSeed:(BOOL)a5 isCarrier:(BOOL)a6 taskingIsEnabled:(BOOL)a7
{
  if (a7 && a3 != 5 && a3 && !a6)
  {
    if (a4)
    {
      objc_super v7 = [a1 _internalParameters];
    }
    else
    {
      if (a5) {
        [a1 _seedParameters];
      }
      else {
      objc_super v7 = [a1 _customerParameters];
      }
    }
  }
  else
  {
    objc_super v7 = objc_msgSend(a1, "_disabledParameters", a3, a4, a5, a6);
  }

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (DRSTaskingLimitingParameters *)a3;
  v5 = v4;
  if (v4 == self)
  {
    BOOL v11 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
    [(DRSTaskingLimitingParameters *)v6 taskingHysteresisInterval];
    double v8 = v7;
    [(DRSTaskingLimitingParameters *)self taskingHysteresisInterval];
    if (v8 == v9)
    {
      uint64_t v10 = [(DRSTaskingLimitingParameters *)v6 acceptedConfigCountCap];
      BOOL v11 = v10 == [(DRSTaskingLimitingParameters *)self acceptedConfigCountCap];
    }
    else
    {
      BOOL v11 = 0;
    }
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (double)perTeamTaskingHysteresisInterval
{
  [(DRSTaskingLimitingParameters *)self taskingHysteresisInterval];
  return v2 * 5.0;
}

- (unint64_t)acceptedConfigCountCap
{
  return self->_acceptedConfigCountCap;
}

- (double)taskingHysteresisInterval
{
  return self->_taskingHysteresisInterval;
}

@end
@interface IKPlayerStateChangeEventUserInfo
+ (id)stateNameForState:(int64_t)a3;
+ (int64_t)stateForStateName:(id)a3;
- (IKPlayerStateChangeEventUserInfo)initWithState:(int64_t)a3;
- (IKPlayerStateChangeEventUserInfo)initWithState:(int64_t)a3 oldState:(int64_t)a4;
- (NSDictionary)properties;
- (double)duration;
- (double)elapsedTime;
- (double)rate;
- (id)objectForKeyedSubscript:(id)a3;
- (int64_t)oldState;
- (int64_t)state;
- (void)setDuration:(double)a3;
- (void)setElapsedTime:(double)a3;
- (void)setObject:(id)a3 forKeyedSubscript:(id)a4;
- (void)setRate:(double)a3;
@end

@implementation IKPlayerStateChangeEventUserInfo

- (IKPlayerStateChangeEventUserInfo)initWithState:(int64_t)a3
{
  v9.receiver = self;
  v9.super_class = (Class)IKPlayerStateChangeEventUserInfo;
  v4 = [(IKPlayerStateChangeEventUserInfo *)&v9 init];
  if (v4)
  {
    uint64_t v5 = [objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:3];
    mutableProperties = v4->_mutableProperties;
    v4->_mutableProperties = (NSMutableDictionary *)v5;

    v7 = [(id)objc_opt_class() stateNameForState:a3];
    if (v7) {
      [(NSMutableDictionary *)v4->_mutableProperties setObject:v7 forKey:@"state"];
    }
    v4->_state = a3;
  }
  return v4;
}

- (IKPlayerStateChangeEventUserInfo)initWithState:(int64_t)a3 oldState:(int64_t)a4
{
  uint64_t v5 = [(IKPlayerStateChangeEventUserInfo *)self initWithState:a3];
  if (v5)
  {
    v6 = [(id)objc_opt_class() stateNameForState:a4];
    if (v6) {
      [(NSMutableDictionary *)v5->_mutableProperties setObject:v6 forKey:@"oldState"];
    }
    v5->_oldState = a4;
  }
  return v5;
}

- (void)setDuration:(double)a3
{
  mutableProperties = self->_mutableProperties;
  id v4 = [NSNumber numberWithDouble:a3];
  [(NSMutableDictionary *)mutableProperties setObject:v4 forKey:@"duration"];
}

- (double)duration
{
  v2 = [(NSMutableDictionary *)self->_mutableProperties objectForKey:@"duration"];
  double v3 = 0.0;
  if (objc_opt_respondsToSelector())
  {
    [v2 doubleValue];
    double v3 = v4;
  }

  return v3;
}

- (void)setElapsedTime:(double)a3
{
  mutableProperties = self->_mutableProperties;
  id v4 = [NSNumber numberWithDouble:a3];
  [(NSMutableDictionary *)mutableProperties setObject:v4 forKey:@"elapsedTime"];
}

- (double)elapsedTime
{
  v2 = [(NSMutableDictionary *)self->_mutableProperties objectForKey:@"elapsedTime"];
  double v3 = 0.0;
  if (objc_opt_respondsToSelector())
  {
    [v2 doubleValue];
    double v3 = v4;
  }

  return v3;
}

- (double)rate
{
  v2 = [(NSMutableDictionary *)self->_mutableProperties objectForKey:@"rate"];
  double v3 = 1.0;
  if (objc_opt_respondsToSelector())
  {
    [v2 doubleValue];
    double v3 = v4;
  }

  return v3;
}

- (void)setRate:(double)a3
{
  mutableProperties = self->_mutableProperties;
  id v4 = [NSNumber numberWithDouble:a3];
  [(NSMutableDictionary *)mutableProperties setObject:v4 forKey:@"rate"];
}

- (id)objectForKeyedSubscript:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_mutableProperties objectForKey:a3];
}

- (void)setObject:(id)a3 forKeyedSubscript:(id)a4
{
  mutableProperties = self->_mutableProperties;
  if (a3) {
    [(NSMutableDictionary *)mutableProperties setObject:a3 forKey:a4];
  }
  else {
    [(NSMutableDictionary *)mutableProperties removeObjectForKey:a4];
  }
}

- (NSDictionary)properties
{
  v2 = (void *)[(NSMutableDictionary *)self->_mutableProperties copy];
  return (NSDictionary *)v2;
}

+ (id)stateNameForState:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 7) {
    return 0;
  }
  else {
    return off_1E6DE4808[a3 - 1];
  }
}

+ (int64_t)stateForStateName:(id)a3
{
  uint64_t v3 = stateForStateName__onceToken;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&stateForStateName__onceToken, &__block_literal_global_4);
  }
  uint64_t v5 = [(id)stateForStateName__statesByName objectForKeyedSubscript:v4];

  int64_t v6 = [v5 integerValue];
  return v6;
}

void __54__IKPlayerStateChangeEventUserInfo_stateForStateName___block_invoke()
{
  v0 = (void *)stateForStateName__statesByName;
  stateForStateName__statesByName = (uint64_t)&unk_1F3E3E028;
}

- (int64_t)state
{
  return self->_state;
}

- (int64_t)oldState
{
  return self->_oldState;
}

- (void).cxx_destruct
{
}

@end
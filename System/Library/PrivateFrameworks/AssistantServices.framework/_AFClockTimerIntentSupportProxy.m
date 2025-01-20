@interface _AFClockTimerIntentSupportProxy
- (NSDate)lastModifiedDate;
- (NSDictionary)siriContext;
- (NSString)description;
- (NSString)title;
- (NSUUID)timerID;
- (_AFClockTimerIntentSupportProxy)initWithTimerID:(id)a3 state:(unint64_t)a4 duration:(double)a5 remainingTime:(double)a6 lastModifiedDate:(id)a7 title:(id)a8 siriContext:(id)a9;
- (double)duration;
- (double)remainingTime;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (int64_t)type;
- (unint64_t)state;
- (void)setDuration:(double)a3;
- (void)setState:(unint64_t)a3;
@end

@implementation _AFClockTimerIntentSupportProxy

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_siriContext, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_lastModifiedDate, 0);
  objc_storeStrong((id *)&self->_timerID, 0);
}

- (NSDictionary)siriContext
{
  return self->_siriContext;
}

- (NSString)title
{
  return self->_title;
}

- (NSDate)lastModifiedDate
{
  return self->_lastModifiedDate;
}

- (double)remainingTime
{
  return self->_remainingTime;
}

- (double)duration
{
  return self->_duration;
}

- (unint64_t)state
{
  return self->_state;
}

- (NSUUID)timerID
{
  return self->_timerID;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  v4 = +[_AFClockTimerIntentSupportMutableProxy allocWithZone:a3];
  timerID = self->_timerID;
  unint64_t state = self->_state;
  double duration = self->_duration;
  double remainingTime = self->_remainingTime;
  lastModifiedDate = self->_lastModifiedDate;
  title = self->_title;
  siriContext = self->_siriContext;
  return [(_AFClockTimerIntentSupportProxy *)v4 initWithTimerID:timerID state:state duration:lastModifiedDate remainingTime:title lastModifiedDate:siriContext title:duration siriContext:remainingTime];
}

- (void)setDuration:(double)a3
{
  if (self->_state != 1)
  {
    v3 = AFSiriLogContextDaemon;
    if (!os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR)) {
      return;
    }
    int v5 = 136315138;
    v6 = "-[_AFClockTimerIntentSupportProxy setDuration:]";
    v4 = "%s Timer duration can only be modified while stopped.";
LABEL_9:
    _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, v4, (uint8_t *)&v5, 0xCu);
    return;
  }
  if (a3 > 0.0)
  {
    self->_double duration = a3;
    return;
  }
  v3 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
  {
    int v5 = 136315138;
    v6 = "-[_AFClockTimerIntentSupportProxy setDuration:]";
    v4 = "%s Timer duration must be positive.";
    goto LABEL_9;
  }
}

- (void)setState:(unint64_t)a3
{
  if (self->_state != a3)
  {
    if (a3 == 1) {
      self->_double remainingTime = self->_duration;
    }
    self->_unint64_t state = a3;
  }
}

- (NSString)description
{
  id v3 = objc_alloc((Class)NSString);
  v7.receiver = self;
  v7.super_class = (Class)_AFClockTimerIntentSupportProxy;
  v4 = [(_AFClockTimerIntentSupportProxy *)&v7 description];
  v5 = [v3 initWithFormat:@"%@ {timerID = %@, unint64_t state = %ld, duration = %f, remainingTime = %f, lastModifiedDate = %@, title = %@, siriContext = %@}", v4, self->_timerID, self->_state, *(void *)&self->_duration, *(void *)&self->_remainingTime, self->_lastModifiedDate, self->_title, self->_siriContext];

  return (NSString *)v5;
}

- (int64_t)type
{
  v2 = [(NSDictionary *)self->_siriContext objectForKeyedSubscript:SOMTTimerIntentSupportSiriContextTimerTypeKey];
  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    int64_t v3 = (int64_t)[v2 integerValue];
  }
  else {
    int64_t v3 = 1;
  }

  return v3;
}

- (_AFClockTimerIntentSupportProxy)initWithTimerID:(id)a3 state:(unint64_t)a4 duration:(double)a5 remainingTime:(double)a6 lastModifiedDate:(id)a7 title:(id)a8 siriContext:(id)a9
{
  id v17 = a3;
  id v18 = a7;
  id v19 = a8;
  id v20 = a9;
  v26.receiver = self;
  v26.super_class = (Class)_AFClockTimerIntentSupportProxy;
  v21 = [(_AFClockTimerIntentSupportProxy *)&v26 init];
  v22 = v21;
  if (v21)
  {
    objc_storeStrong((id *)&v21->_timerID, a3);
    v22->_unint64_t state = a4;
    v22->_double duration = a5;
    v22->_double remainingTime = a6;
    objc_storeStrong((id *)&v22->_lastModifiedDate, a7);
    v23 = (NSString *)[v19 copy];
    title = v22->_title;
    v22->_title = v23;

    objc_storeStrong((id *)&v22->_siriContext, a9);
  }

  return v22;
}

@end
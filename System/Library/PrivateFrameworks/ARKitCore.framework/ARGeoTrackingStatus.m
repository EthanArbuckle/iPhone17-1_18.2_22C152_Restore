@interface ARGeoTrackingStatus
+ (BOOL)supportsSecureCoding;
+ (id)initialStatus;
- (ARGeoTrackingAccuracy)accuracy;
- (ARGeoTrackingState)state;
- (ARGeoTrackingStateReason)stateReason;
- (ARGeoTrackingStatus)initWithCoder:(id)a3;
- (ARGeoTrackingStatus)initWithGeoTrackingState:(int64_t)a3 accuracy:(int64_t)a4 stateReason:(int64_t)a5 failureReasons:(int64_t)a6;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualPrivate:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)failureReasons;
- (void)encodeWithCoder:(id)a3;
- (void)setState:(int64_t)a3;
- (void)setStateReason:(int64_t)a3;
@end

@implementation ARGeoTrackingStatus

+ (id)initialStatus
{
  v2 = [[ARGeoTrackingStatus alloc] initWithGeoTrackingState:1 accuracy:0 stateReason:0 failureReasons:0];
  return v2;
}

- (ARGeoTrackingStatus)initWithGeoTrackingState:(int64_t)a3 accuracy:(int64_t)a4 stateReason:(int64_t)a5 failureReasons:(int64_t)a6
{
  v11.receiver = self;
  v11.super_class = (Class)ARGeoTrackingStatus;
  result = [(ARGeoTrackingStatus *)&v11 init];
  if (result)
  {
    result->_state = a3;
    result->_accuracy = a4;
    result->_stateReason = a5;
    result->_failureReasons = a6;
  }
  return result;
}

- (BOOL)isEqualPrivate:(id)a3
{
  id v4 = a3;
  if ([(ARGeoTrackingStatus *)self isEqual:v4])
  {
    id v5 = v4;
    int64_t v6 = [(ARGeoTrackingStatus *)self failureReasons];
    uint64_t v7 = [v5 failureReasons];

    BOOL v8 = v6 == v7;
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)[(id)objc_opt_class() allocWithZone:a3];
  if (result)
  {
    id v5 = result;
    int64_t v6 = objc_msgSend(v5, "initWithGeoTrackingState:accuracy:stateReason:failureReasons:", -[ARGeoTrackingStatus state](self, "state"), -[ARGeoTrackingStatus accuracy](self, "accuracy"), -[ARGeoTrackingStatus stateReason](self, "stateReason"), -[ARGeoTrackingStatus failureReasons](self, "failureReasons"));

    return v6;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (ARGeoTrackingStatus *)a3;
  id v5 = v4;
  if (!v4) {
    goto LABEL_7;
  }
  if (self == v4)
  {
    BOOL v10 = 1;
    goto LABEL_11;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int64_t v6 = v5;
    ARGeoTrackingState v7 = [(ARGeoTrackingStatus *)self state];
    if (v7 == [(ARGeoTrackingStatus *)v6 state]
      && (ARGeoTrackingAccuracy v8 = [(ARGeoTrackingStatus *)self accuracy], v8 == [(ARGeoTrackingStatus *)v6 accuracy]))
    {
      ARGeoTrackingStateReason v9 = [(ARGeoTrackingStatus *)self stateReason];
      BOOL v10 = v9 == [(ARGeoTrackingStatus *)v6 stateReason];
    }
    else
    {
      BOOL v10 = 0;
    }
  }
  else
  {
LABEL_7:
    BOOL v10 = 0;
  }
LABEL_11:

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ARGeoTrackingStatus)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeIntegerForKey:@"ARGeoTrackingStatus_state"];
  uint64_t v6 = [v4 decodeIntegerForKey:@"ARGeoTrackingStatus_accuracy"];
  uint64_t v7 = [v4 decodeIntegerForKey:@"ARGeoTrackingStatus_stateReason"];
  int v8 = [v4 decodeIntForKey:@"ARGeoTrackingStatus_failureReasons"];

  ARGeoTrackingStateReason v9 = [[ARGeoTrackingStatus alloc] initWithGeoTrackingState:v5 accuracy:v6 stateReason:v7 failureReasons:v8];
  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[ARGeoTrackingStatus state](self, "state"), @"ARGeoTrackingStatus_state");
  objc_msgSend(v4, "encodeInteger:forKey:", -[ARGeoTrackingStatus accuracy](self, "accuracy"), @"ARGeoTrackingStatus_accuracy");
  objc_msgSend(v4, "encodeInteger:forKey:", -[ARGeoTrackingStatus stateReason](self, "stateReason"), @"ARGeoTrackingStatus_stateReason");
  objc_msgSend(v4, "encodeInteger:forKey:", -[ARGeoTrackingStatus failureReasons](self, "failureReasons"), @"ARGeoTrackingStatus_failureReasons");
}

- (ARGeoTrackingState)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (ARGeoTrackingAccuracy)accuracy
{
  return self->_accuracy;
}

- (ARGeoTrackingStateReason)stateReason
{
  return self->_stateReason;
}

- (void)setStateReason:(int64_t)a3
{
  self->_stateReason = a3;
}

- (int64_t)failureReasons
{
  return self->_failureReasons;
}

@end
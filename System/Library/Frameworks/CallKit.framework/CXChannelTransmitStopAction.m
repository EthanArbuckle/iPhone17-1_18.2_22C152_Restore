@interface CXChannelTransmitStopAction
+ (BOOL)supportsSecureCoding;
- (CXChannelTransmitStopAction)initWithCoder:(id)a3;
- (NSDate)stopDate;
- (id)customDescription;
- (void)encodeWithCoder:(id)a3;
- (void)fulfill;
- (void)fulfillWithStopDate:(id)a3;
- (void)setStopDate:(id)a3;
- (void)updateAsFulfilledWithStopDate:(id)a3;
- (void)updateSanitizedCopy:(id)a3 withZone:(_NSZone *)a4;
@end

@implementation CXChannelTransmitStopAction

- (id)customDescription
{
  v7.receiver = self;
  v7.super_class = (Class)CXChannelTransmitStopAction;
  v3 = [(CXChannelAction *)&v7 customDescription];
  v4 = NSStringFromSelector(sel_stopDate);
  v5 = [(CXChannelTransmitStopAction *)self stopDate];
  [v3 appendFormat:@" %@=%@", v4, v5];

  return v3;
}

- (void)fulfill
{
  id v3 = [MEMORY[0x1E4F1C9C8] date];
  [(CXChannelTransmitStopAction *)self fulfillWithStopDate:v3];
}

- (void)fulfillWithStopDate:(id)a3
{
  id v6 = a3;
  if (!v6) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"%s: parameter '%@' cannot be nil", "-[CXChannelTransmitStopAction fulfillWithStopDate:]", @"stopDate" format];
  }
  v4 = (void *)[(CXChannelTransmitStopAction *)self copy];
  [v4 updateAsFulfilledWithStopDate:v6];
  v5 = [v4 delegate];
  [v5 actionCompleted:v4];
}

- (void)updateSanitizedCopy:(id)a3 withZone:(_NSZone *)a4
{
  v7.receiver = self;
  v7.super_class = (Class)CXChannelTransmitStopAction;
  id v6 = (id *)a3;
  [(CXChannelAction *)&v7 updateSanitizedCopy:v6 withZone:a4];
  objc_storeStrong(v6 + 8, self->_stopDate);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CXChannelTransmitStopAction)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CXChannelTransmitStopAction;
  v5 = [(CXChannelAction *)&v11 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    objc_super v7 = NSStringFromSelector(sel_stopDate);
    uint64_t v8 = [v4 decodeObjectOfClass:v6 forKey:v7];
    stopDate = v5->_stopDate;
    v5->_stopDate = (NSDate *)v8;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CXChannelTransmitStopAction;
  id v4 = a3;
  [(CXChannelAction *)&v7 encodeWithCoder:v4];
  v5 = [(CXChannelTransmitStopAction *)self stopDate];
  uint64_t v6 = NSStringFromSelector(sel_stopDate);
  [v4 encodeObject:v5 forKey:v6];
}

- (void)updateAsFulfilledWithStopDate:(id)a3
{
  id v4 = a3;
  [(CXAction *)self updateAsFulfilled];
  [(CXChannelTransmitStopAction *)self setStopDate:v4];
}

- (NSDate)stopDate
{
  return self->_stopDate;
}

- (void)setStopDate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
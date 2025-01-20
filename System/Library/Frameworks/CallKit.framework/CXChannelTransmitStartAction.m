@interface CXChannelTransmitStartAction
+ (BOOL)supportsSecureCoding;
- (CXChannelTransmitStartAction)initWithCoder:(id)a3;
- (NSDate)startDate;
- (id)customDescription;
- (void)encodeWithCoder:(id)a3;
- (void)fulfill;
- (void)fulfillWithStartDate:(id)a3;
- (void)setStartDate:(id)a3;
- (void)updateAsFulfilledWithStartDate:(id)a3;
- (void)updateSanitizedCopy:(id)a3 withZone:(_NSZone *)a4;
@end

@implementation CXChannelTransmitStartAction

- (id)customDescription
{
  v7.receiver = self;
  v7.super_class = (Class)CXChannelTransmitStartAction;
  v3 = [(CXChannelAction *)&v7 customDescription];
  v4 = NSStringFromSelector(sel_startDate);
  v5 = [(CXChannelTransmitStartAction *)self startDate];
  [v3 appendFormat:@" %@=%@", v4, v5];

  return v3;
}

- (void)fulfill
{
  id v3 = [MEMORY[0x1E4F1C9C8] date];
  [(CXChannelTransmitStartAction *)self fulfillWithStartDate:v3];
}

- (void)fulfillWithStartDate:(id)a3
{
  id v6 = a3;
  if (!v6) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"%s: parameter '%@' cannot be nil", "-[CXChannelTransmitStartAction fulfillWithStartDate:]", @"startDate" format];
  }
  v4 = (void *)[(CXChannelTransmitStartAction *)self copy];
  [v4 updateAsFulfilledWithStartDate:v6];
  v5 = [v4 delegate];
  [v5 actionCompleted:v4];
}

- (void)updateSanitizedCopy:(id)a3 withZone:(_NSZone *)a4
{
  v7.receiver = self;
  v7.super_class = (Class)CXChannelTransmitStartAction;
  id v6 = (id *)a3;
  [(CXChannelAction *)&v7 updateSanitizedCopy:v6 withZone:a4];
  objc_storeStrong(v6 + 8, self->_startDate);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CXChannelTransmitStartAction)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CXChannelTransmitStartAction;
  v5 = [(CXChannelAction *)&v11 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    objc_super v7 = NSStringFromSelector(sel_startDate);
    uint64_t v8 = [v4 decodeObjectOfClass:v6 forKey:v7];
    startDate = v5->_startDate;
    v5->_startDate = (NSDate *)v8;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CXChannelTransmitStartAction;
  id v4 = a3;
  [(CXChannelAction *)&v7 encodeWithCoder:v4];
  v5 = [(CXChannelTransmitStartAction *)self startDate];
  uint64_t v6 = NSStringFromSelector(sel_startDate);
  [v4 encodeObject:v5 forKey:v6];
}

- (void)updateAsFulfilledWithStartDate:(id)a3
{
  id v4 = a3;
  [(CXAction *)self updateAsFulfilled];
  [(CXChannelTransmitStartAction *)self setStartDate:v4];
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
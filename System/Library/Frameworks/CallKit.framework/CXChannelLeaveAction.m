@interface CXChannelLeaveAction
+ (BOOL)supportsSecureCoding;
- (CXChannelLeaveAction)initWithCoder:(id)a3;
- (NSDate)leaveDate;
- (id)customDescription;
- (void)encodeWithCoder:(id)a3;
- (void)fulfill;
- (void)fulfillWithLeaveDate:(id)a3;
- (void)setLeaveDate:(id)a3;
- (void)updateSanitizedCopy:(id)a3 withZone:(_NSZone *)a4;
@end

@implementation CXChannelLeaveAction

- (id)customDescription
{
  v7.receiver = self;
  v7.super_class = (Class)CXChannelLeaveAction;
  v3 = [(CXChannelAction *)&v7 customDescription];
  v4 = NSStringFromSelector(sel_leaveDate);
  v5 = [(CXChannelLeaveAction *)self leaveDate];
  [v3 appendFormat:@" %@=%@", v4, v5];

  return v3;
}

- (void)fulfill
{
  id v3 = [MEMORY[0x1E4F1C9C8] date];
  [(CXChannelLeaveAction *)self fulfillWithLeaveDate:v3];
}

- (void)fulfillWithLeaveDate:(id)a3
{
  id v6 = a3;
  if (!v6) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"%s: parameter '%@' cannot be nil", "-[CXChannelLeaveAction fulfillWithLeaveDate:]", @"leaveDate" format];
  }
  v4 = (void *)[(CXChannelLeaveAction *)self copy];
  [v4 setLeaveDate:v6];
  [v4 updateAsFulfilled];
  v5 = [v4 delegate];
  [v5 actionCompleted:v4];
}

- (void)updateSanitizedCopy:(id)a3 withZone:(_NSZone *)a4
{
  v7.receiver = self;
  v7.super_class = (Class)CXChannelLeaveAction;
  id v6 = (id *)a3;
  [(CXChannelAction *)&v7 updateSanitizedCopy:v6 withZone:a4];
  objc_storeStrong(v6 + 8, self->_leaveDate);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CXChannelLeaveAction)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CXChannelLeaveAction;
  v5 = [(CXChannelAction *)&v11 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    objc_super v7 = NSStringFromSelector(sel_leaveDate);
    uint64_t v8 = [v4 decodeObjectOfClass:v6 forKey:v7];
    leaveDate = v5->_leaveDate;
    v5->_leaveDate = (NSDate *)v8;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CXChannelLeaveAction;
  id v4 = a3;
  [(CXChannelAction *)&v7 encodeWithCoder:v4];
  v5 = [(CXChannelLeaveAction *)self leaveDate];
  uint64_t v6 = NSStringFromSelector(sel_leaveDate);
  [v4 encodeObject:v5 forKey:v6];
}

- (NSDate)leaveDate
{
  return self->_leaveDate;
}

- (void)setLeaveDate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
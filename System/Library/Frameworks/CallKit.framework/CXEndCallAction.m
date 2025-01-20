@interface CXEndCallAction
+ (BOOL)supportsSecureCoding;
- (CXEndCallAction)initWithCoder:(id)a3;
- (NSDate)dateEnded;
- (id)customDescription;
- (void)encodeWithCoder:(id)a3;
- (void)fulfill;
- (void)fulfillWithDateEnded:(NSDate *)dateEnded;
- (void)setDateEnded:(id)a3;
- (void)updateAsFulfilledWithDateEnded:(id)a3;
- (void)updateSanitizedCopy:(id)a3 withZone:(_NSZone *)a4;
@end

@implementation CXEndCallAction

- (id)customDescription
{
  v6.receiver = self;
  v6.super_class = (Class)CXEndCallAction;
  v3 = [(CXCallAction *)&v6 customDescription];
  v4 = [(CXEndCallAction *)self dateEnded];
  [v3 appendFormat:@" dateEnded=%@", v4];

  return v3;
}

- (void)fulfill
{
  id v3 = [MEMORY[0x1E4F1C9C8] date];
  [(CXEndCallAction *)self fulfillWithDateEnded:v3];
}

- (void)fulfillWithDateEnded:(NSDate *)dateEnded
{
  objc_super v6 = dateEnded;
  if (!v6) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"%s: parameter '%@' cannot be nil", "-[CXEndCallAction fulfillWithDateEnded:]", @"dateEnded" format];
  }
  v4 = (void *)[(CXEndCallAction *)self copy];
  [v4 updateAsFulfilledWithDateEnded:v6];
  v5 = [v4 delegate];
  [v5 actionCompleted:v4];
}

- (void)updateAsFulfilledWithDateEnded:(id)a3
{
  id v4 = a3;
  [(CXAction *)self updateAsFulfilled];
  [(CXEndCallAction *)self setDateEnded:v4];
}

- (void)updateSanitizedCopy:(id)a3 withZone:(_NSZone *)a4
{
  v8.receiver = self;
  v8.super_class = (Class)CXEndCallAction;
  id v6 = a3;
  [(CXCallAction *)&v8 updateSanitizedCopy:v6 withZone:a4];
  v7 = [(CXEndCallAction *)self dateEnded];
  [v6 setDateEnded:v7];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CXEndCallAction)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CXEndCallAction;
  v5 = [(CXCallAction *)&v11 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    v7 = NSStringFromSelector(sel_dateEnded);
    uint64_t v8 = [v4 decodeObjectOfClass:v6 forKey:v7];
    dateEnded = v5->_dateEnded;
    v5->_dateEnded = (NSDate *)v8;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CXEndCallAction;
  id v4 = a3;
  [(CXCallAction *)&v7 encodeWithCoder:v4];
  v5 = [(CXEndCallAction *)self dateEnded];
  uint64_t v6 = NSStringFromSelector(sel_dateEnded);
  [v4 encodeObject:v5 forKey:v6];
}

- (NSDate)dateEnded
{
  return self->_dateEnded;
}

- (void)setDateEnded:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
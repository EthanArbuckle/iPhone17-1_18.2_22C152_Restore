@interface IDSActivityDescription
+ (BOOL)supportsSecureCoding;
- (IDSActivityDescription)initWithCoder:(id)a3;
- (NSString)activity;
- (NSString)subActivity;
- (double)timeSubscribed;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setActivity:(id)a3;
- (void)setSubActivity:(id)a3;
- (void)setTimeSubscribed:(double)a3;
@end

@implementation IDSActivityDescription

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  double timeSubscribed = self->_timeSubscribed;
  id v5 = a3;
  [v5 encodeDouble:@"time" forKey:timeSubscribed];
  [v5 encodeObject:self->_activity forKey:@"activity"];
  [v5 encodeObject:self->_subActivity forKey:@"subactivity"];
}

- (IDSActivityDescription)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)IDSActivityDescription;
  id v5 = [(IDSActivityDescription *)&v12 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"activity"];
    activity = v5->_activity;
    v5->_activity = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"subactivity"];
    subActivity = v5->_subActivity;
    v5->_subActivity = (NSString *)v8;

    [v4 decodeDoubleForKey:@"time"];
    v5->_double timeSubscribed = v10;
  }

  return v5;
}

- (id)description
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"<%@: %p; timeSubscribed: %fL; activity: %@; subActivity: %@>",
           objc_opt_class(),
           self,
           *(void *)&self->_timeSubscribed,
           self->_activity,
           self->_subActivity);
}

- (double)timeSubscribed
{
  return self->_timeSubscribed;
}

- (void)setTimeSubscribed:(double)a3
{
  self->_double timeSubscribed = a3;
}

- (NSString)activity
{
  return self->_activity;
}

- (void)setActivity:(id)a3
{
}

- (NSString)subActivity
{
  return self->_subActivity;
}

- (void)setSubActivity:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subActivity, 0);

  objc_storeStrong((id *)&self->_activity, 0);
}

@end
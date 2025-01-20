@interface AMSDRefreshMultiUserOptions
- (AMSDRefreshMultiUserOptions)initWithReason:(id)a3;
- (BOOL)ignoreThrottling;
- (BOOL)shouldUseCloudData;
- (NSString)hashedDescription;
- (NSString)reasonDescription;
- (double)schedulingInterval;
- (double)throttlingInterval;
- (id)_stringForRefreshType:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)reasonType;
- (void)setIgnoreThrottling:(BOOL)a3;
- (void)setReasonDescription:(id)a3;
- (void)setReasonType:(unint64_t)a3;
- (void)setSchedulingInterval:(double)a3;
- (void)setShouldUseCloudData:(BOOL)a3;
- (void)setThrottlingInterval:(double)a3;
@end

@implementation AMSDRefreshMultiUserOptions

- (AMSDRefreshMultiUserOptions)initWithReason:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)AMSDRefreshMultiUserOptions;
  v5 = [(AMSDRefreshMultiUserOptions *)&v10 init];
  v6 = v5;
  if (v5)
  {
    v5->_ignoreThrottling = 0;
    v7 = (NSString *)[v4 copy];
    reasonDescription = v6->_reasonDescription;
    v6->_reasonDescription = v7;

    v6->_shouldUseCloudData = 1;
    v6->_schedulingInterval = 0.0;
    v6->_throttlingInterval = 0.0;
    v6->_reasonType = 2;
  }

  return v6;
}

- (NSString)hashedDescription
{
  v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  v5 = +[NSMutableString stringWithFormat:@"<%@: %p> {", v4, self];

  if ([(AMSDRefreshMultiUserOptions *)self ignoreThrottling]) {
    CFStringRef v6 = @"true";
  }
  else {
    CFStringRef v6 = @"false";
  }
  [v5 appendFormat:@"\n  ignoreThrottling = %@", v6];
  uint64_t v7 = [(AMSDRefreshMultiUserOptions *)self reasonDescription];
  v8 = (void *)v7;
  CFStringRef v9 = @"(null)";
  if (v7) {
    CFStringRef v9 = (const __CFString *)v7;
  }
  [v5 appendFormat:@"\n  reason = %@", v9];

  objc_super v10 = [(AMSDRefreshMultiUserOptions *)self _stringForRefreshType:[(AMSDRefreshMultiUserOptions *)self reasonType]];
  [v5 appendFormat:@"\n  refreshType = %@", v10];

  [(AMSDRefreshMultiUserOptions *)self schedulingInterval];
  objc_msgSend(v5, "appendFormat:", @"\n  schedulingInterval = %f", v11);
  if ([(AMSDRefreshMultiUserOptions *)self shouldUseCloudData]) {
    CFStringRef v12 = @"true";
  }
  else {
    CFStringRef v12 = @"false";
  }
  [v5 appendFormat:@"\n  shouldUseCloudData = %@", v12];
  [(AMSDRefreshMultiUserOptions *)self throttlingInterval];
  objc_msgSend(v5, "appendFormat:", @"\n  throttlingInterval = %f", v13);
  [v5 appendString:@"\n}"];
  return (NSString *)v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v5, "setIgnoreThrottling:", -[AMSDRefreshMultiUserOptions ignoreThrottling](self, "ignoreThrottling"));
  CFStringRef v6 = [(AMSDRefreshMultiUserOptions *)self reasonDescription];
  id v7 = [v6 copyWithZone:a3];
  [v5 setReasonDescription:v7];

  objc_msgSend(v5, "setReasonType:", -[AMSDRefreshMultiUserOptions reasonType](self, "reasonType"));
  [(AMSDRefreshMultiUserOptions *)self schedulingInterval];
  objc_msgSend(v5, "setSchedulingInterval:");
  objc_msgSend(v5, "setShouldUseCloudData:", -[AMSDRefreshMultiUserOptions shouldUseCloudData](self, "shouldUseCloudData"));
  [(AMSDRefreshMultiUserOptions *)self throttlingInterval];
  objc_msgSend(v5, "setThrottlingInterval:");
  return v5;
}

- (id)_stringForRefreshType:(unint64_t)a3
{
  if (a3 > 2) {
    return @"Reason unknown";
  }
  else {
    return off_1001141C0[a3];
  }
}

- (BOOL)ignoreThrottling
{
  return self->_ignoreThrottling;
}

- (void)setIgnoreThrottling:(BOOL)a3
{
  self->_ignoreThrottling = a3;
}

- (NSString)reasonDescription
{
  return self->_reasonDescription;
}

- (void)setReasonDescription:(id)a3
{
}

- (unint64_t)reasonType
{
  return self->_reasonType;
}

- (void)setReasonType:(unint64_t)a3
{
  self->_reasonType = a3;
}

- (double)schedulingInterval
{
  return self->_schedulingInterval;
}

- (void)setSchedulingInterval:(double)a3
{
  self->_schedulingInterval = a3;
}

- (BOOL)shouldUseCloudData
{
  return self->_shouldUseCloudData;
}

- (void)setShouldUseCloudData:(BOOL)a3
{
  self->_shouldUseCloudData = a3;
}

- (double)throttlingInterval
{
  return self->_throttlingInterval;
}

- (void)setThrottlingInterval:(double)a3
{
  self->_throttlingInterval = a3;
}

- (void).cxx_destruct
{
}

@end
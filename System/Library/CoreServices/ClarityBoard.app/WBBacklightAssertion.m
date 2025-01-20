@interface WBBacklightAssertion
- (BOOL)acquire;
- (BOOL)isAcquired;
- (BOOL)relinquish;
- (NSString)description;
- (NSString)name;
- (WBBacklightAssertion)initWithFactor:(unint64_t)a3 name:(id)a4;
- (unint64_t)factor;
- (void)invalidate;
@end

@implementation WBBacklightAssertion

- (WBBacklightAssertion)initWithFactor:(unint64_t)a3 name:(id)a4
{
  id v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)WBBacklightAssertion;
  v7 = [(WBBacklightAssertion *)&v11 init];
  if (v7)
  {
    v8 = (NSString *)[v6 copy];
    name = v7->_name;
    v7->_name = v8;

    v7->_factor = a3;
  }

  return v7;
}

- (BOOL)acquire
{
  BOOL acquired = self->_acquired;
  if (!self->_acquired)
  {
    self->_BOOL acquired = 1;
    v4 = +[WBBacklightController sharedInstance];
    [v4 _addAssertion:self];
  }
  return !acquired;
}

- (BOOL)relinquish
{
  BOOL acquired = self->_acquired;
  if (self->_acquired)
  {
    self->_BOOL acquired = 0;
    v4 = +[WBBacklightController sharedInstance];
    [v4 _removeAssertion:self];
  }
  return acquired;
}

- (void)invalidate
{
}

- (NSString)description
{
  if (self->_acquired) {
    CFStringRef v2 = @"%@ - %ld";
  }
  else {
    CFStringRef v2 = @"%@ - [%ld](relinquished)";
  }
  v3 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v2, self->_name, self->_factor);

  return (NSString *)v3;
}

- (NSString)name
{
  return self->_name;
}

- (unint64_t)factor
{
  return self->_factor;
}

- (BOOL)isAcquired
{
  return self->_acquired;
}

- (void).cxx_destruct
{
}

@end
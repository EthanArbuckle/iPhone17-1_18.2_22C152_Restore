@interface IRServiceLogPrefix
- (IRServiceLogPrefix)init;
- (NSString)prefix;
- (id)description;
- (void)setPrefix:(id)a3;
@end

@implementation IRServiceLogPrefix

- (IRServiceLogPrefix)init
{
  v6.receiver = self;
  v6.super_class = (Class)IRServiceLogPrefix;
  v2 = [(IRServiceLogPrefix *)&v6 init];
  v3 = v2;
  if (v2)
  {
    prefix = v2->_prefix;
    v2->_prefix = (NSString *)&stru_27039A840;
  }
  return v3;
}

- (id)description
{
  return self->_prefix;
}

- (NSString)prefix
{
  return self->_prefix;
}

- (void)setPrefix:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
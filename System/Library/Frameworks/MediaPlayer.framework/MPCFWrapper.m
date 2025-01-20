@interface MPCFWrapper
- (BOOL)isNullRef;
- (MPCFWrapper)initWithCFType:(void *)a3;
- (id)description;
- (void)dealloc;
- (void)refValue;
- (void)setNullRef:(BOOL)a3;
@end

@implementation MPCFWrapper

- (void)refValue
{
  return self->_refValue;
}

- (MPCFWrapper)initWithCFType:(void *)a3
{
  v3 = (MPCFWrapper *)a3;
  if (a3)
  {
    v6.receiver = self;
    v6.super_class = (Class)MPCFWrapper;
    v4 = [(MPCFWrapper *)&v6 init];
    if (v4)
    {
      CFRetain(v3);
      v4->_refValue = v3;
    }
    self = v4;
    v3 = self;
  }
  else
  {
    self->_nullRef = 1;
  }

  return v3;
}

- (void)setNullRef:(BOOL)a3
{
  self->_nullRef = a3;
}

- (BOOL)isNullRef
{
  return self->_nullRef;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@:%p %@>", objc_opt_class(), self, self->_refValue];
}

- (void)dealloc
{
  if (!self->_nullRef) {
    CFRelease(self->_refValue);
  }
  v3.receiver = self;
  v3.super_class = (Class)MPCFWrapper;
  [(MPCFWrapper *)&v3 dealloc];
}

@end
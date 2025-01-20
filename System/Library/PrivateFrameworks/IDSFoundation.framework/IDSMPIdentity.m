@interface IDSMPIdentity
- (IDSMPIdentity)initWithBackingValue:(void *)a3;
- (id)description;
- (void)backingValue;
- (void)dealloc;
@end

@implementation IDSMPIdentity

- (IDSMPIdentity)initWithBackingValue:(void *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)IDSMPIdentity;
  v4 = [(IDSMPIdentity *)&v6 init];
  if (v4) {
    v4->_backingValue = (void *)CFRetain(a3);
  }
  return v4;
}

- (void)dealloc
{
  backingValue = self->_backingValue;
  if (backingValue) {
    CFRelease(backingValue);
  }
  v4.receiver = self;
  v4.super_class = (Class)IDSMPIdentity;
  [(IDSMPIdentity *)&v4 dealloc];
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  uint64_t v8 = objc_msgSend_backingValue(self, v5, v6, v7);
  return (id)objc_msgSend_stringWithFormat_(v3, v9, @"<%@ %p backingValue: %@>", v10, v4, self, v8);
}

- (void)backingValue
{
  return self->_backingValue;
}

@end
@interface _SYObjectCompatibilityWrapper
- (NSString)objectIdentifier;
- (NSString)sequencer;
- (_SYObjectCompatibilityWrapper)initWithSYObject:(id)a3 changeType:(int64_t)a4;
- (id)methodSignatureForSelector:(SEL)a3;
- (int64_t)changeType;
- (void)forwardInvocation:(id)a3;
@end

@implementation _SYObjectCompatibilityWrapper

- (_SYObjectCompatibilityWrapper)initWithSYObject:(id)a3 changeType:(int64_t)a4
{
  id v7 = a3;
  if (v7)
  {
    objc_storeStrong((id *)&self->_syObject, a3);
    self->_type = a4;
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (NSString)objectIdentifier
{
  return (NSString *)[(SYObject *)self->_syObject syncId];
}

- (NSString)sequencer
{
  return 0;
}

- (int64_t)changeType
{
  return self->_type;
}

- (id)methodSignatureForSelector:(SEL)a3
{
  v4 = (objc_class *)objc_opt_class();
  InstanceMethod = class_getInstanceMethod(v4, a3);
  if (InstanceMethod
    || (v6 = (objc_class *)objc_opt_class(), (InstanceMethod = class_getInstanceMethod(v6, a3)) != 0))
  {
    InstanceMethod = [MEMORY[0x263EFF970] signatureWithObjCTypes:method_getTypeEncoding(InstanceMethod)];
  }
  return InstanceMethod;
}

- (void)forwardInvocation:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
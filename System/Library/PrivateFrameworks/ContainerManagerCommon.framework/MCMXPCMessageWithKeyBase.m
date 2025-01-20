@interface MCMXPCMessageWithKeyBase
- (MCMXPCMessageWithKeyBase)initWithXPCObject:(id)a3 context:(id)a4 error:(unint64_t *)a5;
- (NSString)key;
@end

@implementation MCMXPCMessageWithKeyBase

- (void).cxx_destruct
{
  p_key = &self->_key;

  objc_storeStrong((id *)p_key, 0);
}

- (NSString)key
{
  return self->_key;
}

- (MCMXPCMessageWithKeyBase)initWithXPCObject:(id)a3 context:(id)a4 error:(unint64_t *)a5
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  v14.receiver = self;
  v14.super_class = (Class)MCMXPCMessageWithKeyBase;
  v9 = [(MCMXPCMessageWithConcreteContainerBase *)&v14 initWithXPCObject:v8 context:a4 error:a5];
  v10 = v9;
  if (v9)
  {
    uint64_t v11 = [(MCMXPCMessageBase *)v9 nsStringValueFromXPCObject:v8 key:"Key"];
    key = v10->_key;
    v10->_key = (NSString *)v11;
  }
  return v10;
}

@end
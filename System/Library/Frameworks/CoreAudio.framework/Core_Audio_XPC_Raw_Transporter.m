@interface Core_Audio_XPC_Raw_Transporter
+ (BOOL)supportsSecureCoding;
+ (id)object:(id)a3;
- (Core_Audio_XPC_Raw_Transporter)initWithCoder:(id)a3;
- (Core_Audio_XPC_Raw_Transporter)initWithObject:(id)a3;
- (OS_xpc_object)object;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setObject:(id)a3;
@end

@implementation Core_Audio_XPC_Raw_Transporter

- (void).cxx_destruct
{
}

- (void)setObject:(id)a3
{
}

- (OS_xpc_object)object
{
  return self->_object;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    [MEMORY[0x1E4F1C9F8] raise:*MEMORY[0x1E4F1C3C0] format:@"This object may only be decoded by an NSXPCCoder."];
  }
  id v7 = v4;
  v5 = [(Core_Audio_XPC_Raw_Transporter *)self object];

  if (v5)
  {
    v6 = [(Core_Audio_XPC_Raw_Transporter *)self object];
  }
  else
  {
    v6 = xpc_null_create();
  }
  [v7 encodeXPCObject:v6 forKey:@"Core_Audio_XPC_Raw_Transporter"];
}

- (void)dealloc
{
  object = self->_object;
  self->_object = 0;

  v4.receiver = self;
  v4.super_class = (Class)Core_Audio_XPC_Raw_Transporter;
  [(Core_Audio_XPC_Raw_Transporter *)&v4 dealloc];
}

- (Core_Audio_XPC_Raw_Transporter)initWithCoder:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    [MEMORY[0x1E4F1C9F8] raise:*MEMORY[0x1E4F1C3C0] format:@"This object may only be decoded by an NSXPCCoder."];
  }
  v12.receiver = self;
  v12.super_class = (Class)Core_Audio_XPC_Raw_Transporter;
  v5 = [(Core_Audio_XPC_Raw_Transporter *)&v12 init];
  if (v5)
  {
    id v6 = v4;
    uint64_t v7 = [v6 decodeXPCObjectForKey:@"Core_Audio_XPC_Raw_Transporter"];
    object = v5->_object;
    v5->_object = (OS_xpc_object *)v7;

    if (!v5->_object)
    {

      v10 = 0;
      goto LABEL_10;
    }
    if (MEMORY[0x1C185AAD0]() == MEMORY[0x1E4F145D8])
    {
      v9 = v5->_object;
      v5->_object = 0;
    }
  }
  v10 = v5;
LABEL_10:

  return v10;
}

- (Core_Audio_XPC_Raw_Transporter)initWithObject:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)Core_Audio_XPC_Raw_Transporter;
  id v6 = [(Core_Audio_XPC_Raw_Transporter *)&v9 init];
  uint64_t v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_object, a3);
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)object:(id)a3
{
  id v3 = a3;
  id v4 = [[Core_Audio_XPC_Raw_Transporter alloc] initWithObject:v3];

  return v4;
}

@end
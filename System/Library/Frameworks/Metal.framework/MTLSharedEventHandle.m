@interface MTLSharedEventHandle
+ (BOOL)supportsSecureCoding;
- (MTLSharedEventHandle)initWithCoder:(id)a3;
- (MTLSharedEventHandle)initWithSharedEvent:(id)a3;
- (NSString)label;
- (unint64_t)labelTraceID;
- (unsigned)eventPort;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MTLSharedEventHandle

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unsigned)eventPort
{
  return *(_DWORD *)self->_priv;
}

- (NSString)label
{
  return (NSString *)*((void *)self->_priv + 1);
}

- (unint64_t)labelTraceID
{
  return *((void *)self->_priv + 2);
}

- (MTLSharedEventHandle)initWithSharedEvent:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)MTLSharedEventHandle;
  v4 = [(MTLSharedEventHandle *)&v7 init];
  if (v4)
  {
    v4->_priv = (MTLSharedEventHandlePrivate *)malloc_type_calloc(0x18uLL, 1uLL, 0x19336689uLL);
    mach_port_name_t v5 = [a3 eventPort];
    *(_DWORD *)v4->_priv = v5;
    if (mach_port_mod_refs(*MEMORY[0x1E4F14960], v5, 0, 1))
    {
      *(_DWORD *)v4->_priv = 0;

      return 0;
    }
    else
    {
      *((void *)v4->_priv + 1) = objc_msgSend((id)objc_msgSend(a3, "label"), "copy");
      *((void *)v4->_priv + 2) = [a3 labelTraceID];
    }
  }
  return v4;
}

- (void)dealloc
{
  priv = self->_priv;
  if (priv)
  {
    if (*(_DWORD *)priv)
    {
      mach_port_mod_refs(*MEMORY[0x1E4F14960], *(_DWORD *)priv, 0, -1);
      priv = self->_priv;
    }

    free(self->_priv);
  }
  v4.receiver = self;
  v4.super_class = (Class)MTLSharedEventHandle;
  [(MTLSharedEventHandle *)&v4 dealloc];
}

- (void)encodeWithCoder:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"This object may only be encoded by an NSXPCCoder."];
  }
  mach_port_name_t v5 = (void *)xpc_mach_send_create();
  [a3 encodeXPCObject:v5 forKey:@"Port"];
  xpc_release(v5);
  uint64_t v6 = *((void *)self->_priv + 1);

  [a3 encodeObject:v6 forKey:@"Label"];
}

- (MTLSharedEventHandle)initWithCoder:(id)a3
{
  objc_super v4 = self;
  self->_priv = (MTLSharedEventHandlePrivate *)malloc_type_calloc(0x18uLL, 1uLL, 0x1ACCD444uLL);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"This object may only be decoded by an NSXPCCoder."];
  }
  if ([a3 decodeXPCObjectOfType:MEMORY[0x1E4F145C8] forKey:@"Port"]
    && (int v5 = xpc_mach_send_copy_right()) != 0)
  {
    *(_DWORD *)v4->_priv = v5;
    *((void *)v4->_priv + 1) = (id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"Label"];
  }
  else
  {

    return 0;
  }
  return v4;
}

@end
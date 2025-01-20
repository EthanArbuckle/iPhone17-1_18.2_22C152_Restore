@interface REResourceClientPorts
+ (BOOL)supportsSecureCoding;
- (REResourceClientPorts)init;
- (REResourceClientPorts)initWithCoder:(id)a3;
- (id)description;
- (unsigned)taskIdentifierToken;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation REResourceClientPorts

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (REResourceClientPorts)init
{
  v8.receiver = self;
  v8.super_class = (Class)REResourceClientPorts;
  v2 = [(REResourceClientPorts *)&v8 init];
  v3 = v2;
  if (!v2) {
    return v3;
  }
  v2->_taskIdentifierToken = 0;
  if (!task_create_identity_token(*MEMORY[0x263EF8960], &v2->_taskIdentifierToken)) {
    return v3;
  }
  v5 = (REResourceClientPorts *)abort_report_np();
  return [(REResourceClientPorts *)v5 initWithCoder:v7];
}

- (REResourceClientPorts)initWithCoder:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v10.receiver = self;
    v10.super_class = (Class)REResourceClientPorts;
    v5 = [(REResourceClientPorts *)&v10 init];
    if (v5)
    {
      SEL v6 = [v4 decodeXPCObjectOfType:MEMORY[0x263EF8748] forKey:@"taskIDToken"];
      v5->_taskIdentifierToken = xpc_mach_send_copy_right();
    }
    return v5;
  }
  else
  {
    objc_super v8 = (REResourceClientPorts *)abort_report_np();
    [(REResourceClientPorts *)v8 dealloc];
  }
  return result;
}

- (void)dealloc
{
  mach_port_name_t taskIdentifierToken = self->_taskIdentifierToken;
  if (taskIdentifierToken + 1 >= 2) {
    mach_port_deallocate(*MEMORY[0x263EF8960], taskIdentifierToken);
  }
  v4.receiver = self;
  v4.super_class = (Class)REResourceClientPorts;
  [(REResourceClientPorts *)&v4 dealloc];
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v3 = (void *)xpc_mach_send_create();
    [v6 encodeXPCObject:v3 forKey:@"taskIDToken"];
  }
  else
  {
    objc_super v4 = (REResourceClientPorts *)abort_report_np();
    [(REResourceClientPorts *)v4 description];
  }
}

- (id)description
{
  v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)REResourceClientPorts;
  objc_super v4 = [(REResourceClientPorts *)&v7 description];
  SEL v5 = [v3 stringWithFormat:@"%@(taskIdentifierToken:%d)", v4, self->_taskIdentifierToken];

  return v5;
}

- (unsigned)taskIdentifierToken
{
  return self->_taskIdentifierToken;
}

@end
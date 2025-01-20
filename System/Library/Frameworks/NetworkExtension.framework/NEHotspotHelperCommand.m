@interface NEHotspotHelperCommand
- (NEHotspotHelperCommandType)commandType;
- (NEHotspotHelperResponse)createResponse:(NEHotspotHelperResult)result;
- (NEHotspotNetwork)network;
- (NSArray)networkList;
- (NWTCPConnection)createTCPConnection:(NWEndpoint *)endpoint;
- (NWUDPSession)createUDPSession:(NWEndpoint *)endpoint;
- (OS_nw_interface)interface;
- (id)description;
- (id)interfaceName;
- (void)dealloc;
@end

@implementation NEHotspotHelperCommand

- (NWUDPSession)createUDPSession:(NWEndpoint *)endpoint
{
  v4 = (objc_class *)MEMORY[0x1E4F38BF8];
  v5 = endpoint;
  id v6 = [v4 alloc];
  v7 = -[NEHotspotHelperCommand interfaceName](self);
  v8 = (void *)[v6 initWithInterfaceName:v7];

  id v9 = objc_alloc_init(MEMORY[0x1E4F38C10]);
  [v9 setRequiredInterface:v8];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F38C48]) initWithEndpoint:v5 parameters:v9];

  return (NWUDPSession *)v10;
}

- (id)interfaceName
{
  if (a1)
  {
    a1 = CNPluginCommandGetInterfaceName();
    uint64_t v1 = vars8;
  }
  return a1;
}

- (NWTCPConnection)createTCPConnection:(NWEndpoint *)endpoint
{
  v4 = (objc_class *)MEMORY[0x1E4F38BF8];
  v5 = endpoint;
  id v6 = [v4 alloc];
  v7 = -[NEHotspotHelperCommand interfaceName](self);
  v8 = (void *)[v6 initWithInterfaceName:v7];

  id v9 = objc_alloc_init(MEMORY[0x1E4F38C10]);
  [v9 setRequiredInterface:v8];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F38C40]) initWithEndpoint:v5 parameters:v9];

  return (NWTCPConnection *)v10;
}

- (OS_nw_interface)interface
{
  v2 = -[NEHotspotHelperCommand interfaceName](self);
  [v2 UTF8String];
  v3 = (void *)nw_interface_create_with_name();

  return (OS_nw_interface *)v3;
}

- (NEHotspotHelperResponse)createResponse:(NEHotspotHelperResult)result
{
  if (self && self->_command && (uint64_t v3 = CNPluginResponseCreate()) != 0)
  {
    v4 = (__CNPluginCommand *)v3;
    v5 = [NEHotspotHelperResponse alloc];
    if (v5)
    {
      v9.receiver = v5;
      v9.super_class = (Class)NEHotspotHelperResponse;
      id v6 = [(NEHotspotHelperCommand *)&v9 init];
      if (v6)
      {
        CFRetain(v4);
        command = v6->_command;
        if (command) {
          CFRelease(command);
        }
        v6->_command = v4;
      }
    }
    else
    {
      id v6 = 0;
    }
    CFRelease(v4);
  }
  else
  {
    id v6 = 0;
  }

  return (NEHotspotHelperResponse *)v6;
}

- (NSArray)networkList
{
  if (self && self->_command && (CFArrayRef v2 = (const __CFArray *)CNPluginCommandCopyNetworkList()) != 0)
  {
    CFArrayRef v3 = v2;
    v4 = createHotspotNetworkArray(v2);
    CFRelease(v3);
  }
  else
  {
    v4 = 0;
  }

  return (NSArray *)v4;
}

- (NEHotspotNetwork)network
{
  if (self && self->_command && (CFArrayRef v2 = (const void *)CNPluginCommandCopyCurrentNetwork()) != 0)
  {
    CFArrayRef v3 = v2;
    id v4 = -[NEHotspotNetwork initWithNetwork:]([NEHotspotNetwork alloc], v2);
    CFRelease(v3);
  }
  else
  {
    id v4 = 0;
  }

  return (NEHotspotNetwork *)v4;
}

- (NEHotspotHelperCommandType)commandType
{
  return (unint64_t)CNPluginCommandGetType();
}

- (void)dealloc
{
  if (self)
  {
    command = self->_command;
    if (command) {
      CFRelease(command);
    }
    self->_command = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)NEHotspotHelperCommand;
  [(NEHotspotHelperCommand *)&v4 dealloc];
}

- (id)description
{
  if (self) {
    self = (NEHotspotHelperCommand *)self->_command;
  }
  CFArrayRef v2 = (__CFString *)CFCopyDescription(self);

  return v2;
}

@end
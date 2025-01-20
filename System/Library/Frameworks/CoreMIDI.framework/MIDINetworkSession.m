@interface MIDINetworkSession
+ (MIDINetworkSession)defaultSession;
- (BOOL)addConnection:(MIDINetworkConnection *)connection;
- (BOOL)addContact:(MIDINetworkHost *)contact;
- (BOOL)addOrRemoveConnection:(id)a3 add:(BOOL)a4;
- (BOOL)isEnabled;
- (BOOL)removeConnection:(MIDINetworkConnection *)connection;
- (BOOL)removeContact:(MIDINetworkHost *)contact;
- (MIDIEndpointRef)destinationEndpoint;
- (MIDIEndpointRef)sourceEndpoint;
- (MIDINetworkConnectionPolicy)connectionPolicy;
- (MIDINetworkSession)init;
- (NSSet)connections;
- (NSSet)contacts;
- (NSString)localName;
- (NSString)networkName;
- (NSUInteger)networkPort;
- (void)contactsChanged;
- (void)dealloc;
- (void)refreshBonjourName;
- (void)sessionChanged;
- (void)setConnectionPolicy:(MIDINetworkConnectionPolicy)connectionPolicy;
- (void)setEnabled:(BOOL)enabled;
- (void)setStateToEntity;
- (void)updateFromEntity;
@end

@implementation MIDINetworkSession

- (MIDIEndpointRef)destinationEndpoint
{
  return *((_DWORD *)self->_imp + 2);
}

- (MIDIEndpointRef)sourceEndpoint
{
  return *((_DWORD *)self->_imp + 1);
}

- (void)contactsChanged
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 postNotificationName:@"MIDINetworkNotificationContactsDidChange" object:self];
}

- (void)sessionChanged
{
  [(MIDINetworkSession *)self updateFromEntity];
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 postNotificationName:@"MIDINetworkNotificationSessionDidChange" object:self];
}

- (BOOL)removeContact:(MIDINetworkHost *)contact
{
  id v3 = contact;
  char v4 = globals;
  if (globals)
  {
    uint64_t v8 = globals;
    char v4 = (*(uint64_t (**)(uint64_t))(*(void *)globals + 16))(globals);
    v5 = (MNSGlobalState *)globals;
  }
  else
  {
    v5 = 0;
    uint64_t v8 = 0;
  }
  char v9 = v4;
  BOOL v6 = MNSGlobalState::AddOrRemoveContact(v5, (objc_object *)v3, 0);
  CADeprecated::CAMutex::Locker::~Locker((CADeprecated::CAMutex::Locker *)&v8);

  return v6;
}

- (BOOL)addContact:(MIDINetworkHost *)contact
{
  id v3 = contact;
  char v4 = globals;
  if (globals)
  {
    uint64_t v8 = globals;
    char v4 = (*(uint64_t (**)(uint64_t))(*(void *)globals + 16))(globals);
    v5 = (MNSGlobalState *)globals;
  }
  else
  {
    v5 = 0;
    uint64_t v8 = 0;
  }
  char v9 = v4;
  BOOL v6 = MNSGlobalState::AddOrRemoveContact(v5, (objc_object *)v3, 1);
  CADeprecated::CAMutex::Locker::~Locker((CADeprecated::CAMutex::Locker *)&v8);

  return v6;
}

- (NSSet)contacts
{
  uint64_t v4 = globals;
  char v5 = (*(uint64_t (**)(uint64_t, SEL))(*(void *)globals + 16))(globals, a2);
  id v2 = *(id *)(globals + 112);
  CADeprecated::CAMutex::Locker::~Locker((CADeprecated::CAMutex::Locker *)&v4);

  return (NSSet *)v2;
}

- (BOOL)removeConnection:(MIDINetworkConnection *)connection
{
  uint64_t v4 = connection;
  char v5 = globals;
  if (globals)
  {
    uint64_t v8 = globals;
    char v5 = (*(uint64_t (**)(uint64_t))(*(void *)globals + 16))(globals);
  }
  else
  {
    uint64_t v8 = 0;
  }
  LOBYTE(v9) = v5;
  BOOL v6 = -[MIDINetworkSession addOrRemoveConnection:add:](self, "addOrRemoveConnection:add:", v4, 0, v8, v9);
  CADeprecated::CAMutex::Locker::~Locker((CADeprecated::CAMutex::Locker *)&v8);

  return v6;
}

- (BOOL)addConnection:(MIDINetworkConnection *)connection
{
  uint64_t v4 = connection;
  char v5 = globals;
  if (globals)
  {
    uint64_t v8 = globals;
    char v5 = (*(uint64_t (**)(uint64_t))(*(void *)globals + 16))(globals);
  }
  else
  {
    uint64_t v8 = 0;
  }
  LOBYTE(v9) = v5;
  BOOL v6 = -[MIDINetworkSession addOrRemoveConnection:add:](self, "addOrRemoveConnection:add:", v4, 1, v8, v9);
  CADeprecated::CAMutex::Locker::~Locker((CADeprecated::CAMutex::Locker *)&v8);

  return v6;
}

- (BOOL)addOrRemoveConnection:(id)a3 add:(BOOL)a4
{
  char v5 = ContactOrConnectionSet::AddOrRemoveItem((id *)self->_imp + 4, (objc_object *)a3, a4);
  if (v5)
  {
    [*((id *)self->_imp + 3) setObject:v5 forKey:@"peers"];
    [(MIDINetworkSession *)self setStateToEntity];
  }

  return v5 != 0;
}

- (NSSet)connections
{
  char v3 = globals;
  if (globals)
  {
    uint64_t v6 = globals;
    char v3 = (*(uint64_t (**)(uint64_t, SEL))(*(void *)globals + 16))(globals, a2);
  }
  else
  {
    uint64_t v6 = 0;
  }
  char v7 = v3;
  id v4 = *((id *)self->_imp + 5);
  CADeprecated::CAMutex::Locker::~Locker((CADeprecated::CAMutex::Locker *)&v6);

  return (NSSet *)v4;
}

- (void)setConnectionPolicy:(MIDINetworkConnectionPolicy)connectionPolicy
{
  char v5 = globals;
  if (globals)
  {
    uint64_t v8 = globals;
    char v5 = (*(uint64_t (**)(uint64_t, SEL))(*(void *)globals + 16))(globals, a2);
  }
  else
  {
    uint64_t v8 = 0;
  }
  LOBYTE(v9) = v5;
  uint64_t v6 = (void *)*((void *)self->_imp + 3);
  char v7 = objc_msgSend(NSNumber, "numberWithInt:", connectionPolicy, v8, v9);
  [v6 setObject:v7 forKey:@"join-policy"];

  [(MIDINetworkSession *)self setStateToEntity];
  CADeprecated::CAMutex::Locker::~Locker((CADeprecated::CAMutex::Locker *)&v8);
}

- (MIDINetworkConnectionPolicy)connectionPolicy
{
  char v3 = globals;
  if (globals)
  {
    uint64_t v7 = globals;
    char v3 = (*(uint64_t (**)(uint64_t, SEL))(*(void *)globals + 16))(globals, a2);
  }
  else
  {
    uint64_t v7 = 0;
  }
  LOBYTE(v8) = v3;
  id v4 = objc_msgSend(*((id *)self->_imp + 3), "objectForKey:", @"join-policy", v7, v8);
  MIDINetworkConnectionPolicy v5 = (int)[v4 intValue];

  CADeprecated::CAMutex::Locker::~Locker((CADeprecated::CAMutex::Locker *)&v7);
  return v5;
}

- (NSString)localName
{
  char v3 = globals;
  if (globals)
  {
    uint64_t v6 = globals;
    char v3 = (*(uint64_t (**)(uint64_t, SEL))(*(void *)globals + 16))(globals, a2);
  }
  else
  {
    uint64_t v6 = 0;
  }
  char v7 = v3;
  id v4 = *((id *)self->_imp + 2);
  CADeprecated::CAMutex::Locker::~Locker((CADeprecated::CAMutex::Locker *)&v6);

  return (NSString *)v4;
}

- (NSString)networkName
{
  char v3 = globals;
  if (globals)
  {
    uint64_t v6 = globals;
    char v3 = (*(uint64_t (**)(uint64_t, SEL))(*(void *)globals + 16))(globals, a2);
  }
  else
  {
    uint64_t v6 = 0;
  }
  LOBYTE(v7) = v3;
  id v4 = objc_msgSend(*((id *)self->_imp + 3), "objectForKey:", @"dns-sd-name", v6, v7);
  CADeprecated::CAMutex::Locker::~Locker((CADeprecated::CAMutex::Locker *)&v6);

  return (NSString *)v4;
}

- (NSUInteger)networkPort
{
  char v3 = globals;
  if (globals)
  {
    uint64_t v7 = globals;
    char v3 = (*(uint64_t (**)(uint64_t, SEL))(*(void *)globals + 16))(globals, a2);
  }
  else
  {
    uint64_t v7 = 0;
  }
  LOBYTE(v8) = v3;
  id v4 = objc_msgSend(*((id *)self->_imp + 3), "objectForKey:", @"port", v7, v8);
  NSUInteger v5 = [v4 unsignedIntValue];

  CADeprecated::CAMutex::Locker::~Locker((CADeprecated::CAMutex::Locker *)&v7);
  return v5;
}

- (void)setEnabled:(BOOL)enabled
{
  BOOL v3 = enabled;
  char v5 = globals;
  if (globals)
  {
    uint64_t v11 = globals;
    char v5 = (*(uint64_t (**)(uint64_t, SEL))(*(void *)globals + 16))(globals, a2);
  }
  else
  {
    uint64_t v11 = 0;
  }
  LOBYTE(v12) = v5;
  uint64_t v6 = objc_msgSend(*((id *)self->_imp + 3), "objectForKey:", @"flags", v11, v12);
  int v7 = [v6 unsignedIntValue];

  uint64_t v8 = v7 & 0xFFFFFFFE | v3;
  uint64_t v9 = (void *)*((void *)self->_imp + 3);
  v10 = [NSNumber numberWithUnsignedInt:v8];
  [v9 setObject:v10 forKey:@"flags"];

  [(MIDINetworkSession *)self setStateToEntity];
  if (v3) {
    [(MIDINetworkSession *)self refreshBonjourName];
  }
  CADeprecated::CAMutex::Locker::~Locker((CADeprecated::CAMutex::Locker *)&v11);
}

- (BOOL)isEnabled
{
  char v3 = globals;
  if (globals)
  {
    uint64_t v7 = globals;
    char v3 = (*(uint64_t (**)(uint64_t, SEL))(*(void *)globals + 16))(globals, a2);
  }
  else
  {
    uint64_t v7 = 0;
  }
  LOBYTE(v8) = v3;
  id v4 = objc_msgSend(*((id *)self->_imp + 3), "objectForKey:", @"flags", v7, v8);
  BOOL v5 = [v4 unsignedIntValue] & 1;

  CADeprecated::CAMutex::Locker::~Locker((CADeprecated::CAMutex::Locker *)&v7);
  return v5;
}

- (void)dealloc
{
  imp = (id *)self->_imp;
  if (imp)
  {

    MEMORY[0x1E01BB8C0](imp, 0x1080C4029CCB1DCLL);
  }
  v4.receiver = self;
  v4.super_class = (Class)MIDINetworkSession;
  [(MIDINetworkSession *)&v4 dealloc];
}

- (MIDINetworkSession)init
{
  v4.receiver = self;
  v4.super_class = (Class)MIDINetworkSession;
  if ([(MIDINetworkSession *)&v4 init]) {
    operator new();
  }
  id v2 = (MIDINetworkSession *)0;

  return v2;
}

- (void)refreshBonjourName
{
  id v5 = [(MIDINetworkSession *)self networkName];
  uint64_t v3 = MGCopyAnswer();
  if (v3) {
    objc_super v4 = (__CFString *)v3;
  }
  else {
    objc_super v4 = @"Unknown";
  }
  if (!v5
    || ([v5 isEqualToString:&stru_1F38D6260] & 1) != 0
    || ([v5 isEqualToString:v4] & 1) == 0)
  {
    [*((id *)self->_imp + 3) setObject:v4 forKey:@"dns-sd-name"];
    [(MIDINetworkSession *)self setStateToEntity];
  }
}

- (void)setStateToEntity
{
  imp = self->_imp;
  CFStringRef v4 = (const __CFString *)*((void *)imp + 2);
  if (v4)
  {
    MIDIObjectSetStringProperty(*(_DWORD *)imp, kMIDIPropertyName, v4);
    imp = self->_imp;
  }
  MIDIObjectSetDictionaryProperty(*(_DWORD *)imp, @"apple.midirtp.session", *((CFDictionaryRef *)imp + 3));
  SInt32 v5 = ![(MIDINetworkSession *)self isEnabled];
  MIDIObjectRef v6 = *(_DWORD *)self->_imp;

  MIDIObjectSetIntegerProperty(v6, kMIDIPropertyOffline, v5);
}

- (void)updateFromEntity
{
  CFStringRef str = 0;
  if (!MIDIObjectGetStringProperty(*(_DWORD *)self->_imp, kMIDIPropertyName, &str)) {
    objc_storeStrong((id *)self->_imp + 2, (id)str);
  }
  CFTypeRef cf = 0;
  if (!MIDIObjectGetDictionaryProperty(*(_DWORD *)self->_imp, @"apple.midirtp.session", (CFDictionaryRef *)&cf))
  {
    uint64_t v3 = [(id)cf mutableCopy];
    imp = self->_imp;
    SInt32 v5 = (void *)imp[3];
    imp[3] = v3;

    CFRelease(cf);
    MIDIObjectRef v6 = (id *)self->_imp;
    uint64_t v7 = v6 + 4;
    uint64_t v8 = [v6[3] objectForKey:@"peers"];
    ContactOrConnectionSet::UpdateFromDriver(v7, v8);
  }
}

+ (MIDINetworkSession)defaultSession
{
  if (atomic_load_explicit((atomic_ullong *volatile)&+[MIDINetworkSession defaultSession]::once, memory_order_acquire) != -1)
  {
    uint64_t v8 = &v10;
    uint64_t v11 = &v8;
    std::__call_once(&+[MIDINetworkSession defaultSession]::once, &v11, (void (__cdecl *)(void *))std::__call_once_proxy[abi:ne180100]<std::tuple<+[MIDINetworkSession defaultSession]::$_0 &&>>);
  }
  if (globals)
  {
    uint64_t v8 = (char *)globals;
    char v9 = 0;
    char v2 = (*(uint64_t (**)(uint64_t))(*(void *)globals + 16))(globals);
    uint64_t v3 = (void *)globals;
    char v9 = v2;
    if (globals)
    {
      CFStringRef v4 = *(void **)(globals + 96);
      if (!v4)
      {
        SInt32 v5 = objc_alloc_init(MIDINetworkSession);
        MIDIObjectRef v6 = (void *)v3[12];
        v3[12] = v5;

        CFStringRef v4 = (void *)v3[12];
      }
      uint64_t v3 = v4;
    }
  }
  else
  {
    uint64_t v3 = 0;
    char v9 = 0;
    uint64_t v8 = 0;
  }
  CADeprecated::CAMutex::Locker::~Locker((CADeprecated::CAMutex::Locker *)&v8);

  return (MIDINetworkSession *)v3;
}

@end
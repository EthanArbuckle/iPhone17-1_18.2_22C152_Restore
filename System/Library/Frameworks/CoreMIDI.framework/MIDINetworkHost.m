@interface MIDINetworkHost
+ (MIDINetworkHost)hostWithName:(NSString *)name address:(NSString *)address port:(NSUInteger)port;
+ (MIDINetworkHost)hostWithName:(NSString *)name netService:(NSNetService *)netService;
+ (MIDINetworkHost)hostWithName:(NSString *)name netServiceName:(NSString *)netServiceName netServiceDomain:(NSString *)netServiceDomain;
+ (id)fromAddressAsText:(id)a3 withName:(id)a4;
- (BOOL)hasSameAddressAs:(MIDINetworkHost *)other;
- (MIDINetworkHost)init;
- (NSString)address;
- (NSString)name;
- (NSString)netServiceDomain;
- (NSString)netServiceName;
- (NSUInteger)port;
- (id)addressAsText;
- (id)description;
- (id)displayName;
- (void)dealloc;
- (void)setName:(id)a3;
@end

@implementation MIDINetworkHost

- (id)displayName
{
  imp = (id *)self->_imp;
  if (*imp && (uint64_t v4 = [*imp length], imp = (id *)self->_imp, v4))
  {
    id v5 = *imp;
  }
  else
  {
    id v6 = imp[3];
    if (v6)
    {
      id v5 = v6;
    }
    else
    {
      id v7 = imp[1];
      if (v7)
      {
        id v5 = [NSString stringWithFormat:@"%@:%u", v7, imp[2]];
      }
      else
      {
        id v5 = 0;
      }
    }
  }

  return v5;
}

- (id)addressAsText
{
  imp = self->_imp;
  uint64_t v3 = imp[1];
  if (v3) {
    [NSString stringWithFormat:@"%@:%u", v3, imp[2]];
  }
  else {
  uint64_t v4 = [NSString stringWithFormat:@"\t%@\t%@", imp[3], imp[4]];
  }

  return v4;
}

- (BOOL)hasSameAddressAs:(MIDINetworkHost *)other
{
  uint64_t v4 = other;
  id v5 = [(MIDINetworkHost *)self address];

  if (!v5)
  {
    v11 = [(MIDINetworkHost *)self netServiceName];

    if (v11)
    {
      id v7 = [(MIDINetworkHost *)v4 netServiceName];
      if (!v7) {
        goto LABEL_13;
      }
      v8 = [(MIDINetworkHost *)self netServiceDomain];
      if (v8)
      {
        v9 = [(MIDINetworkHost *)v4 netServiceDomain];
        if (v9)
        {
          v12 = [(MIDINetworkHost *)self netServiceName];
          v13 = [(MIDINetworkHost *)v4 netServiceName];
          if ([v12 isEqualToString:v13])
          {
            v14 = [(MIDINetworkHost *)self netServiceDomain];
            v15 = [(MIDINetworkHost *)v4 netServiceDomain];
            char v10 = [v14 isEqualToString:v15];
          }
          else
          {
            char v10 = 0;
          }
        }
        else
        {
          char v10 = 0;
        }
        goto LABEL_19;
      }
      char v10 = 0;
    }
    else
    {
      id v7 = [(MIDINetworkHost *)v4 address];
      if (v7) {
        goto LABEL_13;
      }
      v8 = [(MIDINetworkHost *)v4 netServiceName];
      id v7 = 0;
      char v10 = v8 == 0;
    }
LABEL_20:

    goto LABEL_21;
  }
  uint64_t v6 = [(MIDINetworkHost *)v4 port];
  if (v6 == [(MIDINetworkHost *)self port])
  {
    id v7 = [(MIDINetworkHost *)v4 address];
    if (v7)
    {
      v8 = [(MIDINetworkHost *)self address];
      v9 = [(MIDINetworkHost *)v4 address];
      char v10 = [v8 isEqualToString:v9];
LABEL_19:

      goto LABEL_20;
    }
LABEL_13:
    char v10 = 0;
LABEL_21:

    goto LABEL_22;
  }
  char v10 = 0;
LABEL_22:

  return v10;
}

- (void)setName:(id)a3
{
}

- (NSString)netServiceDomain
{
  return (NSString *)*((id *)self->_imp + 4);
}

- (NSString)netServiceName
{
  return (NSString *)*((id *)self->_imp + 3);
}

- (NSUInteger)port
{
  return *((void *)self->_imp + 2);
}

- (NSString)address
{
  return (NSString *)*((id *)self->_imp + 1);
}

- (NSString)name
{
  return (NSString *)*(id *)self->_imp;
}

- (id)description
{
  uint64_t v3 = [NSString stringWithFormat:@"<MIDINetworkHost %p \"%@\" ", self, *(void *)self->_imp];
  imp = self->_imp;
  uint64_t v5 = imp[1];
  if (v5)
  {
    uint64_t v6 = [NSString stringWithFormat:@"%@ %@:%d>", v3, v5, imp[2]];
  }
  else
  {
    uint64_t v7 = imp[3];
    if (v7) {
      [NSString stringWithFormat:@"%@ netservice '%@'/'%@'>", v3, v7, imp[4]];
    }
    else {
    uint64_t v6 = [NSString stringWithFormat:@"%@ no address>", v3];
    }
  }
  v8 = (void *)v6;

  return v8;
}

- (void)dealloc
{
  imp = (id *)self->_imp;
  if (imp)
  {

    MEMORY[0x1E01BB8C0](imp, 0x1080C400F7E8713);
  }
  v4.receiver = self;
  v4.super_class = (Class)MIDINetworkHost;
  [(MIDINetworkHost *)&v4 dealloc];
}

- (MIDINetworkHost)init
{
  v3.receiver = self;
  v3.super_class = (Class)MIDINetworkHost;
  if ([(MIDINetworkHost *)&v3 init]) {
    operator new();
  }
  return 0;
}

+ (id)fromAddressAsText:(id)a3 withName:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = v5;
  v8 = (char *)[v7 UTF8String];
  v9 = v8;
  if (!v8)
  {
    v14 = 0;
    goto LABEL_8;
  }
  if (*v8 == 9)
  {
    char v10 = v8 + 1;
    v11 = strchr(v8 + 1, 9);
    v12 = (void *)[[NSString alloc] initWithBytes:v10 length:v11 - v10 encoding:4];
    v13 = [NSString stringWithUTF8String:v11 + 1];
    v14 = +[MIDINetworkHost hostWithName:v6 netServiceName:v12 netServiceDomain:v13];
  }
  else
  {
    unsigned int v17 = 0;
    v15 = strrchr(v8, 58);
    v14 = v15;
    if (!v15) {
      goto LABEL_8;
    }
    sscanf(v15 + 1, "%u", &v17);
    v12 = (void *)[[NSString alloc] initWithBytes:v9 length:v14 - v9 encoding:4];
    v14 = +[MIDINetworkHost hostWithName:v6 address:v12 port:v17];
  }

LABEL_8:

  return v14;
}

+ (MIDINetworkHost)hostWithName:(NSString *)name netService:(NSNetService *)netService
{
  id v5 = name;
  id v6 = netService;
  id v7 = [(NSNetService *)v6 name];
  v8 = [(NSNetService *)v6 domain];
  v9 = +[MIDINetworkHost hostWithName:v5 netServiceName:v7 netServiceDomain:v8];

  return (MIDINetworkHost *)v9;
}

+ (MIDINetworkHost)hostWithName:(NSString *)name netServiceName:(NSString *)netServiceName netServiceDomain:(NSString *)netServiceDomain
{
  id v7 = name;
  v8 = netServiceName;
  v9 = netServiceDomain;
  char v10 = objc_alloc_init(MIDINetworkHost);
  imp = (void **)v10->_imp;
  v12 = *imp;
  id *imp = v7;
  v13 = v7;

  v14 = imp[3];
  imp[3] = v8;
  v15 = v8;

  v16 = imp[4];
  imp[4] = v9;

  return v10;
}

+ (MIDINetworkHost)hostWithName:(NSString *)name address:(NSString *)address port:(NSUInteger)port
{
  id v7 = name;
  v8 = address;
  v9 = objc_alloc_init(MIDINetworkHost);
  imp = (void **)v9->_imp;
  v11 = *imp;
  id *imp = v7;
  v12 = v7;

  v13 = imp[1];
  imp[1] = v8;
  v14 = v8;

  imp[2] = (void *)port;

  return v9;
}

@end
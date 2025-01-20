@interface NEVirtualInterfaceParameters
+ (BOOL)supportsSecureCoding;
- (NEVirtualInterfaceParameters)initWithCoder:(id)a3;
- (NEVirtualInterfaceParameters)initWithType:(int64_t)a3 maxPendingPackets:(unint64_t)a4 ethernetAddress:(id)a5 mtu:(id)a6;
- (NEVirtualInterfaceParameters)initWithVirtualInterface:(NEVirtualInterface_s *)a3;
- (NEVirtualInterface_s)createVirtualInterfaceWithQueue:(id)a3 clientInfo:(void *)a4;
- (NSData)ethernetAddress;
- (NSFileHandle)controlSocket;
- (NSNumber)mtu;
- (NSString)name;
- (int64_t)type;
- (unint64_t)maxPendingPackets;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setControlSocket:(id)a3;
- (void)setName:(id)a3;
- (void)setUserEthernetController:(void *)a3;
- (void)userEthernetController;
@end

@implementation NEVirtualInterfaceParameters

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mtu, 0);
  objc_storeStrong((id *)&self->_ethernetAddress, 0);
  objc_storeStrong((id *)&self->_name, 0);

  objc_storeStrong((id *)&self->_controlSocket, 0);
}

- (NSNumber)mtu
{
  return (NSNumber *)objc_getProperty(self, a2, 56, 1);
}

- (NSData)ethernetAddress
{
  return (NSData *)objc_getProperty(self, a2, 48, 1);
}

- (unint64_t)maxPendingPackets
{
  return self->_maxPendingPackets;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setUserEthernetController:(void *)a3
{
  self->_userEthernetController = a3;
}

- (void)userEthernetController
{
  return self->_userEthernetController;
}

- (void)setName:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setControlSocket:(id)a3
{
}

- (NSFileHandle)controlSocket
{
  return self->_controlSocket;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(NEVirtualInterfaceParameters *)self controlSocket];
  [v4 encodeObject:v5 forKey:@"controlSocket"];

  v6 = [(NEVirtualInterfaceParameters *)self name];
  [v4 encodeObject:v6 forKey:@"name"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[NEVirtualInterfaceParameters type](self, "type"), @"type");
  objc_msgSend(v4, "encodeInt64:forKey:", -[NEVirtualInterfaceParameters maxPendingPackets](self, "maxPendingPackets"), @"maxPendingPackets");
  v7 = [(NEVirtualInterfaceParameters *)self ethernetAddress];
  [v4 encodeObject:v7 forKey:@"ethernetAddress"];

  id v8 = [(NEVirtualInterfaceParameters *)self mtu];
  [v4 encodeObject:v8 forKey:@"mtu"];
}

- (NEVirtualInterfaceParameters)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)NEVirtualInterfaceParameters;
  v5 = [(NEVirtualInterfaceParameters *)&v15 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"controlSocket"];
    controlSocket = v5->_controlSocket;
    v5->_controlSocket = (NSFileHandle *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"name"];
    name = v5->_name;
    v5->_name = (NSString *)v8;

    v5->_type = [v4 decodeIntegerForKey:@"type"];
    v5->_maxPendingPackets = [v4 decodeInt64ForKey:@"maxPendingPackets"];
    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ethernetAddress"];
    ethernetAddress = v5->_ethernetAddress;
    v5->_ethernetAddress = (NSData *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"mtu"];
    mtu = v5->_mtu;
    v5->_mtu = (NSNumber *)v12;
  }
  return v5;
}

- (NEVirtualInterface_s)createVirtualInterfaceWithQueue:(id)a3 clientInfo:(void *)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = a3;
  v7 = [(NEVirtualInterfaceParameters *)self controlSocket];
  int v8 = dup([v7 fileDescriptor]);

  if (v8 < 0)
  {
    int v12 = *__error();
    if (strerror_r(v12, __strerrbuf, 0x80uLL)) {
      __strerrbuf[0] = 0;
    }
    v13 = ne_log_obj();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
    {
      v15[0] = 67109378;
      v15[1] = v12;
      __int16 v16 = 2080;
      v17 = __strerrbuf;
      _os_log_fault_impl(&dword_19DDAF000, v13, OS_LOG_TYPE_FAULT, "Failed to dup the interface control socket: [%d] %s", (uint8_t *)v15, 0x12u);
    }

    v11 = 0;
  }
  else
  {
    uint64_t v9 = *MEMORY[0x1E4F1CF80];
    id v10 = [(NEVirtualInterfaceParameters *)self name];
    v11 = (NEVirtualInterface_s *)NEVirtualInterfaceCreateFromSocketAndName(v9, v8, [v10 UTF8String], -[NEVirtualInterfaceParameters type](self, "type"), v6, (uint64_t)a4);
  }
  return v11;
}

- (void)dealloc
{
  if ([(NEVirtualInterfaceParameters *)self userEthernetController]) {
    CFRelease([(NEVirtualInterfaceParameters *)self userEthernetController]);
  }
  v3.receiver = self;
  v3.super_class = (Class)NEVirtualInterfaceParameters;
  [(NEVirtualInterfaceParameters *)&v3 dealloc];
}

- (NEVirtualInterfaceParameters)initWithType:(int64_t)a3 maxPendingPackets:(unint64_t)a4 ethernetAddress:(id)a5 mtu:(id)a6
{
  id v11 = a5;
  id v12 = a6;
  v16.receiver = self;
  v16.super_class = (Class)NEVirtualInterfaceParameters;
  v13 = [(NEVirtualInterfaceParameters *)&v16 init];
  v14 = v13;
  if (v13)
  {
    v13->_type = a3;
    v13->_maxPendingPackets = a4;
    objc_storeStrong((id *)&v13->_ethernetAddress, a5);
    objc_storeStrong((id *)&v14->_mtu, a6);
  }

  return v14;
}

- (NEVirtualInterfaceParameters)initWithVirtualInterface:(NEVirtualInterface_s *)a3
{
  v14.receiver = self;
  v14.super_class = (Class)NEVirtualInterfaceParameters;
  id v4 = [(NEVirtualInterfaceParameters *)&v14 init];
  if (v4)
  {
    if (a3)
    {
      uint64_t v5 = [objc_alloc(MEMORY[0x1E4F28CB0]) initWithFileDescriptor:dup(*((_DWORD *)a3 + 74)) closeOnDealloc:1];
      controlSocket = v4->_controlSocket;
      v4->_controlSocket = (NSFileHandle *)v5;

      CFStringRef v7 = CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x1E4F1CF80], (const char *)a3 + 265, 0x600u);
      name = v4->_name;
      v4->_name = &v7->isa;

      int64_t v9 = *((void *)a3 + 32);
    }
    else
    {
      uint64_t v10 = [objc_alloc(MEMORY[0x1E4F28CB0]) initWithFileDescriptor:0xFFFFFFFFLL closeOnDealloc:1];
      id v11 = v4->_controlSocket;
      v4->_controlSocket = (NSFileHandle *)v10;

      id v12 = v4->_name;
      v4->_name = 0;

      int64_t v9 = 0;
    }
    v4->_type = v9;
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
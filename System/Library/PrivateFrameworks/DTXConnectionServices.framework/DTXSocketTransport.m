@interface DTXSocketTransport
+ (id)addressForHost:(const char *)a3 port:(int)a4;
+ (id)schemes;
- (DTXSocketTransport)initWithConnectedSocket:(int)a3 disconnectAction:(id)a4;
- (DTXSocketTransport)initWithLocalPort:(int)a3;
- (DTXSocketTransport)initWithRemoteAddress:(id)a3;
- (id)localAddresses;
- (int)port;
- (unint64_t)transmit:(const void *)a3 ofLength:(unint64_t)a4;
- (unsigned)supportedDirections;
- (void)_commonSocketTransportInit;
- (void)_setupChannelWithConnectedSocket:(int)a3 assumingOwnership:(BOOL)a4 orDisconnectBlock:(id)a5;
- (void)_setupWithLocalPort:(int)a3;
- (void)_signalSocketAccepted;
- (void)disconnect;
@end

@implementation DTXSocketTransport

+ (id)schemes
{
  return (id)MEMORY[0x270F9A6D0](MEMORY[0x263EFFA08], sel_setWithObject_, @"tcp");
}

+ (id)addressForHost:(const char *)a3 port:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  v6 = strnstr(a3, ":", 5uLL);
  v8 = NSURL;
  v9 = "[";
  v10 = "";
  if (v6) {
    v10 = "]";
  }
  else {
    v9 = "";
  }
  v11 = [NSString stringWithFormat:@"%@://%s%s%s:%d", @"tcp", v9, a3, v10, v4];
  v13 = [v8 URLWithString:v12];

  return v13;
}

- (void)_setupWithLocalPort:(int)a3
{
  uint64_t v5 = socket(30, 1, 6);
  if ((v5 & 0x80000000) != 0 || (uint64_t v6 = v5, fcntl(v5, 2, 1) == -1)) {
    sub_22AF52F70();
  }
  int v12 = 1;
  if (setsockopt(v6, 0xFFFF, 4, &v12, 4u)) {
    sub_22AF52FF4();
  }
  *(_WORD *)v10 = 7708;
  *(_WORD *)&v10[2] = bswap32(a3) >> 16;
  *(_DWORD *)&v10[4] = 0;
  *(_OWORD *)&v10[8] = *MEMORY[0x263EF88F0];
  int v11 = 0;
  if (bind(v6, (const sockaddr *)v10, 0x1Cu)) {
    sub_22AF52FC8();
  }
  if (listen(v6, 1)) {
    sub_22AF52F9C();
  }
  self->_port = sub_22AF46C30(v6);
  atomic_store(v6, (unsigned int *)&self->_socketSemProtector);
  dispatch_semaphore_wait((dispatch_semaphore_t)self->_socketAcceptedSem, 0xFFFFFFFFFFFFFFFFLL);
  v7 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_22AF46CF8;
  block[3] = &unk_264884288;
  int v9 = v6;
  block[4] = self;
  dispatch_async(v7, block);
}

- (void)_setupChannelWithConnectedSocket:(int)a3 assumingOwnership:(BOOL)a4 orDisconnectBlock:(id)a5
{
  BOOL v5 = a4;
  uint64_t v6 = *(void *)&a3;
  v8 = (void (**)(void))a5;
  if ([self v9:v10] != 2) {
    sub_22AF53020();
  }
  self->_port = sub_22AF46C30(v6);
  if (!v8 && v5)
  {
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = sub_22AF46EF8;
    v15[3] = &unk_2648842A8;
    int v16 = v6;
    v8 = (void (**)(void))MEMORY[0x230F36B10](v15);
  }
  if ((v6 & 0x80000000) == 0)
  {
    int v11 = fcntl(v6, 3);
    if ((v11 & 4) == 0)
    {
      fcntl(v6, 4, v11 | 4u);
LABEL_9:
      [self _signalSocketAccepted:v12 withTransitionContext:v13];
      v14.receiver = self;
      v14.super_class = (Class)DTXSocketTransport;
      [(DTXFileDescriptorTransport *)&v14 setupWithIncomingDescriptor:v6 outgoingDescriptor:v6 disconnectBlock:v8];
      goto LABEL_12;
    }
    if (v11 != -1) {
      goto LABEL_9;
    }
  }
  NSLog(&cfstr_UnableToSetNon.isa, v6);
  if (v8) {
    v8[2](v8);
  }
LABEL_12:
}

- (void)_commonSocketTransportInit
{
  v3 = (OS_dispatch_semaphore *)dispatch_semaphore_create(1);
  socketAcceptedSem = self->_socketAcceptedSem;
  self->_socketAcceptedSem = v3;

  atomic_store(0xFFFFFFFF, (unsigned int *)&self->_socketSemProtector);
}

- (void)_signalSocketAccepted
{
  int v3 = atomic_exchange(&self->_socketSemProtector, 0xFFFFFFFF);
  if (v3 != -1 && self->_socketAcceptedSem)
  {
    close(v3);
    socketAcceptedSem = self->_socketAcceptedSem;
    dispatch_semaphore_signal(socketAcceptedSem);
  }
}

- (DTXSocketTransport)initWithConnectedSocket:(int)a3 disconnectAction:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  int v9 = (void (**)(void))a4;
  if ((v4 & 0x80000000) != 0)
  {
    int v16 = [MEMORY[0x263F08690] currentHandler:v7 with:v8];
    [v16 _DTXSocketTransport_DTXSocketTransport_m_134_Invalid_parameter_not_satisfying__socketFileDescriptor__gte__0:a2];
  }
  v18.receiver = self;
  v18.super_class = (Class)DTXSocketTransport;
  uint64_t v10 = [(DTXFileDescriptorTransport *)&v18 init];
  uint64_t v13 = v10;
  if (v10)
  {
    [v10 commonSocketTransportInit:v11 withOptions:v12];
    [v13 setupChannelWithConnectedSocket:v14 assumingOwnership:v4 orDisconnectBlock:v9];
  }
  else if (v9)
  {
    v9[2](v9);
  }

  return v13;
}

- (DTXSocketTransport)initWithLocalPort:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  v10.receiver = self;
  v10.super_class = (Class)DTXSocketTransport;
  uint64_t v4 = [(DTXFileDescriptorTransport *)&v10 init];
  v7 = v4;
  if (v4)
  {
    [v4 _commonSocketTransportInit:v5 withOptions:v6];
    [v7 setupWithLocalPort:v8];
  }
  return v7;
}

- (DTXSocketTransport)initWithRemoteAddress:(id)a3
{
  id v5 = a3;
  v46.receiver = self;
  v46.super_class = (Class)DTXSocketTransport;
  uint64_t v6 = [(DTXTransport *)&v46 initWithRemoteAddress:v5];
  int v9 = v6;
  if (v6)
  {
    [v6 _commonSocketTransportInit:v7 withOptions:v8];
    memset(&v45.ai_addrlen, 0, 32);
    v45.ai_family = 0;
    v45.ai_flags = 5120;
    *(void *)&v45.ai_socktype = 0x600000001;
    v44 = 0;
    uint64_t v12 = [v5 v10:v11];
    v15 = [v5 performSelectorOnMainThread:v13 withObject:v14 waitUntilDone:NO];
    uint64_t v18 = [v15 performSelector:v16 withObject:v17];

    if (v18)
    {
      v20 = [NSString stringWithFormat:@"%d", v18];
      id v21 = v12;
      v24 = (const char *)[v21 UTF8String];
      id v25 = v20;
      v28 = (const char *)[v25 UTF8String];
      int v29 = getaddrinfo(v24, v28, &v45, &v44);
      if (v29)
      {
        v42 = gai_strerror(v29);
        NSLog(&cfstr_ErrorFindingAd.isa, v5, v42);
      }
      else
      {
        for (i = v44; i; i = i->ai_next)
        {
          uint64_t v34 = socket(i->ai_family, i->ai_socktype, i->ai_protocol);
          if ((v34 & 0x80000000) == 0)
          {
            uint64_t v35 = v34;
            if (fcntl(v34, 2, 1) != -1 && (connect(v35, i->ai_addr, i->ai_addrlen) & 0x80000000) == 0)
            {
              freeaddrinfo(v44);
              uint64_t v39 = [MEMORY[0x263EFF8C0] arrayWithObject:v5];
              addresses = v9->_addresses;
              v9->_addresses = (NSArray *)v39;

              [v9 setupChannelWithConnectedSocket:v41 assumingOwnership:v35 orDisconnectBlock:1];
              goto LABEL_15;
            }
            close(v35);
          }
        }
        v36 = __error();
        v43 = strerror(*v36);
        NSLog(&cfstr_UnableToConnec_0.isa, v5, v43);
      }
    }
    else
    {
      v30 = (objc_class *)objc_opt_class();
      v31 = NSStringFromClass(v30);
      v32 = NSStringFromSelector(a2);
      NSLog(&cfstr_MissingPortInU.isa, v31, v32, v5);
    }
    int v9 = 0;
  }
LABEL_15:

  return v9;
}

- (unint64_t)transmit:(const void *)a3 ofLength:(unint64_t)a4
{
  if ([self a2:a3] == NO)
  {
    dispatch_semaphore_wait((dispatch_semaphore_t)self->_socketAcceptedSem, 0xFFFFFFFFFFFFFFFFLL);
    dispatch_semaphore_signal((dispatch_semaphore_t)self->_socketAcceptedSem);
  }
  v8.receiver = self;
  v8.super_class = (Class)DTXSocketTransport;
  return [(DTXFileDescriptorTransport *)&v8 transmit:a3 ofLength:a4];
}

- (void)disconnect
{
  [self _signalSocketAccepted:a2 withSocket:v2];
  v4.receiver = self;
  v4.super_class = (Class)DTXSocketTransport;
  [(DTXFileDescriptorTransport *)&v4 disconnect];
}

- (id)localAddresses
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  p_addresses = &self->_addresses;
  addresses = self->_addresses;
  if (addresses)
  {
    id v5 = addresses;
  }
  else
  {
    [MEMORY[0x263EFF980] setValue:v2 forKey:a2];
    id v5 = (NSArray *)objc_claimAutoreleasedReturnValue();
    id v21 = 0;
    if (!getifaddrs(&v21))
    {
      v7 = v21;
      if (v21)
      {
        do
        {
          ifa_addr = v7->ifa_addr;
          int sa_family = ifa_addr->sa_family;
          if (sa_family == 2 || sa_family == 30 && !*(_DWORD *)&ifa_addr[1].sa_data[6])
          {
            objc_super v10 = &ifa_addr->sa_data[2];
            uint64_t v11 = &ifa_addr->sa_data[6];
            uint64_t v12 = sa_family == 2 ? v10 : v11;
            if (inet_ntop(sa_family, v12, v22, 0x2Eu) == v22)
            {
              uint64_t v15 = [self performSelector:v13 withObject:v14];
              uint64_t v17 = [DTXSocketTransport addressForHost:v16 port:v22];
              [v5 addObject:(id)v17];
            }
          }
          v7 = v7->ifa_next;
        }
        while (v7);
        v19 = v21;
      }
      else
      {
        v19 = 0;
      }
      MEMORY[0x230F365B0](v19);
    }
    objc_storeStrong((id *)p_addresses, v5);
  }

  return v5;
}

- (unsigned)supportedDirections
{
  return 3;
}

- (int)port
{
  return self->_port;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_addresses, 0);

  objc_storeStrong((id *)&self->_socketAcceptedSem, 0);
}

@end
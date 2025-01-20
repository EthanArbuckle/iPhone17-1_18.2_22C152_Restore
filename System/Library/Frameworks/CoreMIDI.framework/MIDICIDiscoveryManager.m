@interface MIDICIDiscoveryManager
+ (MIDICIDiscoveryManager)sharedInstance;
- (id)handleNotification:(const MIDINotification *)a3;
- (id)responseBlock;
- (int)setupManager;
- (void)dealloc;
- (void)debugPrintMessage;
- (void)discover;
- (void)discoverWithHandler:(MIDICIDiscoveryResponseBlock)completedHandler;
- (void)setResponseBlock:(id)a3;
@end

@implementation MIDICIDiscoveryManager

- (void).cxx_destruct
{
}

- (void)setResponseBlock:(id)a3
{
}

- (id)responseBlock
{
  return self->_mResponseBlock;
}

- (void)discover
{
}

- (void)debugPrintMessage
{
}

- (id)handleNotification:(const MIDINotification *)a3
{
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  __dst[0] = 0uLL;
  *(void *)((char *)&__dst[1] + 5) = 0;
  *(void *)&__dst[1] = 0;
  uint64_t messageID = a3->messageID;
  size_t messageSize = a3->messageSize;
  if ((int)messageID > 30)
  {
    switch(messageID)
    {
      case 0x1F:
        v7 = "Property Supported";
        break;
      case 0x20:
        v7 = "Property SysEx Data";
        break;
      case 0x28:
        v7 = "Done w/ Capabilities";
        break;
      default:
LABEL_15:
        v7 = "Unknown Notification Type";
        break;
    }
  }
  else
  {
    v7 = "MUID";
    switch((int)messageID)
    {
      case 10:
        break;
      case 11:
        v7 = "Peer Info";
        break;
      case 12:
        v7 = "Peer Info Empty";
        break;
      case 20:
        v7 = "Profile Supported";
        break;
      case 21:
        v7 = "Profile Enabled";
        break;
      case 22:
        v7 = "Profile Disabled";
        break;
      case 23:
        v7 = "Profile Specific Data";
        break;
      default:
        goto LABEL_15;
    }
  }
  NSLog(&cfstr_Handlenotifica.isa, a3, messageID, v7, messageSize, __dst[0], __dst[1]);
  if ((messageID - 10) > 2)
  {
    NSLog(&cfstr_DisallowedMess.isa);
  }
  else
  {
    v8 = 0;
    uint64_t v9 = messageID;
    while (v9 == 11)
    {
      v10 = a3 + 1;
      memcpy(__dst, v10, messageSize);
      unsigned int v11 = BYTE12(__dst[1]);
      long long v12 = *(_OWORD *)((char *)__dst + 4);
      uint64_t v13 = DWORD1(__dst[1]);
      v14 = [MIDICIDiscoveredNode alloc];
      uint64_t v15 = [(MIDICIDiscoveredNode *)v14 initWithDestination:DWORD2(__dst[1]) deviceID:v12 profilesSupported:(v11 >> 2) & 1 propertiesSupported:(v11 >> 3) & 1 maxSysExSize:v13];

      NSLog(&cfstr_PeerDiscovered.isa, v15);
      [v4 addObject:v15];
      a3 = (const MIDINotification *)((char *)v10 + messageSize);
      uint64_t v9 = a3->messageID;
      size_t messageSize = a3->messageSize;
      v8 = (void *)v15;
    }
    if (v9 == 12 || v9 == 40) {
      NSLog(&cfstr_DoneWithCapabi.isa);
    }
    else {
      NSLog(&cfstr_UnrecognizedMs.isa, v9, 0);
    }
  }

  return v4;
}

- (void)dealloc
{
  MIDIClientRef mClient = self->_mClient;
  if (mClient) {
    MIDIClientDispose(mClient);
  }
  v4.receiver = self;
  v4.super_class = (Class)MIDICIDiscoveryManager;
  [(MIDICIDiscoveryManager *)&v4 dealloc];
}

- (void)discoverWithHandler:(MIDICIDiscoveryResponseBlock)completedHandler
{
  id v6 = completedHandler;
  objc_super v4 = _Block_copy(v6);
  NSLog(&cfstr_Discoverwithha.isa, v4);

  [(MIDICIDiscoveryManager *)self setResponseBlock:v6];
  v5 = self;
  [(MIDICIDiscoveryManager *)v5 discover];
}

- (int)setupManager
{
  return -10844;
}

+ (MIDICIDiscoveryManager)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__MIDICIDiscoveryManager_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (+[MIDICIDiscoveryManager sharedInstance]::onceToken != -1) {
    dispatch_once(&+[MIDICIDiscoveryManager sharedInstance]::onceToken, block);
  }
  v2 = (void *)+[MIDICIDiscoveryManager sharedInstance]::theSharedInstance;

  return (MIDICIDiscoveryManager *)v2;
}

void __40__MIDICIDiscoveryManager_sharedInstance__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)+[MIDICIDiscoveryManager sharedInstance]::theSharedInstance;
  +[MIDICIDiscoveryManager sharedInstance]::theSharedInstance = (uint64_t)v1;

  [(id)+[MIDICIDiscoveryManager sharedInstance]::theSharedInstance setupManager];
  NSLog(&cfstr_Midicidiscover_0.isa, +[MIDICIDiscoveryManager sharedInstance]::theSharedInstance);
}

@end
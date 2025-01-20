@interface BKHIDUnknownSender
+ (id)unknownSenderInfo;
- (BKHIDUnknownSender)init;
- (BKSHIDEventSenderDescriptor)senderDescriptor;
- (BOOL)isAuthenticated;
- (BOOL)isBuiltIn;
- (NSString)displayUUID;
- (id)senderDescriptorForEventType:(unsigned int)a3;
- (int)eventSource;
- (unint64_t)senderID;
- (unsigned)primaryUsage;
- (unsigned)primaryUsagePage;
- (void)setAuthenticated:(BOOL)a3;
- (void)setBuiltIn:(BOOL)a3;
- (void)setDisplayUUID:(id)a3;
- (void)setEventSource:(int)a3;
- (void)setPrimaryUsage:(unsigned int)a3;
- (void)setPrimaryUsagePage:(unsigned int)a3;
- (void)setSenderDescriptor:(id)a3;
- (void)setSenderID:(unint64_t)a3;
@end

@implementation BKHIDUnknownSender

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_senderDescriptor, 0);

  objc_storeStrong((id *)&self->_displayUUID, 0);
}

- (void)setSenderDescriptor:(id)a3
{
}

- (BKSHIDEventSenderDescriptor)senderDescriptor
{
  return self->_senderDescriptor;
}

- (void)setBuiltIn:(BOOL)a3
{
  self->_builtIn = a3;
}

- (BOOL)isBuiltIn
{
  return self->_builtIn;
}

- (void)setAuthenticated:(BOOL)a3
{
  self->_authenticated = a3;
}

- (BOOL)isAuthenticated
{
  return self->_authenticated;
}

- (void)setPrimaryUsage:(unsigned int)a3
{
  self->_primaryUsage = a3;
}

- (unsigned)primaryUsage
{
  return self->_primaryUsage;
}

- (void)setPrimaryUsagePage:(unsigned int)a3
{
  self->_primaryUsagePage = a3;
}

- (unsigned)primaryUsagePage
{
  return self->_primaryUsagePage;
}

- (void)setSenderID:(unint64_t)a3
{
  self->_senderID = a3;
}

- (unint64_t)senderID
{
  return self->_senderID;
}

- (void)setEventSource:(int)a3
{
  self->_eventSource = a3;
}

- (int)eventSource
{
  return self->_eventSource;
}

- (void)setDisplayUUID:(id)a3
{
}

- (NSString)displayUUID
{
  return self->_displayUUID;
}

- (id)senderDescriptorForEventType:(unsigned int)a3
{
  return self->_senderDescriptor;
}

- (BKHIDUnknownSender)init
{
  v6.receiver = self;
  v6.super_class = (Class)BKHIDUnknownSender;
  v2 = [(BKHIDUnknownSender *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F4F308] wildcard];
    senderDescriptor = v2->_senderDescriptor;
    v2->_senderDescriptor = (BKSHIDEventSenderDescriptor *)v3;
  }
  return v2;
}

+ (id)unknownSenderInfo
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__BKHIDUnknownSender_unknownSenderInfo__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (unknownSenderInfo_onceToken != -1) {
    dispatch_once(&unknownSenderInfo_onceToken, block);
  }
  v2 = (void *)unknownSenderInfo_unknownSender;

  return v2;
}

uint64_t __39__BKHIDUnknownSender_unknownSenderInfo__block_invoke(uint64_t a1)
{
  unknownSenderInfo_unknownSender = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));

  return MEMORY[0x1F41817F8]();
}

@end
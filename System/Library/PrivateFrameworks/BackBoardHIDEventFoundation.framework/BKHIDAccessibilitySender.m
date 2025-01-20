@interface BKHIDAccessibilitySender
+ (id)accessibilityHIDServices;
- (BKHIDAccessibilitySender)initWithSenderID:(unint64_t)a3;
- (BKSHIDEventSenderDescriptor)senderDescriptor;
- (BOOL)isAuthenticated;
- (BOOL)isBuiltIn;
- (BOOL)isPencilDigitizer;
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

@implementation BKHIDAccessibilitySender

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

- (BKHIDAccessibilitySender)initWithSenderID:(unint64_t)a3
{
  v9.receiver = self;
  v9.super_class = (Class)BKHIDAccessibilitySender;
  v4 = [(BKHIDAccessibilitySender *)&v9 init];
  v5 = v4;
  if (v4)
  {
    v4->_senderID = a3;
    uint64_t v6 = [MEMORY[0x1E4F4F308] wildcard];
    senderDescriptor = v5->_senderDescriptor;
    v5->_senderDescriptor = (BKSHIDEventSenderDescriptor *)v6;
  }
  return v5;
}

- (BOOL)isPencilDigitizer
{
  return [(BKHIDAccessibilitySender *)self senderID] == 0x8000000817319379;
}

+ (id)accessibilityHIDServices
{
  v12[8] = *MEMORY[0x1E4F143B8];
  v2 = [[BKHIDAccessibilitySender alloc] initWithSenderID:0x8000000817319371];
  v3 = [[BKHIDAccessibilitySender alloc] initWithSenderID:0x8000000817319372];
  v4 = [[BKHIDAccessibilitySender alloc] initWithSenderID:0x8000000817319373];
  v5 = [[BKHIDAccessibilitySender alloc] initWithSenderID:0x8000000817319374];
  uint64_t v6 = [[BKHIDAccessibilitySender alloc] initWithSenderID:0x8000000817319375];
  v7 = [[BKHIDAccessibilitySender alloc] initWithSenderID:0x8000000817319376];
  v8 = [[BKHIDAccessibilitySender alloc] initWithSenderID:0x8000000817319379];
  objc_super v9 = [[BKHIDAccessibilitySender alloc] initWithSenderID:0x8000000817319378];
  v12[0] = v2;
  v12[1] = v3;
  v12[2] = v4;
  v12[3] = v5;
  v12[4] = v6;
  v12[5] = v7;
  v12[6] = v8;
  v12[7] = v9;
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:8];

  return v10;
}

@end
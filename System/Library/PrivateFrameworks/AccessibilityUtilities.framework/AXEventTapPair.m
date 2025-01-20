@interface AXEventTapPair
- (NSString)identifier;
- (__IOHIDEventSystemClient)systemClient;
- (id)description;
- (id)failedToHandleInTime;
- (id)handler;
- (id)matchingServiceHandler;
- (int)priority;
- (int)type;
- (void)dealloc;
- (void)setFailedToHandleInTime:(id)a3;
- (void)setHandler:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setMatchingServiceHandler:(id)a3;
- (void)setPriority:(int)a3;
- (void)setSystemClient:(__IOHIDEventSystemClient *)a3;
- (void)setType:(int)a3;
@end

@implementation AXEventTapPair

- (void)dealloc
{
  systemClient = self->_systemClient;
  if (systemClient)
  {
    CFRelease(systemClient);
    self->_systemClient = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)AXEventTapPair;
  [(AXEventTapPair *)&v4 dealloc];
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = [(AXEventTapPair *)self priority];
  v5 = [(AXEventTapPair *)self identifier];
  v6 = [v3 stringWithFormat:@"EventTap: %d - %@", v4, v5];

  return v6;
}

- (id)handler
{
  return self->handler;
}

- (void)setHandler:(id)a3
{
}

- (NSString)identifier
{
  return self->identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (int)priority
{
  return self->priority;
}

- (void)setPriority:(int)a3
{
  self->priority = a3;
}

- (int)type
{
  return self->_type;
}

- (void)setType:(int)a3
{
  self->_type = a3;
}

- (__IOHIDEventSystemClient)systemClient
{
  return self->_systemClient;
}

- (void)setSystemClient:(__IOHIDEventSystemClient *)a3
{
}

- (id)matchingServiceHandler
{
  return self->_matchingServiceHandler;
}

- (void)setMatchingServiceHandler:(id)a3
{
}

- (id)failedToHandleInTime
{
  return self->_failedToHandleInTime;
}

- (void)setFailedToHandleInTime:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_failedToHandleInTime, 0);
  objc_storeStrong(&self->_matchingServiceHandler, 0);
  objc_storeStrong((id *)&self->identifier, 0);

  objc_storeStrong(&self->handler, 0);
}

@end
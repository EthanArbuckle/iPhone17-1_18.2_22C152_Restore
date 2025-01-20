@interface AXRemoteMLElement
- (AXRemoteMLElement)initWithUUID:(id)a3 andContextId:(unsigned int)a4;
@end

@implementation AXRemoteMLElement

- (AXRemoteMLElement)initWithUUID:(id)a3 andContextId:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  pid_t v7 = getpid();
  v11.receiver = self;
  v11.super_class = (Class)AXRemoteMLElement;
  v8 = [(AXRemoteElement *)&v11 initWithUUID:v6 andRemotePid:-v7 andContextId:v4];

  if (AXRequestingClientSupportsMLElements()) {
    v9 = v8;
  }
  else {
    v9 = 0;
  }

  return v9;
}

@end
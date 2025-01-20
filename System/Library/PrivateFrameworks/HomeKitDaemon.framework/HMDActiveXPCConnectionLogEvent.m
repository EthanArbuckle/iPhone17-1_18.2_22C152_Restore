@interface HMDActiveXPCConnectionLogEvent
+ (id)initWithNewXPCConnectionAdded:(id)a3;
+ (id)initWithXPCConnectionRemoved:(id)a3;
- (BOOL)added;
- (BOOL)isActivated;
- (HMDActiveXPCConnectionLogEvent)initWithXPCConnection:(id)a3 added:(BOOL)a4;
- (NSString)name;
@end

@implementation HMDActiveXPCConnectionLogEvent

- (void).cxx_destruct
{
}

- (BOOL)added
{
  return self->_added;
}

- (BOOL)isActivated
{
  return self->_activated;
}

- (NSString)name
{
  return self->_name;
}

- (HMDActiveXPCConnectionLogEvent)initWithXPCConnection:(id)a3 added:(BOOL)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HMDActiveXPCConnectionLogEvent;
  v7 = [(HMMLogEvent *)&v11 init];
  if (v7)
  {
    uint64_t v8 = [v6 name];
    name = v7->_name;
    v7->_name = (NSString *)v8;

    v7->_activated = [v6 isActivated];
    v7->_added = a4;
  }

  return v7;
}

+ (id)initWithXPCConnectionRemoved:(id)a3
{
  id v3 = a3;
  v4 = [[HMDActiveXPCConnectionLogEvent alloc] initWithXPCConnection:v3 added:0];

  return v4;
}

+ (id)initWithNewXPCConnectionAdded:(id)a3
{
  id v3 = a3;
  v4 = [[HMDActiveXPCConnectionLogEvent alloc] initWithXPCConnection:v3 added:1];

  return v4;
}

@end
@interface MCPeerIDInternal
- (MCPeerIDInternal)initWithIDString:(id)a3 pid64:(unint64_t)a4 displayName:(id)a5;
- (NSString)displayName;
- (NSString)idString;
- (unint64_t)pid64;
- (void)dealloc;
@end

@implementation MCPeerIDInternal

- (MCPeerIDInternal)initWithIDString:(id)a3 pid64:(unint64_t)a4 displayName:(id)a5
{
  v10.receiver = self;
  v10.super_class = (Class)MCPeerIDInternal;
  v8 = [(MCPeerIDInternal *)&v10 init];
  if (v8)
  {
    v8->_idString = (NSString *)[a3 copy];
    v8->_pid64 = a4;
    v8->_displayName = (NSString *)[a5 copy];
  }
  return v8;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)MCPeerIDInternal;
  [(MCPeerIDInternal *)&v3 dealloc];
}

- (NSString)idString
{
  return self->_idString;
}

- (unint64_t)pid64
{
  return self->_pid64;
}

- (NSString)displayName
{
  return self->_displayName;
}

@end
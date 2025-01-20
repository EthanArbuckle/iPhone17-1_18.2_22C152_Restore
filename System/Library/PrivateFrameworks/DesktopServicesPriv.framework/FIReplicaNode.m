@interface FIReplicaNode
- (BOOL)conformsToProtocol:(id)a3;
- (BOOL)isKindOfClass:(Class)a3;
- (id)description;
- (id)forwardingTargetForSelector:(SEL)a3;
- (id)init:(id)a3;
- (id)original;
- (void)dealloc;
@end

@implementation FIReplicaNode

- (id)init:(id)a3
{
  v4 = (FINode *)a3;
  v8.receiver = self;
  v8.super_class = (Class)FIReplicaNode;
  v5 = [(FIReplicaNode *)&v8 init];
  original = v5->_original;
  v5->_original = v4;

  return v5;
}

- (void)dealloc
{
  TReplicaRegistry::RemoveReplica((TReplicaRegistry *)self, (FINode *)a2);
  v3.receiver = self;
  v3.super_class = (Class)FIReplicaNode;
  [(FIReplicaNode *)&v3 dealloc];
}

- (id)description
{
  objc_super v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)FIReplicaNode;
  v4 = [(FIReplicaNode *)&v8 description];
  v5 = [(FINode *)self->_original description];
  v6 = [v3 stringWithFormat:@"%@ -> %@", v4, v5];

  return v6;
}

- (id)original
{
  return self->_original;
}

- (id)forwardingTargetForSelector:(SEL)a3
{
  return self->_original;
}

- (BOOL)isKindOfClass:(Class)a3
{
  if ((Class)objc_opt_class() == a3
    || (v7.receiver = self,
        v7.super_class = (Class)FIReplicaNode,
        [(FIReplicaNode *)&v7 isKindOfClass:a3]))
  {
    char isKindOfClass = 1;
  }
  else
  {
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  return isKindOfClass & 1;
}

- (BOOL)conformsToProtocol:(id)a3
{
  id v4 = a3;
  if ([(FINode *)self->_original conformsToProtocol:v4])
  {
    BOOL v5 = 1;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)FIReplicaNode;
    BOOL v5 = [(FIReplicaNode *)&v7 conformsToProtocol:v4];
  }

  return v5;
}

- (void).cxx_destruct
{
}

@end
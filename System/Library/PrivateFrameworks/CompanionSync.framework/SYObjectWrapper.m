@interface SYObjectWrapper
- (NSString)description;
- (NSString)objectIdentifier;
- (NSString)sequencer;
- (SYObject)wrappedObject;
- (SYObjectWrapper)initWithSYObject:(id)a3 type:(int64_t)a4;
- (int64_t)changeType;
@end

@implementation SYObjectWrapper

- (SYObjectWrapper)initWithSYObject:(id)a3 type:(int64_t)a4
{
  id v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SYObjectWrapper;
  v8 = [(SYObjectWrapper *)&v12 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_wrappedObject, a3);
    v9->_type = a4;
    v10 = v9;
  }

  return v9;
}

- (NSString)objectIdentifier
{
  return (NSString *)[(SYObject *)self->_wrappedObject syncId];
}

- (NSString)sequencer
{
  return 0;
}

- (int64_t)changeType
{
  return self->_type;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  v9.receiver = self;
  v9.super_class = (Class)SYObjectWrapper;
  v4 = [(SYObjectWrapper *)&v9 description];
  v5 = [(SYObjectWrapper *)self objectIdentifier];
  v6 = [(SYObjectWrapper *)self sequencer];
  id v7 = (void *)[v3 initWithFormat:@"%@ (objectIdentifier: %@, sequencer: %@, changeType: %d, wrappedObject: %@)", v4, v5, v6, -[SYObjectWrapper changeType](self, "changeType"), self->_wrappedObject];

  return (NSString *)v7;
}

- (SYObject)wrappedObject
{
  return self->_wrappedObject;
}

- (void).cxx_destruct
{
}

@end
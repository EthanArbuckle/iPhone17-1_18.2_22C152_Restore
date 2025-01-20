@interface TKSharedResource
- (TKSharedResource)initWithSlot:(id)a3;
- (id)object;
- (void)dealloc;
- (void)invalidate;
@end

@implementation TKSharedResource

- (TKSharedResource)initWithSlot:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TKSharedResource;
  v6 = [(TKSharedResource *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_slot, a3);
  }

  return v7;
}

- (id)object
{
  return [(TKSharedResourceSlot *)self->_slot object];
}

- (void)dealloc
{
  [(TKSharedResourceSlot *)self->_slot releaseResourceImmediatelly:0];
  v3.receiver = self;
  v3.super_class = (Class)TKSharedResource;
  [(TKSharedResource *)&v3 dealloc];
}

- (void)invalidate
{
  [(TKSharedResourceSlot *)self->_slot releaseResourceImmediatelly:1];
  slot = self->_slot;
  self->_slot = 0;
}

- (void).cxx_destruct
{
}

@end
@interface MPDispatchQueueExclusiveAccessToken
+ (id)tokenWithQueue:(id)a3 owner:(id)a4;
- (id)_init;
- (void)assertHasExclusiveAccessForOwner:(id)a3;
@end

@implementation MPDispatchQueueExclusiveAccessToken

- (void).cxx_destruct
{
}

+ (id)tokenWithQueue:(id)a3 owner:(id)a4
{
  id v5 = a3;
  v6 = [[MPDispatchQueueExclusiveAccessToken alloc] _init];
  v7 = (void *)v6[1];
  v6[1] = v5;

  v6[2] = a4;

  return v6;
}

- (id)_init
{
  v3.receiver = self;
  v3.super_class = (Class)MPDispatchQueueExclusiveAccessToken;
  return [(MPDispatchQueueExclusiveAccessToken *)&v3 init];
}

- (void)assertHasExclusiveAccessForOwner:(id)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_accessQueue);
  if (self->_owner != a3)
  {
    id v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"MPExclusiveAccessToken.m", 37, @"Exclusive access not for this owner %@ != %@", self->_owner, a3 object file lineNumber description];
  }
}

@end
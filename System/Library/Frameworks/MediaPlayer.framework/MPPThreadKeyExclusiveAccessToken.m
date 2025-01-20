@interface MPPThreadKeyExclusiveAccessToken
+ (id)tokenWithKey:(unint64_t)a3 owner:(id)a4;
- (id)_init;
- (void)assertHasExclusiveAccessForOwner:(id)a3;
@end

@implementation MPPThreadKeyExclusiveAccessToken

- (void)assertHasExclusiveAccessForOwner:(id)a3
{
  if (!pthread_getspecific(self->_key))
  {
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"MPExclusiveAccessToken.m" lineNumber:59 description:@"Exclusive access failed"];
  }
  if (self->_owner != a3)
  {
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"MPExclusiveAccessToken.m", 60, @"Exclusive access not for this owner %@ != %@", self->_owner, a3 object file lineNumber description];
  }
}

- (id)_init
{
  v3.receiver = self;
  v3.super_class = (Class)MPPThreadKeyExclusiveAccessToken;
  return [(MPPThreadKeyExclusiveAccessToken *)&v3 init];
}

+ (id)tokenWithKey:(unint64_t)a3 owner:(id)a4
{
  v6 = [[MPPThreadKeyExclusiveAccessToken alloc] _init];
  v6[1] = a3;
  v6[2] = a4;

  return v6;
}

@end
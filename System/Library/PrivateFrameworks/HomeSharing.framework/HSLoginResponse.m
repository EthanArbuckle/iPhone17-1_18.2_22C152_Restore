@interface HSLoginResponse
- (unsigned)sessionID;
- (void)setSessionID:(unsigned int)a3;
@end

@implementation HSLoginResponse

- (void)setSessionID:(unsigned int)a3
{
  self->sessionID = a3;
}

- (unsigned)sessionID
{
  return self->sessionID;
}

@end
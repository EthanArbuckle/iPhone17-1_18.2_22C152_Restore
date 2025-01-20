@interface AMUIConcreteUnlockRequest
- (NSString)name;
- (NSString)unlockDestination;
- (void)setName:(id)a3;
- (void)setUnlockDestination:(id)a3;
@end

@implementation AMUIConcreteUnlockRequest

- (NSString)name
{
  return self->name;
}

- (void)setName:(id)a3
{
}

- (NSString)unlockDestination
{
  return self->unlockDestination;
}

- (void)setUnlockDestination:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->unlockDestination, 0);

  objc_storeStrong((id *)&self->name, 0);
}

@end
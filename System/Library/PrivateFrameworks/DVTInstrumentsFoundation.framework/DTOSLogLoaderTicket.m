@interface DTOSLogLoaderTicket
- (BOOL)needsHold;
- (void)holdAgent:(id)a3 loader:(id)a4;
@end

@implementation DTOSLogLoaderTicket

- (BOOL)needsHold
{
  return 1;
}

- (void)holdAgent:(id)a3 loader:(id)a4
{
}

@end
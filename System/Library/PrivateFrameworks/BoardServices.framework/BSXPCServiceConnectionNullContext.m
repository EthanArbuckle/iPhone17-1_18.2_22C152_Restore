@interface BSXPCServiceConnectionNullContext
+ (void)nullContext;
- (BOOL)isClient;
@end

@implementation BSXPCServiceConnectionNullContext

+ (void)nullContext
{
  self;
  v0 = -[BSXPCServiceConnectionRootContext _initWithType:eDesc:]([BSXPCServiceConnectionNullContext alloc], 0x43u, @"<null>");

  return v0;
}

- (BOOL)isClient
{
  return 1;
}

@end
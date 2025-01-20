@interface XPCConnectionManager
- (void)installProfileWithData:(NSData *)a3 completionHandler:(id)a4;
- (void)installedProfilesWithCompletionHandler:(id)a3;
- (void)removeProfileWithIdentifier:(NSString *)a3 completionHandler:(id)a4;
@end

@implementation XPCConnectionManager

- (void)installProfileWithData:(NSData *)a3 completionHandler:(id)a4
{
}

- (void)installedProfilesWithCompletionHandler:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  *(void *)(v5 + 24) = self;
  swift_retain();
  sub_23D20101C((uint64_t)&unk_268BEE060, v5);
}

- (void)removeProfileWithIdentifier:(NSString *)a3 completionHandler:(id)a4
{
}

@end
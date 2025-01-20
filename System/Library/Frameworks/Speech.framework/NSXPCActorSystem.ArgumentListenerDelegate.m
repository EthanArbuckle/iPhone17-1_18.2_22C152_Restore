@interface NSXPCActorSystem.ArgumentListenerDelegate
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (_TtCC6Speech16NSXPCActorSystemP33_94CB77BB9A0C7D73CCFFEC4A056F3C0724ArgumentListenerDelegate)init;
@end

@implementation NSXPCActorSystem.ArgumentListenerDelegate

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  char v9 = sub_1B71A6DC0((uint64_t)v6, (uint64_t)v7);

  return v9 & 1;
}

- (_TtCC6Speech16NSXPCActorSystemP33_94CB77BB9A0C7D73CCFFEC4A056F3C0724ArgumentListenerDelegate)init
{
}

- (void).cxx_destruct
{
}

@end
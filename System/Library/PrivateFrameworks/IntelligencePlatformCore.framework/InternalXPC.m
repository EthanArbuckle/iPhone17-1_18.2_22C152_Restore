@interface InternalXPC
- (_TtC24IntelligencePlatformCore11InternalXPC)init;
@end

@implementation InternalXPC

- (_TtC24IntelligencePlatformCore11InternalXPC)init
{
  return (_TtC24IntelligencePlatformCore11InternalXPC *)InternalXPC.Server.init()();
}

@end
@interface SampleClass
- (_TtC5Marrs11SampleClass)init;
- (id)getHelloWorld;
@end

@implementation SampleClass

- (id)getHelloWorld
{
  v2 = (void *)sub_1C95DED0C();
  swift_bridgeObjectRelease();
  return v2;
}

- (_TtC5Marrs11SampleClass)init
{
  return (_TtC5Marrs11SampleClass *)SampleClass.init()();
}

@end
@interface LocationDataProvider
- (_TtC11ClockPoster20LocationDataProvider)init;
@end

@implementation LocationDataProvider

- (_TtC11ClockPoster20LocationDataProvider)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  swift_defaultActor_initialize();
  *(void *)&self->_anon_60[8] = MEMORY[0x263F8EE80];
  v5.receiver = self;
  v5.super_class = ObjectType;
  return [(LocationDataProvider *)&v5 init];
}

@end
@interface HMDPassLibrary
+ (HMDPassLibrary)shared;
- (HMDPassLibrary)init;
@end

@implementation HMDPassLibrary

+ (HMDPassLibrary)shared
{
  if (qword_2686D63B8 != -1) {
    swift_once();
  }
  v2 = (void *)swift_retain();
  return (HMDPassLibrary *)v2;
}

- (HMDPassLibrary)init
{
  swift_defaultActor_initialize();
  sub_2302DD3C0();
  swift_retain();
  *(void *)&self->_anon_60[8] = sub_2302DD3B0();
  swift_release();
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for PassLibrary();
  return [(HMDPassLibrary *)&v4 init];
}

@end
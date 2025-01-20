@interface AUAppleCustomViewLoader
- (_TtC12CoreAudioKit23AUAppleCustomViewLoader)init;
- (id)customViewControllerFor:(AudioComponentDescription *)a3 audioUnit:(void *)a4 v3AU:(id)a5;
@end

@implementation AUAppleCustomViewLoader

- (id)customViewControllerFor:(AudioComponentDescription *)a3 audioUnit:(void *)a4 v3AU:(id)a5
{
  OSType componentSubType = a3->componentSubType;
  OSType componentManufacturer = a3->componentManufacturer;
  id v10 = a5;
  v11 = self;
  v12 = sub_21E5814D0(componentSubType, componentManufacturer, (uint64_t)a4, a5);

  return v12;
}

- (_TtC12CoreAudioKit23AUAppleCustomViewLoader)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for AUAppleCustomViewLoader();
  return [(AUAppleCustomViewLoader *)&v3 init];
}

@end
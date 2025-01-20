@interface NTKEsterbrookSceneTimeOverrideManager
+ (NTKEsterbrookSceneTimeOverrideManager)sharedManager;
- (NSDate)simulatedSceneOverrideDate;
- (NTKEsterbrookSceneTimeOverrideManager)init;
@end

@implementation NTKEsterbrookSceneTimeOverrideManager

+ (NTKEsterbrookSceneTimeOverrideManager)sharedManager
{
  if (qword_2691C02A8 != -1) {
    swift_once();
  }
  v2 = (void *)qword_2691D41C8;

  return (NTKEsterbrookSceneTimeOverrideManager *)v2;
}

- (NSDate)simulatedSceneOverrideDate
{
  return (NSDate *)0;
}

- (NTKEsterbrookSceneTimeOverrideManager)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for SceneTimeOverrideManager();
  return [(NTKEsterbrookSceneTimeOverrideManager *)&v3 init];
}

@end
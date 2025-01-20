@interface ComponentCameraFront
- (BOOL)isSuperWide;
- (id)serialNumberComponentPropertyKey;
- (int64_t)cameraModuleType;
- (void)populateAttributes:(id)a3;
@end

@implementation ComponentCameraFront

- (void)populateAttributes:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)ComponentCameraFront;
  id v4 = a3;
  [(ComponentCameraBase *)&v6 populateAttributes:v4];
  v5 = +[NSNumber numberWithBool:[(ComponentCameraFront *)self isSuperWide]];
  [v4 setObject:v5 forKeyedSubscript:@"isSuperWide"];
}

- (id)serialNumberComponentPropertyKey
{
  return @"FrontCameraModuleSerialNumString";
}

- (int64_t)cameraModuleType
{
  return 2;
}

- (BOOL)isSuperWide
{
  return MGGetBoolAnswer();
}

@end
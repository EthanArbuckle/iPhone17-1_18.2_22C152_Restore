@interface CHUISMutableWatchComplicationsWidgetSceneClientSettings
- (double)curvedTextAngularWidth;
- (id)copyWithZone:(_NSZone *)a3;
- (id)keyDescriptionForSetting:(unint64_t)a3;
- (id)valueDescriptionForFlag:(int64_t)a3 object:(id)a4 ofSetting:(unint64_t)a5;
- (void)setCurvedTextAngularWidth:(double)a3;
@end

@implementation CHUISMutableWatchComplicationsWidgetSceneClientSettings

- (double)curvedTextAngularWidth
{
  v2 = [(FBSSettings *)self otherSettings];
  v3 = [v2 objectForSetting:89888];
  [v3 doubleValue];
  double v5 = v4;

  return v5;
}

- (void)setCurvedTextAngularWidth:(double)a3
{
  id v5 = [(FBSSettings *)self otherSettings];
  double v4 = [NSNumber numberWithDouble:a3];
  [v5 setObject:v4 forSetting:89888];
}

- (id)copyWithZone:(_NSZone *)a3
{
  double v4 = [CHUISWatchComplicationsWidgetSceneClientSettings alloc];

  return [(FBSSettings *)v4 initWithSettings:self];
}

- (id)keyDescriptionForSetting:(unint64_t)a3
{
  if (a3 == 89888)
  {
    id v5 = @"curvedTextAngularWidth";
  }
  else
  {
    uint64_t v8 = v3;
    uint64_t v9 = v4;
    v7.receiver = self;
    v7.super_class = (Class)CHUISMutableWatchComplicationsWidgetSceneClientSettings;
    -[CHUISMutableWidgetSceneClientSettings keyDescriptionForSetting:](&v7, sel_keyDescriptionForSetting_);
    id v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (id)valueDescriptionForFlag:(int64_t)a3 object:(id)a4 ofSetting:(unint64_t)a5
{
  id v8 = a4;
  uint64_t v9 = v8;
  if (a5 == 89888)
  {
    id v10 = v8;
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)CHUISMutableWatchComplicationsWidgetSceneClientSettings;
    id v10 = [(FBSSettings *)&v13 valueDescriptionForFlag:a3 object:v8 ofSetting:a5];
  }
  v11 = v10;

  return v11;
}

@end
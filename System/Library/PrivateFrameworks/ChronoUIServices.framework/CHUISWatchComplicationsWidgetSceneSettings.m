@interface CHUISWatchComplicationsWidgetSceneSettings
- (BOOL)generateSnapshotMetadata;
- (BOOL)includeAccessoryViews;
- (CGPoint)bezelContentCenter;
- (CHSWatchComplicationsCurvedLabelMetrics)curvedLabelMetrics;
- (id)keyDescriptionForSetting:(unint64_t)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)valueDescriptionForFlag:(int64_t)a3 object:(id)a4 ofSetting:(unint64_t)a5;
- (unint64_t)cornerPosition;
@end

@implementation CHUISWatchComplicationsWidgetSceneSettings

- (unint64_t)cornerPosition
{
  v2 = [(FBSSettings *)self otherSettings];
  v3 = [v2 objectForSetting:89888];
  uint64_t v4 = objc_opt_class();
  id v5 = v3;
  if (v4)
  {
    if (objc_opt_isKindOfClass()) {
      v6 = v5;
    }
    else {
      v6 = 0;
    }
  }
  else
  {
    v6 = 0;
  }
  id v7 = v6;

  unint64_t v8 = [v7 unsignedIntegerValue];
  return v8;
}

- (CHSWatchComplicationsCurvedLabelMetrics)curvedLabelMetrics
{
  v2 = [(FBSSettings *)self otherSettings];
  v3 = [v2 objectForSetting:89889];
  uint64_t v4 = objc_opt_class();
  id v5 = v3;
  if (v4)
  {
    if (objc_opt_isKindOfClass()) {
      v6 = v5;
    }
    else {
      v6 = 0;
    }
  }
  else
  {
    v6 = 0;
  }
  id v7 = v6;

  return (CHSWatchComplicationsCurvedLabelMetrics *)v7;
}

- (CGPoint)bezelContentCenter
{
  v2 = [(FBSSettings *)self otherSettings];
  v3 = [v2 objectForSetting:89890];
  uint64_t v4 = objc_opt_class();
  id v5 = v3;
  if (v4)
  {
    if (objc_opt_isKindOfClass()) {
      v6 = v5;
    }
    else {
      v6 = 0;
    }
  }
  else
  {
    v6 = 0;
  }
  id v7 = v6;

  [v7 CGPointValue];
  double v9 = v8;
  double v11 = v10;

  double v12 = v9;
  double v13 = v11;
  result.y = v13;
  result.x = v12;
  return result;
}

- (BOOL)includeAccessoryViews
{
  v2 = [(FBSSettings *)self otherSettings];
  v3 = [v2 objectForSetting:89891];
  uint64_t v4 = objc_opt_class();
  id v5 = v3;
  if (v4)
  {
    if (objc_opt_isKindOfClass()) {
      v6 = v5;
    }
    else {
      v6 = 0;
    }
  }
  else
  {
    v6 = 0;
  }
  id v7 = v6;

  char v8 = [v7 BOOLValue];
  return v8;
}

- (BOOL)generateSnapshotMetadata
{
  v2 = [(FBSSettings *)self otherSettings];
  v3 = [v2 objectForSetting:89892];
  uint64_t v4 = objc_opt_class();
  id v5 = v3;
  if (v4)
  {
    if (objc_opt_isKindOfClass()) {
      v6 = v5;
    }
    else {
      v6 = 0;
    }
  }
  else
  {
    v6 = 0;
  }
  id v7 = v6;

  char v8 = [v7 BOOLValue];
  return v8;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  uint64_t v4 = [CHUISMutableWatchComplicationsWidgetSceneSettings alloc];

  return [(FBSSettings *)v4 initWithSettings:self];
}

- (id)keyDescriptionForSetting:(unint64_t)a3
{
  unint64_t v3 = a3 - 89889;
  if (a3 - 89888 > 4)
  {
    v6.receiver = self;
    v6.super_class = (Class)CHUISWatchComplicationsWidgetSceneSettings;
    -[CHUISWidgetSceneSettings keyDescriptionForSetting:](&v6, sel_keyDescriptionForSetting_);
    uint64_t v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else if (v3 > 3)
  {
    uint64_t v4 = @"cornerPosition";
  }
  else
  {
    uint64_t v4 = off_1E62AF450[v3];
  }

  return v4;
}

- (id)valueDescriptionForFlag:(int64_t)a3 object:(id)a4 ofSetting:(unint64_t)a5
{
  id v8 = a4;
  if (a5 - 89888 > 4)
  {
    v11.receiver = self;
    v11.super_class = (Class)CHUISWatchComplicationsWidgetSceneSettings;
    double v9 = [(CHUISWidgetSceneSettings *)&v11 valueDescriptionForFlag:a3 object:v8 ofSetting:a5];
  }
  else
  {
    CHUISWatchComplicationsWidgetSceneSettingsValueDescription(a5, v8);
    objc_claimAutoreleasedReturnValue();
    double v9 = v8;
  }

  return v9;
}

@end
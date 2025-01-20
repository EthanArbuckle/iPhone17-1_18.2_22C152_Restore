@interface FBSCoreSettingsExtension
+ (id)settings:(id)a3 valueDescriptionForFlag:(int64_t)a4 object:(id)a5 ofSetting:(unint64_t)a6;
@end

@implementation FBSCoreSettingsExtension

+ (id)settings:(id)a3 valueDescriptionForFlag:(int64_t)a4 object:(id)a5 ofSetting:(unint64_t)a6
{
  id v10 = a3;
  id v11 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v12 = [v11 descriptionProvider];

    if (!v12)
    {
      v13 = [v10 keyForSetting:a6];
      v14 = v13;
      if (v13)
      {
        Class v15 = NSClassFromString(v13);
        if (v15)
        {
          Class v16 = v15;
          if ([(objc_class *)v15 isSubclassOfClass:objc_opt_class()]) {
            [v11 setDescriptionProvider:v16];
          }
        }
      }
    }
  }
  v19.receiver = a1;
  v19.super_class = (Class)&OBJC_METACLASS___FBSCoreSettingsExtension;
  v17 = [super settingsValueDescriptionForFlag:v10 object:a4 ofSetting:v11];

  return v17;
}

@end
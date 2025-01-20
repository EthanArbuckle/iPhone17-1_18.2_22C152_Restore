@interface BBUNCoreConversion
+ (id)bbObjectFromUNCObject:(id)a3;
+ (id)toBBMuteAssertion:(id)a3;
+ (id)toBBSectionIcon:(id)a3;
+ (id)toBBSectionInfo:(id)a3 parentSection:(id)a4;
+ (id)toBBSectionInfoDictionary:(id)a3;
+ (id)toBBSectionInfoSettings:(id)a3;
+ (id)toBBSectionInfos:(id)a3 parentSection:(id)a4;
+ (id)toUNCBulletin:(id)a3;
+ (id)toUNCMuteAssertion:(id)a3;
+ (id)toUNCSectionIcon:(id)a3;
+ (id)toUNCSectionInfo:(id)a3 parentSection:(id)a4;
+ (id)toUNCSectionInfoDictionary:(id)a3;
+ (id)toUNCSectionInfoSettings:(id)a3;
+ (id)toUNCSectionInfos:(id)a3 parentSection:(id)a4;
+ (id)uncObjectFromBBObject:(id)a3;
+ (int64_t)toBBAnnounceCarPlaySetting:(int64_t)a3;
+ (int64_t)toBBAnnounceSetting:(int64_t)a3;
+ (int64_t)toBBContentPreviewSetting:(int64_t)a3;
+ (int64_t)toBBListDisplayStyleSetting:(int64_t)a3;
+ (int64_t)toBBScheduledDeliverySetting:(int64_t)a3;
+ (int64_t)toBBSectionCategory:(int64_t)a3;
+ (int64_t)toBBSectionType:(int64_t)a3;
+ (int64_t)toBBSystemSetting:(int64_t)a3;
+ (int64_t)toUNCAnnounceCarPlaySetting:(int64_t)a3;
+ (int64_t)toUNCAnnounceSetting:(int64_t)a3;
+ (int64_t)toUNCContentPreviewSetting:(int64_t)a3;
+ (int64_t)toUNCListDisplayStyleSetting:(int64_t)a3;
+ (int64_t)toUNCScheduledDeliverySetting:(int64_t)a3;
+ (int64_t)toUNCSectionCategory:(int64_t)a3;
+ (int64_t)toUNCSectionType:(int64_t)a3;
+ (int64_t)toUNCSystemSetting:(int64_t)a3;
+ (unint64_t)toBBFeed:(unint64_t)a3;
+ (unint64_t)toBBSettings:(unint64_t)a3;
+ (unint64_t)toUNCFeed:(unint64_t)a3;
+ (unint64_t)toUNCSettings:(unint64_t)a3;
@end

@implementation BBUNCoreConversion

+ (id)toUNCBulletin:(id)a3
{
  return (id)[a3 toUNCBulletin];
}

+ (id)toBBSectionInfo:(id)a3 parentSection:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [[BBSectionInfo alloc] initWithUNCSectionInfo:v6 parentSection:v5];

  return v7;
}

+ (id)toUNCSectionInfo:(id)a3 parentSection:(id)a4
{
  return (id)[a3 toUNCSectionInfoWithParentSection:a4];
}

+ (id)toBBSectionInfos:(id)a3 parentSection:(id)a4
{
  id v5 = a4;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __53__BBUNCoreConversion_toBBSectionInfos_parentSection___block_invoke;
  v9[3] = &unk_2642969F0;
  id v10 = v5;
  id v6 = v5;
  v7 = objc_msgSend(a3, "bs_compactMap:", v9);

  return v7;
}

id __53__BBUNCoreConversion_toBBSectionInfos_parentSection___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[BBUNCoreConversion toBBSectionInfo:a2 parentSection:*(void *)(a1 + 32)];
}

+ (id)toUNCSectionInfos:(id)a3 parentSection:(id)a4
{
  id v5 = a4;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __54__BBUNCoreConversion_toUNCSectionInfos_parentSection___block_invoke;
  v9[3] = &unk_264296A18;
  id v10 = v5;
  id v6 = v5;
  v7 = objc_msgSend(a3, "bs_compactMap:", v9);

  return v7;
}

id __54__BBUNCoreConversion_toUNCSectionInfos_parentSection___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[BBUNCoreConversion toUNCSectionInfo:a2 parentSection:*(void *)(a1 + 32)];
}

+ (id)bbObjectFromUNCObject:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [a1 toBBMuteAssertion:v4];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = [a1 toBBSectionIcon:v4];
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v5 = [a1 toBBSectionInfo:v4 parentSection:0];
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v5 = [a1 toBBSectionInfoSettings:v4];
        }
        else
        {
          id v5 = v4;
        }
      }
    }
  }
  id v6 = v5;

  return v6;
}

+ (id)uncObjectFromBBObject:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [a1 toUNCMuteAssertion:v4];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = [a1 toUNCSectionIcon:v4];
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v5 = [a1 toUNCSectionInfo:v4 parentSection:0];
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v5 = [a1 toUNCSectionInfoSettings:v4];
        }
        else
        {
          id v5 = v4;
        }
      }
    }
  }
  id v6 = v5;

  return v6;
}

+ (id)toBBSectionInfoDictionary:(id)a3
{
  id v4 = (void *)MEMORY[0x263EFF9A0];
  id v5 = a3;
  id v6 = [v4 dictionary];
  uint64_t v10 = MEMORY[0x263EF8330];
  uint64_t v11 = 3221225472;
  v12 = __48__BBUNCoreConversion_toBBSectionInfoDictionary___block_invoke;
  v13 = &unk_264296A40;
  id v14 = v6;
  id v15 = a1;
  id v7 = v6;
  [v5 enumerateKeysAndObjectsUsingBlock:&v10];

  v8 = objc_msgSend(v7, "copy", v10, v11, v12, v13);
  return v8;
}

void __48__BBUNCoreConversion_toBBSectionInfoDictionary___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = *(void **)(a1 + 40);
  id v6 = a2;
  id v7 = [v5 bbObjectFromUNCObject:a3];
  objc_msgSend(*(id *)(a1 + 32), "bs_setSafeObject:forKey:", v7, v6);
}

+ (id)toUNCSectionInfoDictionary:(id)a3
{
  id v4 = (void *)MEMORY[0x263EFF9A0];
  id v5 = a3;
  id v6 = [v4 dictionary];
  uint64_t v10 = MEMORY[0x263EF8330];
  uint64_t v11 = 3221225472;
  v12 = __49__BBUNCoreConversion_toUNCSectionInfoDictionary___block_invoke;
  v13 = &unk_264296A40;
  id v14 = v6;
  id v15 = a1;
  id v7 = v6;
  [v5 enumerateKeysAndObjectsUsingBlock:&v10];

  v8 = objc_msgSend(v7, "copy", v10, v11, v12, v13);
  return v8;
}

void __49__BBUNCoreConversion_toUNCSectionInfoDictionary___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = *(void **)(a1 + 40);
  id v6 = a2;
  id v7 = [v5 uncObjectFromBBObject:a3];
  objc_msgSend(*(id *)(a1 + 32), "bs_setSafeObject:forKey:", v7, v6);
}

+ (id)toBBSectionInfoSettings:(id)a3
{
  id v3 = a3;
  id v4 = [[BBSectionInfoSettings alloc] initWithUNCSectionInfoSettings:v3];

  return v4;
}

+ (id)toUNCSectionInfoSettings:(id)a3
{
  return (id)[a3 toUNCSectionInfoSettings];
}

+ (id)toBBSectionIcon:(id)a3
{
  id v3 = a3;
  id v4 = [[BBSectionIcon alloc] initWithUNCSectionIcon:v3];

  return v4;
}

+ (id)toUNCSectionIcon:(id)a3
{
  return (id)[a3 toUNCSectionIcon];
}

+ (unint64_t)toBBFeed:(unint64_t)a3
{
  return a3;
}

+ (unint64_t)toUNCFeed:(unint64_t)a3
{
  return a3;
}

+ (int64_t)toBBSectionType:(int64_t)a3
{
  return a3;
}

+ (int64_t)toUNCSectionType:(int64_t)a3
{
  return a3;
}

+ (int64_t)toBBSectionCategory:(int64_t)a3
{
  return a3;
}

+ (int64_t)toUNCSectionCategory:(int64_t)a3
{
  return a3;
}

+ (int64_t)toBBAnnounceCarPlaySetting:(int64_t)a3
{
  return a3;
}

+ (int64_t)toUNCAnnounceCarPlaySetting:(int64_t)a3
{
  return a3;
}

+ (int64_t)toBBAnnounceSetting:(int64_t)a3
{
  return a3;
}

+ (int64_t)toUNCAnnounceSetting:(int64_t)a3
{
  return a3;
}

+ (int64_t)toBBContentPreviewSetting:(int64_t)a3
{
  return a3;
}

+ (int64_t)toUNCContentPreviewSetting:(int64_t)a3
{
  return a3;
}

+ (int64_t)toBBListDisplayStyleSetting:(int64_t)a3
{
  return a3;
}

+ (int64_t)toUNCListDisplayStyleSetting:(int64_t)a3
{
  return a3;
}

+ (int64_t)toBBScheduledDeliverySetting:(int64_t)a3
{
  return a3;
}

+ (int64_t)toUNCScheduledDeliverySetting:(int64_t)a3
{
  return a3;
}

+ (int64_t)toBBSystemSetting:(int64_t)a3
{
  return a3;
}

+ (int64_t)toUNCSystemSetting:(int64_t)a3
{
  return a3;
}

+ (unint64_t)toBBSettings:(unint64_t)a3
{
  return a3;
}

+ (unint64_t)toUNCSettings:(unint64_t)a3
{
  return a3;
}

+ (id)toBBMuteAssertion:(id)a3
{
  return +[BBMuteAssertion assertionFromUNCMuteAssertion:a3];
}

+ (id)toUNCMuteAssertion:(id)a3
{
  return (id)[a3 toUNCMuteAssertion];
}

@end
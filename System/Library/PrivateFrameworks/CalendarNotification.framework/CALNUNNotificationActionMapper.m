@interface CALNUNNotificationActionMapper
+ (id)_calnNotificationActionFromUNNotificationAction:(id)a3;
+ (id)_unNotificationActionFromCALNNotificationAction:(id)a3;
+ (id)calnNotificationActionsFromUNNotificationActions:(id)a3;
+ (id)unNotificationActionsFromCALNNotificationActions:(id)a3;
@end

@implementation CALNUNNotificationActionMapper

+ (id)unNotificationActionsFromCALNNotificationActions:(id)a3
{
  v4 = (void *)MEMORY[0x263EFF980];
  id v5 = a3;
  v6 = [v4 array];
  uint64_t v10 = MEMORY[0x263EF8330];
  uint64_t v11 = 3221225472;
  v12 = __83__CALNUNNotificationActionMapper_unNotificationActionsFromCALNNotificationActions___block_invoke;
  v13 = &unk_2645C0CC8;
  id v14 = v6;
  id v15 = a1;
  id v7 = v6;
  [v5 enumerateObjectsUsingBlock:&v10];

  v8 = objc_msgSend(v7, "copy", v10, v11, v12, v13);
  return v8;
}

void __83__CALNUNNotificationActionMapper_unNotificationActionsFromCALNNotificationActions___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(a1 + 40) _unNotificationActionFromCALNNotificationAction:a2];
  [*(id *)(a1 + 32) addObject:v3];
}

+ (id)calnNotificationActionsFromUNNotificationActions:(id)a3
{
  v4 = (void *)MEMORY[0x263EFF980];
  id v5 = a3;
  v6 = [v4 array];
  uint64_t v10 = MEMORY[0x263EF8330];
  uint64_t v11 = 3221225472;
  v12 = __83__CALNUNNotificationActionMapper_calnNotificationActionsFromUNNotificationActions___block_invoke;
  v13 = &unk_2645C0CF0;
  id v14 = v6;
  id v15 = a1;
  id v7 = v6;
  [v5 enumerateObjectsUsingBlock:&v10];

  v8 = objc_msgSend(v7, "copy", v10, v11, v12, v13);
  return v8;
}

void __83__CALNUNNotificationActionMapper_calnNotificationActionsFromUNNotificationActions___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(a1 + 40) _calnNotificationActionFromUNNotificationAction:a2];
  [*(id *)(a1 + 32) addObject:v3];
}

+ (id)_unNotificationActionFromCALNNotificationAction:(id)a3
{
  id v3 = a3;
  v4 = [v3 identifier];
  id v5 = [v3 title];
  v6 = [v3 systemImageName];
  id v7 = [v3 url];

  if (v6)
  {
    v8 = [MEMORY[0x263F1DF18] iconWithSystemImageName:v6];
  }
  else
  {
    v8 = 0;
  }
  if (v7) {
    [MEMORY[0x263F1DF10] actionWithIdentifier:v4 title:v5 url:v7 options:0 icon:v8];
  }
  else {
  v9 = [MEMORY[0x263F1DF10] actionWithIdentifier:v4 title:v5 options:0 icon:v8];
  }

  return v9;
}

+ (id)_calnNotificationActionFromUNNotificationAction:(id)a3
{
  id v3 = a3;
  v4 = [v3 identifier];
  id v5 = [v3 title];
  v6 = [v3 icon];
  id v7 = [v6 imageName];
  v8 = [v3 url];

  v9 = +[CALNNotificationAction actionWithIdentifier:v4 title:v5 systemImageName:v7 url:v8];

  return v9;
}

@end
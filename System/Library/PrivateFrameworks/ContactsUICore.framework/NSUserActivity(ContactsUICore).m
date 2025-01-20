@interface NSUserActivity(ContactsUICore)
+ (id)_cnui_searchMailUserActivityForContact:()ContactsUICore;
+ (id)_cnui_sendMessageIntentWithHandle:()ContactsUICore contact:;
+ (id)_cnui_startAudioCallIntentWithHandle:()ContactsUICore contact:;
+ (id)_cnui_startVideoCallIntentWithHandle:()ContactsUICore contact:;
+ (id)_cnui_userActivityWithActivityType:()ContactsUICore handle:contact:intentWithPerson:;
@end

@implementation NSUserActivity(ContactsUICore)

+ (id)_cnui_startAudioCallIntentWithHandle:()ContactsUICore contact:
{
  id v6 = a4;
  id v7 = a3;
  v8 = (objc_class *)objc_opt_class();
  v9 = NSStringFromClass(v8);
  v10 = objc_msgSend(a1, "_cnui_userActivityWithActivityType:handle:contact:intentWithPerson:", v9, v7, v6, &__block_literal_global_33);

  return v10;
}

+ (id)_cnui_startVideoCallIntentWithHandle:()ContactsUICore contact:
{
  id v6 = a4;
  id v7 = a3;
  v8 = (objc_class *)objc_opt_class();
  v9 = NSStringFromClass(v8);
  v10 = objc_msgSend(a1, "_cnui_userActivityWithActivityType:handle:contact:intentWithPerson:", v9, v7, v6, &__block_literal_global_3_1);

  return v10;
}

+ (id)_cnui_sendMessageIntentWithHandle:()ContactsUICore contact:
{
  id v6 = a4;
  id v7 = a3;
  v8 = (objc_class *)objc_opt_class();
  v9 = NSStringFromClass(v8);
  v10 = objc_msgSend(a1, "_cnui_userActivityWithActivityType:handle:contact:intentWithPerson:", v9, v7, v6, &__block_literal_global_6_0);

  return v10;
}

+ (id)_cnui_userActivityWithActivityType:()ContactsUICore handle:contact:intentWithPerson:
{
  id v9 = a3;
  id v10 = a5;
  v11 = a6;
  id v12 = a4;
  if ([v10 hasBeenPersisted])
  {
    v13 = [v10 identifier];
  }
  else
  {
    v13 = 0;
  }
  id v14 = objc_alloc(MEMORY[0x263F0FD18]);
  v15 = +[CNHandle inPersonHandleForHandle:v12];
  v16 = [v12 customIdentifier];

  v17 = (void *)[v14 initWithPersonHandle:v15 nameComponents:0 displayName:0 image:0 contactIdentifier:v13 customIdentifier:v16];
  v18 = v11[2](v11, v17);

  if (v18)
  {
    v19 = (void *)[objc_alloc(MEMORY[0x263F0FBD8]) initWithIntent:v18 response:0];
    v20 = (void *)[objc_alloc(MEMORY[0x263F08D38]) initWithActivityType:v9];
    [v20 _setInteraction:v19 donate:0];
  }
  else
  {
    v20 = 0;
  }

  return v20;
}

+ (id)_cnui_searchMailUserActivityForContact:()ContactsUICore
{
  v9[1] = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263EFEA20] stringFromContact:a3 style:0];
  if ([v3 length])
  {
    id v4 = objc_alloc(MEMORY[0x263F08D38]);
    v5 = (void *)[v4 initWithActivityType:*MEMORY[0x263F01CC0]];
    uint64_t v8 = *MEMORY[0x263F01CD8];
    v9[0] = v3;
    id v6 = [NSDictionary dictionaryWithObjects:v9 forKeys:&v8 count:1];
    [v5 setUserInfo:v6];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

@end
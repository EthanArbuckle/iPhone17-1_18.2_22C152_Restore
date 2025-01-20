@interface DSUIUtilities
+ (BOOL)isPlaceholderForApp:(id)a3;
+ (id)appIconForAppID:(id)a3 format:(int)a4;
+ (id)setUpBoldButtonForController:(id)a3 title:(id)a4 target:(id)a5 selector:(SEL)a6;
+ (id)setUpLearnMoreButtonForController:(id)a3 selector:(SEL)a4;
+ (id)setUpLinkButtonForController:(id)a3 title:(id)a4 target:(id)a5 selector:(SEL)a6;
+ (id)valueForUnfinalizedString:(id)a3;
@end

@implementation DSUIUtilities

+ (id)setUpBoldButtonForController:(id)a3 title:(id)a4 target:(id)a5 selector:(SEL)a6
{
  v9 = (void *)MEMORY[0x263F5B898];
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  v13 = [v9 boldButton];
  [v13 setTitle:v11 forState:0];

  [v13 addTarget:v10 action:a6 forControlEvents:64];
  v14 = [v12 buttonTray];

  [v14 addButton:v13];
  return v13;
}

+ (id)setUpLinkButtonForController:(id)a3 title:(id)a4 target:(id)a5 selector:(SEL)a6
{
  v9 = (void *)MEMORY[0x263F5B8D0];
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  v13 = [v9 linkButton];
  [v13 setTitle:v11 forState:0];

  [v13 addTarget:v10 action:a6 forControlEvents:64];
  v14 = [v12 buttonTray];

  [v14 addButton:v13];
  return v13;
}

+ (id)setUpLearnMoreButtonForController:(id)a3 selector:(SEL)a4
{
  v5 = (void *)MEMORY[0x263F5B8B8];
  id v6 = a3;
  v7 = [v5 accessoryButton];
  v8 = DSUILocStringForKey(@"LEARN_MORE");
  [v7 setTitle:v8 forState:0];

  [v7 addTarget:v6 action:a4 forControlEvents:64];
  v9 = [v6 headerView];

  [v9 addAccessoryButton:v7];
  return v7;
}

+ (id)appIconForAppID:(id)a3 format:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  v5 = (void *)MEMORY[0x263F827E8];
  id v6 = (void *)MEMORY[0x263F82B60];
  id v7 = a3;
  v8 = [v6 mainScreen];
  [v8 scale];
  v9 = objc_msgSend(v5, "_applicationIconImageForBundleIdentifier:format:scale:", v7, v4);

  return v9;
}

+ (BOOL)isPlaceholderForApp:(id)a3
{
  v3 = (objc_class *)MEMORY[0x263F01878];
  id v4 = a3;
  id v5 = [v3 alloc];
  uint64_t v9 = 0;
  char v6 = 1;
  id v7 = (void *)[v5 initWithBundleIdentifier:v4 allowPlaceholder:1 error:&v9];

  if (!v9) {
    char v6 = [v7 isPlaceholder];
  }

  return v6;
}

+ (id)valueForUnfinalizedString:(id)a3
{
  id v3 = a3;
  if ([v3 hasSuffix:@"<no loc>"])
  {
    id v4 = [v3 stringByReplacingOccurrencesOfString:@"<no loc>" withString:&stru_26E9097D0];
  }
  else
  {
    id v4 = v3;
  }
  id v5 = v4;

  return v5;
}

@end
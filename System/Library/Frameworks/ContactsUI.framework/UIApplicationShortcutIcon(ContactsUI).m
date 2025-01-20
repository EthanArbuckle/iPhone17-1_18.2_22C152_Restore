@interface UIApplicationShortcutIcon(ContactsUI)
+ (id)iconWithContact:()ContactsUI;
@end

@implementation UIApplicationShortcutIcon(ContactsUI)

+ (id)iconWithContact:()ContactsUI
{
  id v4 = a3;
  int v5 = [v4 hasBeenPersisted];
  id v6 = objc_alloc(MEMORY[0x1E4FA69C0]);
  if (v5)
  {
    v7 = [v4 identifier];

    v8 = (void *)[v6 initWithContactIdentifier:v7];
  }
  else
  {
    v7 = [v4 givenName];
    v9 = [v4 familyName];

    v8 = (void *)[v6 initWithFirstName:v7 lastName:v9];
  }

  v10 = (void *)[[a1 alloc] initWithSBSApplicationShortcutIcon:v8];

  return v10;
}

@end
@interface CNContactViewController(MessageUI)
+ (id)_mf_viewControllerForUnknownContactWithEmailAddress:()MessageUI;
@end

@implementation CNContactViewController(MessageUI)

+ (id)_mf_viewControllerForUnknownContactWithEmailAddress:()MessageUI
{
  id v3 = a3;
  v4 = (void *)[objc_alloc(MEMORY[0x1E4F607F8]) initWithString:v3];
  v5 = [v4 displayName];
  v6 = objc_msgSend(v5, "ec_personNameComponents");

  v7 = objc_msgSend(MEMORY[0x1E4F1B8F8], "em_contactWithPersonNameComponents:emailAddress:emailAddressLabel:", v6, v3, 0);
  v8 = [MEMORY[0x1E4F1BBA8] viewControllerForUnknownContact:v7];
  v9 = [MEMORY[0x1E4F1B910] stringFromContact:v7 style:0];
  if (![v9 length]) {
    [v8 setPrimaryPropertyKey:*MEMORY[0x1E4F1ADC8]];
  }

  return v8;
}

@end
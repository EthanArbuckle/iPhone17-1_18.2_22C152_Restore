@interface EKRecents
+ (BOOL)recordRecentForContactWithName:(id)a3 emailAddress:(id)a4 phoneNumber:(id)a5;
+ (Class)crRecentContactsLibraryClass;
+ (id)crAddressKindEmailString;
+ (id)crAddressKindPhoneNumberString;
+ (id)crRecentsDomainCalendarString;
+ (id)recentForContactWithAddress:(id)a3 name:(id)a4 kind:(id)a5;
+ (void)recordRecentWithAddress:(id)a3 name:(id)a4 kind:(id)a5;
@end

@implementation EKRecents

+ (Class)crRecentContactsLibraryClass
{
  if (crRecentContactsLibraryClass_onceToken != -1) {
    dispatch_once(&crRecentContactsLibraryClass_onceToken, &__block_literal_global_17);
  }
  v2 = (void *)crRecentContactsLibraryClass_crRecentContactsLibraryClass;

  return (Class)v2;
}

uint64_t __41__EKRecents_crRecentContactsLibraryClass__block_invoke()
{
  uint64_t result = EKWeakLinkClass();
  crRecentContactsLibraryClass_crRecentContactsLibraryClass = result;
  return result;
}

+ (id)crAddressKindEmailString
{
  if (crAddressKindEmailString_onceToken != -1) {
    dispatch_once(&crAddressKindEmailString_onceToken, &__block_literal_global_3);
  }
  v2 = (void *)crAddressKindEmailString_crAddressKindEmailString;

  return v2;
}

uint64_t __37__EKRecents_crAddressKindEmailString__block_invoke()
{
  uint64_t v0 = EKWeakLinkStringConstant();
  uint64_t v1 = crAddressKindEmailString_crAddressKindEmailString;
  crAddressKindEmailString_crAddressKindEmailString = v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

+ (id)crAddressKindPhoneNumberString
{
  if (crAddressKindPhoneNumberString_onceToken != -1) {
    dispatch_once(&crAddressKindPhoneNumberString_onceToken, &__block_literal_global_6);
  }
  v2 = (void *)crAddressKindPhoneNumberString_crAddressKindPhoneNumberString;

  return v2;
}

uint64_t __43__EKRecents_crAddressKindPhoneNumberString__block_invoke()
{
  uint64_t v0 = EKWeakLinkStringConstant();
  uint64_t v1 = crAddressKindPhoneNumberString_crAddressKindPhoneNumberString;
  crAddressKindPhoneNumberString_crAddressKindPhoneNumberString = v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

+ (id)crRecentsDomainCalendarString
{
  if (crRecentsDomainCalendarString_onceToken != -1) {
    dispatch_once(&crRecentsDomainCalendarString_onceToken, &__block_literal_global_9_4);
  }
  v2 = (void *)crRecentsDomainCalendarString_crRecentsDomainCalendarString;

  return v2;
}

uint64_t __42__EKRecents_crRecentsDomainCalendarString__block_invoke()
{
  uint64_t v0 = EKWeakLinkStringConstant();
  uint64_t v1 = crRecentsDomainCalendarString_crRecentsDomainCalendarString;
  crRecentsDomainCalendarString_crRecentsDomainCalendarString = v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

+ (id)recentForContactWithAddress:(id)a3 name:(id)a4 kind:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = (void *)[a1 crRecentContactsLibraryClass];
  v12 = [MEMORY[0x1E4F1C9C8] date];
  v13 = [v11 recentEventForAddress:v10 displayName:v9 kind:v8 date:v12 weight:0 metadata:0 options:1];

  return v13;
}

+ (void)recordRecentWithAddress:(id)a3 name:(id)a4 kind:(id)a5
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if (!v9) {
    id v9 = v8;
  }
  id v10 = [a1 recentForContactWithAddress:v8 name:v9 kind:a5];
  v11 = objc_msgSend((id)objc_msgSend(a1, "crRecentContactsLibraryClass"), "defaultInstance");
  v14[0] = v10;
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
  v13 = [a1 crRecentsDomainCalendarString];
  [v11 recordContactEvents:v12 recentsDomain:v13 sendingAddress:0 completion:0];
}

+ (BOOL)recordRecentForContactWithName:(id)a3 emailAddress:(id)a4 phoneNumber:(id)a5
{
  id v8 = a3;
  unint64_t v9 = (unint64_t)a4;
  unint64_t v10 = (unint64_t)a5;
  if (v9)
  {
    v11 = [a1 crAddressKindEmailString];
    [a1 recordRecentWithAddress:v9 name:v8 kind:v11];
  }
  if (v10)
  {
    v12 = [a1 crAddressKindPhoneNumberString];
    [a1 recordRecentWithAddress:v10 name:v8 kind:v12];
  }
  return (v9 | v10) != 0;
}

@end
@interface TUDialRequest(ContactsUICore)
- (id)cn_initWithProvider:()ContactsUICore;
- (id)cn_initWithURL:()ContactsUICore;
- (void)cn_configureForUserActions:()ContactsUICore;
@end

@implementation TUDialRequest(ContactsUICore)

- (id)cn_initWithProvider:()ContactsUICore
{
  id v4 = a1;
  v5 = (void *)[v4 initWithProvider:a3];
  objc_msgSend(v4, "cn_configureForUserActions:", v5);
  return v5;
}

- (id)cn_initWithURL:()ContactsUICore
{
  id v4 = a1;
  v5 = (void *)[v4 initWithURL:a3];
  if (v5)
  {
    objc_msgSend(v4, "cn_configureForUserActions:", v5);
    id v6 = v5;
  }

  return v5;
}

- (void)cn_configureForUserActions:()ContactsUICore
{
  id v5 = a3;
  v3 = [v5 provider];
  int v4 = [v3 isTelephonyProvider];

  if (v4) {
    [v5 setPreferDefaultApp:0];
  }
}

@end
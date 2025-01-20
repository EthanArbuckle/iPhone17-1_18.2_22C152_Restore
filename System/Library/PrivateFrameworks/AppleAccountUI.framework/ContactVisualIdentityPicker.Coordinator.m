@interface ContactVisualIdentityPicker.Coordinator
- (_TtCV14AppleAccountUI27ContactVisualIdentityPicker11Coordinator)init;
- (void)visualIdentityPicker:(id)a3 didUpdatePhotoForVisualIdentity:(id)a4 withContactImage:(id)a5;
- (void)visualIdentityPickerDidCancel:(id)a3;
@end

@implementation ContactVisualIdentityPicker.Coordinator

- (void)visualIdentityPickerDidCancel:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_20984BBA0(a3);
}

- (void)visualIdentityPicker:(id)a3 didUpdatePhotoForVisualIdentity:(id)a4 withContactImage:(id)a5
{
  id v6 = a3;
  id v7 = a4;
  id v8 = a5;
  v9 = self;
  sub_20984C00C(a3, a4, (uint64_t)a5);
}

- (_TtCV14AppleAccountUI27ContactVisualIdentityPicker11Coordinator)init
{
  return (_TtCV14AppleAccountUI27ContactVisualIdentityPicker11Coordinator *)sub_20984EB80();
}

- (void).cxx_destruct
{
}

@end
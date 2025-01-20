@interface iOSPeoplePickerAddButtonHandler
- (_TtC15ConversationKit31iOSPeoplePickerAddButtonHandler)init;
- (void)contactPicker:(id)a3 didSelectContactProperty:(id)a4;
- (void)contactPickerDidCancel:(id)a3;
@end

@implementation iOSPeoplePickerAddButtonHandler

- (_TtC15ConversationKit31iOSPeoplePickerAddButtonHandler)init
{
  return (_TtC15ConversationKit31iOSPeoplePickerAddButtonHandler *)iOSPeoplePickerAddButtonHandler.init()();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15ConversationKit31iOSPeoplePickerAddButtonHandler_presenterViewController));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15ConversationKit31iOSPeoplePickerAddButtonHandler_contactsSearchViewController));
  uint64_t v3 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR____TtC15ConversationKit31iOSPeoplePickerAddButtonHandler_addToken);
  outlined consume of (@escaping @callee_guaranteed (@unowned CGRect, @unowned Bool) -> ())?(v3);
}

- (void)contactPicker:(id)a3 didSelectContactProperty:(id)a4
{
  v6 = (CNContactPickerViewController *)a3;
  id v7 = a4;
  v8 = self;
  iOSPeoplePickerAddButtonHandler.contactPicker(_:didSelect:)(v6, (CNContactProperty)v7);
}

- (void)contactPickerDidCancel:(id)a3
{
  v4 = (CNContactPickerViewController *)a3;
  v5 = self;
  iOSPeoplePickerAddButtonHandler.contactPickerDidCancel(_:)(v4);
}

@end
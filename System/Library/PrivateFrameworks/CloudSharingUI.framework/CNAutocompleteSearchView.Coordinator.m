@interface CNAutocompleteSearchView.Coordinator
- (_TtCV14CloudSharingUIP33_4A02DC1A08FD7B0E3BB88ACABE05D63D24CNAutocompleteSearchView11Coordinator)init;
- (id)searchController:(id)a3 composeRecipientForAddress:(id)a4;
- (uint64_t)searchController:(void *)a3 didAddRecipient:(void *)a4;
- (void)didTapTextViewAccessoryButtonForSearchController:(id)a3 anchoredToView:(id)a4;
- (void)searchController:(id)a3 didTapTableAccessoryForRecipient:(id)a4;
@end

@implementation CNAutocompleteSearchView.Coordinator

- (id)searchController:(id)a3 composeRecipientForAddress:(id)a4
{
  sub_2180CFE50();
  id v6 = objc_allocWithZone(MEMORY[0x263F33430]);
  id v7 = a3;
  v8 = self;
  v9 = (void *)sub_2180CFE10();
  id v10 = objc_msgSend(v6, sel_initWithContact_address_kind_, 0, v9, 0);

  swift_bridgeObjectRelease();

  return v10;
}

- (uint64_t)searchController:(void *)a3 didAddRecipient:(void *)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = a1;
  id v9 = objc_msgSend(v6, sel_recipients);
  sub_2180AEA60(0, (unint64_t *)&unk_267BBDEA0);
  unint64_t v10 = sub_2180CFEA0();

  sub_2180BFF80(v10);

  return swift_bridgeObjectRelease();
}

- (void)didTapTextViewAccessoryButtonForSearchController:(id)a3 anchoredToView:(id)a4
{
  v4 = *(void (**)())(*(char **)((char *)&self->super.isa
                                          + OBJC_IVAR____TtCV14CloudSharingUIP33_4A02DC1A08FD7B0E3BB88ACABE05D63D24CNAutocompleteSearchView11Coordinator_viewModel)
                               + OBJC_IVAR____TtC14CloudSharingUI19AddressingViewModel_showContactPickerDidClick);
  if (v4)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    id v8 = a3;
    id v9 = a4;
    unint64_t v10 = self;
    sub_2180AC708((uint64_t)v4);
    sub_2180CF720();
    swift_release();
    swift_release();
    v4();
    sub_2180AC8B8((uint64_t)v4);

    swift_bridgeObjectRelease();
  }
}

- (void)searchController:(id)a3 didTapTableAccessoryForRecipient:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  sub_2180BF9CC(v6, v7);
}

- (_TtCV14CloudSharingUIP33_4A02DC1A08FD7B0E3BB88ACABE05D63D24CNAutocompleteSearchView11Coordinator)init
{
  result = (_TtCV14CloudSharingUIP33_4A02DC1A08FD7B0E3BB88ACABE05D63D24CNAutocompleteSearchView11Coordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end
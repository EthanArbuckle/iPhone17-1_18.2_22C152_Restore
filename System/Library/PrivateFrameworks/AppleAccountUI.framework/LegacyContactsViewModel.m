@interface LegacyContactsViewModel
- (_TtC14AppleAccountUI23LegacyContactsViewModel)init;
- (void)fetchAllTrustedContacts;
- (void)finishingRepair;
- (void)startingRepair;
@end

@implementation LegacyContactsViewModel

- (void)fetchAllTrustedContacts
{
  v2 = self;
  sub_2098493BC();
}

- (void)startingRepair
{
  v2 = self;
  sub_20984A0FC();
}

- (void)finishingRepair
{
  v2 = self;
  sub_20984A318();
}

- (_TtC14AppleAccountUI23LegacyContactsViewModel)init
{
  return (_TtC14AppleAccountUI23LegacyContactsViewModel *)sub_20984A58C();
}

- (void).cxx_destruct
{
  uint64_t v2 = OBJC_IVAR____TtC14AppleAccountUI23LegacyContactsViewModel__trustedContacts;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2675EE6A8);
  v4 = *(void (**)(char *))(*(void *)(v3 - 8) + 8);
  v4((char *)self + v2);
  ((void (*)(char *, uint64_t))v4)((char *)self + OBJC_IVAR____TtC14AppleAccountUI23LegacyContactsViewModel__trustedContactOwners, v3);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14AppleAccountUI23LegacyContactsViewModel_accountManager));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14AppleAccountUI23LegacyContactsViewModel_contactsProvider));
  sub_2097EBD24();
}

@end
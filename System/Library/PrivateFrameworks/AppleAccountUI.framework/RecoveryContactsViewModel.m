@interface RecoveryContactsViewModel
- (_TtC14AppleAccountUI25RecoveryContactsViewModel)init;
- (void)fetchAllTrustedContacts;
- (void)finishingRepair;
- (void)startingRepair;
@end

@implementation RecoveryContactsViewModel

- (void)fetchAllTrustedContacts
{
  v2 = self;
  sub_2097DAF50();
}

- (void)startingRepair
{
  v2 = self;
  sub_2097DEFBC();
}

- (void)finishingRepair
{
  v2 = self;
  sub_2097DF1D8();
}

- (_TtC14AppleAccountUI25RecoveryContactsViewModel)init
{
  return (_TtC14AppleAccountUI25RecoveryContactsViewModel *)sub_2097DF47C();
}

- (void).cxx_destruct
{
  uint64_t v2 = OBJC_IVAR____TtC14AppleAccountUI25RecoveryContactsViewModel__trustedContacts;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2675EE6A8);
  v4 = *(void (**)(char *))(*(void *)(v3 - 8) + 8);
  v4((char *)self + v2);
  ((void (*)(char *, uint64_t))v4)((char *)self + OBJC_IVAR____TtC14AppleAccountUI25RecoveryContactsViewModel__trustedContactOwners, v3);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14AppleAccountUI25RecoveryContactsViewModel_accountManager));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14AppleAccountUI25RecoveryContactsViewModel_contactsProvider));

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14AppleAccountUI25RecoveryContactsViewModel_custodianController));
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14AppleAccountUI25RecoveryContactsViewModel_repairHelper));
}

@end
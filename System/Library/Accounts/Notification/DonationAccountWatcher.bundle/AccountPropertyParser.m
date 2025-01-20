@interface AccountPropertyParser
- (_TtC22DonationAccountWatcher21AccountPropertyParser)init;
@end

@implementation AccountPropertyParser

- (_TtC22DonationAccountWatcher21AccountPropertyParser)init
{
  result = (_TtC22DonationAccountWatcher21AccountPropertyParser *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC22DonationAccountWatcher21AccountPropertyParser_donationDate;
  uint64_t v4 = sub_240597B38();
  v6 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);
  ((void (*)(void *__return_ptr, char *, uint64_t))v6)((void *)(v4 - 8), v3, v4);
  v5 = (char *)self + OBJC_IVAR____TtC22DonationAccountWatcher21AccountPropertyParser_expirationDate;
  v6(v5, v4);
}

@end
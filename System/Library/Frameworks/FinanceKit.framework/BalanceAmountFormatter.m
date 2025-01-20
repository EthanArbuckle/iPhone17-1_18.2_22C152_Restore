@interface BalanceAmountFormatter
- (_TtC10FinanceKit22BalanceAmountFormatter)init;
@end

@implementation BalanceAmountFormatter

- (_TtC10FinanceKit22BalanceAmountFormatter)init
{
  result = (_TtC10FinanceKit22BalanceAmountFormatter *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC10FinanceKit22BalanceAmountFormatter_locale;
  uint64_t v4 = sub_243957560();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self + OBJC_IVAR____TtC10FinanceKit22BalanceAmountFormatter_signDisplayStrategy;
  uint64_t v6 = sub_243956E50();
  v7 = *(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8);

  v7(v5, v6);
}

@end
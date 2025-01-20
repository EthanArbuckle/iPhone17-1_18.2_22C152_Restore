@interface OrderImportControllerProvider
+ (id)makeViewControllerWithBundleURL:(id)a3 competion:(id)a4 error:(id *)a5;
+ (id)makeViewControllerWithOrderData:(id)a3 competion:(id)a4 error:(id *)a5;
- (_TtC12FinanceKitUI29OrderImportControllerProvider)init;
@end

@implementation OrderImportControllerProvider

+ (id)makeViewControllerWithBundleURL:(id)a3 competion:(id)a4 error:(id *)a5
{
  uint64_t v6 = sub_243DFBC00();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  sub_243DFBB70();
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v10;
  uint64_t v12 = sub_243DFBC10();
  unint64_t v14 = v13;
  v15 = sub_243DF6148(v12, v13, (uint64_t)sub_243DF86F4, v11);
  sub_243A6BE54(v12, v14);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  swift_release();

  return v15;
}

+ (id)makeViewControllerWithOrderData:(id)a3 competion:(id)a4 error:(id *)a5
{
  uint64_t v6 = _Block_copy(a4);
  id v7 = a3;
  uint64_t v8 = sub_243DFBC50();
  unint64_t v10 = v9;

  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v6;
  uint64_t v12 = sub_243DF6148(v8, v10, (uint64_t)sub_243DF7964, v11);
  swift_release();
  sub_243A6BE54(v8, v10);

  return v12;
}

- (_TtC12FinanceKitUI29OrderImportControllerProvider)init
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return [(OrderImportControllerProvider *)&v3 init];
}

@end
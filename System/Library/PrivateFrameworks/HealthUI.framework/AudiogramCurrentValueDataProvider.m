@interface AudiogramCurrentValueDataProvider
- (_TtC8HealthUI33AudiogramCurrentValueDataProvider)init;
- (id)attributedStringWithDisplayType:(id)a3 unitController:(id)a4 valueFont:(id)a5 unitFont:(id)a6 dateCache:(id)a7;
- (id)attributedSupplementaryStringWithDisplayType:(id)a3 unitController:(id)a4 font:(id)a5;
- (id)lastUpdatedDescriptionWithDateCache:(id)a3;
- (id)lastUpdatedShortDescriptionWithDateCache:(id)a3;
@end

@implementation AudiogramCurrentValueDataProvider

- (id)lastUpdatedDescriptionWithDateCache:(id)a3
{
  return sub_1E0E18CC0(self, (uint64_t)a2, a3, (void (*)(id))sub_1E0E189FC);
}

- (id)lastUpdatedShortDescriptionWithDateCache:(id)a3
{
  return sub_1E0E18CC0(self, (uint64_t)a2, a3, (void (*)(id))sub_1E0E18B5C);
}

- (id)attributedStringWithDisplayType:(id)a3 unitController:(id)a4 valueFont:(id)a5 unitFont:(id)a6 dateCache:(id)a7
{
  v13 = self;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  v19 = self;
  id v20 = objc_msgSend(v13, sel_labelColor);
  id v21 = objc_msgSend(v13, sel_secondaryLabelColor);
  sub_1E0E1962C(v14, v15, a5, v20, a6, v21);
  v23 = v22;

  return v23;
}

- (id)attributedSupplementaryStringWithDisplayType:(id)a3 unitController:(id)a4 font:(id)a5
{
  return 0;
}

- (_TtC8HealthUI33AudiogramCurrentValueDataProvider)init
{
  result = (_TtC8HealthUI33AudiogramCurrentValueDataProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8HealthUI33AudiogramCurrentValueDataProvider_healthStore);
}

@end
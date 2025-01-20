@interface HRMedicalRecordFormatter
- (HRMedicalRecordFormatter)init;
- (HRMedicalRecordFormatter)initWithConceptStore:(id)a3 context:(int64_t)a4;
- (id)attachmentItemsFromRecord:(id)a3;
- (id)attachmentItemsTitleFromRecord:(id)a3;
- (id)displayItemsFromRecord:(id)a3;
- (id)structuredItemsFromRecord:(id)a3;
@end

@implementation HRMedicalRecordFormatter

- (id)structuredItemsFromRecord:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1C243D798(v4);

  sub_1C2270C24();
  v6 = (void *)sub_1C254F700();
  swift_bridgeObjectRelease();
  return v6;
}

- (HRMedicalRecordFormatter)initWithConceptStore:(id)a3 context:(int64_t)a4
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___HRMedicalRecordFormatter_store) = (Class)a3;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___HRMedicalRecordFormatter_context) = (Class)a4;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for MedicalRecordFormatter();
  id v5 = a3;
  return [(HRMedicalRecordFormatter *)&v7 init];
}

- (id)displayItemsFromRecord:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_1C243EF88(v4);

  sub_1C21AB51C(0, (unint64_t *)&qword_1EA2DE708);
  v6 = (void *)sub_1C254F700();
  swift_bridgeObjectRelease();
  return v6;
}

- (id)attachmentItemsFromRecord:(id)a3
{
  sub_1C2270C24();
  v3 = (void *)sub_1C254F700();
  return v3;
}

- (id)attachmentItemsTitleFromRecord:(id)a3
{
  return 0;
}

- (HRMedicalRecordFormatter)init
{
  result = (HRMedicalRecordFormatter *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end
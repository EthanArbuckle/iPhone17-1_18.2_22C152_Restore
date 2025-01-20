@interface AllowedFieldValuesTreatmentAction
- (_TtC9JetEngine33AllowedFieldValuesTreatmentAction)initWithField:(id)a3 configuration:(id)a4;
- (id)performAction:(id)a3 context:(id)a4;
@end

@implementation AllowedFieldValuesTreatmentAction

- (_TtC9JetEngine33AllowedFieldValuesTreatmentAction)initWithField:(id)a3 configuration:(id)a4
{
  if (a3)
  {
    uint64_t v4 = sub_19F1DBD7C();
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v6 = 0;
  }
  uint64_t v7 = sub_19F1DBB3C();
  return (_TtC9JetEngine33AllowedFieldValuesTreatmentAction *)AllowedFieldValuesTreatmentAction.init(field:configuration:)(v4, v6, v7);
}

- (id)performAction:(id)a3 context:(id)a4
{
  if (a3)
  {
    id v6 = a4;
    uint64_t v7 = self;
    swift_unknownObjectRetain();
    sub_19F1DCBEC();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v18, 0, sizeof(v18));
    id v8 = a4;
    v9 = self;
  }
  AllowedFieldValuesTreatmentAction.perform(_:context:)((uint64_t)v18, (uint64_t)v19);

  sub_19EEBD664((uint64_t)v18, &qword_1EB393260);
  uint64_t v10 = v20;
  if (v20)
  {
    v11 = __swift_project_boxed_opaque_existential_1(v19, v20);
    uint64_t v12 = *(void *)(v10 - 8);
    double v13 = MEMORY[0x1F4188790](v11);
    v15 = (char *)v18 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *, double))(v12 + 16))(v15, v13);
    v16 = (void *)sub_19F1DD42C();
    (*(void (**)(char *, uint64_t))(v12 + 8))(v15, v10);
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v19);
  }
  else
  {
    v16 = 0;
  }
  return v16;
}

- (void).cxx_destruct
{
}

@end
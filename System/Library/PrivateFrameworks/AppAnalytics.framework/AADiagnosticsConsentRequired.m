@interface AADiagnosticsConsentRequired
- (AADiagnosticsConsentRequired)init;
- (AADiagnosticsConsentRequired)initWithData:(id)a3;
- (id)toJsonValueAndReturnError:(id *)a3;
@end

@implementation AADiagnosticsConsentRequired

- (AADiagnosticsConsentRequired)initWithData:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___AADiagnosticsConsentRequired_data) = (Class)a3;
  v8.receiver = self;
  v8.super_class = ObjectType;
  id v6 = a3;
  return [(AADiagnosticsConsentRequired *)&v8 init];
}

- (AADiagnosticsConsentRequired)init
{
  result = (AADiagnosticsConsentRequired *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

- (id)toJsonValueAndReturnError:(id *)a3
{
  v3 = self;
  sub_1A915C488(&v7);
  if (v8)
  {
    sub_1A90A1A68(&v7, &v9);
  }
  else
  {
    id v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F1CA98]), sel_init);
    unint64_t v10 = sub_1A90B27E0();
    *(void *)&long long v9 = v4;
    sub_1A909B5DC((uint64_t)&v7);
  }

  __swift_project_boxed_opaque_existential_1(&v9, v10);
  v5 = (void *)sub_1A916B9D0();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)&v9);

  return v5;
}

@end
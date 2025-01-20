@interface AADiagnosticsConsentProvider
+ (AADiagnosticsConsentProvider)allowed;
+ (AADiagnosticsConsentProvider)default;
+ (AADiagnosticsConsentProvider)disallowed;
+ (id)custom:(id)a3;
- (AADiagnosticsConsentProvider)init;
@end

@implementation AADiagnosticsConsentProvider

+ (AADiagnosticsConsentProvider)default
{
  return (AADiagnosticsConsentProvider *)sub_1A91628DC((uint64_t)a1, (uint64_t)a2, (uint64_t)sub_1A90A80E4);
}

+ (AADiagnosticsConsentProvider)allowed
{
  return (AADiagnosticsConsentProvider *)sub_1A91628DC((uint64_t)a1, (uint64_t)a2, (uint64_t)sub_1A90B96C4);
}

+ (AADiagnosticsConsentProvider)disallowed
{
  return (AADiagnosticsConsentProvider *)sub_1A91628DC((uint64_t)a1, (uint64_t)a2, (uint64_t)sub_1A90D6904);
}

+ (id)custom:(id)a3
{
  ObjCClassMetadata = (objc_class *)swift_getObjCClassMetadata();
  uint64_t v5 = type metadata accessor for DiagnosticsConsentProvider(0);
  uint64_t v6 = v5 - 8;
  MEMORY[0x1F4188790](v5);
  v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = _Block_copy(a3);
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = v9;
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = sub_1A91635AC;
  *(void *)(v11 + 24) = v10;
  swift_retain();
  sub_1A916ACB0();
  v12 = (uint64_t (**)@<X0>(BOOL *@<X8>))&v8[*(int *)(v6 + 28)];
  *v12 = sub_1A9162F2C;
  v12[1] = (uint64_t (*)@<X0>(BOOL *@<X8>))v11;
  id v13 = objc_allocWithZone(ObjCClassMetadata);
  sub_1A9098CD0((uint64_t)v8, (uint64_t)v13 + OBJC_IVAR___AADiagnosticsConsentProvider_provider, type metadata accessor for DiagnosticsConsentProvider);
  v16.receiver = v13;
  v16.super_class = ObjCClassMetadata;
  id v14 = objc_msgSendSuper2(&v16, sel_init);
  sub_1A9098B50((uint64_t)v8, type metadata accessor for DiagnosticsConsentProvider);
  swift_release();

  return v14;
}

- (AADiagnosticsConsentProvider)init
{
  result = (AADiagnosticsConsentProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end
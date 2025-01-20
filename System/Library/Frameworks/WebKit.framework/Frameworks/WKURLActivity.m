@interface WKURLActivity
- (NSURL)fallbackURL;
- (WKURLActivity)init;
@end

@implementation WKURLActivity

- (NSURL)fallbackURL
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_268F7AF68);
  MEMORY[0x270FA5388]();
  v4 = (char *)&v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  v5 = self;
  sub_2464263E0();
  swift_endAccess();
  uint64_t v6 = sub_2464262C0();
  uint64_t v7 = *(void *)(v6 - 8);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(v4, 0, 1, v6);

  v8 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v4, 1, v6) != 1)
  {
    v8 = (void *)sub_2464262A0();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v4, v6);
  }

  return (NSURL *)v8;
}

- (WKURLActivity)init
{
  result = (WKURLActivity *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v2 = (char *)self + OBJC_IVAR___WKURLActivity_urlActivity;
  uint64_t v3 = sub_2464263F0();
  v4 = *(void (**)(char *, uint64_t))(*(void *)(v3 - 8) + 8);

  v4(v2, v3);
}

@end
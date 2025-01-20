@interface BRLTJEditableStringInternal
- (BOOL)isEqual:(id)a3;
- (BRLTJEditableStringInternal)init;
- (BRLTJEditableStringInternal)initWithString:(id)a3 selection:(_NSRange)a4 focus:(_NSRange)a5 token:(int64_t)a6 suggestion:(_NSRange)a7;
- (NSString)description;
- (NSString)string;
- (_NSRange)NSFocus;
- (_NSRange)NSSelection;
- (_NSRange)NSSuggestion;
- (id)copyWithZone:(void *)a3;
- (int64_t)tokenForLocation:(int64_t)a3;
- (void)append:(id)a3;
- (void)setString:(id)a3;
@end

@implementation BRLTJEditableStringInternal

- (NSString)string
{
  swift_beginAccess();
  swift_bridgeObjectRetain();
  v2 = (void *)sub_21C589BF8();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (void)setString:(id)a3
{
  uint64_t v4 = sub_21C589C08();
  uint64_t v6 = v5;
  v7 = (uint64_t *)((char *)self + OBJC_IVAR___BRLTJEditableStringInternal_string);
  swift_beginAccess();
  uint64_t *v7 = v4;
  v7[1] = v6;
  swift_bridgeObjectRelease();
}

- (void)append:(id)a3
{
  uint64_t v4 = a3;
  uint64_t v5 = self;
  sub_21C578254(v4);
}

- (int64_t)tokenForLocation:(int64_t)a3
{
  uint64_t v4 = self;
  int64_t v5 = sub_21C578820(a3);

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    uint64_t v4 = self;
    swift_unknownObjectRetain();
    sub_21C589DD8();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v11, 0, sizeof(v11));
    int64_t v5 = self;
  }
  sub_21C5674C4((uint64_t)v11, (uint64_t)v9);
  if (!v10)
  {
    sub_21C567570((uint64_t)v9);
    goto LABEL_8;
  }
  type metadata accessor for BRLTJEditableString();
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_8:

    char v6 = 0;
    goto LABEL_9;
  }
  char v6 = _s18BrailleTranslation19BRLTJEditableStringC2eeoiySbAC_ACtFZ_0(self, v8);

LABEL_9:
  sub_21C567570((uint64_t)v11);
  return v6 & 1;
}

- (NSString)description
{
  v2 = self;
  sub_21C578AC4();

  v3 = (void *)sub_21C589BF8();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (id)copyWithZone:(void *)a3
{
  v3 = self;
  sub_21C578DA8(v6);

  __swift_project_boxed_opaque_existential_0(v6, v6[3]);
  uint64_t v4 = (void *)sub_21C589EB8();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v6);
  return v4;
}

- (BRLTJEditableStringInternal)init
{
  result = (BRLTJEditableStringInternal *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (_NSRange)NSSelection
{
  v2 = *(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & (uint64_t)self->super.isa) + 0x90);
  v3 = self;
  uint64_t v4 = v2();
  uint64_t v7 = sub_21C57BDA4(v4, v6, v5 & 1);
  NSUInteger v9 = v8;

  NSUInteger v10 = v7;
  NSUInteger v11 = v9;
  result.length = v11;
  result.location = v10;
  return result;
}

- (_NSRange)NSFocus
{
  v2 = *(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & (uint64_t)self->super.isa) + 0xA8);
  v3 = self;
  uint64_t v4 = v2();
  uint64_t v7 = sub_21C57BDA4(v4, v6, v5 & 1);
  NSUInteger v9 = v8;

  NSUInteger v10 = v7;
  NSUInteger v11 = v9;
  result.length = v11;
  result.location = v10;
  return result;
}

- (_NSRange)NSSuggestion
{
  v2 = *(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & (uint64_t)self->super.isa) + 0xC0);
  v3 = self;
  uint64_t v4 = v2();
  uint64_t v7 = sub_21C57BDA4(v4, v6, v5 & 1);
  NSUInteger v9 = v8;

  NSUInteger v10 = v7;
  NSUInteger v11 = v9;
  result.length = v11;
  result.location = v10;
  return result;
}

- (BRLTJEditableStringInternal)initWithString:(id)a3 selection:(_NSRange)a4 focus:(_NSRange)a5 token:(int64_t)a6 suggestion:(_NSRange)a7
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  NSUInteger v9 = a4.length;
  NSUInteger v10 = a4.location;
  uint64_t v12 = sub_21C589C08();
  uint64_t v14 = v13;
  v15 = self;
  uint64_t v16 = sub_21C57BDD8(v10, v9);
  uint64_t v35 = v17;
  uint64_t v36 = v16;
  char v19 = v18;
  uint64_t v20 = sub_21C57BDD8(location, length);
  uint64_t v33 = v21;
  uint64_t v34 = v20;
  char v23 = v22;
  uint64_t v24 = sub_21C57BDD8(a7.location, a7.length);
  uint64_t v26 = v25;
  char v28 = v27;
  uint64_t ObjectType = swift_getObjectType();

  __swift_instantiateConcreteTypeFromMangledName(&qword_267C89A08);
  uint64_t v30 = swift_allocObject();
  *(_OWORD *)(v30 + 16) = xmmword_21C58CBD0;
  _NSRange result = (BRLTJEditableStringInternal *)sub_21C589C58();
  if (((unint64_t)result & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else
  {
    *(void *)(v30 + 32) = 0;
    *(void *)(v30 + 40) = result;
    *(void *)(v30 + 48) = a6;
    v32 = (BRLTJEditableStringInternal *)(*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, void, uint64_t, uint64_t, void, uint64_t, uint64_t, _BYTE, uint64_t))(ObjectType + 256))(v12, v14, v36, v35, v19 & 1, v34, v33, v23 & 1, v24, v26, v28 & 1, v30);
    swift_deallocPartialClassInstance();
    return v32;
  }
  return result;
}

@end
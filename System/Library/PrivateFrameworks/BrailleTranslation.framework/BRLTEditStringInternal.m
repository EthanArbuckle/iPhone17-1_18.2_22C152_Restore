@interface BRLTEditStringInternal
- (BOOL)isEqual:(id)a3;
- (BRLTEditStringInternal)init;
- (BRLTEditStringInternal)initWithString:(id)a3 NSSelection:(_NSRange)a4 NSFocus:(_NSRange)a5 token:(int64_t)a6 NSSuggestion:(_NSRange)a7 textFormattingRanges:(id)a8;
- (NSString)description;
- (NSString)string;
- (_NSRange)NSFocus;
- (_NSRange)NSSelection;
- (_NSRange)NSSuggestion;
- (id)appending:(id)a3;
- (int64_t)tokenForLocation:(int64_t)a3;
@end

@implementation BRLTEditStringInternal

- (NSString)string
{
  swift_bridgeObjectRetain();
  v2 = (void *)sub_21C589BF8();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (int64_t)tokenForLocation:(int64_t)a3
{
  return sub_21C56AAFC(a3);
}

- (id)appending:(id)a3
{
  v4 = a3;
  v5 = self;
  sub_21C56B098(v4);
  v7 = v6;

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_21C589DD8();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v11, 0, sizeof(v11));
    v5 = self;
  }
  sub_21C5674C4((uint64_t)v11, (uint64_t)v9);
  if (!v10)
  {
    sub_21C567570((uint64_t)v9);
    goto LABEL_8;
  }
  type metadata accessor for BRLTEditString();
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_8:

    char v6 = 0;
    goto LABEL_9;
  }
  char v6 = sub_21C56C53C((uint64_t)self, (uint64_t)v8);

LABEL_9:
  sub_21C567570((uint64_t)v11);
  return v6 & 1;
}

- (NSString)description
{
  v2 = self;
  sub_21C56BD6C();

  v3 = (void *)sub_21C589BF8();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (BRLTEditStringInternal)init
{
  result = (BRLTEditStringInternal *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___BRLTEditStringInternal_textFormattingRanges);
}

- (_NSRange)NSSelection
{
  NSUInteger v2 = sub_21C56C118((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BRLTEditStringInternal_selection);
  result.length = v3;
  result.location = v2;
  return result;
}

- (_NSRange)NSFocus
{
  NSUInteger v2 = sub_21C56C118((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BRLTEditStringInternal_focus);
  result.length = v3;
  result.location = v2;
  return result;
}

- (_NSRange)NSSuggestion
{
  NSUInteger v2 = sub_21C56C118((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BRLTEditStringInternal_suggestion);
  result.length = v3;
  result.location = v2;
  return result;
}

- (BRLTEditStringInternal)initWithString:(id)a3 NSSelection:(_NSRange)a4 NSFocus:(_NSRange)a5 token:(int64_t)a6 NSSuggestion:(_NSRange)a7 textFormattingRanges:(id)a8
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  NSUInteger v10 = a4.length;
  NSUInteger v11 = a4.location;
  uint64_t v13 = sub_21C589C08();
  uint64_t v15 = v14;
  id v38 = a8;
  v16 = self;
  uint64_t v17 = sub_21C57BDD8(v11, v10);
  uint64_t v36 = v18;
  uint64_t v37 = v17;
  char v20 = v19;
  uint64_t v21 = sub_21C57BDD8(location, length);
  uint64_t v34 = v22;
  uint64_t v35 = v21;
  char v24 = v23;
  uint64_t v25 = sub_21C57BDD8(a7.location, a7.length);
  uint64_t v27 = v26;
  char v29 = v28;
  uint64_t ObjectType = swift_getObjectType();

  __swift_instantiateConcreteTypeFromMangledName(&qword_267C89A08);
  uint64_t v31 = swift_allocObject();
  *(_OWORD *)(v31 + 16) = xmmword_21C58CBD0;
  _NSRange result = (BRLTEditStringInternal *)sub_21C589C58();
  if (((unint64_t)result & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else
  {
    *(void *)(v31 + 32) = 0;
    *(void *)(v31 + 40) = result;
    *(void *)(v31 + 48) = a6;
    v33 = (BRLTEditStringInternal *)(*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, void, uint64_t, uint64_t, void, uint64_t, uint64_t, uint64_t, _BYTE, id))(ObjectType + 128))(v13, v15, v37, v36, v20 & 1, v35, v34, v24 & 1, v31, v25, v27, v29 & 1, v38);
    swift_deallocPartialClassInstance();
    return v33;
  }
  return result;
}

@end
@interface ISSiriTurn
+ (id)constructWithEventGraph:(id)a3;
- (NSUUID)previousTurnId;
- (NSUUID)turnId;
- (double)timeIntervalSince1970Nonnull;
@end

@implementation ISSiriTurn

+ (id)constructWithEventGraph:(id)a3
{
  id v4 = objc_allocWithZone((Class)type metadata accessor for SiriTurn());
  v5 = (void *)SiriTurn.init(eventGraph:)(a3);
  return v5;
}

- (NSUUID)turnId
{
  uint64_t v3 = sub_22AEA93B8();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3, v5);
  v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = self;
  result = (NSUUID *)EventGraph.uei.getter();
  if (result)
  {
    v10 = (void *)sub_22A7595BC();
    swift_release();
    sub_22AEA9668();

    v11 = (void *)sub_22AEA9368();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v3);
    return (NSUUID *)v11;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (double)timeIntervalSince1970Nonnull
{
  v2 = self;
  uint64_t v3 = sub_22A7675A0();
  char v5 = v4;

  double result = *(double *)&v3;
  if (v5) {
    return 0.0;
  }
  return result;
}

- (NSUUID)previousTurnId
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268380DA0);
  MEMORY[0x270FA5388](v3 - 8, v4);
  uint64_t v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = self;
  double result = (NSUUID *)EventGraph.uei.getter();
  if (result)
  {
    ComponentGroup<>.previousTurnId.getter((uint64_t)v6);

    swift_release();
    uint64_t v9 = sub_22AEA93B8();
    uint64_t v10 = *(void *)(v9 - 8);
    v11 = 0;
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v6, 1, v9) != 1)
    {
      v11 = (void *)sub_22AEA9368();
      (*(void (**)(char *, uint64_t))(v10 + 8))(v6, v9);
    }
    return (NSUUID *)v11;
  }
  else
  {
    __break(1u);
  }
  return result;
}

@end
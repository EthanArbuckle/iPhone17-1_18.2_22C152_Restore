@interface BlastDoorMorphologyCustomPronounPair
- (BlastDoorMorphologyCustomPronoun)pronoun;
- (BlastDoorMorphologyCustomPronounPair)init;
- (NSString)description;
- (int64_t)language;
@end

@implementation BlastDoorMorphologyCustomPronounPair

- (NSString)description
{
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1B196A850();
  v2 = (void *)sub_1B196A7E0();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (int64_t)language
{
  return *((unsigned __int8 *)&self->super.isa
         + OBJC_IVAR___BlastDoorMorphologyCustomPronounPair_morphologyCustomPronounPair);
}

- (BlastDoorMorphologyCustomPronoun)pronoun
{
  uint64_t v3 = *(void *)&self->morphologyCustomPronounPair[OBJC_IVAR___BlastDoorMorphologyCustomPronounPair_morphologyCustomPronounPair];
  uint64_t v2 = *(void *)&self->morphologyCustomPronounPair[OBJC_IVAR___BlastDoorMorphologyCustomPronounPair_morphologyCustomPronounPair
                                                   + 8];
  uint64_t v5 = *(void *)&self->morphologyCustomPronounPair[OBJC_IVAR___BlastDoorMorphologyCustomPronounPair_morphologyCustomPronounPair
                                                   + 16];
  uint64_t v4 = *(void *)&self->morphologyCustomPronounPair[OBJC_IVAR___BlastDoorMorphologyCustomPronounPair_morphologyCustomPronounPair
                                                   + 24];
  uint64_t v7 = *(void *)&self->morphologyCustomPronounPair[OBJC_IVAR___BlastDoorMorphologyCustomPronounPair_morphologyCustomPronounPair
                                                   + 32];
  uint64_t v6 = *(void *)&self->morphologyCustomPronounPair[OBJC_IVAR___BlastDoorMorphologyCustomPronounPair_morphologyCustomPronounPair
                                                   + 40];
  uint64_t v9 = *(void *)&self->morphologyCustomPronounPair[OBJC_IVAR___BlastDoorMorphologyCustomPronounPair_morphologyCustomPronounPair
                                                   + 48];
  uint64_t v8 = *(void *)&self->morphologyCustomPronounPair[OBJC_IVAR___BlastDoorMorphologyCustomPronounPair_morphologyCustomPronounPair
                                                   + 56];
  uint64_t v10 = *(void *)&self->morphologyCustomPronounPair[OBJC_IVAR___BlastDoorMorphologyCustomPronounPair_morphologyCustomPronounPair
                                                    + 72];
  uint64_t v16 = *(void *)&self->morphologyCustomPronounPair[OBJC_IVAR___BlastDoorMorphologyCustomPronounPair_morphologyCustomPronounPair
                                                    + 64];
  v11 = (objc_class *)type metadata accessor for _ObjCMorphologyCustomPronounWrapper();
  v12 = (char *)objc_allocWithZone(v11);
  v13 = &v12[OBJC_IVAR___BlastDoorMorphologyCustomPronoun_morphologyCustomPronoun];
  *(void *)v13 = v3;
  *((void *)v13 + 1) = v2;
  *((void *)v13 + 2) = v5;
  *((void *)v13 + 3) = v4;
  *((void *)v13 + 4) = v7;
  *((void *)v13 + 5) = v6;
  *((void *)v13 + 6) = v9;
  *((void *)v13 + 7) = v8;
  *((void *)v13 + 8) = v16;
  *((void *)v13 + 9) = v10;
  v17.receiver = v12;
  v17.super_class = v11;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v14 = [(BlastDoorMorphologyCustomPronounPair *)&v17 init];
  return (BlastDoorMorphologyCustomPronoun *)v14;
}

- (BlastDoorMorphologyCustomPronounPair)init
{
  result = (BlastDoorMorphologyCustomPronounPair *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
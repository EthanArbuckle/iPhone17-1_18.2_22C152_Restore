@interface FIUIDepthFormatter
- (FIUIDepthFormatter)init;
- (FIUIDepthFormatter)initWithUnitManager:(id)a3;
- (id)formatDepthValue:(double)a3 unit:(unint64_t)a4;
- (id)formatGoalValueForDive:(id)a3 healthStore:(id)a4;
- (id)formatMaxDepth:(double)a3 unit:(unint64_t)a4;
- (id)formatUnderwaterTime:(double)a3;
- (id)formatWaterTemperatureRangeWithLower:(double)a3 upper:(double)a4;
- (id)formatWaterTemperatureValue:(double)a3;
@end

@implementation FIUIDepthFormatter

- (FIUIDepthFormatter)initWithUnitManager:(id)a3
{
  id v3 = a3;
  v4 = (FIUIDepthFormatter *)sub_21E49A350(v3);

  return v4;
}

- (id)formatMaxDepth:(double)a3 unit:(unint64_t)a4
{
  return sub_21E4995B0(self, a3, (uint64_t)a2, a4, (void (*)(uint64_t, double))FIUIDepthFormatter.formatMaxDepth(_:unit:));
}

- (id)formatDepthValue:(double)a3 unit:(unint64_t)a4
{
  return sub_21E4995B0(self, a3, (uint64_t)a2, a4, (void (*)(uint64_t, double))FIUIDepthFormatter.formatDepthValue(_:unit:));
}

- (id)formatWaterTemperatureValue:(double)a3
{
  uint64_t v4 = sub_21E4D09F0();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_21E4D0970();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, void, uint64_t))(v5 + 104))(v7, *MEMORY[0x263F39780], v4);
  v12 = self;
  sub_21E4D09B0();
  (*(void (**)(char *, void, uint64_t))(v9 + 104))(v11, *MEMORY[0x263F39760], v8);
  sub_21E4D0920();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);

  v13 = (void *)sub_21E4D0AB0();
  swift_bridgeObjectRelease();
  return v13;
}

- (id)formatWaterTemperatureRangeWithLower:(double)a3 upper:(double)a4
{
  uint64_t v5 = sub_21E4D09F0();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_21E4D09A0();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  v12 = (char *)v17 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17[1] = *(id *)((char *)&self->super.isa + OBJC_IVAR___FIUIDepthFormatter_depthFormatter);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267D2FC88);
  uint64_t v13 = *MEMORY[0x263F39780];
  v14 = *(void (**)(char *, uint64_t, uint64_t))(v6 + 104);
  v14(v8, v13, v5);
  v17[0] = self;
  sub_21E4D09B0();
  v14(v8, v13, v5);
  sub_21E4D09B0();
  (*(void (**)(char *, void, uint64_t))(v10 + 104))(v12, *MEMORY[0x263F39770], v9);
  sub_21E4D0940();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);

  uint64_t v15 = (void *)sub_21E4D0AB0();
  swift_bridgeObjectRelease();
  return v15;
}

- (id)formatUnderwaterTime:(double)a3
{
  id v3 = self;
  sub_21E4D0930();

  uint64_t v4 = (void *)sub_21E4D0AB0();
  swift_bridgeObjectRelease();
  return v4;
}

- (id)formatGoalValueForDive:(id)a3 healthStore:(id)a4
{
  uint64_t v19 = sub_21E4D08B0();
  uint64_t v7 = *(void *)(v19 - 8);
  MEMORY[0x270FA5388](v19);
  uint64_t v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v10 = a3;
  id v11 = a4;
  v12 = self;
  sub_21E4D08F0();
  sub_21E4D08A0();
  sub_21E4D0890();
  id v13 = objc_allocWithZone((Class)FIUIDepthFormattedGoalPair);
  v14 = (void *)sub_21E4D0AB0();
  swift_bridgeObjectRelease();
  uint64_t v15 = (void *)sub_21E4D0AB0();
  swift_bridgeObjectRelease();
  id v16 = objc_msgSend(v13, sel_initWithGoalString_goalValue_, v14, v15);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v19);
  return v16;
}

- (FIUIDepthFormatter)init
{
  result = (FIUIDepthFormatter *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  id v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___FIUIDepthFormatter_unitManager);
}

@end
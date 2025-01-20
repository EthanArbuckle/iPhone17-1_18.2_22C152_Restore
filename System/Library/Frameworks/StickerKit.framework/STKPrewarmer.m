@interface STKPrewarmer
+ (uint64_t)prewarm;
- (STKPrewarmer)init;
@end

@implementation STKPrewarmer

- (STKPrewarmer)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for STKPrewarmer();
  return [(STKPrewarmer *)&v3 init];
}

+ (uint64_t)prewarm
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(qword_26B0D60C0);
  MEMORY[0x270FA5388](v0 - 8);
  v2 = (char *)v11 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_2453FFE78();
  uint64_t v4 = *(void *)(v3 - 8);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v4 + 56))(v2, 1, 1, v3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = 0;
  *(void *)(v5 + 24) = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v4 + 48))(v2, 1, v3) == 1)
  {
    sub_245203CD8((uint64_t)v2, qword_26B0D60C0);
    uint64_t v6 = 0;
    uint64_t v7 = 0;
  }
  else
  {
    sub_2453FFE68();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v2, v3);
    if (*(void *)(v5 + 16))
    {
      swift_getObjectType();
      swift_unknownObjectRetain();
      uint64_t v6 = sub_2453FFDB8();
      uint64_t v7 = v8;
      swift_unknownObjectRelease();
    }
    else
    {
      uint64_t v6 = 0;
      uint64_t v7 = 0;
    }
  }
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = &unk_268ED6500;
  *(void *)(v9 + 24) = v5;
  if (v7 | v6)
  {
    v11[0] = 0;
    v11[1] = 0;
    v11[2] = v6;
    v11[3] = v7;
  }
  swift_task_create();
  return swift_release();
}

@end
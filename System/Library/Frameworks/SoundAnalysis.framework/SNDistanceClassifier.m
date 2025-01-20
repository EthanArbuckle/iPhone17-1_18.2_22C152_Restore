@interface SNDistanceClassifier
+ (id)modelURLForCurrentProduct;
+ (id)modelURLForProductType:(int)a3 acousticID:(id)a4;
- (SNDistanceClassifier)init;
@end

@implementation SNDistanceClassifier

+ (id)modelURLForCurrentProduct
{
  uint64_t v2 = sub_1DC87E988(qword_1EAA9CBC0);
  MEMORY[0x1F4188790](v2 - 8);
  v4 = (char *)&v8 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getObjCClassMetadata();
  sub_1DCB03BD0((uint64_t)v4);
  uint64_t v5 = sub_1DCB86A18();
  v6 = 0;
  if (_s13SoundAnalysis11SNAOPReportV14SuccessPayloadOwet_0((uint64_t)v4, 1, v5) != 1)
  {
    v6 = (void *)sub_1DCB86948();
    (*(void (**)(char *, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  }

  return v6;
}

+ (id)modelURLForProductType:(int)a3 acousticID:(id)a4
{
  uint64_t v5 = *(void *)&a3;
  uint64_t v6 = sub_1DC87E988(qword_1EAA9CBC0);
  MEMORY[0x1F4188790](v6 - 8);
  uint64_t v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a4)
  {
    uint64_t v9 = sub_1DCB87938();
    a4 = v10;
  }
  else
  {
    uint64_t v9 = 0;
  }
  sub_1DCB03C2C(v5, v9, (uint64_t)a4, (uint64_t)v8);
  swift_bridgeObjectRelease();
  uint64_t v11 = sub_1DCB86A18();
  v12 = 0;
  if (_s13SoundAnalysis11SNAOPReportV14SuccessPayloadOwet_0((uint64_t)v8, 1, v11) != 1)
  {
    v12 = (void *)sub_1DCB86948();
    (*(void (**)(char *, uint64_t))(*(void *)(v11 - 8) + 8))(v8, v11);
  }

  return v12;
}

- (SNDistanceClassifier)init
{
  return (SNDistanceClassifier *)SNDistanceClassifier.init()();
}

@end
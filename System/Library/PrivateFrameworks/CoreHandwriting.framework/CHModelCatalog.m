@interface CHModelCatalog
- (BOOL)assetDeliveryReady;
- (CHModelCatalog)init;
- (id)getModelURL:(int64_t)a3;
- (id)getModelVersion:(int64_t)a3;
@end

@implementation CHModelCatalog

- (CHModelCatalog)init
{
  sub_1C4C2B488();
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for CHModelCatalog();
  return [(CHModelCatalog *)&v4 init];
}

- (BOOL)assetDeliveryReady
{
  v2 = self;
  unsigned __int8 v3 = sub_1C4931894();

  return v3 & 1;
}

- (id)getModelURL:(int64_t)a3
{
  uint64_t v5 = sub_1C49313D8(&qword_1EA3C8140);
  MEMORY[0x1F4188790](v5 - 8);
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = self;
  sub_1C49319D8(a3, (void (*)(char *, char *, uint64_t))v8, (uint64_t)v7);

  uint64_t v9 = sub_1C4C2B348();
  uint64_t v10 = *(void *)(v9 - 8);
  v11 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v7, 1, v9) != 1)
  {
    v11 = (void *)sub_1C4C2B338();
    (*(void (**)(char *, uint64_t))(v10 + 8))(v7, v9);
  }
  return v11;
}

- (id)getModelVersion:(int64_t)a3
{
  objc_super v4 = self;
  sub_1C4932564(a3, (uint64_t)v4);
  uint64_t v6 = v5;

  if (v6)
  {
    v7 = (void *)sub_1C4C2B548();
    swift_bridgeObjectRelease();
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (void).cxx_destruct
{
  v2 = (char *)self + OBJC_IVAR___CHModelCatalog_logger;
  uint64_t v3 = sub_1C4C2B498();
  objc_super v4 = *(void (**)(char *, uint64_t))(*(void *)(v3 - 8) + 8);
  v4(v2, v3);
}

@end
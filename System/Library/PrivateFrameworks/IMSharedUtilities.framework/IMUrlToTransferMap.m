@interface IMUrlToTransferMap
- (IMUrlToTransferMap)init;
- (IMUrlToTransferMap)initWithDictionary:(id)a3;
- (IMUrlToTransferMap)initWithUrlToTransferGuids:(id)a3;
- (NSDictionary)urlToTransferGuids;
- (id)copyWithZone:(void *)a3;
- (id)dictionaryRepresentation;
- (id)transferGuidFromUrl:(id)a3;
@end

@implementation IMUrlToTransferMap

- (NSDictionary)urlToTransferGuids
{
  swift_bridgeObjectRetain();
  v2 = (void *)sub_1A09F3CE8();
  swift_bridgeObjectRelease();

  return (NSDictionary *)v2;
}

- (IMUrlToTransferMap)initWithUrlToTransferGuids:(id)a3
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___IMUrlToTransferMap_urlToTransferGuids) = (Class)sub_1A09F3D08();
  v5.receiver = self;
  v5.super_class = (Class)IMUrlToTransferMap;
  return [(IMUrlToTransferMap *)&v5 init];
}

- (id)transferGuidFromUrl:(id)a3
{
  if (a3)
  {
    uint64_t v4 = sub_1A09F3E18();
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v6 = 0;
  }
  v7 = self;
  sub_1A08E98D0(v4, v6);
  uint64_t v9 = v8;

  swift_bridgeObjectRelease();
  if (v9)
  {
    v10 = (void *)sub_1A09F3DE8();
    swift_bridgeObjectRelease();
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (IMUrlToTransferMap)initWithDictionary:(id)a3
{
  uint64_t v3 = sub_1A09F3D08();
  return (IMUrlToTransferMap *)IMUrlToTransferMap.init(dictionary:)(v3);
}

- (id)dictionaryRepresentation
{
  sub_1A07856F8(&qword_1E94F9368);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1A0A08A20;
  *(void *)(inited + 32) = sub_1A09F3E18();
  *(void *)(inited + 40) = v4;
  uint64_t v5 = self;
  uint64_t v6 = [(IMUrlToTransferMap *)v5 urlToTransferGuids];
  uint64_t v7 = sub_1A09F3D08();

  *(void *)(inited + 72) = sub_1A07856F8(&qword_1E94FAE48);
  *(void *)(inited + 48) = v7;
  sub_1A08D7480(inited);

  uint64_t v8 = (void *)sub_1A09F3CE8();
  swift_bridgeObjectRelease();

  return v8;
}

- (id)copyWithZone:(void *)a3
{
  uint64_t v3 = self;
  sub_1A08E9D90(v6);

  sub_1A086F45C(v6, v6[3]);
  uint64_t v4 = (void *)sub_1A09F4B18();
  _s17IMSharedUtilities29RemoteIntentBroadcastEncodingVwxx_0((uint64_t)v6);
  return v4;
}

- (IMUrlToTransferMap)init
{
  result = (IMUrlToTransferMap *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end
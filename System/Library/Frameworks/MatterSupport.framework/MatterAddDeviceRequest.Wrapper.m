@interface MatterAddDeviceRequest.Wrapper
- (BOOL)isEqual:(id)a3;
- (BOOL)shouldScanNetworks;
- (BOOL)shouldShowDeviceWithUUID:(id)a3 vendorID:(id)a4 productID:(id)a5 serialNumber:(id)a6 rootPublicKey:(id)a7 nodeID:(id)a8;
- (MTRSetupPayload)setupPayload;
- (MTSDeviceSetupTopology)topology;
- (NSData)serializedAsData;
- (NSString)debugDescription;
- (NSString)description;
- (NSString)ecosystemName;
- (_TtCV13MatterSupport22MatterAddDeviceRequestP33_1A83A92E88F6D049FA318E551745945D7Wrapper)init;
- (int64_t)hash;
@end

@implementation MatterAddDeviceRequest.Wrapper

- (MTSDeviceSetupTopology)topology
{
  sub_245108D5C(0, &qword_268EC39A0);
  uint64_t v4 = *(void *)&self->wrappedRequest[OBJC_IVAR____TtCV13MatterSupport22MatterAddDeviceRequestP33_1A83A92E88F6D049FA318E551745945D7Wrapper_wrappedRequest];
  uint64_t v3 = *(void *)&self->wrappedRequest[OBJC_IVAR____TtCV13MatterSupport22MatterAddDeviceRequestP33_1A83A92E88F6D049FA318E551745945D7Wrapper_wrappedRequest
                                      + 8];
  uint64_t v5 = *(void *)&self->wrappedRequest[OBJC_IVAR____TtCV13MatterSupport22MatterAddDeviceRequestP33_1A83A92E88F6D049FA318E551745945D7Wrapper_wrappedRequest
                                      + 16];
  v8[0] = v4;
  v8[1] = v3;
  v8[2] = v5;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  id v6 = sub_24510BA6C((uint64_t)v8);

  return (MTSDeviceSetupTopology *)v6;
}

- (NSString)ecosystemName
{
  swift_bridgeObjectRetain();
  v2 = (void *)sub_245132828();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (BOOL)shouldScanNetworks
{
  v2 = (char *)self
     + OBJC_IVAR____TtCV13MatterSupport22MatterAddDeviceRequestP33_1A83A92E88F6D049FA318E551745945D7Wrapper_wrappedRequest;
  return v2[*(int *)(type metadata accessor for MatterAddDeviceRequest(0) + 32)];
}

- (NSData)serializedAsData
{
  sub_245132678();
  swift_allocObject();
  uint64_t v3 = self;
  sub_245132668();
  type metadata accessor for MatterAddDeviceRequest(0);
  sub_245106FE4(&qword_268EC3818, (void (*)(uint64_t))type metadata accessor for MatterAddDeviceRequest);
  uint64_t v4 = sub_245132658();
  unint64_t v6 = v5;

  swift_release();
  v7 = (void *)sub_2451326A8();
  sub_245100544(v4, v6);

  return (NSData *)v7;
}

- (MTRSetupPayload)setupPayload
{
  return (MTRSetupPayload *)objc_retainAutoreleaseReturnValue(*(id *)&self->wrappedRequest[OBJC_IVAR____TtCV13MatterSupport22MatterAddDeviceRequestP33_1A83A92E88F6D049FA318E551745945D7Wrapper_wrappedRequest
                                                                                         + 24]);
}

- (BOOL)shouldShowDeviceWithUUID:(id)a3 vendorID:(id)a4 productID:(id)a5 serialNumber:(id)a6 rootPublicKey:(id)a7 nodeID:(id)a8
{
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_268EC3990);
  MEMORY[0x270FA5388](v15 - 8);
  v17 = (char *)&v31 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    sub_2451326E8();
    uint64_t v18 = sub_2451326F8();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(v17, 0, 1, v18);
  }
  else
  {
    uint64_t v19 = sub_2451326F8();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 56))(v17, 1, 1, v19);
  }
  if (a6)
  {
    uint64_t v20 = sub_245132838();
    a6 = v21;
  }
  else
  {
    uint64_t v20 = 0;
  }
  id v22 = a4;
  id v23 = a5;
  id v24 = a8;
  v25 = self;
  if (a7)
  {
    id v26 = a7;
    a7 = (id)sub_2451326B8();
    unint64_t v28 = v27;
  }
  else
  {
    unint64_t v28 = 0xF000000000000000;
  }
  BOOL v29 = sub_2451062BC((uint64_t)v17, (uint64_t)v22, (uint64_t)v23, v20, (uint64_t)a6, (uint64_t)a7, v28, (uint64_t)v24);
  sub_24510702C((uint64_t)a7, v28);

  swift_bridgeObjectRelease();
  sub_2451094B8((uint64_t)v17, &qword_268EC3990);
  return v29;
}

- (NSString)description
{
  return (NSString *)sub_24510676C((uint64_t)self, (uint64_t)a2, MEMORY[0x263F8D260]);
}

- (NSString)debugDescription
{
  return (NSString *)sub_24510676C((uint64_t)self, (uint64_t)a2, MEMORY[0x263F8D270]);
}

- (int64_t)hash
{
  sub_245132CD8();
  uint64_t v3 = self;
  MatterAddDeviceRequest.hash(into:)((uint64_t)v6);
  int64_t v4 = sub_245132D28();

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    int64_t v4 = self;
    swift_unknownObjectRetain();
    sub_2451329F8();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    unint64_t v5 = self;
  }
  char v6 = sub_2451068AC((uint64_t)v8);

  sub_2451094B8((uint64_t)v8, &qword_268EC3998);
  return v6 & 1;
}

- (_TtCV13MatterSupport22MatterAddDeviceRequestP33_1A83A92E88F6D049FA318E551745945D7Wrapper)init
{
  result = (_TtCV13MatterSupport22MatterAddDeviceRequestP33_1A83A92E88F6D049FA318E551745945D7Wrapper *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end
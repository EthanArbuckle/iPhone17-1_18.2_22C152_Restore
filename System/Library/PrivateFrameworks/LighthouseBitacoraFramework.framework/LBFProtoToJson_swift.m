@interface LBFProtoToJson_swift
+ (id)serializeBitacoraBitacoraMlruntimedEventToJsonWithProtoData:(id)a3;
+ (id)serializeBitacoraLighthousePluginEventToJsonWithProtoData:(id)a3;
+ (id)serializeBitacoraStateToJsonWithProtoData:(id)a3;
+ (id)serializeBitacoraTrialdEventToJsonWithProtoData:(id)a3;
- (_TtC27LighthouseBitacoraFramework20LBFProtoToJson_swift)init;
@end

@implementation LBFProtoToJson_swift

+ (id)serializeBitacoraStateToJsonWithProtoData:(id)a3
{
  return sub_2545838FC((uint64_t)a1, (uint64_t)a2, a3, (void (*)(void))_s27LighthouseBitacoraFramework20LBFProtoToJson_swiftC09serializeb5StateeF09protoDataSSSgSo6NSDataC_tFZ_0);
}

+ (id)serializeBitacoraBitacoraMlruntimedEventToJsonWithProtoData:(id)a3
{
  return sub_2545838FC((uint64_t)a1, (uint64_t)a2, a3, (void (*)(void))_s27LighthouseBitacoraFramework20LBFProtoToJson_swiftC09serializebb15MlruntimedEventeF09protoDataSSSgSo6NSDataC_tFZ_0);
}

+ (id)serializeBitacoraLighthousePluginEventToJsonWithProtoData:(id)a3
{
  return sub_2545838FC((uint64_t)a1, (uint64_t)a2, a3, (void (*)(void))_s27LighthouseBitacoraFramework20LBFProtoToJson_swiftC09serializeba11PluginEventeF09protoDataSSSgSo6NSDataC_tFZ_0);
}

+ (id)serializeBitacoraTrialdEventToJsonWithProtoData:(id)a3
{
  return sub_2545838FC((uint64_t)a1, (uint64_t)a2, a3, (void (*)(void))_s27LighthouseBitacoraFramework20LBFProtoToJson_swiftC09serializeb11TrialdEventeF09protoDataSSSgSo6NSDataC_tFZ_0);
}

- (_TtC27LighthouseBitacoraFramework20LBFProtoToJson_swift)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for LBFProtoToJson_swift();
  return [(LBFProtoToJson_swift *)&v3 init];
}

@end
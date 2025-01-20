@interface String:
- (Class)NSObject;
- (unint64_t)Data;
- (unint64_t)HMDeviceRecord;
- (unint64_t)HeadphoneDevice;
- (void)Data;
- (void)HMDeviceRecord;
- (void)HeadphoneDevice;
@end

@implementation String:

- (void)Data
{
}

- (unint64_t)Data
{
  uint64_t v2 = lazy protocol witness table cache variable for type [String : Data] and conformance [A : B];
  if (!lazy protocol witness table cache variable for type [String : Data] and conformance [A : B])
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [String : Data]);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&lazy protocol witness table cache variable for type [String : Data] and conformance [A : B]);
    return WitnessTable;
  }
  return v2;
}

- (void)HeadphoneDevice
{
  uint64_t v4 = *a1;
  swift_bridgeObjectRetain();
  result = a2;
  *a2 = v4;
  return result;
}

- (unint64_t)HeadphoneDevice
{
  uint64_t v2 = lazy protocol witness table cache variable for type [String : HeadphoneDevice].Values and conformance [A : B].Values;
  if (!lazy protocol witness table cache variable for type [String : HeadphoneDevice].Values and conformance [A : B].Values)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [String : HeadphoneDevice].Values);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&lazy protocol witness table cache variable for type [String : HeadphoneDevice].Values and conformance [A : B].Values);
    return WitnessTable;
  }
  return v2;
}

- (unint64_t)HMDeviceRecord
{
  uint64_t v2 = lazy protocol witness table cache variable for type [String : HMDeviceRecord] and conformance [A : B];
  if (!lazy protocol witness table cache variable for type [String : HMDeviceRecord] and conformance [A : B])
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [String : HMDeviceRecord]);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&lazy protocol witness table cache variable for type [String : HMDeviceRecord] and conformance [A : B]);
    return WitnessTable;
  }
  return v2;
}

- (Class)NSObject
{
  v5 = *(uint64_t (**)(uint64_t))(a1 + 32);
  uint64_t v1 = swift_retain();
  if (v5(v1))
  {
    type metadata accessor for NSObject();
    Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    Class v4 = isa;
  }
  else
  {
    Class v4 = 0;
  }
  swift_release();
  return v4;
}

- (void)HMDeviceRecord
{
  uint64_t v4 = *a1;
  swift_bridgeObjectRetain();
  result = a2;
  *a2 = v4;
  return result;
}

@end
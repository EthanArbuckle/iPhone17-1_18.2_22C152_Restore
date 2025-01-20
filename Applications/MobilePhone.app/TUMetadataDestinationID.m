@interface TUMetadataDestinationID
+ (id)metadataDestinationIDWithVoicemailMessage:(id)a3;
+ (id)metadataDestinationIDsForVMVoicemails:(id)a3;
@end

@implementation TUMetadataDestinationID

+ (id)metadataDestinationIDsForVMVoicemails:(id)a3
{
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for Message);
  unint64_t v3 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  swift_getObjCClassMetadata();
  static TUMetadataDestinationID.metadataDestinationIDs(for:)(v3);
  swift_bridgeObjectRelease();
  type metadata accessor for TUMetadataDestinationID();
  v4.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return v4.super.isa;
}

+ (id)metadataDestinationIDWithVoicemailMessage:(id)a3
{
  swift_getObjCClassMetadata();
  swift_getKeyPath();
  swift_getKeyPath();
  swift_unknownObjectRetain();
  id v3 = static TUMetadataDestinationID._metadataDestinationID(with:countryCodeKey:destinationIDKey:)();
  swift_unknownObjectRelease();
  swift_release();
  swift_release();

  return v3;
}

@end
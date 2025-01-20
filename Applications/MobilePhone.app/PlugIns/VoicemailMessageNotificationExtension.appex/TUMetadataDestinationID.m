@interface TUMetadataDestinationID
+ (id)metadataDestinationIDWithVoicemailMessage:(id)a3;
+ (id)metadataDestinationIDsForVMVoicemails:(id)a3;
@end

@implementation TUMetadataDestinationID

+ (id)metadataDestinationIDWithVoicemailMessage:(id)a3
{
  swift_getObjCClassMetadata();
  swift_getKeyPath();
  swift_getKeyPath();
  swift_unknownObjectRetain();
  id v3 = sub_1000388FC();
  swift_unknownObjectRelease();
  swift_release();
  swift_release();

  return v3;
}

+ (id)metadataDestinationIDsForVMVoicemails:(id)a3
{
  sub_100016F7C(&qword_1000687E0);
  unint64_t v3 = sub_1000417F0();
  swift_getObjCClassMetadata();
  sub_100038B64(v3);
  swift_bridgeObjectRelease();
  sub_10003911C();
  v4.super.isa = sub_1000417E0().super.isa;
  swift_bridgeObjectRelease();

  return v4.super.isa;
}

@end
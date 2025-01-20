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
  id v3 = sub_10005EAA4();
  swift_unknownObjectRelease();
  swift_release();
  swift_release();

  return v3;
}

+ (id)metadataDestinationIDsForVMVoicemails:(id)a3
{
  sub_100035DD8(&qword_1000A1500);
  unint64_t v3 = sub_100062380();
  swift_getObjCClassMetadata();
  sub_10005ED0C(v3);
  swift_bridgeObjectRelease();
  sub_10005F2C4();
  v4.super.isa = sub_100062370().super.isa;
  swift_bridgeObjectRelease();

  return v4.super.isa;
}

@end
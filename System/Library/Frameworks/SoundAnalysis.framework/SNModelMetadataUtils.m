@interface SNModelMetadataUtils
+ (id)validatedFeedbackConnectionsFromModelDescription:(id)a3 orDefault:(id)a4;
- (SNModelMetadataUtils)init;
@end

@implementation SNModelMetadataUtils

+ (id)validatedFeedbackConnectionsFromModelDescription:(id)a3 orDefault:(id)a4
{
  type metadata accessor for SNModelFeatureConnection();
  sub_1DCB361E0(&qword_1EAA9C640, v5, (void (*)(uint64_t))type metadata accessor for SNModelFeatureConnection);
  uint64_t v6 = sub_1DCB87FE8();
  swift_getObjCClassMetadata();
  id v7 = a3;
  sub_1DCB30D3C(v7, v6);

  swift_bridgeObjectRelease();
  v8 = (void *)sub_1DCB87FD8();
  swift_bridgeObjectRelease();

  return v8;
}

- (SNModelMetadataUtils)init
{
  return (SNModelMetadataUtils *)sub_1DC8CE788();
}

@end
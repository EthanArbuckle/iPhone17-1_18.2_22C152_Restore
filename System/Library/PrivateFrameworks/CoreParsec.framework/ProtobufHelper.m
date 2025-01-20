@interface ProtobufHelper
+ (void)processProtobuf:(id)a3 result:(id)a4 data:(id)a5;
- (_TtC10CoreParsec14ProtobufHelper)init;
@end

@implementation ProtobufHelper

+ (void)processProtobuf:(id)a3 result:(id)a4 data:(id)a5
{
  id v8 = a3;
  swift_unknownObjectRetain();
  id v9 = a5;
  uint64_t v10 = sub_19C898E40();
  unint64_t v12 = v11;

  swift_getObjCClassMetadata();
  swift_getObjectType();
  sub_19C80FDE4(a3, a4, v10, v12);
  sub_19C7F47F8(v10, v12);

  swift_unknownObjectRelease();
}

- (_TtC10CoreParsec14ProtobufHelper)init
{
  return (_TtC10CoreParsec14ProtobufHelper *)ProtobufHelper.init()();
}

@end
@interface CKRichLinkUtilities
+ (id)validURLsInString:(id)a3 inRange:(_NSRange)a4;
- (_TtC7ChatKit19CKRichLinkUtilities)init;
@end

@implementation CKRichLinkUtilities

+ (id)validURLsInString:(id)a3 inRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  uint64_t v6 = sub_18F7B97E0();
  _s7ChatKit19CKRichLinkUtilitiesC17validURLsInString_7inRangeSayAA014CKDataDetectedD6ResultCGSS_So8_NSRangeVtFZ_0(v6, v7, location, length);
  swift_bridgeObjectRelease();
  type metadata accessor for CKDataDetectedLinkResult();
  v8 = (void *)sub_18F7B99A0();
  swift_bridgeObjectRelease();

  return v8;
}

- (_TtC7ChatKit19CKRichLinkUtilities)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CKRichLinkUtilities();
  return [(CKRichLinkUtilities *)&v3 init];
}

@end
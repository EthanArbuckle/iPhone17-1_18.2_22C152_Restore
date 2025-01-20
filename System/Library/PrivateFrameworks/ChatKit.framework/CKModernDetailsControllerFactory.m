@interface CKModernDetailsControllerFactory
+ (id)detailsControllerWithConversation:(id)a3 delegate:(id)a4;
- (CKModernDetailsControllerFactory)init;
@end

@implementation CKModernDetailsControllerFactory

+ (id)detailsControllerWithConversation:(id)a3 delegate:(id)a4
{
  id v6 = objc_allocWithZone((Class)type metadata accessor for ModernDetailsController());
  id v7 = a3;
  swift_unknownObjectRetain_n();
  id v8 = v7;
  v9 = sub_18F53D198(v8, (uint64_t)a4);

  swift_unknownObjectRelease();

  return v9;
}

- (CKModernDetailsControllerFactory)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ModernDetailsControllerFactory();
  return [(CKModernDetailsControllerFactory *)&v3 init];
}

@end
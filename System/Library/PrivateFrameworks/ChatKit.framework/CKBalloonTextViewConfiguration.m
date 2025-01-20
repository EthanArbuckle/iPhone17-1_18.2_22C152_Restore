@interface CKBalloonTextViewConfiguration
+ (id)defaultConfiguration;
- (BOOL)expressiveTextEnabled;
- (BOOL)textKit2Enabled;
- (CKBalloonTextViewConfiguration)init;
@end

@implementation CKBalloonTextViewConfiguration

- (BOOL)textKit2Enabled
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR___CKBalloonTextViewConfiguration_textKit2Enabled);
}

- (BOOL)expressiveTextEnabled
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR___CKBalloonTextViewConfiguration_expressiveTextEnabled);
}

+ (id)defaultConfiguration
{
  id v2 = objc_msgSend(self, sel_sharedFeatureFlags);
  unsigned int v3 = objc_msgSend(v2, sel_isTextKit2Enabled);
  char v4 = v3;
  if (v3) {
    unsigned __int8 v5 = objc_msgSend(v2, sel_isExpressiveTextEnabled);
  }
  else {
    unsigned __int8 v5 = 0;
  }
  v6 = (objc_class *)type metadata accessor for BalloonTextViewConfiguration();
  v7 = objc_allocWithZone(v6);
  v7[OBJC_IVAR___CKBalloonTextViewConfiguration_textKit2Enabled] = v4;
  v7[OBJC_IVAR___CKBalloonTextViewConfiguration_expressiveTextEnabled] = v5;
  v10.receiver = v7;
  v10.super_class = v6;
  id v8 = objc_msgSendSuper2(&v10, sel_init);

  return v8;
}

- (CKBalloonTextViewConfiguration)init
{
  result = (CKBalloonTextViewConfiguration *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
@interface EKRemoteUIButtonAction
+ (NSString)Done;
+ (NSString)PresentEmailCompose;
+ (NSString)PresentShareSheet;
- (_TtC10EventKitUI22EKRemoteUIButtonAction)init;
@end

@implementation EKRemoteUIButtonAction

+ (NSString)Done
{
  v2 = (void *)sub_1B411E898();

  return (NSString *)v2;
}

+ (NSString)PresentShareSheet
{
  v2 = (void *)sub_1B411E898();

  return (NSString *)v2;
}

+ (NSString)PresentEmailCompose
{
  v2 = (void *)sub_1B411E898();

  return (NSString *)v2;
}

- (_TtC10EventKitUI22EKRemoteUIButtonAction)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for EKRemoteUIButtonAction();
  return [(EKRemoteUIButtonAction *)&v3 init];
}

@end
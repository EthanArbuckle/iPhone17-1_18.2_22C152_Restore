@interface CKAppCardLoadingViewProvider
+ (id)spinnerViewController;
- (CKAppCardLoadingViewProvider)init;
@end

@implementation CKAppCardLoadingViewProvider

+ (id)spinnerViewController
{
  id v2 = objc_allocWithZone((Class)__swift_instantiateConcreteTypeFromMangledName(&qword_1E923E7D0));
  v3 = (void *)sub_18F7B7D30();

  return v3;
}

- (CKAppCardLoadingViewProvider)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for AppCardLoadingViewProvider();
  return [(CKAppCardLoadingViewProvider *)&v3 init];
}

@end
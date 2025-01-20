@interface DOCFilenameTransitioningDelegate
- (_TtC33com_apple_DocumentManager_ServiceP33_FF8FEF0715E7699D7C3880DD173B58EB32DOCFilenameTransitioningDelegate)init;
- (id)animationControllerForDismissedController:(id)a3;
- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5;
@end

@implementation DOCFilenameTransitioningDelegate

- (id)animationControllerForDismissedController:(id)a3
{
  id v4 = a3;
  v5 = self;
  id v6 = sub_10038CD70();

  return v6;
}

- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = self;
  id v12 = sub_10038CD70();

  return v12;
}

- (_TtC33com_apple_DocumentManager_ServiceP33_FF8FEF0715E7699D7C3880DD173B58EB32DOCFilenameTransitioningDelegate)init
{
  result = (_TtC33com_apple_DocumentManager_ServiceP33_FF8FEF0715E7699D7C3880DD173B58EB32DOCFilenameTransitioningDelegate *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end
@interface FPUIActionViewController
- (void)performDismiss:(id)a3;
@end

@implementation FPUIActionViewController

- (void)performDismiss:(id)a3
{
  v8[4] = sub_100155714;
  v8[5] = 0;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 1107296256;
  v8[2] = sub_100053418;
  v8[3] = &unk_1005C4F40;
  v5 = _Block_copy(v8);
  id v6 = a3;
  v7 = self;
  [(FPUIActionViewController *)v7 dismissViewControllerAnimated:1 completion:v5];
  _Block_release(v5);
}

@end
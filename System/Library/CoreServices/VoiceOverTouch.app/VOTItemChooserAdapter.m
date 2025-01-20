@interface VOTItemChooserAdapter
+ (id)sharedInstance;
- (void)showItemChooser:(BOOL)a3 withItems:(id)a4;
@end

@implementation VOTItemChooserAdapter

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000E1BB0;
  block[3] = &unk_1001B3580;
  block[4] = a1;
  if (qword_1001EBB20 != -1) {
    dispatch_once(&qword_1001EBB20, block);
  }
  v2 = (void *)qword_1001EBB28;

  return v2;
}

- (void)showItemChooser:(BOOL)a3 withItems:(id)a4
{
  BOOL v4 = a3;
  id v7 = a4;
  v5 = +[AXSpringBoardServer server];
  v6 = v5;
  if (v7 && v4) {
    [v5 showRemoteView:0 withData:v7];
  }
  else {
    [v5 hideRemoteView:0];
  }
}

@end
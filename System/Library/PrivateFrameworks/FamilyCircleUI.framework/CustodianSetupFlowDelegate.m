@interface CustodianSetupFlowDelegate
- (_TtC14FamilyCircleUI26CustodianSetupFlowDelegate)init;
- (void)custodianSetupFlowControllerDidFinish:(id)a3;
@end

@implementation CustodianSetupFlowDelegate

- (void)custodianSetupFlowControllerDidFinish:(id)a3
{
  id v4 = a3;
  v5 = self;
  objc_msgSend(v4, sel_dismissViewControllerAnimated_completion_, 1, 0);
  id v6 = objc_msgSend(self, sel_defaultCenter);
  id v7 = v6;
  if (qword_267BE83B8 != -1)
  {
    swift_once();
    id v6 = v7;
  }
  objc_msgSend(v6, sel_postNotificationName_object_userInfo_deliverImmediately_, qword_267BEB440, 0, 0, 1);
}

- (_TtC14FamilyCircleUI26CustodianSetupFlowDelegate)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CustodianSetupFlowDelegate();
  return [(CustodianSetupFlowDelegate *)&v3 init];
}

@end
@interface UITableViewController(CKBlackHoleUtilities)
- (void)_confirmDeleteConversationFromView:()CKBlackHoleUtilities alertTitle:forMultipleConversations:withReportSpamHander:withNotReportSpamHandler:withCancelHandler:;
@end

@implementation UITableViewController(CKBlackHoleUtilities)

- (void)_confirmDeleteConversationFromView:()CKBlackHoleUtilities alertTitle:forMultipleConversations:withReportSpamHander:withNotReportSpamHandler:withCancelHandler:
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a6;
  id v17 = a7;
  id v30 = a8;
  v18 = +[CKAlertController alertControllerWithTitle:v15 message:0 preferredStyle:0];
  location[0] = 0;
  objc_initWeak(location, a1);
  v19 = CKFrameworkBundle();
  if (a5) {
    [v19 localizedStringForKey:@"CLEAR_ALL" value:&stru_1EDE4CA38 table:@"ChatKit"];
  }
  else {
  v20 = [v19 localizedStringForKey:@"DELETE" value:&stru_1EDE4CA38 table:@"ChatKit"];
  }
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __182__UITableViewController_CKBlackHoleUtilities___confirmDeleteConversationFromView_alertTitle_forMultipleConversations_withReportSpamHander_withNotReportSpamHandler_withCancelHandler___block_invoke;
  v33[3] = &unk_1E56213A8;
  char v39 = a5;
  id v21 = v16;
  id v36 = v21;
  id v22 = v17;
  id v37 = v22;
  id v23 = v18;
  id v34 = v23;
  id v24 = v14;
  id v35 = v24;
  objc_copyWeak(&v38, location);
  v25 = +[CKAlertAction actionWithTitle:v20 style:2 handler:v33];
  [v23 addAction:v25];

  v26 = CKFrameworkBundle();
  v27 = [v26 localizedStringForKey:@"CANCEL" value:&stru_1EDE4CA38 table:@"ChatKit"];
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __182__UITableViewController_CKBlackHoleUtilities___confirmDeleteConversationFromView_alertTitle_forMultipleConversations_withReportSpamHander_withNotReportSpamHandler_withCancelHandler___block_invoke_4;
  v31[3] = &unk_1E5621380;
  id v28 = v30;
  id v32 = v28;
  v29 = +[CKAlertAction actionWithTitle:v27 style:1 handler:v31];
  [v23 addAction:v29];

  [a1 presentViewController:v23 animated:1 completion:0];
  objc_destroyWeak(&v38);

  objc_destroyWeak(location);
}

@end
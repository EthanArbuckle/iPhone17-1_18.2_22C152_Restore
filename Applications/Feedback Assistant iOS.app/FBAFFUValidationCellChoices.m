@interface FBAFFUValidationCellChoices
+ (void)showValidationChoicesForCellAtIndexPath:(id)a3 followup:(id)a4 fromViewController:(id)a5 completion:(id)a6;
@end

@implementation FBAFFUValidationCellChoices

+ (void)showValidationChoicesForCellAtIndexPath:(id)a3 followup:(id)a4 fromViewController:(id)a5 completion:(id)a6
{
  id v35 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  v12 = [v9 noChoiceText];
  v46[0] = v12;
  v13 = [v9 negativeChoice];
  v46[1] = v13;
  v34 = v9;
  v14 = [v9 positiveChoice];
  v46[2] = v14;
  v36 = +[NSArray arrayWithObjects:v46 count:3];

  v33 = v10;
  v15 = [v10 tableView];
  v16 = +[UIAlertController alertControllerWithTitle:0 message:0 preferredStyle:0];
  uint64_t v17 = 2;
  do
  {
    v18 = [v36 objectAtIndex:v17];
    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472;
    v37[2] = sub_100038280;
    v37[3] = &unk_1000F38A8;
    id v19 = v15;
    id v38 = v19;
    id v20 = v35;
    id v39 = v20;
    id v21 = v11;
    id v40 = v21;
    uint64_t v41 = v17;
    v22 = +[UIAlertAction actionWithTitle:v18 style:0 handler:v37];

    [v16 addAction:v22];
    --v17;
  }
  while (v17);
  v23 = +[NSBundle mainBundle];
  v24 = [v23 localizedStringForKey:@"CANCEL" value:&stru_1000F6658 table:0];
  v42[0] = _NSConcreteStackBlock;
  v42[1] = 3221225472;
  v42[2] = sub_100038230;
  v42[3] = &unk_1000F3880;
  id v43 = v19;
  id v44 = v20;
  id v45 = v21;
  id v25 = v21;
  id v26 = v20;
  id v27 = v19;
  v28 = +[UIAlertAction actionWithTitle:v24 style:1 handler:v42];

  v29 = v16;
  [v16 addAction:v28];

  v30 = [v16 popoverPresentationController];
  v31 = [v33 tableView];
  v32 = [v31 cellForRowAtIndexPath:v26];

  [v30 setSourceView:v32];
  [v32 bounds];
  [v30 setSourceRect:];
  [v30 setPermittedArrowDirections:15];
  [v33 presentViewController:v29 animated:1 completion:&stru_1000F38C8];
}

@end
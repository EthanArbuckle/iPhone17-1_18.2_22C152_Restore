@interface CNIncomingCallSnapshotViewController
+ (CGRect)horizontalNameLabelBoundingRectForName:(id)a3 window:(id)a4;
+ (CGRect)verticalNameLabelBoundingRectForName:(id)a3 window:(id)a4;
+ (id)posterDisplayNameComponentsForContact:(id)a3;
+ (int64_t)styleIncludingCallButtons:(BOOL)a3 canShowPoster:(BOOL)a4;
+ (void)incomingCallAvatarSnapshotForAvatarImageData:(id)a3 contact:(id)a4 windowScene:(id)a5 completionBlock:(id)a6;
+ (void)incomingCallPlaceholderSnapshotForContact:(id)a3 windowScene:(id)a4 completionBlock:(id)a5;
+ (void)incomingCallSnapshotForConfiguration:(id)a3 contact:(id)a4 includingCallButtons:(BOOL)a5 windowScene:(id)a6 completionBlock:(id)a7;
+ (void)incomingCallSnapshotForConfiguration:(id)a3 nameString:(id)a4 includingCallButtons:(BOOL)a5 windowScene:(id)a6 completionBlock:(id)a7;
+ (void)incomingCallSnapshotForConfiguration:(id)a3 style:(int64_t)a4 contact:(id)a5 nameString:(id)a6 avatarImage:(id)a7 windowScene:(id)a8 completionBlock:(id)a9;
+ (void)incomingCallSnapshotForPosterArchiveData:(id)a3 contact:(id)a4 includingCallButtons:(BOOL)a5 windowScene:(id)a6 completionBlock:(id)a7;
- (NSString)nameString;
- (TPInComingCallUISnapshotViewController)snapshotViewController;
- (void)setNameString:(id)a3;
- (void)setSnapshotViewController:(id)a3;
@end

@implementation CNIncomingCallSnapshotViewController

+ (int64_t)styleIncludingCallButtons:(BOOL)a3 canShowPoster:(BOOL)a4
{
  BOOL v4 = !a4;
  if (a3 && !v4) {
    return 3;
  }
  int v6 = v4 || a3;
  int64_t v7 = 4;
  if (a3 && !a4) {
    int64_t v7 = 5;
  }
  if (v6 == 1) {
    return v7;
  }
  else {
    return 1;
  }
}

+ (void)incomingCallSnapshotForConfiguration:(id)a3 style:(int64_t)a4 contact:(id)a5 nameString:(id)a6 avatarImage:(id)a7 windowScene:(id)a8 completionBlock:(id)a9
{
  id v14 = a3;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  id v19 = a9;
  if ([getTPInComingCallUISnapshotViewControllerClass() instancesRespondToSelector:sel_initWithConfiguration_style_nameString_avatarImage_])
  {
    id v20 = objc_alloc((Class)getTPInComingCallUISnapshotViewControllerClass());
    v21 = [v14 wrappedPosterConfiguration];
    if (v15) {
      uint64_t v22 = [v20 initWithConfiguration:v21 style:a4 contact:v15 avatarImage:v17];
    }
    else {
      uint64_t v22 = [v20 initWithConfiguration:v21 style:a4 nameString:v16 avatarImage:v17];
    }
  }
  else
  {
    id v23 = objc_alloc((Class)getTPInComingCallUISnapshotViewControllerClass());
    v21 = [v14 wrappedPosterConfiguration];
    uint64_t v22 = [v23 initWithConfiguration:v21 style:a4 contact:v15 fallbackText:&stru_1ED8AC728];
  }
  v24 = (void *)v22;

  v25 = [MEMORY[0x1E4F5A4E8] mainThreadScheduler];
  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = __142__CNIncomingCallSnapshotViewController_incomingCallSnapshotForConfiguration_style_contact_nameString_avatarImage_windowScene_completionBlock___block_invoke;
  v37[3] = &unk_1E549B488;
  id v26 = v24;
  id v38 = v26;
  [v25 performBlock:v37];

  v27 = +[CNUIContactsEnvironment currentEnvironment];
  v28 = [v27 defaultSchedulerProvider];
  v29 = (void *)[v28 newSerialSchedulerWithName:@"com.apple.ContactsUI.CNIncomingCallSnapshotViewController.snapshottingQueue"];
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __142__CNIncomingCallSnapshotViewController_incomingCallSnapshotForConfiguration_style_contact_nameString_avatarImage_windowScene_completionBlock___block_invoke_2;
  v33[3] = &unk_1E549AFF8;
  id v34 = v26;
  id v35 = v18;
  id v36 = v19;
  id v30 = v19;
  id v31 = v18;
  id v32 = v26;
  [v29 performBlock:v33];
}

void __142__CNIncomingCallSnapshotViewController_incomingCallSnapshotForConfiguration_style_contact_nameString_avatarImage_windowScene_completionBlock___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) view];
  [v1 setNeedsLayout];
}

void __142__CNIncomingCallSnapshotViewController_incomingCallSnapshotForConfiguration_style_contact_nameString_avatarImage_windowScene_completionBlock___block_invoke_2(uint64_t a1)
{
  id v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __142__CNIncomingCallSnapshotViewController_incomingCallSnapshotForConfiguration_style_contact_nameString_avatarImage_windowScene_completionBlock___block_invoke_3;
  v3[3] = &unk_1E549A4B8;
  id v4 = *(id *)(a1 + 48);
  [v1 snapshotWithOptions:0 windowScene:v2 completionBlock:v3];
}

void __142__CNIncomingCallSnapshotViewController_incomingCallSnapshotForConfiguration_style_contact_nameString_avatarImage_windowScene_completionBlock___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  int64_t v7 = [MEMORY[0x1E4F5A4E8] mainThreadScheduler];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __142__CNIncomingCallSnapshotViewController_incomingCallSnapshotForConfiguration_style_contact_nameString_avatarImage_windowScene_completionBlock___block_invoke_4;
  v11[3] = &unk_1E549AFF8;
  id v8 = *(id *)(a1 + 32);
  id v13 = v6;
  id v14 = v8;
  id v12 = v5;
  id v9 = v6;
  id v10 = v5;
  [v7 performBlock:v11];
}

uint64_t __142__CNIncomingCallSnapshotViewController_incomingCallSnapshotForConfiguration_style_contact_nameString_avatarImage_windowScene_completionBlock___block_invoke_4(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

+ (void)incomingCallSnapshotForConfiguration:(id)a3 contact:(id)a4 includingCallButtons:(BOOL)a5 windowScene:(id)a6 completionBlock:(id)a7
{
  BOOL v8 = a5;
  BOOL v11 = a3 != 0;
  id v12 = a7;
  id v13 = a6;
  id v14 = a4;
  id v16 = a3;
  uint64_t v15 = [(id)objc_opt_class() styleIncludingCallButtons:v8 canShowPoster:v11];
  [(id)objc_opt_class() incomingCallSnapshotForConfiguration:v16 style:v15 contact:v14 nameString:0 avatarImage:0 windowScene:v13 completionBlock:v12];
}

+ (void)incomingCallSnapshotForConfiguration:(id)a3 nameString:(id)a4 includingCallButtons:(BOOL)a5 windowScene:(id)a6 completionBlock:(id)a7
{
  BOOL v8 = a5;
  BOOL v11 = a3 != 0;
  id v12 = a7;
  id v13 = a6;
  id v14 = a4;
  id v16 = a3;
  uint64_t v15 = [(id)objc_opt_class() styleIncludingCallButtons:v8 canShowPoster:v11];
  [(id)objc_opt_class() incomingCallSnapshotForConfiguration:v16 style:v15 contact:0 nameString:v14 avatarImage:0 windowScene:v13 completionBlock:v12];
}

+ (void)incomingCallSnapshotForPosterArchiveData:(id)a3 contact:(id)a4 includingCallButtons:(BOOL)a5 windowScene:(id)a6 completionBlock:(id)a7
{
  BOOL v8 = a5;
  id v11 = a7;
  id v12 = a6;
  id v13 = a4;
  id v14 = +[CNPRSPosterArchiver unarchiveCNConfigurationFromData:a3 error:0];
  [(id)objc_opt_class() incomingCallSnapshotForConfiguration:v14 contact:v13 includingCallButtons:v8 windowScene:v12 completionBlock:v11];
}

+ (void)incomingCallAvatarSnapshotForAvatarImageData:(id)a3 contact:(id)a4 windowScene:(id)a5 completionBlock:(id)a6
{
  id v9 = (void *)MEMORY[0x1E4FB1818];
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v15 = [v9 imageWithData:a3];
  LODWORD(a3) = [getTPInComingCallUISnapshotViewControllerClass() instancesRespondToSelector:sel_initWithConfiguration_style_nameString_avatarImage_];
  id v13 = objc_opt_class();
  if (a3) {
    uint64_t v14 = 6;
  }
  else {
    uint64_t v14 = 5;
  }
  [v13 incomingCallSnapshotForConfiguration:0 style:v14 contact:v12 nameString:0 avatarImage:v15 windowScene:v11 completionBlock:v10];
}

+ (void)incomingCallPlaceholderSnapshotForContact:(id)a3 windowScene:(id)a4 completionBlock:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  [(id)objc_opt_class() incomingCallSnapshotForConfiguration:0 style:5 contact:v9 nameString:0 avatarImage:0 windowScene:v8 completionBlock:v7];
}

+ (CGRect)horizontalNameLabelBoundingRectForName:(id)a3 window:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  [getTPInComingCallUISnapshotViewControllerClass() horizontalNameLabelBoundingRectForName:v6 window:v5];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;

  double v15 = v8;
  double v16 = v10;
  double v17 = v12;
  double v18 = v14;
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

+ (CGRect)verticalNameLabelBoundingRectForName:(id)a3 window:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  [getTPInComingCallUISnapshotViewControllerClass() verticalNameLabelBoundingRectForName:v6 window:v5];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;

  double v15 = v8;
  double v16 = v10;
  double v17 = v12;
  double v18 = v14;
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

+ (id)posterDisplayNameComponentsForContact:(id)a3
{
  id v3 = a3;
  id v4 = [getTPInComingCallUISnapshotViewControllerClass() posterDisplayNameComponentsForContact:v3];

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_snapshotViewController, 0);

  objc_storeStrong((id *)&self->_nameString, 0);
}

- (void)setSnapshotViewController:(id)a3
{
}

- (TPInComingCallUISnapshotViewController)snapshotViewController
{
  return self->_snapshotViewController;
}

- (void)setNameString:(id)a3
{
}

- (NSString)nameString
{
  return self->_nameString;
}

@end
@interface UIAlertController(HUAdditions)
+ (id)alertControllerForAddingDestinationWithType:()HUAdditions andProceed:;
+ (id)alertControllerForAddingDestinationWithTypeString:()HUAdditions andProceed:;
+ (id)hu_actionSheetWithTitle:()HUAdditions message:anchorView:;
+ (id)hu_alertControllerForAcknowledgementWithTitle:()HUAdditions message:;
+ (id)hu_alertControllerForAddingPersonWithCompletionHandler:()HUAdditions;
+ (id)hu_alertControllerForUnimplementedFeature:()HUAdditions;
+ (id)hu_alertControllerWithActivityIndicatorAndTitle:()HUAdditions;
+ (uint64_t)alertControllerForAddingHomeWithProceed:()HUAdditions;
+ (uint64_t)alertControllerForAddingRoomWithProceed:()HUAdditions;
+ (uint64_t)alertControllerForAddingServiceGroupWithProceed:()HUAdditions;
+ (uint64_t)alertControllerForAddingZoneWithProceed:()HUAdditions;
- (void)hu_anchorActionSheetIfNeededFrom:()HUAdditions;
@end

@implementation UIAlertController(HUAdditions)

+ (uint64_t)alertControllerForAddingHomeWithProceed:()HUAdditions
{
  return [a1 alertControllerForAddingDestinationWithType:0 andProceed:a3];
}

+ (uint64_t)alertControllerForAddingZoneWithProceed:()HUAdditions
{
  return [a1 alertControllerForAddingDestinationWithType:1 andProceed:a3];
}

+ (uint64_t)alertControllerForAddingRoomWithProceed:()HUAdditions
{
  return [a1 alertControllerForAddingDestinationWithType:2 andProceed:a3];
}

+ (uint64_t)alertControllerForAddingServiceGroupWithProceed:()HUAdditions
{
  return [a1 alertControllerForAddingDestinationWithType:3 andProceed:a3];
}

+ (id)alertControllerForAddingDestinationWithType:()HUAdditions andProceed:
{
  id v5 = a4;
  if (a3 > 3)
  {
    v7 = 0;
    v9 = 0;
  }
  else
  {
    v6 = off_1E6389450[a3];
    v7 = _HULocalizedStringWithDefaultValue(off_1E6389430[a3], off_1E6389430[a3], 1);
    uint64_t v8 = _HULocalizedStringWithDefaultValue(v6, v6, 1);
    v9 = (void *)v8;
    if (v7) {
      BOOL v10 = v8 == 0;
    }
    else {
      BOOL v10 = 1;
    }
    if (!v10)
    {
      v11 = [MEMORY[0x1E4F42728] alertControllerWithTitle:v7 message:v8 preferredStyle:1];
      [v11 addTextFieldWithConfigurationHandler:&__block_literal_global_77];
      v12 = (void *)MEMORY[0x1E4F42720];
      v13 = _HULocalizedStringWithDefaultValue(@"HUAlertCancel", @"HUAlertCancel", 1);
      v14 = [v12 actionWithTitle:v13 style:1 handler:&__block_literal_global_29];
      [v11 addAction:v14];

      v15 = (void *)MEMORY[0x1E4F42720];
      v16 = _HULocalizedStringWithDefaultValue(@"HUAlertAdd", @"HUAlertAdd", 1);
      uint64_t v20 = MEMORY[0x1E4F143A8];
      uint64_t v21 = 3221225472;
      v22 = __89__UIAlertController_HUAdditions__alertControllerForAddingDestinationWithType_andProceed___block_invoke_33;
      v23 = &unk_1E6389410;
      id v17 = v11;
      id v24 = v17;
      id v25 = v5;
      v18 = [v15 actionWithTitle:v16 style:0 handler:&v20];
      objc_msgSend(v17, "addAction:", v18, v20, v21, v22, v23);

      if (v17) {
        goto LABEL_10;
      }
    }
  }
  NSLog(&cfstr_Alertcontrolle.isa);
  id v17 = 0;
LABEL_10:

  return v17;
}

+ (id)alertControllerForAddingDestinationWithTypeString:()HUAdditions andProceed:
{
  id v5 = a4;
  v6 = NSString;
  id v7 = a3;
  uint64_t v8 = [v7 capitalizedString];
  v9 = [v6 stringWithFormat:@"Add %@", v8];

  BOOL v10 = NSString;
  v11 = [v7 lowercaseString];

  v12 = [v10 stringWithFormat:@"Enter a name for this %@.", v11];

  v13 = [MEMORY[0x1E4F42728] alertControllerWithTitle:v9 message:v12 preferredStyle:1];
  [v13 addTextFieldWithConfigurationHandler:&__block_literal_global_46];
  v14 = [MEMORY[0x1E4F42720] actionWithTitle:@"Cancel" style:1 handler:&__block_literal_global_51];
  [v13 addAction:v14];

  v15 = (void *)MEMORY[0x1E4F42720];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __95__UIAlertController_HUAdditions__alertControllerForAddingDestinationWithTypeString_andProceed___block_invoke_55;
  v22[3] = &unk_1E6389410;
  id v16 = v13;
  id v23 = v16;
  id v24 = v5;
  id v17 = v5;
  v18 = [v15 actionWithTitle:@"Add" style:0 handler:v22];
  [v16 addAction:v18];

  v19 = v24;
  id v20 = v16;

  return v20;
}

+ (id)hu_alertControllerForUnimplementedFeature:()HUAdditions
{
  v3 = (void *)MEMORY[0x1E4F42728];
  v4 = [NSString stringWithFormat:@"%@ is not yet implemented.", a3];
  id v5 = [v3 alertControllerWithTitle:@"Not Implemented" message:v4 preferredStyle:1];

  v6 = [MEMORY[0x1E4F42720] actionWithTitle:@"That's Lame" style:1 handler:&__block_literal_global_66];
  [v5 addAction:v6];

  return v5;
}

+ (id)hu_alertControllerWithActivityIndicatorAndTitle:()HUAdditions
{
  v18[2] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = objc_opt_new();
  [v4 setText:v3];

  id v5 = [MEMORY[0x1E4F6A420] preferredFontForTextStyle:*MEMORY[0x1E4F43870] traits:2];
  [v4 setFont:v5];

  [v4 setLineBreakMode:2];
  [v4 setAdjustsFontSizeToFitWidth:1];
  [v4 setNeedsDisplayOnBoundsChange:1];
  v6 = [v4 font];
  [v6 pointSize];
  [v4 setMinimumScaleFactor:10.0 / v7];

  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F42708]) initWithActivityIndicatorStyle:100];
  [v8 sizeToFit];
  [v8 startAnimating];
  id v9 = objc_alloc(MEMORY[0x1E4F42E20]);
  v18[0] = v8;
  v18[1] = v4;
  BOOL v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:2];
  v11 = (void *)[v9 initWithArrangedSubviews:v10];

  [v11 setSpacing:8.0];
  [v11 setDistribution:0];
  [v11 setAlignment:3];
  [v11 setLayoutMarginsRelativeArrangement:1];
  [v11 sizeToFit];
  v12 = objc_opt_new();
  [v12 setView:v11];
  [v11 bounds];
  objc_msgSend(v12, "setPreferredContentSize:", v13, v14);
  v15 = [MEMORY[0x1E4F42728] alertControllerWithTitle:0 message:0 preferredStyle:1];
  id v16 = [MEMORY[0x1E4F42720] _actionWithContentViewController:v12 style:0];
  [v15 addAction:v16];

  return v15;
}

+ (id)hu_alertControllerForAcknowledgementWithTitle:()HUAdditions message:
{
  v4 = [MEMORY[0x1E4F42728] alertControllerWithTitle:a3 message:a4 preferredStyle:1];
  id v5 = _HULocalizedStringWithDefaultValue(@"HUOkTitle", @"HUOkTitle", 1);
  v6 = [MEMORY[0x1E4F42720] actionWithTitle:v5 style:0 handler:&__block_literal_global_77];
  [v4 addAction:v6];

  return v4;
}

+ (id)hu_alertControllerForAddingPersonWithCompletionHandler:()HUAdditions
{
  id v3 = a3;
  v4 = (void *)MEMORY[0x1E4F42728];
  id v5 = _HULocalizedStringWithDefaultValue(@"HUUsersHH2InviteAlertTitle", @"HUUsersHH2InviteAlertTitle", 1);
  v6 = _HULocalizedStringWithDefaultValue(@"HUUsersHH2InviteAlertMessage", @"HUUsersHH2InviteAlertMessage", 1);
  double v7 = [v4 alertControllerWithTitle:v5 message:v6 preferredStyle:1];

  uint64_t v8 = _HULocalizedStringWithDefaultValue(@"HUUsersHH2InviteAlertConfirmTitle", @"HUUsersHH2InviteAlertConfirmTitle", 1);
  id v9 = (void *)MEMORY[0x1E4F42720];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __89__UIAlertController_HUAdditions__hu_alertControllerForAddingPersonWithCompletionHandler___block_invoke;
  v25[3] = &unk_1E6389410;
  id v26 = v8;
  id v10 = v3;
  id v27 = v10;
  id v11 = v8;
  v12 = [v9 actionWithTitle:v11 style:0 handler:v25];
  [v7 addAction:v12];
  double v13 = _HULocalizedStringWithDefaultValue(@"HUUsersHH2InviteAlertIgnoreTitle", @"HUUsersHH2InviteAlertIgnoreTitle", 1);
  double v14 = (void *)MEMORY[0x1E4F42720];
  uint64_t v19 = MEMORY[0x1E4F143A8];
  uint64_t v20 = 3221225472;
  uint64_t v21 = __89__UIAlertController_HUAdditions__hu_alertControllerForAddingPersonWithCompletionHandler___block_invoke_90;
  v22 = &unk_1E6389410;
  id v23 = v13;
  id v24 = v10;
  id v15 = v10;
  id v16 = v13;
  id v17 = [v14 actionWithTitle:v16 style:0 handler:&v19];
  objc_msgSend(v7, "addAction:", v17, v19, v20, v21, v22);

  return v7;
}

+ (id)hu_actionSheetWithTitle:()HUAdditions message:anchorView:
{
  double v7 = (void *)MEMORY[0x1E4F42728];
  id v8 = a5;
  id v9 = [v7 alertControllerWithTitle:a3 message:a4 preferredStyle:0];
  objc_msgSend(v9, "hu_anchorActionSheetIfNeededFrom:", v8);

  return v9;
}

- (void)hu_anchorActionSheetIfNeededFrom:()HUAdditions
{
  id v6 = a3;
  if (v6)
  {
    v4 = [a1 popoverPresentationController];

    if (v4)
    {
      id v5 = [a1 popoverPresentationController];
      [v5 setSourceView:v6];
    }
  }
}

@end
@interface CNQuickPropertyAction
- (BOOL)enabled;
- (CNQuickPropertyAction)initWithPropertyAction:(id)a3;
- (id)_coreDuetValue;
- (id)identifier;
- (id)propertyItem;
- (id)subtitleForContext:(int64_t)a3;
- (id)titleForContext:(int64_t)a3;
- (unint64_t)score;
- (void)performWithCompletionBlock:(id)a3;
@end

@implementation CNQuickPropertyAction

- (void)performWithCompletionBlock:(id)a3
{
  id v4 = a3;
  if (+[CNQuickAction reallyPerform])
  {
    v33.receiver = self;
    v33.super_class = (Class)CNQuickPropertyAction;
    [(CNQuickContactAction *)&v33 performWithCompletionBlock:v4];
  }
  else
  {
    v5 = [(CNQuickAction *)self globalIdentifier];
    NSLog(&cfstr_PerformAction.isa, v5);

    [(CNQuickContactAction *)self setCompletionBlock:v4];
    v6 = [(CNQuickAction *)self globalIdentifier];
    v7 = [(CNQuickPropertyAction *)self propertyItem];
    v8 = [v7 displayValue];

    v9 = [(CNQuickPropertyAction *)self propertyAction];
    v10 = [v9 contact];

    v11 = [(CNQuickAction *)self category];
    int v12 = [v11 isEqualToString:CNQuickActionCategoryAudioCall];

    if (v12)
    {
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass) {
        v6 = @"FaceTime Audio with";
      }
      else {
        v6 = @"Call";
      }
    }
    else
    {
      v14 = [(CNQuickAction *)self category];
      int v15 = [v14 isEqualToString:CNQuickActionCategoryVideoCall];

      if (v15)
      {

        v6 = @"FaceTime with";
      }
      else
      {
        v16 = [(CNQuickAction *)self category];
        int v17 = [v16 isEqualToString:CNQuickActionCategoryInstantMessage];

        if (v17)
        {

          v6 = @"Send message to";
        }
        else
        {
          v18 = [(CNQuickAction *)self category];
          int v19 = [v18 isEqualToString:CNQuickActionCategoryMail];

          if (v19)
          {

            v6 = @"Send email to";
          }
        }
      }
    }
    v20 = NSString;
    v21 = [MEMORY[0x1E4F1B910] stringFromContact:v10 style:0];
    v22 = [v20 stringWithFormat:@"%@ %@ on %@\n\nNote: If you want to really perform the action, go to Internal Settings > Contacts and enable Quick Actions Perform.", v6, v21, v8];

    v23 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:@"Performing action" message:v22 preferredStyle:1];
    v24 = (void *)MEMORY[0x1E4FB1410];
    v25 = CNContactsUIBundle();
    v26 = [v25 localizedStringForKey:@"OK" value:&stru_1ED8AC728 table:@"Localized"];
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __52__CNQuickPropertyAction_performWithCompletionBlock___block_invoke;
    v30[3] = &unk_1E549BC48;
    id v31 = v23;
    v32 = self;
    id v27 = v23;
    v28 = [v24 actionWithTitle:v26 style:0 handler:v30];
    [v27 addAction:v28];

    v29 = [(CNQuickContactAction *)self delegate];
    [v29 contactAction:self presentViewController:v27];
  }
}

void __52__CNQuickPropertyAction_performWithCompletionBlock___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) dismissViewControllerAnimated:1 completion:0];
  v2 = *(void **)(a1 + 40);
  id v3 = [v2 propertyAction];
  [v2 actionDidFinish:v3];
}

- (unint64_t)score
{
  v9.receiver = self;
  v9.super_class = (Class)CNQuickPropertyAction;
  id v3 = [(CNQuickAction *)&v9 score];
  id v4 = [(CNQuickPropertyAction *)self propertyAction];
  v5 = [v4 contact];
  v6 = +[CNQuickActionsUsageManager managerForContact:v5];

  [v6 scoreForAction:self];
  if (v7 > 0.0) {
    v3 += vcvtpd_u64_f64((v7 + 1.0) * 1000.0);
  }

  return (unint64_t)v3;
}

- (BOOL)enabled
{
  if ([(CNQuickAction *)self cached])
  {
    v6.receiver = self;
    v6.super_class = (Class)CNQuickPropertyAction;
    return [(CNQuickAction *)&v6 enabled];
  }
  else
  {
    id v4 = [(CNQuickPropertyAction *)self propertyAction];
    char v5 = [v4 canPerformAction];

    return v5;
  }
}

- (id)subtitleForContext:(int64_t)a3
{
  if ((unint64_t)(a3 - 2) < 3)
  {
    id v3 = [(CNQuickPropertyAction *)self propertyItem];
    id v4 = [v3 displayValue];
LABEL_5:

    goto LABEL_7;
  }
  if (a3 == 1)
  {
    id v3 = [(CNQuickPropertyAction *)self propertyItem];
    char v5 = (void *)MEMORY[0x1E4F1BA20];
    objc_super v6 = [v3 labeledValue];
    double v7 = [v6 label];
    v8 = [v3 property];
    id v4 = [v5 localizedDisplayStringForLabel:v7 propertyName:v8];

    goto LABEL_5;
  }
  id v4 = 0;
LABEL_7:

  return v4;
}

- (id)titleForContext:(int64_t)a3
{
  if ((unint64_t)(a3 - 2) < 4) {
    goto LABEL_5;
  }
  if ((unint64_t)a3 < 2)
  {
    v6.receiver = self;
    v6.super_class = (Class)CNQuickPropertyAction;
    id v3 = -[CNQuickAction titleForContext:](&v6, sel_titleForContext_);
    goto LABEL_6;
  }
  if (a3 == 6)
  {
LABEL_5:
    id v4 = [(CNQuickPropertyAction *)self propertyItem];
    id v3 = [v4 displayLabel];
  }
LABEL_6:

  return v3;
}

- (id)_coreDuetValue
{
  v2 = [(CNQuickPropertyAction *)self propertyItem];
  id v3 = [v2 labeledValue];
  id v4 = [v3 value];

  return v4;
}

- (id)identifier
{
  v2 = [(CNQuickPropertyAction *)self propertyItem];
  id v3 = [v2 labeledValue];
  id v4 = [v3 identifier];

  return v4;
}

- (id)propertyItem
{
  v2 = [(CNQuickPropertyAction *)self propertyAction];
  id v3 = [v2 propertyItem];

  return v3;
}

- (CNQuickPropertyAction)initWithPropertyAction:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CNQuickPropertyAction;
  return [(CNQuickContactAction *)&v4 initWithContactAction:a3];
}

@end
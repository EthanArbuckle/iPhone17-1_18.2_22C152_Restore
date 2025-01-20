@interface CUIKContactDescriptionGenerator
+ (id)CUIKLabeledDisplayStringForContact:(id)a3 label:(id)a4;
+ (id)CUIKLabeledDisplayStringForContact:(id)a3 label:(id)a4 isMe:(BOOL)a5;
@end

@implementation CUIKContactDescriptionGenerator

+ (id)CUIKLabeledDisplayStringForContact:(id)a3 label:(id)a4
{
  v6 = (void *)MEMORY[0x1E4F576B0];
  id v7 = a4;
  id v8 = a3;
  v9 = [v6 defaultProvider];
  v10 = [v8 identifier];
  uint64_t v11 = [v9 contactIdentifierIsMe:v10];

  v12 = [a1 CUIKLabeledDisplayStringForContact:v8 label:v7 isMe:v11];

  return v12;
}

+ (id)CUIKLabeledDisplayStringForContact:(id)a3 label:(id)a4 isMe:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a3;
  id v8 = [MEMORY[0x1E4F1BA20] localizedStringForLabel:a4];
  v9 = [v8 localizedCapitalizedString];

  if (v5)
  {
    if (v9)
    {
      id v10 = v9;
      goto LABEL_13;
    }
    uint64_t v11 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    id v12 = [v11 localizedStringForKey:@"My Address" value:&stru_1F187C430 table:0];
  }
  else
  {
    uint64_t v11 = [MEMORY[0x1E4F1B910] stringFromContact:v7 style:0];
    if ([v7 contactType] != 1)
    {
      v13 = NSString;
      v14 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      v15 = v14;
      if (v9)
      {
        v16 = [v14 localizedStringForKey:@"%@’s %@" value:&stru_1F187C430 table:0];
        objc_msgSend(v13, "localizedStringWithFormat:", v16, v11, v9);
      }
      else
      {
        v16 = [v14 localizedStringForKey:@"%@’s address" value:&stru_1F187C430 table:0];
        objc_msgSend(v13, "localizedStringWithFormat:", v16, v11, v18);
      }
      id v10 = (id)objc_claimAutoreleasedReturnValue();

      goto LABEL_12;
    }
    id v12 = v11;
  }
  id v10 = v12;
LABEL_12:

LABEL_13:

  return v10;
}

@end
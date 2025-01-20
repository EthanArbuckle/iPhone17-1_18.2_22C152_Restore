@interface CNUIVCardUtilities
+ (id)fileNameForContact:(id)a3;
@end

@implementation CNUIVCardUtilities

+ (id)fileNameForContact:(id)a3
{
  v3 = [MEMORY[0x1E4F1B910] stringFromContact:a3 style:0];
  if (!v3)
  {
    v4 = CNContactsUIBundle();
    v3 = [v4 localizedStringForKey:@"VCARD_DEFAULT_FILE_NAME" value:&stru_1ED8AC728 table:@"Localized"];
  }
  v5 = [NSString stringWithFormat:@"%@.vcf", v3];

  return v5;
}

@end
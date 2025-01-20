@interface CNLabeledValue(UIAdditions)
+ (id)allCustomLabels;
+ (id)allLabels;
+ (id)builtinLabelsForProperty:()UIAdditions;
+ (id)defaultLabels;
+ (id)localizedDisplayStringForLabel:()UIAdditions propertyName:;
+ (uint64_t)addressBook;
+ (void)deleteCustomLabel:()UIAdditions;
- (id)localizedLabel;
@end

@implementation CNLabeledValue(UIAdditions)

- (id)localizedLabel
{
  v1 = [a1 label];
  if (v1)
  {
    v2 = [MEMORY[0x1E4F1BA20] localizedStringForLabel:v1];
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

+ (id)builtinLabelsForProperty:()UIAdditions
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (builtinLabelsForProperty__onceToken != -1) {
    dispatch_once(&builtinLabelsForProperty__onceToken, &__block_literal_global_8_16555);
  }
  if ([v3 isEqualToString:@"birthdays"])
  {
    v4 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    v5 = [v4 calendarIdentifier];
    v15[0] = v5;
    v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
    v7 = (void *)MEMORY[0x1E4F70FE8];
    v8 = [MEMORY[0x1E4F1CA20] currentLocale];
    v9 = [v8 localeIdentifier];
    v10 = [v7 lunarCalendarsForLocaleID:v9];
    v11 = [v6 arrayByAddingObjectsFromArray:v10];

    if (v11) {
      goto LABEL_8;
    }
  }
  else
  {
    v11 = [(id)builtinLabelsForProperty__labelsForProperty objectForKeyedSubscript:v3];
    if (v11) {
      goto LABEL_8;
    }
  }
  uint64_t v12 = *MEMORY[0x1E4F1B770];
  v14[0] = *MEMORY[0x1E4F1B6F8];
  v14[1] = v12;
  v14[2] = *MEMORY[0x1E4F1B700];
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:3];
LABEL_8:

  return v11;
}

+ (void)deleteCustomLabel:()UIAdditions
{
  id v3 = (void *)MEMORY[0x1E4F1BA20];
  id v4 = a3;
  [v3 addressBook];
  ABAddressBookDeleteLabel();
}

+ (id)allCustomLabels
{
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  id v3 = [a1 defaultLabels];
  id v4 = [v2 setWithArray:v3];

  v5 = (void *)MEMORY[0x1E4F1CA80];
  v6 = [a1 allLabels];
  v7 = [v5 setWithArray:v6];

  [v7 minusSet:v4];
  v8 = [v7 allObjects];

  return v8;
}

+ (id)allLabels
{
  [MEMORY[0x1E4F1BA20] addressBook];
  v0 = (void *)ABAddressBookCopyAllLabels();

  return v0;
}

+ (id)defaultLabels
{
  if (defaultLabels_onceToken != -1) {
    dispatch_once(&defaultLabels_onceToken, &__block_literal_global_3_16557);
  }
  v0 = (void *)defaultLabels_labels;

  return v0;
}

+ (id)localizedDisplayStringForLabel:()UIAdditions propertyName:
{
  id v6 = a4;
  v7 = [a1 localizedStringForLabel:a3];
  if ((*(unsigned int (**)(void))(*MEMORY[0x1E4F5A298] + 16))())
  {
    uint64_t v8 = CNUILocalizedStringForPropertyWithFormatKey(@"LOWERCASE_LABEL", v6);

    v7 = (void *)v8;
  }

  return v7;
}

+ (uint64_t)addressBook
{
  if (addressBook_onceToken != -1) {
    dispatch_once(&addressBook_onceToken, &__block_literal_global_16562);
  }
  return addressBook_ab;
}

@end
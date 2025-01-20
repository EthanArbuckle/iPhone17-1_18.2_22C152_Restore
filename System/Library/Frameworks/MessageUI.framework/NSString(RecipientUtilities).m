@interface NSString(RecipientUtilities)
+ (id)mf_commaSeparatedRecipientListWithRecipientCount:()RecipientUtilities prefixForRecipientAtIndex:stringForRecipientAtIndex:lengthValidationBlock:;
- (id)mf_copyDisplayableAddressComment;
@end

@implementation NSString(RecipientUtilities)

+ (id)mf_commaSeparatedRecipientListWithRecipientCount:()RecipientUtilities prefixForRecipientAtIndex:stringForRecipientAtIndex:lengthValidationBlock:
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  v12 = +[MFAddressConcatenator defaultRecipientListConcatenator];
  v13 = [v12 commaSeparatedAddressListWithAddressCount:a3 prefixForAddressAtIndex:v9 stringForAddressAtIndex:v10 lengthValidationBlock:v11];

  return v13;
}

- (id)mf_copyDisplayableAddressComment
{
  id v1 = a1;
  v2 = [v1 emailAddressValue];
  v3 = [v2 displayName];
  v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [v1 stringValue];
  }
  v6 = v5;

  v7 = objc_msgSend(v6, "ec_personNameComponents");

  if (v7)
  {
    [v7 setNamePrefix:0];
    [v7 setNameSuffix:0];
    id v8 = objc_alloc_init(MEMORY[0x1E4F28F38]);
    [v8 setStyle:3];
    id v9 = [v8 stringFromPersonNameComponents:v7];
  }
  else
  {
    id v10 = v1;
    id v11 = [v10 emailAddressValue];
    v12 = [v11 displayName];
    v13 = v12;
    if (v12)
    {
      id v14 = v12;
    }
    else
    {
      id v14 = [v10 stringValue];
    }
    id v8 = v14;

    if (![v8 length])
    {
      id v15 = 0;
      goto LABEL_12;
    }
    id v9 = v8;
    id v8 = v9;
  }
  id v15 = v9;
LABEL_12:

  return v15;
}

@end
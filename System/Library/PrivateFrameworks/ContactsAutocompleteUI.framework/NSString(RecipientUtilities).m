@interface NSString(RecipientUtilities)
- (id)cnaui_copyDisplayableAddressComment;
@end

@implementation NSString(RecipientUtilities)

- (id)cnaui_copyDisplayableAddressComment
{
  v2 = objc_msgSend(a1, "mf_addressCommentPersonNameComponents");
  v3 = v2;
  if (v2)
  {
    [v2 setNamePrefix:0];
    [v3 setNameSuffix:0];
    id v4 = objc_alloc_init(MEMORY[0x1E4F28F38]);
    [v4 setStyle:3];
    id v5 = [v4 stringFromPersonNameComponents:v3];
  }
  else
  {
    id v4 = (id)objc_msgSend(a1, "mf_copyAddressComment");
    if (![v4 length])
    {
      id v6 = 0;
      goto LABEL_6;
    }
    id v5 = v4;
    id v4 = v5;
  }
  id v6 = v5;
LABEL_6:

  return v6;
}

@end
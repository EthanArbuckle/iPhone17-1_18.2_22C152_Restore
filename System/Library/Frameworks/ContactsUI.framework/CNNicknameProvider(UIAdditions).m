@interface CNNicknameProvider(UIAdditions)
- (id)sharingAudienceDisplayString;
@end

@implementation CNNicknameProvider(UIAdditions)

- (id)sharingAudienceDisplayString
{
  uint64_t v1 = [a1 sharingAudience];
  switch(v1)
  {
    case 2:
      v2 = CNContactsUIBundle();
      v3 = v2;
      v4 = @"SHARING_AUDIENCE_ALWAYS_ASK";
      goto LABEL_7;
    case 1:
      v2 = CNContactsUIBundle();
      v3 = v2;
      v4 = @"SHARING_AUDIENCE_CONTACTS_ONLY";
      goto LABEL_7;
    case 0:
      v2 = CNContactsUIBundle();
      v3 = v2;
      v4 = @"SHARING_AUDIENCE_EVERYONE";
LABEL_7:
      v5 = [v2 localizedStringForKey:v4 value:&stru_1ED8AC728 table:@"Localized"];

      goto LABEL_9;
  }
  v5 = 0;
LABEL_9:

  return v5;
}

@end
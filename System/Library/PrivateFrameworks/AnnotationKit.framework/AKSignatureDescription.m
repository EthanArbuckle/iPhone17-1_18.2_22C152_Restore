@interface AKSignatureDescription
+ (id)stringValueForSignatureDescriptionTag:(int64_t)a3;
+ (int64_t)signatureDescriptionTagFromStringValue:(id)a3;
@end

@implementation AKSignatureDescription

+ (id)stringValueForSignatureDescriptionTag:(int64_t)a3
{
  switch(a3)
  {
    case 1:
      v3 = +[AKController akBundle];
      v4 = v3;
      v5 = @"Full Name";
      goto LABEL_8;
    case 2:
      v3 = +[AKController akBundle];
      v4 = v3;
      v5 = @"Given Name";
      goto LABEL_8;
    case 3:
      v3 = +[AKController akBundle];
      v4 = v3;
      v5 = @"Family Name";
      goto LABEL_8;
    case 4:
      v3 = +[AKController akBundle];
      v4 = v3;
      v5 = @"Nickname";
      goto LABEL_8;
    case 5:
      v3 = +[AKController akBundle];
      v4 = v3;
      v5 = @"Initials";
LABEL_8:
      v6 = [v3 localizedStringForKey:v5 value:&stru_26EA57918 table:@"AKSignatureDescription"];

      break;
    default:
      v6 = 0;
      break;
  }

  return v6;
}

+ (int64_t)signatureDescriptionTagFromStringValue:(id)a3
{
  v3 = (void *)MEMORY[0x263F08708];
  id v4 = a3;
  v5 = [v3 whitespaceAndNewlineCharacterSet];
  v6 = [v4 stringByTrimmingCharactersInSet:v5];

  if (v6 && [v6 length])
  {
    v7 = +[AKController akBundle];
    v8 = [v7 localizedStringForKey:@"Full Name" value:&stru_26EA57918 table:@"AKSignatureDescription"];
    char v9 = [v6 isEqualToString:v8];

    if (v9)
    {
      int64_t v10 = 1;
    }
    else
    {
      v12 = +[AKController akBundle];
      v13 = [v12 localizedStringForKey:@"Given Name" value:&stru_26EA57918 table:@"AKSignatureDescription"];
      char v14 = [v6 isEqualToString:v13];

      if (v14)
      {
        int64_t v10 = 2;
      }
      else
      {
        v15 = +[AKController akBundle];
        v16 = [v15 localizedStringForKey:@"Family Name" value:&stru_26EA57918 table:@"AKSignatureDescription"];
        char v17 = [v6 isEqualToString:v16];

        if (v17)
        {
          int64_t v10 = 3;
        }
        else
        {
          v18 = +[AKController akBundle];
          v19 = [v18 localizedStringForKey:@"Nickname" value:&stru_26EA57918 table:@"AKSignatureDescription"];
          char v20 = [v6 isEqualToString:v19];

          if (v20)
          {
            int64_t v10 = 4;
          }
          else
          {
            v21 = +[AKController akBundle];
            v22 = [v21 localizedStringForKey:@"Initials" value:&stru_26EA57918 table:@"AKSignatureDescription"];
            int v23 = [v6 isEqualToString:v22];

            if (v23) {
              int64_t v10 = 5;
            }
            else {
              int64_t v10 = -1;
            }
          }
        }
      }
    }
  }
  else
  {
    int64_t v10 = 0;
  }

  return v10;
}

@end
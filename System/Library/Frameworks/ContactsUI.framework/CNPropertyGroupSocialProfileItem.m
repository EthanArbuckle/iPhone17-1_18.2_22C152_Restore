@interface CNPropertyGroupSocialProfileItem
+ (id)displayLabelForSocialProfile:(id)a3 forPropertyKey:(id)a4;
+ (id)displayStringForSocialProfile:(id)a3;
+ (id)emptyValueForLabel:(id)a3;
- (BOOL)isEquivalentToItem:(id)a3;
- (CNSocialProfile)profile;
- (id)defaultActionURL;
- (id)displayLabel;
- (id)displayStringForValue:(id)a3;
- (id)editingStringValue;
- (id)valueForDisplayString:(id)a3;
@end

@implementation CNPropertyGroupSocialProfileItem

- (BOOL)isEquivalentToItem:(id)a3
{
  id v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)CNPropertyGroupSocialProfileItem;
  if ([(CNPropertyGroupItem *)&v29 isEquivalentToItem:v4])
  {
    BOOL v5 = 1;
  }
  else
  {
    v6 = [(CNPropertyGroupItem *)self contact];
    v7 = [v4 contact];

    if (v6 == v7)
    {
      BOOL v5 = 0;
    }
    else
    {
      v8 = [(CNPropertyGroupSocialProfileItem *)self profile];
      v9 = [v8 service];

      v10 = [v4 profile];
      v11 = [v10 service];

      if (!v9 || !v11 || ![v9 isEqualToString:v11]) {
        goto LABEL_17;
      }
      v12 = [(CNPropertyGroupSocialProfileItem *)self profile];
      v13 = [v12 username];

      v14 = [v4 profile];
      v15 = [v14 username];

      if (!v13) {
        goto LABEL_11;
      }
      if (v15)
      {
        int v16 = [v13 isEqualToString:v15];
      }
      else
      {
LABEL_11:
        v17 = [(CNPropertyGroupSocialProfileItem *)self profile];
        v18 = [v17 userIdentifier];

        v19 = [(CNPropertyGroupSocialProfileItem *)self profile];
        v20 = [v19 userIdentifier];

        int v16 = 0;
        if (v18 && v20) {
          int v16 = [v18 isEqualToString:v20];
        }
      }
      if (v16)
      {
        int v21 = 1;
      }
      else
      {
LABEL_17:
        v22 = [(CNPropertyGroupSocialProfileItem *)self profile];
        v23 = [v22 urlString];

        v24 = [v4 profile];
        v25 = [v24 urlString];

        int v21 = 0;
        if (v23 && v25)
        {
          v26 = [MEMORY[0x1E4F1CB10] URLWithString:v23];
          v27 = [MEMORY[0x1E4F1CB10] URLWithString:v25];
          int v21 = [v26 isEqual:v27];
        }
      }

      BOOL v5 = v21 != 0;
    }
  }

  return v5;
}

- (id)editingStringValue
{
  v3 = [(CNPropertyGroupSocialProfileItem *)self profile];
  id v4 = [v3 username];
  uint64_t v5 = [v4 length];

  v6 = [(CNPropertyGroupSocialProfileItem *)self profile];
  v7 = v6;
  if (v5) {
    [(CNPropertyGroupSocialProfileItem *)self displayStringForValue:v6];
  }
  else {
  v8 = [v6 userIdentifier];
  }

  return v8;
}

- (id)valueForDisplayString:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CNPropertyGroupSocialProfileItem *)self profile];
  v6 = (void *)[v5 mutableCopy];

  if ([v4 length] && objc_msgSend(v4, "characterAtIndex:", 0) == 64)
  {
    v7 = [v4 substringFromIndex:1];
    [v6 setUsername:v7];
  }
  else
  {
    [v6 setUsername:v4];
  }

  return v6;
}

- (id)displayStringForValue:(id)a3
{
  id v3 = a3;
  id v4 = [(id)objc_opt_class() displayStringForSocialProfile:v3];

  return v4;
}

- (id)displayLabel
{
  id v3 = objc_opt_class();
  id v4 = [(CNPropertyGroupSocialProfileItem *)self profile];
  uint64_t v5 = [(CNPropertyGroupItem *)self property];
  v6 = [v3 displayLabelForSocialProfile:v4 forPropertyKey:v5];

  return v6;
}

- (id)defaultActionURL
{
  v2 = (void *)MEMORY[0x1E4F1CB10];
  id v3 = [(CNPropertyGroupSocialProfileItem *)self profile];
  id v4 = [v3 urlString];
  uint64_t v5 = [v2 URLWithString:v4];

  return v5;
}

- (CNSocialProfile)profile
{
  v2 = [(CNPropertyGroupItem *)self labeledValue];
  id v3 = [v2 value];

  return (CNSocialProfile *)v3;
}

+ (id)displayStringForSocialProfile:(id)a3
{
  id v3 = a3;
  uint64_t v4 = *MEMORY[0x1E4F5A298];
  uint64_t v5 = [v3 displayname];
  char v6 = (*(uint64_t (**)(uint64_t, void *))(v4 + 16))(v4, v5);

  if (v6)
  {
    v7 = [v3 username];
    char v8 = (*(uint64_t (**)(uint64_t, void *))(v4 + 16))(v4, v7);

    if (v8)
    {
      v9 = [v3 userIdentifier];
      char v10 = (*(uint64_t (**)(uint64_t, void *))(v4 + 16))(v4, v9);

      if (v10)
      {
        v11 = [v3 urlString];
        char v12 = (*(uint64_t (**)(uint64_t, void *))(v4 + 16))(v4, v11);

        if (v12)
        {
          v13 = 0;
          goto LABEL_11;
        }
        uint64_t v14 = [v3 urlString];
      }
      else
      {
        uint64_t v14 = [v3 userIdentifier];
      }
    }
    else
    {
      uint64_t v14 = [v3 username];
    }
  }
  else
  {
    uint64_t v14 = [v3 displayname];
  }
  v13 = (__CFString *)v14;
LABEL_11:
  if ((*(uint64_t (**)(uint64_t, __CFString *))(v4 + 16))(v4, v13))
  {
    v15 = v13;
    v13 = &stru_1ED8AC728;
  }
  else
  {
    v15 = [v3 service];
    if (((*(uint64_t (**)(uint64_t, void *))(v4 + 16))(v4, v15) & 1) == 0)
    {
      int v16 = [v3 username];
      if (((*(uint64_t (**)(uint64_t, void *))(v4 + 16))(v4, v16) & 1) == 0)
      {
        v17 = [v3 service];
        if ([v17 compare:*MEMORY[0x1E4F1B810] options:1])
        {
        }
        else
        {
          int v18 = [(__CFString *)v13 characterAtIndex:0];

          if (v18 == 64) {
            goto LABEL_21;
          }
          v19 = NSString;
          v15 = [v3 username];
          [v19 stringWithFormat:@"@%@", v15];
          int v16 = v13;
          v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
      }
    }
  }

LABEL_21:

  return v13;
}

+ (id)displayLabelForSocialProfile:(id)a3 forPropertyKey:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = *MEMORY[0x1E4F5A298];
  char v8 = [v5 service];
  LOBYTE(v7) = (*(uint64_t (**)(uint64_t, void *))(v7 + 16))(v7, v8);

  if (v7)
  {
    v9 = [MEMORY[0x1E4F1B8F8] localizedStringForKey:v6];
  }
  else
  {
    char v10 = (void *)MEMORY[0x1E4F1BAC0];
    v11 = [v5 service];
    char v12 = [v10 localizedStringForService:v11];
    v13 = v12;
    if (v12)
    {
      id v14 = v12;
    }
    else
    {
      id v14 = [v5 service];
    }
    v9 = v14;
  }

  return v9;
}

+ (id)emptyValueForLabel:(id)a3
{
  id v3 = (objc_class *)MEMORY[0x1E4F1BAC0];
  id v4 = a3;
  id v5 = (void *)[[v3 alloc] initWithUrlString:&stru_1ED8AC728 username:&stru_1ED8AC728 userIdentifier:&stru_1ED8AC728 service:v4];

  return v5;
}

@end
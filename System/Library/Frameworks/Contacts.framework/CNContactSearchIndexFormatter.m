@interface CNContactSearchIndexFormatter
- (BOOL)getObjectValue:(id *)a3 forString:(id)a4 errorDescription:(id *)a5;
- (id)auxiliaryIndexStringForContact:(id)a3;
- (id)nameExpansionsForContact:(id)a3;
- (id)stringForObjectValue:(id)a3;
- (id)stringFromContact:(id)a3;
@end

@implementation CNContactSearchIndexFormatter

- (id)stringForObjectValue:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = [(CNContactSearchIndexFormatter *)self stringFromContact:v4];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)stringFromContact:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [MEMORY[0x1E4F28E78] string];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v6 = +[CN allContactProperties];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = [*(id *)(*((void *)&v14 + 1) + 8 * i) stringForIndexingForContact:v4];
        if (v11)
        {
          [v5 appendString:v11];
          [v5 appendString:@" "];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  v12 = [(CNContactSearchIndexFormatter *)self auxiliaryIndexStringForContact:v4];
  if (v12) {
    [v5 appendString:v12];
  }

  return v5;
}

- (id)auxiliaryIndexStringForContact:(id)a3
{
  v3 = [(CNContactSearchIndexFormatter *)self nameExpansionsForContact:a3];
  if ([v3 length])
  {
    id v4 = [MEMORY[0x1E4F28E78] stringWithString:v3];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (id)nameExpansionsForContact:(id)a3
{
  id v7 = a3;
  uint64_t v8 = [v7 familyName];

  if (v8)
  {
    uint64_t v9 = [v7 familyName];
    char v10 = CNStringContainsKoreanCharacters();

    if (v10) {
      goto LABEL_11;
    }
  }
  v11 = [v7 givenName];

  if (v11)
  {
    v12 = [v7 givenName];
    char v13 = CNStringContainsKoreanCharacters();

    if (v13) {
      goto LABEL_11;
    }
  }
  long long v14 = [v7 middleName];

  if (v14)
  {
    long long v15 = [v7 middleName];
    char v16 = CNStringContainsKoreanCharacters();

    if (v16) {
      goto LABEL_11;
    }
  }
  long long v17 = [v7 nameSuffix];

  if (v17)
  {
    v18 = [v7 nameSuffix];
    char v19 = CNStringContainsKoreanCharacters();

    if (v19) {
      goto LABEL_11;
    }
  }
  v20 = [v7 namePrefix];

  if (v20)
  {
    v21 = [v7 namePrefix];
    int v22 = CNStringContainsKoreanCharacters();

    if (v22)
    {
LABEL_11:
      unsigned int v23 = 0;
      v20 = 0;
      while (1)
      {
        if (v23 <= 0x10 && ((1 << v23) & 0x10116) != 0) {
          goto LABEL_14;
        }
        if (v23)
        {
          v6 = [v7 namePrefix];
          if (!v6)
          {
LABEL_31:

            goto LABEL_14;
          }
        }
        if ((v23 & 2) != 0)
        {
          v5 = [v7 givenName];
          if (!v5)
          {
            if (v23) {
              goto LABEL_31;
            }
            goto LABEL_14;
          }
        }
        if ((v23 & 4) != 0)
        {
          v3 = [v7 middleName];
          if (!v3)
          {
            BOOL v24 = 1;
LABEL_35:

            goto LABEL_36;
          }
        }
        if ((v23 & 8) == 0) {
          break;
        }
        id v4 = [v7 familyName];
        if (v4)
        {
          if ((v23 & 0x10) == 0)
          {
            BOOL v24 = 0;
LABEL_29:

            goto LABEL_34;
          }
LABEL_28:
          v25 = [v7 nameSuffix];
          BOOL v24 = v25 == 0;

          if ((v23 & 8) == 0) {
            goto LABEL_34;
          }
          goto LABEL_29;
        }
        BOOL v24 = 1;
LABEL_34:
        if ((v23 & 4) != 0) {
          goto LABEL_35;
        }
LABEL_36:
        if ((v23 & 2) != 0)
        {

          if ((v23 & 1) == 0)
          {
LABEL_38:
            if (!v24) {
              goto LABEL_42;
            }
            goto LABEL_14;
          }
        }
        else if ((v23 & 1) == 0)
        {
          goto LABEL_38;
        }

        if (!v24)
        {
LABEL_42:
          if (v20)
          {
            if ((v23 & 1) == 0) {
              goto LABEL_44;
            }
LABEL_51:
            v27 = [v7 namePrefix];
            [v20 appendString:v27];

            if ((v23 & 8) != 0) {
              goto LABEL_52;
            }
LABEL_45:
            if ((v23 & 4) == 0) {
              goto LABEL_46;
            }
LABEL_53:
            v29 = [v7 middleName];
            [v20 appendString:v29];

            if ((v23 & 2) != 0) {
              goto LABEL_54;
            }
LABEL_47:
            if ((v23 & 0x10) != 0) {
              goto LABEL_48;
            }
          }
          else
          {
            v20 = [MEMORY[0x1E4F28E78] string];
            if (v23) {
              goto LABEL_51;
            }
LABEL_44:
            if ((v23 & 8) == 0) {
              goto LABEL_45;
            }
LABEL_52:
            v28 = [v7 familyName];
            [v20 appendString:v28];

            if ((v23 & 4) != 0) {
              goto LABEL_53;
            }
LABEL_46:
            if ((v23 & 2) == 0) {
              goto LABEL_47;
            }
LABEL_54:
            v30 = [v7 givenName];
            [v20 appendString:v30];

            if ((v23 & 0x10) != 0)
            {
LABEL_48:
              v26 = [v7 nameSuffix];
              [v20 appendString:v26];
            }
          }
          [v20 appendString:@" "];
        }
LABEL_14:
        if (++v23 == 32) {
          goto LABEL_57;
        }
      }
      if ((v23 & 0x10) == 0)
      {
        BOOL v24 = 0;
        goto LABEL_34;
      }
      goto LABEL_28;
    }
    v20 = 0;
  }
LABEL_57:

  return v20;
}

- (BOOL)getObjectValue:(id *)a3 forString:(id)a4 errorDescription:(id *)a5
{
  return 0;
}

@end
@interface MSSendMailIntentFormatter
- (BOOL)allowsReverseTransformation;
- (BOOL)getObjectValue:(id *)a3 forString:(id)a4 errorDescription:(id *)a5;
- (id)_stringForAddresses:(id)a3;
- (id)stringForObjectValue:(id)a3;
@end

@implementation MSSendMailIntentFormatter

- (id)stringForObjectValue:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v10 = 0;
    goto LABEL_11;
  }
  id v5 = v4;
  v6 = [v5 to];
  uint64_t v7 = [v6 count];

  if (v7)
  {
    v8 = [v5 to];
    uint64_t v9 = [(MSSendMailIntentFormatter *)self _stringForAddresses:v8];
  }
  else
  {
    v11 = [v5 cc];
    uint64_t v12 = [v11 count];

    if (v12)
    {
      v8 = [v5 cc];
      uint64_t v9 = [(MSSendMailIntentFormatter *)self _stringForAddresses:v8];
    }
    else
    {
      v13 = [v5 bcc];
      uint64_t v14 = [v13 count];

      if (!v14)
      {
        v10 = [(MSSendMailIntentFormatter *)self _stringForAddresses:0];
        goto LABEL_10;
      }
      v8 = [v5 bcc];
      uint64_t v9 = [(MSSendMailIntentFormatter *)self _stringForAddresses:v8];
    }
  }
  v10 = (void *)v9;

LABEL_10:
LABEL_11:

  return v10;
}

- (BOOL)getObjectValue:(id *)a3 forString:(id)a4 errorDescription:(id *)a5
{
  return 0;
}

- (BOOL)allowsReverseTransformation
{
  return 0;
}

- (id)_stringForAddresses:(id)a3
{
  id v3 = a3;
  if ([v3 count])
  {
    id v4 = [v3 firstObject];
    id v5 = NSString;
    v6 = _EFLocalizedString();
    uint64_t v7 = [v4 displayName];
    v8 = objc_msgSend(v5, "deferredLocalizedIntentsStringWithFormat:", v6, v7);
  }
  else
  {
    uint64_t v9 = NSString;
    id v4 = _EFLocalizedString();
    v8 = [v9 deferredLocalizedIntentsStringWithFormat:v4];
  }

  return v8;
}

@end
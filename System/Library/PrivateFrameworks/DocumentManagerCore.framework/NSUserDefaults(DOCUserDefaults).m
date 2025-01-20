@interface NSUserDefaults(DOCUserDefaults)
- (id)doc_roleSpecificKeyForKey:()DOCUserDefaults configuration:;
- (void)doc_setObject:()DOCUserDefaults forRoleKey:configuation:;
@end

@implementation NSUserDefaults(DOCUserDefaults)

- (id)doc_roleSpecificKeyForKey:()DOCUserDefaults configuration:
{
  id v5 = a3;
  id v6 = a4;
  v7 = [v6 hostIdentifier];
  int v8 = [@"com.apple.DocumentsApp" isEqualToString:v7];

  if (v8)
  {
    id v9 = v5;
  }
  else
  {
    v10 = [v6 roleIdentifier];

    v11 = NSString;
    uint64_t v12 = [v6 hostIdentifier];
    v13 = (void *)v12;
    if (v10)
    {
      v14 = [v6 roleIdentifier];
      id v9 = [v11 stringWithFormat:@"%@-%@-%@", v13, v14, v5];
    }
    else
    {
      id v9 = [v11 stringWithFormat:@"%@-%@", v12, v5];
    }
  }
  return v9;
}

- (void)doc_setObject:()DOCUserDefaults forRoleKey:configuation:
{
  id v8 = a3;
  objc_msgSend(a1, "doc_roleSpecificKeyForKey:configuration:", a4, a5);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  [a1 setObject:v8 forKey:v9];
}

@end
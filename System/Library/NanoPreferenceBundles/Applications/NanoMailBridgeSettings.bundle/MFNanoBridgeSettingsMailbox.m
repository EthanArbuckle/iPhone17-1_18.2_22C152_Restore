@interface MFNanoBridgeSettingsMailbox
+ (BOOL)supportsSecureCoding;
+ (id)defaultSelectedMailboxes;
+ (unint64_t)sourceTypeForMailboxFilterType:(unint64_t)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isValid;
- (MFNanoBridgeSettingsMailbox)initWithCoder:(id)a3;
- (id)displayName;
- (id)icon;
- (unint64_t)level;
- (unint64_t)mailboxFilterType;
@end

@implementation MFNanoBridgeSettingsMailbox

+ (id)defaultSelectedMailboxes
{
  id v2 = objc_alloc_init((Class)NSMutableArray);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v3 = +[MailAccount activeAccounts];
  id v4 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v16;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v16 != v5) {
          objc_enumerationMutation(v3);
        }
        uint64_t v7 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          [v2 addObject:v7];
        }
      }
      id v4 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v4);
  }

  if ([v2 count])
  {
    v8 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", (char *)[v2 count] + 4);
    v9 = +[MailAccount nano_bridgeSettingsInboxesFromAccounts:v2];
    if ([v9 count]) {
      [v8 addObjectsFromArray:v9];
    }
    if ((unint64_t)[v2 count] >= 2)
    {
      v10 = [[MFNanoBridgeSettingsUnifiedMailbox alloc] initWithType:7];
      if (v10) {
        [v8 addObject:v10];
      }
    }
    if ([v2 count])
    {
      v11 = [[MFNanoBridgeSettingsSharedMailbox alloc] initWithType:3];
      [v8 addObject:v11];

      v12 = [[MFNanoBridgeSettingsSharedMailbox alloc] initWithType:2];
      [v8 addObject:v12];

      v13 = [[MFNanoBridgeSettingsSharedMailbox alloc] initWithType:1];
      [v8 addObject:v13];
    }
  }
  else
  {
    v8 = &__NSArray0__struct;
  }

  return v8;
}

+ (unint64_t)sourceTypeForMailboxFilterType:(unint64_t)a3
{
  if ((uint64_t)a3 > 15)
  {
    switch(a3)
    {
      case 0x10uLL:
        return 4;
      case 0x20uLL:
        return 6;
      case 0x40uLL:
        return 7;
    }
  }
  else
  {
    switch(a3)
    {
      case 2uLL:
        return 1;
      case 4uLL:
        return 2;
      case 8uLL:
        return 3;
    }
  }
  return 0;
}

- (unint64_t)mailboxFilterType
{
  return 0;
}

- (id)displayName
{
  return 0;
}

- (id)icon
{
  return 0;
}

- (unint64_t)level
{
  return 0;
}

- (BOOL)isValid
{
  return 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MFNanoBridgeSettingsMailbox)initWithCoder:(id)a3
{
  return [(MFNanoBridgeSettingsMailbox *)self init];
}

- (BOOL)isEqual:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  else
  {
    char isKindOfClass = 0;
  }

  return isKindOfClass & 1;
}

@end
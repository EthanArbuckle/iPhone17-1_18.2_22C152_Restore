@interface AppLedgerItem
- (AppLedgerItem)initWithBundleID:(id)a3 itemID:(id)a4;
- (AppLedgerItem)initWithDictionary:(id)a3;
- (NSArray)installs;
- (NSDictionary)dictionaryRepresentation;
- (NSNumber)itemID;
- (NSString)bundleIdentifier;
- (id)lastUserInitiatedInstall;
- (void)addInstall:(id)a3;
@end

@implementation AppLedgerItem

- (AppLedgerItem)initWithBundleID:(id)a3 itemID:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)AppLedgerItem;
  v9 = [(AppLedgerItem *)&v15 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_bundleIdentifier, a3);
    if (!v10->_bundleIdentifier)
    {
      v13 = 0;
      goto LABEL_6;
    }
    objc_storeStrong((id *)&v10->_itemID, a4);
    uint64_t v11 = +[NSMutableArray array];
    installs = v10->_installs;
    v10->_installs = (NSMutableArray *)v11;
  }
  v13 = v10;
LABEL_6:

  return v13;
}

- (AppLedgerItem)initWithDictionary:(id)a3
{
  id v4 = a3;
  v41.receiver = self;
  v41.super_class = (Class)AppLedgerItem;
  v5 = [(AppLedgerItem *)&v41 init];
  if (!v5) {
    goto LABEL_25;
  }
  uint64_t v6 = sub_1002689B4(v4, @"bundleIdentifier");
  bundleIdentifier = v5->_bundleIdentifier;
  v5->_bundleIdentifier = (NSString *)v6;

  if (!v5->_bundleIdentifier)
  {
    v35 = 0;
    goto LABEL_27;
  }
  uint64_t v8 = sub_10026811C(v4, @"itemID");
  itemID = v5->_itemID;
  v5->_itemID = (NSNumber *)v8;

  id v10 = [v4 objectForKeyedSubscript:@"installs"];
  v39 = +[NSMutableArray array];
  if (!v10) {
    goto LABEL_24;
  }
  v38 = v5;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v37 = v10;
  id obj = v10;
  id v11 = [obj countByEnumeratingWithState:&v42 objects:v47 count:16];
  if (!v11) {
    goto LABEL_23;
  }
  id v12 = v11;
  uint64_t v13 = *(void *)v43;
  do
  {
    for (i = 0; i != v12; i = (char *)i + 1)
    {
      if (*(void *)v43 != v13) {
        objc_enumerationMutation(obj);
      }
      objc_super v15 = *(void **)(*((void *)&v42 + 1) + 8 * i);
      v16 = [AppLedgerInstallItem alloc];
      id v17 = v15;
      if (!v16)
      {
        v19 = 0;
LABEL_19:

        goto LABEL_20;
      }
      v46.receiver = v16;
      v46.super_class = (Class)AppLedgerInstallItem;
      v18 = [(AppLedgerItem *)&v46 init];
      if (v18)
      {
        v19 = v18;
        uint64_t v20 = sub_1002689B4(v17, @"bundleVersion");
        Class isa = v19[1].super.isa;
        v19[1].super.Class isa = (Class)v20;

        uint64_t v22 = sub_10026811C(v17, @"externalVersionID");
        v23 = v19->_itemID;
        v19->_itemID = (NSNumber *)v22;

        uint64_t v24 = sub_1002684F4(v17, @"installDate");
        installs = v19->_installs;
        v19->_installs = (NSMutableArray *)v24;

        v26 = sub_10026811C(v17, @"installType");
        objc_opt_class();
        v27 = sub_100012D7C(v26);

        if (v27) {
          v19->_bundleIdentifier = (NSString *)[v26 integerValue];
        }
        v28 = sub_10026811C(v17, @"packageType");
        objc_opt_class();
        v29 = sub_100012D7C(v28);

        if (v29) {
          v19[1]._bundleIdentifier = (NSString *)[v28 integerValue];
        }
        uint64_t v30 = sub_1002689B4(v17, @"originator");
        v31 = v19[1]._installs;
        v19[1]._installs = (NSMutableArray *)v30;

        v32 = v19->_installs;
        if (v32)
        {
          v33 = v19;

          [(NSMutableArray *)v39 addObject:v33];
          goto LABEL_21;
        }
        goto LABEL_19;
      }

LABEL_20:
      v33 = 0;
LABEL_21:
    }
    id v12 = [obj countByEnumeratingWithState:&v42 objects:v47 count:16];
  }
  while (v12);
LABEL_23:

  v5 = v38;
  id v10 = v37;
LABEL_24:

  v34 = v5->_installs;
  v5->_installs = v39;

LABEL_25:
  v35 = v5;
LABEL_27:

  return v35;
}

- (NSDictionary)dictionaryRepresentation
{
  v3 = +[NSMutableDictionary dictionary];
  id v4 = [(AppLedgerItem *)self bundleIdentifier];
  [v3 setObject:v4 forKeyedSubscript:@"bundleIdentifier"];

  v5 = [(AppLedgerItem *)self itemID];
  id v17 = v3;
  [v3 setObject:v5 forKeyedSubscript:@"itemID"];

  if (self)
  {
    uint64_t v6 = +[NSMutableArray array];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id obj = self->_installs;
    id v7 = [(NSMutableArray *)obj countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v20;
      do
      {
        id v10 = 0;
        do
        {
          if (*(void *)v20 != v9) {
            objc_enumerationMutation(obj);
          }
          id v11 = *(void **)(*((void *)&v19 + 1) + 8 * (void)v10);
          if (v11)
          {
            id v12 = +[NSMutableDictionary dictionary];
            [v12 setObject:v11[4] forKeyedSubscript:@"bundleVersion"];
            [v12 setObject:v11[3] forKeyedSubscript:@"externalVersionID"];
            [v12 setObject:v11[1] forKeyedSubscript:@"installDate"];
            uint64_t v13 = +[NSNumber numberWithInteger:v11[2]];
            [v12 setObject:v13 forKeyedSubscript:@"installType"];

            v14 = +[NSNumber numberWithInteger:v11[6]];
            [v12 setObject:v14 forKeyedSubscript:@"packageType"];

            [v12 setObject:v11[5] forKeyedSubscript:@"originator"];
          }
          else
          {
            id v12 = 0;
          }
          [v6 addObject:v12];

          id v10 = (char *)v10 + 1;
        }
        while (v8 != v10);
        id v15 = [(NSMutableArray *)obj countByEnumeratingWithState:&v19 objects:v23 count:16];
        id v8 = v15;
      }
      while (v15);
    }
  }
  else
  {
    uint64_t v6 = 0;
  }
  [v17 setObject:v6 forKeyedSubscript:@"installs"];

  return (NSDictionary *)v17;
}

- (void)addInstall:(id)a3
{
}

- (NSArray)installs
{
  id v2 = [(NSMutableArray *)self->_installs copy];
  return (NSArray *)v2;
}

- (id)lastUserInitiatedInstall
{
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v2 = [(NSMutableArray *)self->_installs reverseObjectEnumerator];
  v3 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v13;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v13 != v4) {
          objc_enumerationMutation(v2);
        }
        uint64_t v6 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if (v6)
        {
          unint64_t v7 = v6[2];
          BOOL v8 = v7 > 0x21;
          uint64_t v9 = (1 << v7) & 0x340088000;
          if (!v8 && v9 != 0) {
            continue;
          }
        }
        v3 = v6;
        goto LABEL_15;
      }
      v3 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_15:

  return v3;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (NSNumber)itemID
{
  return self->_itemID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemID, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_installs, 0);
}

@end
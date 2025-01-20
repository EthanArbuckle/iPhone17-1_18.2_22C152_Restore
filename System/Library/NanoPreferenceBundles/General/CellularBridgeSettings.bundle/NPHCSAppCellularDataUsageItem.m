@interface NPHCSAppCellularDataUsageItem
+ (id)userSelectedComparator;
- (BOOL)isCellularDataEnabled;
- (BOOL)isForAnApp;
- (BOOL)isTotalUsage;
- (BOOL)isWiFiDataEnabled;
- (CTDataUsagePolicies)dataUsagePolicy;
- (NPHCSAppCellularDataUsageItem)init;
- (NPHCSAppCellularDataUsageItem)initWithCTAppDataUsageItem:(id)a3;
- (NSArray)childObjects;
- (NSAttributedString)hyphenatedDisplayName;
- (NSString)bundleID;
- (NSString)displayName;
- (NSString)usageDisplayString;
- (id)chinaSKUWirelessDataOptionForCellularSetup:(BOOL)a3;
- (unint64_t)bytesUsed;
- (void)setBundleID:(id)a3;
- (void)setBytesUsed:(unint64_t)a3;
- (void)setChildObjects:(id)a3;
- (void)setDataUsagePolicy:(id)a3;
- (void)setDisplayName:(id)a3;
- (void)setHyphenatedDisplayName:(id)a3;
- (void)setIsTotalUsage:(BOOL)a3;
- (void)setUsageDisplayString:(id)a3;
- (void)setUsagePoliciesForCellular:(BOOL)a3;
- (void)setUsagePoliciesForCellular:(BOOL)a3 andWifi:(BOOL)a4;
@end

@implementation NPHCSAppCellularDataUsageItem

- (NPHCSAppCellularDataUsageItem)init
{
  v3.receiver = self;
  v3.super_class = (Class)NPHCSAppCellularDataUsageItem;
  return [(NPHCSAppCellularDataUsageItem *)&v3 init];
}

- (NPHCSAppCellularDataUsageItem)initWithCTAppDataUsageItem:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)NPHCSAppCellularDataUsageItem;
  v5 = [(NPHCSAppCellularDataUsageItem *)&v17 init];
  if (v5)
  {
    v6 = [v4 bundleId];
    [(NPHCSAppCellularDataUsageItem *)v5 setBundleID:v6];

    v7 = [v4 displayName];
    [(NPHCSAppCellularDataUsageItem *)v5 setDisplayName:v7];

    v8 = [v4 used];
    v9 = [v8 native];
    v10 = (char *)[v9 cellularHome];
    v11 = [v4 used];
    v12 = [v11 native];
    -[NPHCSAppCellularDataUsageItem setBytesUsed:](v5, "setBytesUsed:", &v10[(void)[v12 cellularRoaming]]);

    id v13 = objc_alloc((Class)CTDataUsagePolicies);
    v14 = [(NPHCSAppCellularDataUsageItem *)v5 bundleID];
    id v15 = [v13 init:v14 withCellularPolicy:1 wifiPolicy:1 isManaged:0 andIsRestricted:0];
    [(NPHCSAppCellularDataUsageItem *)v5 setDataUsagePolicy:v15];
  }
  return v5;
}

- (id)chinaSKUWirelessDataOptionForCellularSetup:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(NPHCSAppCellularDataUsageItem *)self isForAnApp])
  {
    v5 = +[NSBundle bundleForClass:objc_opt_class()];
    v6 = [v5 localizedStringForKey:@"DATA_OFF" value:&stru_1CDE0 table:0];

    if ([(NPHCSAppCellularDataUsageItem *)self isWiFiDataEnabled])
    {
      if (v3 && [(NPHCSAppCellularDataUsageItem *)self isCellularDataEnabled])
      {
        v7 = +[NSBundle bundleForClass:objc_opt_class()];
        v8 = @"ALL_ON_SHORT";
      }
      else
      {
        v7 = +[NSBundle bundleForClass:objc_opt_class()];
        v8 = @"WIFI_ON";
      }
      v9 = NPHWiFiStringKey(v8);
      uint64_t v10 = [v7 localizedStringForKey:v9 value:&stru_1CDE0 table:0];

      v6 = (void *)v10;
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)isForAnApp
{
  v2 = [(NPHCSAppCellularDataUsageItem *)self bundleID];
  BOOL v3 = [v2 length] != 0;

  return v3;
}

- (BOOL)isWiFiDataEnabled
{
  v2 = [(NPHCSAppCellularDataUsageItem *)self dataUsagePolicy];
  BOOL v3 = [v2 wifi] == (char *)&dword_0 + 1;

  return v3;
}

- (BOOL)isCellularDataEnabled
{
  v2 = [(NPHCSAppCellularDataUsageItem *)self dataUsagePolicy];
  BOOL v3 = [v2 cellular] == (char *)&dword_0 + 1;

  return v3;
}

- (void)setDisplayName:(id)a3
{
  if (self->_displayName != a3)
  {
    id v4 = (NSString *)[a3 copy];
    displayName = self->_displayName;
    self->_displayName = v4;

    id v6 = objc_alloc_init((Class)NSMutableParagraphStyle);
    LODWORD(v7) = 1.0;
    [v6 setHyphenationFactor:v7];
    id v8 = objc_alloc((Class)NSAttributedString);
    v9 = self->_displayName;
    NSAttributedStringKey v12 = NSParagraphStyleAttributeName;
    id v13 = v6;
    uint64_t v10 = +[NSDictionary dictionaryWithObjects:&v13 forKeys:&v12 count:1];
    id v11 = [v8 initWithString:v9 attributes:v10];

    [(NPHCSAppCellularDataUsageItem *)self setHyphenatedDisplayName:v11];
  }
}

- (void)setUsagePoliciesForCellular:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = nph_general_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [(NPHCSAppCellularDataUsageItem *)self bundleID];
    int v7 = 136315650;
    id v8 = "-[NPHCSAppCellularDataUsageItem setUsagePoliciesForCellular:]";
    __int16 v9 = 2112;
    uint64_t v10 = v6;
    __int16 v11 = 1024;
    BOOL v12 = v3;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "%s setting: %@, %i", (uint8_t *)&v7, 0x1Cu);
  }
  [(NPHCSAppCellularDataUsageItem *)self setUsagePoliciesForCellular:v3 andWifi:1];
}

- (void)setUsagePoliciesForCellular:(BOOL)a3 andWifi:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  int v7 = nph_general_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = [(NPHCSAppCellularDataUsageItem *)self bundleID];
    int v16 = 136315906;
    objc_super v17 = "-[NPHCSAppCellularDataUsageItem setUsagePoliciesForCellular:andWifi:]";
    __int16 v18 = 2112;
    v19 = v8;
    __int16 v20 = 1024;
    BOOL v21 = v5;
    __int16 v22 = 1024;
    BOOL v23 = v4;
    _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "%s setting: %@, %i, %i", (uint8_t *)&v16, 0x22u);
  }
  id v9 = objc_alloc((Class)CTDataUsagePolicies);
  uint64_t v10 = [(NPHCSAppCellularDataUsageItem *)self bundleID];
  id v11 = [v9 init:v10 withCellularPolicy:v5 wifiPolicy:v4 isManaged:0 andIsRestricted:0];

  [(NPHCSAppCellularDataUsageItem *)self setDataUsagePolicy:v11];
  id v12 = objc_alloc((Class)CoreTelephonyClient);
  dispatch_queue_t v13 = dispatch_queue_create("com.apple.nanophone.telephonypoliciesqueue", 0);
  id v14 = [v12 initWithQueue:v13];

  id v15 = +[NSSet setWithObject:v11];
  [v14 setRemotePolicies:v15 completion:&stru_1C998];
}

+ (id)userSelectedComparator
{
  return &stru_1C9D8;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
}

- (NSString)displayName
{
  return self->_displayName;
}

- (NSAttributedString)hyphenatedDisplayName
{
  return self->_hyphenatedDisplayName;
}

- (void)setHyphenatedDisplayName:(id)a3
{
}

- (NSString)usageDisplayString
{
  return self->_usageDisplayString;
}

- (void)setUsageDisplayString:(id)a3
{
}

- (unint64_t)bytesUsed
{
  return self->_bytesUsed;
}

- (void)setBytesUsed:(unint64_t)a3
{
  self->_bytesUsed = a3;
}

- (CTDataUsagePolicies)dataUsagePolicy
{
  return self->_dataUsagePolicy;
}

- (void)setDataUsagePolicy:(id)a3
{
}

- (BOOL)isTotalUsage
{
  return self->_isTotalUsage;
}

- (void)setIsTotalUsage:(BOOL)a3
{
  self->_isTotalUsage = a3;
}

- (NSArray)childObjects
{
  return self->_childObjects;
}

- (void)setChildObjects:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_childObjects, 0);
  objc_storeStrong((id *)&self->_dataUsagePolicy, 0);
  objc_storeStrong((id *)&self->_usageDisplayString, 0);
  objc_storeStrong((id *)&self->_hyphenatedDisplayName, 0);
  objc_storeStrong((id *)&self->_displayName, 0);

  objc_storeStrong((id *)&self->_bundleID, 0);
}

@end
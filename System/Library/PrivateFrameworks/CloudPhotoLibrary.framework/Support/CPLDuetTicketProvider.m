@interface CPLDuetTicketProvider
+ (CPLDuetTicketProvider)sharedDuetTicketProvider;
- (BOOL)_BOOLValueForDuetKeyPath:(id)a3;
- (BOOL)hasSignificantWork;
- (BOOL)isBlocked;
- (CPLDuetTicketProvider)initWithClientBundlerIdentifier:(id)a3;
- (NSString)clientBundlerIdentifier;
- (id)_budgetOverrideKeyPath;
- (id)_isBlockedKeyPath;
- (id)_isUnBlockedKeyPath;
- (id)_significantWorkKeyPath;
- (id)duetStatuses;
- (unint64_t)_unBlockedReason;
- (unint64_t)significantWorkRetainCount;
- (void)_setupCallbacks;
- (void)addBudgetDelegate:(id)a3;
- (void)getSystemBudgetsWithCompletionHandler:(id)a3;
- (void)overrideHasSignificantWork:(BOOL)a3;
- (void)popSignificantWorkIsPending;
- (void)pushSignificantWorkIsPending;
- (void)removeBudgetDelegate:(id)a3;
- (void)setShouldOverride:(BOOL)a3 forSystemBudgets:(unint64_t)a4;
- (void)setSignificantWorkRetainCount:(unint64_t)a3;
@end

@implementation CPLDuetTicketProvider

+ (CPLDuetTicketProvider)sharedDuetTicketProvider
{
  if (qword_1002CE838 != -1) {
    dispatch_once(&qword_1002CE838, &stru_100279298);
  }
  v2 = (void *)qword_1002CE830;
  return (CPLDuetTicketProvider *)v2;
}

- (CPLDuetTicketProvider)initWithClientBundlerIdentifier:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CPLDuetTicketProvider;
  v5 = [(CPLDuetTicketProvider *)&v15 init];
  if (v5)
  {
    dispatch_queue_t v6 = dispatch_queue_create("com.apple.cpl.cloudkit.duet", 0);
    duetQueue = v5->_duetQueue;
    v5->_duetQueue = (OS_dispatch_queue *)v6;

    v8 = (NSString *)[v4 copy];
    clientBundlerIdentifier = v5->_clientBundlerIdentifier;
    v5->_clientBundlerIdentifier = v8;

    v10 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    budgetDelegates = v5->_budgetDelegates;
    v5->_budgetDelegates = v10;

    uint64_t v12 = +[_CDClientContext userContext];
    duetOverrideContext = v5->_duetOverrideContext;
    v5->_duetOverrideContext = (_CDClientContext *)v12;

    if ([v4 isEqualToString:@"com.apple.mobileslideshow"]) {
      [(CPLDuetTicketProvider *)v5 _setupCallbacks];
    }
  }

  return v5;
}

- (void)addBudgetDelegate:(id)a3
{
}

- (void)removeBudgetDelegate:(id)a3
{
}

- (void)pushSignificantWorkIsPending
{
  duetQueue = self->_duetQueue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10007C39C;
  v6[3] = &unk_100275EA0;
  v6[4] = self;
  v3 = v6;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10007D71C;
  block[3] = &unk_100275DF8;
  id v8 = v3;
  id v4 = duetQueue;
  dispatch_block_t v5 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v4, v5);
}

- (void)popSignificantWorkIsPending
{
  duetQueue = self->_duetQueue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10007C498;
  v6[3] = &unk_100275EA0;
  v6[4] = self;
  v3 = v6;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10007D71C;
  block[3] = &unk_100275DF8;
  id v8 = v3;
  id v4 = duetQueue;
  dispatch_block_t v5 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v4, v5);
}

- (void)getSystemBudgetsWithCompletionHandler:(id)a3
{
  id v4 = a3;
  duetQueue = self->_duetQueue;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10007C5BC;
  v10[3] = &unk_100276288;
  v10[4] = self;
  id v11 = v4;
  dispatch_queue_t v6 = v10;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10007D71C;
  block[3] = &unk_100275DF8;
  id v13 = v6;
  v7 = duetQueue;
  id v8 = v4;
  dispatch_block_t v9 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v7, v9);
}

- (BOOL)_BOOLValueForDuetKeyPath:(id)a3
{
  v3 = [(_CDClientContext *)self->_duetOverrideContext objectForKeyedSubscript:a3];
  unsigned __int8 v4 = [v3 BOOLValue];

  return v4;
}

- (unint64_t)_unBlockedReason
{
  duetOverrideContext = self->_duetOverrideContext;
  v3 = [(CPLDuetTicketProvider *)self _isUnBlockedKeyPath];
  unsigned __int8 v4 = [(_CDClientContext *)duetOverrideContext objectForKeyedSubscript:v3];
  id v5 = [v4 integerValue];

  return (unint64_t)v5;
}

- (id)duetStatuses
{
  id v4 = objc_alloc_init((Class)NSMutableArray);
  if ([(NSString *)self->_clientBundlerIdentifier isEqualToString:@"com.apple.mobileslideshow"])
  {
    id v5 = objc_alloc((Class)NSString);
    dispatch_queue_t v6 = [(CPLDuetTicketProvider *)self _significantWorkKeyPath];
    unsigned int v7 = [(CPLDuetTicketProvider *)self hasSignificantWork];
    id v8 = @"NO";
    CFStringRef v9 = @"YES";
    if (!v7) {
      CFStringRef v9 = @"NO";
    }
    id v10 = [v5 initWithFormat:@"%@ = %@", v6, v9];
    [v4 addObject:v10];

    id v11 = objc_alloc((Class)NSString);
    uint64_t v12 = [(CPLDuetTicketProvider *)self _isBlockedKeyPath];
    unsigned int v13 = [(CPLDuetTicketProvider *)self isBlocked];
    if (v13)
    {
      v2 = [(CPLDuetTicketProvider *)self _blockedReasonStatus];
      id v8 = +[NSString stringWithFormat:@"YES %@", v2];
    }
    id v14 = [v11 initWithFormat:@"%@ = %@", v12, v8];
    [v4 addObject:v14];

    if (v13)
    {
    }
    duetOverrideContext = self->_duetOverrideContext;
    v16 = [(CPLDuetTicketProvider *)self _budgetOverrideKeyPath];
    v17 = [(_CDClientContext *)duetOverrideContext objectForKeyedSubscript:v16];

    if (v17 && [v17 integerValue])
    {
      id v18 = objc_alloc((Class)NSString);
      v19 = +[CPLEngineSystemMonitor descriptionForBudgets:](CPLEngineSystemMonitor, "descriptionForBudgets:", [v17 integerValue]);
      v20 = (__CFString *)[v18 initWithFormat:@"%@ (%@)", v19, v17];
    }
    else
    {
      v20 = @"none";
    }
    id v21 = objc_alloc((Class)NSString);
    v22 = [(CPLDuetTicketProvider *)self _budgetOverrideKeyPath];
    id v23 = [v21 initWithFormat:@"%@ = %@", v22, v20];
    [v4 addObject:v23];
  }
  return v4;
}

- (id)_budgetOverrideKeyPath
{
  return +[_CDContextualKeyPath keyPathWithKey:@"/app/photos/budgetOverride"];
}

- (id)_isBlockedKeyPath
{
  return +[_CDContextualKeyPath keyPathWithKey:@"/app/photos/isBlocked"];
}

- (id)_isUnBlockedKeyPath
{
  return +[_CDContextualKeyPath keyPathWithKey:@"/app/photos/isUnBlocked"];
}

- (id)_significantWorkKeyPath
{
  return +[_CDContextualKeyPath keyPathWithKey:@"/app/photos/significantWork"];
}

- (void)_setupCallbacks
{
  v3 = [(CPLDuetTicketProvider *)self _isBlockedKeyPath];
  id v4 = +[_CDContextualPredicate predicateForChangeAtKeyPath:v3];

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10007D14C;
  v7[3] = &unk_100276880;
  v7[4] = self;
  id v5 = objc_retainBlock(v7);
  dispatch_queue_t v6 = +[_CDContextualChangeRegistration localWakingRegistrationWithIdentifier:@"com.apple.photos.isBlockedRegistration" contextualPredicate:v4 callback:v5];
  [(_CDClientContext *)self->_duetOverrideContext registerCallback:v6];
}

- (BOOL)isBlocked
{
  v2 = self;
  v3 = [(CPLDuetTicketProvider *)self _isBlockedKeyPath];
  LOBYTE(v2) = [(CPLDuetTicketProvider *)v2 _BOOLValueForDuetKeyPath:v3];

  return (char)v2;
}

- (BOOL)hasSignificantWork
{
  v2 = self;
  v3 = [(CPLDuetTicketProvider *)self _significantWorkKeyPath];
  LOBYTE(v2) = [(CPLDuetTicketProvider *)v2 _BOOLValueForDuetKeyPath:v3];

  return (char)v2;
}

- (void)overrideHasSignificantWork:(BOOL)a3
{
  unint64_t significantWorkRetainCount = self->_significantWorkRetainCount;
  if (a3)
  {
    if (!significantWorkRetainCount)
    {
      duetOverrideContext = self->_duetOverrideContext;
      dispatch_queue_t v6 = [(CPLDuetTicketProvider *)self _significantWorkKeyPath];
      [(_CDClientContext *)duetOverrideContext setObject:&__kCFBooleanTrue forKeyedSubscript:v6];

      unint64_t significantWorkRetainCount = self->_significantWorkRetainCount;
    }
    self->_unint64_t significantWorkRetainCount = significantWorkRetainCount + 1;
  }
  else if (significantWorkRetainCount)
  {
    unint64_t v7 = significantWorkRetainCount - 1;
    self->_unint64_t significantWorkRetainCount = v7;
    if (!v7)
    {
      id v8 = self->_duetOverrideContext;
      id v9 = [(CPLDuetTicketProvider *)self _significantWorkKeyPath];
      [(_CDClientContext *)v8 setObject:&__kCFBooleanFalse forKeyedSubscript:v9];
    }
  }
}

- (void)setShouldOverride:(BOOL)a3 forSystemBudgets:(unint64_t)a4
{
  BOOL v5 = a3;
  duetOverrideContext = self->_duetOverrideContext;
  id v8 = [(CPLDuetTicketProvider *)self _budgetOverrideKeyPath];
  id v9 = [(_CDClientContext *)duetOverrideContext objectForKeyedSubscript:v8];
  unint64_t v10 = (unint64_t)[v9 unsignedIntegerValue];

  if (v5) {
    unint64_t v11 = v10 | a4;
  }
  else {
    unint64_t v11 = v10 & ~a4;
  }
  if (v11 == v10)
  {
    if (!_CPLSilentLogging)
    {
      uint64_t v12 = sub_10007D2C4();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v13 = +[CPLEngineSystemMonitor descriptionForBudgets:v10];
        int v20 = 138412290;
        id v21 = v13;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Overriding system budgets is kept at %@", (uint8_t *)&v20, 0xCu);
      }
    }
  }
  else
  {
    if (!_CPLSilentLogging)
    {
      id v14 = sub_10007D2C4();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        objc_super v15 = +[CPLEngineSystemMonitor descriptionForBudgets:v10];
        v16 = +[CPLEngineSystemMonitor descriptionForBudgets:v11];
        int v20 = 138412546;
        id v21 = v15;
        __int16 v22 = 2112;
        id v23 = v16;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Overriding system budgets changed from (%@) to (%@)", (uint8_t *)&v20, 0x16u);
      }
    }
    v17 = +[NSNumber numberWithUnsignedInteger:v11];
    id v18 = self->_duetOverrideContext;
    v19 = [(CPLDuetTicketProvider *)self _budgetOverrideKeyPath];
    [(_CDClientContext *)v18 setObject:v17 forKeyedSubscript:v19];

    [(NSMutableSet *)self->_budgetDelegates enumerateObjectsUsingBlock:&stru_1002792F8];
  }
}

- (NSString)clientBundlerIdentifier
{
  return self->_clientBundlerIdentifier;
}

- (unint64_t)significantWorkRetainCount
{
  return self->_significantWorkRetainCount;
}

- (void)setSignificantWorkRetainCount:(unint64_t)a3
{
  self->_unint64_t significantWorkRetainCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientBundlerIdentifier, 0);
  objc_storeStrong((id *)&self->_duetOverrideContext, 0);
  objc_storeStrong((id *)&self->_budgetDelegates, 0);
  objc_storeStrong((id *)&self->_duetQueue, 0);
}

@end
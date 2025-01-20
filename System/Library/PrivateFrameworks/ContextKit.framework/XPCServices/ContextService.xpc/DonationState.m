@interface DonationState
+ (unint64_t)_validApplicationToExtractFromCount:(id)a3;
- (BOOL)balancedMarkIncomplete;
- (DonationState)init;
- (DonationState)initWithLayoutMonitor:(id)a3;
- (NSArray)donorBundleIdentifiers;
- (NSDate)dateCreated;
- (NSMutableArray)donations;
- (unint64_t)additionalDonationsToWaitFor;
- (unint64_t)numberOfApplicationsToWaitFor;
- (void)dealloc;
- (void)setAdditionalDonationsToWaitFor:(unint64_t)a3;
- (void)setBalancedMarkIncomplete:(BOOL)a3;
- (void)setDateCreated:(id)a3;
- (void)setDonations:(id)a3;
@end

@implementation DonationState

- (DonationState)init
{
  v6.receiver = self;
  v6.super_class = (Class)DonationState;
  v2 = [(DonationState *)&v6 init];
  if (v2)
  {
    uint64_t v3 = +[NSDate date];
    dateCreated = v2->_dateCreated;
    v2->_dateCreated = (NSDate *)v3;

    v2->_numberOfApplicationsToWaitFor = 1;
  }
  return v2;
}

- (DonationState)initWithLayoutMonitor:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)DonationState;
  v5 = [(DonationState *)&v13 init];
  if (v5)
  {
    uint64_t v6 = +[NSDate date];
    dateCreated = v5->_dateCreated;
    v5->_dateCreated = (NSDate *)v6;

    id v8 = objc_storeWeak((id *)&v5->_layoutMonitor, v4);
    v9 = [v4 currentLayout];

    v10 = objc_opt_class();
    v11 = [v9 elements];
    v5->_numberOfApplicationsToWaitFor = (unint64_t)[v10 _validApplicationToExtractFromCount:v11];
  }
  return v5;
}

- (void)dealloc
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "Clearing donation state", buf, 2u);
  }
  v3.receiver = self;
  v3.super_class = (Class)DonationState;
  [(DonationState *)&v3 dealloc];
}

+ (unint64_t)_validApplicationToExtractFromCount:(id)a3
{
  id v3 = a3;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v4 = [v3 countByEnumeratingWithState:&v27 objects:v35 count:16];
  if (v4)
  {
    id v6 = v4;
    unint64_t v26 = 0;
    uint64_t v7 = *(void *)v28;
    uint64_t v8 = FBSDisplayLayoutElementLockScreenIdentifier;
    uint64_t v9 = FBSDisplayLayoutElementSiriIdentifier;
    uint64_t v10 = FBSDisplayLayoutElementControlCenterIdentifier;
    uint64_t v25 = FBSDisplayLayoutElementNotificationCenterIdentifier;
    *(void *)&long long v5 = 138412546;
    long long v24 = v5;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v28 != v7) {
          objc_enumerationMutation(v3);
        }
        v12 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        if (objc_msgSend(v12, "isUIApplicationElement", v24))
        {
          objc_super v13 = [v12 identifier];
          unsigned __int8 v14 = [v13 isEqualToString:v8];

          if ((v14 & 1) == 0)
          {
            v15 = [v12 identifier];
            unsigned __int8 v16 = [v15 isEqualToString:v9];

            if ((v16 & 1) == 0)
            {
              v17 = [v12 identifier];
              unsigned __int8 v18 = [v17 isEqualToString:v10];

              if ((v18 & 1) == 0)
              {
                v19 = [v12 identifier];
                unsigned __int8 v20 = [v19 isEqualToString:v25];

                if ((v20 & 1) == 0)
                {
                  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
                  {
                    v21 = [v12 identifier];
                    v22 = [v12 bundleIdentifier];
                    *(_DWORD *)buf = v24;
                    v32 = v21;
                    __int16 v33 = 2112;
                    v34 = v22;
                    _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "Allowing application element with identifier: %@, bundleID: %@", buf, 0x16u);
                  }
                  ++v26;
                }
              }
            }
          }
        }
      }
      id v6 = [v3 countByEnumeratingWithState:&v27 objects:v35 count:16];
    }
    while (v6);
  }
  else
  {
    unint64_t v26 = 0;
  }

  return v26;
}

- (NSDate)dateCreated
{
  return self->_dateCreated;
}

- (void)setDateCreated:(id)a3
{
}

- (BOOL)balancedMarkIncomplete
{
  return self->_balancedMarkIncomplete;
}

- (void)setBalancedMarkIncomplete:(BOOL)a3
{
  self->_balancedMarkIncomplete = a3;
}

- (NSMutableArray)donations
{
  return self->_donations;
}

- (void)setDonations:(id)a3
{
}

- (NSArray)donorBundleIdentifiers
{
  return self->_donorBundleIdentifiers;
}

- (unint64_t)numberOfApplicationsToWaitFor
{
  return self->_numberOfApplicationsToWaitFor;
}

- (unint64_t)additionalDonationsToWaitFor
{
  return self->_additionalDonationsToWaitFor;
}

- (void)setAdditionalDonationsToWaitFor:(unint64_t)a3
{
  self->_additionalDonationsToWaitFor = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_donorBundleIdentifiers, 0);
  objc_storeStrong((id *)&self->_donations, 0);
  objc_storeStrong((id *)&self->_dateCreated, 0);
  objc_destroyWeak((id *)&self->_layoutMonitor);
}

@end
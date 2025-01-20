@interface DREnterpriseInfo
+ (id)sharedInstance;
- (DREnterpriseInfo)init;
- (NSString)orgName;
- (void)updateMDMName;
@end

@implementation DREnterpriseInfo

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002845C;
  block[3] = &unk_1000560F8;
  block[4] = a1;
  if (qword_100064910 != -1) {
    dispatch_once(&qword_100064910, block);
  }
  v2 = (void *)qword_100064908;
  return v2;
}

- (DREnterpriseInfo)init
{
  v11.receiver = self;
  v11.super_class = (Class)DREnterpriseInfo;
  v2 = [(DREnterpriseInfo *)&v11 init];
  v3 = v2;
  if (v2)
  {
    [(DREnterpriseInfo *)v2 updateMDMName];
    int out_token = 0;
    objc_initWeak(&location, v3);
    v4 = (const char *)[MDMManagingOrgInfoChangedNotification cStringUsingEncoding:4];
    id v5 = &_dispatch_main_q;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_1000285CC;
    handler[3] = &unk_100056120;
    objc_copyWeak(&v8, &location);
    notify_register_dispatch(v4, &out_token, (dispatch_queue_t)&_dispatch_main_q, handler);

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
  return v3;
}

- (void)updateMDMName
{
  id v6 = +[MCProfileConnection sharedConnection];
  v3 = [v6 managingOrganizationInformation];
  v4 = [v3 objectForKeyedSubscript:kMCCCOrganizationNameKey];
  orgName = self->_orgName;
  self->_orgName = v4;
}

- (NSString)orgName
{
  return self->_orgName;
}

- (void).cxx_destruct
{
}

@end
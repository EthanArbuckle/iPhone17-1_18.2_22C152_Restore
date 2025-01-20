@interface FAUpdateFamilyMemberFlagOperation
- (BOOL)enabled;
- (FAUpdateFamilyMemberFlagOperation)initWithNetworkService:(id)a3 accountSigner:(id)a4 memberDSID:(id)a5 flag:(id)a6 enabled:(BOOL)a7;
- (FAUpdateFamilyMemberFlagOperation)initWithNetworkService:(id)a3 grandSlamSigner:(id)a4 familyGrandSlamSigner:(id)a5 memberDSID:(id)a6 flag:(id)a7 enabled:(BOOL)a8;
- (NSNumber)dsid;
- (NSString)flag;
- (id)_flagKey;
- (id)_flagType;
- (id)accountSigner;
- (id)updateMemberFlag;
- (id)urlByAddingParamsToURL:(id)a3;
- (void)_addBodyToRequest:(id)a3;
- (void)_addHeadersToRequest:(id)a3;
- (void)setAccountSigner:(id)a3;
@end

@implementation FAUpdateFamilyMemberFlagOperation

- (FAUpdateFamilyMemberFlagOperation)initWithNetworkService:(id)a3 grandSlamSigner:(id)a4 familyGrandSlamSigner:(id)a5 memberDSID:(id)a6 flag:(id)a7 enabled:(BOOL)a8
{
  BOOL v8 = a8;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10000DBF0;
  v19[3] = &unk_10004D908;
  id v20 = a3;
  id v21 = a4;
  id v22 = a5;
  id v14 = v22;
  id v15 = v21;
  id v16 = v20;
  v17 = [(FAUpdateFamilyMemberFlagOperation *)self initWithNetworkService:v16 accountSigner:v19 memberDSID:a6 flag:a7 enabled:v8];

  return v17;
}

- (FAUpdateFamilyMemberFlagOperation)initWithNetworkService:(id)a3 accountSigner:(id)a4 memberDSID:(id)a5 flag:(id)a6 enabled:(BOOL)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v20.receiver = self;
  v20.super_class = (Class)FAUpdateFamilyMemberFlagOperation;
  id v15 = [(FANetworkClient *)&v20 initWithNetworkService:a3];
  id v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_dsid, a5);
    id v17 = objc_retainBlock(v12);
    id accountSigner = v16->_accountSigner;
    v16->_id accountSigner = v17;

    objc_storeStrong((id *)&v16->_flag, a6);
    v16->_enabled = a7;
  }

  return v16;
}

- (id)updateMemberFlag
{
  id v15 = [(FANetworkClient *)self networkService];
  id v14 = [v15 ensureDeviceUnlockedSinceBoot];
  v3 = [v14 then];
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10000E030;
  v20[3] = &unk_10004D0F8;
  v20[4] = self;
  v4 = ((void (**)(void, void *))v3)[2](v3, v20);
  v5 = [v4 then];
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10000E080;
  v19[3] = &unk_10004D930;
  void v19[4] = self;
  v6 = ((void (**)(void, void *))v5)[2](v5, v19);
  v7 = [v6 then];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10000E0D8;
  v18[3] = &unk_10004D958;
  v18[4] = self;
  BOOL v8 = ((void (**)(void, void *))v7)[2](v7, v18);
  v9 = [v8 then];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10000E1A4;
  v17[3] = &unk_10004D5B0;
  v17[4] = self;
  v10 = ((void (**)(void, void *))v9)[2](v9, v17);
  v11 = [v10 then];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10000E210;
  v16[3] = &unk_10004D980;
  v16[4] = self;
  id v12 = ((void (**)(void, void *))v11)[2](v11, v16);

  return v12;
}

- (id)urlByAddingParamsToURL:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)NSURLComponents) initWithURL:v4 resolvingAgainstBaseURL:0];

  id v6 = objc_alloc((Class)NSURLQueryItem);
  v7 = [(NSNumber *)self->_dsid stringValue];
  id v8 = [v6 initWithName:@"memberId" value:v7];
  id v9 = objc_alloc((Class)NSURLQueryItem);
  v10 = [(FAUpdateFamilyMemberFlagOperation *)self _flagType];
  id v11 = [v9 initWithName:@"flagType" value:v10];
  v18[1] = v11;
  id v12 = objc_alloc((Class)NSURLQueryItem);
  if (self->_enabled) {
    CFStringRef v13 = @"true";
  }
  else {
    CFStringRef v13 = @"false";
  }
  id v14 = [v12 initWithName:@"flagValue" value:v13];
  v18[2] = v14;
  id v15 = +[NSArray arrayWithObjects:v18 count:3];
  [v5 setQueryItems:v15];

  id v16 = [v5 URL];

  return v16;
}

- (void)_addHeadersToRequest:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "ak_addAnisetteHeaders");
  objc_msgSend(v4, "ak_addClientInfoHeader");
  objc_msgSend(v4, "ak_addDeviceUDIDHeader");
  objc_msgSend(v4, "ak_addInternalBuildHeader");
  id v5 = +[NSLocale preferredLanguages];
  id v6 = [v5 componentsJoinedByString:@", "];
  [v4 setValue:v6 forHTTPHeaderField:@"X-MMe-Language"];

  v7 = +[NSTimeZone systemTimeZone];
  id v8 = [v7 abbreviation];
  [v4 setValue:v8 forHTTPHeaderField:@"X-MMe-Timezone"];

  id v9 = [(FAUpdateFamilyMemberFlagOperation *)self accountSigner];
  v9[2](v9, v4);
}

- (void)_addBodyToRequest:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(FAUpdateFamilyMemberFlagOperation *)self _flagKey];
  id v6 = (void *)v5;
  if (v5)
  {
    if (self->_enabled) {
      CFStringRef v7 = @"true";
    }
    else {
      CFStringRef v7 = @"false";
    }
    uint64_t v9 = v5;
    CFStringRef v10 = v7;
    id v8 = +[NSDictionary dictionaryWithObjects:&v10 forKeys:&v9 count:1];
    objc_msgSend(v4, "aa_setBodyWithParameters:", v8);
  }
}

- (id)_flagType
{
  p_flag = (uint64_t *)&self->_flag;
  if ([(NSString *)self->_flag isEqualToString:FAMemberFlagScreenTime]) {
    return @"4";
  }
  id v4 = _FALogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    sub_100034F00(p_flag, v4);
  }

  return 0;
}

- (id)_flagKey
{
  p_flag = (uint64_t *)&self->_flag;
  if ([(NSString *)self->_flag isEqualToString:FAMemberFlagScreenTime]) {
    return @"screen-time";
  }
  id v4 = _FALogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    sub_100034F00(p_flag, v4);
  }

  return 0;
}

- (NSNumber)dsid
{
  return (NSNumber *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)flag
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (id)accountSigner
{
  return self->_accountSigner;
}

- (void)setAccountSigner:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_accountSigner, 0);
  objc_storeStrong((id *)&self->_flag, 0);
  objc_storeStrong((id *)&self->_dsid, 0);
}

@end
@interface FAUpdateFamilyMemberFlagsOperation
- (FAUpdateFamilyMemberFlagsOperation)initWithNetworkService:(id)a3 grandSlamSigner:(id)a4 familyGrandSlamSigner:(id)a5 memberDSID:(id)a6 flags:(id)a7;
- (NSDictionary)flags;
- (NSNumber)dsid;
- (id)updateMemberFlags;
- (void)_addBodyToRequest:(id)a3;
- (void)_addHeadersToRequest:(id)a3;
@end

@implementation FAUpdateFamilyMemberFlagsOperation

- (FAUpdateFamilyMemberFlagsOperation)initWithNetworkService:(id)a3 grandSlamSigner:(id)a4 familyGrandSlamSigner:(id)a5 memberDSID:(id)a6 flags:(id)a7
{
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v20.receiver = self;
  v20.super_class = (Class)FAUpdateFamilyMemberFlagsOperation;
  v17 = [(FANetworkClient *)&v20 initWithNetworkService:a3];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_dsid, a6);
    objc_storeStrong((id *)&v18->_flags, a7);
    objc_storeStrong((id *)&v18->_grandSlamSigner, a4);
    objc_storeStrong((id *)&v18->_familyGrandSlamSigner, a5);
  }

  return v18;
}

- (id)updateMemberFlags
{
  id v15 = [(FANetworkClient *)self networkService];
  id v14 = [v15 ensureDeviceUnlockedSinceBoot];
  v3 = [v14 then];
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100013928;
  v20[3] = &unk_10004D0F8;
  v20[4] = self;
  v4 = ((void (**)(void, void *))v3)[2](v3, v20);
  v5 = [v4 then];
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100013978;
  v19[3] = &unk_10004D930;
  v19[4] = self;
  v6 = ((void (**)(void, void *))v5)[2](v5, v19);
  v7 = [v6 then];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_1000139D0;
  v18[3] = &unk_10004D958;
  v18[4] = self;
  v8 = ((void (**)(void, void *))v7)[2](v7, v18);
  v9 = [v8 then];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100013A44;
  v17[3] = &unk_10004D5B0;
  v17[4] = self;
  v10 = ((void (**)(void, void *))v9)[2](v9, v17);
  v11 = [v10 then];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100013AB0;
  v16[3] = &unk_10004DCB0;
  v16[4] = self;
  v12 = ((void (**)(void, void *))v11)[2](v11, v16);

  return v12;
}

- (void)_addHeadersToRequest:(id)a3
{
  id v12 = a3;
  v4 = [(FANetworkClient *)self networkService];
  v5 = [v4 account];
  objc_msgSend(v12, "aa_addBasicAuthorizationHeaderWithAccount:preferUsingPassword:", v5, 0);

  v6 = [(FANetworkClient *)self networkService];
  v7 = [v6 account];
  objc_msgSend(v12, "aa_addLoggedInAppleIDHeaderWithAccount:", v7);

  objc_msgSend(v12, "ak_addAnisetteHeaders");
  objc_msgSend(v12, "ak_addClientInfoHeader");
  objc_msgSend(v12, "ak_addDeviceUDIDHeader");
  objc_msgSend(v12, "ak_addInternalBuildHeader");
  v8 = +[NSLocale preferredLanguages];
  v9 = [v8 componentsJoinedByString:@", "];
  [v12 setValue:v9 forHTTPHeaderField:@"X-MMe-Language"];

  v10 = +[NSTimeZone systemTimeZone];
  v11 = [v10 abbreviation];
  [v12 setValue:v11 forHTTPHeaderField:@"X-MMe-Timezone"];

  [v12 setValue:@"application/x-plist" forHTTPHeaderField:@"Content-Type"];
  [(AAGrandSlamSigner *)self->_grandSlamSigner signURLRequest:v12];
  [(AAGrandSlamSigner *)self->_familyGrandSlamSigner signURLRequest:v12];
}

- (void)_addBodyToRequest:(id)a3
{
  id v12 = a3;
  v4 = [(NSDictionary *)self->_flags allKeys];
  v5 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v4 count]);
  if ([v4 count])
  {
    unint64_t v6 = 0;
    do
    {
      v7 = [v4 objectAtIndexedSubscript:v6];
      v15[1] = @"flagValue";
      v16[0] = v7;
      v15[0] = @"flagName";
      v8 = [(NSDictionary *)self->_flags objectForKeyedSubscript:v7];
      v16[1] = v8;
      v9 = +[NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:2];
      [v5 setObject:v9 atIndexedSubscript:v6];

      ++v6;
    }
    while ((unint64_t)[v4 count] > v6);
  }
  dsid = self->_dsid;
  v13[0] = @"memberDSID";
  v13[1] = @"memberFlags";
  v14[0] = dsid;
  v14[1] = v5;
  v11 = +[NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:2];
  objc_msgSend(v12, "aa_setBodyWithParameters:", v11);
}

- (NSNumber)dsid
{
  return (NSNumber *)objc_getProperty(self, a2, 32, 1);
}

- (NSDictionary)flags
{
  return (NSDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_flags, 0);
  objc_storeStrong((id *)&self->_dsid, 0);
  objc_storeStrong((id *)&self->_familyGrandSlamSigner, 0);
  objc_storeStrong((id *)&self->_grandSlamSigner, 0);
}

@end
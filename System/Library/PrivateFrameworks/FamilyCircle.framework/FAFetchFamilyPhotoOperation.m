@interface FAFetchFamilyPhotoOperation
- (BOOL)localFallback;
- (BOOL)useMonogramAsLastResort;
- (FAFamilyPhotoCache)cache;
- (FAFetchFamilyPhotoOperation)initWithNetworkService:(id)a3 memberDSID:(id)a4 memberHashedDSID:(id)a5 size:(int64_t)a6 localFallback:(BOOL)a7 context:(id)a8 requestCoalescer:(id)a9 fetchFamilyFactory:(id)a10;
- (FAFetchFamilyPhotoOperationContext)context;
- (FARequestCoalescer)requestCoalescer;
- (NSNumber)dsid;
- (NSString)clientProcess;
- (NSString)emailAddress;
- (NSString)fullname;
- (NSString)hashedDSID;
- (NSString)phoneNumber;
- (double)monogramDiameter;
- (double)screenScale;
- (id)_monogramForContact:(id)a3;
- (id)_monogramWithFirstName:(id)a3 lastName:(id)a4;
- (id)familyMemberMatchingDSID;
- (id)fetchCachedPhotoForFamilyMember:(id)a3;
- (id)fetchFamilyFactory;
- (id)fetchPhoto;
- (id)fetchRemotePhotoForFamilyMember:(id)a3;
- (int64_t)backgroundType;
- (int64_t)size;
- (void)setBackgroundType:(int64_t)a3;
- (void)setCache:(id)a3;
- (void)setClientProcess:(id)a3;
- (void)setDsid:(id)a3;
- (void)setEmailAddress:(id)a3;
- (void)setFetchFamilyFactory:(id)a3;
- (void)setFullname:(id)a3;
- (void)setHashedDSID:(id)a3;
- (void)setLocalFallback:(BOOL)a3;
- (void)setMonogramDiameter:(double)a3;
- (void)setPhoneNumber:(id)a3;
- (void)setRequestCoalescer:(id)a3;
- (void)setSize:(int64_t)a3;
- (void)setUseMonogramAsLastResort:(BOOL)a3;
@end

@implementation FAFetchFamilyPhotoOperation

- (FAFetchFamilyPhotoOperation)initWithNetworkService:(id)a3 memberDSID:(id)a4 memberHashedDSID:(id)a5 size:(int64_t)a6 localFallback:(BOOL)a7 context:(id)a8 requestCoalescer:(id)a9 fetchFamilyFactory:(id)a10
{
  id v26 = a4;
  id v25 = a5;
  id v24 = a8;
  id v17 = a9;
  id v18 = a10;
  v27.receiver = self;
  v27.super_class = (Class)FAFetchFamilyPhotoOperation;
  v19 = [(FANetworkClient *)&v27 initWithNetworkService:a3];
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_dsid, a4);
    objc_storeStrong((id *)&v20->_hashedDSID, a5);
    v20->_size = a6;
    v20->_localFallback = a7;
    objc_storeStrong((id *)&v20->_context, a8);
    v20->_useMonogramAsLastResort = 1;
    id v21 = objc_retainBlock(v18);
    id fetchFamilyFactory = v20->_fetchFamilyFactory;
    v20->_id fetchFamilyFactory = v21;

    objc_storeStrong((id *)&v20->_requestCoalescer, a9);
  }

  return v20;
}

- (id)fetchPhoto
{
  v3 = [(FANetworkClient *)self networkService];
  v4 = [v3 ensureDeviceUnlockedSinceBoot];
  v5 = [v4 then];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100010B98;
  v14[3] = &unk_10004D0F8;
  v14[4] = self;
  v6 = ((void (**)(void, void *))v5)[2](v5, v14);
  v7 = [v6 then];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100010BE8;
  v13[3] = &unk_10004D160;
  v13[4] = self;
  v8 = ((void (**)(void, void *))v7)[2](v7, v13);
  v9 = [v8 thenOnQueue];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100010BF0;
  v12[3] = &unk_10004DB68;
  v12[4] = self;
  v10 = ((void (**)(void, void *, void *))v9)[2](v9, &_dispatch_main_q, v12);

  return v10;
}

- (id)familyMemberMatchingDSID
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000113AC;
  v4[3] = &unk_10004D318;
  v4[4] = self;
  id v2 = [objc_alloc((Class)AAFPromise) initWithBlock:v4];
  return v2;
}

- (id)fetchCachedPhotoForFamilyMember:(id)a3
{
  id v4 = a3;
  v5 = _FALogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412546;
    id v13 = (id)objc_opt_class();
    __int16 v14 = 2112;
    id v15 = v4;
    id v6 = v13;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@: Fetching cached photo for member %@", (uint8_t *)&v12, 0x16u);
  }
  v7 = [FAFamilyPhotoCache alloc];
  v8 = [v4 altDSID];
  v9 = [(FAFamilyPhotoCache *)v7 initWithAltDSID:v8];

  [(FAFetchFamilyPhotoOperation *)self setCache:v9];
  v10 = [(FAFamilyPhotoCache *)v9 load];

  return v10;
}

- (id)fetchRemotePhotoForFamilyMember:(id)a3
{
  id v4 = a3;
  v5 = _FALogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v18 = (id)objc_opt_class();
    __int16 v19 = 2112;
    id v20 = v4;
    id v6 = v18;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@: Fetching remote photo for member %@", buf, 0x16u);
  }
  v7 = [v4 dsid];
  v8 = [v7 description];
  v9 = +[NSString stringWithFormat:@"%@-%@", @"FAFetchFamilyPhotoOperationKeyPrefix", v8];

  requestCoalescer = self->_requestCoalescer;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100011A4C;
  v14[3] = &unk_10004D250;
  id v15 = v4;
  v16 = self;
  id v11 = v4;
  int v12 = [(FARequestCoalescer *)requestCoalescer performBlockForKey:v9 force:0 block:v14];

  return v12;
}

- (id)_monogramWithFirstName:(id)a3 lastName:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc_init((Class)CNMutableContact);
  [v8 setContactType:0];
  [v8 setGivenName:v7];

  [v8 setFamilyName:v6];
  v9 = [(FAFetchFamilyPhotoOperation *)self _monogramForContact:v8];

  return v9;
}

- (id)_monogramForContact:(id)a3
{
  double monogramDiameter = self->_monogramDiameter;
  id v5 = a3;
  [(FAFetchFamilyPhotoOperation *)self screenScale];
  id v7 = +[FAMonogram monogramForContact:v5 diameter:monogramDiameter scale:v6];

  return v7;
}

- (double)screenScale
{
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x2050000000;
  id v2 = (void *)qword_10005EF68;
  uint64_t v12 = qword_10005EF68;
  if (!qword_10005EF68)
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100012440;
    v8[3] = &unk_10004DAB0;
    v8[4] = &v9;
    sub_100012440((uint64_t)v8);
    id v2 = (void *)v10[3];
  }
  id v3 = v2;
  _Block_object_dispose(&v9, 8);
  id v4 = [v3 mainScreen];
  [v4 scale];
  double v6 = v5;

  return v6;
}

- (NSNumber)dsid
{
  return (NSNumber *)objc_getProperty(self, a2, 24, 1);
}

- (void)setDsid:(id)a3
{
}

- (NSString)hashedDSID
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setHashedDSID:(id)a3
{
}

- (int64_t)size
{
  return self->_size;
}

- (void)setSize:(int64_t)a3
{
  self->_size = a3;
}

- (BOOL)localFallback
{
  return self->_localFallback;
}

- (void)setLocalFallback:(BOOL)a3
{
  self->_localFallback = a3;
}

- (double)monogramDiameter
{
  return self->_monogramDiameter;
}

- (void)setMonogramDiameter:(double)a3
{
  self->_double monogramDiameter = a3;
}

- (int64_t)backgroundType
{
  return self->_backgroundType;
}

- (void)setBackgroundType:(int64_t)a3
{
  self->_backgroundType = a3;
}

- (BOOL)useMonogramAsLastResort
{
  return self->_useMonogramAsLastResort;
}

- (void)setUseMonogramAsLastResort:(BOOL)a3
{
  self->_useMonogramAsLastResort = a3;
}

- (NSString)fullname
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void)setFullname:(id)a3
{
}

- (NSString)emailAddress
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (void)setEmailAddress:(id)a3
{
}

- (NSString)phoneNumber
{
  return (NSString *)objc_getProperty(self, a2, 80, 1);
}

- (void)setPhoneNumber:(id)a3
{
}

- (NSString)clientProcess
{
  return (NSString *)objc_getProperty(self, a2, 88, 1);
}

- (void)setClientProcess:(id)a3
{
}

- (FAFetchFamilyPhotoOperationContext)context
{
  return self->_context;
}

- (id)fetchFamilyFactory
{
  return self->_fetchFamilyFactory;
}

- (void)setFetchFamilyFactory:(id)a3
{
}

- (FAFamilyPhotoCache)cache
{
  return self->_cache;
}

- (void)setCache:(id)a3
{
}

- (FARequestCoalescer)requestCoalescer
{
  return self->_requestCoalescer;
}

- (void)setRequestCoalescer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestCoalescer, 0);
  objc_storeStrong((id *)&self->_cache, 0);
  objc_storeStrong(&self->_fetchFamilyFactory, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_clientProcess, 0);
  objc_storeStrong((id *)&self->_phoneNumber, 0);
  objc_storeStrong((id *)&self->_emailAddress, 0);
  objc_storeStrong((id *)&self->_fullname, 0);
  objc_storeStrong((id *)&self->_hashedDSID, 0);
  objc_storeStrong((id *)&self->_dsid, 0);
}

@end
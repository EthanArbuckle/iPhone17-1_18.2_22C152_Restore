@interface FAFetchFamilyPhotoRequest
- (BOOL)localFallback;
- (BOOL)useMonogramAsLastResort;
- (FAFetchFamilyPhotoRequest)init;
- (FAFetchFamilyPhotoRequest)initWithConnectionProvider:(id)a3;
- (FAFetchFamilyPhotoRequest)initWithFamilyMemberDSID:(id)a3 size:(unint64_t)a4 localFallback:(BOOL)a5;
- (FAFetchFamilyPhotoRequest)initWithFamilyMemberDSID:(id)a3 size:(unint64_t)a4 localFallback:(BOOL)a5 connectionProvider:(id)a6;
- (FAFetchFamilyPhotoRequest)initWithFamilyMemberHashedDSID:(id)a3 size:(unint64_t)a4 localFallback:(BOOL)a5;
- (FAFetchFamilyPhotoRequest)initWithFamilyMemberHashedDSID:(id)a3 size:(unint64_t)a4 localFallback:(BOOL)a5 connectionProvider:(id)a6;
- (NSNumber)memberDSID;
- (NSString)emailAddress;
- (NSString)fullname;
- (NSString)memberHashedDSID;
- (NSString)phoneNumber;
- (double)monogramDiameter;
- (double)requiredHeight;
- (double)requiredWidth;
- (id)requestOptions;
- (int64_t)backgroundType;
- (unint64_t)requestedSize;
- (void)setBackgroundType:(int64_t)a3;
- (void)setEmailAddress:(id)a3;
- (void)setFullname:(id)a3;
- (void)setMonogramDiameter:(double)a3;
- (void)setPhoneNumber:(id)a3;
- (void)setRequiredHeight:(double)a3;
- (void)setRequiredWidth:(double)a3;
- (void)setUseMonogramAsLastResort:(BOOL)a3;
- (void)startRequestWithCompletionHandler:(id)a3;
@end

@implementation FAFetchFamilyPhotoRequest

- (FAFetchFamilyPhotoRequest)initWithFamilyMemberDSID:(id)a3 size:(unint64_t)a4 localFallback:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  v9 = +[_FAFamilyCircleRequestConnectionProvider sharedInstance];
  v10 = [(FAFetchFamilyPhotoRequest *)self initWithFamilyMemberDSID:v8 size:a4 localFallback:v5 connectionProvider:v9];

  return v10;
}

- (FAFetchFamilyPhotoRequest)initWithFamilyMemberDSID:(id)a3 size:(unint64_t)a4 localFallback:(BOOL)a5 connectionProvider:(id)a6
{
  id v10 = a3;
  v11 = [(FAFetchFamilyPhotoRequest *)self initWithConnectionProvider:a6];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_memberDSID, a3);
    v12->_requestedSize = a4;
    v13 = v12;
  }

  return v12;
}

- (FAFetchFamilyPhotoRequest)initWithFamilyMemberHashedDSID:(id)a3 size:(unint64_t)a4 localFallback:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  v9 = +[_FAFamilyCircleRequestConnectionProvider sharedInstance];
  id v10 = [(FAFetchFamilyPhotoRequest *)self initWithFamilyMemberHashedDSID:v8 size:a4 localFallback:v5 connectionProvider:v9];

  return v10;
}

- (FAFetchFamilyPhotoRequest)initWithFamilyMemberHashedDSID:(id)a3 size:(unint64_t)a4 localFallback:(BOOL)a5 connectionProvider:(id)a6
{
  id v10 = a3;
  v11 = [(FAFetchFamilyPhotoRequest *)self initWithConnectionProvider:a6];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_memberHashedDSID, a3);
    v12->_requestedSize = a4;
    v13 = v12;
  }

  return v12;
}

- (FAFetchFamilyPhotoRequest)init
{
  v3 = +[_FAFamilyCircleRequestConnectionProvider sharedInstance];
  v4 = [(FAFetchFamilyPhotoRequest *)self initWithConnectionProvider:v3];

  return v4;
}

- (FAFetchFamilyPhotoRequest)initWithConnectionProvider:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)FAFetchFamilyPhotoRequest;
  result = [(FAFamilyCircleRequest *)&v4 initWithConnectionProvider:a3];
  result->_monogramDiameter = 40.0;
  result->_useMonogramAsLastResort = 1;
  return result;
}

- (id)requestOptions
{
  v17.receiver = self;
  v17.super_class = (Class)FAFetchFamilyPhotoRequest;
  v3 = [(FAFamilyCircleRequest *)&v17 requestOptions];
  objc_super v4 = (void *)[v3 mutableCopy];

  BOOL v5 = objc_msgSend(NSNumber, "numberWithInteger:", -[FAFetchFamilyPhotoRequest backgroundType](self, "backgroundType"));
  [v4 setObject:v5 forKeyedSubscript:@"backgroundType"];

  v6 = NSNumber;
  [(FAFetchFamilyPhotoRequest *)self monogramDiameter];
  v7 = objc_msgSend(v6, "numberWithDouble:");
  [v4 setObject:v7 forKeyedSubscript:@"monogramDiameter"];

  id v8 = [(FAFetchFamilyPhotoRequest *)self fullname];

  if (v8)
  {
    v9 = [(FAFetchFamilyPhotoRequest *)self fullname];
    [v4 setObject:v9 forKeyedSubscript:@"fullname"];
  }
  id v10 = [(FAFetchFamilyPhotoRequest *)self emailAddress];

  if (v10)
  {
    v11 = [(FAFetchFamilyPhotoRequest *)self emailAddress];
    [v4 setObject:v11 forKeyedSubscript:@"emailAddress"];
  }
  v12 = [(FAFetchFamilyPhotoRequest *)self phoneNumber];

  if (v12)
  {
    v13 = [(FAFetchFamilyPhotoRequest *)self phoneNumber];
    [v4 setObject:v13 forKeyedSubscript:@"phoneNumber"];
  }
  v14 = objc_msgSend(NSNumber, "numberWithBool:", -[FAFetchFamilyPhotoRequest useMonogramAsLastResort](self, "useMonogramAsLastResort"));
  [v4 setObject:v14 forKeyedSubscript:@"useMonogramAsLastResort"];

  v15 = (void *)[v4 copy];
  return v15;
}

- (void)startRequestWithCompletionHandler:(id)a3
{
  id v4 = a3;
  BOOL v5 = _FALogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D252C000, v5, OS_LOG_TYPE_DEFAULT, "FAFetchFamilyPhotoRequest - startRequestWithCompletionHandler:", buf, 2u);
  }

  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __63__FAFetchFamilyPhotoRequest_startRequestWithCompletionHandler___block_invoke;
  v16[3] = &unk_1E6924B90;
  id v6 = v4;
  id v17 = v6;
  v7 = [(FAFamilyCircleRequest *)self serviceRemoteObjectWithErrorHandler:v16];
  id v8 = [(FAFetchFamilyPhotoRequest *)self memberDSID];
  v9 = [(FAFetchFamilyPhotoRequest *)self memberHashedDSID];
  unint64_t v10 = [(FAFetchFamilyPhotoRequest *)self requestedSize];
  BOOL v11 = [(FAFetchFamilyPhotoRequest *)self localFallback];
  v12 = [(FAFetchFamilyPhotoRequest *)self requestOptions];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __63__FAFetchFamilyPhotoRequest_startRequestWithCompletionHandler___block_invoke_20;
  v14[3] = &unk_1E6925850;
  id v15 = v6;
  id v13 = v6;
  [v7 fetchFamilyMemberPhotoWithDSID:v8 hashedDSID:v9 size:v10 localFallback:v11 options:v12 replyBlock:v14];
}

void __63__FAFetchFamilyPhotoRequest_startRequestWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = _FALogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl(&dword_1D252C000, v4, OS_LOG_TYPE_DEFAULT, "FARemoveFamilyMemberRequest: Error from service - %@", (uint8_t *)&v5, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __63__FAFetchFamilyPhotoRequest_startRequestWithCompletionHandler___block_invoke_20(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (NSNumber)memberDSID
{
  return (NSNumber *)objc_getProperty(self, a2, 40, 1);
}

- (NSString)memberHashedDSID
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (BOOL)localFallback
{
  return self->_localFallback;
}

- (unint64_t)requestedSize
{
  return self->_requestedSize;
}

- (double)requiredWidth
{
  return self->_requiredWidth;
}

- (void)setRequiredWidth:(double)a3
{
  self->_requiredWidth = a3;
}

- (double)requiredHeight
{
  return self->_requiredHeight;
}

- (void)setRequiredHeight:(double)a3
{
  self->_requiredHeight = a3;
}

- (double)monogramDiameter
{
  return self->_monogramDiameter;
}

- (void)setMonogramDiameter:(double)a3
{
  self->_monogramDiameter = a3;
}

- (BOOL)useMonogramAsLastResort
{
  return self->_useMonogramAsLastResort;
}

- (void)setUseMonogramAsLastResort:(BOOL)a3
{
  self->_useMonogramAsLastResort = a3;
}

- (int64_t)backgroundType
{
  return self->_backgroundType;
}

- (void)setBackgroundType:(int64_t)a3
{
  self->_backgroundType = a3;
}

- (NSString)fullname
{
  return (NSString *)objc_getProperty(self, a2, 96, 1);
}

- (void)setFullname:(id)a3
{
}

- (NSString)emailAddress
{
  return (NSString *)objc_getProperty(self, a2, 104, 1);
}

- (void)setEmailAddress:(id)a3
{
}

- (NSString)phoneNumber
{
  return (NSString *)objc_getProperty(self, a2, 112, 1);
}

- (void)setPhoneNumber:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_phoneNumber, 0);
  objc_storeStrong((id *)&self->_emailAddress, 0);
  objc_storeStrong((id *)&self->_fullname, 0);
  objc_storeStrong((id *)&self->_memberHashedDSID, 0);
  objc_storeStrong((id *)&self->_memberDSID, 0);
}

@end
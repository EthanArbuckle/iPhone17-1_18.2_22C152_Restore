@interface DTExpiredPidCacheService
+ (id)defaultCache;
+ (void)disableExpiredPidCaching;
- (DTExpiredPidCacheService)init;
- (id)allExpiredSignatures;
- (id)signatureForExpiredPid:(id)a3;
- (void)dealloc;
- (void)enableCaching:(BOOL)a3;
@end

@implementation DTExpiredPidCacheService

- (DTExpiredPidCacheService)init
{
  v5.receiver = self;
  v5.super_class = (Class)DTExpiredPidCacheService;
  v2 = [(XRExpiredPidCacheServiceProtected *)&v5 init];
  v3 = v2;
  if (v2) {
    [(XRExpiredPidCacheServiceProtected *)v2 _performOnCache:&unk_26E515448];
  }
  return v3;
}

- (void)dealloc
{
  [(XRExpiredPidCacheServiceProtected *)self _performOnCache:&unk_26E515A68];
  v3.receiver = self;
  v3.super_class = (Class)DTExpiredPidCacheService;
  [(DTExpiredPidCacheService *)&v3 dealloc];
}

+ (void)disableExpiredPidCaching
{
  byte_268707DA0 = 1;
  v2 = [a1 defaultCache];

  if (v2) {
    NSLog(&cfstr_PossibleRaceCo.isa);
  }
}

+ (id)defaultCache
{
  if (qword_268707DA8 != -1) {
    dispatch_once(&qword_268707DA8, &unk_26E515A88);
  }
  v2 = (void *)qword_268707DB0;
  return v2;
}

- (id)signatureForExpiredPid:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x3032000000;
  v14 = sub_230880D34;
  v15 = sub_230880D44;
  id v16 = 0;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = sub_230881194;
  v8[3] = &unk_264B8D520;
  id v5 = v4;
  id v9 = v5;
  v10 = &v11;
  [(XRExpiredPidCacheServiceProtected *)self _performOnCache:v8];
  id v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

- (id)allExpiredSignatures
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x3032000000;
  v8 = sub_230880D34;
  id v9 = sub_230880D44;
  id v10 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = sub_2308814E4;
  v4[3] = &unk_264B8D548;
  v4[4] = &v5;
  [(XRExpiredPidCacheServiceProtected *)self _performOnCache:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

- (void)enableCaching:(BOOL)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = sub_2308815A4;
  v3[3] = &unk_264B8D568;
  BOOL v4 = a3;
  [(XRExpiredPidCacheServiceProtected *)self _performOnCache:v3];
}

@end
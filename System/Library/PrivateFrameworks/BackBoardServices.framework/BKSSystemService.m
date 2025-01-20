@interface BKSSystemService
- (BKSSystemService)init;
- (BOOL)canOpenApplication:(id)a3 reason:(int *)a4;
- (id)systemApplicationBundleIdentifier;
- (int)pidForApplication:(id)a3;
- (unsigned)createClientPort;
- (void)cleanupClientPort:(unsigned int)a3;
- (void)openApplication:(id)a3 options:(id)a4 clientPort:(unsigned int)a5 withResult:(id)a6;
- (void)openApplication:(id)a3 options:(id)a4 withResult:(id)a5;
- (void)openURL:(id)a3 application:(id)a4 options:(id)a5 clientPort:(unsigned int)a6 withResult:(id)a7;
- (void)terminateApplication:(id)a3 forReason:(int)a4 andReport:(BOOL)a5 withDescription:(id)a6;
@end

@implementation BKSSystemService

- (int)pidForApplication:(id)a3
{
  return [(FBSSystemService *)self->_fbsSystemService pidForApplication:a3];
}

- (void).cxx_destruct
{
}

- (BKSSystemService)init
{
  v8.receiver = self;
  v8.super_class = (Class)BKSSystemService;
  v2 = [(BKSSystemService *)&v8 init];
  if (v2)
  {
    uint64_t v10 = 0;
    v11 = &v10;
    uint64_t v12 = 0x2050000000;
    v3 = (void *)getFBSSystemServiceClass_softClass;
    uint64_t v13 = getFBSSystemServiceClass_softClass;
    if (!getFBSSystemServiceClass_softClass)
    {
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __getFBSSystemServiceClass_block_invoke;
      v9[3] = &unk_1E5441630;
      v9[4] = &v10;
      __getFBSSystemServiceClass_block_invoke((uint64_t)v9);
      v3 = (void *)v11[3];
    }
    v4 = v3;
    _Block_object_dispose(&v10, 8);
    v5 = (FBSSystemService *)objc_alloc_init(v4);
    fbsSystemService = v2->_fbsSystemService;
    v2->_fbsSystemService = v5;
  }
  return v2;
}

- (void)cleanupClientPort:(unsigned int)a3
{
}

- (unsigned)createClientPort
{
  return [(FBSSystemService *)self->_fbsSystemService createClientPort];
}

- (void)openURL:(id)a3 application:(id)a4 options:(id)a5 clientPort:(unsigned int)a6 withResult:(id)a7
{
  uint64_t v7 = *(void *)&a6;
  id v12 = a7;
  fbsSystemService = self->_fbsSystemService;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __70__BKSSystemService_openURL_application_options_clientPort_withResult___block_invoke;
  v15[3] = &unk_1E5441030;
  id v16 = v12;
  id v14 = v12;
  [(FBSSystemService *)fbsSystemService openURL:a3 application:a4 options:a5 clientPort:v7 withResult:v15];
}

uint64_t __70__BKSSystemService_openURL_application_options_clientPort_withResult___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)openApplication:(id)a3 options:(id)a4 clientPort:(unsigned int)a5 withResult:(id)a6
{
  uint64_t v6 = *(void *)&a5;
  id v10 = a6;
  fbsSystemService = self->_fbsSystemService;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __66__BKSSystemService_openApplication_options_clientPort_withResult___block_invoke;
  v13[3] = &unk_1E5441030;
  id v14 = v10;
  id v12 = v10;
  [(FBSSystemService *)fbsSystemService openApplication:a3 options:a4 clientPort:v6 withResult:v13];
}

uint64_t __66__BKSSystemService_openApplication_options_clientPort_withResult___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)terminateApplication:(id)a3 forReason:(int)a4 andReport:(BOOL)a5 withDescription:(id)a6
{
}

- (void)openApplication:(id)a3 options:(id)a4 withResult:(id)a5
{
  id v8 = a5;
  fbsSystemService = self->_fbsSystemService;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __55__BKSSystemService_openApplication_options_withResult___block_invoke;
  v11[3] = &unk_1E5441030;
  id v12 = v8;
  id v10 = v8;
  [(FBSSystemService *)fbsSystemService openApplication:a3 options:a4 withResult:v11];
}

uint64_t __55__BKSSystemService_openApplication_options_withResult___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (BOOL)canOpenApplication:(id)a3 reason:(int *)a4
{
  if (a4)
  {
    uint64_t v6 = *a4;
    BOOL result = [(FBSSystemService *)self->_fbsSystemService canOpenApplication:a3 reason:&v6];
    *a4 = v6;
  }
  else
  {
    uint64_t v6 = 0;
    return [(FBSSystemService *)self->_fbsSystemService canOpenApplication:a3 reason:&v6];
  }
  return result;
}

- (id)systemApplicationBundleIdentifier
{
  return (id)[(FBSSystemService *)self->_fbsSystemService systemApplicationBundleIdentifier];
}

@end
@interface CRUsageInformation
- (BOOL)shouldSuggestCarPlayTips;
- (CRCarKitServiceClient)serviceClient;
- (CRUsageInformation)init;
- (void)setServiceClient:(id)a3;
@end

@implementation CRUsageInformation

- (CRUsageInformation)init
{
  v5.receiver = self;
  v5.super_class = (Class)CRUsageInformation;
  v2 = [(CRUsageInformation *)&v5 init];
  if (v2)
  {
    v3 = objc_alloc_init(CRCarKitServiceClient);
    [(CRUsageInformation *)v2 setServiceClient:v3];
  }
  return v2;
}

- (BOOL)shouldSuggestCarPlayTips
{
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  v3 = CarGeneralLogging();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1ABB00000, v3, OS_LOG_TYPE_DEFAULT, "Checking vehicle storage for CarPlay tips.", buf, 2u);
  }

  v4 = [(CRUsageInformation *)self serviceClient];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __46__CRUsageInformation_shouldSuggestCarPlayTips__block_invoke;
  v6[3] = &unk_1E5E3A9D0;
  v6[4] = &v8;
  [v4 performSynchronousServiceBlock:v6 errorHandler:0];

  LOBYTE(v4) = *((unsigned char *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return (char)v4;
}

uint64_t __46__CRUsageInformation_shouldSuggestCarPlayTips__block_invoke(uint64_t a1, void *a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __46__CRUsageInformation_shouldSuggestCarPlayTips__block_invoke_2;
  v3[3] = &unk_1E5E3A9A8;
  v3[4] = *(void *)(a1 + 32);
  return [a2 hasVehiclesWithReply:v3];
}

void __46__CRUsageInformation_shouldSuggestCarPlayTips__block_invoke_2(uint64_t a1, int a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v4 = CarGeneralLogging();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v5 = @"NO";
    if (a2) {
      objc_super v5 = @"YES";
    }
    int v6 = 138412290;
    v7 = v5;
    _os_log_impl(&dword_1ABB00000, v4, OS_LOG_TYPE_DEFAULT, "CarPlay Tips vehicle storage indicates %@", (uint8_t *)&v6, 0xCu);
  }

  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
}

- (CRCarKitServiceClient)serviceClient
{
  return self->_serviceClient;
}

- (void)setServiceClient:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
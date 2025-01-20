@interface HPSEngravingService
- (BOOL)isEngravingSupported;
- (HPSEngravingService)initWithDevice:(id)a3;
- (void)getEngravedCaseView:(id)a3;
@end

@implementation HPSEngravingService

- (BOOL)isEngravingSupported
{
  v2 = [(BTSDevice *)self->_device classicDevice];
  int v3 = [v2 productId];

  return ((v3 - 8212) < 0x11) & (0x114A1u >> (v3 - 20));
}

- (HPSEngravingService)initWithDevice:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HPSEngravingService;
  v6 = [(HPSEngravingService *)&v12 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_device, a3);
    v8 = [(BTSDevice *)v7->_device classicDevice];
    uint64_t v9 = [v8 address];
    engravingData = v7->_engravingData;
    v7->_engravingData = (NSString *)v9;
  }
  return v7;
}

- (void)getEngravedCaseView:(id)a3
{
  id v4 = a3;
  engravingData = self->_engravingData;
  v6 = [(BTSDevice *)self->_device classicDevice];
  uint64_t v7 = [v6 productId];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __43__HPSEngravingService_getEngravedCaseView___block_invoke;
  v9[3] = &unk_1E6EA86B0;
  id v10 = v4;
  id v8 = v4;
  +[HPSCaseEngravingView getEngravedCaseImage:engravingData productID:v7 completionHandler:v9];
}

void __43__HPSEngravingService_getEngravedCaseView___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __43__HPSEngravingService_getEngravedCaseView___block_invoke_2;
  v5[3] = &unk_1E6EA8688;
  id v6 = v3;
  id v7 = *(id *)(a1 + 32);
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);
}

void __43__HPSEngravingService_getEngravedCaseView___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = [v3 description];
  NSLog(&cfstr_HeadphoneEngra.isa, v2);

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_engravingData, 0);

  objc_storeStrong((id *)&self->_device, 0);
}

@end
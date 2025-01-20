@interface AAInheritanceContactController
- (AAInheritanceContactController)initWithContactInfo:(id)a3 contactType:(int64_t)a4;
- (NSString)accessKeyString;
- (NSString)claimTokenString;
- (id)_accessKeyQRCodeImage;
- (id)accessKeyQRCodeImageDataWithSize:(double)a3;
- (void)removeContactAsBenefactorWithCompletion:(id)a3;
- (void)removeContactAsBeneficiaryWithCompletion:(id)a3;
- (void)sendInvitationWithCompletion:(id)a3;
@end

@implementation AAInheritanceContactController

- (AAInheritanceContactController)initWithContactInfo:(id)a3 contactType:(int64_t)a4
{
  id v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)AAInheritanceContactController;
  v8 = [(AAInheritanceContactController *)&v12 init];
  if (v8)
  {
    v9 = objc_alloc_init(AAInheritanceController);
    inheritanceController = v8->_inheritanceController;
    v8->_inheritanceController = v9;

    objc_storeStrong((id *)&v8->_contactInfo, a3);
    v8->_contactType = a4;
  }

  return v8;
}

- (NSString)claimTokenString
{
  v2 = [(AAInheritanceContactInfo *)self->_contactInfo accessKey];
  v3 = [v2 claimTokenString];

  return (NSString *)v3;
}

- (NSString)accessKeyString
{
  v3 = NSString;
  v4 = [(AAInheritanceContactInfo *)self->_contactInfo accessKey];
  v5 = [v4 claimTokenString];
  v6 = [(AAInheritanceContactInfo *)self->_contactInfo accessKey];
  id v7 = [v6 wrappingKeyString];
  v8 = [v3 stringWithFormat:@"%@-%@", v5, v7];

  return (NSString *)v8;
}

- (id)accessKeyQRCodeImageDataWithSize:(double)a3
{
  memset(&v12, 0, sizeof(v12));
  CGAffineTransformMakeScale(&v12, a3, a3);
  v4 = [(AAInheritanceContactController *)self _accessKeyQRCodeImage];
  CGAffineTransform v11 = v12;
  v5 = [v4 imageByApplyingTransform:&v11];

  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x2050000000;
  v6 = (void *)getCIContextClass_softClass;
  uint64_t v16 = getCIContextClass_softClass;
  if (!getCIContextClass_softClass)
  {
    *(void *)&v11.a = MEMORY[0x1E4F143A8];
    *(void *)&v11.b = 3221225472;
    *(void *)&v11.c = __getCIContextClass_block_invoke;
    *(void *)&v11.d = &unk_1E5A48F98;
    *(void *)&v11.tx = &v13;
    __getCIContextClass_block_invoke((uint64_t)&v11);
    v6 = (void *)v14[3];
  }
  id v7 = v6;
  _Block_object_dispose(&v13, 8);
  v8 = objc_opt_new();
  v9 = [v8 JPEGRepresentationOfImage:v5 colorSpace:CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E4F1DB90]) options:MEMORY[0x1E4F1CC08]];

  return v9;
}

- (id)_accessKeyQRCodeImage
{
  accessKeyQRCodeImage = self->_accessKeyQRCodeImage;
  if (!accessKeyQRCodeImage)
  {
    uint64_t v14 = 0;
    uint64_t v15 = &v14;
    uint64_t v16 = 0x2050000000;
    v4 = (void *)getCIFilterClass_softClass;
    uint64_t v17 = getCIFilterClass_softClass;
    if (!getCIFilterClass_softClass)
    {
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __getCIFilterClass_block_invoke;
      v13[3] = &unk_1E5A48F98;
      v13[4] = &v14;
      __getCIFilterClass_block_invoke((uint64_t)v13);
      v4 = (void *)v15[3];
    }
    id v5 = v4;
    _Block_object_dispose(&v14, 8);
    v6 = [v5 filterWithName:@"CIQRCodeGenerator"];
    id v7 = [(AAInheritanceContactInfo *)self->_contactInfo accessKey];
    v8 = [v7 wrappingKeyString];
    v9 = [v8 dataUsingEncoding:1];

    [v6 setValue:v9 forKey:@"inputMessage"];
    v10 = [v6 outputImage];
    CGAffineTransform v11 = self->_accessKeyQRCodeImage;
    self->_accessKeyQRCodeImage = v10;

    accessKeyQRCodeImage = self->_accessKeyQRCodeImage;
  }

  return accessKeyQRCodeImage;
}

- (void)removeContactAsBeneficiaryWithCompletion:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int64_t contactType = self->_contactType;
  v6 = _AALogSystem();
  id v7 = v6;
  if ((contactType & 4) != 0)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v8 = (objc_class *)objc_opt_class();
      v9 = NSStringFromClass(v8);
      int v10 = 138412290;
      CGAffineTransform v11 = v9;
      _os_log_impl(&dword_1A11D8000, v7, OS_LOG_TYPE_DEFAULT, "%@ : Removing Beneficiary...", (uint8_t *)&v10, 0xCu);
    }
    [(AAInheritanceController *)self->_inheritanceController removeBeneficiary:self->_contactInfo manifest:0 completion:v4];
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[AAInheritanceContactController removeContactAsBeneficiaryWithCompletion:]();
    }
  }
}

- (void)removeContactAsBenefactorWithCompletion:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int64_t contactType = self->_contactType;
  v6 = _AALogSystem();
  id v7 = v6;
  if ((contactType & 8) != 0)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v8 = (objc_class *)objc_opt_class();
      v9 = NSStringFromClass(v8);
      int v10 = 138412290;
      CGAffineTransform v11 = v9;
      _os_log_impl(&dword_1A11D8000, v7, OS_LOG_TYPE_DEFAULT, "%@ : Removing Benefactor...", (uint8_t *)&v10, 0xCu);
    }
    [(AAInheritanceController *)self->_inheritanceController removeBenefactor:self->_contactInfo completion:v4];
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[AAInheritanceContactController removeContactAsBenefactorWithCompletion:]();
    }
  }
}

- (void)sendInvitationWithCompletion:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = _AALogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (objc_class *)objc_opt_class();
    id v7 = NSStringFromClass(v6);
    v8 = [(AAInheritanceContactInfo *)self->_contactInfo handle];
    int v9 = 138412546;
    int v10 = v7;
    __int16 v11 = 2112;
    uint64_t v12 = v8;
    _os_log_impl(&dword_1A11D8000, v5, OS_LOG_TYPE_DEFAULT, "%@ : Sending invitation to %@ ...", (uint8_t *)&v9, 0x16u);
  }
  [(AAInheritanceController *)self->_inheritanceController sendInvitationToContact:self->_contactInfo completion:v4];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessKeyQRCodeImage, 0);
  objc_storeStrong((id *)&self->_contactInfo, 0);

  objc_storeStrong((id *)&self->_inheritanceController, 0);
}

- (void)removeContactAsBeneficiaryWithCompletion:.cold.1()
{
  v0 = (objc_class *)objc_opt_class();
  v1 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_0_2(&dword_1A11D8000, v2, v3, "%@ : The contact is not a beneficiary. Aborting removeBeneficiary call!", v4, v5, v6, v7, 2u);
}

- (void)removeContactAsBenefactorWithCompletion:.cold.1()
{
  v0 = (objc_class *)objc_opt_class();
  v1 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_0_2(&dword_1A11D8000, v2, v3, "%@ : The contact is not a benefactor. Aborting removeBenefactor call!", v4, v5, v6, v7, 2u);
}

@end
@interface CKCodeService
- (CKCodeService)init;
- (CKCodeServiceImplementation)implementation;
- (CKContainer)container;
- (NSString)serviceName;
- (NSURL)serviceInstanceURL;
- (id)CKDescriptionPropertiesWithPublic:(BOOL)a3 private:(BOOL)a4 shouldExpand:(BOOL)a5;
- (id)boxedDatabaseScope;
- (id)description;
- (id)initInternalWithImplementation:(id)a3 container:(id)a4;
- (void)addOperation:(id)a3;
@end

@implementation CKCodeService

- (CKCodeService)init
{
  v6 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, v2, v3);
  objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v6, v7, (uint64_t)a2, (uint64_t)self, @"CKCodeService.m", 120, @"Use -[CKContainer codeServiceWithName:] or -[CKContainer codeServiceWithName:database:] instead of creating your own");

  return 0;
}

- (id)initInternalWithImplementation:(id)a3 container:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CKCodeService;
  v9 = [(CKCodeService *)&v12 init];
  p_isa = (id *)&v9->super.isa;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_implementation, a3);
    objc_storeWeak(p_isa + 1, v8);
  }

  return p_isa;
}

- (id)CKDescriptionPropertiesWithPublic:(BOOL)a3 private:(BOOL)a4 shouldExpand:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  BOOL v7 = a3;
  id v8 = objc_msgSend_implementation(self, a2, a3, a4);
  v10 = objc_msgSend_CKDescriptionPropertiesWithPublic_private_shouldExpand_(v8, v9, v7, v6, v5);

  return v10;
}

- (id)description
{
  return (id)((uint64_t (*)(CKCodeService *, char *))MEMORY[0x1F4181798])(self, sel_CKDescription);
}

- (NSString)serviceName
{
  v4 = objc_msgSend_implementation(self, a2, v2, v3);
  id v8 = objc_msgSend_serviceName(v4, v5, v6, v7);

  return (NSString *)v8;
}

- (NSURL)serviceInstanceURL
{
  v4 = objc_msgSend_implementation(self, a2, v2, v3);
  id v8 = objc_msgSend_serviceInstanceURL(v4, v5, v6, v7);

  return (NSURL *)v8;
}

- (id)boxedDatabaseScope
{
  v4 = objc_msgSend_implementation(self, a2, v2, v3);
  id v8 = objc_msgSend_boxedDatabaseScope(v4, v5, v6, v7);

  return v8;
}

- (void)addOperation:(id)a3
{
  id v4 = a3;
  objc_msgSend_implementation(self, v5, v6, v7);
  id v17 = (id)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend_container(self, v8, v9, v10);
  v15 = objc_msgSend_convenienceConfiguration(v11, v12, v13, v14);
  objc_msgSend_addOperation_wrappingCodeService_convenienceConfiguration_(v17, v16, (uint64_t)v4, (uint64_t)self, v15);
}

- (CKContainer)container
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_container);

  return (CKContainer *)WeakRetained;
}

- (CKCodeServiceImplementation)implementation
{
  return self->_implementation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_implementation, 0);

  objc_destroyWeak((id *)&self->_container);
}

@end
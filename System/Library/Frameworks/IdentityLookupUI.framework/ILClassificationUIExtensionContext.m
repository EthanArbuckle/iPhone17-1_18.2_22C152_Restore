@interface ILClassificationUIExtensionContext
+ (id)_extensionAuxiliaryHostProtocol;
+ (id)_extensionAuxiliaryVendorProtocol;
- (BOOL)isReadyForClassificationResponse;
- (id)remoteObjectProxyWithErrorHandler:(id)a3;
- (void)classificationResponseForRequest:(id)a3 completion:(id)a4;
- (void)prepareForClassificationRequest:(id)a3;
- (void)setReadyForClassificationResponse:(BOOL)readyForClassificationResponse;
@end

@implementation ILClassificationUIExtensionContext

- (void)setReadyForClassificationResponse:(BOOL)readyForClassificationResponse
{
  BOOL v3 = readyForClassificationResponse;
  self->_readyForClassificationResponse = readyForClassificationResponse;
  id v4 = [(ILClassificationUIExtensionContext *)self remoteObjectProxyWithErrorHandler:&__block_literal_global];
  [v4 setReadyForClassificationResponse:v3];
}

void __72__ILClassificationUIExtensionContext_setReadyForClassificationResponse___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  BOOL v3 = ILDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __72__ILClassificationUIExtensionContext_setReadyForClassificationResponse___block_invoke_cold_1((uint64_t)v2, v3);
  }
}

- (void)prepareForClassificationRequest:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = ILDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v13 = v4;
    _os_log_impl(&dword_2375F8000, v5, OS_LOG_TYPE_DEFAULT, "Asked to prepare view controller for classification request %@", buf, 0xCu);
  }

  v6 = [(ILClassificationUIExtensionContext *)self viewController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __70__ILClassificationUIExtensionContext_prepareForClassificationRequest___block_invoke;
    v9[3] = &unk_264CD9928;
    v10 = v4;
    v11 = self;
    dispatch_async(MEMORY[0x263EF83A0], v9);
    v8 = v10;
  }
  else
  {
    v8 = ILDefaultLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[ILClassificationUIExtensionContext prepareForClassificationRequest:](self);
    }
  }
}

void __70__ILClassificationUIExtensionContext_prepareForClassificationRequest___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v2 = ILDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 138412290;
    uint64_t v6 = v3;
    _os_log_impl(&dword_2375F8000, v2, OS_LOG_TYPE_DEFAULT, "Asking extension to prepare for classification request: %@", (uint8_t *)&v5, 0xCu);
  }

  id v4 = [*(id *)(a1 + 40) viewController];
  [v4 prepareForClassificationRequest:*(void *)(a1 + 32)];
}

- (void)classificationResponseForRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(id, uint64_t, void))a4;
  v8 = [(ILClassificationUIExtensionContext *)self viewController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    uint64_t v14 = 0;
    v15 = &v14;
    uint64_t v16 = 0x3032000000;
    v17 = __Block_byref_object_copy_;
    v18 = __Block_byref_object_dispose_;
    id v19 = 0;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __82__ILClassificationUIExtensionContext_classificationResponseForRequest_completion___block_invoke;
    block[3] = &unk_264CD9970;
    id v13 = &v14;
    block[4] = self;
    id v12 = v6;
    dispatch_sync(MEMORY[0x263EF83A0], block);
    v7[2](v7, v15[5], 0);

    _Block_object_dispose(&v14, 8);
  }
  else
  {
    v10 = ILDefaultLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[ILClassificationUIExtensionContext classificationResponseForRequest:completion:](self);
    }
  }
}

void __82__ILClassificationUIExtensionContext_classificationResponseForRequest_completion___block_invoke(uint64_t a1)
{
  id v2 = ILDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl(&dword_2375F8000, v2, OS_LOG_TYPE_DEFAULT, "Asking extension to for classification response...", v7, 2u);
  }

  uint64_t v3 = [*(id *)(a1 + 32) viewController];
  uint64_t v4 = [v3 classificationResponseForRequest:*(void *)(a1 + 40)];
  uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

- (id)remoteObjectProxyWithErrorHandler:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ILClassificationUIExtensionContext *)self _auxiliaryConnection];
  id v6 = [v5 remoteObjectProxyWithErrorHandler:v4];

  return v6;
}

+ (id)_extensionAuxiliaryVendorProtocol
{
  return (id)objc_msgSend(MEMORY[0x263F08D80], "il_classificationUIExtensionVendorInterface");
}

+ (id)_extensionAuxiliaryHostProtocol
{
  return (id)objc_msgSend(MEMORY[0x263F08D80], "il_classificationUIExtensionHostInterface");
}

- (BOOL)isReadyForClassificationResponse
{
  return self->_readyForClassificationResponse;
}

void __72__ILClassificationUIExtensionContext_setReadyForClassificationResponse___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_2375F8000, a2, OS_LOG_TYPE_ERROR, "remoteObjectProxy error: %@", (uint8_t *)&v2, 0xCu);
}

- (void)prepareForClassificationRequest:(void *)a1 .cold.1(void *a1)
{
  v1 = [a1 viewController];
  objc_opt_class();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_2375F8000, v2, v3, "View controller %@ is not of class %@", v4, v5, v6, v7, v8);
}

- (void)classificationResponseForRequest:(void *)a1 completion:.cold.1(void *a1)
{
  v1 = [a1 viewController];
  objc_opt_class();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_2375F8000, v2, v3, "View controller %@ is not of class %@", v4, v5, v6, v7, v8);
}

@end
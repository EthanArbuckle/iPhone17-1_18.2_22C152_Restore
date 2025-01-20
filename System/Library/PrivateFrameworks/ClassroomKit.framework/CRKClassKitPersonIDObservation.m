@interface CRKClassKitPersonIDObservation
- (CRKClassKitDataObserver)dataObserver;
- (CRKClassKitFacade)classKitFacade;
- (CRKClassKitPersonIDObservation)initWithPersonIDs:(id)a3 classKitFacade:(id)a4 block:(id)a5;
- (void)cancel;
- (void)dealloc;
- (void)setDataObserver:(id)a3;
@end

@implementation CRKClassKitPersonIDObservation

- (void)dealloc
{
  [(CRKClassKitPersonIDObservation *)self cancel];
  v3.receiver = self;
  v3.super_class = (Class)CRKClassKitPersonIDObservation;
  [(CRKClassKitPersonIDObservation *)&v3 dealloc];
}

- (CRKClassKitPersonIDObservation)initWithPersonIDs:(id)a3 classKitFacade:(id)a4 block:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)CRKClassKitPersonIDObservation;
  v11 = [(CRKClassKitPersonIDObservation *)&v19 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_classKitFacade, a4);
    uint64_t v13 = [(CRKClassKitFacade *)v12->_classKitFacade personObserverWithPersonIDs:v8 sortDescriptors:0];
    dataObserver = v12->_dataObserver;
    v12->_dataObserver = (CRKClassKitDataObserver *)v13;

    if (v12->_dataObserver)
    {
      v17[0] = MEMORY[0x263EF8330];
      v17[1] = 3221225472;
      v17[2] = __73__CRKClassKitPersonIDObservation_initWithPersonIDs_classKitFacade_block___block_invoke;
      v17[3] = &unk_2646F4170;
      v18 = v10;
      [(CRKClassKitDataObserver *)v12->_dataObserver setDataChanged:v17];
      [(CRKClassKitFacade *)v12->_classKitFacade registerDataObserver:v12->_dataObserver];
      v15 = v18;
    }
    else
    {
      v15 = _CRKLogASM_7();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        -[CRKClassKitPersonIDObservation initWithPersonIDs:classKitFacade:block:](v15);
      }
    }
  }
  return v12;
}

void __73__CRKClassKitPersonIDObservation_initWithPersonIDs_classKitFacade_block___block_invoke(uint64_t a1)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __73__CRKClassKitPersonIDObservation_initWithPersonIDs_classKitFacade_block___block_invoke_2;
  block[3] = &unk_2646F4148;
  id v2 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __73__CRKClassKitPersonIDObservation_initWithPersonIDs_classKitFacade_block___block_invoke_2(uint64_t a1)
{
  id v2 = _CRKLogASM_7();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_224C00000, v2, OS_LOG_TYPE_DEFAULT, "ClassKit person data observer fired", v4, 2u);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)cancel
{
  objc_super v3 = [(CRKClassKitPersonIDObservation *)self dataObserver];

  if (v3)
  {
    id v5 = [(CRKClassKitPersonIDObservation *)self classKitFacade];
    v4 = [(CRKClassKitPersonIDObservation *)self dataObserver];
    [v5 deregisterDataObserver:v4];
  }
}

- (CRKClassKitFacade)classKitFacade
{
  return self->_classKitFacade;
}

- (CRKClassKitDataObserver)dataObserver
{
  return self->_dataObserver;
}

- (void)setDataObserver:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataObserver, 0);

  objc_storeStrong((id *)&self->_classKitFacade, 0);
}

- (void)initWithPersonIDs:(os_log_t)log classKitFacade:block:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_224C00000, log, OS_LOG_TYPE_ERROR, "Person data observer is nil", v1, 2u);
}

@end
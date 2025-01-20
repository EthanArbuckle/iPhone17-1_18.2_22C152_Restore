@interface CRKConcreteStudentConnectionPrimitives
- (void)connectWithCompletion:(id)a3 invalidationHandler:(id)a4;
@end

@implementation CRKConcreteStudentConnectionPrimitives

- (void)connectWithCompletion:(id)a3 invalidationHandler:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __84__CRKConcreteStudentConnectionPrimitives_connectWithCompletion_invalidationHandler___block_invoke;
  v9[3] = &unk_2646F51E8;
  id v10 = v6;
  id v11 = v5;
  id v7 = v5;
  id v8 = v6;
  +[CRKConnectedStudentDaemonProxyFactory makeConnectedStudentDaemonProxyWithCompletion:v9];
}

void __84__CRKConcreteStudentConnectionPrimitives_connectWithCompletion_invalidationHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = +[CRKConcreteStudentConnection connectionWithStudentDaemonProxy:a2 invalidationHandler:*(void *)(a1 + 32)];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

@end
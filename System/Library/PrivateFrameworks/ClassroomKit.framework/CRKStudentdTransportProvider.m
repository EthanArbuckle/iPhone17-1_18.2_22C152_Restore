@interface CRKStudentdTransportProvider
- (void)fetchTransportWithCompletion:(id)a3;
@end

@implementation CRKStudentdTransportProvider

- (void)fetchTransportWithCompletion:(id)a3
{
  v3 = (void *)MEMORY[0x263F08D68];
  v4 = (void (**)(id, void *, void))a3;
  objc_msgSend(v3, "crk_studentDaemonConnection");
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  v5 = (void *)[objc_alloc(MEMORY[0x263F39CE8]) initWithXPCConnection:v6];
  v4[2](v4, v5, 0);
}

@end
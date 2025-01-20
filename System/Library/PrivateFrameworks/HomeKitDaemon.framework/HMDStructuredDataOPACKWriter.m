@interface HMDStructuredDataOPACKWriter
- (void)emitRootValue:(id)a3;
@end

@implementation HMDStructuredDataOPACKWriter

- (void).cxx_destruct
{
}

- (void)emitRootValue:(id)a3
{
  int v4 = OPACKEncodeObject();
  if (v4)
  {
    id v5 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:v4 userInfo:0];
    [(HMDStructuredDataFoundationWriter *)self failWithError:v5];
  }
}

@end
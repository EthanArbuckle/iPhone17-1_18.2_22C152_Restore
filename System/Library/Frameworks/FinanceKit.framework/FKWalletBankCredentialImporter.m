@interface FKWalletBankCredentialImporter
- (FKWalletBankCredentialImporter)init;
- (_FKWalletBankCredentialImporter)wrappedImporter;
- (void)insertBankCredentialFromBankInformation:(id)a3 completion:(id)a4;
- (void)setWrappedImporter:(id)a3;
@end

@implementation FKWalletBankCredentialImporter

- (FKWalletBankCredentialImporter)init
{
  v6.receiver = self;
  v6.super_class = (Class)FKWalletBankCredentialImporter;
  v2 = [(FKWalletBankCredentialImporter *)&v6 init];
  if (v2)
  {
    uint64_t v3 = +[_FKWalletBankCredentialImporter makeImporter];
    wrappedImporter = v2->_wrappedImporter;
    v2->_wrappedImporter = (_FKWalletBankCredentialImporter *)v3;
  }
  return v2;
}

- (void)insertBankCredentialFromBankInformation:(id)a3 completion:(id)a4
{
  id v6 = a4;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __85__FKWalletBankCredentialImporter_insertBankCredentialFromBankInformation_completion___block_invoke;
  aBlock[3] = &unk_265180270;
  id v11 = v6;
  id v7 = v6;
  id v8 = a3;
  v9 = _Block_copy(aBlock);
  [(_FKWalletBankCredentialImporter *)self->_wrappedImporter insertCredentialFrom:v8 completionHandler:v9];
}

uint64_t __85__FKWalletBankCredentialImporter_insertBankCredentialFromBankInformation_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (_FKWalletBankCredentialImporter)wrappedImporter
{
  return self->_wrappedImporter;
}

- (void)setWrappedImporter:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
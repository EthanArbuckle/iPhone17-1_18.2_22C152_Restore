@interface ASClientController
- (ASClientController)initWithClientIdentifier:(id)a3;
- (ASClientController)initWithClientInterface:(id)a3;
- (BOOL)libraryContainsItemIdentifier:(unint64_t)a3;
- (BOOL)shouldExitAfterPurchases;
- (id)purchaseManager:(id)a3 purchaseBatchForItems:(id)a4;
- (id)purchaseManager:(id)a3 purchaseBatchForPurchases:(id)a4;
- (void)setShouldExitAfterPurchases:(BOOL)a3;
@end

@implementation ASClientController

- (ASClientController)initWithClientIdentifier:(id)a3
{
  id v5 = objc_alloc_init(MEMORY[0x263F895E0]);
  [v5 setClientIdentifier:a3];
  v6 = objc_alloc_init(ASViewControllerFactory);
  [v5 setViewControllerFactory:v6];

  v7 = [(ASClientController *)self initWithClientInterface:v5];
  return v7;
}

- (ASClientController)initWithClientInterface:(id)a3
{
  values[1] = *(void **)MEMORY[0x263EF8340];
  v6.receiver = self;
  v6.super_class = (Class)ASClientController;
  v3 = [(SUClientController *)&v6 initWithClientInterface:a3];
  if (v3)
  {
    values[0] = (void *)9;
    CFArrayRef v4 = CFArrayCreate(0, (const void **)values, 1, 0);
    [(SUClientController *)v3 setOfferedAssetTypes:v4];
    CFRelease(v4);
  }
  return v3;
}

- (BOOL)libraryContainsItemIdentifier:(unint64_t)a3
{
  id v5 = (void *)[MEMORY[0x263F89518] loadedMap];
  if (objc_msgSend(v5, "applicationForItemIdentifier:", objc_msgSend(NSNumber, "numberWithItemIdentifier:", a3)))
  {
    return 1;
  }
  v7.receiver = self;
  v7.super_class = (Class)ASClientController;
  return [(SUClientController *)&v7 libraryContainsItemIdentifier:a3];
}

- (id)purchaseManager:(id)a3 purchaseBatchForItems:(id)a4
{
  CFArrayRef v4 = [(SUPurchaseBatch *)[ASPurchaseBatch alloc] initWithItems:a4];
  return v4;
}

- (id)purchaseManager:(id)a3 purchaseBatchForPurchases:(id)a4
{
  id v5 = objc_alloc_init(ASPurchaseBatch);
  [(SUPurchaseBatch *)v5 setPurchasesAndContinuationsFromPurchases:a4];
  return v5;
}

- (BOOL)shouldExitAfterPurchases
{
  return self->_shouldExitAfterPurchases;
}

- (void)setShouldExitAfterPurchases:(BOOL)a3
{
  self->_shouldExitAfterPurchases = a3;
}

@end
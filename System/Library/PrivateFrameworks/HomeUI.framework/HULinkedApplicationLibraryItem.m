@interface HULinkedApplicationLibraryItem
- (HULinkedApplicationLibraryItem)init;
- (HULinkedApplicationLibraryItem)initWithApplicationProxy:(id)a3;
- (HULinkedApplicationLibraryItem)initWithApplicationProxy:(id)a3 associatedAccessories:(id)a4;
- (LSApplicationProxy)applicationProxy;
- (id)_subclass_updateWithOptions:(id)a3;
- (id)bundleIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
@end

@implementation HULinkedApplicationLibraryItem

- (HULinkedApplicationLibraryItem)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  v5 = NSStringFromSelector(sel_initWithApplicationProxy_);
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HULinkedApplicationItem.m", 133, @"%s is unavailable; use %@ instead",
    "-[HULinkedApplicationLibraryItem init]",
    v5);

  return 0;
}

- (HULinkedApplicationLibraryItem)initWithApplicationProxy:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HULinkedApplicationLibraryItem;
  v6 = [(HULinkedApplicationItem *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_applicationProxy, a3);
  }

  return v7;
}

- (HULinkedApplicationLibraryItem)initWithApplicationProxy:(id)a3 associatedAccessories:(id)a4
{
  id v6 = a4;
  v7 = [(HULinkedApplicationLibraryItem *)self initWithApplicationProxy:a3];
  v8 = v7;
  if (v7) {
    [(HULinkedApplicationItem *)v7 setAssociatedAccessories:v6];
  }

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  id v5 = [(HULinkedApplicationLibraryItem *)self applicationProxy];
  id v6 = [(HULinkedApplicationItem *)self associatedAccessories];
  v7 = (void *)[v4 initWithApplicationProxy:v5 associatedAccessories:v6];

  [v7 copyLatestResultsFromItem:self];
  return v7;
}

- (id)bundleIdentifier
{
  v2 = [(HULinkedApplicationLibraryItem *)self applicationProxy];
  v3 = [v2 bundleIdentifier];

  return v3;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)HULinkedApplicationLibraryItem;
  id v4 = [(HULinkedApplicationItem *)&v8 _subclass_updateWithOptions:a3];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __62__HULinkedApplicationLibraryItem__subclass_updateWithOptions___block_invoke;
  v7[3] = &unk_1E6389290;
  v7[4] = self;
  id v5 = [v4 flatMap:v7];

  return v5;
}

id __62__HULinkedApplicationLibraryItem__subclass_updateWithOptions___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [MEMORY[0x1E4F42D90] mainScreen];
  [v4 scale];
  uint64_t v6 = v5;

  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __62__HULinkedApplicationLibraryItem__subclass_updateWithOptions___block_invoke_2;
  v16[3] = &unk_1E638A2F8;
  v16[4] = *(void *)(a1 + 32);
  v16[5] = v6;
  v7 = [MEMORY[0x1E4F7A0D8] futureWithBlock:v16];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __62__HULinkedApplicationLibraryItem__subclass_updateWithOptions___block_invoke_4;
  v12[3] = &unk_1E638E4D0;
  uint64_t v8 = *(void *)(a1 + 32);
  id v13 = v3;
  uint64_t v14 = v8;
  uint64_t v15 = v6;
  id v9 = v3;
  v10 = [v7 flatMap:v12];

  return v10;
}

void __62__HULinkedApplicationLibraryItem__subclass_updateWithOptions___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_alloc(MEMORY[0x1E4F6F248]);
  uint64_t v5 = [*(id *)(a1 + 32) applicationProxy];
  uint64_t v6 = (void *)[v4 initWithResourceProxy:v5];

  v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F6F258]), "initWithSize:scale:", 60.0, 60.0, *(double *)(a1 + 40));
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __62__HULinkedApplicationLibraryItem__subclass_updateWithOptions___block_invoke_3;
  v9[3] = &unk_1E638E4A8;
  id v10 = v3;
  id v8 = v3;
  [v6 getImageForImageDescriptor:v7 completion:v9];
}

uint64_t __62__HULinkedApplicationLibraryItem__subclass_updateWithOptions___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) finishWithResult:a2];
}

id __62__HULinkedApplicationLibraryItem__subclass_updateWithOptions___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  uint64_t v5 = (void *)[v3 mutableCopy];
  uint64_t v6 = [*(id *)(a1 + 40) applicationProxy];
  v7 = [v6 localizedName];

  id v8 = [*(id *)(a1 + 40) applicationProxy];
  id v9 = [v8 vendorName];

  id v10 = [*(id *)(a1 + 40) applicationProxy];
  uint64_t v11 = objc_msgSend(v10, "hf_isInstalledForLaunching");

  v12 = (void *)MEMORY[0x1E4F42A80];
  uint64_t v13 = [v4 CGImage];

  uint64_t v14 = [v12 imageWithCGImage:v13 scale:0 orientation:*(double *)(a1 + 48)];
  uint64_t v15 = *(void **)(a1 + 40);
  if (v7 && v14)
  {
    v16 = [v15 bundleIdentifier];
    [v5 setObject:v16 forKeyedSubscript:@"HFResultApplicationBundleIdentifier"];

    [v5 setObject:v7 forKeyedSubscript:*MEMORY[0x1E4F68AB8]];
    [v5 setObject:v9 forKeyedSubscript:@"HFResultApplicationPublisher"];
    v17 = [NSNumber numberWithBool:v11];
    [v5 setObject:v17 forKeyedSubscript:@"HFResultApplicationIsInstalled"];

    [v5 setObject:v14 forKeyedSubscript:*MEMORY[0x1E4F689F8]];
    uint64_t v18 = [MEMORY[0x1E4F7A0D8] futureWithResult:v5];
  }
  else
  {
    uint64_t v18 = [v15 _failedUpdateOutcome];
  }
  v19 = (void *)v18;

  return v19;
}

- (LSApplicationProxy)applicationProxy
{
  return self->_applicationProxy;
}

- (void).cxx_destruct
{
}

@end
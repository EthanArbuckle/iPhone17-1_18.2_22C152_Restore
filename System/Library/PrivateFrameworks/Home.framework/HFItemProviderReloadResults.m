@interface HFItemProviderReloadResults
- (HFItemProviderReloadResults)init;
- (HFItemProviderReloadResults)initWithAddedItems:(id)a3 removedItems:(id)a4 existingItems:(id)a5;
- (NSSet)addedItems;
- (NSSet)allItems;
- (NSSet)existingItems;
- (NSSet)removedItems;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)resultsByMergingWithResults:(id)a3;
- (void)setAddedItems:(id)a3;
- (void)setExistingItems:(id)a3;
- (void)setRemovedItems:(id)a3;
@end

@implementation HFItemProviderReloadResults

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_existingItems, 0);
  objc_storeStrong((id *)&self->_removedItems, 0);
  objc_storeStrong((id *)&self->_addedItems, 0);
}

- (void)setAddedItems:(id)a3
{
}

- (NSSet)allItems
{
  v3 = [(HFItemProviderReloadResults *)self existingItems];
  v4 = [(HFItemProviderReloadResults *)self addedItems];
  v5 = [v3 setByAddingObjectsFromSet:v4];

  return (NSSet *)v5;
}

- (NSSet)addedItems
{
  return self->_addedItems;
}

- (NSSet)removedItems
{
  return self->_removedItems;
}

- (NSSet)existingItems
{
  return self->_existingItems;
}

- (HFItemProviderReloadResults)initWithAddedItems:(id)a3 removedItems:(id)a4 existingItems:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)HFItemProviderReloadResults;
  v11 = [(HFItemProviderReloadResults *)&v19 init];
  if (v11)
  {
    if (v8)
    {
      v12 = (NSSet *)v8;
    }
    else
    {
      v12 = [MEMORY[0x263EFFA08] set];
    }
    addedItems = v11->_addedItems;
    v11->_addedItems = v12;

    if (v9)
    {
      v14 = (NSSet *)v9;
    }
    else
    {
      v14 = [MEMORY[0x263EFFA08] set];
    }
    removedItems = v11->_removedItems;
    v11->_removedItems = v14;

    if (v10)
    {
      v16 = (NSSet *)v10;
    }
    else
    {
      v16 = [MEMORY[0x263EFFA08] set];
    }
    existingItems = v11->_existingItems;
    v11->_existingItems = v16;
  }
  return v11;
}

- (HFItemProviderReloadResults)init
{
  v4 = [MEMORY[0x263F08690] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"HFItemProvider.m" lineNumber:46 description:@"HFItemProviderReloadResults should only be instantiated by subclasses of HFItemProvider"];

  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  v5 = [(HFItemProviderReloadResults *)self addedItems];
  v6 = [(HFItemProviderReloadResults *)self removedItems];
  v7 = [(HFItemProviderReloadResults *)self existingItems];
  id v8 = (void *)[v4 initWithAddedItems:v5 removedItems:v6 existingItems:v7];

  return v8;
}

- (id)resultsByMergingWithResults:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)objc_opt_class());
  v6 = [(HFItemProviderReloadResults *)self addedItems];
  v7 = [v4 addedItems];
  id v8 = [v6 setByAddingObjectsFromSet:v7];
  id v9 = [(HFItemProviderReloadResults *)self removedItems];
  id v10 = [v4 removedItems];
  v11 = [v9 setByAddingObjectsFromSet:v10];
  v12 = [(HFItemProviderReloadResults *)self existingItems];
  v13 = [v4 existingItems];

  v14 = [v12 setByAddingObjectsFromSet:v13];
  v15 = (void *)[v5 initWithAddedItems:v8 removedItems:v11 existingItems:v14];

  return v15;
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  v6 = [(HFItemProviderReloadResults *)self addedItems];
  v7 = [(HFItemProviderReloadResults *)self removedItems];
  id v8 = [(HFItemProviderReloadResults *)self existingItems];
  id v9 = [v3 stringWithFormat:@"<%@: %p, Added: %@ Removed: %@ Existing:%@>", v5, self, v6, v7, v8];

  return v9;
}

- (void)setRemovedItems:(id)a3
{
}

- (void)setExistingItems:(id)a3
{
}

@end
@interface MPCStoreLibraryPersonalizationMiddleware
- (MPSectionedCollection)personalizedModelObjects;
- (NSArray)invalidationObservers;
- (id)operationsForPlayerRequest:(id)a3;
- (id)operationsForRequest:(id)a3;
- (id)playerModelObject:(id)a3 propertySet:(id)a4 atIndexPath:(id)a5 chain:(id)a6;
- (void)setInvalidationObservers:(id)a3;
- (void)setPersonalizedModelObjects:(id)a3;
@end

@implementation MPCStoreLibraryPersonalizationMiddleware

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_personalizedModelObjects, 0);

  objc_storeStrong((id *)&self->_invalidationObservers, 0);
}

- (id)operationsForRequest:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = [(MPCStoreLibraryPersonalizationMiddleware *)self operationsForPlayerRequest:v4];
  }
  else
  {
    v5 = (void *)MEMORY[0x263EFFA68];
  }

  return v5;
}

- (id)operationsForPlayerRequest:(id)a3
{
  v8[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [[MPCStoreLibraryPersonalizationMiddlewareOperation alloc] initWithMiddleware:self playerRequest:v4];

  v8[0] = v5;
  v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:1];

  return v6;
}

- (id)playerModelObject:(id)a3 propertySet:(id)a4 atIndexPath:(id)a5 chain:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  id v13 = a4;
  if ([v11 length] == 1)
  {
    v14 = -[MPSectionedCollection sectionAtIndex:](self->_personalizedModelObjects, "sectionAtIndex:", [v11 section]);
    goto LABEL_5;
  }
  if ([v11 length] == 2)
  {
    v14 = [(MPSectionedCollection *)self->_personalizedModelObjects itemAtIndexPath:v11];
LABEL_5:
    id v15 = v14;
    if ([v14 type])
    {
      if (v15) {
        goto LABEL_12;
      }
      goto LABEL_11;
    }
    goto LABEL_10;
  }
  if (![0 type])
  {
    id v15 = 0;
LABEL_10:
  }
LABEL_11:
  id v15 = v10;
LABEL_12:
  v16 = [v12 nextObject];
  v17 = [v16 playerModelObject:v15 propertySet:v13 atIndexPath:v11 chain:v12];

  return v17;
}

- (void)setPersonalizedModelObjects:(id)a3
{
}

- (MPSectionedCollection)personalizedModelObjects
{
  return self->_personalizedModelObjects;
}

- (void)setInvalidationObservers:(id)a3
{
}

- (NSArray)invalidationObservers
{
  return self->_invalidationObservers;
}

@end
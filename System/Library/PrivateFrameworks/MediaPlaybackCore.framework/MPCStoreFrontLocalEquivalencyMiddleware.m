@interface MPCStoreFrontLocalEquivalencyMiddleware
- (MPModelGenericObject)overridePlayingItem;
- (NSArray)invalidationObservers;
- (NSIndexPath)playingItemIndexPath;
- (id)_stateDumpObject;
- (id)operationsForPlayerRequest:(id)a3;
- (id)operationsForRequest:(id)a3;
- (id)playerModelObject:(id)a3 propertySet:(id)a4 atIndexPath:(id)a5 chain:(id)a6;
- (void)setInvalidationObservers:(id)a3;
- (void)setOverridePlayingItem:(id)a3;
- (void)setPlayingItemIndexPath:(id)a3;
@end

@implementation MPCStoreFrontLocalEquivalencyMiddleware

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playingItemIndexPath, 0);
  objc_storeStrong((id *)&self->_overridePlayingItem, 0);

  objc_storeStrong((id *)&self->_invalidationObservers, 0);
}

- (void)setPlayingItemIndexPath:(id)a3
{
}

- (NSIndexPath)playingItemIndexPath
{
  return self->_playingItemIndexPath;
}

- (void)setOverridePlayingItem:(id)a3
{
}

- (MPModelGenericObject)overridePlayingItem
{
  return self->_overridePlayingItem;
}

- (void)setInvalidationObservers:(id)a3
{
}

- (NSArray)invalidationObservers
{
  return self->_invalidationObservers;
}

- (id)_stateDumpObject
{
  v13[3] = *MEMORY[0x263EF8340];
  v12[0] = @"_obj";
  v3 = [NSString stringWithFormat:@"<%@:%p>", objc_opt_class(), self];
  v13[0] = v3;
  v12[1] = @"overridePlayingItem";
  uint64_t v4 = [(MPCStoreFrontLocalEquivalencyMiddleware *)self overridePlayingItem];
  v5 = (void *)v4;
  if (v4) {
    v6 = (__CFString *)v4;
  }
  else {
    v6 = @"<NULL>";
  }
  v13[1] = v6;
  v12[2] = @"invalidationObservers";
  uint64_t v7 = [(MPCStoreFrontLocalEquivalencyMiddleware *)self invalidationObservers];
  v8 = (void *)v7;
  if (v7) {
    v9 = (__CFString *)v7;
  }
  else {
    v9 = @"<NULL>";
  }
  v13[2] = v9;
  v10 = [NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:3];

  return v10;
}

- (id)operationsForPlayerRequest:(id)a3
{
  v8[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [[MPCStoreFrontLocalEquivalencyMiddlewareOperation alloc] initWithMiddleware:self playerRequest:v4];

  v8[0] = v5;
  v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:1];

  return v6;
}

- (id)operationsForRequest:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = [(MPCStoreFrontLocalEquivalencyMiddleware *)self operationsForPlayerRequest:v4];
  }
  else
  {
    v5 = (void *)MEMORY[0x263EFFA68];
  }

  return v5;
}

- (id)playerModelObject:(id)a3 propertySet:(id)a4 atIndexPath:(id)a5 chain:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = (MPModelGenericObject *)v10;
  v15 = v14;
  if (self->_playingItemIndexPath)
  {
    v15 = v14;
    if (objc_msgSend(v12, "isEqual:"))
    {
      v15 = self->_overridePlayingItem;
    }
  }
  v16 = [v13 nextObject];
  v17 = [v16 playerModelObject:v15 propertySet:v11 atIndexPath:v12 chain:v13];

  return v17;
}

@end
@interface MPCMusicFavoritingMiddleware
- (ICMusicSubscriptionStatus)requestingUserSubscriptionStatus;
- (NSArray)invalidationObservers;
- (id)_stateDumpObject;
- (id)operationsForPlayerRequest:(id)a3;
- (id)operationsForRequest:(id)a3;
- (id)requestingUserSubscriptionStatus:(id)a3 chain:(id)a4;
- (void)setInvalidationObservers:(id)a3;
- (void)setRequestingUserSubscriptionStatus:(id)a3;
@end

@implementation MPCMusicFavoritingMiddleware

- (void)setInvalidationObservers:(id)a3
{
}

- (id)requestingUserSubscriptionStatus:(id)a3 chain:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [v6 nextObject];
  uint64_t v9 = [(MPCMusicFavoritingMiddleware *)self requestingUserSubscriptionStatus];
  v10 = (void *)v9;
  if (v9) {
    id v11 = (id)v9;
  }
  else {
    id v11 = v7;
  }
  v12 = [v8 requestingUserSubscriptionStatus:v11 chain:v6];

  return v12;
}

- (ICMusicSubscriptionStatus)requestingUserSubscriptionStatus
{
  return self->_requestingUserSubscriptionStatus;
}

- (void)setRequestingUserSubscriptionStatus:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestingUserSubscriptionStatus, 0);

  objc_storeStrong((id *)&self->_invalidationObservers, 0);
}

- (id)operationsForRequest:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = [(MPCMusicFavoritingMiddleware *)self operationsForPlayerRequest:v4];
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
  v5 = [[MPCMusicFavoritingMiddlewareOperation alloc] initWithMiddleware:self playerRequest:v4];

  v8[0] = v5;
  id v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:1];

  return v6;
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
  v12[1] = @"requestingUserSubscriptionStatus";
  uint64_t v4 = [(MPCMusicFavoritingMiddleware *)self requestingUserSubscriptionStatus];
  v5 = (void *)v4;
  if (v4) {
    id v6 = (__CFString *)v4;
  }
  else {
    id v6 = @"<NULL>";
  }
  v13[1] = v6;
  v12[2] = @"invalidationObservers";
  uint64_t v7 = [(MPCMusicFavoritingMiddleware *)self invalidationObservers];
  v8 = (void *)v7;
  if (v7) {
    uint64_t v9 = (__CFString *)v7;
  }
  else {
    uint64_t v9 = @"<NULL>";
  }
  v13[2] = v9;
  v10 = [NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:3];

  return v10;
}

@end
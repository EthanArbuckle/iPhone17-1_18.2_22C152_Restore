@interface ASFApplicationSupplier
- (id)applicationForBundleId:(id)a3;
@end

@implementation ASFApplicationSupplier

- (id)applicationForBundleId:(id)a3
{
  id v3 = a3;
  v4 = (void *)[objc_alloc(MEMORY[0x263F01878]) initWithBundleIdentifier:v3 allowPlaceholder:0 error:0];
  if (v4)
  {
    v5 = [ASFApplication alloc];
    v6 = [v4 localizedName];
    v7 = [(ASFApplication *)v5 initWithBundleId:v3 localizedName:v6];
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

@end
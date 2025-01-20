@interface DDCallKitAction
- (TUCallProvider)callProvider;
- (id)dialRequest;
- (id)localizedName;
- (id)subtitle;
- (int64_t)TTYType;
- (void)setCallProvider:(id)a3;
@end

@implementation DDCallKitAction

- (int64_t)TTYType
{
  return 1;
}

- (id)localizedName
{
  v2 = [(DDCallKitAction *)self callProvider];
  v3 = [v2 localizedName];

  return v3;
}

- (id)subtitle
{
  return 0;
}

- (id)dialRequest
{
  v3 = [(DDCallKitAction *)self callProvider];
  v4 = [(DDCallAction *)self dialRequestWithProvider:v3];

  return v4;
}

- (TUCallProvider)callProvider
{
  return (TUCallProvider *)objc_getProperty(self, a2, 168, 1);
}

- (void)setCallProvider:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
@interface CBClient
+ (BOOL)supportsAdaptation;
+ (BOOL)supportsBlueLightReduction;
- (CBAdaptationClient)adaptationClient;
- (CBBlueLightClient)blueLightClient;
- (CBClient)init;
- (void)dealloc;
@end

@implementation CBClient

- (CBAdaptationClient)adaptationClient
{
  return self->_adaptationClient;
}

+ (BOOL)supportsBlueLightReduction
{
  return +[CBBlueLightClient supportsBlueLightReduction];
}

+ (BOOL)supportsAdaptation
{
  return +[CBAdaptationClient supportsAdaptation];
}

- (CBClient)init
{
  v10 = self;
  SEL v9 = a2;
  v8.receiver = self;
  v8.super_class = (Class)CBClient;
  v10 = [(CBClient *)&v8 init];
  if (!v10) {
    return v10;
  }
  v2 = objc_alloc_init(BrightnessSystemClient);
  v10->bsc = v2;
  if (v10->bsc)
  {
    v3 = [CBBlueLightClient alloc];
    uint64_t v4 = [(CBBlueLightClient *)v3 initWithClientObj:v10->bsc];
    v10->_blueLightClient = (CBBlueLightClient *)v4;
    v5 = [CBAdaptationClient alloc];
    uint64_t v6 = [(CBAdaptationClient *)v5 initWithClientObj:v10->bsc];
    v10->_adaptationClient = (CBAdaptationClient *)v6;
    return v10;
  }
  return 0;
}

- (void)dealloc
{
  uint64_t v4 = self;
  SEL v3 = a2;
  if (self->_blueLightClient) {

  }
  if (v4->_adaptationClient) {
  if (v4->bsc)
  }
  {
    -[BrightnessSystemClient registerNotificationBlock:forProperties:](v4->bsc, "registerNotificationBlock:forProperties:", 0);
  }
  v2.receiver = v4;
  v2.super_class = (Class)CBClient;
  [(CBClient *)&v2 dealloc];
}

- (CBBlueLightClient)blueLightClient
{
  return self->_blueLightClient;
}

@end
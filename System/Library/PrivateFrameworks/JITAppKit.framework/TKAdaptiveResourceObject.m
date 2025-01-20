@interface TKAdaptiveResourceObject
- (TKAdaptiveResourceObject)init;
- (void)dealloc;
- (void)tmlDispose;
@end

@implementation TKAdaptiveResourceObject

- (TKAdaptiveResourceObject)init
{
  SEL v5 = a2;
  v6 = 0;
  v4.receiver = self;
  v4.super_class = (Class)TKAdaptiveResourceObject;
  v6 = [(TKAdaptiveResourceObject *)&v4 init];
  objc_storeStrong((id *)&v6, v6);
  if (v6) {
    +[TKAdaptiveResourceManager addObject:v6];
  }
  v3 = v6;
  objc_storeStrong((id *)&v6, 0);
  return v3;
}

- (void)dealloc
{
  objc_super v4 = self;
  SEL v3 = a2;
  +[TKAdaptiveResourceManager removeObject:self];
  v2.receiver = v4;
  v2.super_class = (Class)TKAdaptiveResourceObject;
  [(TKAdaptiveResourceObject *)&v2 dealloc];
}

- (void)tmlDispose
{
  objc_super v4 = self;
  SEL v3 = a2;
  +[TKAdaptiveResourceManager removeObject:self];
  v2.receiver = v4;
  v2.super_class = (Class)TKAdaptiveResourceObject;
  [(TKAdaptiveResourceObject *)&v2 tmlDispose];
}

@end
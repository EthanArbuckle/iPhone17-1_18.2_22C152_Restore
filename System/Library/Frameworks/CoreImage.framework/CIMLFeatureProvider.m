@interface CIMLFeatureProvider
- (CIMLFeatureProvider)init;
- (NSMutableDictionary)contents;
- (NSSet)featureNames;
- (id)featureValueForName:(id)a3;
- (void)addOject:(id)a3 forName:(id)a4;
- (void)dealloc;
- (void)setContents:(id)a3;
@end

@implementation CIMLFeatureProvider

- (CIMLFeatureProvider)init
{
  v4.receiver = self;
  v4.super_class = (Class)CIMLFeatureProvider;
  v2 = [(CIMLFeatureProvider *)&v4 init];
  if (v2) {
    -[CIMLFeatureProvider setContents:](v2, "setContents:", [MEMORY[0x1E4F1CA60] dictionary]);
  }
  return v2;
}

- (NSSet)featureNames
{
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v3 = [(NSMutableDictionary *)self->contents allKeys];

  return (NSSet *)[v2 setWithArray:v3];
}

- (void)addOject:(id)a3 forName:(id)a4
{
  v6 = [(CIMLFeatureProvider *)self contents];

  [(NSMutableDictionary *)v6 setObject:a3 forKey:a4];
}

- (id)featureValueForName:(id)a3
{
  uint64_t v3 = (const void *)[(NSMutableDictionary *)[(CIMLFeatureProvider *)self contents] objectForKey:a3];
  getMLMultiArrayClass();
  if (objc_opt_isKindOfClass())
  {
    MLFeatureValueClass = (void *)getMLFeatureValueClass();
    return (id)[MLFeatureValueClass featureValueWithMultiArray:v3];
  }
  else
  {
    CFTypeID v6 = CFGetTypeID(v3);
    if (v6 == CVPixelBufferGetTypeID())
    {
      v7 = (void *)getMLFeatureValueClass();
      return (id)[v7 featureValueWithPixelBuffer:v3];
    }
    else
    {
      return 0;
    }
  }
}

- (void)dealloc
{
  [(CIMLFeatureProvider *)self setContents:0];
  v3.receiver = self;
  v3.super_class = (Class)CIMLFeatureProvider;
  [(CIMLFeatureProvider *)&v3 dealloc];
}

- (NSMutableDictionary)contents
{
  return self->contents;
}

- (void)setContents:(id)a3
{
}

@end
@interface CPLPrequeliteSynthesizedVariable
+ (void)initialize;
- (id)valueWithConstructor:(id)a3;
- (void)setValue:(id)a3;
@end

@implementation CPLPrequeliteSynthesizedVariable

+ (void)initialize
{
  id v2 = objc_alloc_init((Class)NSObject);
  uint64_t v3 = qword_1002DC040;
  qword_1002DC040 = (uint64_t)v2;
  _objc_release_x1(v2, v3);
}

- (id)valueWithConstructor:(id)a3
{
  v4 = (void (**)(void))a3;
  if ([(CPLPrequeliteVariable *)self hasCachedValueForIdentifier:qword_1002DC040])
  {
    v5 = [(CPLPrequeliteVariable *)self cachedValueForIdentifier:qword_1002DC040];
  }
  else
  {
    v5 = v4[2](v4);
    [(CPLPrequeliteVariable *)self setCachedValue:v5 forIdentifier:qword_1002DC040];
  }

  return v5;
}

- (void)setValue:(id)a3
{
}

@end
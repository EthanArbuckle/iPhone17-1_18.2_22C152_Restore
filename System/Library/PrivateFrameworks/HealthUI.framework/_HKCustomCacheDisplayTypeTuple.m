@interface _HKCustomCacheDisplayTypeTuple
- (HKChartCache)chartCache;
- (HKDisplayType)displayType;
- (_HKCustomCacheDisplayTypeTuple)initWithCustomCache:(id)a3 displayType:(id)a4;
@end

@implementation _HKCustomCacheDisplayTypeTuple

- (_HKCustomCacheDisplayTypeTuple)initWithCustomCache:(id)a3 displayType:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_HKCustomCacheDisplayTypeTuple;
  v9 = [(_HKCustomCacheDisplayTypeTuple *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_chartCache, a3);
    objc_storeStrong((id *)&v10->_displayType, a4);
  }

  return v10;
}

- (HKChartCache)chartCache
{
  return self->_chartCache;
}

- (HKDisplayType)displayType
{
  return self->_displayType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayType, 0);
  objc_storeStrong((id *)&self->_chartCache, 0);
}

@end
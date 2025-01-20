@interface HSItemDataRequest
+ (id)requestWithDatabaseID:(unsigned int)a3 itemID:(unint64_t)a4 format:(id)a5;
- (HSItemDataRequest)initWithDatabaseID:(unsigned int)a3 itemID:(unint64_t)a4 format:(id)a5;
@end

@implementation HSItemDataRequest

+ (id)requestWithDatabaseID:(unsigned int)a3 itemID:(unint64_t)a4 format:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  id v8 = a5;
  v9 = (void *)[objc_alloc((Class)a1) initWithDatabaseID:v6 itemID:a4 format:v8];

  return v9;
}

- (HSItemDataRequest)initWithDatabaseID:(unsigned int)a3 itemID:(unint64_t)a4 format:(id)a5
{
  uint64_t v6 = [NSString stringWithFormat:@"databases/%u/items/%llu.%@", *(void *)&a3, a4, a5];
  v7 = [(HSRequest *)self initWithAction:v6];

  return v7;
}

@end
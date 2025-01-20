@interface HSSetPropertyRequest
+ (id)requestWithDatabaseID:(unsigned int)a3 itemID:(unint64_t)a4;
- (HSSetPropertyRequest)initWithDatabaseID:(unsigned int)a3 itemID:(unint64_t)a4;
@end

@implementation HSSetPropertyRequest

- (HSSetPropertyRequest)initWithDatabaseID:(unsigned int)a3 itemID:(unint64_t)a4
{
  uint64_t v5 = *(void *)&a3;
  v11.receiver = self;
  v11.super_class = (Class)HSSetPropertyRequest;
  v6 = [(HSRequest *)&v11 initWithAction:@"setproperty"];
  v7 = v6;
  if (v6)
  {
    [(HSRequest *)v6 setMethod:1];
    v8 = objc_msgSend(NSString, "stringWithFormat:", @"'dmap.itemid:%u'", v5);
    [(HSRequest *)v7 setValue:v8 forArgument:@"database-spec"];

    v9 = objc_msgSend(NSString, "stringWithFormat:", @"'dmap.itemid:%llu'", a4);
    [(HSRequest *)v7 setValue:v9 forArgument:@"item-spec"];
  }
  return v7;
}

+ (id)requestWithDatabaseID:(unsigned int)a3 itemID:(unint64_t)a4
{
  v4 = (void *)[objc_alloc((Class)a1) initWithDatabaseID:*(void *)&a3 itemID:a4];
  return v4;
}

@end
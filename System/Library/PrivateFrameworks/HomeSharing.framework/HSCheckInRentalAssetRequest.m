@interface HSCheckInRentalAssetRequest
+ (id)requestWithDatabaseID:(unsigned int)a3 itemID:(unint64_t)a4;
- (HSCheckInRentalAssetRequest)initWithDatabaseID:(unsigned int)a3 itemID:(unint64_t)a4;
@end

@implementation HSCheckInRentalAssetRequest

- (HSCheckInRentalAssetRequest)initWithDatabaseID:(unsigned int)a3 itemID:(unint64_t)a4
{
  uint64_t v5 = *(void *)&a3;
  v10.receiver = self;
  v10.super_class = (Class)HSCheckInRentalAssetRequest;
  v6 = [(HSRequest *)&v10 initWithAction:@"checkin-rental-asset"];
  if (v6)
  {
    v7 = objc_msgSend(NSString, "stringWithFormat:", @"'dmap.itemid:%d'", v5);
    [(HSRequest *)v6 setValue:v7 forArgument:@"database-spec"];

    v8 = objc_msgSend(NSString, "stringWithFormat:", @"'dmap.itemid:%llu'", a4);
    [(HSRequest *)v6 setValue:v8 forArgument:@"item-spec"];
  }
  return v6;
}

+ (id)requestWithDatabaseID:(unsigned int)a3 itemID:(unint64_t)a4
{
  v4 = (void *)[objc_alloc((Class)a1) initWithDatabaseID:*(void *)&a3 itemID:a4];
  return v4;
}

@end
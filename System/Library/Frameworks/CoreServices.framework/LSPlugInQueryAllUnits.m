@interface LSPlugInQueryAllUnits
+ (BOOL)supportsSecureCoding;
- (void)sort:(BOOL)a3 pluginIDs:(id)a4 andYield:(id)a5 context:(LSContext *)a6;
@end

@implementation LSPlugInQueryAllUnits

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)sort:(BOOL)a3 pluginIDs:(id)a4 andYield:(id)a5 context:(LSContext *)a6
{
  id v8 = a5;
  id v9 = a4;
  v10 = [LSPlugInQueryAllUnitsResult alloc];
  id v13 = [v9 allObjects];

  v11 = _LSDatabaseGetCacheGUID();
  v12 = [(LSPlugInQueryAllUnitsResult *)v10 initWithPlugInUnits:v13 forDatabaseWithUUID:v11];
  (*((void (**)(id, LSPlugInQueryAllUnitsResult *, void))a5 + 2))(v8, v12, 0);
}

@end
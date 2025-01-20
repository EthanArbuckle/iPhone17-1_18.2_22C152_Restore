@interface CRKRestrictionsObserver
+ (void)addRestrictionsObserver:(id)a3;
+ (void)removeRestrictionsObserver:(id)a3;
@end

@implementation CRKRestrictionsObserver

+ (void)addRestrictionsObserver:(id)a3
{
  v3 = (void *)MEMORY[0x263F08A00];
  id v4 = a3;
  id v6 = [v3 defaultCenter];
  v5 = +[CRKRestrictions didChangeNotification];
  [v6 addObserver:v4 selector:sel_restrictionsDidChange_ name:v5 object:0];
}

+ (void)removeRestrictionsObserver:(id)a3
{
  v3 = (void *)MEMORY[0x263F08A00];
  id v4 = a3;
  id v6 = [v3 defaultCenter];
  v5 = +[CRKRestrictions didChangeNotification];
  [v6 removeObserver:v4 name:v5 object:0];
}

@end
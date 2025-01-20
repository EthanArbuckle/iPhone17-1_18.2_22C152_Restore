@interface _NSPersistenceUtilities
+ (BOOL)_setURL:(id)a3 forPersistentStore:(id)a4 withCoordinator:(id)a5;
+ (void)initialize;
@end

@implementation _NSPersistenceUtilities

+ (void)initialize
{
}

+ (BOOL)_setURL:(id)a3 forPersistentStore:(id)a4 withCoordinator:(id)a5
{
  return [a5 setURL:a3 forPersistentStore:a4];
}

@end
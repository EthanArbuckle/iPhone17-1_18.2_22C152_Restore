@interface SSServiceUtilities
+ (BOOL)isPad;
@end

@implementation SSServiceUtilities

+ (BOOL)isPad
{
  v2 = +[UIDevice currentDevice];
  BOOL v3 = [v2 userInterfaceIdiom] == (id)1;

  return v3;
}

@end
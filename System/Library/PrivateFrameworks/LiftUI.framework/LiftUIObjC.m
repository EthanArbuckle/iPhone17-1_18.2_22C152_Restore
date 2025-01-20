@interface LiftUIObjC
+ (id)viewControllerForData:(id)a3 delegate:(id)a4 dataSource:(id)a5;
+ (id)viewControllerForJSON:(id)a3 delegate:(id)a4 dataSource:(id)a5;
+ (id)viewControllerForURL:(id)a3 delegate:(id)a4 dataSource:(id)a5;
@end

@implementation LiftUIObjC

+ (id)viewControllerForJSON:(id)a3 delegate:(id)a4 dataSource:(id)a5
{
  return +[LiftUIFactory viewControllerWithJson:a3 delegate:a4 dataSource:a5];
}

+ (id)viewControllerForData:(id)a3 delegate:(id)a4 dataSource:(id)a5
{
  return +[LiftUIFactory viewControllerWithData:a3 delegate:a4 dataSource:a5];
}

+ (id)viewControllerForURL:(id)a3 delegate:(id)a4 dataSource:(id)a5
{
  return +[LiftUIFactory viewControllerWithUrl:a3 delegate:a4 dataSource:a5];
}

@end
@interface PosterBoardTestingUtilities
+ (id)knownPPTTests;
+ (id)posterRackViewController;
+ (id)posterSwitcherWindowScene;
@end

@implementation PosterBoardTestingUtilities

+ (id)knownPPTTests
{
  return &off_10000CEC8;
}

+ (id)posterSwitcherWindowScene
{
  Class v2 = NSClassFromString(@"PBFPosterSwitcherSceneDelegate");
  v3 = +[UIApplication sharedApplication];
  v4 = [v3 connectedScenes];
  v5 = [v4 allObjects];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100003AC4;
  v8[3] = &unk_10000C590;
  v8[4] = v2;
  v6 = [v5 bs_firstObjectPassingTest:v8];

  return v6;
}

+ (id)posterRackViewController
{
  Class v2 = [a1 posterSwitcherWindowScene];
  v3 = [v2 delegate];
  v4 = [v3 posterRackViewController];

  return v4;
}

@end
@interface AAUIRadarHelper
+ (void)tapToRadarWithTitle:(id)a3 initialMessage:(id)a4;
@end

@implementation AAUIRadarHelper

+ (void)tapToRadarWithTitle:(id)a3 initialMessage:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v18 = objc_alloc_init((Class)NSURLComponents);
  [v18 setScheme:@"tap-to-radar"];
  [v18 setHost:@"new"];
  v7 = +[NSMutableArray array];
  id v8 = [objc_alloc((Class)NSURLQueryItem) initWithName:@"ComponentName" value:@"AppleAccount"];
  [v7 addObject:v8];

  id v9 = [objc_alloc((Class)NSURLQueryItem) initWithName:@"ComponentVersion" value:@"iOS"];
  [v7 addObject:v9];

  id v10 = [objc_alloc((Class)NSURLQueryItem) initWithName:@"ComponentID" value:@"511458"];
  [v7 addObject:v10];

  id v11 = [objc_alloc((Class)NSURLQueryItem) initWithName:@"Classification" value:@"Serious Bug"];
  [v7 addObject:v11];

  id v12 = [objc_alloc((Class)NSURLQueryItem) initWithName:@"Reproducibility" value:@"I Didn't Try"];
  [v7 addObject:v12];

  id v13 = [objc_alloc((Class)NSURLQueryItem) initWithName:@"AutoDiagnostics" value:@"phone"];
  [v7 addObject:v13];

  id v14 = [objc_alloc((Class)NSURLQueryItem) initWithName:@"Title" value:v6];
  [v7 addObject:v14];

  id v15 = [objc_alloc((Class)NSURLQueryItem) initWithName:@"Description" value:v5];
  [v7 addObject:v15];

  [v18 setQueryItems:v7];
  v16 = +[LSApplicationWorkspace defaultWorkspace];
  v17 = [v18 URL];
  [v16 openURL:v17 configuration:0 completionHandler:0];
}

@end
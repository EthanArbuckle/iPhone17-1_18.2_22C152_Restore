@interface AFUICarPlayUtilities
+ (BOOL)isRequestForAnnounceNotification:(id)a3;
+ (BOOL)isRequestForDirectAction:(id)a3;
+ (BOOL)isRequestForMessageReadBannerTap:(id)a3;
+ (BOOL)shouldPresentForNewRequest:(id)a3 duringCurrentRequest:(id)a4;
+ (BOOL)shouldStartNewRequest:(id)a3 duringCurrentRequest:(id)a4;
@end

@implementation AFUICarPlayUtilities

+ (BOOL)shouldStartNewRequest:(id)a3 duringCurrentRequest:(id)a4
{
  id v6 = a3;
  LOBYTE(a4) = [a1 isRequestForAnnounceNotification:a4];
  LOBYTE(a1) = [a1 isRequestForMessageReadBannerTap:v6];

  return a4 & a1 ^ 1;
}

+ (BOOL)shouldPresentForNewRequest:(id)a3 duringCurrentRequest:(id)a4
{
  id v6 = a3;
  LOBYTE(a4) = [a1 isRequestForAnnounceNotification:a4];
  LOBYTE(a1) = [a1 isRequestForAnnounceNotification:v6];

  return a4 & (a1 ^ 1);
}

+ (BOOL)isRequestForMessageReadBannerTap:(id)a3
{
  id v3 = a3;
  v4 = [v3 uiPresentationIdentifier];
  BOOL v5 = [v4 isEqualToString:@"com.apple.siri.CarDisplay"]
    && [v3 requestSource] == 13
    && [v3 directActionEvent] == 4;

  return v5;
}

+ (BOOL)isRequestForAnnounceNotification:(id)a3
{
  id v3 = a3;
  v4 = [v3 uiPresentationIdentifier];
  BOOL v5 = [v4 isEqualToString:@"com.apple.siri.CarDisplay.UIFree"]
    && [v3 requestSource] == 37
    && [v3 directActionEvent] == 0;

  return v5;
}

+ (BOOL)isRequestForDirectAction:(id)a3
{
  return [a3 directActionEvent] != 0;
}

@end
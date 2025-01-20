@interface MKPlaceActionDataProvider
- (BOOL)canShowCallAction;
- (BOOL)isInSupportedCustomRouteRegion;
- (BOOL)supportsAddingPhotos;
- (BOOL)supportsMessagesForBusiness;
- (NSURL)messagesForBusinessURL;
@end

@implementation MKPlaceActionDataProvider

- (BOOL)supportsAddingPhotos
{
  return 0;
}

- (BOOL)supportsMessagesForBusiness
{
  return 0;
}

- (NSURL)messagesForBusinessURL
{
  return 0;
}

- (BOOL)canShowCallAction
{
  return 0;
}

- (BOOL)isInSupportedCustomRouteRegion
{
  return 0;
}

@end
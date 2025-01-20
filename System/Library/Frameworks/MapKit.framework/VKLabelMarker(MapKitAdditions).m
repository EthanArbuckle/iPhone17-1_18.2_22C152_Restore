@interface VKLabelMarker(MapKitAdditions)
- (id)detailCalloutAccessoryView;
- (id)leftCalloutAccessoryView;
- (id)rightCalloutAccessoryView;
- (id)subtitle;
- (void)setDetailCalloutAccessoryView:()MapKitAdditions;
- (void)setLeftCalloutAccessoryView:()MapKitAdditions;
- (void)setRightCalloutAccessoryView:()MapKitAdditions;
- (void)setSubtitle:()MapKitAdditions;
@end

@implementation VKLabelMarker(MapKitAdditions)

- (void)setSubtitle:()MapKitAdditions
{
}

- (id)subtitle
{
  return objc_getAssociatedObject(a1, &_MKCalloutSourceSubtitleKey);
}

- (void)setLeftCalloutAccessoryView:()MapKitAdditions
{
}

- (id)leftCalloutAccessoryView
{
  return objc_getAssociatedObject(a1, &_MKCalloutSourceLeftCalloutAccessoryViewKey);
}

- (void)setRightCalloutAccessoryView:()MapKitAdditions
{
}

- (id)rightCalloutAccessoryView
{
  return objc_getAssociatedObject(a1, &_MKCalloutSourceRightCalloutAccessoryViewKey);
}

- (void)setDetailCalloutAccessoryView:()MapKitAdditions
{
}

- (id)detailCalloutAccessoryView
{
  return objc_getAssociatedObject(a1, &_MKCalloutSourceDetailCalloutAccessoryViewKey);
}

@end
@interface UISheetPresentationController
- (NSArray)_maps_effectiveDetentValues;
@end

@implementation UISheetPresentationController

- (NSArray)_maps_effectiveDetentValues
{
  v2 = [(UISheetPresentationController *)self _detentValues];
  v3 = MapsMap(v2, &stru_72648);

  return (NSArray *)v3;
}

@end
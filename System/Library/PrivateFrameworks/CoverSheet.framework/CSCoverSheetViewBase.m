@interface CSCoverSheetViewBase
- (BOOL)isCoverSheetView;
- (NSArray)presentationRegions;
@end

@implementation CSCoverSheetViewBase

- (NSArray)presentationRegions
{
  v6[1] = *MEMORY[0x1E4F143B8];
  [(CSCoverSheetViewBase *)self bounds];
  v3 = +[CSRegion regionForCoordinateSpace:withExtent:](CSRegion, "regionForCoordinateSpace:withExtent:", self);
  v6[0] = v3;
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];

  return (NSArray *)v4;
}

- (BOOL)isCoverSheetView
{
  return 1;
}

@end
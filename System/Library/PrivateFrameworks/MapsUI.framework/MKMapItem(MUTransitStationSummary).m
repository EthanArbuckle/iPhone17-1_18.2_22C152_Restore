@interface MKMapItem(MUTransitStationSummary)
- (id)artworkImage;
@end

@implementation MKMapItem(MUTransitStationSummary)

- (id)artworkImage
{
  v1 = [a1 _transitInfo];
  v2 = [v1 systems];
  v3 = [v2 firstObject];
  v4 = [v3 artwork];

  v5 = (void *)MEMORY[0x1E4FB1818];
  v6 = [MEMORY[0x1E4F31038] sharedInstance];
  [v6 screenScale];
  v7 = objc_msgSend(v5, "_mapkit_transitArtworkImageWithDataSource:size:scale:", v4, 9);

  return v7;
}

@end
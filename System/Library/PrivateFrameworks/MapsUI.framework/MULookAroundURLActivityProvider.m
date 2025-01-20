@interface MULookAroundURLActivityProvider
- (id)activityViewController:(id)a3 itemForActivityType:(id)a4;
- (id)activityViewController:(id)a3 thumbnailImageForActivityType:(id)a4 suggestedSize:(CGSize)a5;
@end

@implementation MULookAroundURLActivityProvider

- (id)activityViewController:(id)a3 itemForActivityType:(id)a4
{
  if ([a4 isEqualToString:*MEMORY[0x1E4F9F370]])
  {
    v5 = 0;
  }
  else
  {
    v5 = [(MUPlaceActivityProvider *)self activityURL];
  }
  return v5;
}

- (id)activityViewController:(id)a3 thumbnailImageForActivityType:(id)a4 suggestedSize:(CGSize)a5
{
  double height = a5.height;
  double width = a5.width;
  id v8 = objc_alloc(MEMORY[0x1E4F31118]);
  v9 = [(MUPlaceActivityProvider *)self activityURL];
  v10 = (void *)[v8 initWithURL:v9];

  [v10 parseIncludingCustomParameters:1];
  if ([v10 mapType] == 107)
  {
    id v11 = objc_alloc_init(MEMORY[0x1E4F30F40]);
    objc_msgSend(v11, "setMapType:", objc_msgSend(v10, "mapType"));
    v12 = [v10 mapCamera];
    [v11 setCamera:v12];

    objc_msgSend(v11, "setSize:", width, height);
    [v11 _setShowsPointLabels:0];
    [v11 _setShowsAppleLogo:0];
    v13 = [MEMORY[0x1E4F30F30] createSnapshotWithOptions:v11 timeoutInSeconds:5];
    v14 = [v13 image];
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

@end
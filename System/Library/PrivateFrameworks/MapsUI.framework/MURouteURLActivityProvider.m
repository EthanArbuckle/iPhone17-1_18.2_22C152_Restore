@interface MURouteURLActivityProvider
- (id)activityViewController:(id)a3 itemForActivityType:(id)a4;
- (id)activityViewController:(id)a3 subjectForActivityType:(id)a4;
- (id)activityViewController:(id)a3 thumbnailImageForActivityType:(id)a4 suggestedSize:(CGSize)a5;
@end

@implementation MURouteURLActivityProvider

- (id)activityViewController:(id)a3 itemForActivityType:(id)a4
{
  if ([a4 isEqualToString:*MEMORY[0x1E4F9F348]])
  {
    v5 = [(MURouteActivityProvider *)self activityURL];
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)activityViewController:(id)a3 subjectForActivityType:(id)a4
{
  if ([a4 isEqualToString:*MEMORY[0x1E4F9F348]])
  {
    v5 = [MEMORY[0x1E4F28D90] dataWithJSONObject:&unk_1EE405228 options:0 error:0];
    v6 = (void *)[[NSString alloc] initWithData:v5 encoding:4];
  }
  else
  {
    v7 = NSString;
    v5 = _MULocalizedStringFromThisBundle(@"Directions to %@");
    v8 = [(MUPlaceActivityProvider *)self activityTitle];
    v6 = objc_msgSend(v7, "stringWithFormat:", v5, v8);
  }
  return v6;
}

- (id)activityViewController:(id)a3 thumbnailImageForActivityType:(id)a4 suggestedSize:(CGSize)a5
{
  double height = a5.height;
  double width = a5.width;
  v8 = [(MUPlaceActivityProvider *)self activityAnnotationView];
  v9 = [(MUPlaceActivityProvider *)self mapItem];
  v10 = objc_msgSend(v9, "thumbnailWithSize:annotationView:", v8, width, height);

  return v10;
}

@end
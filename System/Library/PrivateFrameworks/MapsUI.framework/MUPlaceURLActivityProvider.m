@interface MUPlaceURLActivityProvider
- (id)activityViewController:(id)a3 itemForActivityType:(id)a4;
- (id)activityViewController:(id)a3 subjectForActivityType:(id)a4;
- (id)activityViewController:(id)a3 thumbnailForActivityType:(id)a4;
- (id)activityViewController:(id)a3 thumbnailImageForActivityType:(id)a4 suggestedSize:(CGSize)a5;
- (int64_t)activityViewController:(id)a3 attachmentULRTypeForActivityType:(id)a4;
@end

@implementation MUPlaceURLActivityProvider

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

- (id)activityViewController:(id)a3 subjectForActivityType:(id)a4
{
  v14[2] = *MEMORY[0x1E4F143B8];
  if ([a4 isEqualToString:*MEMORY[0x1E4F9F348]])
  {
    v5 = [(MUPlaceActivityProvider *)self delegate];
    char v6 = objc_opt_respondsToSelector();

    if (v6)
    {
      v7 = [(MUPlaceActivityProvider *)self delegate];
      uint64_t v8 = [v7 airdropURLJSONForMapActivity:self];
    }
    else
    {
      v13[0] = @"SFAirDropActivitySubjectMain";
      v7 = [(MUPlaceActivityProvider *)self activityTitle];
      v13[1] = @"SFAirDropActivitySubjectMapsLinkType";
      v14[0] = v7;
      v14[1] = &unk_1EE404A48;
      uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:2];
    }
    v10 = (void *)v8;

    v11 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v10 options:0 error:0];
    v9 = (void *)[[NSString alloc] initWithData:v11 encoding:4];
  }
  else
  {
    v9 = [(MUPlaceActivityProvider *)self activityTitle];
  }
  return v9;
}

- (id)activityViewController:(id)a3 thumbnailImageForActivityType:(id)a4 suggestedSize:(CGSize)a5
{
  double height = a5.height;
  double width = a5.width;
  uint64_t v8 = [(MUPlaceActivityProvider *)self mapItem];
  v9 = [(MUPlaceActivityProvider *)self activityAnnotationView];
  v10 = objc_msgSend(v8, "thumbnailWithSize:annotationView:", v9, width, height);

  return v10;
}

- (id)activityViewController:(id)a3 thumbnailForActivityType:(id)a4
{
  if ([a4 isEqualToString:*MEMORY[0x1E4F9F348]])
  {
    v5 = [(MUPlaceActivityProvider *)self activityAnnotationView];
    double v6 = 180.0;
    double v7 = 240.0;
  }
  else
  {
    v5 = 0;
    double v7 = 84.0;
    double v6 = 84.0;
  }
  uint64_t v8 = [(MUPlaceActivityProvider *)self mapItem];
  v9 = objc_msgSend(v8, "thumbnailWithSize:annotationView:", v5, v7, v6);

  return v9;
}

- (int64_t)activityViewController:(id)a3 attachmentULRTypeForActivityType:(id)a4
{
  return 2;
}

@end
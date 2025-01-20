@interface MUPlaceTextActivityProvider
- (id)activityViewController:(id)a3 itemForActivityType:(id)a4;
- (id)activityViewControllerPlaceholderItem:(id)a3;
@end

@implementation MUPlaceTextActivityProvider

- (id)activityViewControllerPlaceholderItem:(id)a3
{
  return &stru_1EE3BF360;
}

- (id)activityViewController:(id)a3 itemForActivityType:(id)a4
{
  v24[1] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  if ([v5 isEqualToString:*MEMORY[0x1E4F9F370]])
  {
    v6 = [(MUPlaceActivityProvider *)self mapItem];
    v24[0] = v6;
    v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:1];

    v8 = HTMLStringForAnnotatedSnapshotImageWithMapItems(v7);
    v9 = [(MUPlaceActivityProvider *)self activityTitle];
    v10 = [(MUPlaceActivityProvider *)self mapItem];
    v11 = HTMLStringForMapItemDetailsWithTitle(v9, v10);

    v12 = [(MUPlaceActivityProvider *)self activityURL];
    v13 = _MULocalizedStringFromThisBundle(@"View on Apple Maps [POI Sharing]");
    v14 = HTMLStringForURLWithLabel(v12, v13);

    v22 = HTMLBodyWrapperStringWithFormat(@"%@<br><br>%@<br><br>%@", v15, v16, v17, v18, v19, v20, v21, (uint64_t)v8);
  }
  else if (([v5 isEqualToString:*MEMORY[0x1E4F9F380]] & 1) != 0 {
         || ([v5 isEqualToString:*MEMORY[0x1E4F9F360]] & 1) != 0)
  }
  {
    v22 = 0;
  }
  else
  {
    v22 = [(MUPlaceActivityProvider *)self activityTitle];
  }

  return v22;
}

@end
@interface MUPlaceMapItemActivityProvider
- (id)activityViewController:(id)a3 dataTypeIdentifierForActivityType:(id)a4;
- (id)activityViewController:(id)a3 itemForActivityType:(id)a4;
- (id)activityViewControllerPlaceholderItem:(id)a3;
@end

@implementation MUPlaceMapItemActivityProvider

- (id)activityViewControllerPlaceholderItem:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E4F1C9B8], "data", a3);
}

- (id)activityViewController:(id)a3 itemForActivityType:(id)a4
{
  id v5 = a4;
  if (([v5 isEqualToString:*MEMORY[0x1E4F9F380]] & 1) != 0
    || ([v5 isEqualToString:*MEMORY[0x1E4F9F348]] & 1) != 0)
  {
    v6 = 0;
  }
  else
  {
    v7 = (void *)MEMORY[0x1E4F28DB0];
    v8 = [(MUPlaceActivityProvider *)self mapItem];
    v9 = [v7 archivedDataWithRootObject:v8 requiringSecureCoding:1 error:0];

    v6 = (void *)[v9 copy];
  }

  return v6;
}

- (id)activityViewController:(id)a3 dataTypeIdentifierForActivityType:(id)a4
{
  return (id)*MEMORY[0x1E4F30D90];
}

@end
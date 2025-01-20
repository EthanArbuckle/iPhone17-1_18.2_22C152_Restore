@interface MULookAroundTextActivityProvider
- (id)activityViewController:(id)a3 itemForActivityType:(id)a4;
- (id)activityViewController:(id)a3 subjectForActivityType:(id)a4;
- (id)activityViewControllerPlaceholderItem:(id)a3;
@end

@implementation MULookAroundTextActivityProvider

- (id)activityViewController:(id)a3 itemForActivityType:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v7 isEqualToString:*MEMORY[0x1E4F9F370]])
  {
    v8 = [(MUPlaceActivityProvider *)self activityURL];
    v9 = [(MULookAroundTextActivityProvider *)self activityViewController:v6 subjectForActivityType:v7];
    v10 = v9;
    if (!v9) {
      v9 = &stru_1EE3BF360;
    }
    v11 = [(__CFString *)v9 _navigation_sanitizedStringForDisplayInHTML];

    v12 = NSString;
    v13 = [v8 absoluteString];
    v14 = [v12 stringWithFormat:@"<html><head><meta charset=\"utf-8\" /></head><body><a href=\"%@\">%@</a></body></html>", v13, v11];
  }
  else if (([v7 isEqualToString:*MEMORY[0x1E4F9F380]] & 1) != 0 {
         || ([v7 isEqualToString:*MEMORY[0x1E4F9F360]] & 1) != 0)
  }
  {
    v14 = 0;
  }
  else
  {
    v14 = [(MUPlaceActivityProvider *)self activityTitle];
  }

  return v14;
}

- (id)activityViewControllerPlaceholderItem:(id)a3
{
  return &stru_1EE3BF360;
}

- (id)activityViewController:(id)a3 subjectForActivityType:(id)a4
{
  v5 = NSString;
  id v6 = _MULocalizedStringFromThisBundle(@"Look Around: %@ [Sharing]");
  id v7 = [(MUPlaceActivityProvider *)self activityTitle];
  v8 = objc_msgSend(v5, "stringWithFormat:", v6, v7);

  return v8;
}

@end
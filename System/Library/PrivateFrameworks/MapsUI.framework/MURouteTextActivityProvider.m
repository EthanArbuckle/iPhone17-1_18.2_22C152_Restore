@interface MURouteTextActivityProvider
- (id)activityViewController:(id)a3 itemForActivityType:(id)a4;
- (id)activityViewControllerPlaceholderItem:(id)a3;
@end

@implementation MURouteTextActivityProvider

- (id)activityViewControllerPlaceholderItem:(id)a3
{
  return &stru_1EE3BF360;
}

- (id)activityViewController:(id)a3 itemForActivityType:(id)a4
{
  if ([a4 isEqualToString:*MEMORY[0x1E4F9F370]])
  {
    v5 = [(MURouteActivityProvider *)self activityURL];
    v6 = NSString;
    v7 = _MULocalizedStringFromThisBundle(@"[Route Sharing] Email body");
    v8 = [(MUPlaceActivityProvider *)self activityTitle];
    v9 = [(MURouteActivityProvider *)self activitySourceTitle];
    v10 = objc_msgSend(v6, "stringWithFormat:", v7, v8, v9);

    v11 = objc_msgSend(v10, "_navigation_sanitizedStringForDisplayInHTML");
    v12 = NSString;
    v13 = [v5 absoluteString];
    v14 = [v12 stringWithFormat:@"<html><head><meta charset=\"utf-8\" /></head><body><a href='%@'>%@</a></body></html>", v13, v11];
  }
  else
  {
    v14 = 0;
  }
  return v14;
}

@end
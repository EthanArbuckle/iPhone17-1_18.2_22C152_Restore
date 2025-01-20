@interface WKFormRotatingAccessoryPopover
- (WKFormRotatingAccessoryPopover)initWithView:(id)a3;
- (unint64_t)popoverArrowDirections;
- (void)accessoryDone;
@end

@implementation WKFormRotatingAccessoryPopover

- (WKFormRotatingAccessoryPopover)initWithView:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)WKFormRotatingAccessoryPopover;
  v3 = [(WKRotatingPopover *)&v6 initWithView:a3];
  v4 = v3;
  if (v3) {
    [(WKRotatingPopover *)v3 setDismissionDelegate:v3];
  }
  return v4;
}

- (void)accessoryDone
{
  v2 = [(WKRotatingPopover *)self view];

  [(WKContentView *)v2 accessoryDone];
}

- (unint64_t)popoverArrowDirections
{
  if ((unint64_t)(objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F42738], "sharedApplication"), "statusBarOrientation")- 3) > 1)return 3; {
  if (objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F42C68], "sharedInstance"), "isOnScreen"))
  }
    return 12;
  return 3;
}

@end
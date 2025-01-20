@interface AXUIWindow
+ (BOOL)_isSecure;
- (BOOL)_accessibilityIsIsolatedWindow;
- (BOOL)_shouldAutorotateToInterfaceOrientation:(int64_t)a3;
- (BOOL)isHandlingFullScreenPresentation;
- (BOOL)shouldRespondToDarkModeChanges;
- (id)_accessibilityElementCommunityIdentifier;
- (id)accessibilityLabel;
- (id)description;
- (void)setIsHandlingFullScreenPresentation:(BOOL)a3;
- (void)setShouldRespondToDarkModeChanges:(BOOL)a3;
@end

@implementation AXUIWindow

- (BOOL)_shouldAutorotateToInterfaceOrientation:(int64_t)a3
{
  return 1;
}

- (BOOL)_accessibilityIsIsolatedWindow
{
  return 1;
}

- (id)_accessibilityElementCommunityIdentifier
{
  v2 = NSString;
  [(AXUIWindow *)self windowLevel];
  return (id)objc_msgSend(v2, "stringWithFormat:", @"AXUIServer-%f", v3);
}

- (id)accessibilityLabel
{
  v2 = [(AXUIWindow *)self rootViewController];
  uint64_t v3 = [v2 childViewControllers];

  if ((unint64_t)[v3 count] <= 1 && objc_msgSend(v3, "count") == 1)
  {
    v4 = [v3 firstObject];
    v5 = [v4 title];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (BOOL)_isSecure
{
  return 1;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)AXUIWindow;
  uint64_t v3 = [(AXUIWindow *)&v7 description];
  v4 = [(AXUIWindow *)self accessibilityIdentifier];
  v5 = [v3 stringByAppendingFormat:@" AXID: %@", v4];

  return v5;
}

- (BOOL)isHandlingFullScreenPresentation
{
  return self->_isHandlingFullScreenPresentation;
}

- (void)setIsHandlingFullScreenPresentation:(BOOL)a3
{
  self->_isHandlingFullScreenPresentation = a3;
}

- (BOOL)shouldRespondToDarkModeChanges
{
  return self->_shouldRespondToDarkModeChanges;
}

- (void)setShouldRespondToDarkModeChanges:(BOOL)a3
{
  self->_shouldRespondToDarkModeChanges = a3;
}

@end
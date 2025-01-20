@interface UNImageNotificationAttachmentOptions
- (BOOL)hiddenFromDefaultExpandedView;
- (void)setHiddenFromDefaultExpandedView:(BOOL)a3;
@end

@implementation UNImageNotificationAttachmentOptions

- (BOOL)hiddenFromDefaultExpandedView
{
  return self->_hiddenFromDefaultExpandedView;
}

- (void)setHiddenFromDefaultExpandedView:(BOOL)a3
{
  self->_hiddenFromDefaultExpandedView = a3;
}

@end
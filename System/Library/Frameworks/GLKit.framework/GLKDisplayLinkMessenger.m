@interface GLKDisplayLinkMessenger
- (void)message;
- (void)setTarget:(id)a3;
@end

@implementation GLKDisplayLinkMessenger

- (void)setTarget:(id)a3
{
  self->_target = a3;
}

- (void)message
{
}

@end
@interface GKAvatarImageBrush
- (id)renderedImageIdentifier;
- (int64_t)dimension;
- (void)setDimension:(int64_t)a3;
@end

@implementation GKAvatarImageBrush

- (id)renderedImageIdentifier
{
  v2 = NSString;
  v3 = objc_msgSend(NSNumber, "numberWithInteger:", -[GKAvatarImageBrush dimension](self, "dimension"));
  v4 = [v2 stringWithFormat:@"%@", v3];

  return v4;
}

- (int64_t)dimension
{
  return self->_dimension;
}

- (void)setDimension:(int64_t)a3
{
  self->_dimension = a3;
}

@end
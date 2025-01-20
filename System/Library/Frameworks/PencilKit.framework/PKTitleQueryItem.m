@interface PKTitleQueryItem
- (CGRect)bounds;
- (NSString)transcribedTitle;
- (PKTitleQueryItem)initWithTranscribedTitle:(id)a3 bounds:(CGRect)a4;
@end

@implementation PKTitleQueryItem

- (PKTitleQueryItem)initWithTranscribedTitle:(id)a3 bounds:(CGRect)a4
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  v9 = (NSString *)a3;
  v13.receiver = self;
  v13.super_class = (Class)PKTitleQueryItem;
  v10 = [(PKTitleQueryItem *)&v13 init];
  transcribedTitle = v10->_transcribedTitle;
  v10->_transcribedTitle = v9;

  v10->_bounds.origin.CGFloat x = x;
  v10->_bounds.origin.CGFloat y = y;
  v10->_bounds.size.CGFloat width = width;
  v10->_bounds.size.CGFloat height = height;
  return v10;
}

- (NSString)transcribedTitle
{
  return self->_transcribedTitle;
}

- (CGRect)bounds
{
  double x = self->_bounds.origin.x;
  double y = self->_bounds.origin.y;
  double width = self->_bounds.size.width;
  double height = self->_bounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void).cxx_destruct
{
}

@end
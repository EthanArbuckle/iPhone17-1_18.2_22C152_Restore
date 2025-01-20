@interface PKPencilTextInputElement
- (CGRect)frame;
- (NSObject)identifier;
- (PKPencilTextInputElement)initWithIdentifier:(id)a3 frame:(CGRect)a4;
- (id)description;
@end

@implementation PKPencilTextInputElement

- (PKPencilTextInputElement)initWithIdentifier:(id)a3 frame:(CGRect)a4
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  id v9 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PKPencilTextInputElement;
  v10 = [(PKPencilTextInputElement *)&v14 init];
  if (v10)
  {
    uint64_t v11 = [v9 copyWithZone:0];
    identifier = v10->_identifier;
    v10->_identifier = v11;

    v10->_frame.origin.CGFloat x = x;
    v10->_frame.origin.CGFloat y = y;
    v10->_frame.size.CGFloat width = width;
    v10->_frame.size.CGFloat height = height;
  }

  return v10;
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)PKPencilTextInputElement;
  v3 = [(PKPencilTextInputElement *)&v8 description];
  v4 = [(PKPencilTextInputElement *)self identifier];
  [(PKPencilTextInputElement *)self frame];
  v5 = NSStringFromCGRect(v10);
  v6 = [v3 stringByAppendingFormat:@" ID: %@, frame: %@", v4, v5];

  return v6;
}

- (NSObject)identifier
{
  return self->_identifier;
}

- (CGRect)frame
{
  double x = self->_frame.origin.x;
  double y = self->_frame.origin.y;
  double width = self->_frame.size.width;
  double height = self->_frame.size.height;
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
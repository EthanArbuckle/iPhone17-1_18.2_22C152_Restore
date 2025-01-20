@interface PKSelectionInput
+ (id)inputWithType:(int64_t)a3 location:(CGPoint)a4 inputType:(int64_t)a5;
- (CGPoint)location;
- (int64_t)inputType;
- (int64_t)selectionType;
- (void)setInputType:(int64_t)a3;
- (void)setLocation:(CGPoint)a3;
- (void)setSelectionType:(int64_t)a3;
@end

@implementation PKSelectionInput

+ (id)inputWithType:(int64_t)a3 location:(CGPoint)a4 inputType:(int64_t)a5
{
  double y = a4.y;
  double x = a4.x;
  v9 = objc_alloc_init(PKSelectionInput);
  [(PKSelectionInput *)v9 setSelectionType:a3];
  -[PKSelectionInput setLocation:](v9, "setLocation:", x, y);
  [(PKSelectionInput *)v9 setInputType:a5];

  return v9;
}

- (int64_t)selectionType
{
  return self->_selectionType;
}

- (void)setSelectionType:(int64_t)a3
{
  self->_selectionType = a3;
}

- (CGPoint)location
{
  double x = self->_location.x;
  double y = self->_location.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setLocation:(CGPoint)a3
{
  self->_location = a3;
}

- (int64_t)inputType
{
  return self->_inputType;
}

- (void)setInputType:(int64_t)a3
{
  self->_inputType = a3;
}

@end
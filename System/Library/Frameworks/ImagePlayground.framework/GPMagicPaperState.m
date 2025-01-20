@interface GPMagicPaperState
- (BOOL)isEditing;
- (CGRect)frame;
- (GPMagicPaperState)initWithFrame:(CGRect)a3 isEditing:(BOOL)a4;
- (void)setFrame:(CGRect)a3;
- (void)setIsEditing:(BOOL)a3;
@end

@implementation GPMagicPaperState

- (GPMagicPaperState)initWithFrame:(CGRect)a3 isEditing:(BOOL)a4
{
  BOOL v4 = a4;
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v12.receiver = self;
  v12.super_class = (Class)GPMagicPaperState;
  v9 = [(GPMagicPaperState *)&v12 init];
  v10 = v9;
  if (v9)
  {
    -[GPMagicPaperState setFrame:](v9, "setFrame:", x, y, width, height);
    [(GPMagicPaperState *)v10 setIsEditing:v4];
  }
  return v10;
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

- (void)setFrame:(CGRect)a3
{
  self->_frame = a3;
}

- (BOOL)isEditing
{
  return self->_isEditing;
}

- (void)setIsEditing:(BOOL)a3
{
  self->_isEditing = a3;
}

@end
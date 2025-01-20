@interface PKSelectionTileProperties
- (BOOL)isEqual:(id)a3;
- (CGRect)frame;
- (NSArray)strokes;
- (PKSelectionTileProperties)initWithFrame:(CGRect)a3 strokes:(id)a4;
- (id)description;
- (unint64_t)hash;
@end

@implementation PKSelectionTileProperties

- (PKSelectionTileProperties)initWithFrame:(CGRect)a3 strokes:(id)a4
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  id v9 = a4;
  v15.receiver = self;
  v15.super_class = (Class)PKSelectionTileProperties;
  v10 = [(PKSelectionTileProperties *)&v15 init];
  v11 = v10;
  if (v10)
  {
    v10->_frame.origin.CGFloat x = x;
    v10->_frame.origin.CGFloat y = y;
    v10->_frame.size.CGFloat width = width;
    v10->_frame.size.CGFloat height = height;
    uint64_t v12 = [v9 copy];
    strokes = v11->_strokes;
    v11->_strokes = (NSArray *)v12;
  }
  return v11;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (PKSelectionTileProperties *)a3;
  if (v4 == self)
  {
    char v6 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      if (CGRectEqualToRect(self->_frame, v5->_frame)) {
        char v6 = [(NSArray *)self->_strokes isEqual:v5->_strokes];
      }
      else {
        char v6 = 0;
      }
    }
    else
    {
      char v6 = 0;
    }
  }

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3 = PKHashBytes((uint64_t)&self->_frame, 32);
  return [(NSArray *)self->_strokes hash] ^ v3;
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)PKSelectionTileProperties;
  uint64_t v3 = [(PKSelectionTileProperties *)&v8 description];
  [(PKSelectionTileProperties *)self frame];
  v4 = NSStringFromCGRect(v10);
  v5 = [(PKSelectionTileProperties *)self strokes];
  char v6 = [v3 stringByAppendingFormat:@" %@, numStrokes: %lu", v4, objc_msgSend(v5, "count")];

  return v6;
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

- (NSArray)strokes
{
  return self->_strokes;
}

- (void).cxx_destruct
{
}

@end
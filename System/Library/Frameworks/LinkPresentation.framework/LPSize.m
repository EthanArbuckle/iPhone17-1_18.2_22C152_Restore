@interface LPSize
- (BOOL)isEmpty;
- (CGSize)asSize;
- (LPPointUnit)height;
- (LPPointUnit)width;
- (LPSize)init;
- (LPSize)initWithSize:(CGSize)a3;
- (LPSize)initWithSquarePoints:(id)a3;
- (LPSize)initWithSquareSize:(double)a3;
- (id)copyWithZone:(_NSZone *)a3;
@end

@implementation LPSize

- (LPSize)init
{
  v9.receiver = self;
  v9.super_class = (Class)LPSize;
  v2 = [(LPSize *)&v9 init];
  if (v2)
  {
    uint64_t v3 = +[LPPointUnit zero];
    width = v2->_width;
    v2->_width = (LPPointUnit *)v3;

    uint64_t v5 = +[LPPointUnit zero];
    height = v2->_height;
    v2->_height = (LPPointUnit *)v5;

    v7 = v2;
  }

  return v2;
}

- (LPSize)initWithSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v12.receiver = self;
  v12.super_class = (Class)LPSize;
  uint64_t v5 = [(LPSize *)&v12 init];
  if (v5)
  {
    v6 = [[LPPointUnit alloc] initWithValue:width];
    v7 = v5->_width;
    v5->_double width = v6;

    v8 = [[LPPointUnit alloc] initWithValue:height];
    objc_super v9 = v5->_height;
    v5->_double height = v8;

    v10 = v5;
  }

  return v5;
}

- (LPSize)initWithSquareSize:(double)a3
{
  v9.receiver = self;
  v9.super_class = (Class)LPSize;
  v4 = [(LPSize *)&v9 init];
  if (v4)
  {
    uint64_t v5 = [[LPPointUnit alloc] initWithValue:a3];
    double width = v4->_width;
    v4->_double width = v5;

    objc_storeStrong((id *)&v4->_height, v4->_width);
    v7 = v4;
  }

  return v4;
}

- (LPSize)initWithSquarePoints:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)LPSize;
  v6 = [(LPSize *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_width, a3);
    objc_storeStrong((id *)&v7->_height, a3);
    v8 = v7;
  }

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[LPSize allocWithZone:a3];
  p_isa = (id *)&v4->super.isa;
  if (v4)
  {
    objc_storeStrong((id *)&v4->_width, self->_width);
    objc_storeStrong(p_isa + 2, self->_height);
    v6 = p_isa;
  }

  return p_isa;
}

- (CGSize)asSize
{
  [(LPPointUnit *)self->_width value];
  double v4 = v3;
  [(LPPointUnit *)self->_height value];
  double v6 = v5;
  double v7 = v4;
  result.double height = v6;
  result.double width = v7;
  return result;
}

- (BOOL)isEmpty
{
  [(LPPointUnit *)self->_width value];
  if (v3 == 0.0) {
    return 1;
  }
  [(LPPointUnit *)self->_height value];
  return v4 == 0.0;
}

- (LPPointUnit)width
{
  return self->_width;
}

- (LPPointUnit)height
{
  return self->_height;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_height, 0);

  objc_storeStrong((id *)&self->_width, 0);
}

@end
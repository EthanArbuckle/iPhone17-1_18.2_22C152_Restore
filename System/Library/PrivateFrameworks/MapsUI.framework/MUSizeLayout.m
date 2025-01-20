@interface MUSizeLayout
+ (double)useIntrinsicContentSize;
- (CGSize)size;
- (MULayoutItem)item;
- (MUSizeLayout)initWithItem:(id)a3 size:(CGSize)a4;
- (MUSizeLayout)initWithItem:(id)a3 size:(CGSize)a4 priority:(float)a5;
- (float)priority;
- (void)setItem:(id)a3;
- (void)setPriority:(float)a3;
- (void)setSize:(CGSize)a3;
@end

@implementation MUSizeLayout

- (MUSizeLayout)initWithItem:(id)a3 size:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  id v7 = a3;
  v8 = -[MUSizeLayoutInternal initWithItem:size:]([MUSizeLayoutInternal alloc], "initWithItem:size:", v7, width, height);

  v12.receiver = self;
  v12.super_class = (Class)MUSizeLayout;
  v9 = [(MUConstraintLayout *)&v12 initWithInternal:v8];
  v10 = v9;
  if (v9) {
    objc_storeStrong((id *)&v9->_internal, v8);
  }

  return v10;
}

- (void).cxx_destruct
{
}

+ (double)useIntrinsicContentSize
{
  +[MUSizeLayoutInternal useIntrinsicContentSize];
  return result;
}

- (MUSizeLayout)initWithItem:(id)a3 size:(CGSize)a4 priority:(float)a5
{
  double height = a4.height;
  double width = a4.width;
  id v9 = a3;
  v10 = [MUSizeLayoutInternal alloc];
  *(float *)&double v11 = a5;
  objc_super v12 = -[MUSizeLayoutInternal initWithItem:size:priority:](v10, "initWithItem:size:priority:", v9, width, height, v11);

  v16.receiver = self;
  v16.super_class = (Class)MUSizeLayout;
  v13 = [(MUConstraintLayout *)&v16 initWithInternal:v12];
  v14 = v13;
  if (v13) {
    objc_storeStrong((id *)&v13->_internal, v12);
  }

  return v14;
}

- (MULayoutItem)item
{
  return [(MUSizeLayoutInternal *)self->_internal item];
}

- (void)setItem:(id)a3
{
}

- (CGSize)size
{
  [(MUSizeLayoutInternal *)self->_internal size];
  result.double height = v3;
  result.double width = v2;
  return result;
}

- (void)setSize:(CGSize)a3
{
}

- (float)priority
{
  [(MUSizeLayoutInternal *)self->_internal priority];
  return result;
}

- (void)setPriority:(float)a3
{
}

@end
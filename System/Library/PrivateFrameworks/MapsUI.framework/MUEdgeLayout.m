@interface MUEdgeLayout
- (MUEdgeLayout)initWithItem:(id)a3 container:(id)a4;
- (MUEdgeLayout)initWithItem:(id)a3 container:(id)a4 insets:(NSDirectionalEdgeInsets)a5;
- (MUEdgeLayout)initWithItem:(id)a3 container:(id)a4 insets:(NSDirectionalEdgeInsets)a5 edges:(unint64_t)a6 priority:(float)a7;
- (MULayoutItem)container;
- (MULayoutItem)item;
- (NSDirectionalEdgeInsets)insets;
- (float)priority;
- (unint64_t)edges;
- (void)setContainer:(id)a3;
- (void)setEdges:(unint64_t)a3;
- (void)setInsets:(NSDirectionalEdgeInsets)a3;
- (void)setItem:(id)a3;
- (void)setPriority:(float)a3;
@end

@implementation MUEdgeLayout

- (MUEdgeLayout)initWithItem:(id)a3 container:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [[MUEdgeLayoutInternal alloc] initWithItem:v7 container:v6];

  v12.receiver = self;
  v12.super_class = (Class)MUEdgeLayout;
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

- (MUEdgeLayout)initWithItem:(id)a3 container:(id)a4 insets:(NSDirectionalEdgeInsets)a5
{
  double trailing = a5.trailing;
  double bottom = a5.bottom;
  double leading = a5.leading;
  double top = a5.top;
  id v11 = a4;
  id v12 = a3;
  v13 = -[MUEdgeLayoutInternal initWithItem:container:insets:]([MUEdgeLayoutInternal alloc], "initWithItem:container:insets:", v12, v11, top, leading, bottom, trailing);

  v17.receiver = self;
  v17.super_class = (Class)MUEdgeLayout;
  v14 = [(MUConstraintLayout *)&v17 initWithInternal:v13];
  v15 = v14;
  if (v14) {
    objc_storeStrong((id *)&v14->_internal, v13);
  }

  return v15;
}

- (MUEdgeLayout)initWithItem:(id)a3 container:(id)a4 insets:(NSDirectionalEdgeInsets)a5 edges:(unint64_t)a6 priority:(float)a7
{
  double trailing = a5.trailing;
  double bottom = a5.bottom;
  double leading = a5.leading;
  double top = a5.top;
  id v15 = a4;
  id v16 = a3;
  objc_super v17 = [MUEdgeLayoutInternal alloc];
  *(float *)&double v18 = a7;
  v19 = -[MUEdgeLayoutInternal initWithItem:container:insets:edges:priority:](v17, "initWithItem:container:insets:edges:priority:", v16, v15, a6, top, leading, bottom, trailing, v18);

  v23.receiver = self;
  v23.super_class = (Class)MUEdgeLayout;
  v20 = [(MUConstraintLayout *)&v23 initWithInternal:v19];
  v21 = v20;
  if (v20) {
    objc_storeStrong((id *)&v20->_internal, v19);
  }

  return v21;
}

- (MULayoutItem)container
{
  return [(MUEdgeLayoutInternal *)self->_internal container];
}

- (void)setContainer:(id)a3
{
}

- (MULayoutItem)item
{
  return [(MUEdgeLayoutInternal *)self->_internal item];
}

- (void)setItem:(id)a3
{
}

- (NSDirectionalEdgeInsets)insets
{
  [(MUEdgeLayoutInternal *)self->_internal insets];
  result.double trailing = v5;
  result.double bottom = v4;
  result.double leading = v3;
  result.double top = v2;
  return result;
}

- (void)setInsets:(NSDirectionalEdgeInsets)a3
{
}

- (unint64_t)edges
{
  return [(MUEdgeLayoutInternal *)self->_internal edges];
}

- (void)setEdges:(unint64_t)a3
{
}

- (float)priority
{
  [(MUEdgeLayoutInternal *)self->_internal priority];
  return result;
}

- (void)setPriority:(float)a3
{
}

@end
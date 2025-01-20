@interface MUCompositionalStackLayout
- (MUCompositionalStackLayout)initWithContainer:(id)a3 group:(id)a4;
- (MUCompositionalStackLayoutGroup)group;
- (MULayoutItem)container;
- (void)setContainer:(id)a3;
- (void)setGroup:(id)a3;
@end

@implementation MUCompositionalStackLayout

- (MUCompositionalStackLayout)initWithContainer:(id)a3 group:(id)a4
{
  id v6 = a3;
  v7 = (void *)[a4 copy];
  v8 = [MUCompositionalStackLayoutInternal alloc];
  v9 = [v7 internal];
  v10 = [(MUCompositionalStackLayoutInternal *)v8 initWithContainer:v6 group:v9];

  v14.receiver = self;
  v14.super_class = (Class)MUCompositionalStackLayout;
  v11 = [(MUConstraintLayout *)&v14 initWithInternal:v10];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_internal, v10);
    objc_storeStrong((id *)&v12->_group, v7);
  }

  return v12;
}

- (MULayoutItem)container
{
  return [(MUCompositionalStackLayoutInternal *)self->_internal container];
}

- (void)setContainer:(id)a3
{
}

- (void)setGroup:(id)a3
{
  if (self->_group != a3)
  {
    v4 = (MUCompositionalStackLayoutGroup *)[a3 copy];
    group = self->_group;
    self->_group = v4;

    id v6 = [(MUCompositionalStackLayoutGroup *)self->_group internal];
    [(MUCompositionalStackLayoutInternal *)self->_internal setGroup:v6];
  }
}

- (MUCompositionalStackLayoutGroup)group
{
  return self->_group;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_group, 0);
  objc_storeStrong((id *)&self->_internal, 0);
}

@end
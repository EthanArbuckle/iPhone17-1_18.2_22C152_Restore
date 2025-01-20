@interface _MKDataHeaderModel
- (MKTransitInfoLabelView)transitLabel;
- (UIView)ownerView;
- (_MKDataHeaderModel)init;
- (_MKLineHeaderModel)firstLine;
- (_MKLineHeaderModel)forthLine;
- (_MKLineHeaderModel)secondLine;
- (_MKLineHeaderModel)secondaryNameLine;
- (_MKLineHeaderModel)thirdLine;
- (id)description;
- (void)setFirstLine:(id)a3;
- (void)setForthLine:(id)a3;
- (void)setOwnerView:(id)a3;
- (void)setSecondLine:(id)a3;
- (void)setSecondaryNameLine:(id)a3;
- (void)setThirdLine:(id)a3;
- (void)setTransitLabel:(id)a3;
@end

@implementation _MKDataHeaderModel

- (_MKDataHeaderModel)init
{
  v14.receiver = self;
  v14.super_class = (Class)_MKDataHeaderModel;
  v2 = [(_MKDataHeaderModel *)&v14 init];
  if (v2)
  {
    v3 = objc_alloc_init(_MKLineHeaderModel);
    firstLine = v2->_firstLine;
    v2->_firstLine = v3;

    v5 = objc_alloc_init(_MKLineHeaderModel);
    secondLine = v2->_secondLine;
    v2->_secondLine = v5;

    v7 = objc_alloc_init(_MKLineHeaderModel);
    thirdLine = v2->_thirdLine;
    v2->_thirdLine = v7;

    v9 = objc_alloc_init(_MKLineHeaderModel);
    forthLine = v2->_forthLine;
    v2->_forthLine = v9;

    v11 = objc_alloc_init(_MKLineHeaderModel);
    secondaryNameLine = v2->_secondaryNameLine;
    v2->_secondaryNameLine = v11;
  }
  return v2;
}

- (void)setOwnerView:(id)a3
{
  firstLine = self->_firstLine;
  id v5 = a3;
  [(_MKLineHeaderModel *)firstLine setOwnerView:v5];
  [(_MKLineHeaderModel *)self->_secondLine setOwnerView:v5];
  [(_MKLineHeaderModel *)self->_thirdLine setOwnerView:v5];
  [(_MKLineHeaderModel *)self->_forthLine setOwnerView:v5];
  [(_MKLineHeaderModel *)self->_secondaryNameLine setOwnerView:v5];
}

- (id)description
{
  v3 = (void *)[&stru_1ED919588 mutableCopy];
  v4 = [(_MKLineHeaderModel *)self->_firstLine description];
  [v3 appendFormat:@"1: %@\n", v4];

  id v5 = [(_MKLineHeaderModel *)self->_secondLine description];
  [v3 appendFormat:@"2: %@\n", v5];

  v6 = [(_MKLineHeaderModel *)self->_firstLine description];
  [v3 appendFormat:@"3: %@\n", v6];

  v7 = [(_MKLineHeaderModel *)self->_thirdLine description];
  [v3 appendFormat:@"4: %@\n", v7];

  v8 = [(_MKLineHeaderModel *)self->_forthLine description];
  [v3 appendFormat:@"5: %@\n", v8];

  v9 = [(_MKLineHeaderModel *)self->_secondaryNameLine description];
  [v3 appendFormat:@"6: %@\n", v9];

  return v3;
}

- (UIView)ownerView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_ownerView);

  return (UIView *)WeakRetained;
}

- (_MKLineHeaderModel)firstLine
{
  return self->_firstLine;
}

- (void)setFirstLine:(id)a3
{
}

- (_MKLineHeaderModel)secondLine
{
  return self->_secondLine;
}

- (void)setSecondLine:(id)a3
{
}

- (_MKLineHeaderModel)thirdLine
{
  return self->_thirdLine;
}

- (void)setThirdLine:(id)a3
{
}

- (_MKLineHeaderModel)forthLine
{
  return self->_forthLine;
}

- (void)setForthLine:(id)a3
{
}

- (MKTransitInfoLabelView)transitLabel
{
  return self->_transitLabel;
}

- (void)setTransitLabel:(id)a3
{
}

- (_MKLineHeaderModel)secondaryNameLine
{
  return self->_secondaryNameLine;
}

- (void)setSecondaryNameLine:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondaryNameLine, 0);
  objc_storeStrong((id *)&self->_transitLabel, 0);
  objc_storeStrong((id *)&self->_forthLine, 0);
  objc_storeStrong((id *)&self->_thirdLine, 0);
  objc_storeStrong((id *)&self->_secondLine, 0);
  objc_storeStrong((id *)&self->_firstLine, 0);

  objc_destroyWeak((id *)&self->_ownerView);
}

@end
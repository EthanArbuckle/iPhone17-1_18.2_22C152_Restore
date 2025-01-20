@interface RepertoireView
- (RepertoireView)initWithCoder:(id)a3;
- (RepertoireView)initWithFrame:(CGRect)a3;
- (RepertoireView)initWithFrame:(CGRect)a3 font:(id)a4;
- (UICollectionView)repertoireCollectionView;
- (UIFont)font;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)flowLayout;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (void)commonInit;
- (void)reloadRepertoire;
- (void)setFont:(id)a3;
- (void)setRepertoireCollectionView:(id)a3;
@end

@implementation RepertoireView

- (RepertoireView)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)RepertoireView;
  v3 = [(RepertoireView *)&v6 initWithCoder:a3];
  v4 = v3;
  if (v3) {
    [(RepertoireView *)v3 commonInit];
  }
  return v4;
}

- (RepertoireView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)RepertoireView;
  v3 = -[RepertoireView initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(RepertoireView *)v3 commonInit];
  }
  return v4;
}

- (void)commonInit
{
  v3 = +[UIColor systemBackgroundColor];
  [(RepertoireView *)self setBackgroundColor:v3];

  id v4 = objc_alloc((Class)UICollectionView);
  [(RepertoireView *)self bounds];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  id v13 = objc_alloc_init((Class)UICollectionViewFlowLayout);
  v14 = (UICollectionView *)objc_msgSend(v4, "initWithFrame:collectionViewLayout:", v13, v6, v8, v10, v12);
  repertoireCollectionView = self->_repertoireCollectionView;
  self->_repertoireCollectionView = v14;

  v16 = +[UIColor systemBackgroundColor];
  [(UICollectionView *)self->_repertoireCollectionView setBackgroundColor:v16];

  [(UICollectionView *)self->_repertoireCollectionView setDelegate:self];
  [(UICollectionView *)self->_repertoireCollectionView setDataSource:self];
  [(UICollectionView *)self->_repertoireCollectionView setAllowsSelection:0];
  [(UICollectionView *)self->_repertoireCollectionView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UICollectionView *)self->_repertoireCollectionView registerClass:objc_opt_class() forCellWithReuseIdentifier:@"repertoireCell"];
  [(RepertoireView *)self addSubview:self->_repertoireCollectionView];
  v17 = [(RepertoireView *)self font];
  [v17 pointSize];
  double v19 = floor(v18 * 0.5);

  -[UICollectionView setContentInset:](self->_repertoireCollectionView, "setContentInset:", v19, v19, 0.0, v19);
  v20 = [(RepertoireView *)self topAnchor];
  v21 = [(UICollectionView *)self->_repertoireCollectionView topAnchor];
  v22 = [v20 constraintEqualToAnchor:v21];
  [v22 setActive:1];

  v23 = [(RepertoireView *)self leadingAnchor];
  v24 = [(UICollectionView *)self->_repertoireCollectionView leadingAnchor];
  v25 = [v23 constraintEqualToAnchor:v24];
  [v25 setActive:1];

  v26 = [(RepertoireView *)self trailingAnchor];
  v27 = [(UICollectionView *)self->_repertoireCollectionView trailingAnchor];
  v28 = [v26 constraintEqualToAnchor:v27];
  [v28 setActive:1];

  v29 = [(RepertoireView *)self bottomAnchor];
  v30 = [(UICollectionView *)self->_repertoireCollectionView bottomAnchor];
  v31 = [v29 constraintEqualToAnchor:v30];
  [v31 setActive:1];

  [(RepertoireView *)self reloadRepertoire];
}

- (RepertoireView)initWithFrame:(CGRect)a3 font:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(RepertoireView *)self setFont:a4];

  return -[RepertoireView initWithFrame:](self, "initWithFrame:", x, y, width, height);
}

- (void)setFont:(id)a3
{
  objc_storeStrong((id *)&self->_font, a3);

  [(RepertoireView *)self reloadRepertoire];
}

- (void)reloadRepertoire
{
  v3 = [(RepertoireView *)self repertoireCollectionView];
  [v3 reloadData];

  id v4 = [(RepertoireView *)self repertoireCollectionView];
  double v5 = [(RepertoireView *)self flowLayout];
  [v4 setCollectionViewLayout:v5];

  double v6 = [(RepertoireView *)self repertoireCollectionView];
  [v6 setNeedsLayout];

  double v7 = [(RepertoireView *)self repertoireCollectionView];
  [v7 setNeedsDisplay];

  double v8 = [(RepertoireView *)self repertoireCollectionView];
  id v11 = [v8 indexPathsForVisibleItems];

  if (v11 && [v11 count])
  {
    double v9 = [(RepertoireView *)self repertoireCollectionView];
    double v10 = [v11 objectAtIndexedSubscript:0];
    [v9 scrollToItemAtIndexPath:v10 atScrollPosition:1 animated:0];
  }
}

- (id)flowLayout
{
  font = self->_font;
  if (font)
  {
    double Leading = CTFontGetLeading((CTFontRef)self->_font);
    double v4 = Leading + CTFontGetAscent((CTFontRef)font);
    float v5 = (v4 + CTFontGetDescent((CTFontRef)font)) * 1.3;
    double v6 = ceilf(v5);
  }
  else
  {
    double v6 = 40.0;
  }
  id v7 = objc_alloc_init((Class)UICollectionViewFlowLayout);
  [v7 setMinimumInteritemSpacing:0.0];
  objc_msgSend(v7, "setItemSize:", v6, v6);

  return v7;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  int64_t result = (int64_t)self->_font;
  if (result) {
    return CTFontGetGlyphCount((CTFontRef)result);
  }
  return result;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = [a3 dequeueReusableCellWithReuseIdentifier:@"repertoireCell" forIndexPath:v6];
  [v7 setFont:self->_font];
  LOWORD(self) = (unsigned __int16)[v6 item];

  [v7 setGid:(unsigned __int16)self];

  return v7;
}

- (UIFont)font
{
  return self->_font;
}

- (UICollectionView)repertoireCollectionView
{
  return self->_repertoireCollectionView;
}

- (void)setRepertoireCollectionView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_repertoireCollectionView, 0);

  objc_storeStrong((id *)&self->_font, 0);
}

@end
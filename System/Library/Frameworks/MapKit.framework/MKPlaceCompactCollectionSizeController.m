@interface MKPlaceCompactCollectionSizeController
- ($0AC6E346AE4835514AAA8AC86D8F4844)configuration;
- (CGSize)sizeForCollectionWithMaxCollectionsWidth:(double)a3;
- (MKPlaceCompactCollectionSizeController)initWithCollectionsConfiguration:(id)a3 usingTraitCollections:(id)a4 inContext:(int64_t)a5;
- (MKPlaceCompactCollectionSizeController)initWithDefaultCollectionsConfigurationUsingTraitCollections:(id)a3 inContext:(int64_t)a4;
- (UIEdgeInsets)sectionInset;
- (double)defaultCompactCollectionHeight;
- (double)defaultCompactCollectionWidth;
- (double)minimumInterItemSpacing;
- (int64_t)context;
- (void)setConfiguration:(id)a3;
- (void)setContext:(int64_t)a3;
- (void)setDefaultCompactCollectionHeight:(double)a3;
- (void)setDefaultCompactCollectionWidth:(double)a3;
- (void)setSectionInset:(UIEdgeInsets)a3;
@end

@implementation MKPlaceCompactCollectionSizeController

- (MKPlaceCompactCollectionSizeController)initWithDefaultCollectionsConfigurationUsingTraitCollections:(id)a3 inContext:(int64_t)a4
{
  return -[MKPlaceCompactCollectionSizeController initWithCollectionsConfiguration:usingTraitCollections:inContext:](self, "initWithCollectionsConfiguration:usingTraitCollections:inContext:", 1, 1, a3, a4);
}

- (MKPlaceCompactCollectionSizeController)initWithCollectionsConfiguration:(id)a3 usingTraitCollections:(id)a4 inContext:(int64_t)a5
{
  int64_t var1 = a3.var1;
  int64_t var0 = a3.var0;
  v16.receiver = self;
  v16.super_class = (Class)MKPlaceCompactCollectionSizeController;
  v8 = [(MKPlaceCompactCollectionSizeController *)&v16 init];
  v9 = v8;
  if (v8)
  {
    v8->_configuration.displayStyle = var0;
    v8->_configuration.collectionsPerRow = var1;
    double v10 = 6.0;
    v8->_context = a5;
    switch(a5)
    {
      case 0:
        double v11 = 16.0;
        double v14 = 10.0;
        double v12 = 166.0;
        double v13 = 114.0;
        goto LABEL_8;
      case 2:
        double v11 = 16.0;
        double v14 = 30.0;
        double v12 = 150.0;
        double v13 = 200.0;
        goto LABEL_8;
      case 1:
        double v11 = 16.0;
        double v10 = 0.0;
        double v12 = 150.0;
        double v13 = 200.0;
        double v14 = 0.0;
LABEL_8:
        [(MKPlaceCompactCollectionSizeController *)v8 setDefaultCompactCollectionHeight:v13];
        [(MKPlaceCompactCollectionSizeController *)v9 setDefaultCompactCollectionWidth:v12];
        -[MKPlaceCompactCollectionSizeController setSectionInset:](v9, "setSectionInset:", v10, v11, v14, v11);
        break;
    }
  }
  return v9;
}

- (CGSize)sizeForCollectionWithMaxCollectionsWidth:(double)a3
{
  [(MKPlaceCompactCollectionSizeController *)self sectionInset];
  double v7 = v6;
  [(MKPlaceCompactCollectionSizeController *)self sectionInset];
  double v9 = v8;
  [(MKPlaceCompactCollectionSizeController *)self configuration];
  uint64_t v11 = v10;
  uint64_t v12 = [(MKPlaceCompactCollectionSizeController *)self configuration];
  if (v12 == 1)
  {
    [(MKPlaceCompactCollectionSizeController *)self defaultCompactCollectionWidth];
    double v3 = v16;
    [(MKPlaceCompactCollectionSizeController *)self defaultCompactCollectionHeight];
    double v13 = v17;
  }
  else if (!v12)
  {
    double v14 = a3 - (v7 + v9) * (double)(v11 - 1);
    [(MKPlaceCompactCollectionSizeController *)self configuration];
    double v3 = v14 / (double)v15;
    double v13 = ceil(v14 * 0.3) + 10.0;
  }
  double v18 = v3;
  result.height = v13;
  result.width = v18;
  return result;
}

- (double)minimumInterItemSpacing
{
  return 10.0;
}

- (UIEdgeInsets)sectionInset
{
  double top = self->_sectionInset.top;
  double left = self->_sectionInset.left;
  double bottom = self->_sectionInset.bottom;
  double right = self->_sectionInset.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setSectionInset:(UIEdgeInsets)a3
{
  self->_sectionInset = a3;
}

- (int64_t)context
{
  return self->_context;
}

- (void)setContext:(int64_t)a3
{
  self->_context = a3;
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)configuration
{
  int64_t collectionsPerRow = self->_configuration.collectionsPerRow;
  int64_t displayStyle = self->_configuration.displayStyle;
  result.int64_t var1 = collectionsPerRow;
  result.int64_t var0 = displayStyle;
  return result;
}

- (void)setConfiguration:(id)a3
{
  self->_configuration = ($6D52D4259129B2917F58F12EE7EDADA3)a3;
}

- (double)defaultCompactCollectionHeight
{
  return self->_defaultCompactCollectionHeight;
}

- (void)setDefaultCompactCollectionHeight:(double)a3
{
  self->_defaultCompactCollectionHeight = a3;
}

- (double)defaultCompactCollectionWidth
{
  return self->_defaultCompactCollectionWidth;
}

- (void)setDefaultCompactCollectionWidth:(double)a3
{
  self->_defaultCompactCollectionWidth = a3;
}

@end
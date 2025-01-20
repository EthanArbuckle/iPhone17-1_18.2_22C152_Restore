@interface MKPlaceCollectionsSizeController
- ($0AC6E346AE4835514AAA8AC86D8F4844)collectionsConfiguration;
- (BOOL)isMarzipan;
- (BOOL)isSingleCollection;
- (CGSize)sizeForCollectionWithMaxCollectionsWidth:(double)a3;
- (MKPlaceCollectionsSizeController)initWithCollectionsConfiguration:(id)a3 isSingleCollection:(BOOL)a4 usingTraitCollections:(id)a5 inContext:(int64_t)a6;
- (MKPlaceCollectionsSizeController)initWithDefaultCollectionsConfigurationUsingTraitCollections:(id)a3 inContext:(int64_t)a4;
- (UIEdgeInsets)sectionInset;
- (double)defaultCollectionHeight;
- (double)defaultCollectionWidth;
- (double)minimumInterItemSpacing;
- (void)setCollectionsConfiguration:(id)a3;
- (void)setDefaultCollectionHeight:(double)a3;
- (void)setDefaultCollectionWidth:(double)a3;
- (void)setIsMarzipan:(BOOL)a3;
- (void)setIsSingleCollection:(BOOL)a3;
- (void)setSectionInset:(UIEdgeInsets)a3;
@end

@implementation MKPlaceCollectionsSizeController

- (CGSize)sizeForCollectionWithMaxCollectionsWidth:(double)a3
{
  [(MKPlaceCollectionsSizeController *)self sectionInset];
  double v6 = v5;
  [(MKPlaceCollectionsSizeController *)self sectionInset];
  double v8 = v7;
  [(MKPlaceCollectionsSizeController *)self collectionsConfiguration];
  uint64_t v10 = v9;
  uint64_t v11 = [(MKPlaceCollectionsSizeController *)self collectionsConfiguration];
  if (v11 == 2)
  {
    BOOL isSingleCollection = self->_isSingleCollection;
    [(MKPlaceCollectionsSizeController *)self sectionInset];
    double v16 = v15;
    [(MKPlaceCollectionsSizeController *)self sectionInset];
    double v18 = v16 + v17;
    if (isSingleCollection)
    {
      double v6 = a3 - v18;
LABEL_10:
      [(MKPlaceCollectionsSizeController *)self defaultCollectionHeight];
      double v12 = v23;
      goto LABEL_13;
    }
    [(MKPlaceCollectionsSizeController *)self collectionsConfiguration];
    double v25 = (double)(v24 - 1);
    [(MKPlaceCollectionsSizeController *)self minimumInterItemSpacing];
    double v19 = a3 - (v18 + v25 * v26);
    [(MKPlaceCollectionsSizeController *)self collectionsConfiguration];
    double v6 = v19 / (double)v27;
    double v21 = 0.65;
LABEL_12:
    double v12 = ceil(v19 * v21) + 10.0;
    goto LABEL_13;
  }
  double v12 = (double)v10;
  double v13 = (v6 + v8) * (double)v10;
  if (v11 == 1)
  {
    double v19 = a3 - v13;
    [(MKPlaceCollectionsSizeController *)self collectionsConfiguration];
    double v6 = v19 / (double)v20;
    double v21 = 0.524781341;
    goto LABEL_12;
  }
  if (!v11)
  {
    if (self->_isSingleCollection)
    {
      double v6 = a3 - v13;
    }
    else
    {
      [(MKPlaceCollectionsSizeController *)self defaultCollectionWidth];
      double v6 = v22;
    }
    goto LABEL_10;
  }
LABEL_13:
  double v28 = v6;
  result.height = v12;
  result.width = v28;
  return result;
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

- ($0AC6E346AE4835514AAA8AC86D8F4844)collectionsConfiguration
{
  int64_t collectionsPerRow = self->_collectionsConfiguration.collectionsPerRow;
  int64_t displayStyle = self->_collectionsConfiguration.displayStyle;
  result.var1 = collectionsPerRow;
  result.var0 = displayStyle;
  return result;
}

- (double)defaultCollectionWidth
{
  return self->_defaultCollectionWidth;
}

- (double)defaultCollectionHeight
{
  return self->_defaultCollectionHeight;
}

- (double)minimumInterItemSpacing
{
  BOOL v2 = [(MKPlaceCollectionsSizeController *)self isMarzipan];
  double result = 10.0;
  if (v2) {
    return 8.0;
  }
  return result;
}

- (BOOL)isMarzipan
{
  return self->_isMarzipan;
}

- (MKPlaceCollectionsSizeController)initWithCollectionsConfiguration:(id)a3 isSingleCollection:(BOOL)a4 usingTraitCollections:(id)a5 inContext:(int64_t)a6
{
  BOOL v7 = a4;
  int64_t var1 = a3.var1;
  int64_t var0 = a3.var0;
  id v11 = a5;
  v20.receiver = self;
  v20.super_class = (Class)MKPlaceCollectionsSizeController;
  double v12 = [(MKPlaceCollectionsSizeController *)&v20 init];
  double v13 = v12;
  if (!v12) {
    goto LABEL_13;
  }
  v12->_collectionsConfiguration.int64_t displayStyle = var0;
  v12->_collectionsConfiguration.int64_t collectionsPerRow = var1;
  v12->_BOOL isSingleCollection = v7;
  v14 = [v11 traitCollection];
  v13->_isMarzipan = [v14 userInterfaceIdiom] == 5;

  if ((unint64_t)(var0 - 1) >= 2)
  {
    if (var0) {
      goto LABEL_9;
    }
    double v15 = 12.0;
    switch(a6)
    {
      case 1:
        double v15 = 0.0;
        break;
      case 3:
        if ((MapsFeature_IsEnabled_Maps269() & 1) == 0) {
          goto LABEL_16;
        }
        goto LABEL_15;
      case 4:
        break;
      case 6:
        double v15 = *MEMORY[0x1E4F437F8];
        break;
      case 7:
LABEL_15:
        double v15 = 0.0;
        break;
      case 8:
        double v15 = 6.0;
        break;
      default:
LABEL_16:
        double v15 = 10.0;
        break;
    }
  }
  else
  {
    double v15 = 8.0;
    if (!v13->_isMarzipan) {
      double v15 = 16.0;
    }
  }
  [(MKPlaceCollectionsSizeController *)v13 setSectionInset:v15];
LABEL_9:
  int IsEnabled_Maps269 = MapsFeature_IsEnabled_Maps269();
  double v17 = 244.0;
  if (IsEnabled_Maps269 ^ 1 | v7)
  {
    double v17 = 180.0;
    double v18 = 280.0;
  }
  else
  {
    double v18 = 192.0;
  }
  [(MKPlaceCollectionsSizeController *)v13 setDefaultCollectionHeight:v17];
  [(MKPlaceCollectionsSizeController *)v13 setDefaultCollectionWidth:v18];
LABEL_13:

  return v13;
}

- (void)setSectionInset:(UIEdgeInsets)a3
{
  self->_sectionInset = a3;
}

- (void)setDefaultCollectionWidth:(double)a3
{
  self->_defaultCollectionWidth = a3;
}

- (void)setDefaultCollectionHeight:(double)a3
{
  self->_defaultCollectionHeight = a3;
}

- (MKPlaceCollectionsSizeController)initWithDefaultCollectionsConfigurationUsingTraitCollections:(id)a3 inContext:(int64_t)a4
{
  return -[MKPlaceCollectionsSizeController initWithCollectionsConfiguration:isSingleCollection:usingTraitCollections:inContext:](self, "initWithCollectionsConfiguration:isSingleCollection:usingTraitCollections:inContext:", 1, 1, 0, a3, a4);
}

- (void)setCollectionsConfiguration:(id)a3
{
  self->_collectionsConfiguration = ($6D52D4259129B2917F58F12EE7EDADA3)a3;
}

- (BOOL)isSingleCollection
{
  return self->_isSingleCollection;
}

- (void)setIsSingleCollection:(BOOL)a3
{
  self->_BOOL isSingleCollection = a3;
}

- (void)setIsMarzipan:(BOOL)a3
{
  self->_isMarzipan = a3;
}

@end
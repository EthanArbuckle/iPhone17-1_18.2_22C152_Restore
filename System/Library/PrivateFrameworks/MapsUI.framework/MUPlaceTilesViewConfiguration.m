@interface MUPlaceTilesViewConfiguration
+ (id)annotatedListConfiguration;
+ (id)configurationFromModuleConfiguration:(id)a3;
+ (id)hikingTrailsConfiguration;
- (BOOL)isVertical;
- (MUPlaceTileCellConfiguration)cellConfiguration;
- (MUPlaceTilesViewConfiguration)init;
- (unint64_t)numberOfRows;
- (void)setNumberOfRows:(unint64_t)a3;
- (void)setVertical:(BOOL)a3;
@end

@implementation MUPlaceTilesViewConfiguration

- (MUPlaceTilesViewConfiguration)init
{
  v6.receiver = self;
  v6.super_class = (Class)MUPlaceTilesViewConfiguration;
  v2 = [(MUPlaceTilesViewConfiguration *)&v6 init];
  if (v2)
  {
    v3 = objc_alloc_init(MUPlaceTileCellConfiguration);
    cellConfiguration = v2->_cellConfiguration;
    v2->_cellConfiguration = v3;

    [(MUPlaceTileCellConfiguration *)v2->_cellConfiguration setShowIcon:1];
    [(MUPlaceTileCellConfiguration *)v2->_cellConfiguration setShowCuratedPhoto:1];
    v2->_numberOfRows = 1;
  }
  return v2;
}

+ (id)annotatedListConfiguration
{
  v2 = objc_alloc_init(MUPlaceTilesViewConfiguration);
  [(MUPlaceTilesViewConfiguration *)v2 setVertical:0];
  v3 = [(MUPlaceTilesViewConfiguration *)v2 cellConfiguration];
  [v3 setShowIcon:0];
  [v3 setShowCuratedPhoto:1];
  [v3 setVariant:0];

  return v2;
}

+ (id)hikingTrailsConfiguration
{
  v2 = objc_alloc_init(MUPlaceTilesViewConfiguration);
  [(MUPlaceTilesViewConfiguration *)v2 setVertical:0];
  v3 = [(MUPlaceTilesViewConfiguration *)v2 cellConfiguration];
  [v3 setShowIcon:0];
  [v3 setShowCuratedPhoto:1];
  [v3 setVariant:0];

  return v2;
}

+ (id)configurationFromModuleConfiguration:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(MUPlaceTilesViewConfiguration);
  v5 = v4;
  if (v3)
  {
    objc_super v6 = [(MUPlaceTilesViewConfiguration *)v4 cellConfiguration];
    int v7 = [v3 layoutVariant];
    uint64_t v8 = 0;
    uint64_t v9 = 1;
    uint64_t v10 = 1;
    switch(v7)
    {
      case 0:
      case 2:
        goto LABEL_8;
      case 1:
        uint64_t v9 = 0;
        uint64_t v8 = 0;
        goto LABEL_8;
      case 3:
        uint64_t v10 = 0;
        uint64_t v9 = 1;
        goto LABEL_7;
      case 4:
        uint64_t v9 = 0;
        uint64_t v10 = 0;
LABEL_7:
        uint64_t v8 = 1;
LABEL_8:
        [v6 setShowIcon:v9];
        [v6 setShowCuratedPhoto:v10];
        [v6 setVariant:v8];
        break;
      default:
        break;
    }
    if (objc_msgSend(v3, "isVertical", v9)) {
      [v6 setVariant:2];
    }
    -[MUPlaceTilesViewConfiguration setVertical:](v5, "setVertical:", [v3 isVertical]);
    -[MUPlaceTilesViewConfiguration setNumberOfRows:](v5, "setNumberOfRows:", [v3 numberOfRows]);
  }
  else
  {
    [(MUPlaceTilesViewConfiguration *)v4 setVertical:0];
    objc_super v6 = [(MUPlaceTilesViewConfiguration *)v5 cellConfiguration];
    [v6 setShowIcon:1];
    [v6 setShowCuratedPhoto:1];
    [v6 setVariant:0];
  }

  return v5;
}

- (MUPlaceTileCellConfiguration)cellConfiguration
{
  return self->_cellConfiguration;
}

- (BOOL)isVertical
{
  return self->_vertical;
}

- (void)setVertical:(BOOL)a3
{
  self->_vertical = a3;
}

- (unint64_t)numberOfRows
{
  return self->_numberOfRows;
}

- (void)setNumberOfRows:(unint64_t)a3
{
  self->_numberOfRows = a3;
}

- (void).cxx_destruct
{
}

@end
@interface PKDataDetectorView
- (NSArray)allItems;
- (NSDictionary)dataDetectorContext;
- (PKDataDetectorItem)dataDetectorItem;
- (PKDataDetectorView)initWithDataDetectorItem:(id)a3 allItems:(id)a4;
- (double)_underlineThickness;
- (id)accessibilityIdentifier;
- (id)accessibilityValue;
- (id)contextMenuInteraction:(id)a3 configuration:(id)a4 highlightPreviewForItemWithIdentifier:(id)a5;
- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4;
- (id)dataDetectorItemAllItems:(id)a3;
- (id)item;
- (void)contextMenuInteraction:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4 animator:(id)a5;
- (void)setAllItems:(id)a3;
- (void)setDataDetectorContext:(id)a3;
- (void)setDataDetectorItem:(id)a3;
- (void)tapHandler:(id)a3;
@end

@implementation PKDataDetectorView

- (PKDataDetectorView)initWithDataDetectorItem:(id)a3 allItems:(id)a4
{
  v6 = (PKDataDetectorItem *)a3;
  v14.receiver = self;
  v14.super_class = (Class)PKDataDetectorView;
  id v7 = a4;
  v8 = [(PKDetectionView *)&v14 init];
  dataDetectorItem = v8->_dataDetectorItem;
  v8->_dataDetectorItem = v6;
  v10 = v6;

  -[PKDataDetectorItem setDelegate:](v8->_dataDetectorItem, "setDelegate:", v8, v14.receiver, v14.super_class);
  uint64_t v11 = [v7 copy];

  allItems = v8->_allItems;
  v8->_allItems = (NSArray *)v11;

  return v8;
}

- (id)item
{
  return self->_dataDetectorItem;
}

- (id)dataDetectorItemAllItems:(id)a3
{
  return self->_allItems;
}

- (double)_underlineThickness
{
  v3 = [(PKDataDetectorView *)self item];
  v4 = [v3 strokeColor];
  if (v4)
  {
    v8.receiver = self;
    v8.super_class = (Class)PKDataDetectorView;
    [(PKDetectionView *)&v8 _underlineThickness];
    double v6 = v5;
  }
  else
  {
    double v6 = 1.0;
  }

  return v6;
}

- (id)accessibilityIdentifier
{
  return @"com.apple.pencilkit.dataDetectorView";
}

- (id)accessibilityValue
{
  v2 = [(PKDataDetectorItem *)self->_dataDetectorItem scannerResult];
  v3 = [v2 value];

  return v3;
}

- (void)tapHandler:(id)a3
{
  [a3 locationInView:self];
  double v5 = v4;
  double v7 = v6;
  if (-[PKDetectionView hitTest:](self, "hitTest:"))
  {
    objc_super v8 = +[PKStatisticsManager sharedStatisticsManager]();
    v9 = [(PKDataDetectorView *)self dataDetectorItem];
    -[PKStatisticsManager recordDataDetectorItemDefaultAction:]((uint64_t)v8, v9);

    v10 = [(PKDataDetectorView *)self item];
    uint64_t v11 = [(PKDetectionView *)self menuInteraction];
    [(PKDetectionView *)self drawingTransform];
    long long v12 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    v13[0] = *MEMORY[0x1E4F1DAB8];
    v13[1] = v12;
    v13[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    objc_msgSend(v10, "handleTapForMenuForInteraction:location:view:viewTransform:drawingTransform:", v11, self, v13, v14, v5, v7);
  }
}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  id v7 = a3;
  if (-[PKDetectionView hitTest:](self, "hitTest:", x, y))
  {
    objc_super v8 = +[PKStatisticsManager sharedStatisticsManager]();
    -[PKStatisticsManager recordDataDetectorItemMenuAction:]((uint64_t)v8, self->_dataDetectorItem);

    v9 = [(PKDataDetectorView *)self dataDetectorItem];
    v10 = [(PKDetectionItem *)self->_dataDetectorItem identifier];
    uint64_t v11 = objc_msgSend(v9, "contextMenuInteraction:configurationForMenuAtLocation:view:identifier:", v7, self, v10, x, y);
  }
  else
  {
    uint64_t v11 = 0;
  }

  return v11;
}

- (id)contextMenuInteraction:(id)a3 configuration:(id)a4 highlightPreviewForItemWithIdentifier:(id)a5
{
  id v7 = a4;
  id v8 = a3;
  v9 = [(PKDataDetectorView *)self dataDetectorItem];
  v10 = [(PKDataDetectorView *)self superview];
  [(PKDataDetectorView *)self frame];
  uint64_t v11 = objc_msgSend(v9, "contextMenuInteraction:configuration:highlightPreviewInContainerView:frame:", v8, v7, v10);

  return v11;
}

- (void)contextMenuInteraction:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4 animator:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(PKDataDetectorView *)self dataDetectorItem];
  [v11 contextMenuInteraction:v10 willPerformPreviewActionForMenuWithConfiguration:v9 animator:v8];
}

- (PKDataDetectorItem)dataDetectorItem
{
  return self->_dataDetectorItem;
}

- (void)setDataDetectorItem:(id)a3
{
}

- (NSArray)allItems
{
  return self->_allItems;
}

- (void)setAllItems:(id)a3
{
}

- (NSDictionary)dataDetectorContext
{
  return self->_dataDetectorContext;
}

- (void)setDataDetectorContext:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataDetectorContext, 0);
  objc_storeStrong((id *)&self->_allItems, 0);

  objc_storeStrong((id *)&self->_dataDetectorItem, 0);
}

@end
@interface ICDocCamExtractedThumbnailContainerView
- (BOOL)isAccessibilityElement;
- (BOOL)orderNextForAccessibility:(id)a3;
- (BOOL)orderPreviousForAccessibility:(id)a3;
- (ICDocCamExtractedThumbnailContainerViewDelegate)delegate;
- (id)accessibilityCustomActions;
- (id)accessibilityElements;
- (id)accessibilityHint;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
- (void)accessibilityDecrement;
- (void)accessibilityIncrement;
- (void)setDelegate:(id)a3;
@end

@implementation ICDocCamExtractedThumbnailContainerView

- (BOOL)isAccessibilityElement
{
  v2 = self;
  v3 = [(ICDocCamExtractedThumbnailContainerView *)self delegate];
  LOBYTE(v2) = [v3 thumbnailContainerViewIsVisible:v2];

  return (char)v2;
}

- (id)accessibilityLabel
{
  return +[DCLocalization localizedStringForKey:@"Scan thumbnails" value:@"Scan thumbnails" table:@"Localizable"];
}

- (id)accessibilityHint
{
  v2 = self;
  v3 = [(ICDocCamExtractedThumbnailContainerView *)self delegate];
  LODWORD(v2) = [v3 thumbnailContainerViewSupportsReordering:v2];

  if (v2)
  {
    v4 = +[DCLocalization localizedStringForKey:@"Double-tap and drag to reorder current scan" value:@"Double-tap and drag to reorder current scan" table:@"Localizable"];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)accessibilityValue
{
  v3 = [(ICDocCamExtractedThumbnailContainerView *)self delegate];
  uint64_t v4 = [v3 thumbnailContainerViewCurrentIndex:self];

  v5 = [(ICDocCamExtractedThumbnailContainerView *)self delegate];
  uint64_t v6 = [v5 thumbnailContainerViewNumberOfItems:self];

  v7 = +[DCLocalization localizedStringForKey:@"Scan %lu of %lu" value:@"Scan %lu of %lu" table:@"Localizable"];
  v8 = objc_msgSend(NSString, "localizedStringWithFormat:", v7, v4 + 1, v6);

  return v8;
}

- (id)accessibilityElements
{
  return 0;
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)ICDocCamExtractedThumbnailContainerView;
  return *MEMORY[0x263F1CED8] | [(ICDocCamExtractedThumbnailContainerView *)&v3 accessibilityTraits];
}

- (void)accessibilityIncrement
{
  id v3 = [(ICDocCamExtractedThumbnailContainerView *)self delegate];
  [v3 thumbnailContainerViewIncrementCurrentIndex:self];
}

- (void)accessibilityDecrement
{
  id v3 = [(ICDocCamExtractedThumbnailContainerView *)self delegate];
  [v3 thumbnailContainerViewDecrementCurrentIndex:self];
}

- (id)accessibilityCustomActions
{
  id v3 = [MEMORY[0x263EFF980] array];
  uint64_t v4 = [(ICDocCamExtractedThumbnailContainerView *)self delegate];
  int v5 = [v4 thumbnailContainerViewSupportsReordering:self];

  if (v5)
  {
    uint64_t v6 = [(ICDocCamExtractedThumbnailContainerView *)self delegate];
    unint64_t v7 = [v6 thumbnailContainerViewCurrentIndex:self];

    v8 = [(ICDocCamExtractedThumbnailContainerView *)self delegate];
    uint64_t v9 = [v8 thumbnailContainerViewNumberOfItems:self];

    if (v7 < v9 - 1)
    {
      v10 = +[DCLocalization localizedStringForKey:@"Order Next" value:@"Order Next" table:@"Localizable"];
      v11 = (void *)[objc_alloc(MEMORY[0x263F1C390]) initWithName:v10 target:self selector:sel_orderNextForAccessibility_];
      [v3 addObject:v11];
    }
    if (v7)
    {
      v12 = +[DCLocalization localizedStringForKey:@"Order Previous" value:@"Order Previous" table:@"Localizable"];
      v13 = (void *)[objc_alloc(MEMORY[0x263F1C390]) initWithName:v12 target:self selector:sel_orderPreviousForAccessibility_];
      [v3 addObject:v13];
    }
  }
  v14 = (void *)[v3 copy];

  return v14;
}

- (BOOL)orderPreviousForAccessibility:(id)a3
{
  uint64_t v4 = [(ICDocCamExtractedThumbnailContainerView *)self delegate];
  uint64_t v5 = [v4 thumbnailContainerViewCurrentIndex:self];

  if (v5)
  {
    uint64_t v6 = [(ICDocCamExtractedThumbnailContainerView *)self delegate];
    [v6 thumbnailContainerView:self moveItemFromIndex:v5 toIndex:v5 - 1];
  }
  return v5 != 0;
}

- (BOOL)orderNextForAccessibility:(id)a3
{
  uint64_t v4 = [(ICDocCamExtractedThumbnailContainerView *)self delegate];
  unint64_t v5 = [v4 thumbnailContainerViewCurrentIndex:self];

  uint64_t v6 = [(ICDocCamExtractedThumbnailContainerView *)self delegate];
  uint64_t v7 = [v6 thumbnailContainerViewNumberOfItems:self];

  unint64_t v8 = v7 - 1;
  if (v5 < v8)
  {
    uint64_t v9 = [(ICDocCamExtractedThumbnailContainerView *)self delegate];
    [v9 thumbnailContainerView:self moveItemFromIndex:v5 toIndex:v5 + 1];
  }
  return v5 < v8;
}

- (ICDocCamExtractedThumbnailContainerViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (ICDocCamExtractedThumbnailContainerViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
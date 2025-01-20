@interface WKExtrinsicButton
- (CGSize)extrinsicContentSize;
- (CGSize)intrinsicContentSize;
- (WKExtrinsicButtonDelegate)delegate;
- (void)contextMenuInteraction:(id)a3 willDisplayMenuForConfiguration:(id)a4 animator:(id)a5;
- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5;
- (void)setDelegate:(id)a3;
- (void)setExtrinsicContentSize:(CGSize)a3;
@end

@implementation WKExtrinsicButton

- (void)setExtrinsicContentSize:(CGSize)a3
{
  self->_extrinsicContentSize = a3;
  [(WKExtrinsicButton *)self invalidateIntrinsicContentSize];
}

- (CGSize)intrinsicContentSize
{
  double width = self->_extrinsicContentSize.width;
  double height = self->_extrinsicContentSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)contextMenuInteraction:(id)a3 willDisplayMenuForConfiguration:(id)a4 animator:(id)a5
{
  v6.receiver = self;
  v6.super_class = (Class)WKExtrinsicButton;
  [(WKExtrinsicButton *)&v6 contextMenuInteraction:a3 willDisplayMenuForConfiguration:a4 animator:a5];
  [objc_loadWeak((id *)&self->_delegate) wkExtrinsicButtonWillDisplayMenu:self];
}

- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5
{
  v6.receiver = self;
  v6.super_class = (Class)WKExtrinsicButton;
  [(WKExtrinsicButton *)&v6 contextMenuInteraction:a3 willEndForConfiguration:a4 animator:a5];
  [objc_loadWeak((id *)&self->_delegate) wkExtrinsicButtonWillDismissMenu:self];
}

- (CGSize)extrinsicContentSize
{
  double width = self->_extrinsicContentSize.width;
  double height = self->_extrinsicContentSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (WKExtrinsicButtonDelegate)delegate
{
  return (WKExtrinsicButtonDelegate *)objc_loadWeak((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
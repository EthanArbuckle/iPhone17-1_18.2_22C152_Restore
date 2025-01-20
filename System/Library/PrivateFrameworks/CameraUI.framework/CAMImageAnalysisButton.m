@interface CAMImageAnalysisButton
- (BOOL)isContextMenuDisplayed;
- (CAMImageAnalysisButtonDelegate)delegate;
- (void)_setContextMenuDisplayed:(BOOL)a3;
- (void)contextMenuInteraction:(id)a3 willDisplayMenuForConfiguration:(id)a4 animator:(id)a5;
- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5;
- (void)setDelegate:(id)a3;
@end

@implementation CAMImageAnalysisButton

- (void)contextMenuInteraction:(id)a3 willDisplayMenuForConfiguration:(id)a4 animator:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  [(CAMImageAnalysisButton *)self _setContextMenuDisplayed:1];
  v11.receiver = self;
  v11.super_class = (Class)CAMImageAnalysisButton;
  [(CAMImageAnalysisButton *)&v11 contextMenuInteraction:v10 willDisplayMenuForConfiguration:v9 animator:v8];
}

- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  [(CAMImageAnalysisButton *)self _setContextMenuDisplayed:0];
  v11.receiver = self;
  v11.super_class = (Class)CAMImageAnalysisButton;
  [(CAMImageAnalysisButton *)&v11 contextMenuInteraction:v10 willEndForConfiguration:v9 animator:v8];
}

- (void)_setContextMenuDisplayed:(BOOL)a3
{
  if (self->_contextMenuDisplayed != a3)
  {
    BOOL v3 = a3;
    self->_contextMenuDisplayed = a3;
    id v5 = [(CAMImageAnalysisButton *)self delegate];
    [v5 imageAnalysisButton:self didChangeContextMenuDisplayed:v3];
  }
}

- (BOOL)isContextMenuDisplayed
{
  return self->_contextMenuDisplayed;
}

- (CAMImageAnalysisButtonDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CAMImageAnalysisButtonDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
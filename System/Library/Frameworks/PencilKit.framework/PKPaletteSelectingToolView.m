@interface PKPaletteSelectingToolView
- (PKInk)ink;
- (PKPaletteInkingTool)inkTool;
- (PKPaletteSelectingToolView)initWithToolIdentifier:(id)a3 variant:(id)a4 configuration:(id)a5;
- (id)attributeViewController;
- (void)setInkColor:(id)a3;
- (void)setInkTool:(id)a3;
- (void)setInkWeight:(double)a3;
- (void)setSelected:(BOOL)a3;
@end

@implementation PKPaletteSelectingToolView

- (PKPaletteSelectingToolView)initWithToolIdentifier:(id)a3 variant:(id)a4 configuration:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  v13.receiver = self;
  v13.super_class = (Class)PKPaletteSelectingToolView;
  v9 = [(PKPaletteToolView *)&v13 initWithToolIdentifier:v7 variant:0 configuration:v8];
  if (v9)
  {
    v10 = [[PKPaletteInkingToolView alloc] initWithToolIdentifier:v7 variant:0 configuration:v8];
    inkTool = v9->_inkTool;
    v9->_inkTool = (PKPaletteInkingTool *)v10;
  }
  return v9;
}

- (void)setSelected:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PKPaletteSelectingToolView;
  [(PKPaletteToolView *)&v5 setSelected:a3];
  v4 = [MEMORY[0x1E4FB1618] blackColor];
  [(PKPaletteSelectingToolView *)self setInkColor:v4];
}

- (PKInk)ink
{
  v2 = [(PKPaletteSelectingToolView *)self inkTool];
  v3 = [v2 ink];

  return (PKInk *)v3;
}

- (void)setInkColor:(id)a3
{
  id v4 = a3;
  id v5 = [(PKPaletteSelectingToolView *)self inkTool];
  [v5 setInkColor:v4];
}

- (void)setInkWeight:(double)a3
{
  id v4 = [(PKPaletteSelectingToolView *)self inkTool];
  [v4 setInkWeight:a3];
}

- (id)attributeViewController
{
  return 0;
}

- (PKPaletteInkingTool)inkTool
{
  return self->_inkTool;
}

- (void)setInkTool:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
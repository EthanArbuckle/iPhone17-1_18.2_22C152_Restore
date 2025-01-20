@interface GKDynamicLabel
- (void)contentSizeCategoryDidChangeNotification:(id)a3;
- (void)dealloc;
- (void)didMoveToWindow;
@end

@implementation GKDynamicLabel

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)GKDynamicLabel;
  [(GKDynamicLabel *)&v4 dealloc];
}

- (void)didMoveToWindow
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  objc_super v4 = [(GKDynamicLabel *)self window];

  if (v4)
  {
    v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v5 addObserver:self selector:sel_contentSizeCategoryDidChangeNotification_ name:*MEMORY[0x1E4FB27A8] object:0];

    [(GKDynamicLabel *)self contentSizeCategoryDidChangeNotification:0];
  }
}

- (void)contentSizeCategoryDidChangeNotification:(id)a3
{
  objc_super v4 = [(GKDynamicLabel *)self font];
  v5 = [v4 fontDescriptor];
  v6 = [v5 fontAttributes];
  id v9 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4FB0948]];

  v7 = v9;
  if (v9)
  {
    v8 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:v9];
    [(GKDynamicLabel *)self setFont:v8];

    v7 = v9;
  }
}

@end
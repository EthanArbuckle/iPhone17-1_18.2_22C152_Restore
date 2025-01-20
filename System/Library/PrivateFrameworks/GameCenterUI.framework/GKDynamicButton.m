@interface GKDynamicButton
- (void)contentSizeCategoryDidChangeNotification:(id)a3;
- (void)dealloc;
- (void)didMoveToWindow;
- (void)layoutSubviews;
@end

@implementation GKDynamicButton

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)GKDynamicButton;
  [(GKDynamicButton *)&v4 dealloc];
}

- (void)didMoveToWindow
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  objc_super v4 = [(GKDynamicButton *)self window];

  if (v4)
  {
    v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v5 addObserver:self selector:sel_contentSizeCategoryDidChangeNotification_ name:*MEMORY[0x1E4FB27A8] object:0];

    [(GKDynamicButton *)self contentSizeCategoryDidChangeNotification:0];
  }
}

- (void)contentSizeCategoryDidChangeNotification:(id)a3
{
  objc_super v4 = [(GKDynamicButton *)self titleLabel];
  v5 = [v4 font];
  v6 = [v5 fontDescriptor];
  v7 = [v6 fontAttributes];
  id v11 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4FB0948]];

  v8 = v11;
  if (v11)
  {
    v9 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:v11];
    v10 = [(GKDynamicButton *)self titleLabel];
    [v10 setFont:v9];

    v8 = v11;
  }
}

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)GKDynamicButton;
  [(GKDynamicButton *)&v5 layoutSubviews];
  v3 = (void *)MEMORY[0x1E4FB1788];
  [(GKDynamicButton *)self bounds];
  objc_super v4 = objc_msgSend(v3, "effectWithRoundedRect:cornerRadius:curve:", *MEMORY[0x1E4F39EA8]);
  [v4 setPosition:2];
  [(GKDynamicButton *)self setFocusEffect:v4];
}

@end
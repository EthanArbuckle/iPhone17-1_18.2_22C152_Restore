@interface SSSDebugScreenshotMangerView
+ (double)_fontSize;
- (CGSize)intrinsicContentSize;
- (SSSDebugScreenshotMangerView)initWithFrame:(CGRect)a3;
- (id)_labelAttributedString;
- (void)dealloc;
- (void)layoutSubviews;
@end

@implementation SSSDebugScreenshotMangerView

+ (double)_fontSize
{
  return 10.0;
}

- (SSSDebugScreenshotMangerView)initWithFrame:(CGRect)a3
{
  v12.receiver = self;
  v12.super_class = (Class)SSSDebugScreenshotMangerView;
  v3 = -[SSSDebugScreenshotMangerView initWithFrame:](&v12, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = +[UIColor darkGrayColor];
  v5 = [v4 colorWithAlphaComponent:0.5];
  [(SSSDebugScreenshotMangerView *)v3 setBackgroundColor:v5];

  v6 = (UILabel *)objc_alloc_init((Class)UILabel);
  debugLabel = v3->_debugLabel;
  v3->_debugLabel = v6;

  [(UILabel *)v3->_debugLabel setNumberOfLines:0];
  v8 = v3->_debugLabel;
  [(id)objc_opt_class() _fontSize];
  v9 = +[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:");
  [(UILabel *)v8 setFont:v9];

  [(SSSDebugScreenshotMangerView *)v3 addSubview:v3->_debugLabel];
  v10 = +[NSNotificationCenter defaultCenter];
  [v10 addObserver:v3 selector:"setNeedsLayout" name:@"SSSScreenshotManagerTrackingChanged" object:0];

  return v3;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)SSSDebugScreenshotMangerView;
  [(SSSDebugScreenshotMangerView *)&v4 dealloc];
}

- (CGSize)intrinsicContentSize
{
  double v2 = 250.0;
  double v3 = 250.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (id)_labelAttributedString
{
  id v2 = objc_alloc_init((Class)NSMutableAttributedString);
  double v3 = +[SSSScreenshotManager sharedScreenshotManager];
  v25 = [v3 environmentDescriptionIdentifiersBeingRemoved];

  objc_super v4 = +[SSSScreenshotManager sharedScreenshotManager];
  v24 = [v4 environmentDescriptionIdentifiersBeingSaved];

  v5 = +[SSSScreenshotManager sharedScreenshotManager];
  v23 = [v5 environmentDescriptionIdentifiersUIIsInterestedIn];

  v6 = +[SSSScreenshotManager sharedScreenshotManager];
  v7 = [v6 environmentDescriptionIdentifiersInActiveDragSession];

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  v8 = +[SSSScreenshotManager sharedScreenshotManager];
  v9 = [v8 environmentDescriptionIdentifiersBeingTracked];

  id obj = v9;
  id v10 = [v9 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v27;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v27 != v12) {
          objc_enumerationMutation(obj);
        }
        v14 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        id v15 = [objc_alloc((Class)NSMutableAttributedString) initWithString:v14];
        v16 = +[NSMutableDictionary dictionary];
        if ([v25 containsObject:v14])
        {
          v17 = +[UIColor redColor];
          [v16 setValue:v17 forKey:NSForegroundColorAttributeName];
        }
        if ([v24 containsObject:v14])
        {
          v18 = +[UIColor greenColor];
          [v16 setValue:v18 forKey:NSUnderlineColorAttributeName];

          [v16 setValue:&off_10009DD10 forKey:NSUnderlineStyleAttributeName];
        }
        if ([v23 containsObject:v14])
        {
          v19 = +[UIColor blueColor];
          [v16 setValue:v19 forKey:NSBackgroundColorAttributeName];
        }
        if ([v7 containsObject:v14]) {
          [v16 setValue:&off_10009DD10 forKey:NSObliquenessAttributeName];
        }
        [v15 addAttributes:v16 range:NSMakeRange(0, [v14 length])];
        [v2 appendAttributedString:v15];
        id v20 = [objc_alloc((Class)NSAttributedString) initWithString:@"\n"];
        [v2 appendAttributedString:v20];
      }
      id v11 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v11);
  }

  return v2;
}

- (void)layoutSubviews
{
  debugLabel = self->_debugLabel;
  [(SSSDebugScreenshotMangerView *)self bounds];
  -[UILabel setFrame:](debugLabel, "setFrame:");
  objc_super v4 = self->_debugLabel;
  id v5 = [(SSSDebugScreenshotMangerView *)self _labelAttributedString];
  [(UILabel *)v4 setAttributedText:v5];
}

- (void).cxx_destruct
{
}

@end
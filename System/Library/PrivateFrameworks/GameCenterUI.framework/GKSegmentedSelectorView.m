@interface GKSegmentedSelectorView
- (BOOL)drawsUnderline;
- (GKSegmentedSelectorView)initWithFrame:(CGRect)a3;
- (NSLayoutConstraint)widthConstraint;
- (UISegmentedControl)segmentedControl;
- (id)target;
- (void)applyLayoutAttributes:(id)a3;
- (void)pinningStateChangedTo:(BOOL)a3;
- (void)prepareForReuse;
- (void)setSegmentedControl:(id)a3;
- (void)setTarget:(id)a3;
- (void)setWidthConstraint:(id)a3;
@end

@implementation GKSegmentedSelectorView

- (GKSegmentedSelectorView)initWithFrame:(CGRect)a3
{
  v33[1] = *MEMORY[0x1E4F143B8];
  v29.receiver = self;
  v29.super_class = (Class)GKSegmentedSelectorView;
  v3 = -[GKHeaderWithUnderlineView initWithFrame:](&v29, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (!v3) {
    return v3;
  }
  uint64_t v4 = [objc_alloc(MEMORY[0x1E4FB1C10]) initWithItems:&unk_1F0812700];
  segmentedControl = v3->_segmentedControl;
  v3->_segmentedControl = (UISegmentedControl *)v4;

  [(UISegmentedControl *)v3->_segmentedControl setTranslatesAutoresizingMaskIntoConstraints:0];
  v6 = [MEMORY[0x1E4F639B0] sharedPalette];
  if (GKHasSlowerGraphicsHardware_onceToken != -1) {
    dispatch_once(&GKHasSlowerGraphicsHardware_onceToken, &__block_literal_global_42);
  }
  v7 = (unsigned char *)MEMORY[0x1E4F63830];
  if ((unint64_t)GKHasSlowerGraphicsHardware_processorCount > 1)
  {
    if (*MEMORY[0x1E4F63830]) {
      goto LABEL_9;
    }
    v8 = [(GKSegmentedSelectorView *)v3 segmentedControl];
    uint64_t v30 = *MEMORY[0x1E4FB0700];
    v9 = [v6 emphasizedTextOnDarkBackgroundColor];
    v31 = v9;
    v10 = (void *)MEMORY[0x1E4F1C9E8];
    v11 = &v31;
    v12 = &v30;
  }
  else
  {
    v8 = [(GKSegmentedSelectorView *)v3 segmentedControl];
    uint64_t v32 = *MEMORY[0x1E4FB0700];
    v9 = [MEMORY[0x1E4FB1618] whiteColor];
    v33[0] = v9;
    v10 = (void *)MEMORY[0x1E4F1C9E8];
    v11 = (void **)v33;
    v12 = &v32;
  }
  v13 = [v10 dictionaryWithObjects:v11 forKeys:v12 count:1];
  [v8 setTitleTextAttributes:v13 forState:4];

LABEL_9:
  [(GKSegmentedSelectorView *)v3 addSubview:v3->_segmentedControl];
  v14 = [(GKHeaderWithUnderlineView *)v3 metrics];
  v15 = (void *)MEMORY[0x1E4F28DC8];
  v16 = v3->_segmentedControl;
  v17 = [v14 objectForKeyedSubscript:@"hairline"];
  [v17 floatValue];
  v19 = [v15 constraintWithItem:v16 attribute:10 relatedBy:0 toItem:v3 attribute:10 multiplier:1.0 constant:(float)-v18];
  [(GKSegmentedSelectorView *)v3 addConstraint:v19];

  v20 = [MEMORY[0x1E4F28DC8] constraintWithItem:v3->_segmentedControl attribute:9 relatedBy:0 toItem:v3 attribute:9 multiplier:1.0 constant:0.0];
  [(GKSegmentedSelectorView *)v3 addConstraint:v20];

  v21 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v22 = [v21 userInterfaceIdiom];

  if (v22 == 1 && (!*v7 || *MEMORY[0x1E4F63A38]))
  {
    v23 = [MEMORY[0x1E4F28DC8] constraintWithItem:v3->_segmentedControl attribute:7 relatedBy:0 toItem:0 attribute:0 multiplier:1.0 constant:664.0];
    LODWORD(v25) = 1144750080;
    [v23 setPriority:v25];
    [(GKSegmentedSelectorView *)v3 addConstraint:v23];
    v26 = [MEMORY[0x1E4F28DC8] constraintWithItem:v3->_segmentedControl attribute:7 relatedBy:-1 toItem:v3 attribute:7 multiplier:1.0 constant:-50.0];
    LODWORD(v27) = 1144750080;
    [v26 setPriority:v27];
    [(GKSegmentedSelectorView *)v3 addConstraint:v26];
  }
  else
  {
    v23 = [MEMORY[0x1E4F28DC8] constraintWithItem:v3->_segmentedControl attribute:7 relatedBy:0 toItem:v3 attribute:7 multiplier:1.0 constant:0.0];
    LODWORD(v24) = 1144750080;
    [v23 setPriority:v24];
    [(GKSegmentedSelectorView *)v3 setWidthConstraint:v23];
    [(GKSegmentedSelectorView *)v3 addConstraint:v23];
  }

  return v3;
}

- (void)applyLayoutAttributes:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GKSegmentedSelectorView;
  [(GKHeaderWithUnderlineView *)&v9 applyLayoutAttributes:v4];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    [v5 leadingMargin];
    double v7 = v6;
    [v5 trailingMargin];
    if (v7 == 0.0)
    {
      [(GKSegmentedSelectorView *)self _contentMargin];
      double v7 = v8;
    }
    if (v7 >= v8) {
      double v8 = v7;
    }
    [(NSLayoutConstraint *)self->_widthConstraint setConstant:-(v8 + v8)];
  }
}

- (BOOL)drawsUnderline
{
  return 0;
}

- (void)setTarget:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  id target = self->_target;
  if (target != v4)
  {
    id v7 = v4;
    if (target)
    {
      id v4 = (id)[(UISegmentedControl *)self->_segmentedControl removeTarget:target action:sel_selectedSegmentChanged_ forControlEvents:4096];
      id v5 = v7;
    }
    self->_id target = v5;
    if (v5)
    {
      id v4 = (id)[(UISegmentedControl *)self->_segmentedControl addTarget:v5 action:sel_selectedSegmentChanged_ forControlEvents:4096];
      id v5 = v7;
    }
  }

  MEMORY[0x1F41817F8](v4, v5);
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)GKSegmentedSelectorView;
  [(GKSegmentedSelectorView *)&v3 prepareForReuse];
  [(UISegmentedControl *)self->_segmentedControl removeAllSegments];
  [(GKSegmentedSelectorView *)self setTarget:0];
}

- (void)pinningStateChangedTo:(BOOL)a3
{
  BOOL v3 = a3;
  v13[1] = *MEMORY[0x1E4F143B8];
  v11.receiver = self;
  v11.super_class = (Class)GKSegmentedSelectorView;
  -[GKHeaderWithUnderlineView pinningStateChangedTo:](&v11, sel_pinningStateChangedTo_);
  double v5 = 0.0;
  if (v3) {
    double v5 = -10.0;
  }
  -[GKSegmentedSelectorView setHitTestInsets:](self, "setHitTestInsets:", v5, v5, v5, v5);
  if (!*MEMORY[0x1E4F63830])
  {
    if (GKHasSlowerGraphicsHardware_onceToken != -1) {
      dispatch_once(&GKHasSlowerGraphicsHardware_onceToken, &__block_literal_global_42);
    }
    if ((unint64_t)GKHasSlowerGraphicsHardware_processorCount >= 2)
    {
      double v6 = [MEMORY[0x1E4F639B0] sharedPalette];
      id v7 = [(GKSegmentedSelectorView *)self segmentedControl];
      double v8 = v7;
      if (v3)
      {
        [v7 setTitleTextAttributes:MEMORY[0x1E4F1CC08] forState:4];
      }
      else
      {
        uint64_t v12 = *MEMORY[0x1E4FB0700];
        objc_super v9 = [v6 emphasizedTextOnDarkBackgroundColor];
        v13[0] = v9;
        v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
        [v8 setTitleTextAttributes:v10 forState:4];
      }
    }
  }
}

- (UISegmentedControl)segmentedControl
{
  return self->_segmentedControl;
}

- (void)setSegmentedControl:(id)a3
{
}

- (id)target
{
  return self->_target;
}

- (NSLayoutConstraint)widthConstraint
{
  return self->_widthConstraint;
}

- (void)setWidthConstraint:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_widthConstraint, 0);

  objc_storeStrong((id *)&self->_segmentedControl, 0);
}

@end
@interface HUPageControlReusableView
- (HUPageControlReusableView)initWithFrame:(CGRect)a3;
- (UIPageControl)pageControl;
@end

@implementation HUPageControlReusableView

- (HUPageControlReusableView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v25[3] = *MEMORY[0x1E4F143B8];
  v24.receiver = self;
  v24.super_class = (Class)HUPageControlReusableView;
  v7 = -[HUPageControlReusableView initWithFrame:](&v24, sel_initWithFrame_);
  if (v7)
  {
    uint64_t v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42C28]), "initWithFrame:", x, y, width, height);
    pageControl = v7->_pageControl;
    v7->_pageControl = (UIPageControl *)v8;

    [(UIPageControl *)v7->_pageControl setTranslatesAutoresizingMaskIntoConstraints:0];
    [(HUPageControlReusableView *)v7 addSubview:v7->_pageControl];
    v23 = [(HUPageControlReusableView *)v7 pageControl];
    v22 = [v23 centerXAnchor];
    v21 = [(HUPageControlReusableView *)v7 centerXAnchor];
    v20 = [v22 constraintEqualToAnchor:v21];
    v25[0] = v20;
    v10 = [(HUPageControlReusableView *)v7 pageControl];
    v11 = [v10 topAnchor];
    v12 = [(HUPageControlReusableView *)v7 topAnchor];
    v13 = [v11 constraintEqualToAnchor:v12];
    v25[1] = v13;
    v14 = [(HUPageControlReusableView *)v7 pageControl];
    v15 = [v14 bottomAnchor];
    v16 = [(HUPageControlReusableView *)v7 bottomAnchor];
    v17 = [v15 constraintEqualToAnchor:v16];
    v25[2] = v17;
    v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:3];

    [MEMORY[0x1E4F28DC8] activateConstraints:v18];
  }
  return v7;
}

- (UIPageControl)pageControl
{
  return self->_pageControl;
}

- (void).cxx_destruct
{
}

@end
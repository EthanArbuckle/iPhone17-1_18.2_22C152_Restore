@interface MCLContentSizingView
- (CGSize)intrinsicContentSize;
- (UIScrollView)contentView;
- (void)setContentView:(id)a3;
@end

@implementation MCLContentSizingView

- (void)setContentView:(id)a3
{
  v31[4] = *MEMORY[0x263EF8340];
  v30 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  [(TKKeyPathObserver *)v30->_observer stopObserving];
  [(UIScrollView *)v30->_contentView removeFromSuperview];
  objc_storeStrong((id *)&v30->_contentView, location[0]);
  if (location[0])
  {
    [location[0] setTranslatesAutoresizingMaskIntoConstraints:0];
    [(MCLContentSizingView *)v30 addSubview:location[0]];
    LODWORD(v3) = 1148846080;
    [(MCLContentSizingView *)v30 setContentCompressionResistancePriority:1 forAxis:v3];
    LODWORD(v4) = 1148846080;
    [(MCLContentSizingView *)v30 setContentHuggingPriority:1 forAxis:v4];
    v21 = (void *)MEMORY[0x263F08938];
    id v20 = (id)[location[0] leadingAnchor];
    id v19 = (id)[(MCLContentSizingView *)v30 leadingAnchor];
    id v18 = (id)objc_msgSend(v20, "constraintEqualToAnchor:");
    v31[0] = v18;
    id v17 = (id)[location[0] trailingAnchor];
    id v16 = (id)[(MCLContentSizingView *)v30 trailingAnchor];
    id v15 = (id)objc_msgSend(v17, "constraintEqualToAnchor:");
    v31[1] = v15;
    id v14 = (id)[location[0] topAnchor];
    id v13 = (id)[(MCLContentSizingView *)v30 topAnchor];
    id v12 = (id)objc_msgSend(v14, "constraintEqualToAnchor:");
    v31[2] = v12;
    id v11 = (id)[location[0] bottomAnchor];
    id v10 = (id)[(MCLContentSizingView *)v30 bottomAnchor];
    id v9 = (id)objc_msgSend(v11, "constraintEqualToAnchor:");
    v31[3] = v9;
    id v8 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v31 count:4];
    objc_msgSend(v21, "activateConstraints:");

    if (!v30->_observer)
    {
      objc_initWeak(&from, v30);
      v7 = [TKKeyPathObserver alloc];
      uint64_t v22 = MEMORY[0x263EF8330];
      int v23 = -1073741824;
      int v24 = 0;
      v25 = __39__MCLContentSizingView_setContentView___block_invoke;
      v26 = &unk_26485AFF0;
      objc_copyWeak(&v27, &from);
      uint64_t v6 = [(TKKeyPathObserver *)v7 initWithBlock:&v22];
      observer = v30->_observer;
      v30->_observer = (TKKeyPathObserver *)v6;

      [(TKKeyPathObserver *)v30->_observer observe:location[0] keyPath:@"contentSize"];
      objc_destroyWeak(&v27);
      objc_destroyWeak(&from);
    }
  }
  objc_storeStrong(location, 0);
}

void __39__MCLContentSizingView_setContentView___block_invoke(id *a1, void *a2, void *a3)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  id v6 = 0;
  objc_storeStrong(&v6, a3);
  id WeakRetained = objc_loadWeakRetained(a1 + 4);
  [WeakRetained invalidateIntrinsicContentSize];

  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);
}

- (CGSize)intrinsicContentSize
{
  if (self->_contentView)
  {
    [(UIScrollView *)self->_contentView contentSize];
    *(void *)&long long v6 = v2;
    *((void *)&v6 + 1) = v3;
  }
  else
  {
    long long v6 = *MEMORY[0x263F001B0];
  }
  double v5 = *((double *)&v6 + 1);
  double v4 = *(double *)&v6;
  result.height = v5;
  result.width = v4;
  return result;
}

- (UIScrollView)contentView
{
  return self->_contentView;
}

- (void).cxx_destruct
{
}

@end
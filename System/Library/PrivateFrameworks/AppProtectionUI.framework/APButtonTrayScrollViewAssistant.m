@interface APButtonTrayScrollViewAssistant
- (APButtonTrayScrollViewAssistant)initWithDelegate:(id)a3;
- (APButtonTrayScrollViewAssistantDelegate)delegate;
- (void)performAdjustmentsForScrollView:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation APButtonTrayScrollViewAssistant

- (APButtonTrayScrollViewAssistant)initWithDelegate:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)APButtonTrayScrollViewAssistant;
  v5 = [(APButtonTrayScrollViewAssistant *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_delegate, v4);
  }

  return v6;
}

- (void)performAdjustmentsForScrollView:(id)a3
{
  id v22 = a3;
  id v4 = [(APButtonTrayScrollViewAssistant *)self delegate];
  v5 = [v4 buttonTrayForAssistant:self];

  if (v5)
  {
    [v5 bounds];
    objc_msgSend(v5, "convertRect:toView:", v22);
    CGFloat v7 = v6;
    CGFloat v9 = v8;
    CGFloat v11 = v10;
    CGFloat v13 = v12;
    [v22 bounds];
    v26.origin.x = v14;
    v26.origin.y = v15;
    v26.size.width = v16;
    v26.size.double height = v17;
    v24.origin.x = v7;
    v24.origin.y = v9;
    v24.size.width = v11;
    v24.size.double height = v13;
    CGRect v25 = CGRectIntersection(v24, v26);
    double height = v25.size.height;
    if (CGRectIsNull(v25))
    {
      double v19 = *MEMORY[0x263F834E8];
      double v20 = *(double *)(MEMORY[0x263F834E8] + 8);
      double height = *(double *)(MEMORY[0x263F834E8] + 16);
      double v21 = *(double *)(MEMORY[0x263F834E8] + 24);
    }
    else
    {
      double v19 = 0.0;
      double v20 = 0.0;
      double v21 = 0.0;
    }
    objc_msgSend(v22, "setContentInset:", v19, v20, height, v21);
    objc_msgSend(v22, "setScrollIndicatorInsets:", v19, v20, height, v21);
  }
}

- (APButtonTrayScrollViewAssistantDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (APButtonTrayScrollViewAssistantDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
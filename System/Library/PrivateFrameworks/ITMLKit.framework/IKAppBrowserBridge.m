@interface IKAppBrowserBridge
+ (id)makeFeatureJSObjectForFeature:(id)a3;
- (IKAppBrowser)appBrowser;
- (IKAppBrowserBridge)initWithDOMNode:(id)a3 featureName:(id)a4;
- (IKAppContext)appContext;
- (NSString)featureName;
- (UIEdgeInsets)maskInset;
- (double)cornerRadius;
- (double)interitemSpacing;
- (void)present;
- (void)setAppBrowser:(id)a3;
- (void)setCornerRadius:(double)a3;
- (void)setInteritemSpacing:(double)a3;
- (void)setMaskInset:(UIEdgeInsets)a3;
@end

@implementation IKAppBrowserBridge

+ (id)makeFeatureJSObjectForFeature:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  v5 = 0;
  if (v3 && (isKindOfClass & 1) != 0)
  {
    id v6 = v3;
    v7 = [IKJSBrowser alloc];
    v8 = [v6 appContext];
    v5 = [(IKJSObject *)v7 initWithAppContext:v8];

    [(IKJSBrowser *)v5 setBridge:v6];
  }

  return v5;
}

- (IKAppBrowserBridge)initWithDOMNode:(id)a3 featureName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)IKAppBrowserBridge;
  v8 = [(IKAppBrowserBridge *)&v13 init];
  if (v8)
  {
    v9 = [v6 appContext];
    objc_storeWeak((id *)v8 + 3, v9);

    uint64_t v10 = [v7 copy];
    v11 = (void *)*((void *)v8 + 4);
    *((void *)v8 + 4) = v10;

    *(_OWORD *)(v8 + 8) = xmmword_1E2B909E0;
    *((_OWORD *)v8 + 3) = xmmword_1E2B909F0;
    *((_OWORD *)v8 + 4) = xmmword_1E2B90A00;
  }

  return (IKAppBrowserBridge *)v8;
}

- (void)present
{
  id v3 = [(IKAppBrowserBridge *)self appBrowser];
  [(IKAppBrowserBridge *)self cornerRadius];
  uint64_t v5 = v4;
  [(IKAppBrowserBridge *)self interitemSpacing];
  uint64_t v7 = v6;
  [(IKAppBrowserBridge *)self maskInset];
  uint64_t v9 = v8;
  uint64_t v11 = v10;
  uint64_t v13 = v12;
  uint64_t v15 = v14;
  v16 = [(IKAppBrowserBridge *)self appContext];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __29__IKAppBrowserBridge_present__block_invoke;
  v18[3] = &unk_1E6DE3FF0;
  id v19 = v3;
  uint64_t v20 = v5;
  uint64_t v21 = v7;
  uint64_t v22 = v9;
  uint64_t v23 = v11;
  uint64_t v24 = v13;
  uint64_t v25 = v15;
  id v17 = v3;
  [v16 evaluateDelegateBlockSync:v18];
}

uint64_t __29__IKAppBrowserBridge_present__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setCornerRadius:*(double *)(a1 + 40)];
  [*(id *)(a1 + 32) setInteritemSpacing:*(double *)(a1 + 48)];
  objc_msgSend(*(id *)(a1 + 32), "setMaskInset:", *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
  v2 = *(void **)(a1 + 32);
  return [v2 present];
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (void)setCornerRadius:(double)a3
{
  self->_cornerRadius = a3;
}

- (double)interitemSpacing
{
  return self->_interitemSpacing;
}

- (void)setInteritemSpacing:(double)a3
{
  self->_interitemSpacing = a3;
}

- (UIEdgeInsets)maskInset
{
  double top = self->_maskInset.top;
  double left = self->_maskInset.left;
  double bottom = self->_maskInset.bottom;
  double right = self->_maskInset.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setMaskInset:(UIEdgeInsets)a3
{
  self->_maskInset = a3;
}

- (IKAppContext)appContext
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_appContext);
  return (IKAppContext *)WeakRetained;
}

- (NSString)featureName
{
  return self->_featureName;
}

- (IKAppBrowser)appBrowser
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_appBrowser);
  return (IKAppBrowser *)WeakRetained;
}

- (void)setAppBrowser:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_appBrowser);
  objc_storeStrong((id *)&self->_featureName, 0);
  objc_destroyWeak((id *)&self->_appContext);
}

@end
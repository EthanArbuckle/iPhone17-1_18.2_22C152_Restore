@interface IKJSBrowser
- (IKAppBrowserBridge)bridge;
- (NSDictionary)maskInset;
- (double)cornerRadius;
- (double)interitemSpacing;
- (void)present;
- (void)setBridge:(id)a3;
- (void)setCornerRadius:(double)a3;
- (void)setInteritemSpacing:(double)a3;
- (void)setMaskInset:(id)a3;
@end

@implementation IKJSBrowser

- (double)cornerRadius
{
  v2 = [(IKJSBrowser *)self bridge];
  [v2 cornerRadius];
  double v4 = v3;

  return v4;
}

- (void)setCornerRadius:(double)a3
{
  id v4 = [(IKJSBrowser *)self bridge];
  [v4 setCornerRadius:a3];
}

- (double)interitemSpacing
{
  v2 = [(IKJSBrowser *)self bridge];
  [v2 interitemSpacing];
  double v4 = v3;

  return v4;
}

- (void)setInteritemSpacing:(double)a3
{
  id v4 = [(IKJSBrowser *)self bridge];
  [v4 setInteritemSpacing:a3];
}

- (NSDictionary)maskInset
{
  v2 = [(IKJSBrowser *)self bridge];
  [v2 maskInset];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  v11 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:4];
  v12 = [NSNumber numberWithDouble:v4];
  [v11 setObject:v12 forKey:@"top"];

  v13 = [NSNumber numberWithDouble:v6];
  [v11 setObject:v13 forKey:@"left"];

  v14 = [NSNumber numberWithDouble:v8];
  [v11 setObject:v14 forKey:@"bottom"];

  v15 = [NSNumber numberWithDouble:v10];
  [v11 setObject:v15 forKey:@"right"];

  v16 = (void *)[v11 copy];
  return (NSDictionary *)v16;
}

- (void)setMaskInset:(id)a3
{
  id v4 = a3;
  double v5 = [v4 objectForKey:@"top"];
  [v5 doubleValue];
  double v7 = v6;
  double v8 = [v4 objectForKey:@"left"];
  [v8 doubleValue];
  double v10 = v9;
  v11 = [v4 objectForKey:@"bottom"];
  [v11 doubleValue];
  double v13 = v12;
  v14 = [v4 objectForKey:@"right"];

  [v14 doubleValue];
  double v16 = v15;

  id v17 = [(IKJSBrowser *)self bridge];
  objc_msgSend(v17, "setMaskInset:", v7, v10, v13, v16);
}

- (void)present
{
  id v2 = [(IKJSBrowser *)self bridge];
  [v2 present];
}

- (IKAppBrowserBridge)bridge
{
  return self->_bridge;
}

- (void)setBridge:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bridge, 0);
  objc_storeStrong((id *)&self->_maskInset, 0);
}

@end
@interface SSSPendingScreenshotRecord
- (SSSPendingScreenshotRecord)initWithScreenshot:(id)a3 deliveryCompletionBlock:(id)a4;
- (SSSScreenshot)screenshot;
- (id)deliveryCompletionBlock;
- (void)setDeliveryCompletionBlock:(id)a3;
- (void)setScreenshot:(id)a3;
@end

@implementation SSSPendingScreenshotRecord

- (SSSPendingScreenshotRecord)initWithScreenshot:(id)a3 deliveryCompletionBlock:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)SSSPendingScreenshotRecord;
  id v5 = a4;
  id v6 = a3;
  v7 = [(SSSPendingScreenshotRecord *)&v9 init];
  -[SSSPendingScreenshotRecord setScreenshot:](v7, "setScreenshot:", v6, v9.receiver, v9.super_class);

  [(SSSPendingScreenshotRecord *)v7 setDeliveryCompletionBlock:v5];
  return v7;
}

- (SSSScreenshot)screenshot
{
  return self->_screenshot;
}

- (void)setScreenshot:(id)a3
{
}

- (id)deliveryCompletionBlock
{
  return self->_deliveryCompletionBlock;
}

- (void)setDeliveryCompletionBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_deliveryCompletionBlock, 0);

  objc_storeStrong((id *)&self->_screenshot, 0);
}

@end
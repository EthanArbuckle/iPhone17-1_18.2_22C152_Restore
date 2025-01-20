@interface BCSAnalyticsLogger
+ (id)sharedLogger;
- (id)_eventPayloadForAction:(id)a3;
- (id)_initWithQueue:(id)a3;
- (id)_stringForCodeType:(int64_t)a3;
- (id)_stringForDataType:(int64_t)a3;
- (void)_sendEventLazyWithName:(id)a3 payload:(id)a4;
- (void)didActivateNFCReader;
- (void)didScanNFCTagOfType:(int64_t)a3;
- (void)logBarcodeActivatedEventForAction:(id)a3;
- (void)logBarcodeDetectedEventForAction:(id)a3 fromBundleID:(id)a4;
- (void)logBarcodeDetectedEventForAction:(id)a3 startTime:(unint64_t)a4;
- (void)logBarcodePreviewedEventForContentType:(int64_t)a3;
@end

@implementation BCSAnalyticsLogger

+ (id)sharedLogger
{
  if (sharedLogger_onceToken != -1) {
    dispatch_once(&sharedLogger_onceToken, &__block_literal_global_3);
  }
  v2 = (void *)sharedLogger_sharedLogger;
  return v2;
}

void __34__BCSAnalyticsLogger_sharedLogger__block_invoke()
{
  v0 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
  dispatch_queue_t v3 = dispatch_queue_create("com.apple.BarcodeSupport.Analytics", v0);

  id v1 = [[BCSAnalyticsLogger alloc] _initWithQueue:v3];
  v2 = (void *)sharedLogger_sharedLogger;
  sharedLogger_sharedLogger = (uint64_t)v1;
}

- (id)_initWithQueue:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)BCSAnalyticsLogger;
  v6 = [(BCSAnalyticsLogger *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_queue, a3);
    v8 = v7;
  }

  return v7;
}

- (void)didActivateNFCReader
{
}

- (void)didScanNFCTagOfType:(int64_t)a3
{
  v9[1] = *MEMORY[0x263EF8340];
  if (a3) {
    v4 = @"appclip";
  }
  else {
    v4 = @"url";
  }
  v8 = @"tagDataType";
  v9[0] = v4;
  id v5 = NSDictionary;
  v6 = v4;
  v7 = [v5 dictionaryWithObjects:v9 forKeys:&v8 count:1];

  [(BCSAnalyticsLogger *)self _sendEventLazyWithName:@"com.apple.BarcodeSupport.DidScanNFCTag" payload:v7];
}

- (void)_sendEventLazyWithName:(id)a3 payload:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __53__BCSAnalyticsLogger__sendEventLazyWithName_payload___block_invoke;
  v11[3] = &unk_26468B498;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, v11);
}

void __53__BCSAnalyticsLogger__sendEventLazyWithName_payload___block_invoke(uint64_t a1)
{
  id v1 = *(id *)(a1 + 40);
  AnalyticsSendEventLazy();
}

id __53__BCSAnalyticsLogger__sendEventLazyWithName_payload___block_invoke_2(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (id)_stringForCodeType:(int64_t)a3
{
  dispatch_queue_t v3 = @"QR";
  if (a3 == 2) {
    dispatch_queue_t v3 = @"NFC";
  }
  if (a3 == 3) {
    return @"Appclip";
  }
  else {
    return v3;
  }
}

- (id)_stringForDataType:(int64_t)a3
{
  if ((unint64_t)a3 > 0x10) {
    return @"Other";
  }
  else {
    return *(&off_26468B4B8 + a3);
  }
}

- (id)_eventPayloadForAction:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [MEMORY[0x263EFF9A0] dictionary];
    id v6 = [MEMORY[0x263F086E0] mainBundle];
    id v7 = [v6 bundleIdentifier];
    [v5 setObject:v7 forKeyedSubscript:@"client"];

    v8 = -[BCSAnalyticsLogger _stringForCodeType:](self, "_stringForCodeType:", [v4 codeType]);
    [v5 setObject:v8 forKeyedSubscript:@"codeType"];

    id v9 = [v4 data];
    id v10 = -[BCSAnalyticsLogger _stringForDataType:](self, "_stringForDataType:", [v9 type]);
    [v5 setObject:v10 forKeyedSubscript:@"dataType"];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v11 = NSNumber;
      id v12 = v4;
      id v13 = [v12 appLinks];
      v14 = objc_msgSend(v11, "numberWithUnsignedInteger:", objc_msgSend(v13, "count"));
      [v5 setObject:v14 forKeyedSubscript:@"applinks"];

      v15 = NSNumber;
      uint64_t v16 = [v12 mustOpenAppLinkInApp];

      v17 = [v15 numberWithBool:v16];
      [v5 setObject:v17 forKeyedSubscript:@"openInApp"];
    }
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (void)logBarcodeDetectedEventForAction:(id)a3 startTime:(unint64_t)a4
{
}

- (void)logBarcodeDetectedEventForAction:(id)a3 fromBundleID:(id)a4
{
  id v8 = a4;
  id v6 = [(BCSAnalyticsLogger *)self _eventPayloadForAction:a3];
  id v7 = (void *)[v6 mutableCopy];

  if (v8) {
    [v7 setObject:v8 forKeyedSubscript:@"client"];
  }
  [(BCSAnalyticsLogger *)self _sendEventLazyWithName:@"com.apple.BarcodeSupport.DidDetectBarcode" payload:v7];
}

- (void)logBarcodeActivatedEventForAction:(id)a3
{
  id v4 = [(BCSAnalyticsLogger *)self _eventPayloadForAction:a3];
  [(BCSAnalyticsLogger *)self _sendEventLazyWithName:@"com.apple.BarcodeSupport.DidActivateBarcode" payload:v4];
}

- (void)logBarcodePreviewedEventForContentType:(int64_t)a3
{
  v7[1] = *MEMORY[0x263EF8340];
  id v6 = @"contentType";
  id v4 = [NSNumber numberWithInteger:a3];
  v7[0] = v4;
  id v5 = [NSDictionary dictionaryWithObjects:v7 forKeys:&v6 count:1];
  [(BCSAnalyticsLogger *)self _sendEventLazyWithName:@"com.apple.BarcodeSupport.DidPreviewContent" payload:v5];
}

- (void).cxx_destruct
{
}

@end
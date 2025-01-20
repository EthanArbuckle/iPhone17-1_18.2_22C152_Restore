@interface CDPRemoteValidationEscapeOffer
- (CDPRemoteValidationEscapeOffer)initWithCDPContext:(id)a3;
- (NSString)deviceSessionID;
- (NSString)escapeOfferName;
- (NSString)flowID;
- (NSString)message;
- (NSString)title;
- (NSString)titleTelemetryKey;
- (UIViewController)presentingViewController;
- (id)_actionFromEscapeOption:(id)a3;
- (id)_makeEventForEscapeOptionSelectedWithKey:(id)a3;
- (id)escapeOptions;
- (int64_t)_styleForEscapeOption:(id)a3;
- (void)_performActionForEscapeOption:(id)a3;
- (void)_sendEscapeOfferPresentedEventWithOptions:(id)a3;
- (void)addEscapeOptionsObject:(id)a3;
- (void)dismissOfferAnimated:(BOOL)a3 completion:(id)a4;
- (void)handleEscapeAction:(id)a3;
- (void)setDeviceSessionID:(id)a3;
- (void)setEscapeOfferName:(id)a3;
- (void)setFlowID:(id)a3;
- (void)setMessage:(id)a3;
- (void)setPresentingViewController:(id)a3;
- (void)setTitle:(id)a3;
- (void)setTitleTelemetryKey:(id)a3;
@end

@implementation CDPRemoteValidationEscapeOffer

- (CDPRemoteValidationEscapeOffer)initWithCDPContext:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CDPRemoteValidationEscapeOffer;
  v6 = [(CDPRemoteValidationEscapeOffer *)&v10 init];
  if (v6)
  {
    uint64_t v7 = [MEMORY[0x263EFF980] arrayWithCapacity:2];
    escapeOptions = v6->_escapeOptions;
    v6->_escapeOptions = (NSMutableArray *)v7;

    objc_storeStrong((id *)&v6->_cdpContext, a3);
  }

  return v6;
}

- (void)addEscapeOptionsObject:(id)a3
{
  id v4 = a3;
  if (!v4) {
    -[CDPRemoteValidationEscapeOffer addEscapeOptionsObject:]();
  }
  id v5 = v4;
  [(NSMutableArray *)self->_escapeOptions addObject:v4];
}

- (id)escapeOptions
{
  v2 = (void *)[(NSMutableArray *)self->_escapeOptions copy];

  return v2;
}

- (NSString)title
{
  title = self->_title;
  if (!title) {
    title = self->_escapeOfferName;
  }
  v3 = title;

  return v3;
}

- (void)handleEscapeAction:(id)a3
{
  id v4 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v5 = [(CDPRemoteValidationEscapeOffer *)self escapeOptions];
  if ([v5 count] != 1)
  {

    goto LABEL_8;
  }
  v6 = [(CDPRemoteValidationEscapeOffer *)self escapeOptions];
  uint64_t v7 = [v6 firstObject];
  uint64_t v8 = [v7 style];

  if (v8 != 4)
  {
LABEL_8:
    v18 = (void *)MEMORY[0x263F82418];
    v19 = [(CDPRemoteValidationEscapeOffer *)self title];
    v20 = [(CDPRemoteValidationEscapeOffer *)self message];
    v21 = [v18 alertControllerWithTitle:v19 message:v20 preferredStyle:1];

    v22 = [MEMORY[0x263F34338] rtcAnalyticsReporter];
    v23 = [(CDPRemoteValidationEscapeOffer *)self titleTelemetryKey];
    v24 = [(CDPRemoteValidationEscapeOffer *)self _makeEventForEscapeOptionSelectedWithKey:v23];
    [v22 sendEvent:v24];

    v25 = [(CDPRemoteValidationEscapeOffer *)self escapeOptions];
    v30[0] = MEMORY[0x263EF8330];
    v30[1] = 3221225472;
    v30[2] = __53__CDPRemoteValidationEscapeOffer_handleEscapeAction___block_invoke;
    v30[3] = &unk_26433DB68;
    v30[4] = self;
    id v31 = v21;
    id v26 = v4;
    id v32 = v26;
    id v10 = v21;
    [v25 enumerateObjectsUsingBlock:v30];

    v27 = [(CDPRemoteValidationEscapeOffer *)self presentingViewController];
    v28[0] = MEMORY[0x263EF8330];
    v28[1] = 3221225472;
    v28[2] = __53__CDPRemoteValidationEscapeOffer_handleEscapeAction___block_invoke_2;
    v28[3] = &unk_26433CC30;
    v28[4] = self;
    id v29 = v26;
    [v27 presentViewController:v10 animated:1 completion:v28];

    goto LABEL_9;
  }
  v9 = [(CDPRemoteValidationEscapeOffer *)self escapeOptions];
  id v10 = [v9 firstObject];

  v11 = [MEMORY[0x263F34338] rtcAnalyticsReporter];
  v12 = [v10 titleTelemetryKey];
  v13 = [(CDPRemoteValidationEscapeOffer *)self _makeEventForEscapeOptionSelectedWithKey:v12];
  [v11 sendEvent:v13];

  v14 = [v10 escapeAction];

  if (v14)
  {
    v15 = [v10 escapeAction];
    v15[2]();

    v16 = [v10 titleTelemetryKey];

    if (v16)
    {
      v17 = [v10 titleTelemetryKey];
      [v4 addObject:v17];
    }
    [(CDPRemoteValidationEscapeOffer *)self _sendEscapeOfferPresentedEventWithOptions:v4];
  }
LABEL_9:
}

void __53__CDPRemoteValidationEscapeOffer_handleEscapeAction___block_invoke(uint64_t a1, void *a2)
{
  id v10 = a2;
  v3 = [v10 canShowEscapeOption];

  if (!v3
    || ([v10 canShowEscapeOption],
        id v4 = (uint64_t (**)(void))objc_claimAutoreleasedReturnValue(),
        int v5 = v4[2](),
        v4,
        v5))
  {
    v6 = [*(id *)(a1 + 32) _actionFromEscapeOption:v10];
    [*(id *)(a1 + 40) addAction:v6];
    uint64_t v7 = [v10 titleTelemetryKey];

    if (v7)
    {
      uint64_t v8 = *(void **)(a1 + 48);
      v9 = [v10 titleTelemetryKey];
      [v8 addObject:v9];
    }
    if ([v10 style] == 3) {
      [*(id *)(a1 + 40) setPreferredAction:v6];
    }
  }
}

uint64_t __53__CDPRemoteValidationEscapeOffer_handleEscapeAction___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _sendEscapeOfferPresentedEventWithOptions:*(void *)(a1 + 40)];
}

- (id)_actionFromEscapeOption:(id)a3
{
  id v4 = a3;
  int v5 = (void *)MEMORY[0x263F82400];
  v6 = [v4 title];
  int64_t v7 = [(CDPRemoteValidationEscapeOffer *)self _styleForEscapeOption:v4];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __58__CDPRemoteValidationEscapeOffer__actionFromEscapeOption___block_invoke;
  v11[3] = &unk_26433D498;
  v11[4] = self;
  id v12 = v4;
  id v8 = v4;
  v9 = [v5 actionWithTitle:v6 style:v7 handler:v11];

  return v9;
}

void __58__CDPRemoteValidationEscapeOffer__actionFromEscapeOption___block_invoke(uint64_t a1)
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __58__CDPRemoteValidationEscapeOffer__actionFromEscapeOption___block_invoke_2;
  v2[3] = &unk_26433CC30;
  v1 = *(void **)(a1 + 40);
  v2[4] = *(void *)(a1 + 32);
  id v3 = v1;
  dispatch_async(MEMORY[0x263EF83A0], v2);
}

uint64_t __58__CDPRemoteValidationEscapeOffer__actionFromEscapeOption___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _performActionForEscapeOption:*(void *)(a1 + 40)];
}

- (void)_performActionForEscapeOption:(id)a3
{
  id v9 = a3;
  id v4 = [MEMORY[0x263F34338] rtcAnalyticsReporter];
  int v5 = [v9 titleTelemetryKey];
  v6 = [(CDPRemoteValidationEscapeOffer *)self _makeEventForEscapeOptionSelectedWithKey:v5];
  [v4 sendEvent:v6];

  int64_t v7 = [v9 escapeAction];

  if (v7)
  {
    id v8 = [v9 escapeAction];
    v8[2]();
  }
}

- (int64_t)_styleForEscapeOption:(id)a3
{
  uint64_t v3 = [a3 style];
  if (v3 == 1) {
    return 1;
  }
  else {
    return 2 * (v3 == 2);
  }
}

- (void)dismissOfferAnimated:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = [(CDPRemoteValidationEscapeOffer *)self presentingViewController];
  [v7 dismissViewControllerAnimated:v4 completion:v6];
}

- (void)_sendEscapeOfferPresentedEventWithOptions:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    int v5 = [MEMORY[0x263F202A8] analyticsEventWithContext:self->_cdpContext eventName:*MEMORY[0x263F345F0] category:*MEMORY[0x263F34830]];
    id v6 = objc_msgSend(v4, "aaf_arrayAsCommaSeperatedString");
    [v5 setObject:v6 forKeyedSubscript:*MEMORY[0x263F345E8]];

    id v7 = [MEMORY[0x263F34338] rtcAnalyticsReporter];
    [v7 sendEvent:v5];
  }
  else
  {
    int v5 = _CDPLogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[CDPRemoteValidationEscapeOffer _sendEscapeOfferPresentedEventWithOptions:](v5);
    }
  }
}

- (id)_makeEventForEscapeOptionSelectedWithKey:(id)a3
{
  id v4 = a3;
  int v5 = [MEMORY[0x263F202A8] analyticsEventWithContext:self->_cdpContext eventName:*MEMORY[0x263F34600] category:*MEMORY[0x263F34830]];
  id v6 = v5;
  if (v4) {
    [v5 setObject:v4 forKeyedSubscript:*MEMORY[0x263F345F8]];
  }

  return v6;
}

- (UIViewController)presentingViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentingViewController);

  return (UIViewController *)WeakRetained;
}

- (void)setPresentingViewController:(id)a3
{
}

- (NSString)escapeOfferName
{
  return self->_escapeOfferName;
}

- (void)setEscapeOfferName:(id)a3
{
}

- (void)setTitle:(id)a3
{
}

- (NSString)titleTelemetryKey
{
  return self->_titleTelemetryKey;
}

- (void)setTitleTelemetryKey:(id)a3
{
}

- (NSString)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
}

- (NSString)deviceSessionID
{
  return self->_deviceSessionID;
}

- (void)setDeviceSessionID:(id)a3
{
}

- (NSString)flowID
{
  return self->_flowID;
}

- (void)setFlowID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_flowID, 0);
  objc_storeStrong((id *)&self->_deviceSessionID, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_titleTelemetryKey, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_escapeOfferName, 0);
  objc_destroyWeak((id *)&self->_presentingViewController);
  objc_storeStrong((id *)&self->_cdpContext, 0);

  objc_storeStrong((id *)&self->_escapeOptions, 0);
}

- (void)addEscapeOptionsObject:.cold.1()
{
}

- (void)_sendEscapeOfferPresentedEventWithOptions:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_2187CF000, log, OS_LOG_TYPE_ERROR, "No escape options were presented.", v1, 2u);
}

@end
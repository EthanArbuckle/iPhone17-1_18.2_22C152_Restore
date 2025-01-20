@interface CDPUICustodianAskHelpViewController
- (CDPUICustodianAskHelpViewController)initWithViewModel:(id)a3 cdpContext:(id)a4;
- (id)_buttonIdentifiersJoinedByComma;
- (id)_dontAskForHelpButtonTitle;
- (id)_getHelpNowButtonTitle;
- (id)_makeEventForAskForHelp;
- (id)_makeEventForDontAskForHelp;
- (id)_makeViewAppearedEvent;
- (id)_makeViewWillDisappearEvent;
- (void)_handleAskForHelpNowAction:(id)a3;
- (void)_handleDontAskForHelpAction:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation CDPUICustodianAskHelpViewController

- (CDPUICustodianAskHelpViewController)initWithViewModel:(id)a3 cdpContext:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v10 = (void *)MEMORY[0x263F827E8];
  v11 = [v7 iconName];
  v12 = [v10 imageNamed:v11 inBundle:v9];

  v13 = [v7 title];
  v14 = [v7 message];
  v17.receiver = self;
  v17.super_class = (Class)CDPUICustodianAskHelpViewController;
  v15 = [(CDPUICustodianAskHelpViewController *)&v17 initWithTitle:v13 detailText:v14 icon:v12 contentLayout:3];

  if (v15)
  {
    objc_storeStrong((id *)&v15->_viewModel, a3);
    objc_storeStrong((id *)&v15->_cdpContext, a4);
  }

  return v15;
}

- (void)viewDidLoad
{
  v9.receiver = self;
  v9.super_class = (Class)CDPUICustodianAskHelpViewController;
  [(OBBaseWelcomeController *)&v9 viewDidLoad];
  v3 = [MEMORY[0x263F5B898] boldButton];
  [v3 addTarget:self action:sel__handleAskForHelpNowAction_ forControlEvents:64];
  v4 = [(CDPUICustodianAskHelpViewController *)self _getHelpNowButtonTitle];
  [v3 setTitle:v4 forState:0];

  v5 = [(CDPUICustodianAskHelpViewController *)self buttonTray];
  [v5 addButton:v3];

  v6 = [MEMORY[0x263F5B8D0] linkButton];
  [v6 addTarget:self action:sel__handleDontAskForHelpAction_ forControlEvents:64];
  id v7 = [(CDPUICustodianAskHelpViewController *)self _dontAskForHelpButtonTitle];
  [v6 setTitle:v7 forState:0];

  id v8 = [(CDPUICustodianAskHelpViewController *)self buttonTray];
  [v8 addButton:v6];
}

- (void)viewDidAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CDPUICustodianAskHelpViewController;
  [(OBBaseWelcomeController *)&v6 viewDidAppear:a3];
  v4 = [MEMORY[0x263F34338] rtcAnalyticsReporter];
  v5 = [(CDPUICustodianAskHelpViewController *)self _makeViewAppearedEvent];
  [v4 sendEvent:v5];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CDPUICustodianAskHelpViewController;
  [(CDPUICustodianAskHelpViewController *)&v6 viewWillDisappear:a3];
  v4 = [MEMORY[0x263F34338] rtcAnalyticsReporter];
  v5 = [(CDPUICustodianAskHelpViewController *)self _makeViewWillDisappearEvent];
  [v4 sendEvent:v5];
}

- (id)_makeViewAppearedEvent
{
  v3 = [MEMORY[0x263F202A8] analyticsEventWithContext:self->_cdpContext eventName:*MEMORY[0x263F346E8] category:*MEMORY[0x263F34830]];
  v4 = [(CDPUICustodianAskHelpViewController *)self _buttonIdentifiersJoinedByComma];
  if (v4) {
    [v3 setObject:v4 forKeyedSubscript:*MEMORY[0x263F345E8]];
  }

  return v3;
}

- (id)_makeViewWillDisappearEvent
{
  v3 = [MEMORY[0x263F202A8] analyticsEventWithContext:self->_cdpContext eventName:*MEMORY[0x263F34600] category:*MEMORY[0x263F34830]];
  BOOL v4 = [(UIViewController *)self isDisappearingDueToPop];
  v5 = (void *)MEMORY[0x263F34850];
  if (!v4) {
    v5 = (void *)MEMORY[0x263F34858];
  }
  [v3 setObject:*v5 forKeyedSubscript:*MEMORY[0x263F345F8]];

  return v3;
}

- (void)_handleAskForHelpNowAction:(id)a3
{
  BOOL v4 = objc_msgSend(MEMORY[0x263F34338], "rtcAnalyticsReporter", a3);
  v5 = [(CDPUICustodianAskHelpViewController *)self _makeEventForAskForHelp];
  [v4 sendEvent:v5];

  objc_super v6 = [(CDPUICustodianAskHelpViewModel *)self->_viewModel getHelpNowOption];
  id v7 = [v6 escapeAction];

  if (v7)
  {
    id v10 = [(CDPUICustodianAskHelpViewModel *)self->_viewModel getHelpNowOption];
    id v8 = [v10 escapeAction];
    v8[2]();
  }
  else
  {
    objc_super v9 = _CDPLogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[CDPUICustodianAskHelpViewController _handleAskForHelpNowAction:](v9);
    }
  }
}

- (void)_handleDontAskForHelpAction:(id)a3
{
  BOOL v4 = objc_msgSend(MEMORY[0x263F34338], "rtcAnalyticsReporter", a3);
  v5 = [(CDPUICustodianAskHelpViewController *)self _makeEventForDontAskForHelp];
  [v4 sendEvent:v5];

  objc_super v6 = [(CDPUICustodianAskHelpViewModel *)self->_viewModel dontAskForHelpOption];

  if (v6)
  {
    id v8 = [(CDPUICustodianAskHelpViewModel *)self->_viewModel dontAskForHelpOption];
    [v8 handleEscapeAction:self];
  }
  else
  {
    id v7 = _CDPLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[CDPUICustodianAskHelpViewController _handleDontAskForHelpAction:](v7);
    }
  }
}

- (id)_getHelpNowButtonTitle
{
  v2 = [(CDPUICustodianAskHelpViewModel *)self->_viewModel getHelpNowOption];
  v3 = [v2 title];

  return v3;
}

- (id)_dontAskForHelpButtonTitle
{
  v2 = [(CDPUICustodianAskHelpViewModel *)self->_viewModel dontAskForHelpOption];
  v3 = [v2 escapeOfferName];

  return v3;
}

- (id)_buttonIdentifiersJoinedByComma
{
  v3 = [MEMORY[0x263EFF980] array];
  BOOL v4 = [(OBBaseWelcomeController *)self navigationItem];
  v5 = [v4 backBarButtonItem];

  if (v5)
  {
    objc_super v6 = (void *)MEMORY[0x263F34850];
  }
  else
  {
    id v7 = [(OBBaseWelcomeController *)self navigationItem];
    id v8 = [v7 leftBarButtonItem];

    if (!v8) {
      goto LABEL_6;
    }
    objc_super v6 = (void *)MEMORY[0x263F34858];
  }
  [v3 addObject:*v6];
LABEL_6:
  objc_super v9 = [(CDPUICustodianAskHelpViewModel *)self->_viewModel getHelpNowOption];

  if (v9)
  {
    id v10 = [(CDPUICustodianAskHelpViewModel *)self->_viewModel getHelpNowOption];
    v11 = [v10 titleTelemetryKey];
    [v3 addObject:v11];
  }
  v12 = [(CDPUICustodianAskHelpViewModel *)self->_viewModel dontAskForHelpOption];

  if (v12)
  {
    v13 = [(CDPUICustodianAskHelpViewModel *)self->_viewModel dontAskForHelpOption];
    v14 = [v13 titleTelemetryKey];
    [v3 addObject:v14];
  }
  if ([v3 count])
  {
    v15 = objc_msgSend(v3, "aaf_arrayAsCommaSeperatedString");
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (id)_makeEventForAskForHelp
{
  v3 = [MEMORY[0x263F202A8] analyticsEventWithContext:self->_cdpContext eventName:*MEMORY[0x263F34600] category:*MEMORY[0x263F34830]];
  BOOL v4 = [(CDPUICustodianAskHelpViewModel *)self->_viewModel getHelpNowOption];
  v5 = [v4 titleTelemetryKey];
  [v3 setObject:v5 forKeyedSubscript:*MEMORY[0x263F345F8]];

  return v3;
}

- (id)_makeEventForDontAskForHelp
{
  v3 = [MEMORY[0x263F202A8] analyticsEventWithContext:self->_cdpContext eventName:*MEMORY[0x263F34600] category:*MEMORY[0x263F34830]];
  BOOL v4 = [(CDPUICustodianAskHelpViewModel *)self->_viewModel dontAskForHelpOption];
  v5 = [v4 titleTelemetryKey];
  [v3 setObject:v5 forKeyedSubscript:*MEMORY[0x263F345F8]];

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cdpContext, 0);

  objc_storeStrong((id *)&self->_viewModel, 0);
}

- (void)_handleAskForHelpNowAction:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_2187CF000, log, OS_LOG_TYPE_ERROR, "Escape action for 'Get help now' is nil", v1, 2u);
}

- (void)_handleDontAskForHelpAction:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_2187CF000, log, OS_LOG_TYPE_ERROR, "Escape option for 'Dont ask for help' is nil", v1, 2u);
}

@end
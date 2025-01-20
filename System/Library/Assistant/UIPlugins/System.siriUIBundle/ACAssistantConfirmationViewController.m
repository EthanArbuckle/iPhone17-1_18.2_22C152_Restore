@interface ACAssistantConfirmationViewController
- (BOOL)_sendCommands:(id)a3;
- (BOOL)removedAfterDialogProgresses;
- (BOOL)triggerConfirmation;
- (BOOL)triggerDenial;
- (BOOL)usePlatterStyle;
- (UIEdgeInsets)defaultViewInsets;
- (double)desiredHeightForWidth:(double)a3;
- (id)snippet;
- (void)_cancelButtonHit:(id)a3;
- (void)_confirmButtonHit:(id)a3;
- (void)_emitButtonInteraction;
- (void)loadView;
- (void)viewDidLoad;
@end

@implementation ACAssistantConfirmationViewController

- (void)loadView
{
  v3 = -[ACAssistantConfirmView initWithFrame:]([ACAssistantConfirmView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  [(ACAssistantConfirmationViewController *)self setView:v3];
}

- (void)viewDidLoad
{
  v12.receiver = self;
  v12.super_class = (Class)ACAssistantConfirmationViewController;
  [(ACAssistantConfirmationViewController *)&v12 viewDidLoad];
  v3 = [(ACAssistantConfirmationViewController *)self view];
  v4 = [v3 cancelButton];
  [v4 addTarget:self action:"_cancelButtonHit:" forControlEvents:64];

  v5 = [v3 confirmButton];
  [v5 addTarget:self action:"_confirmButtonHit:" forControlEvents:64];

  v6 = [(ACAssistantConfirmationViewController *)self aceObject];
  v7 = [v6 denyText];
  [v3 setCancelText:v7];

  v8 = [v6 confirmText];
  [v3 setConfirmText:v8];

  v9 = [v3 confirmButton];
  v10 = [(ACAssistantConfirmationViewController *)self aceObject];
  v11 = [v10 allConfirmationOptions];
  [v9 configureRoleForConfirmationOptions:v11];
}

- (double)desiredHeightForWidth:(double)a3
{
  v4 = [(ACAssistantConfirmationViewController *)self view];
  objc_msgSend(v4, "sizeThatFits:", a3, 1.79769313e308);
  double v6 = v5;

  return v6;
}

- (BOOL)removedAfterDialogProgresses
{
  return 1;
}

- (BOOL)_sendCommands:(id)a3
{
  BOOL hasSentCommands = self->_hasSentCommands;
  if (!self->_hasSentCommands)
  {
    self->_BOOL hasSentCommands = 1;
    id v5 = a3;
    double v6 = [(ACAssistantConfirmationViewController *)self delegate];
    [v6 siriViewController:self performAceCommands:v5];
  }
  return !hasSentCommands;
}

- (BOOL)triggerDenial
{
  v2 = self;
  [(ACAssistantConfirmationViewController *)self _emitButtonInteraction];
  v3 = [(ACAssistantConfirmationViewController *)v2 aceObject];
  v4 = [v3 denyCommands];
  LOBYTE(v2) = [(ACAssistantConfirmationViewController *)v2 _sendCommands:v4];

  return (char)v2;
}

- (BOOL)triggerConfirmation
{
  v2 = self;
  [(ACAssistantConfirmationViewController *)self _emitButtonInteraction];
  v3 = [(ACAssistantConfirmationViewController *)v2 aceObject];
  v4 = [v3 confirmCommands];
  LOBYTE(v2) = [(ACAssistantConfirmationViewController *)v2 _sendCommands:v4];

  return (char)v2;
}

- (void)_emitButtonInteraction
{
  v3 = +[SRUIFInstrumentationManager sharedManager];
  v4 = [(ACAssistantConfirmationViewController *)self instrumentationTurnIdentifier];
  id v5 = +[AFAnalyticsTurnBasedInstrumentationContext newTurnBasedContextWithPreviousTurnID:v4];
  double v6 = (void *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    v7 = v6;
    v8 = [v5 turnIdentifier];
    int v10 = 136315650;
    v11 = "-[ACAssistantConfirmationViewController _emitButtonInteraction]";
    __int16 v12 = 2112;
    v13 = v8;
    __int16 v14 = 2112;
    v15 = v4;
    _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "%s #instrumentation New Turn %@ <-> Old Turn %@ ", (uint8_t *)&v10, 0x20u);
  }
  [v3 storeCurrentInstrumentationTurnContext:v5];
  id v9 = objc_alloc_init((Class)SISchemaInvocation);
  [v9 setInvocationSource:11];
  [v3 emitInstrumentation:v9];
}

- (id)snippet
{
  return 0;
}

- (BOOL)usePlatterStyle
{
  return 1;
}

- (UIEdgeInsets)defaultViewInsets
{
  double top = UIEdgeInsetsZero.top;
  double left = UIEdgeInsetsZero.left;
  double bottom = UIEdgeInsetsZero.bottom;
  double right = UIEdgeInsetsZero.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)_cancelButtonHit:(id)a3
{
}

- (void)_confirmButtonHit:(id)a3
{
}

@end
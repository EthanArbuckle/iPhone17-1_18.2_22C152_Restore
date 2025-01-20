@interface AXStickyKeysUIServer
+ (id)requiredEntitlementForProcessingMessageWithIdentifier:(unint64_t)a3;
- (AXStickyKeysViewController)stickyKeysViewController;
- (id)processMessage:(id)a3 withIdentifier:(unint64_t)a4 fromClientWithIdentifier:(id)a5 error:(id *)a6;
- (void)_handleStickyKeyUpdatedWithKeycode:(unsigned __int16)a3 usagePage:(unsigned int)a4 state:(int64_t)a5;
- (void)_handleStickyKeysDisabled;
- (void)_handleStickyKeysToggledViaShift;
- (void)_playSoundForState:(int64_t)a3;
- (void)_showUIIfNeeded;
- (void)setStickyKeysViewController:(id)a3;
@end

@implementation AXStickyKeysUIServer

- (id)processMessage:(id)a3 withIdentifier:(unint64_t)a4 fromClientWithIdentifier:(id)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = a5;
  switch(a4)
  {
    case 0x2712uLL:
      v11 = [v9 objectForKeyedSubscript:AXStickyKeysUIServerKeycodeKey];
      unsigned __int16 v12 = (unsigned __int16)[v11 intValue];
      v13 = [v9 objectForKeyedSubscript:AXStickyKeysUIServerUsagePageKey];
      id v14 = [v13 intValue];
      v15 = [v9 objectForKeyedSubscript:AXStickyKeysUIServerKeyStateKey];
      -[AXStickyKeysUIServer _handleStickyKeyUpdatedWithKeycode:usagePage:state:](self, "_handleStickyKeyUpdatedWithKeycode:usagePage:state:", v12, v14, [v15 integerValue]);

      break;
    case 0x2711uLL:
      [(AXStickyKeysUIServer *)self _handleStickyKeysDisabled];
      break;
    case 0x2710uLL:
      [(AXStickyKeysUIServer *)self _handleStickyKeysToggledViaShift];
      break;
    default:
      _AXLogWithFacility();
      break;
  }

  return 0;
}

+ (id)requiredEntitlementForProcessingMessageWithIdentifier:(unint64_t)a3
{
  return @"com.apple.accessibility.BackBoard";
}

- (void)_showUIIfNeeded
{
  v3 = [(AXStickyKeysUIServer *)self stickyKeysViewController];

  if (!v3)
  {
    v4 = objc_alloc_init(AXStickyKeysViewController);
    [(AXStickyKeysUIServer *)self setStickyKeysViewController:v4];

    id v6 = +[AXUIDisplayManager sharedDisplayManager];
    v5 = [(AXStickyKeysUIServer *)self stickyKeysViewController];
    [v6 addContentViewController:v5 withUserInteractionEnabled:0 forService:self];
  }
}

- (void)_handleStickyKeysToggledViaShift
{
}

- (void)_handleStickyKeysDisabled
{
  v3 = [(AXStickyKeysUIServer *)self stickyKeysViewController];

  if (v3)
  {
    v4 = [(AXStickyKeysUIServer *)self stickyKeysViewController];
    [(AXStickyKeysUIServer *)self setStickyKeysViewController:0];
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_5BA8;
    v6[3] = &unk_82E0;
    id v7 = v4;
    v8 = self;
    id v5 = v4;
    [v5 resetWithCompletion:v6];
  }
}

- (void)_playSoundForState:(int64_t)a3
{
  if (a3)
  {
    if (a3 == 2) {
      AudioServicesPlaySystemSound(0x44Fu);
    }
  }
  else
  {
    AudioServicesPlaySystemSound(0x450u);
  }
}

- (void)_handleStickyKeyUpdatedWithKeycode:(unsigned __int16)a3 usagePage:(unsigned int)a4 state:(int64_t)a5
{
  uint64_t v6 = *(void *)&a4;
  uint64_t v7 = a3;
  [(AXStickyKeysUIServer *)self _showUIIfNeeded];
  id v9 = [(AXStickyKeysUIServer *)self stickyKeysViewController];
  LODWORD(v6) = [v9 updateWithKeycode:v7 usagePage:v6 state:a5];

  if (v6)
  {
    id v10 = +[AXSettings sharedInstance];
    unsigned int v11 = [v10 stickyKeysBeepEnabled];

    if (v11)
    {
      [(AXStickyKeysUIServer *)self _playSoundForState:a5];
    }
  }
}

- (AXStickyKeysViewController)stickyKeysViewController
{
  return self->_stickyKeysViewController;
}

- (void)setStickyKeysViewController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
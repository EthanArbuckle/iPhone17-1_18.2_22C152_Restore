@interface GuidedAccessIntentHandler
- (void)handleStartGuidedAccess:(id)a3 completion:(id)a4;
@end

@implementation GuidedAccessIntentHandler

- (void)handleStartGuidedAccess:(id)a3 completion:(id)a4
{
  id v5 = a3;
  v6 = (void (**)(id, AXStartGuidedAccessIntentResponse *))a4;
  v7 = AXLogSiriShortcuts();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v13 = 138412290;
    uint64_t v14 = (uint64_t)v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "GuidedAccessIntentHandler: Handling intent %@", (uint8_t *)&v13, 0xCu);
  }

  uint64_t Availability = AXGuidedAccessGetAvailability();
  v9 = GAXLogCommon();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = _AXSGuidedAccessEnabled();
    int v13 = 134218240;
    uint64_t v14 = Availability;
    __int16 v15 = 1024;
    int v16 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Running shortcut for Guided Access; Guided Access availability: %lu\nGuided Access enabled in settings: %hhu",
      (uint8_t *)&v13,
      0x12u);
  }

  if (_AXSGuidedAccessEnabled())
  {
    uint64_t v11 = 100;
    switch(Availability)
    {
      case 0:
        _AXSGuidedAccessStartSession();
        uint64_t v11 = 4;
        break;
      case 3:
        uint64_t v11 = 103;
        break;
      case 6:
        uint64_t v11 = 104;
        break;
      case 10:
        uint64_t v11 = 101;
        break;
      case 11:
        uint64_t v11 = 102;
        break;
      case 12:
        break;
      default:
        uint64_t v11 = 5;
        break;
    }
  }
  else
  {
    uint64_t v11 = 100;
  }
  v12 = [[AXStartGuidedAccessIntentResponse alloc] initWithCode:v11 userActivity:0];
  v6[2](v6, v12);
}

@end
@interface ApplePayPresenceController
- (BOOL)isInIORegistry;
- (BOOL)pingNearField:(id *)a3;
- (BOOL)pingiPadNearField:(id *)a3;
- (BOOL)shouldOverrideUserNFC;
- (OSDStockholm)nearField;
- (id)checkPresence;
- (void)setNearField:(id)a3;
- (void)setShouldOverrideUserNFC:(BOOL)a3;
- (void)start;
- (void)teardown;
@end

@implementation ApplePayPresenceController

- (void)start
{
  v3 = (void *)MGCopyAnswer();
  if ([v3 isEqualToString:@"iPhone"]) {
    uint64_t v4 = MGGetBoolAnswer();
  }
  else {
    uint64_t v4 = 0;
  }
  [(ApplePayPresenceController *)self setShouldOverrideUserNFC:v4];
  v5 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v8[0] = 67109120;
    v8[1] = [(ApplePayPresenceController *)self shouldOverrideUserNFC];
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Apple Pay presence test will override user NFC enablement: %d", (uint8_t *)v8, 8u);
  }

  if (([(ApplePayPresenceController *)self isCancelled] & 1) == 0)
  {
    v6 = [(ApplePayPresenceController *)self checkPresence];
    v7 = [(ApplePayPresenceController *)self result];
    [v7 setStatusCode:v6];
  }
  [(ApplePayPresenceController *)self setFinished:1];
}

- (void)teardown
{
  if ([(ApplePayPresenceController *)self shouldOverrideUserNFC])
  {
    v3 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "End of Apple Pay presence test with overridden user NFC enablement. Ensuring original NFC enabled state is restored", v5, 2u);
    }

    uint64_t v4 = [(ApplePayPresenceController *)self nearField];
    [v4 restoreNfcEnabledState];
  }
}

- (OSDStockholm)nearField
{
  nearField = self->_nearField;
  if (!nearField)
  {
    uint64_t v4 = objc_alloc_init(OSDStockholm);
    v5 = self->_nearField;
    self->_nearField = v4;

    nearField = self->_nearField;
  }

  return nearField;
}

- (BOOL)pingNearField:(id *)a3
{
  uint64_t v4 = [(ApplePayPresenceController *)self nearField];
  unsigned int v5 = [v4 startCardEmulationWithTimeout:5.0];

  if (v5)
  {
    v6 = [(ApplePayPresenceController *)self nearField];
    [v6 stopCardEmulation:5.0];
  }
  return v5;
}

- (BOOL)pingiPadNearField:(id *)a3
{
  uint64_t v4 = [(ApplePayPresenceController *)self nearField];
  unsigned int v5 = [v4 serialNumber];

  BOOL valid = isValidSerialNumber(v5);
  if (!valid) {
    +[DAError setError:a3 withCode:1 format:@"Server registration info missing seId"];
  }

  return valid;
}

- (BOOL)isInIORegistry
{
  CFDictionaryRef v2 = IOServiceMatching("AppleStockholmControl");
  io_service_t MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v2);
  io_service_t v4 = MatchingService;
  if (MatchingService) {
    IOObjectRelease(MatchingService);
  }
  return v4 != 0;
}

- (id)checkPresence
{
  if ([(ApplePayPresenceController *)self isInIORegistry])
  {
    int v3 = MGGetBoolAnswer();
    if ([(ApplePayPresenceController *)self shouldOverrideUserNFC])
    {
      io_service_t v4 = [(ApplePayPresenceController *)self nearField];
      unsigned int v5 = [v4 overrideNfcEnabledState];

      if (!v5)
      {
        v10 = [(ApplePayPresenceController *)self nearField];
        unsigned int v11 = [v10 isNfcDisabledByProfile];

        id v7 = 0;
        if (v11) {
          v8 = &off_1000085D0;
        }
        else {
          v8 = &off_1000085E8;
        }
        goto LABEL_13;
      }
    }
    if (v3)
    {
      id v14 = 0;
      unsigned __int8 v6 = [(ApplePayPresenceController *)self pingiPadNearField:&v14];
      id v7 = v14;
      if (v6)
      {
LABEL_6:
        v8 = &off_1000085B8;
LABEL_13:

        return v8;
      }
    }
    else
    {
      id v13 = 0;
      unsigned int v9 = [(ApplePayPresenceController *)self pingNearField:&v13];
      id v7 = v13;
      if (v9) {
        goto LABEL_6;
      }
    }
    v8 = &off_1000085A0;
    goto LABEL_13;
  }
  return &off_100008588;
}

- (void)setNearField:(id)a3
{
}

- (BOOL)shouldOverrideUserNFC
{
  return self->_shouldOverrideUserNFC;
}

- (void)setShouldOverrideUserNFC:(BOOL)a3
{
  self->_shouldOverrideUserNFC = a3;
}

- (void).cxx_destruct
{
}

@end
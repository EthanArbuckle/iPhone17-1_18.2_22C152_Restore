uint64_t _AXLogWithFacility()
{
  return MEMORY[0x270F0A408]();
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

void objc_release(id a1)
{
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

void objc_storeStrong(id *location, id obj)
{
}

ocalizationCaptionService);
  return MEMORY[0x270F9A758]();
}

- (id)_clientIdentifier
{
  v2 = [MEMORY[0x263F08AB0] processInfo];
  uint64_t v3 = [v2 processIdentifier];

  v4 = NSString;
  v5 = [NSNumber numberWithInt:v3];
  v6 = [v4 stringWithFormat:@"AXLocalizationCaptionService-%@", v5];

  return v6;
}

- (AXUIClient)client
{
  client = self->_client;
  if (!client)
  {
    v4 = [(AXLocalizationCaptionService *)self _clientIdentifier];
    v5 = (AXUIClient *)[objc_alloc(MEMORY[0x263F22198]) initWithIdentifier:v4 serviceBundleName:@"AXLocalizationCaptionServer"];
    v6 = self->_client;
    self->_client = v5;

    [(AXUIClient *)self->_client setDelegate:self];
    client = self->_client;
  }
  return client;
}

+ (void)_sendMessage:(id)a3 withIdentifier:(unint64_t)a4 errorHandler:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  v10 = [a1 service];
  v11 = [v10 client];
  v12 = [MEMORY[0x263F227F8] mainAccessQueue];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __73__AXLocalizationCaptionService__sendMessage_withIdentifier_errorHandler___block_invoke;
  v14[3] = &unk_264774F18;
  id v15 = v8;
  id v13 = v8;
  [v11 sendAsynchronousMessage:v9 withIdentifier:a4 targetAccessQueue:v12 completion:v14];
}

void __73__AXLocalizationCaptionService__sendMessage_withIdentifier_errorHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  if (v5) {
    _AXLogWithFacility();
  }
  uint64_t v6 = *(void *)(a1 + 32);
  if (v6) {
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v5);
  }
}

- (void)connectionWithServiceWasInterruptedForUserInterfaceClient:(id)a3
{
  uint64_t v3 = objc_msgSend(MEMORY[0x263F22938], "sharedInstance", a3);
  int v4 = [v3 localizationQACaptionMode];

  if (v4)
  {
    id v5 = objc_opt_class();
    [v5 startService];
  }
}

+ (void)startService
{
}

+ (void)stopService
{
}

- (void)setClient:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
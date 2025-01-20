@interface DIClient2Controller_XPCHandler
- (BOOL)GUIAskForPassphraseWithEncryptionFrontend:(id)a3 error:(id *)a4;
- (BOOL)connectWithError:(id *)a3;
- (BOOL)createAndStoreInSystemKeychainWithCreator:(id)a3 account:(id)a4 error:(id *)a5;
- (BOOL)keychainUnlockWithEncryptionUnlocker:(id)a3 error:(id *)a4;
- (id)newAttachWithParams:(id)a3 error:(id *)a4;
- (id)remoteObjectInterface;
- (id)serviceName;
@end

@implementation DIClient2Controller_XPCHandler

- (id)serviceName
{
  return @"com.apple.diskimagescontroller";
}

- (id)remoteObjectInterface
{
  return (id)[MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26CF57508];
}

- (BOOL)connectWithError:(id *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)DIClient2Controller_XPCHandler;
  BOOL v5 = -[DIBaseXPCHandler connectWithError:](&v7, sel_connectWithError_);
  if (v5)
  {
    if (DIForwardLogs()) {
      LOBYTE(v5) = [(DIBaseXPCHandler *)self dupStderrWithError:a3];
    }
    else {
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (id)newAttachWithParams:(id)a3 error:(id *)a4
{
  id v6 = a3;
  objc_initWeak(&location, self);
  objc_super v7 = objc_alloc_init(DIController2ClientDelegate);
  v8 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26CF52F30];
  v9 = [(DIBaseXPCHandler *)self connection];
  [v9 setExportedInterface:v8];

  v10 = [(DIBaseXPCHandler *)self connection];
  [v10 setExportedObject:v7];

  v11 = [(DIBaseXPCHandler *)self remoteProxy];
  uint64_t v14 = MEMORY[0x263EF8330];
  uint64_t v15 = 3221225472;
  v16 = __60__DIClient2Controller_XPCHandler_newAttachWithParams_error___block_invoke;
  v17 = &unk_2644A2388;
  objc_copyWeak(&v18, &location);
  [v11 attachWithParams:v6 reply:&v14];

  if (-[DIBaseXPCHandler completeCommandWithError:](self, "completeCommandWithError:", a4, v14, v15, v16, v17))
  {
    v12 = [(DIController2ClientDelegate *)v7 deviceHandle];
  }
  else
  {
    v12 = 0;
  }
  objc_destroyWeak(&v18);

  objc_destroyWeak(&location);
  return v12;
}

- (BOOL)keychainUnlockWithEncryptionUnlocker:(id)a3 error:(id *)a4
{
  id v6 = a3;
  objc_initWeak(&location, self);
  objc_super v7 = [(DIBaseXPCHandler *)self remoteProxy];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __77__DIClient2Controller_XPCHandler_keychainUnlockWithEncryptionUnlocker_error___block_invoke;
  v10[3] = &unk_2644A23F8;
  objc_copyWeak(&v12, &location);
  id v8 = v6;
  id v11 = v8;
  [v7 keychainUnlockWithEncryptionUnlocker:v8 reply:v10];

  LOBYTE(a4) = [(DIBaseXPCHandler *)self completeCommandWithError:a4];
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

  return (char)a4;
}

- (BOOL)GUIAskForPassphraseWithEncryptionFrontend:(id)a3 error:(id *)a4
{
  id v6 = a3;
  objc_initWeak(&location, self);
  objc_super v7 = [(DIBaseXPCHandler *)self remoteProxy];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __82__DIClient2Controller_XPCHandler_GUIAskForPassphraseWithEncryptionFrontend_error___block_invoke;
  v10[3] = &unk_2644A2420;
  objc_copyWeak(&v12, &location);
  id v8 = v6;
  id v11 = v8;
  [v7 GUIAskForPassphraseWithEncryptionFrontend:v8 reply:v10];

  LOBYTE(a4) = [(DIBaseXPCHandler *)self completeCommandWithError:a4];
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

  return (char)a4;
}

- (BOOL)createAndStoreInSystemKeychainWithCreator:(id)a3 account:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  objc_initWeak(&location, self);
  v10 = [(DIBaseXPCHandler *)self remoteProxy];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __90__DIClient2Controller_XPCHandler_createAndStoreInSystemKeychainWithCreator_account_error___block_invoke;
  v13[3] = &unk_2644A2448;
  objc_copyWeak(&v15, &location);
  id v11 = v8;
  id v14 = v11;
  [v10 createAndStoreInSystemKeychainWithCreator:v11 account:v9 reply:v13];

  LOBYTE(a5) = [(DIBaseXPCHandler *)self completeCommandWithError:a5];
  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

  return (char)a5;
}

@end
@interface NSExtension(AuthenticationServicesExtras)
- (id)_as_auxiliaryRemoteObjectWithRequestID:()AuthenticationServicesExtras;
- (void)_as_instantiateViewControllerWithConnectionHandler:()AuthenticationServicesExtras;
@end

@implementation NSExtension(AuthenticationServicesExtras)

- (void)_as_instantiateViewControllerWithConnectionHandler:()AuthenticationServicesExtras
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __96__NSExtension_AuthenticationServicesExtras___as_instantiateViewControllerWithConnectionHandler___block_invoke;
    v6[3] = &unk_264395DA0;
    id v7 = v4;
    [a1 instantiateViewControllerWithInputItems:MEMORY[0x263EFFA68] connectionHandler:v6];
  }
}

- (id)_as_auxiliaryRemoteObjectWithRequestID:()AuthenticationServicesExtras
{
  v2 = objc_msgSend(a1, "_extensionContextForUUID:");
  v3 = [v2 _auxiliaryConnection];
  id v4 = [v3 remoteObjectProxy];

  if (!v4) {
    goto LABEL_10;
  }
  v5 = [a1 extensionPointIdentifier];
  int v6 = [v5 isEqualToString:*MEMORY[0x263F665F8]];

  if (!v6)
  {
    id v7 = [a1 extensionPointIdentifier];
    int v8 = [v7 isEqualToString:*MEMORY[0x263F665C0]];

    if (!v8) {
      goto LABEL_10;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0 || ![v4 conformsToProtocol:&unk_26CABCC00]) {
      goto LABEL_10;
    }
LABEL_9:
    id v9 = v4;
    goto LABEL_11;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 && ([v4 conformsToProtocol:&unk_26CACB9A0]) {
    goto LABEL_9;
  }
LABEL_10:
  id v9 = 0;
LABEL_11:

  return v9;
}

@end
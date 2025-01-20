@interface _INUIExtensionContext
+ (id)_extensionAuxiliaryHostProtocol;
+ (id)_extensionAuxiliaryVendorProtocol;
- (CGSize)_bestAllowedSizeForAllowedSizesDictionary:(id)a3;
- (CGSize)hostedViewMaximumAllowedSize;
- (CGSize)hostedViewMinimumAllowedSize;
- (_INUIExtensionContext)initWithInputItems:(id)a3 listenerEndpoint:(id)a4 contextUUID:(id)a5;
- (_INUIRemoteViewControllerServing)viewController;
- (id)_errorHandlingHostProxy;
- (id)interfaceParametersDescription;
- (void)_requestHandlingOfIntent:(id)a3;
- (void)_willBeginEditing;
- (void)configureForParameters:(id)a3 ofInteraction:(id)a4 interactiveBehavior:(unint64_t)a5 context:(unint64_t)a6 completion:(id)a7;
- (void)desiresInteractivity:(id)a3;
- (void)queryRepresentedPropertiesWithCompletion:(id)a3;
- (void)setExtensionContextState:(id)a3 completion:(id)a4;
- (void)setViewController:(id)a3;
- (void)viewWasCancelled;
@end

@implementation _INUIExtensionContext

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_viewController);

  objc_storeStrong((id *)&self->_currentExtensionContextState, 0);
}

- (void)setViewController:(id)a3
{
}

- (_INUIRemoteViewControllerServing)viewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_viewController);

  return (_INUIRemoteViewControllerServing *)WeakRetained;
}

- (void)viewWasCancelled
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __41___INUIExtensionContext_viewWasCancelled__block_invoke;
  block[3] = &unk_263FD6DB8;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

- (void)queryRepresentedPropertiesWithCompletion:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __66___INUIExtensionContext_queryRepresentedPropertiesWithCompletion___block_invoke;
  v6[3] = &unk_263FD6C40;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

- (void)desiresInteractivity:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __46___INUIExtensionContext_desiresInteractivity___block_invoke;
  v6[3] = &unk_263FD6C40;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

- (void)configureForParameters:(id)a3 ofInteraction:(id)a4 interactiveBehavior:(unint64_t)a5 context:(unint64_t)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a7;
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __101___INUIExtensionContext_configureForParameters_ofInteraction_interactiveBehavior_context_completion___block_invoke;
  v18[3] = &unk_263FD68D8;
  v18[4] = self;
  id v19 = v12;
  unint64_t v22 = a5;
  unint64_t v23 = a6;
  id v20 = v13;
  id v21 = v14;
  id v15 = v14;
  id v16 = v13;
  id v17 = v12;
  dispatch_async(MEMORY[0x263EF83A0], v18);
}

- (void)_willBeginEditing
{
  id v2 = [(_INUIExtensionContext *)self _errorHandlingHostProxy];
  [v2 willBeginEditing];
}

- (void)_requestHandlingOfIntent:(id)a3
{
  id v5 = a3;
  if (INThisProcessHasEntitlement())
  {
    id v4 = [(_INUIExtensionContext *)self _errorHandlingHostProxy];
    [v4 requestHandlingOfIntent:v5];
  }
}

- (id)interfaceParametersDescription
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263F089D8] string];
  id v4 = [(_INUIExtensionContextState *)self->_currentExtensionContextState interfaceSections];
  uint64_t v5 = [v4 count];

  if (v5)
  {
    unint64_t v6 = 0;
    unint64_t v23 = self;
    do
    {
      id v7 = [(_INUIExtensionContextState *)self->_currentExtensionContextState interfaceSections];
      v8 = [v7 objectAtIndex:v6];

      if (v6) {
        [v3 appendString:@"\n\n"];
      }
      objc_msgSend(v3, "appendFormat:", @"Section %zd:\n", ++v6);
      [v3 appendString:@"\tParameters:\n"];
      long long v26 = 0u;
      long long v27 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      v9 = [v8 parameters];
      uint64_t v10 = [v9 countByEnumeratingWithState:&v24 objects:v28 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v25;
        do
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v25 != v12) {
              objc_enumerationMutation(v9);
            }
            id v14 = *(void **)(*((void *)&v24 + 1) + 8 * i);
            id v15 = NSStringFromClass((Class)[v14 parameterClass]);
            id v16 = [v14 parameterKeyPath];
            [v3 appendFormat:@"\t\t%@ - %@\n", v15, v16];
          }
          uint64_t v11 = [v9 countByEnumeratingWithState:&v24 objects:v28 count:16];
        }
        while (v11);
      }

      uint64_t v17 = [v8 interactiveBehavior];
      v18 = @"None";
      if ((unint64_t)(v17 - 1) <= 2) {
        v18 = off_263FD68F8[v17 - 1];
      }
      [v3 appendFormat:@"\tInteractive Behavior: %@", v18];

      self = v23;
      id v19 = [(_INUIExtensionContextState *)v23->_currentExtensionContextState interfaceSections];
      unint64_t v20 = [v19 count];
    }
    while (v6 < v20);
  }
  id v21 = (void *)[v3 copy];

  return v21;
}

- (CGSize)_bestAllowedSizeForAllowedSizesDictionary:(id)a3
{
  double v3 = _INUIUtilitiesBestFittingSizeForSizeBySystemVersionDictionary(a3);
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGSize)hostedViewMaximumAllowedSize
{
  double v3 = [(_INUIExtensionContextState *)self->_currentExtensionContextState hostedViewMaximumAllowedSizes];
  [(_INUIExtensionContext *)self _bestAllowedSizeForAllowedSizesDictionary:v3];
  double v5 = v4;
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (CGSize)hostedViewMinimumAllowedSize
{
  double v3 = [(_INUIExtensionContextState *)self->_currentExtensionContextState hostedViewMinimumAllowedSizes];
  [(_INUIExtensionContext *)self _bestAllowedSizeForAllowedSizesDictionary:v3];
  double v5 = v4;
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (void)setExtensionContextState:(id)a3 completion:(id)a4
{
  double v6 = (_INUIExtensionContextState *)a3;
  id v9 = a4;
  currentExtensionContextState = self->_currentExtensionContextState;
  self->_currentExtensionContextState = v6;

  double v8 = v9;
  if (v9)
  {
    (*((void (**)(id))v9 + 2))(v9);
    double v8 = v9;
  }
}

- (id)_errorHandlingHostProxy
{
  id v2 = [(_INUIExtensionContext *)self _auxiliaryConnection];
  double v3 = [v2 remoteObjectProxyWithErrorHandler:&__block_literal_global_439];

  return v3;
}

- (_INUIExtensionContext)initWithInputItems:(id)a3 listenerEndpoint:(id)a4 contextUUID:(id)a5
{
  v10.receiver = self;
  v10.super_class = (Class)_INUIExtensionContext;
  double v5 = [(_INUIExtensionContext *)&v10 initWithInputItems:a3 listenerEndpoint:a4 contextUUID:a5];
  double v6 = v5;
  if (v5)
  {
    currentExtensionContextState = v5->_currentExtensionContextState;
    v5->_currentExtensionContextState = 0;

    double v8 = [MEMORY[0x263F0FD88] sharedPreferences];
    [v8 _updateWithExtensionContext:v6];
  }
  return v6;
}

+ (id)_extensionAuxiliaryVendorProtocol
{
  return +[_INUIXPCInterfaceUtilities extensionContextVendingInterface];
}

+ (id)_extensionAuxiliaryHostProtocol
{
  return +[_INUIXPCInterfaceUtilities extensionContextHostingInterface];
}

@end
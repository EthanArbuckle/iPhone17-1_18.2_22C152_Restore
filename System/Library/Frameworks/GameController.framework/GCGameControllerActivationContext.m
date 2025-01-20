@interface GCGameControllerActivationContext
- (GCGameControllerActivationContext)initWithPreviousApplication:(id)a3;
- (NSString)previousApplicationBundleID;
- (id)asBSActionWithResponder:(id)a3 error:(id *)a4;
@end

@implementation GCGameControllerActivationContext

- (GCGameControllerActivationContext)initWithPreviousApplication:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)GCGameControllerActivationContext;
  id v3 = a3;
  v4 = [(GCGameControllerActivationContext *)&v8 init];
  uint64_t v5 = objc_msgSend(v3, "copy", v8.receiver, v8.super_class);

  previousApplicationBundleID = v4->_previousApplicationBundleID;
  v4->_previousApplicationBundleID = (NSString *)v5;

  return v4;
}

- (NSString)previousApplicationBundleID
{
  return self->_previousApplicationBundleID;
}

- (void).cxx_destruct
{
}

- (id)asBSActionWithResponder:(id)a3 error:(id *)a4
{
  lazy protocol witness table accessor for type GCGameControllerConnectingOptionDefinition and conformance GCGameControllerConnectingOptionDefinition();
  id v6 = a3;
  v7 = self;
  objc_super v8 = (void *)static UISceneConnectionOptionDefinition.createAction(payload:responder:)();

  return v8;
}

@end
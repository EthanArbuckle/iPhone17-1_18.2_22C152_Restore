@interface _EXHostViewControllerSessionConfiguration
- (BOOL)_shouldHostRemoteTextEffectsWindow;
- (BOOL)beginHostingImmediately;
- (BOOL)retryOnHostingFailure;
- (CGRect)initialFrame;
- (NSString)sceneIdentifier;
- (_EXHostViewControllerSessionConfiguration)initWithSceneIdentifier:(id)a3;
- (_EXSceneInitializationParameters)initializationParameters;
- (id)copyWithZone:(_NSZone *)a3;
- (id)invalidationHandler;
- (int64_t)sizeBridgingOptions;
- (void)setBeginHostingImmediately:(BOOL)a3;
- (void)setInitialFrame:(CGRect)a3;
- (void)setInitializationParameters:(id)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)setRetryOnHostingFailure:(BOOL)a3;
- (void)setSceneIdentifier:(id)a3;
- (void)setSizeBridgingOptions:(int64_t)a3;
- (void)set_shouldHostRemoteTextEffectsWindow:(BOOL)a3;
@end

@implementation _EXHostViewControllerSessionConfiguration

- (_EXHostViewControllerSessionConfiguration)initWithSceneIdentifier:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_EXHostViewControllerSessionConfiguration;
  v6 = [(_EXHostViewControllerSessionConfiguration *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_sceneIdentifier, a3);
    initializationParameters = v7->_initializationParameters;
    v7->_initializationParameters = 0;

    v9 = [MEMORY[0x263F04DB8] sharedInstance];
    v7->_beginHostingImmediately = [v9 startUIHostingSessionImmediately];

    v7->_sizeBridgingOptions = -1;
    v7->__shouldHostRemoteTextEffectsWindow = 1;
  }

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_opt_class();
  v4 = objc_opt_new();
  id v5 = (void *)[(NSString *)self->_sceneIdentifier copy];
  [v4 setSceneIdentifier:v5];

  [v4 setInitializationParameters:self->_initializationParameters];
  [v4 setBeginHostingImmediately:self->_beginHostingImmediately];
  [v4 setSizeBridgingOptions:self->_sizeBridgingOptions];
  objc_msgSend(v4, "setInitialFrame:", self->_initialFrame.origin.x, self->_initialFrame.origin.y, self->_initialFrame.size.width, self->_initialFrame.size.height);
  [v4 setInvalidationHandler:self->_invalidationHandler];
  objc_msgSend(v4, "set_shouldHostRemoteTextEffectsWindow:", self->__shouldHostRemoteTextEffectsWindow);
  return v4;
}

- (NSString)sceneIdentifier
{
  return self->_sceneIdentifier;
}

- (void)setSceneIdentifier:(id)a3
{
}

- (_EXSceneInitializationParameters)initializationParameters
{
  return self->_initializationParameters;
}

- (void)setInitializationParameters:(id)a3
{
}

- (CGRect)initialFrame
{
  double x = self->_initialFrame.origin.x;
  double y = self->_initialFrame.origin.y;
  double width = self->_initialFrame.size.width;
  double height = self->_initialFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setInitialFrame:(CGRect)a3
{
  self->_initialFrame = a3;
}

- (id)invalidationHandler
{
  return objc_getProperty(self, a2, 32, 1);
}

- (void)setInvalidationHandler:(id)a3
{
}

- (BOOL)_shouldHostRemoteTextEffectsWindow
{
  return self->__shouldHostRemoteTextEffectsWindow;
}

- (void)set_shouldHostRemoteTextEffectsWindow:(BOOL)a3
{
  self->__shouldHostRemoteTextEffectsWindow = a3;
}

- (BOOL)beginHostingImmediately
{
  return self->_beginHostingImmediately;
}

- (void)setBeginHostingImmediately:(BOOL)a3
{
  self->_beginHostingImmediateldouble y = a3;
}

- (int64_t)sizeBridgingOptions
{
  return self->_sizeBridgingOptions;
}

- (void)setSizeBridgingOptions:(int64_t)a3
{
  self->_sizeBridgingOptions = a3;
}

- (BOOL)retryOnHostingFailure
{
  return self->_retryOnHostingFailure;
}

- (void)setRetryOnHostingFailure:(BOOL)a3
{
  self->_retryOnHostingFailure = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong((id *)&self->_initializationParameters, 0);

  objc_storeStrong((id *)&self->_sceneIdentifier, 0);
}

@end
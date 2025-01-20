@interface MessageUIWebProcessPlugIn
- (BOOL)blockRemoteContent;
- (BOOL)isPad;
- (MessageUIWebProcessPlugIn)init;
- (NSString)defaultComposeFontFamily;
- (NSString)remoteContentProxySchemePrefix;
- (double)defaultComposeFontPixelSize;
- (void)webProcessPlugIn:(id)a3 didCreateBrowserContextController:(id)a4;
- (void)webProcessPlugIn:(id)a3 initializeWithObject:(id)a4;
- (void)webProcessPlugIn:(id)a3 willDestroyBrowserContextController:(id)a4;
@end

@implementation MessageUIWebProcessPlugIn

- (MessageUIWebProcessPlugIn)init
{
  v6.receiver = self;
  v6.super_class = (Class)MessageUIWebProcessPlugIn;
  v2 = [(MessageUIWebProcessPlugIn *)&v6 init];
  if (v2)
  {
    uint64_t v3 = +[NSMapTable strongToStrongObjectsMapTable];
    fieldControllersByContext = v2->_fieldControllersByContext;
    v2->_fieldControllersByContext = (NSMapTable *)v3;
  }
  return v2;
}

- (BOOL)isPad
{
  v2 = [(WKWebProcessPlugInController *)self->_controller parameters];
  uint64_t v3 = [v2 valueForKey:@"isPad"];
  unsigned __int8 v4 = [v3 BOOLValue];

  return v4;
}

- (double)defaultComposeFontPixelSize
{
  v2 = [(WKWebProcessPlugInController *)self->_controller parameters];
  uint64_t v3 = [v2 valueForKey:@"defaultComposeFontPixelSize"];
  [v3 doubleValue];
  double v5 = v4;

  return v5;
}

- (NSString)defaultComposeFontFamily
{
  v2 = [(WKWebProcessPlugInController *)self->_controller parameters];
  uint64_t v3 = [v2 valueForKey:@"defaultComposeFontFamily"];

  return (NSString *)v3;
}

- (BOOL)blockRemoteContent
{
  v2 = [(WKWebProcessPlugInController *)self->_controller parameters];
  uint64_t v3 = [v2 valueForKey:EMUserDefaultLoadRemoteContentKey];

  unint64_t v4 = ((unint64_t)[v3 integerValue] >> 1) & 1;
  return v4;
}

- (NSString)remoteContentProxySchemePrefix
{
  v2 = [(WKWebProcessPlugInController *)self->_controller parameters];
  uint64_t v3 = [v2 valueForKey:@"remoteContentProxySchemePrefix"];

  return (NSString *)v3;
}

- (void)webProcessPlugIn:(id)a3 initializeWithObject:(id)a4
{
}

- (void)webProcessPlugIn:(id)a3 didCreateBrowserContextController:(id)a4
{
  id v6 = a4;
  double v5 = [[ComposeBodyFieldBundleController alloc] initWithPlugIn:self contextController:v6];
  [(NSMapTable *)self->_fieldControllersByContext setObject:v5 forKey:v6];
}

- (void)webProcessPlugIn:(id)a3 willDestroyBrowserContextController:(id)a4
{
  id v6 = a4;
  double v5 = -[NSMapTable objectForKey:](self->_fieldControllersByContext, "objectForKey:");
  [v5 invalidate];
  [(NSMapTable *)self->_fieldControllersByContext removeObjectForKey:v6];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fieldControllersByContext, 0);

  objc_storeStrong((id *)&self->_controller, 0);
}

@end
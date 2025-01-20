@interface EmailCoreWebProcessPlugin
- (EmailCoreWebProcessPlugin)init;
- (void)webProcessPlugIn:(id)a3 didCreateBrowserContextController:(id)a4;
- (void)webProcessPlugIn:(id)a3 initializeWithObject:(id)a4;
- (void)webProcessPlugIn:(id)a3 willDestroyBrowserContextController:(id)a4;
@end

@implementation EmailCoreWebProcessPlugin

- (EmailCoreWebProcessPlugin)init
{
  v6.receiver = self;
  v6.super_class = (Class)EmailCoreWebProcessPlugin;
  v2 = [(EmailCoreWebProcessPlugin *)&v6 init];
  if (v2)
  {
    uint64_t v3 = +[NSMapTable strongToStrongObjectsMapTable];
    pageControllersByContext = v2->_pageControllersByContext;
    v2->_pageControllersByContext = (NSMapTable *)v3;
  }
  return v2;
}

- (void)webProcessPlugIn:(id)a3 initializeWithObject:(id)a4
{
}

- (void)webProcessPlugIn:(id)a3 didCreateBrowserContextController:(id)a4
{
  id v6 = a4;
  v5 = [[ECBundlePageController_iOS alloc] initWithPlugIn:self contextController:v6];
  [(NSMapTable *)self->_pageControllersByContext setObject:v5 forKey:v6];
}

- (void)webProcessPlugIn:(id)a3 willDestroyBrowserContextController:(id)a4
{
  id v6 = a4;
  v5 = -[NSMapTable objectForKey:](self->_pageControllersByContext, "objectForKey:");
  [v5 invalidate];
  [(NSMapTable *)self->_pageControllersByContext removeObjectForKey:v6];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pageControllersByContext, 0);
  objc_storeStrong((id *)&self->_controller, 0);
}

@end
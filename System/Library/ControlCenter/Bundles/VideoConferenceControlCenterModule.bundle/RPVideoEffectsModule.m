@interface RPVideoEffectsModule
- (RPVideoEffectsModule)init;
- (id)contentViewControllerForContext:(id)a3;
- (void)dealloc;
- (void)setContentModuleContext:(id)a3;
@end

@implementation RPVideoEffectsModule

- (RPVideoEffectsModule)init
{
  v3.receiver = self;
  v3.super_class = (Class)RPVideoEffectsModule;
  return [(RPVideoEffectsModule *)&v3 init];
}

- (id)contentViewControllerForContext:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = _os_feature_enabled_impl();
  v6 = (char *)[v4 environment];
  v7 = &off_68C28;
  if (((v6 != (unsigned char *)&dword_0 + 1) & v5) == 0) {
    v7 = &off_68B28;
  }
  id v8 = objc_alloc_init(*v7);
  objc_msgSend(v8, "setShouldLoadFromSensor:", objc_msgSend(v4, "environment") != (char *)&dword_0 + 2);
  [v8 setContentModuleContext:self->_contentModuleContext];
  objc_storeStrong((id *)&self->_currentContentViewController, v8);

  return v8;
}

- (void)setContentModuleContext:(id)a3
{
}

- (void)dealloc
{
  currentContentViewController = self->_currentContentViewController;
  self->_currentContentViewController = 0;

  contentModuleContext = self->_contentModuleContext;
  self->_contentModuleContext = 0;

  v5.receiver = self;
  v5.super_class = (Class)RPVideoEffectsModule;
  [(RPVideoEffectsModule *)&v5 dealloc];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentModuleContext, 0);

  objc_storeStrong((id *)&self->_currentContentViewController, 0);
}

@end
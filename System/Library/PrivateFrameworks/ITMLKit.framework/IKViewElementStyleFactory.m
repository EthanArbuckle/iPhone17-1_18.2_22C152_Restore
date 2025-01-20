@interface IKViewElementStyleFactory
+ (IKViewElementStyleFactory)styleFactoryWithMarkup:(id)a3 styleSheet:(id)a4;
- (IKStyleFactory)styleFactory;
- (IKTemplateStyleSheet)styleSheet;
- (IKViewElementStyleFactory)initWithMarkup:(id)a3 styleSheet:(id)a4;
- (id)styleComposerForElement:(id)a3 elementStyleOverrides:(id)a4;
- (void)setViewElementStylesDirty;
@end

@implementation IKViewElementStyleFactory

+ (IKViewElementStyleFactory)styleFactoryWithMarkup:(id)a3 styleSheet:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)[objc_alloc((Class)a1) initWithMarkup:v7 styleSheet:v6];

  return (IKViewElementStyleFactory *)v8;
}

- (IKViewElementStyleFactory)initWithMarkup:(id)a3 styleSheet:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)IKViewElementStyleFactory;
  v8 = [(IKViewElementStyleFactory *)&v12 init];
  if (v8)
  {
    uint64_t v9 = +[IKStyleFactory styleFactoryWithMarkup:v6 filterBlockedStyles:1];
    styleFactory = v8->_styleFactory;
    v8->_styleFactory = (IKStyleFactory *)v9;

    objc_storeStrong((id *)&v8->_styleSheet, a4);
  }

  return v8;
}

- (id)styleComposerForElement:(id)a3 elementStyleOverrides:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(IKViewElementStyleFactory *)self styleSheet];
  uint64_t v9 = [v8 styleComposerForElement:v7];

  v10 = [v7 parentStyleableElement];

  v11 = [v10 styleComposer];

  objc_super v12 = [(IKViewElementStyleFactory *)self styleFactory];
  v13 = [v6 classDescriptorString];
  v14 = [v12 styleListForClassSelector:v13];

  v15 = +[IKViewElementStyleComposer styleComposerWithDefaultStyleComposer:v9 parentStyleComposer:v11 styleList:v14 elementStyleOverrides:v6];

  return v15;
}

- (void)setViewElementStylesDirty
{
  v3 = [(IKViewElementStyleFactory *)self styleSheet];
  [v3 setViewElementStylesDirty];

  id v4 = [(IKViewElementStyleFactory *)self styleFactory];
  [v4 setViewElementStylesDirty];
}

- (IKTemplateStyleSheet)styleSheet
{
  return self->_styleSheet;
}

- (IKStyleFactory)styleFactory
{
  return self->_styleFactory;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_styleFactory, 0);
  objc_storeStrong((id *)&self->_styleSheet, 0);
}

@end
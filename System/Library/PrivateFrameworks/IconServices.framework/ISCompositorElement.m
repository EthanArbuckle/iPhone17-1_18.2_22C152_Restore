@interface ISCompositorElement
- (ISCompositorElement)initWithRecipe:(id)a3 resourceProvider:(id)a4;
- (ISCompositorElement)initWithRecipe:(id)a3 resourceProvider:(id)a4 additionalResources:(id)a5;
- (ISCompositorRecipe)recipe;
- (ISCompositorResourceProvider)resourceProvider;
- (NSDictionary)additionalResources;
- (id)resourceForKey:(id)a3;
- (id)resourceNamed:(id)a3;
@end

@implementation ISCompositorElement

- (ISCompositorElement)initWithRecipe:(id)a3 resourceProvider:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ISCompositorElement;
  v9 = [(ISCompositorElement *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_recipe, a3);
    objc_storeStrong((id *)&v10->_resourceProvider, a4);
  }

  return v10;
}

- (ISCompositorElement)initWithRecipe:(id)a3 resourceProvider:(id)a4 additionalResources:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)ISCompositorElement;
  objc_super v12 = [(ISCompositorElement *)&v17 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_recipe, a3);
    objc_storeStrong((id *)&v13->_resourceProvider, a4);
    uint64_t v14 = [v11 copy];
    additionalResources = v13->_additionalResources;
    v13->_additionalResources = (NSDictionary *)v14;
  }
  return v13;
}

- (ISCompositorResourceProvider)resourceProvider
{
  if (!self->_additionalResources) {
    self = (ISCompositorElement *)self->_resourceProvider;
  }
  v2 = self;
  return (ISCompositorResourceProvider *)v2;
}

- (id)resourceForKey:(id)a3
{
  id v4 = a3;
  char v5 = objc_opt_respondsToSelector();
  resourceProvider = self->_resourceProvider;
  if (v5)
  {
    id v7 = [(ISCompositorResourceProvider *)resourceProvider resourceForKey:v4];
  }
  else
  {
    uint64_t v8 = [v4 name];

    id v7 = [(ISCompositorResourceProvider *)resourceProvider resourceNamed:v8];
    id v4 = (id)v8;
  }

  return v7;
}

- (id)resourceNamed:(id)a3
{
  id v4 = a3;
  char v5 = [(ISCompositorResourceProvider *)self->_resourceProvider resourceNamed:v4];
  if (!v5)
  {
    char v5 = [(NSDictionary *)self->_additionalResources _IS_resourceNamed:v4];
  }

  return v5;
}

- (ISCompositorRecipe)recipe
{
  return (ISCompositorRecipe *)objc_getProperty(self, a2, 8, 1);
}

- (NSDictionary)additionalResources
{
  return (NSDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_additionalResources, 0);
  objc_storeStrong((id *)&self->_resourceProvider, 0);
  objc_storeStrong((id *)&self->_recipe, 0);
}

@end
@interface _ISCompositorElement
- (ISCompositorRecipe)recipe;
- (NSMutableDictionary)resourceByName;
- (_ISCompositorElement)init;
- (_ISCompositorElement)initWithRecipe:(id)a3 resources:(id)a4;
- (id)resourceNamed:(id)a3;
- (void)addResourcesFromDictionary:(id)a3;
- (void)clearResources;
- (void)setRecipe:(id)a3;
- (void)setResource:(id)a3 forName:(id)a4;
@end

@implementation _ISCompositorElement

- (_ISCompositorElement)init
{
  v3 = objc_alloc_init(ISGenericRecipe);
  v4 = [MEMORY[0x1E4F1CA60] dictionary];
  v5 = [(_ISCompositorElement *)self initWithRecipe:v3 resources:v4];

  return v5;
}

- (_ISCompositorElement)initWithRecipe:(id)a3 resources:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)_ISCompositorElement;
  v9 = [(_ISCompositorElement *)&v13 init];
  if (v9)
  {
    uint64_t v10 = [MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v8];
    resourceByName = v9->_resourceByName;
    v9->_resourceByName = (NSMutableDictionary *)v10;

    objc_storeStrong((id *)&v9->_recipe, a3);
  }

  return v9;
}

- (void)setResource:(id)a3 forName:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  id v7 = [(_ISCompositorElement *)self resourceByName];
  id v8 = v7;
  if (v9) {
    [v7 setObject:v9 forKey:v6];
  }
  else {
    [v7 removeObjectForKey:v6];
  }
}

- (void)addResourcesFromDictionary:(id)a3
{
  id v4 = a3;
  id v5 = [(_ISCompositorElement *)self resourceByName];
  [v5 addEntriesFromDictionary:v4];
}

- (void)clearResources
{
  self->_resourceByName = [MEMORY[0x1E4F1CA60] dictionary];
  MEMORY[0x1F41817F8]();
}

- (id)resourceNamed:(id)a3
{
  id v4 = a3;
  id v5 = [(_ISCompositorElement *)self resourceByName];
  id v6 = objc_msgSend(v5, "_IS_resourceNamed:", v4);

  return v6;
}

- (ISCompositorRecipe)recipe
{
  return (ISCompositorRecipe *)objc_getProperty(self, a2, 8, 1);
}

- (void)setRecipe:(id)a3
{
}

- (NSMutableDictionary)resourceByName
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resourceByName, 0);
  objc_storeStrong((id *)&self->_recipe, 0);
}

@end
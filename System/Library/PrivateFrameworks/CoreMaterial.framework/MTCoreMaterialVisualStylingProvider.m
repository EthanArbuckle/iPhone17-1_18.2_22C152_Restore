@interface MTCoreMaterialVisualStylingProvider
+ (BOOL)canGenerateVisualStyleSetFromRecipe:(id)a3;
+ (id)coreMaterialVisualStylingProviderForRecipe:(id)a3 andCategory:(id)a4;
+ (id)coreMaterialVisualStylingProviderForStyleSetNamed:(id)a3 inBundle:(id)a4;
- (BOOL)updateVisualStyleSetFromRecipe:(id)a3 andCategory:(id)a4;
- (BOOL)updateVisualStyleSetGeneratedFromRecipe:(id)a3;
- (MTVisualStyleSetProviding)_visualStyleSet;
- (NSPointerArray)_observers;
- (NSString)visualStyleSetName;
- (id)description;
- (id)visualStylingForStyle:(id)a3;
- (void)_notifyObserversWithBlock:(id)a3;
- (void)_setVisualStyleSet:(id)a3;
- (void)addObserver:(id)a3;
- (void)removeObserver:(id)a3;
- (void)setObservers:(id)a3;
@end

@implementation MTCoreMaterialVisualStylingProvider

- (id)visualStylingForStyle:(id)a3
{
  return (id)[(MTVisualStyleSetProviding *)self->_visualStyleSet visualStylingForStyle:a3];
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    observers = self->_observers;
    id v8 = v4;
    if (!observers)
    {
      v6 = (NSPointerArray *)[objc_alloc(MEMORY[0x1E4F28F50]) initWithOptions:5];
      v7 = self->_observers;
      self->_observers = v6;

      observers = self->_observers;
    }
    [(NSPointerArray *)observers addPointer:v8];
  }
  MEMORY[0x1F41817F8]();
}

- (void)removeObserver:(id)a3
{
  id v6 = a3;
  if (v6)
  {
    observers = self->_observers;
    if (observers)
    {
      [(NSPointerArray *)observers compact];
      if ([(NSPointerArray *)self->_observers count])
      {
        uint64_t v5 = 0;
        while ([(NSPointerArray *)self->_observers pointerAtIndex:v5] != v6)
        {
          if (++v5 >= [(NSPointerArray *)self->_observers count]) {
            goto LABEL_9;
          }
        }
        [(NSPointerArray *)self->_observers removePointerAtIndex:v5];
      }
    }
  }
LABEL_9:
}

- (void)_setVisualStyleSet:(id)a3
{
  uint64_t v5 = (MTVisualStyleSetProviding *)a3;
  p_visualStyleSet = &self->_visualStyleSet;
  visualStyleSet = self->_visualStyleSet;
  if (visualStyleSet != v5)
  {
    id v8 = v5;
    objc_storeStrong((id *)p_visualStyleSet, a3);
    if (v8)
    {
      if (visualStyleSet) {
        p_visualStyleSet = (MTVisualStyleSetProviding **)[(MTCoreMaterialVisualStylingProvider *)self _notifyObserversWithBlock:&__block_literal_global_8];
      }
    }
  }
  MEMORY[0x1F41817F8](p_visualStyleSet);
}

void __58__MTCoreMaterialVisualStylingProvider__setVisualStyleSet___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v4 = a3;
  if (objc_opt_respondsToSelector()) {
    [v4 providedStylesDidChangeForProvider:v5];
  }
}

- (void)_notifyObserversWithBlock:(id)a3
{
  id v4 = (void (**)(id, id, void *))a3;
  if (v4)
  {
    observers = self->_observers;
    if (observers)
    {
      [(NSPointerArray *)observers compact];
      if ([(NSPointerArray *)self->_observers count])
      {
        unint64_t v6 = 0;
        do
        {
          objc_initWeak(&location, self);
          v7 = [(NSPointerArray *)self->_observers pointerAtIndex:v6];
          id v8 = objc_loadWeakRetained(&location);
          v4[2](v4, v8, v7);

          objc_destroyWeak(&location);
          ++v6;
        }
        while (v6 < [(NSPointerArray *)self->_observers count]);
      }
    }
  }
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = [(MTCoreMaterialVisualStylingProvider *)self visualStyleSetName];
  unint64_t v6 = [v3 stringWithFormat:@"<%@: %p: visualStyleSetName: %@>", v4, self, v5];

  return v6;
}

- (MTVisualStyleSetProviding)_visualStyleSet
{
  return self->_visualStyleSet;
}

- (NSPointerArray)_observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_visualStyleSet, 0);
}

+ (id)coreMaterialVisualStylingProviderForRecipe:(id)a3 andCategory:(id)a4
{
  uint64_t v4 = 0;
  if (a3 && a4)
  {
    id v5 = MTSharedVisualStyleSetForRecipeAndCategory(a3, a4);
    if (v5)
    {
      uint64_t v4 = objc_alloc_init(MTCoreMaterialVisualStylingProvider);
      [(MTCoreMaterialVisualStylingProvider *)v4 _setVisualStyleSet:v5];
    }
    else
    {
      uint64_t v4 = 0;
    }
  }
  return v4;
}

+ (id)coreMaterialVisualStylingProviderForStyleSetNamed:(id)a3 inBundle:(id)a4
{
  if (a3)
  {
    uint64_t v4 = MTSharedVisualStyleSetForStyleNameFromBundle(a3, a4);
    if (v4)
    {
      id v5 = objc_alloc_init(MTCoreMaterialVisualStylingProvider);
      [(MTCoreMaterialVisualStylingProvider *)v5 _setVisualStyleSet:v4];
    }
    else
    {
      id v5 = 0;
    }
  }
  else
  {
    id v5 = 0;
  }
  return v5;
}

+ (BOOL)canGenerateVisualStyleSetFromRecipe:(id)a3
{
  v3 = MTMaterialSettingsForRecipe(a3);
  BOOL VisualStylingDescriptionFromRecipeSettings = MTCanGenerateVisualStylingDescriptionFromRecipeSettings(v3);

  return VisualStylingDescriptionFromRecipeSettings;
}

- (NSString)visualStyleSetName
{
  return (NSString *)[(MTVisualStyleSetProviding *)self->_visualStyleSet visualStyleSetName];
}

- (BOOL)updateVisualStyleSetFromRecipe:(id)a3 andCategory:(id)a4
{
  BOOL v4 = 0;
  if (a3 && a4)
  {
    unint64_t v6 = MTSharedVisualStyleSetForRecipeAndCategory(a3, a4);
    BOOL v4 = v6 != 0;
    if (v6) {
      [(MTCoreMaterialVisualStylingProvider *)self _setVisualStyleSet:v6];
    }
  }
  return v4;
}

- (BOOL)updateVisualStyleSetGeneratedFromRecipe:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = +[MTRecipeMaterialSettings styleSetNameForStyleSetFromRecipeWithName:v4];
    unint64_t v6 = [(MTCoreMaterialVisualStylingProvider *)self _visualStyleSet];
    v7 = [v6 visualStyleSetName];
    char v8 = [v7 isEqualToString:v5];
    char v9 = v8 ^ 1;

    if ((v8 & 1) == 0)
    {
      v10 = MTSharedVisualStyleSetGeneratedFromRecipe(v4);
      [(MTCoreMaterialVisualStylingProvider *)self _setVisualStyleSet:v10];
    }
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

@end
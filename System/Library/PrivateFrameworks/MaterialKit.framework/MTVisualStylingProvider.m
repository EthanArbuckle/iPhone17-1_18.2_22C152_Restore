@interface MTVisualStylingProvider
+ (Class)_visualStylingClass;
+ (id)_visualStylingProviderForRecipe:(int64_t)a3 andCategory:(int64_t)a4;
+ (id)_visualStylingProviderForRecipe:(int64_t)a3 category:(int64_t)a4 andUserInterfaceStyle:(int64_t)a5;
+ (id)_visualStylingProviderForRecipeNamed:(id)a3 andCategory:(int64_t)a4;
+ (id)_visualStylingProviderForStyleSetNamed:(id)a3 inBundle:(id)a4;
- (BOOL)_isAutomaticallyUpdatingViewOrLayer:(id)a3;
- (MTCoreMaterialVisualStylingProvider)_coreMaterialVisualStylingProvider;
- (MTVisualStylingProvider)initWithCoreMaterialVisualStylingProvider:(id)a3;
- (NSMapTable)_viewsAndLayersToCoreMaterialVisualStyles;
- (NSMapTable)_viewsAndLayersToObserverBlocks;
- (NSMutableDictionary)_styleNamesToVisualStylings;
- (NSPointerArray)_privateObservers;
- (NSString)description;
- (id)_visualStylingForContinuallyUpdatedView:(id)a3;
- (id)_visualStylingForStyle:(int64_t)a3;
- (id)_visualStylingForStyleNamed:(id)a3;
- (id)newAutomaticallyUpdatingViewWithStyle:(int64_t)a3;
- (void)_addObserver:(id)a3;
- (void)_automaticallyUpdateViewOrLayer:(id)a3 withStyleNamed:(id)a4 andObserverBlock:(id)a5;
- (void)_removeObserver:(id)a3;
- (void)_stopAutomaticallyUpdatingViewOrLayer:(id)a3;
- (void)_updateVisualStyleOfViewOrLayer:(id)a3;
- (void)automaticallyUpdateLayer:(id)a3 withStyle:(int64_t)a4;
- (void)automaticallyUpdateLayer:(id)a3 withStyle:(int64_t)a4 andObserverBlock:(id)a5;
- (void)automaticallyUpdateView:(id)a3 withStyle:(int64_t)a4;
- (void)automaticallyUpdateView:(id)a3 withStyle:(int64_t)a4 andObserverBlock:(id)a5;
- (void)providedStylesDidChangeForProvider:(id)a3;
- (void)setCoreMaterialVisualStylingProvider:(id)a3;
- (void)setPrivateObservers:(id)a3;
- (void)setStyleNamesToVisualStylings:(id)a3;
- (void)setViewsAndLayersToCoreMaterialVisualStyles:(id)a3;
- (void)setViewsAndLayersToObserverBlocks:(id)a3;
@end

@implementation MTVisualStylingProvider

- (void)automaticallyUpdateView:(id)a3 withStyle:(int64_t)a4 andObserverBlock:(id)a5
{
  id v10 = a3;
  id v8 = a5;
  if (v10 && MTIsValidVisualStyle(a4))
  {
    v9 = MTCoreMaterialVisualStyleForVisualStyle(a4);
    [(MTVisualStylingProvider *)self _automaticallyUpdateViewOrLayer:v10 withStyleNamed:v9 andObserverBlock:v8];
  }
}

- (void)_automaticallyUpdateViewOrLayer:(id)a3 withStyleNamed:(id)a4 andObserverBlock:(id)a5
{
  id v19 = a3;
  id v8 = a4;
  id v9 = a5;
  if (v19)
  {
    id v10 = [(MTCoreMaterialVisualStylingProvider *)self->_coreMaterialVisualStylingProvider visualStylingForStyle:v8];

    if (v10)
    {
      viewsAndLayersToCoreMaterialVisualStyles = self->_viewsAndLayersToCoreMaterialVisualStyles;
      if (!viewsAndLayersToCoreMaterialVisualStyles)
      {
        v12 = [MEMORY[0x263F08968] weakToStrongObjectsMapTable];
        v13 = self->_viewsAndLayersToCoreMaterialVisualStyles;
        self->_viewsAndLayersToCoreMaterialVisualStyles = v12;

        viewsAndLayersToCoreMaterialVisualStyles = self->_viewsAndLayersToCoreMaterialVisualStyles;
      }
      [(NSMapTable *)viewsAndLayersToCoreMaterialVisualStyles setObject:v8 forKey:v19];
      if (v9)
      {
        viewsAndLayersToObserverBlocks = self->_viewsAndLayersToObserverBlocks;
        if (!viewsAndLayersToObserverBlocks)
        {
          v15 = [MEMORY[0x263F08968] weakToStrongObjectsMapTable];
          v16 = self->_viewsAndLayersToObserverBlocks;
          self->_viewsAndLayersToObserverBlocks = v15;

          viewsAndLayersToObserverBlocks = self->_viewsAndLayersToObserverBlocks;
        }
        v17 = (void *)[v9 copy];
        v18 = (void *)MEMORY[0x2166C1FA0]();
        [(NSMapTable *)viewsAndLayersToObserverBlocks setObject:v18 forKey:v19];
      }
      [(MTVisualStylingProvider *)self _updateVisualStyleOfViewOrLayer:v19];
    }
  }
}

- (void)_updateVisualStyleOfViewOrLayer:(id)a3
{
  id v9 = a3;
  v4 = -[NSMapTable objectForKey:](self->_viewsAndLayersToCoreMaterialVisualStyles, "objectForKey:");
  if (!v4) {
    goto LABEL_13;
  }
  uint64_t v5 = [(NSMapTable *)self->_viewsAndLayersToObserverBlocks objectForKey:v9];
  v6 = (void *)v5;
  if (v5)
  {
    (*(void (**)(uint64_t, MTVisualStylingProvider *, id))(v5 + 16))(v5, self, v9);
    v7 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
  if (objc_opt_respondsToSelector())
  {
    id v8 = [(MTVisualStylingProvider *)self _visualStylingForStyleNamed:v4];
    objc_msgSend(v9, "mt_replaceVisualStyling:", v8);
LABEL_9:

    goto LABEL_10;
  }
  if (objc_opt_respondsToSelector())
  {
    id v8 = [(MTCoreMaterialVisualStylingProvider *)self->_coreMaterialVisualStylingProvider visualStylingForStyle:v4];
    objc_msgSend(v9, "mt_replaceAllVisualStylingWithStyling:", v8);
    goto LABEL_9;
  }
LABEL_10:
  if (v7) {
    ((void (**)(void, MTVisualStylingProvider *, id))v7)[2](v7, self, v9);
  }

LABEL_13:
}

- (id)_visualStylingForStyle:(int64_t)a3
{
  v4 = MTCoreMaterialVisualStyleForVisualStyle(a3);
  if (v4)
  {
    uint64_t v5 = [(MTVisualStylingProvider *)self _visualStylingForStyleNamed:v4];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (id)_visualStylingForStyleNamed:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = [(NSMutableDictionary *)self->_styleNamesToVisualStylings objectForKey:v4];
    if (!v5)
    {
      v6 = [(MTCoreMaterialVisualStylingProvider *)self->_coreMaterialVisualStylingProvider visualStylingForStyle:v4];
      if (v6)
      {
        uint64_t v5 = objc_msgSend(objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "_visualStylingClass")), "initWithCoreMaterialVisualStyling:", v6);
        styleNamesToVisualStylings = self->_styleNamesToVisualStylings;
        if (!styleNamesToVisualStylings)
        {
          id v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
          id v9 = self->_styleNamesToVisualStylings;
          self->_styleNamesToVisualStylings = v8;

          styleNamesToVisualStylings = self->_styleNamesToVisualStylings;
        }
        [(NSMutableDictionary *)styleNamesToVisualStylings setObject:v5 forKey:v4];
      }
      else
      {
        uint64_t v5 = 0;
      }
    }
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (void)automaticallyUpdateView:(id)a3 withStyle:(int64_t)a4
{
}

- (void)automaticallyUpdateLayer:(id)a3 withStyle:(int64_t)a4
{
}

- (void)automaticallyUpdateLayer:(id)a3 withStyle:(int64_t)a4 andObserverBlock:(id)a5
{
  id v10 = a3;
  id v8 = a5;
  if (v10 && MTIsValidVisualStyle(a4))
  {
    id v9 = MTCoreMaterialVisualStyleForVisualStyle(a4);
    [(MTVisualStylingProvider *)self _automaticallyUpdateViewOrLayer:v10 withStyleNamed:v9 andObserverBlock:v8];
  }
}

- (id)newAutomaticallyUpdatingViewWithStyle:(int64_t)a3
{
  id v5 = objc_alloc_init(MEMORY[0x263F1CB60]);
  [v5 setUserInteractionEnabled:0];
  [(MTVisualStylingProvider *)self automaticallyUpdateView:v5 withStyle:a3 andObserverBlock:&__block_literal_global_3];
  return v5;
}

id __65__MTVisualStylingProvider_newAutomaticallyUpdatingViewWithStyle___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  [a3 alpha];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __65__MTVisualStylingProvider_newAutomaticallyUpdatingViewWithStyle___block_invoke_2;
  v6[3] = &__block_descriptor_40_e36_v24__0__MTVisualStylingProvider_8_16l;
  v6[4] = v3;
  id v4 = (void *)MEMORY[0x2166C1FA0](v6);

  return v4;
}

uint64_t __65__MTVisualStylingProvider_newAutomaticallyUpdatingViewWithStyle___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 setAlpha:*(double *)(a1 + 32)];
}

- (void)providedStylesDidChangeForProvider:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  [(NSMutableDictionary *)self->_styleNamesToVisualStylings removeAllObjects];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v4 = self->_viewsAndLayersToCoreMaterialVisualStyles;
  uint64_t v5 = [(NSMapTable *)v4 countByEnumeratingWithState:&v18 objects:v23 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v19;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v19 != v7) {
          objc_enumerationMutation(v4);
        }
        [(MTVisualStylingProvider *)self _updateVisualStyleOfViewOrLayer:*(void *)(*((void *)&v18 + 1) + 8 * v8++)];
      }
      while (v6 != v8);
      uint64_t v6 = [(NSMapTable *)v4 countByEnumeratingWithState:&v18 objects:v23 count:16];
    }
    while (v6);
  }

  [(NSPointerArray *)self->_privateObservers compact];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v9 = self->_privateObservers;
  uint64_t v10 = [(NSPointerArray *)v9 countByEnumeratingWithState:&v14 objects:v22 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v15;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v15 != v12) {
          objc_enumerationMutation(v9);
        }
        objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * v13++), "providedStylesDidChangeForProvider:", self, (void)v14);
      }
      while (v11 != v13);
      uint64_t v11 = [(NSPointerArray *)v9 countByEnumeratingWithState:&v14 objects:v22 count:16];
    }
    while (v11);
  }
}

- (void)_stopAutomaticallyUpdatingViewOrLayer:(id)a3
{
  if (a3)
  {
    viewsAndLayersToCoreMaterialVisualStyles = self->_viewsAndLayersToCoreMaterialVisualStyles;
    id v5 = a3;
    [(NSMapTable *)viewsAndLayersToCoreMaterialVisualStyles removeObjectForKey:v5];
    [(NSMapTable *)self->_viewsAndLayersToObserverBlocks removeObjectForKey:v5];
  }
}

- (BOOL)_isAutomaticallyUpdatingViewOrLayer:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4)
  {
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    id v5 = self->_viewsAndLayersToCoreMaterialVisualStyles;
    uint64_t v6 = [(NSMapTable *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v11;
      while (2)
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v11 != v7) {
            objc_enumerationMutation(v5);
          }
          if (*(id *)(*((void *)&v10 + 1) + 8 * i) == v4)
          {
            LOBYTE(v6) = 1;
            goto LABEL_12;
          }
        }
        uint64_t v6 = [(NSMapTable *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (NSString)description
{
  return (NSString *)[NSString stringWithFormat:@"<%@: %p: coreMaterialVisualStylingProvider: %@>", objc_opt_class(), self, self->_coreMaterialVisualStylingProvider];
}

- (MTCoreMaterialVisualStylingProvider)_coreMaterialVisualStylingProvider
{
  return self->_coreMaterialVisualStylingProvider;
}

- (void)setCoreMaterialVisualStylingProvider:(id)a3
{
}

- (NSMutableDictionary)_styleNamesToVisualStylings
{
  return self->_styleNamesToVisualStylings;
}

- (void)setStyleNamesToVisualStylings:(id)a3
{
}

- (NSMapTable)_viewsAndLayersToCoreMaterialVisualStyles
{
  return self->_viewsAndLayersToCoreMaterialVisualStyles;
}

- (void)setViewsAndLayersToCoreMaterialVisualStyles:(id)a3
{
}

- (NSMapTable)_viewsAndLayersToObserverBlocks
{
  return self->_viewsAndLayersToObserverBlocks;
}

- (void)setViewsAndLayersToObserverBlocks:(id)a3
{
}

- (NSPointerArray)_privateObservers
{
  return self->_privateObservers;
}

- (void)setPrivateObservers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_privateObservers, 0);
  objc_storeStrong((id *)&self->_viewsAndLayersToObserverBlocks, 0);
  objc_storeStrong((id *)&self->_viewsAndLayersToCoreMaterialVisualStyles, 0);
  objc_storeStrong((id *)&self->_styleNamesToVisualStylings, 0);

  objc_storeStrong((id *)&self->_coreMaterialVisualStylingProvider, 0);
}

+ (id)_visualStylingProviderForRecipe:(int64_t)a3 category:(int64_t)a4 andUserInterfaceStyle:(int64_t)a5
{
  if (a3)
  {
    uint64_t v7 = MTCoreMaterialRecipeForMaterialRecipeAndUserInterfaceStyle(a3, a5);
    uint64_t v8 = [a1 _visualStylingProviderForRecipeNamed:v7 andCategory:a4];
LABEL_5:
    id v9 = (void *)v8;

    goto LABEL_7;
  }
  if (a4 == 3)
  {
    uint64_t v7 = MTCoreMaterialPlatformColorsStyleNameForUserInterfaceStyle(a5);
    uint64_t v8 = [a1 _visualStylingProviderForStyleSetNamed:v7 inBundle:0];
    goto LABEL_5;
  }
  id v9 = 0;
LABEL_7:

  return v9;
}

+ (id)_visualStylingProviderForRecipe:(int64_t)a3 andCategory:(int64_t)a4
{
  return (id)[a1 _visualStylingProviderForRecipe:a3 category:a4 andUserInterfaceStyle:0];
}

+ (id)_visualStylingProviderForRecipeNamed:(id)a3 andCategory:(int64_t)a4
{
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = MTCoreMaterialVisualStyleCategoryForVisualStyleCategory(a4);
    if (v7)
    {
      uint64_t v8 = [MEMORY[0x263F36790] coreMaterialVisualStylingProviderForRecipe:v6 andCategory:v7];
      if (v8) {
        id v9 = (void *)[objc_alloc((Class)a1) initWithCoreMaterialVisualStylingProvider:v8];
      }
      else {
        id v9 = 0;
      }
    }
    else
    {
      id v9 = 0;
    }
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

+ (id)_visualStylingProviderForStyleSetNamed:(id)a3 inBundle:(id)a4
{
  if (a3)
  {
    id v5 = [MEMORY[0x263F36790] coreMaterialVisualStylingProviderForStyleSetNamed:a3 inBundle:a4];
    if (v5) {
      id v6 = (void *)[objc_alloc((Class)a1) initWithCoreMaterialVisualStylingProvider:v5];
    }
    else {
      id v6 = 0;
    }
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)_visualStylingForContinuallyUpdatedView:(id)a3
{
  if (a3)
  {
    id v4 = -[NSMapTable objectForKey:](self->_viewsAndLayersToCoreMaterialVisualStyles, "objectForKey:");
    if (v4)
    {
      id v5 = [(MTVisualStylingProvider *)self _visualStylingForStyleNamed:v4];
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

- (void)_addObserver:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    privateObservers = self->_privateObservers;
    id v8 = v4;
    if (!privateObservers)
    {
      id v6 = (NSPointerArray *)[objc_alloc(MEMORY[0x263F08A88]) initWithOptions:5];
      uint64_t v7 = self->_privateObservers;
      self->_privateObservers = v6;

      privateObservers = self->_privateObservers;
    }
    [(NSPointerArray *)privateObservers addPointer:v8];
  }

  MEMORY[0x270F9A758]();
}

- (void)_removeObserver:(id)a3
{
  id v6 = a3;
  if (v6)
  {
    privateObservers = self->_privateObservers;
    if (privateObservers)
    {
      [(NSPointerArray *)privateObservers compact];
      if ([(NSPointerArray *)self->_privateObservers count])
      {
        uint64_t v5 = 0;
        while ([(NSPointerArray *)self->_privateObservers pointerAtIndex:v5] != v6)
        {
          if (++v5 >= [(NSPointerArray *)self->_privateObservers count]) {
            goto LABEL_9;
          }
        }
        [(NSPointerArray *)self->_privateObservers removePointerAtIndex:v5];
      }
    }
  }
LABEL_9:
}

+ (Class)_visualStylingClass
{
  return (Class)objc_opt_class();
}

- (MTVisualStylingProvider)initWithCoreMaterialVisualStylingProvider:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    long long v10 = [MEMORY[0x263F08690] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"MTVisualStylingProvider.m", 275, @"Invalid parameter not satisfying: %@", @"cmProvider" object file lineNumber description];
  }
  v11.receiver = self;
  v11.super_class = (Class)MTVisualStylingProvider;
  uint64_t v7 = [(MTVisualStylingProvider *)&v11 init];
  id v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_coreMaterialVisualStylingProvider, a3);
    [(MTCoreMaterialVisualStylingProvider *)v8->_coreMaterialVisualStylingProvider addObserver:v8];
  }

  return v8;
}

@end
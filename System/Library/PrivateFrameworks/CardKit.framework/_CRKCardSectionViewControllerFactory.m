@interface _CRKCardSectionViewControllerFactory
+ (id)_sharedInstance;
+ (id)cardSectionViewControllerForCardSection:(id)a3;
+ (void)registerCardSectionViewControllerClass:(Class)a3;
- (_CRKCardSectionViewControllerFactory)init;
- (id)_cardSectionViewControllerForCardSection:(id)a3;
- (void)_registerCardSectionViewControllerClass:(Class)a3;
@end

@implementation _CRKCardSectionViewControllerFactory

- (_CRKCardSectionViewControllerFactory)init
{
  v6.receiver = self;
  v6.super_class = (Class)_CRKCardSectionViewControllerFactory;
  v2 = [(_CRKCardSectionViewControllerFactory *)&v6 init];
  if (v2)
  {
    v3 = objc_alloc_init(_CRKCardSectionViewControllerRegistry);
    registry = v2->_registry;
    v2->_registry = v3;
  }
  return v2;
}

+ (id)_sharedInstance
{
  if (_sharedInstance_onceToken != -1) {
    dispatch_once(&_sharedInstance_onceToken, &__block_literal_global_1);
  }
  v2 = (void *)_sharedInstance_sStaticFactory;

  return v2;
}

+ (void)registerCardSectionViewControllerClass:(Class)a3
{
  id v4 = [a1 _sharedInstance];
  [v4 _registerCardSectionViewControllerClass:a3];
}

- (void)_registerCardSectionViewControllerClass:(Class)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v5 = [(objc_class *)a3 cardSectionClasses];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [(_CRKCardSectionViewControllerRegistry *)self->_registry registerCardSectionViewControllerClass:a3 forCardSectionClass:*(void *)(*((void *)&v10 + 1) + 8 * v9++)];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

+ (id)cardSectionViewControllerForCardSection:(id)a3
{
  id v4 = a3;
  v5 = [a1 _sharedInstance];
  uint64_t v6 = [v5 _cardSectionViewControllerForCardSection:v4];

  return v6;
}

- (id)_cardSectionViewControllerForCardSection:(id)a3
{
  id v4 = a3;
  registry = self->_registry;
  id v6 = v4;
  if ((objc_opt_respondsToSelector() & 1) != 0
    && ([v6 backingCardSection], (uint64_t v7 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    uint64_t v8 = (void *)v7;
    uint64_t v9 = objc_opt_class();
  }
  else
  {
    uint64_t v9 = objc_opt_class();
  }
  id v10 = v9;

  long long v11 = objc_msgSend(objc_alloc(-[_CRKCardSectionViewControllerRegistry cardSectionViewControllerClassForCardSectionClass:](registry, "cardSectionViewControllerClassForCardSectionClass:", v10)), "_initWithCardSection:", v6);

  return v11;
}

- (void).cxx_destruct
{
}

@end
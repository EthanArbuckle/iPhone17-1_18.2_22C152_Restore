@interface LPThemeParametersObserver
+ (id)shared;
- (LPThemeParametersObserver)init;
- (void)addClient:(id)a3;
- (void)dealloc;
- (void)didChangeThemeParameters;
- (void)removeClient:(id)a3;
@end

@implementation LPThemeParametersObserver

- (LPThemeParametersObserver)init
{
  v6.receiver = self;
  v6.super_class = (Class)LPThemeParametersObserver;
  v2 = [(LPThemeParametersObserver *)&v6 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v3 addObserver:v2 selector:sel_didChangeDarkenColorsStatus_ name:*MEMORY[0x1E4FB2438] object:0];

    v4 = v2;
  }

  return v2;
}

+ (id)shared
{
  v2 = (void *)shared_observer;
  if (!shared_observer)
  {
    v3 = objc_alloc_init(LPThemeParametersObserver);
    v4 = (void *)shared_observer;
    shared_observer = (uint64_t)v3;

    v2 = (void *)shared_observer;
  }

  return v2;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)LPThemeParametersObserver;
  [(LPThemeParametersObserver *)&v4 dealloc];
}

- (void)addClient:(id)a3
{
  id v4 = a3;
  clients = self->_clients;
  id v8 = v4;
  if (!clients)
  {
    objc_super v6 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    v7 = self->_clients;
    self->_clients = v6;

    clients = self->_clients;
    id v4 = v8;
  }
  if ([(NSHashTable *)clients containsObject:v4]) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"Trying to add a LPThemeClient that is already a client."];
  }
  [(NSHashTable *)self->_clients addObject:v8];
}

- (void)removeClient:(id)a3
{
  id v5 = a3;
  clients = self->_clients;
  if (clients) {
    [(NSHashTable *)clients removeObject:v5];
  }
}

- (void)didChangeThemeParameters
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v3 = themeCache();
  [v3 removeAllObjects];

  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v4 = self->_clients;
  uint64_t v5 = [(NSHashTable *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v4);
        }
        id v8 = *(void **)(*((void *)&v9 + 1) + 8 * v7);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v8, "themeParametersDidChange", (void)v9);
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [(NSHashTable *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

- (void).cxx_destruct
{
}

@end
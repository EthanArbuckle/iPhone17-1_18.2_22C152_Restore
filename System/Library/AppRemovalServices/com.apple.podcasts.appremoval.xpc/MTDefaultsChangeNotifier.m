@interface MTDefaultsChangeNotifier
- (BOOL)isRunning;
- (MTDefaultsChangeNotifier)initWithProperties:(id)a3 defaults:(id)a4;
- (NSUserDefaults)defaults;
- (void)_defaultsChanged;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setDefaults:(id)a3;
- (void)setRunning:(BOOL)a3;
- (void)start;
- (void)stop;
@end

@implementation MTDefaultsChangeNotifier

- (MTDefaultsChangeNotifier)initWithProperties:(id)a3 defaults:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)MTDefaultsChangeNotifier;
  v8 = [(MTDictionaryDiff *)&v11 initWithProperties:a3];
  v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_defaults, a4);
  }

  return v9;
}

- (void)dealloc
{
  [(MTDefaultsChangeNotifier *)self stop];
  v3.receiver = self;
  v3.super_class = (Class)MTDefaultsChangeNotifier;
  [(MTDefaultsChangeNotifier *)&v3 dealloc];
}

- (void)start
{
  if (![(MTDefaultsChangeNotifier *)self isRunning])
  {
    long long v10 = 0u;
    long long v11 = 0u;
    long long v8 = 0u;
    long long v9 = 0u;
    objc_super v3 = [(MTDictionaryDiff *)self properties];
    id v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    if (v4)
    {
      id v5 = v4;
      uint64_t v6 = *(void *)v9;
      do
      {
        id v7 = 0;
        do
        {
          if (*(void *)v9 != v6) {
            objc_enumerationMutation(v3);
          }
          [(NSUserDefaults *)self->_defaults addObserver:self forKeyPath:*(void *)(*((void *)&v8 + 1) + 8 * (void)v7) options:0 context:self];
          id v7 = (char *)v7 + 1;
        }
        while (v5 != v7);
        id v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
      }
      while (v5);
    }

    [(MTDefaultsChangeNotifier *)self setRunning:1];
    [(MTDefaultsChangeNotifier *)self _defaultsChanged];
  }
}

- (void)stop
{
  if ([(MTDefaultsChangeNotifier *)self isRunning])
  {
    long long v10 = 0u;
    long long v11 = 0u;
    long long v8 = 0u;
    long long v9 = 0u;
    objc_super v3 = [(MTDictionaryDiff *)self properties];
    id v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    if (v4)
    {
      id v5 = v4;
      uint64_t v6 = *(void *)v9;
      do
      {
        id v7 = 0;
        do
        {
          if (*(void *)v9 != v6) {
            objc_enumerationMutation(v3);
          }
          [(NSUserDefaults *)self->_defaults removeObserver:self forKeyPath:*(void *)(*((void *)&v8 + 1) + 8 * (void)v7) context:self];
          id v7 = (char *)v7 + 1;
        }
        while (v5 != v7);
        id v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
      }
      while (v5);
    }

    [(MTDefaultsChangeNotifier *)self setRunning:0];
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (a6 == self) {
    objc_msgSend(a6, "_defaultsChanged", a3, a4, a5);
  }
}

- (void)_defaultsChanged
{
  v2 = self;
  objc_sync_enter(v2);
  objc_super v3 = [(NSUserDefaults *)v2->_defaults dictionaryRepresentation];
  v4.receiver = v2;
  v4.super_class = (Class)MTDefaultsChangeNotifier;
  [(MTDictionaryDiff *)&v4 setDictionary:v3];

  objc_sync_exit(v2);
}

- (BOOL)isRunning
{
  return self->_running;
}

- (void)setRunning:(BOOL)a3
{
  self->_running = a3;
}

- (NSUserDefaults)defaults
{
  return self->_defaults;
}

- (void)setDefaults:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
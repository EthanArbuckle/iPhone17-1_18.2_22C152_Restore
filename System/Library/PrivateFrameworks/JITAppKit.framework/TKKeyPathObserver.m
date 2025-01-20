@interface TKKeyPathObserver
- (TKKeyPathObserver)initWithBlock:(id)a3;
- (void)dealloc;
- (void)observe:(id)a3 keyPath:(id)a4;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)stopObserving;
@end

@implementation TKKeyPathObserver

- (TKKeyPathObserver)initWithBlock:(id)a3
{
  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = v12;
  v12 = 0;
  v10.receiver = v3;
  v10.super_class = (Class)TKKeyPathObserver;
  v12 = [(TKKeyPathObserver *)&v10 init];
  objc_storeStrong((id *)&v12, v12);
  if (v12)
  {
    v4 = _Block_copy(location[0]);
    id block = v12->_block;
    v12->_id block = v4;

    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    observations = v12->_observations;
    v12->_observations = v6;
  }
  v9 = v12;
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v12, 0);
  return v9;
}

- (void)dealloc
{
  v4 = self;
  SEL v3 = a2;
  [(TKKeyPathObserver *)self stopObserving];
  v2.receiver = v4;
  v2.super_class = (Class)TKKeyPathObserver;
  [(TKKeyPathObserver *)&v2 dealloc];
}

- (void)observe:(id)a3 keyPath:(id)a4
{
  v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v6 = 0;
  objc_storeStrong(&v6, a4);
  v5 = objc_alloc_init(TKKeyPathObservation);
  [(TKKeyPathObservation *)v5 setObject:location[0]];
  [(TKKeyPathObservation *)v5 setKeyPath:v6];
  [(NSMutableArray *)v8->_observations addObject:v5];
  [location[0] addObserver:v8 forKeyPath:v6 options:0 context:0];
  objc_storeStrong((id *)&v5, 0);
  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);
}

- (void)stopObserving
{
  v9 = self;
  v8[1] = (id)a2;
  observations = self->_observations;
  uint64_t v3 = MEMORY[0x263EF8330];
  int v4 = -1073741824;
  int v5 = 0;
  id v6 = __34__TKKeyPathObserver_stopObserving__block_invoke;
  v7 = &unk_26485AE80;
  v8[0] = self;
  -[NSMutableArray enumerateObjectsUsingBlock:](observations, "enumerateObjectsUsingBlock:");
  [(NSMutableArray *)v9->_observations removeAllObjects];
  objc_storeStrong(v8, 0);
}

void __34__TKKeyPathObserver_stopObserving__block_invoke(void *a1, void *a2, void *a3, void *a4)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v9[3] = a3;
  v9[2] = a4;
  v9[1] = a1;
  v9[0] = (id)[location[0] object];
  if (v9[0])
  {
    uint64_t v4 = a1[4];
    id v5 = (id)[location[0] keyPath];
    objc_msgSend(v9[0], "removeObserver:forKeyPath:", v4);
  }
  objc_msgSend(location[0], "setObject:");
  objc_storeStrong(v9, 0);
  objc_storeStrong(location, 0);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v9 = 0;
  objc_storeStrong(&v9, a4);
  id v8 = 0;
  objc_storeStrong(&v8, a5);
  if (v9 && location[0]) {
    (*((void (**)(void))v11->_block + 2))();
  }
  objc_storeStrong(&v8, 0);
  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
}

- (void).cxx_destruct
{
}

@end
@interface AMDMinHeap
- (AMDMinHeap)initWithCapacity:(unint64_t)a3 comparator:(id)a4;
- (BOOL)add:(id)a3;
- (BOOL)isEmpty;
- (NSMutableArray)objects;
- (id)comparator;
- (id)poll;
- (id)topN;
- (unint64_t)capacity;
- (unint64_t)position;
- (unint64_t)size;
- (void)bubbleUp;
- (void)pushDown;
- (void)setCapacity:(unint64_t)a3;
- (void)setComparator:(id)a3;
- (void)setObjects:(id)a3;
- (void)setPosition:(unint64_t)a3;
- (void)swap:(unint64_t)a3 with:(unint64_t)a4;
@end

@implementation AMDMinHeap

- (AMDMinHeap)initWithCapacity:(unint64_t)a3 comparator:(id)a4
{
  v13 = self;
  SEL v12 = a2;
  unint64_t v11 = a3;
  id location = 0;
  objc_storeStrong(&location, a4);
  [(AMDMinHeap *)v13 setCapacity:v11];
  [(AMDMinHeap *)v13 setComparator:location];
  [(AMDMinHeap *)v13 setPosition:1];
  id v5 = objc_alloc(MEMORY[0x263EFF980]);
  id v6 = (id)objc_msgSend(v5, "initWithCapacity:", -[AMDMinHeap capacity](v13, "capacity") + 1);
  -[AMDMinHeap setObjects:](v13, "setObjects:");

  v8 = [(AMDMinHeap *)v13 objects];
  id v7 = (id)[objc_alloc(NSNumber) initWithInt:1];
  -[NSMutableArray addObject:](v8, "addObject:");

  v9 = v13;
  objc_storeStrong(&location, 0);
  objc_storeStrong((id *)&v13, 0);
  return v9;
}

- (BOOL)add:(id)a3
{
  v14 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  uint64_t v12 = [(AMDMinHeap *)v14 position];
  if (v12 != [(AMDMinHeap *)v14 capacity] + 1)
  {
    v4 = [(AMDMinHeap *)v14 objects];
    [(NSMutableArray *)v4 addObject:location[0]];

    [(AMDMinHeap *)v14 setPosition:[(AMDMinHeap *)v14 position] + 1];
    [(AMDMinHeap *)v14 bubbleUp];
    goto LABEL_6;
  }
  v10 = (uint64_t (**)(id, id))[(AMDMinHeap *)v14 comparator];
  id v7 = location[0];
  v9 = [(AMDMinHeap *)v14 objects];
  id v8 = (id)[(NSMutableArray *)v9 objectAtIndexedSubscript:1];
  BOOL v11 = v10[2](v10, v7) != 1;

  if (!v11)
  {
    id v5 = location[0];
    id v6 = [(AMDMinHeap *)v14 objects];
    [(NSMutableArray *)v6 setObject:v5 atIndexedSubscript:1];

    [(AMDMinHeap *)v14 pushDown];
LABEL_6:
    char v15 = 1;
    goto LABEL_7;
  }
  char v15 = 0;
LABEL_7:
  objc_storeStrong(location, 0);
  return v15 & 1;
}

- (BOOL)isEmpty
{
  return [(AMDMinHeap *)self size] == 0;
}

- (unint64_t)size
{
  return [(AMDMinHeap *)self position] - 1;
}

- (id)poll
{
  v9 = self;
  v8[1] = (id)a2;
  if ([(AMDMinHeap *)self isEmpty])
  {
    id v10 = 0;
  }
  else
  {
    id v7 = [(AMDMinHeap *)v9 objects];
    v8[0] = (id)[(NSMutableArray *)v7 objectAtIndexedSubscript:1];

    if ([(AMDMinHeap *)v9 size] <= 1)
    {
      [(AMDMinHeap *)v9 setPosition:[(AMDMinHeap *)v9 position] - 1];
    }
    else
    {
      id v6 = [(AMDMinHeap *)v9 objects];
      id v5 = (id)[(NSMutableArray *)v6 objectAtIndexedSubscript:[(AMDMinHeap *)v9 position] - 1];
      v4 = [(AMDMinHeap *)v9 objects];
      [(NSMutableArray *)v4 setObject:v5 atIndexedSubscript:1];

      [(AMDMinHeap *)v9 setPosition:[(AMDMinHeap *)v9 position] - 1];
      [(AMDMinHeap *)v9 pushDown];
    }
    id v10 = v8[0];
    objc_storeStrong(v8, 0);
  }
  v2 = v10;

  return v2;
}

- (id)topN
{
  id v8 = self;
  v7[1] = (id)a2;
  v7[0] = (id)objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[AMDMinHeap size](self, "size"));
  do
  {
    if ([(AMDMinHeap *)v8 isEmpty]) {
      break;
    }
    id location = [(AMDMinHeap *)v8 poll];
    if (location)
    {
      [v7[0] addObject:location];
      int v5 = 0;
    }
    else
    {
      int v5 = 3;
    }
    objc_storeStrong(&location, 0);
  }
  while (!v5);
  id v3 = (id)[v7[0] reverseObjectEnumerator];
  id v4 = (id)[v3 allObjects];

  objc_storeStrong(v7, 0);

  return v4;
}

- (void)bubbleUp
{
  for (unint64_t i = [(AMDMinHeap *)self position] - 1; i > 1; i /= 2uLL)
  {
    id v6 = (uint64_t (**)(id, id))[(AMDMinHeap *)self comparator];
    int v5 = [(AMDMinHeap *)self objects];
    id v4 = (id)[(NSMutableArray *)v5 objectAtIndexedSubscript:i];
    id v3 = [(AMDMinHeap *)self objects];
    id v2 = (id)[(NSMutableArray *)v3 objectAtIndexedSubscript:i / 2];
    BOOL v7 = v6[2](v6, v4) != -1;

    if (v7) {
      break;
    }
    [(AMDMinHeap *)self swap:i with:i / 2];
  }
}

- (void)pushDown
{
  for (unint64_t i = 1; i < [(AMDMinHeap *)self position]; unint64_t i = v19)
  {
    unint64_t v20 = 2 * i + 1;
    if (2 * i >= [(AMDMinHeap *)self position]) {
      break;
    }
    char v17 = 0;
    char v15 = 0;
    char v13 = 0;
    char v11 = 0;
    char v9 = 0;
    BOOL v8 = 0;
    if (v20 < [(AMDMinHeap *)self position])
    {
      v18 = (uint64_t (**)(id, id))[(AMDMinHeap *)self comparator];
      char v17 = 1;
      v16 = [(AMDMinHeap *)self objects];
      char v15 = 1;
      id v14 = (id)[(NSMutableArray *)v16 objectAtIndexedSubscript:v20];
      char v13 = 1;
      uint64_t v12 = [(AMDMinHeap *)self objects];
      char v11 = 1;
      id v10 = (id)[(NSMutableArray *)v12 objectAtIndexedSubscript:2 * i];
      char v9 = 1;
      BOOL v8 = v18[2](v18, v14) == -1;
    }
    if (v9) {

    }
    if (v11) {
    if (v13)
    }

    if (v15) {
    if (v17)
    }

    uint64_t v19 = v8 ? 2 * i + 1 : 2 * i;
    id v6 = (uint64_t (**)(id, id))[(AMDMinHeap *)self comparator];
    int v5 = [(AMDMinHeap *)self objects];
    id v4 = (id)[(NSMutableArray *)v5 objectAtIndexedSubscript:v19];
    id v3 = [(AMDMinHeap *)self objects];
    id v2 = (id)[(NSMutableArray *)v3 objectAtIndexedSubscript:i];
    BOOL v7 = v6[2](v6, v4) != -1;

    if (v7) {
      break;
    }
    [(AMDMinHeap *)self swap:v19 with:i];
  }
}

- (void)swap:(unint64_t)a3 with:(unint64_t)a4
{
  id v14 = self;
  SEL v13 = a2;
  unint64_t v12 = a3;
  unint64_t v11 = a4;
  id v4 = [(AMDMinHeap *)self objects];
  id v10 = (id)[(NSMutableArray *)v4 objectAtIndexedSubscript:v12];

  BOOL v7 = [(AMDMinHeap *)v14 objects];
  id v6 = (id)[(NSMutableArray *)v7 objectAtIndexedSubscript:v11];
  int v5 = [(AMDMinHeap *)v14 objects];
  [(NSMutableArray *)v5 setObject:v6 atIndexedSubscript:v12];

  id v8 = v10;
  char v9 = [(AMDMinHeap *)v14 objects];
  [(NSMutableArray *)v9 setObject:v8 atIndexedSubscript:v11];

  objc_storeStrong(&v10, 0);
}

- (NSMutableArray)objects
{
  return self->_objects;
}

- (void)setObjects:(id)a3
{
}

- (id)comparator
{
  return objc_getProperty(self, a2, 16, 1);
}

- (void)setComparator:(id)a3
{
}

- (unint64_t)capacity
{
  return self->_capacity;
}

- (void)setCapacity:(unint64_t)a3
{
  self->_capacity = a3;
}

- (unint64_t)position
{
  return self->_position;
}

- (void)setPosition:(unint64_t)a3
{
  self->_position = a3;
}

- (void).cxx_destruct
{
}

@end
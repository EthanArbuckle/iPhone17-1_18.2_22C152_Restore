@interface ICDocCamRectangleResultsQueue
- (ICDocCamRectangleResultsQueue)init;
- (NSMutableArray)array;
- (id)dequeue;
- (id)peek;
- (id)peek:(int64_t)a3;
- (id)peekTail;
- (int64_t)size;
- (void)apply:(id)a3 atIndex:(int64_t)a4;
- (void)apply:(id)a3 fromIndex:(int64_t)a4 toIndex:(unint64_t)a5;
- (void)clear;
- (void)enqueue:(id)a3;
- (void)setArray:(id)a3;
@end

@implementation ICDocCamRectangleResultsQueue

- (ICDocCamRectangleResultsQueue)init
{
  v5.receiver = self;
  v5.super_class = (Class)ICDocCamRectangleResultsQueue;
  v2 = [(ICDocCamRectangleResultsQueue *)&v5 init];
  if (v2)
  {
    id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
    [(ICDocCamRectangleResultsQueue *)v2 setArray:v3];
  }
  return v2;
}

- (void)enqueue:(id)a3
{
  id v6 = a3;
  v4 = self;
  objc_sync_enter(v4);
  objc_super v5 = [(ICDocCamRectangleResultsQueue *)v4 array];
  [v5 addObject:v6];

  objc_sync_exit(v4);
}

- (id)dequeue
{
  v2 = self;
  objc_sync_enter(v2);
  id v3 = [(ICDocCamRectangleResultsQueue *)v2 array];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    objc_super v5 = [(ICDocCamRectangleResultsQueue *)v2 peek];
    id v6 = [(ICDocCamRectangleResultsQueue *)v2 array];
    [v6 removeObjectAtIndex:0];
  }
  else
  {
    objc_super v5 = 0;
  }
  objc_sync_exit(v2);

  return v5;
}

- (void)clear
{
  obj = self;
  objc_sync_enter(obj);
  v2 = [(ICDocCamRectangleResultsQueue *)obj array];
  [v2 removeAllObjects];

  objc_sync_exit(obj);
}

- (id)peek
{
  v2 = self;
  objc_sync_enter(v2);
  id v3 = [(ICDocCamRectangleResultsQueue *)v2 array];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    objc_super v5 = [(ICDocCamRectangleResultsQueue *)v2 array];
    id v6 = [v5 objectAtIndex:0];
  }
  else
  {
    id v6 = 0;
  }
  v7 = (void *)[v6 copy];

  objc_sync_exit(v2);

  return v7;
}

- (id)peek:(int64_t)a3
{
  objc_super v5 = [(ICDocCamRectangleResultsQueue *)self array];
  id v6 = [v5 lastObject];

  if (v6
    && ([(ICDocCamRectangleResultsQueue *)self array],
        v7 = objc_claimAutoreleasedReturnValue(),
        unint64_t v8 = [v7 count],
        v7,
        v8 > a3))
  {
    v9 = [(ICDocCamRectangleResultsQueue *)self array];
    v10 = [v9 objectAtIndex:a3];
  }
  else
  {
    v10 = 0;
  }
  v11 = (void *)[v10 copy];

  return v11;
}

- (id)peekTail
{
  v2 = self;
  objc_sync_enter(v2);
  id v3 = [(ICDocCamRectangleResultsQueue *)v2 array];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    objc_super v5 = [(ICDocCamRectangleResultsQueue *)v2 array];
    id v6 = [v5 lastObject];
  }
  else
  {
    id v6 = 0;
  }
  v7 = [NSDictionary dictionaryWithDictionary:v6];

  objc_sync_exit(v2);

  return v7;
}

- (void)apply:(id)a3 atIndex:(int64_t)a4
{
  v9 = (void (**)(id, void *))a3;
  id v6 = self;
  objc_sync_enter(v6);
  v7 = [(ICDocCamRectangleResultsQueue *)v6 array];
  unint64_t v8 = [v7 objectAtIndex:a4];

  v9[2](v9, v8);
  objc_sync_exit(v6);
}

- (void)apply:(id)a3 fromIndex:(int64_t)a4 toIndex:(unint64_t)a5
{
  v19 = (uint64_t (**)(id, void *))a3;
  unint64_t v8 = self;
  objc_sync_enter(v8);
  if (a4 <= a5)
  {
    do
    {
      v15 = [(ICDocCamRectangleResultsQueue *)v8 array];
      v16 = [v15 objectAtIndex:a4];

      char v17 = v19[2](v19, v16);
      if (++a4 <= a5) {
        char v18 = v17;
      }
      else {
        char v18 = 0;
      }
    }
    while ((v18 & 1) != 0);
  }
  else if ((int)a4 >= (int)a5)
  {
    a4 = (int)a4;
    int64_t v9 = (int)a5;
    do
    {
      v10 = [(ICDocCamRectangleResultsQueue *)v8 array];
      v11 = [v10 objectAtIndex:a4];

      char v12 = v19[2](v19, v11);
      if (a4-- <= v9) {
        char v14 = 0;
      }
      else {
        char v14 = v12;
      }
    }
    while ((v14 & 1) != 0);
  }
  objc_sync_exit(v8);
}

- (int64_t)size
{
  v2 = self;
  objc_sync_enter(v2);
  id v3 = [(ICDocCamRectangleResultsQueue *)v2 array];
  int64_t v4 = [v3 count];

  objc_sync_exit(v2);
  return v4;
}

- (NSMutableArray)array
{
  return self->_array;
}

- (void)setArray:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
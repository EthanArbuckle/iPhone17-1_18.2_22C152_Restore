@interface PDASMSearchStringCache
+ (id)shared;
- (BOOL)isCached:(id)a3;
- (PDASMSearchStringCache)init;
- (id)allObjects;
- (unint64_t)count;
- (void)addToCache:(id)a3 expires:(id)a4;
- (void)reset;
@end

@implementation PDASMSearchStringCache

- (PDASMSearchStringCache)init
{
  v6.receiver = self;
  v6.super_class = (Class)PDASMSearchStringCache;
  v2 = [(PDASMSearchStringCache *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableArray *)[objc_alloc((Class)NSMutableArray) initWithCapacity:20];
    buffer = v2->_buffer;
    v2->_buffer = v3;
  }
  return v2;
}

+ (id)shared
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100167D5C;
  block[3] = &unk_1001F29D0;
  block[4] = a1;
  if (qword_10023E7F0 != -1) {
    dispatch_once(&qword_10023E7F0, block);
  }
  v2 = (void *)qword_10023E7F8;

  return v2;
}

- (BOOL)isCached:(id)a3
{
  id v4 = a3;
  v5 = +[NSDate date];
  if ([(NSMutableArray *)self->_buffer count])
  {
    unint64_t v6 = 0;
    while (1)
    {
      v7 = [(NSMutableArray *)self->_buffer objectAtIndexedSubscript:v6];
      v8 = [v7 objectAtIndexedSubscript:1];
      id v9 = [v5 compare:v8];

      if (v9 != (id)1)
      {
        v10 = [v7 objectAtIndexedSubscript:0];
        unsigned int v11 = [v4 hasPrefix:v10];

        if (v11) {
          break;
        }
      }
      ++v6;

      if (v6 >= (unint64_t)[(NSMutableArray *)self->_buffer count]) {
        goto LABEL_6;
      }
    }

    BOOL v12 = 1;
  }
  else
  {
LABEL_6:
    BOOL v12 = 0;
  }

  return v12;
}

- (void)addToCache:(id)a3 expires:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_msgSend(objc_alloc((Class)NSArray), "initWithObjects:", v7, v6, 0);

  [(NSMutableArray *)self->_buffer insertObject:v8 atIndex:0];
  if ((unint64_t)[(NSMutableArray *)self->_buffer count] >= 0x15) {
    [(NSMutableArray *)self->_buffer removeLastObject];
  }
}

- (unint64_t)count
{
  return (unint64_t)[(NSMutableArray *)self->_buffer count];
}

- (id)allObjects
{
  id v2 = [(NSMutableArray *)self->_buffer copy];

  return v2;
}

- (void)reset
{
}

- (void).cxx_destruct
{
}

@end
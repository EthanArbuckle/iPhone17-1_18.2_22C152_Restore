@interface ABPKCircularArray
- (ABPKCircularArray)initWithCapacity:(int64_t)a3;
- (NSArray)contents;
- (int64_t)count;
- (void)add:(id)a3;
@end

@implementation ABPKCircularArray

- (ABPKCircularArray)initWithCapacity:(int64_t)a3
{
  v10.receiver = self;
  v10.super_class = (Class)ABPKCircularArray;
  v4 = [(ABPKCircularArray *)&v10 init];
  v5 = v4;
  if (v4)
  {
    if (a3 <= 1) {
      int64_t v6 = 1;
    }
    else {
      int64_t v6 = a3;
    }
    v4->_capacity = v6;
    uint64_t v7 = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:v4->_capacity];
    array = v5->_array;
    v5->_array = (NSMutableArray *)v7;
  }
  return v5;
}

- (NSArray)contents
{
  v2 = (void *)[(NSMutableArray *)self->_array copy];
  return (NSArray *)v2;
}

- (void)add:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = __ABPKLogSharedInstance();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int64_t capacity = self->_capacity;
    int v17 = 134217984;
    int64_t v18 = capacity;
    _os_log_impl(&dword_21B7C6000, v5, OS_LOG_TYPE_DEBUG, " Circular buffer capacity: %lu ", (uint8_t *)&v17, 0xCu);
  }

  uint64_t v7 = __ABPKLogSharedInstance();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v8 = [(NSMutableArray *)self->_array count];
    int v17 = 134217984;
    int64_t v18 = v8;
    _os_log_impl(&dword_21B7C6000, v7, OS_LOG_TYPE_DEBUG, " Circular buffer count: %lu ", (uint8_t *)&v17, 0xCu);
  }

  uint64_t v9 = [(NSMutableArray *)self->_array count];
  int64_t v10 = self->_capacity;
  v11 = __ABPKLogSharedInstance();
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG);
  if (v9 == v10)
  {
    if (v12)
    {
      LOWORD(v17) = 0;
      _os_log_impl(&dword_21B7C6000, v11, OS_LOG_TYPE_DEBUG, " Circular buffer full ", (uint8_t *)&v17, 2u);
    }

    v13 = __ABPKLogSharedInstance();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v17) = 0;
      _os_log_impl(&dword_21B7C6000, v13, OS_LOG_TYPE_DEBUG, " Removing first element ", (uint8_t *)&v17, 2u);
    }

    [(NSMutableArray *)self->_array removeObjectAtIndex:0];
    v11 = __ABPKLogSharedInstance();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v14 = [(NSMutableArray *)self->_array count];
      int v17 = 134217984;
      int64_t v18 = v14;
      v15 = " Insert new element at the index: %lu ";
LABEL_14:
      _os_log_impl(&dword_21B7C6000, v11, OS_LOG_TYPE_DEBUG, v15, (uint8_t *)&v17, 0xCu);
    }
  }
  else if (v12)
  {
    uint64_t v16 = [(NSMutableArray *)self->_array count];
    int v17 = 134217984;
    int64_t v18 = v16;
    v15 = " Inserting element to the circular buffer: %lu ";
    goto LABEL_14;
  }

  [(NSMutableArray *)self->_array addObject:v4];
}

- (int64_t)count
{
  return [(NSMutableArray *)self->_array count];
}

- (void).cxx_destruct
{
}

@end
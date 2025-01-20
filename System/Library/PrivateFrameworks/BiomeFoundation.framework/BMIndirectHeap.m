@interface BMIndirectHeap
- (BMIndirectHeap)initWithHeapSize:(unint64_t)a3 isAscending:(id)a4;
- (id)description;
- (id)isAscending;
- (unint64_t)array;
- (unint64_t)count;
- (unint64_t)pop;
- (unint64_t)size;
- (unint64_t)top;
- (void)add:(unint64_t)a3;
- (void)dealloc;
- (void)reset;
- (void)setArray:(unint64_t *)a3;
- (void)setCount:(unint64_t)a3;
- (void)setIsAscending:(id)a3;
- (void)setSize:(unint64_t)a3;
@end

@implementation BMIndirectHeap

- (void)reset
{
  self->_count = 0;
}

- (unint64_t)count
{
  return self->_count;
}

- (void).cxx_destruct
{
}

- (void)dealloc
{
  array = self->_array;
  if (array)
  {
    free(array);
    self->_array = 0;
  }
  self->_count = 0;
  self->_size = 0;
  v4.receiver = self;
  v4.super_class = (Class)BMIndirectHeap;
  [(BMIndirectHeap *)&v4 dealloc];
}

- (BMIndirectHeap)initWithHeapSize:(unint64_t)a3 isAscending:(id)a4
{
  id v7 = a4;
  if (a3 >= 0x1FFFFFFFFFFFFFFFLL)
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"BMIndirectHeap.m", 18, @"Invalid parameter not satisfying: %@", @"size < NSUIntegerMax / sizeof(NSUInteger)" object file lineNumber description];
  }
  v14.receiver = self;
  v14.super_class = (Class)BMIndirectHeap;
  v8 = [(BMIndirectHeap *)&v14 init];
  v9 = v8;
  if (v8)
  {
    v8->_size = a3;
    v8->_array = (unint64_t *)malloc_type_malloc(8 * a3, 0x100004000313F17uLL);
    v9->_count = 0;
    uint64_t v10 = MEMORY[0x1B3EB5AC0](v7);
    id isAscending = v9->_isAscending;
    v9->_id isAscending = (id)v10;
  }
  return v9;
}

- (id)description
{
  id v3 = objc_alloc_init(NSString);
  objc_super v4 = v3;
  if (self->_count)
  {
    unint64_t v5 = 0;
    do
    {
      v6 = objc_msgSend(v4, "stringByAppendingFormat:", @"%lu ", self->_array[v5]);

      ++v5;
      objc_super v4 = v6;
    }
    while (v5 < self->_count);
  }
  else
  {
    v6 = v3;
  }
  id v7 = (void *)[[NSString alloc] initWithFormat:@"size:%lu count:%lu array: %@", self->_size, self->_count, v6];

  return v7;
}

- (void)add:(unint64_t)a3
{
  unint64_t count = self->_count;
  if (count >= self->_size)
  {
    v9 = __biome_log_for_category(1);
    *(void *)buf = 0;
    v13 = buf;
    uint64_t v14 = 0x2020000000;
    char v15 = 16;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __22__BMIndirectHeap_add___block_invoke;
    block[3] = &unk_1E60229E8;
    block[4] = buf;
    if (add__onceToken != -1) {
      dispatch_once(&add__onceToken, block);
    }
    os_log_type_t v10 = v13[24];
    _Block_object_dispose(buf, 8);
    if (os_log_type_enabled(v9, v10))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B30A0000, v9, v10, "BMIndirectHeap add: full", buf, 2u);
    }
  }
  else
  {
    self->_unint64_t count = count + 1;
    self->_array[count] = a3;
    if (count)
    {
      do
      {
        unint64_t v5 = count - 1;
        unint64_t v6 = (count - 1) >> 1;
        if ((*((uint64_t (**)(void))self->_isAscending + 2))()) {
          break;
        }
        array = self->_array;
        unint64_t v8 = array[count];
        array[count] = array[v6];
        array[v6] = v8;
        unint64_t count = (count - 1) >> 1;
      }
      while (v5 > 1);
    }
  }
}

uint64_t __22__BMIndirectHeap_add___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 17;
  return result;
}

- (unint64_t)top
{
  if (self->_count) {
    return *self->_array;
  }
  else {
    return -1;
  }
}

- (unint64_t)pop
{
  unint64_t count = self->_count;
  if (count)
  {
    array = self->_array;
    unint64_t v5 = *array;
    unint64_t v6 = count - 1;
    self->_unint64_t count = v6;
    unint64_t *array = array[v6];
    unint64_t v7 = self->_count;
    if (v7 >= 2)
    {
      uint64_t v8 = 0;
      unint64_t v9 = 0;
      unint64_t v10 = 1;
      while (1)
      {
        unint64_t v11 = v8 + 2;
        if (v8 + 2 < v7 && !(*((unsigned int (**)(void))self->_isAscending + 2))()) {
          goto LABEL_9;
        }
        if (!(*((unsigned int (**)(void))self->_isAscending + 2))()) {
          break;
        }
        v12 = self->_array;
        unint64_t v13 = v12[v10];
        v12[v10] = v12[v9];
        v12[v9] = v13;
LABEL_11:
        unint64_t v9 = v10;
        uint64_t v8 = 2 * v10;
        unint64_t v10 = (2 * v10) | 1;
        unint64_t v7 = self->_count;
        if (v10 >= v7) {
          return v5;
        }
      }
      if (v11 >= v7) {
        return v5;
      }
LABEL_9:
      if ((*((uint64_t (**)(void))self->_isAscending + 2))()) {
        return v5;
      }
      uint64_t v14 = self->_array;
      unint64_t v15 = v14[v11];
      v14[v11] = v14[v9];
      v14[v9] = v15;
      unint64_t v10 = v11;
      goto LABEL_11;
    }
  }
  else
  {
    v16 = __biome_log_for_category(1);
    *(void *)buf = 0;
    v21 = buf;
    uint64_t v22 = 0x2020000000;
    char v23 = 16;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __21__BMIndirectHeap_pop__block_invoke;
    block[3] = &unk_1E60229E8;
    block[4] = buf;
    if (pop_onceToken != -1) {
      dispatch_once(&pop_onceToken, block);
    }
    os_log_type_t v17 = v21[24];
    _Block_object_dispose(buf, 8);
    if (os_log_type_enabled(v16, v17))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B30A0000, v16, v17, "BMIndirectHeap pop: empty", buf, 2u);
    }

    return -1;
  }
  return v5;
}

uint64_t __21__BMIndirectHeap_pop__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 17;
  return result;
}

- (unint64_t)array
{
  return self->_array;
}

- (void)setArray:(unint64_t *)a3
{
  self->_array = a3;
}

- (void)setCount:(unint64_t)a3
{
  self->_unint64_t count = a3;
}

- (unint64_t)size
{
  return self->_size;
}

- (void)setSize:(unint64_t)a3
{
  self->_size = a3;
}

- (id)isAscending
{
  return objc_getProperty(self, a2, 32, 1);
}

- (void)setIsAscending:(id)a3
{
}

@end
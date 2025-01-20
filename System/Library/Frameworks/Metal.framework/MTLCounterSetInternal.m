@interface MTLCounterSetInternal
- (BOOL)isEqual:(id)a3;
- (MTLCounterSetInternal)initWithName:(id)a3 description:(id)a4 counters:(id)a5;
- (NSArray)counters;
- (NSString)description;
- (NSString)name;
- (unint64_t)hash;
- (void)dealloc;
@end

@implementation MTLCounterSetInternal

- (MTLCounterSetInternal)initWithName:(id)a3 description:(id)a4 counters:(id)a5
{
  v10.receiver = self;
  v10.super_class = (Class)MTLCounterSetInternal;
  v8 = [(MTLCounterSetInternal *)&v10 init];
  v8->_name = (NSString *)a3;
  v8->_description = (NSString *)a4;
  v8->_counters = (NSArray *)[a5 copy];
  return v8;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)MTLCounterSetInternal;
  [(MTLCounterSetInternal *)&v3 dealloc];
}

- (NSString)description
{
  v2 = (void *)[(NSString *)self->_description copy];

  return (NSString *)v2;
}

- (unint64_t)hash
{
  v38 = 0;
  NSUInteger v3 = [(NSString *)self->_name hash];
  v4 = std::__allocate_at_least[abi:ne180100]<std::allocator<objc_object  {objcproto18MTLIOScratchBuffer}*>>((uint64_t)&v38, 1uLL);
  void *v4 = v3;
  v6 = (char *)(v4 + 1);
  __p = (int *)v4;
  v38 = (char *)&v4[v5];
  v36 = v6;
  NSUInteger v7 = [(NSString *)self->_description hash];
  NSUInteger v8 = v7;
  v9 = (int *)v6;
  if (v6 >= v38)
  {
    v11 = __p;
    uint64_t v12 = (v6 - (char *)__p) >> 3;
    unint64_t v13 = v12 + 1;
    if ((unint64_t)(v12 + 1) >> 61) {
      std::vector<std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v14 = v38 - (char *)__p;
    if ((v38 - (char *)__p) >> 2 > v13) {
      unint64_t v13 = v14 >> 2;
    }
    if ((unint64_t)v14 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v15 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v15 = v13;
    }
    if (v15)
    {
      v16 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<objc_object  {objcproto18MTLIOScratchBuffer}*>>((uint64_t)&v38, v15);
      v11 = __p;
      v9 = (int *)v36;
    }
    else
    {
      v16 = 0;
    }
    v17 = (int *)&v16[8 * v12];
    v18 = &v16[8 * v15];
    *(void *)v17 = v8;
    objc_super v10 = (uint64_t *)(v17 + 2);
    while (v9 != v11)
    {
      uint64_t v19 = *((void *)v9 - 1);
      v9 -= 2;
      *((void *)v17 - 1) = v19;
      v17 -= 2;
    }
    __p = v17;
    v38 = v18;
    if (v11) {
      operator delete(v11);
    }
  }
  else
  {
    *(void *)v6 = v7;
    objc_super v10 = (uint64_t *)(v6 + 8);
  }
  unint64_t v20 = 0;
  v37 = v10;
  while ([(NSArray *)self->_counters count] > v20)
  {
    uint64_t v21 = objc_msgSend(-[NSArray objectAtIndexedSubscript:](self->_counters, "objectAtIndexedSubscript:", v20), "hash");
    uint64_t v22 = v21;
    v23 = v37;
    if (v37 >= (uint64_t *)v38)
    {
      v25 = __p;
      uint64_t v26 = ((char *)v37 - (char *)__p) >> 3;
      unint64_t v27 = v26 + 1;
      if ((unint64_t)(v26 + 1) >> 61) {
        std::vector<std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>>::__throw_length_error[abi:ne180100]();
      }
      uint64_t v28 = v38 - (char *)__p;
      if ((v38 - (char *)__p) >> 2 > v27) {
        unint64_t v27 = v28 >> 2;
      }
      if ((unint64_t)v28 >= 0x7FFFFFFFFFFFFFF8) {
        unint64_t v29 = 0x1FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v29 = v27;
      }
      if (v29)
      {
        v30 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<objc_object  {objcproto18MTLIOScratchBuffer}*>>((uint64_t)&v38, v29);
        v25 = __p;
        v23 = v37;
      }
      else
      {
        v30 = 0;
      }
      v31 = (int *)&v30[8 * v26];
      *(void *)v31 = v22;
      v24 = (uint64_t *)(v31 + 2);
      while (v23 != (uint64_t *)v25)
      {
        uint64_t v32 = *--v23;
        *((void *)v31 - 1) = v32;
        v31 -= 2;
      }
      __p = v31;
      v38 = &v30[8 * v29];
      if (v25) {
        operator delete(v25);
      }
    }
    else
    {
      uint64_t *v37 = v21;
      v24 = v37 + 1;
    }
    v37 = v24;
    ++v20;
  }
  unsigned int v33 = _MTLHashState(__p, (char *)v37 - (char *)__p);
  if (__p) {
    operator delete(__p);
  }
  return v33;
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self)
  {
    LOBYTE(v12) = 1;
  }
  else
  {
    uint64_t v20 = v5;
    uint64_t v21 = v4;
    uint64_t v22 = v3;
    Class = object_getClass(self);
    if (Class != object_getClass(a3))
    {
LABEL_3:
      LOBYTE(v12) = 0;
      return v12;
    }
    name = self->_name;
    if (name == *((NSString **)a3 + 1) || (int v12 = -[NSString isEqual:](name, "isEqual:")) != 0)
    {
      description = self->_description;
      if (description == *((NSString **)a3 + 2) || (int v12 = -[NSString isEqual:](description, "isEqual:")) != 0)
      {
        NSUInteger v15 = [(NSArray *)self->_counters count];
        if (v15 != [*((id *)a3 + 3) count]) {
          goto LABEL_3;
        }
        if ([(NSArray *)self->_counters count])
        {
          NSUInteger v16 = 0;
          do
          {
            id v17 = [(NSArray *)self->_counters objectAtIndexedSubscript:v16];
            if (v17 != (id)[*((id *)a3 + 3) objectAtIndexedSubscript:v16])
            {
              int v12 = objc_msgSend(-[NSArray objectAtIndexedSubscript:](self->_counters, "objectAtIndexedSubscript:", v16), "isEqual:", objc_msgSend(*((id *)a3 + 3), "objectAtIndexedSubscript:", v16));
              if (!v12) {
                break;
              }
            }
            ++v16;
            NSUInteger v18 = [(NSArray *)self->_counters count];
            LOBYTE(v12) = 1;
          }
          while (v18 > v16);
        }
        else
        {
          LOBYTE(v12) = 1;
        }
      }
    }
  }
  return v12;
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSArray)counters
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

@end
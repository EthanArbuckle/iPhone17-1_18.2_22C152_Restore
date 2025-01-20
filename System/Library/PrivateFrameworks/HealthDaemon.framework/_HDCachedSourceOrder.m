@interface _HDCachedSourceOrder
- (BOOL)isEqual:(id)a3;
- (_HDCachedSourceOrder)init;
- (char)initWithSources:(char)a3 userOrdered:(char)a4 isDefaultOrder:;
- (char)orderedSources;
- (id).cxx_construct;
- (id)description;
- (id)sources;
@end

@implementation _HDCachedSourceOrder

- (id)sources
{
  if (a1)
  {
    v2 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(void *)(a1 + 24) - *(void *)(a1 + 16)) >> 3)];
    v4 = *(void **)(a1 + 16);
    v3 = *(void **)(a1 + 24);
    while (v4 != v3)
    {
      [v2 addObject:*v4];
      v4 += 3;
    }
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

- (char)initWithSources:(char)a3 userOrdered:(char)a4 isDefaultOrder:
{
  if (!a1) {
    return 0;
  }
  v25.receiver = a1;
  v25.super_class = (Class)_HDCachedSourceOrder;
  v7 = (char *)objc_msgSendSuper2(&v25, sel_init);
  v8 = v7;
  if (v7)
  {
    if (v7 + 16 != (char *)a2)
    {
      uint64_t v10 = *a2;
      uint64_t v9 = a2[1];
      unint64_t v11 = 0xAAAAAAAAAAAAAAABLL * ((v9 - v10) >> 3);
      v12 = (id *)*((void *)v7 + 2);
      if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((void *)v7 + 4) - (void)v12) >> 3) >= v11)
      {
        if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((void *)v7 + 3) - (void)v12) >> 3) >= v11)
        {
          v21 = std::__copy_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<_HDWrappedSource *,_HDWrappedSource *,_HDWrappedSource *>(v10, v9, v12);
          for (i = (id *)*((void *)v8 + 3); i != v21; i -= 3)
          {
            v23 = *(i - 3);
          }
          *((void *)v8 + 3) = v21;
        }
        else
        {
          uint64_t v17 = v10 + 8 * ((uint64_t)(*((void *)v7 + 3) - (void)v12) >> 3);
          std::__copy_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<_HDWrappedSource *,_HDWrappedSource *,_HDWrappedSource *>(v10, v17, v12);
          uint64_t v18 = *((void *)v8 + 3);
          if (v17 != v9)
          {
            uint64_t v19 = *((void *)v8 + 3);
            do
            {
              *(void *)uint64_t v19 = *(id *)v17;
              char v20 = *(unsigned char *)(v17 + 16);
              *(void *)(v19 + 8) = *(void *)(v17 + 8);
              *(unsigned char *)(v19 + 16) = v20;
              v18 += 24;
              v17 += 24;
              v19 += 24;
            }
            while (v17 != v9);
          }
          *((void *)v8 + 3) = v18;
        }
      }
      else
      {
        std::vector<_HDWrappedSource>::__vdeallocate((void **)v7 + 2);
        if (v11 > 0xAAAAAAAAAAAAAAALL) {
          std::vector<std::unique_ptr<statistics::Interval>>::__throw_length_error[abi:ne180100]();
        }
        unint64_t v13 = 0x5555555555555556 * ((uint64_t)(*((void *)v8 + 4) - *((void *)v8 + 2)) >> 3);
        if (v13 <= v11) {
          unint64_t v13 = 0xAAAAAAAAAAAAAAABLL * ((v9 - v10) >> 3);
        }
        if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((void *)v8 + 4) - *((void *)v8 + 2)) >> 3) >= 0x555555555555555) {
          unint64_t v14 = 0xAAAAAAAAAAAAAAALL;
        }
        else {
          unint64_t v14 = v13;
        }
        std::vector<_HDWrappedSource>::__vallocate[abi:ne180100]((void *)v8 + 2, v14);
        uint64_t v15 = *((void *)v8 + 3);
        while (v10 != v9)
        {
          *(void *)uint64_t v15 = *(id *)v10;
          char v16 = *(unsigned char *)(v10 + 16);
          *(void *)(v15 + 8) = *(void *)(v10 + 8);
          *(unsigned char *)(v15 + 16) = v16;
          v15 += 24;
          v10 += 24;
        }
        *((void *)v8 + 3) = v15;
      }
    }
    v8[8] = a3;
    v8[9] = a4;
  }
  return v8;
}

- (char)orderedSources
{
  *(void *)result = 0;
  *((void *)result + 1) = 0;
  *((void *)result + 2) = 0;
  if (a2) {
    return std::vector<_HDWrappedSource>::__init_with_size[abi:ne180100]<_HDWrappedSource*,_HDWrappedSource*>(result, *(void *)(a2 + 16), *(void *)(a2 + 24), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(void *)(a2 + 24) - *(void *)(a2 + 16)) >> 3));
  }
  return result;
}

- (_HDCachedSourceOrder)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  v4 = NSStringFromSelector(a2);
  [v3 raise:*MEMORY[0x1E4F1C3C8], @"The -%@ method is not available on %@", v4, objc_opt_class() format];

  return 0;
}

- (id)description
{
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:0xAAAAAAAAAAAAAAABLL * ((self->_orderedSources.__end_ - self->_orderedSources.__begin_) >> 3)];
  begin = (id *)self->_orderedSources.__begin_;
  end = self->_orderedSources.__end_;
  while (begin != (id *)end)
  {
    v6 = [*begin bundleIdentifier];
    [v3 addObject:v6];

    begin += 3;
  }
  v7 = NSString;
  uint64_t v8 = objc_opt_class();
  BOOL userOrdered = self->_userOrdered;
  uint64_t v10 = [v3 componentsJoinedByString:@", "];
  unint64_t v11 = (void *)v10;
  v12 = "YES";
  if (!userOrdered) {
    v12 = "NO";
  }
  unint64_t v13 = [v7 stringWithFormat:@"<%@:%p> userOrder:%s sources:%@", v8, self, v12, v10];

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && self->_userOrdered == *((unsigned __int8 *)v4 + 8)
    && self->_isDefaultSourceOrder == *((unsigned __int8 *)v4 + 9)
    && (begin = self->_orderedSources.__begin_, end = self->_orderedSources.__end_,
                                                uint64_t v7 = v4[2],
                                                end - begin == v4[3] - v7))
  {
    BOOL v8 = 1;
    while (begin != end)
    {
      if (*(void *)begin != *(void *)v7
        && (!*(void *)v7 || !objc_msgSend(*(id *)begin, "isEqual:"))
        || *((double *)begin + 1) != *(double *)(v7 + 8))
      {
        goto LABEL_12;
      }
      begin = (_HDWrappedSource *)((char *)begin + 24);
      v7 += 24;
    }
  }
  else
  {
LABEL_12:
    BOOL v8 = 0;
  }

  return v8;
}

- (void).cxx_destruct
{
  p_orderedSources = &self->_orderedSources;
  std::vector<_HDWrappedSource>::__destroy_vector::operator()[abi:ne180100]((void ***)&p_orderedSources);
}

- (id).cxx_construct
{
  *((void *)self + 2) = 0;
  *((void *)self + 3) = 0;
  *((void *)self + 4) = 0;
  return self;
}

@end
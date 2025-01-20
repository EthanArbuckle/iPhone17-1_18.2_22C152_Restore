@interface CVNLPLexiconCursors
- (CVNLPLexiconCursors)initWithSortedCursors:(void *)a3;
- (id).cxx_construct;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)count;
- (void)dealloc;
- (void)enumerateLexiconCursorsSortedByPriorityWithBlock:(id)a3;
@end

@implementation CVNLPLexiconCursors

- (CVNLPLexiconCursors)initWithSortedCursors:(void *)a3
{
  v24.receiver = self;
  v24.super_class = (Class)CVNLPLexiconCursors;
  v4 = [(CVNLPLexiconCursors *)&v24 init];
  v5 = v4;
  p_sortedCursors = &v4->_sortedCursors;
  if (v4) {
    BOOL v7 = p_sortedCursors == a3;
  }
  else {
    BOOL v7 = 1;
  }
  if (!v7)
  {
    v8 = *(char **)a3;
    v9 = (char *)*((void *)a3 + 1);
    int64_t v10 = (int64_t)&v9[-*(void *)a3];
    unint64_t v11 = v10 >> 3;
    uint64_t value = (uint64_t)v4->_sortedCursors.__end_cap_.__value_;
    begin = v4->_sortedCursors.__begin_;
    if (v10 >> 3 > (unint64_t)((value - (uint64_t)begin) >> 3))
    {
      if (begin)
      {
        v4->_sortedCursors.__end_ = begin;
        operator delete(begin);
        uint64_t value = 0;
        p_sortedCursors->__begin_ = 0;
        p_sortedCursors->__end_ = 0;
        p_sortedCursors->__end_cap_.__value_ = 0;
      }
      if (v10 < 0) {
        goto LABEL_27;
      }
      uint64_t v14 = value >> 2;
      if (value >> 2 <= v11) {
        uint64_t v14 = v10 >> 3;
      }
      unint64_t v15 = (unint64_t)value >= 0x7FFFFFFFFFFFFFF8 ? 0x1FFFFFFFFFFFFFFFLL : v14;
      if (v15 >> 61) {
LABEL_27:
      }
        sub_1B4BB3244();
      v16 = (_LXCursor **)operator new(8 * v15);
      begin = v16;
      v5->_sortedCursors.__end_ = v16;
      p_end = &v5->_sortedCursors.__end_;
      v5->_sortedCursors.__begin_ = v16;
      v5->_sortedCursors.__end_cap_.__value_ = &v16[v15];
      if (v9 != v8) {
        memcpy(v16, v8, v10);
      }
      goto LABEL_25;
    }
    p_end = &v4->_sortedCursors.__end_;
    end = v4->_sortedCursors.__end_;
    unint64_t v19 = end - begin;
    if (v19 >= v11)
    {
      if (v9 == v8)
      {
LABEL_25:
        *p_end = (_LXCursor **)((char *)begin + v10);
        return v5;
      }
      v21 = v4->_sortedCursors.__begin_;
      v22 = v8;
    }
    else
    {
      v20 = &v8[8 * v19];
      if (end != begin)
      {
        memmove(v4->_sortedCursors.__begin_, v8, (char *)end - (char *)begin);
        begin = *p_end;
      }
      int64_t v10 = v9 - v20;
      if (v9 == v20) {
        goto LABEL_25;
      }
      v21 = begin;
      v22 = v20;
    }
    memmove(v21, v22, v10);
    goto LABEL_25;
  }
  return v5;
}

- (void)enumerateLexiconCursorsSortedByPriorityWithBlock:(id)a3
{
  v4 = (void (**)(id, uint64_t, char *))a3;
  begin = self->_sortedCursors.__begin_;
  end = self->_sortedCursors.__end_;
  if (begin != end)
  {
    BOOL v7 = begin + 1;
    do
    {
      uint64_t v8 = (uint64_t)*(v7 - 1);
      char v10 = 0;
      v4[2](v4, v8, &v10);
      if (v10) {
        BOOL v9 = 1;
      }
      else {
        BOOL v9 = v7 == end;
      }
      ++v7;
    }
    while (!v9);
  }
}

- (int64_t)count
{
  return self->_sortedCursors.__end_ - self->_sortedCursors.__begin_;
}

- (id)copyWithZone:(_NSZone *)a3
{
  __p = 0;
  v33 = 0;
  v34 = 0;
  begin = self->_sortedCursors.__begin_;
  end = self->_sortedCursors.__end_;
  if (begin != end)
  {
    while (1)
    {
      uint64_t v6 = LXCursorCreateByAdvancing();
      uint64_t v7 = v6;
      uint64_t v8 = v33;
      if (v33 >= v34) {
        break;
      }
      *(void *)v33 = v6;
      uint64_t v5 = (uint64_t)(v8 + 8);
LABEL_4:
      v33 = (char *)v5;
      if (++begin == end) {
        goto LABEL_26;
      }
    }
    BOOL v9 = __p;
    int64_t v10 = v33 - (unsigned char *)__p;
    uint64_t v11 = (v33 - (unsigned char *)__p) >> 3;
    unint64_t v12 = v11 + 1;
    if ((unint64_t)(v11 + 1) >> 61) {
      sub_1B4BB3244();
    }
    uint64_t v13 = v34 - (unsigned char *)__p;
    if ((v34 - (unsigned char *)__p) >> 2 > v12) {
      unint64_t v12 = v13 >> 2;
    }
    if ((unint64_t)v13 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v14 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v14 = v12;
    }
    if (v14)
    {
      if (v14 >> 61) {
        sub_1B4BB2D38();
      }
      unint64_t v15 = operator new(8 * v14);
      v16 = (uint64_t *)&v15[8 * v11];
      uint64_t *v16 = v7;
      uint64_t v5 = (uint64_t)(v16 + 1);
      int64_t v17 = v8 - v9;
      if (v8 == v9)
      {
LABEL_15:
        __p = v16;
        v34 = &v15[8 * v14];
        if (!v8) {
          goto LABEL_4;
        }
        goto LABEL_25;
      }
    }
    else
    {
      unint64_t v15 = 0;
      v16 = (uint64_t *)(8 * v11);
      *(void *)(8 * v11) = v7;
      uint64_t v5 = 8 * v11 + 8;
      int64_t v17 = v8 - v9;
      if (v8 == v9) {
        goto LABEL_15;
      }
    }
    unint64_t v18 = v17 - 8;
    if (v18 < 0x58) {
      goto LABEL_33;
    }
    if ((unint64_t)(v8 - v15 - v10) < 0x20) {
      goto LABEL_33;
    }
    uint64_t v19 = (v18 >> 3) + 1;
    uint64_t v20 = 8 * (v19 & 0x3FFFFFFFFFFFFFFCLL);
    v21 = &v8[-v20];
    v16 = (uint64_t *)((char *)v16 - v20);
    v22 = &v15[8 * v11 - 16];
    v23 = (long long *)(v8 - 16);
    uint64_t v24 = v19 & 0x3FFFFFFFFFFFFFFCLL;
    do
    {
      long long v25 = *v23;
      *(v22 - 1) = *(v23 - 1);
      _OWORD *v22 = v25;
      v22 -= 2;
      v23 -= 2;
      v24 -= 4;
    }
    while (v24);
    uint64_t v8 = v21;
    if (v19 != (v19 & 0x3FFFFFFFFFFFFFFCLL))
    {
LABEL_33:
      do
      {
        uint64_t v26 = *((void *)v8 - 1);
        v8 -= 8;
        *--v16 = v26;
      }
      while (v8 != v9);
    }
    uint64_t v8 = __p;
    __p = v16;
    v34 = &v15[8 * v14];
    if (!v8) {
      goto LABEL_4;
    }
LABEL_25:
    operator delete(v8);
    goto LABEL_4;
  }
LABEL_26:
  v27 = [CVNLPLexiconCursors alloc];
  v30 = objc_msgSend_initWithSortedCursors_(v27, v28, (uint64_t)&__p, v29);
  if (__p)
  {
    v33 = (char *)__p;
    operator delete(__p);
  }
  return v30;
}

- (void)dealloc
{
  begin = self->_sortedCursors.__begin_;
  end = self->_sortedCursors.__end_;
  while (begin != end)
  {
    if (*begin) {
      CFRelease(*begin);
    }
    ++begin;
  }
  v5.receiver = self;
  v5.super_class = (Class)CVNLPLexiconCursors;
  [(CVNLPLexiconCursors *)&v5 dealloc];
}

- (void).cxx_destruct
{
  begin = self->_sortedCursors.__begin_;
  if (begin)
  {
    self->_sortedCursors.__end_ = begin;
    operator delete(begin);
  }
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  *((void *)self + 3) = 0;
  return self;
}

@end
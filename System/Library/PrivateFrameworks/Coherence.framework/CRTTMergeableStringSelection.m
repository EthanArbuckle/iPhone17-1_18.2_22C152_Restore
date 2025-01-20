@interface CRTTMergeableStringSelection
- (BOOL)hasTopoIDsThatCanChange;
- (BOOL)isEqual:(id)a3;
- (id).cxx_construct;
- (id)description;
- (unint64_t)hash;
- (unint64_t)selectionAffinity;
- (void)selectionRanges;
- (void)setSelectionAffinity:(unint64_t)a3;
- (void)updateTopoIDRange:(TopoIDRange *)a3 toNewRangeID:(TopoIDRange *)a4;
@end

@implementation CRTTMergeableStringSelection

- (void)selectionRanges
{
  return &self->_selectionRanges;
}

- (void)updateTopoIDRange:(TopoIDRange *)a3 toNewRangeID:(TopoIDRange *)a4
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  begin = (TopoID *)self->_selectionRanges.__begin_;
  for (i = (TopoID *)self->_selectionRanges.__end_; begin != i; begin += 2)
  {
    updateTopoID(begin, a3, a4, &v10);
    long long v8 = *(_OWORD *)v10.replica.uuid;
    *(void *)&begin->replica.index = *(void *)&v10.replica.index;
    *(_OWORD *)begin->replica.uuid = v8;
    updateTopoID(begin + 1, a3, a4, &v10);
    long long v9 = *(_OWORD *)v10.replica.uuid;
    *(void *)&begin[1].replica.index = *(void *)&v10.replica.index;
    *(_OWORD *)begin[1].replica.uuid = v9;
  }
}

- (BOOL)hasTopoIDsThatCanChange
{
  return 0;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    v6 = (uint64_t *)[v5 selectionRanges];
    v7 = v6;
    unint64_t v8 = 0xAAAAAAAAAAAAAAABLL * ((v6[1] - *v6) >> 4);
    begin = self->_selectionRanges.__begin_;
    end = self->_selectionRanges.__end_;
    if (v8 == 0xAAAAAAAAAAAAAAABLL * ((end - begin) >> 4))
    {
      if (end == begin)
      {
LABEL_14:
        unint64_t v19 = [(CRTTMergeableStringSelection *)self selectionAffinity];
        BOOL v20 = v19 == [v5 selectionAffinity];
LABEL_17:

        goto LABEL_18;
      }
      uint64_t v11 = 0;
      if (v8 <= 1) {
        unint64_t v12 = 1;
      }
      else {
        unint64_t v12 = 0xAAAAAAAAAAAAAAABLL * ((v6[1] - *v6) >> 4);
      }
      while (1)
      {
        uint64_t v13 = *v7;
        uint64_t v14 = *v7 + v11;
        v15 = (char *)self->_selectionRanges.__begin_;
        v16 = &v15[v11];
        if (*(_DWORD *)(v14 + 20) != *(_DWORD *)&v15[v11 + 20]) {
          break;
        }
        if (*(_DWORD *)(v14 + 16) != *((_DWORD *)v16 + 4)) {
          break;
        }
        if (uuid_compare((const unsigned __int8 *)v14, (const unsigned __int8 *)v16)) {
          break;
        }
        uint64_t v17 = v13 + v11;
        v18 = &v15[v11];
        if (*(_DWORD *)(v13 + v11 + 44) != *(_DWORD *)&v15[v11 + 44]
          || *(_DWORD *)(v17 + 40) != *((_DWORD *)v18 + 10)
          || uuid_compare((const unsigned __int8 *)(v17 + 24), (const unsigned __int8 *)v18 + 24))
        {
          break;
        }
        v11 += 48;
        if (!--v12) {
          goto LABEL_14;
        }
      }
    }
    BOOL v20 = 0;
    goto LABEL_17;
  }
  BOOL v20 = 0;
LABEL_18:

  return v20;
}

- (unint64_t)hash
{
  int64_t v2 = (char *)self->_selectionRanges.__end_ - (char *)self->_selectionRanges.__begin_;
  if (!v2) {
    return 0;
  }
  uint64_t v4 = 0;
  unint64_t v5 = 0;
  unint64_t v6 = v2 / 48;
  if (v6 <= 1) {
    uint64_t v7 = 1;
  }
  else {
    uint64_t v7 = v6;
  }
  do
  {
    uint64_t v8 = CFHashBytes();
    uint64_t v9 = *(unsigned int *)((char *)self->_selectionRanges.__begin_ + v4 + 20);
    v5 ^= v8 ^ CFHashBytes() ^ v9 ^ *(unsigned int *)((char *)self->_selectionRanges.__begin_ + v4 + 44);
    v4 += 48;
    --v7;
  }
  while (v7);
  return v5;
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  objc_msgSend(v3, "appendFormat:", @"<CRTTMergeableStringSelection %p ", self);
  begin = (char *)self->_selectionRanges.__begin_;
  end = (char *)self->_selectionRanges.__end_;
  if (begin != end)
  {
    unint64_t v6 = begin + 24;
    do
    {
      uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDBytes:v6 - 24];
      uint64_t v8 = [v7 CRTTShortDescription];
      [v3 appendFormat:@" %@.%d:%d", v8, *((unsigned int *)v6 - 2), *((unsigned int *)v6 - 1)];

      uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDBytes:v6];
      TopoID v10 = [MEMORY[0x1E4F29128] CRTTZero];
      if ([v9 isEqual:v10])
      {
        int v11 = *((_DWORD *)v6 + 5);

        if (!v11) {
          goto LABEL_8;
        }
      }
      else
      {
      }
      unint64_t v12 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDBytes:v6];
      uint64_t v13 = [v12 CRTTShortDescription];
      [v3 appendFormat:@"-%@.%d:%d", v13, *((unsigned int *)v6 + 4), *((unsigned int *)v6 + 5)];

LABEL_8:
      uint64_t v14 = v6 + 24;
      v6 += 48;
    }
    while (v14 != end);
  }
  [v3 appendFormat:@">"];
  return v3;
}

- (unint64_t)selectionAffinity
{
  return self->_selectionAffinity;
}

- (void)setSelectionAffinity:(unint64_t)a3
{
  self->_selectionAffinity = a3;
}

- (void).cxx_destruct
{
  begin = self->_selectionRanges.__begin_;
  if (begin)
  {
    self->_selectionRanges.__end_ = begin;
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
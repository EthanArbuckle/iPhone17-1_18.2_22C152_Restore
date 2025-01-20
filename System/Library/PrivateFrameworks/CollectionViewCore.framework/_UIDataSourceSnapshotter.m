@interface _UIDataSourceSnapshotter
+ (id)snapshotterForDataSourceBackedView:(id)a3;
+ (id)snapshotterForNoDataSource;
+ (id)snapshotterForSectionCountsProvider:(id)a3;
+ (id)snapshotterForSnapshot:(id)a3;
- (BOOL)_decrementSectionCount:(int64_t)a3;
- (BOOL)_decrementSectionCount:(int64_t)a3 byCount:(int64_t)a4;
- (BOOL)_deleteAllSections;
- (BOOL)_deleteSection:(int64_t)a3;
- (BOOL)_incrementSectionCount:(int64_t)a3;
- (BOOL)_incrementSectionCount:(int64_t)a3 byCount:(int64_t)a4;
- (BOOL)_insertSection:(int64_t)a3 withInitialCount:(int64_t)a4;
- (BOOL)indexPathIsSectionAppendingInsert:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (_NSRange)rangeForSection:(int64_t)a3;
- (_UIDataSourceSnapshotter)initWithDataSourceBackedView:(id)a3;
- (_UIDataSourceSnapshotter)initWithSectionCounts:(id)a3;
- (_UIDataSourceSnapshotter)initWithSectionCountsProvider:(id)a3;
- (id).cxx_construct;
- (id)copyWithZone:(_NSZone *)a3;
- (id)indexPathForAppendingInsertInSection:(int64_t)a3;
- (id)indexPathForGlobalIndex:(int64_t)a3;
- (id)snapshot;
- (int64_t)globalIndexForIndexPath:(id)a3;
- (int64_t)numberOfItems;
- (int64_t)numberOfItemsBeforeSection:(int64_t)a3;
- (int64_t)numberOfItemsInSection:(int64_t)a3;
- (int64_t)numberOfSections;
- (int64_t)sectionForGlobalIndex:(int64_t)a3;
- (void)_recomputeRangeLocations;
- (void)_resetToStateOfSnapshotter:(id)a3;
@end

@implementation _UIDataSourceSnapshotter

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  *((void *)self + 3) = 0;
  return self;
}

- (void).cxx_destruct
{
  begin = self->_sectionRanges.__begin_;
  if (begin)
  {
    self->_sectionRanges.__end_ = begin;
    operator delete(begin);
  }
}

- (id)snapshot
{
  v2 = (void *)[(_UIDataSourceSnapshotter *)self copy];
  return v2;
}

- (int64_t)numberOfSections
{
  return self->_sectionRanges.__end_ - self->_sectionRanges.__begin_;
}

- (int64_t)numberOfItems
{
  begin = self->_sectionRanges.__begin_;
  end = self->_sectionRanges.__end_;
  if (begin == end) {
    return 0;
  }
  int64_t result = 0;
  do
  {
    result += begin->length;
    ++begin;
  }
  while (begin != end);
  return result;
}

+ (id)snapshotterForSnapshot:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = (void *)[v4 copy];
  }
  else
  {
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __51___UIDataSourceSnapshotter_snapshotterForSnapshot___block_invoke;
    v8[3] = &unk_2640B2EA8;
    id v9 = v4;
    v6 = (void *)MEMORY[0x21053FCB0](v8);
    v5 = [a1 snapshotterForSectionCountsProvider:v6];
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(_UIDataSourceSnapshotter);
  v5 = v4;
  begin = (char *)self->_sectionRanges.__begin_;
  end = (char *)self->_sectionRanges.__end_;
  if (end - begin >= 1 && v4 != self) {
    std::vector<_NSRange>::__assign_with_size[abi:nn180100]<_NSRange*,_NSRange*>(&v4->_sectionRanges.__begin_, begin, end, (unint64_t)(end - begin) >> 4);
  }
  return v5;
}

- (NSString)description
{
  v3 = (void *)MEMORY[0x263F089D8];
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [v3 stringWithFormat:@"<%@: %p; ", v5, self];

  int64_t v7 = [(_UIDataSourceSnapshotter *)self numberOfSections];
  int64_t v8 = v7;
  id v9 = @"s";
  unint64_t v10 = v7 - 1;
  if (v7 == 1) {
    id v9 = &stru_26C0F8F98;
  }
  [v6 appendFormat:@"%lu section%@ with item counts: [", v7, v9];
  if (v8)
  {
    for (unint64_t i = 0; i != v8; ++i)
    {
      objc_msgSend(v6, "appendFormat:", @"%lu", -[_UIDataSourceSnapshotter numberOfItemsInSection:](self, "numberOfItemsInSection:", i));
      if (i < v10) {
        [v6 appendString:@", "];
      }
    }
  }
  [v6 appendString:@"] >"];
  return (NSString *)v6;
}

- (int64_t)numberOfItemsInSection:(int64_t)a3
{
  begin = self->_sectionRanges.__begin_;
  if (a3 >= self->_sectionRanges.__end_ - begin) {
    return 0;
  }
  else {
    return begin[a3].length;
  }
}

+ (id)snapshotterForSectionCountsProvider:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithSectionCountsProvider:v4];

  return v5;
}

- (_UIDataSourceSnapshotter)initWithSectionCountsProvider:(id)a3
{
  id v4 = a3;
  v5 = [(_UIDataSourceSnapshotter *)self init];
  v6 = v5;
  if (v5) {
    _UIDataSourceSnapshotterCommonInit(v5, 0, v4);
  }

  return v6;
}

- (int64_t)globalIndexForIndexPath:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    begin = self->_sectionRanges.__begin_;
    end = self->_sectionRanges.__end_;
    uint64_t v8 = [v4 section];
    uint64_t v9 = v8;
    int64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
    if ((v8 & 0x8000000000000000) == 0 && v8 < end - begin)
    {
      v11 = self->_sectionRanges.__begin_;
      uint64_t v12 = [v5 item];
      if (v12 >= v11[v9].length || v12 <= -1) {
        int64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
      }
      else {
        int64_t v10 = v11[v9].location + v12;
      }
    }
  }
  else
  {
    int64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v10;
}

- (id)indexPathForGlobalIndex:(int64_t)a3
{
  if (a3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = 0;
  }
  else
  {
    begin = self->_sectionRanges.__begin_;
    end = self->_sectionRanges.__end_;
    if (begin == end)
    {
LABEL_10:
      v5 = 0;
    }
    else
    {
      uint64_t v9 = 0;
      while (a3 < begin->location || begin->length + begin->location <= a3)
      {
        ++v9;
        if (++begin == end) {
          goto LABEL_10;
        }
      }
      v5 = objc_msgSend(MEMORY[0x263F088C8], "indexPathForItem:inSection:", a3 - begin->location, v9, v3);
    }
  }
  return v5;
}

- (BOOL)_incrementSectionCount:(int64_t)a3 byCount:(int64_t)a4
{
  begin = self->_sectionRanges.__begin_;
  int64_t v6 = self->_sectionRanges.__end_ - begin;
  if (v6 > a3)
  {
    begin[a3].length += a4;
    [(_UIDataSourceSnapshotter *)self _recomputeRangeLocations];
  }
  return v6 > a3;
}

- (BOOL)_insertSection:(int64_t)a3 withInitialCount:(int64_t)a4
{
  begin = self->_sectionRanges.__begin_;
  end = self->_sectionRanges.__end_;
  int64_t v7 = end - begin;
  if (v7 >= a3)
  {
    v35.location = 0x7FFFFFFFFFFFFFFFLL;
    v35.length = a4;
    uint64_t v9 = &begin[a3];
    value = self->_sectionRanges.__end_cap_.__value_;
    if (end >= value)
    {
      unint64_t v15 = v7 + 1;
      if ((unint64_t)(v7 + 1) >> 60) {
        abort();
      }
      uint64_t v16 = (char *)value - (char *)begin;
      if (v16 >> 3 > v15) {
        unint64_t v15 = v16 >> 3;
      }
      if ((unint64_t)v16 >= 0x7FFFFFFFFFFFFFF0) {
        unint64_t v17 = 0xFFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v17 = v15;
      }
      if (v17)
      {
        v19 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<_NSRange>>(v17);
      }
      else
      {
        v19 = 0;
        uint64_t v18 = 0;
      }
      v21 = (_NSRange *)&v19[16 * a3];
      v22 = (_NSRange *)&v19[16 * v18];
      if (v18 == a3)
      {
        if (a3 < 1)
        {
          if (a3) {
            unint64_t v23 = 2 * a3;
          }
          else {
            unint64_t v23 = 1;
          }
          v24 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<_NSRange>>(v23);
          v21 = (_NSRange *)&v24[16 * (v23 >> 2)];
          v22 = (_NSRange *)&v24[16 * v25];
          if (v19) {
            operator delete(v19);
          }
        }
        else
        {
          v21 = (_NSRange *)((char *)v21 - ((8 * a3 + 8) & 0xFFFFFFFFFFFFFFF0));
        }
      }
      _NSRange *v21 = v35;
      v26 = self->_sectionRanges.__begin_;
      v27 = v21;
      if (v26 != v9)
      {
        v28 = v9;
        v29 = v21;
        do
        {
          v27 = v29 - 1;
          v29[-1] = v28[-1];
          --v28;
          --v29;
        }
        while (v28 != v26);
      }
      v30 = v21 + 1;
      v31 = self->_sectionRanges.__end_;
      int64_t v32 = (char *)v31 - (char *)v9;
      if (v31 != v9) {
        memmove(v30, v9, (char *)v31 - (char *)v9);
      }
      v33 = self->_sectionRanges.__begin_;
      self->_sectionRanges.__begin_ = v27;
      self->_sectionRanges.__end_ = (_NSRange *)((char *)v30 + v32);
      self->_sectionRanges.__end_cap_.__value_ = v22;
      if (v33) {
        operator delete(v33);
      }
    }
    else if (v9 == end)
    {
      _NSRange *end = v35;
      self->_sectionRanges.__end_ = end + 1;
    }
    else
    {
      v11 = v9 + 1;
      uint64_t v12 = end - 1;
      v13 = end;
      while (v12 < end)
      {
        _NSRange v14 = *v12++;
        *v13++ = v14;
      }
      self->_sectionRanges.__end_ = v13;
      if (end != v11) {
        memmove(&end[-(end - v11)], v9, (char *)end - (char *)v11);
      }
      v20 = &v35;
      if (v9 <= &v35) {
        v20 = &v35 + (self->_sectionRanges.__end_ > &v35);
      }
      *uint64_t v9 = *v20;
    }
    [(_UIDataSourceSnapshotter *)self _recomputeRangeLocations];
  }
  return v7 >= a3;
}

- (void)_recomputeRangeLocations
{
  begin = self->_sectionRanges.__begin_;
  end = self->_sectionRanges.__end_;
  if (begin != end)
  {
    NSUInteger v4 = 0;
    do
    {
      begin->location = v4;
      v4 += begin->length;
      ++begin;
    }
    while (begin != end);
  }
}

- (_NSRange)rangeForSection:(int64_t)a3
{
  NSUInteger v4 = 0;
  NSUInteger v5 = 0x7FFFFFFFFFFFFFFFLL;
  if ((a3 & 0x8000000000000000) == 0)
  {
    p_sectionRanges = &self->_sectionRanges;
    begin = self->_sectionRanges.__begin_;
    if (p_sectionRanges->__end_ - begin > a3)
    {
      p_location = &begin[a3].location;
      NSUInteger v5 = *p_location;
      NSUInteger v4 = p_location[1];
    }
  }
  result.length = v4;
  result.location = v5;
  return result;
}

- (int64_t)sectionForGlobalIndex:(int64_t)a3
{
  begin = self->_sectionRanges.__begin_;
  end = self->_sectionRanges.__end_;
  if (begin == end) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  for (int64_t result = 0; a3 < begin->location || a3 - begin->location >= begin->length; ++result)
  {
    if (++begin == end) {
      return 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  NSUInteger v4 = (_UIDataSourceSnapshotter *)a3;
  if (v4 == self)
  {
    LOBYTE(v16) = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      NSUInteger v5 = v4;
      uint64_t v6 = [(_UIDataSourceSnapshotter *)v5 numberOfSections];
      if (v6 == [(_UIDataSourceSnapshotter *)self numberOfSections]
        && (uint64_t v7 = [(_UIDataSourceSnapshotter *)v5 numberOfItems],
            v7 == [(_UIDataSourceSnapshotter *)self numberOfItems]))
      {
        begin = self->_sectionRanges.__begin_;
        end = self->_sectionRanges.__end_;
        if (begin == end)
        {
          LOBYTE(v16) = 1;
        }
        else
        {
          int64_t v10 = v5->_sectionRanges.__begin_;
          do
          {
            NSUInteger location = begin->location;
            NSUInteger length = begin->length;
            ++begin;
            NSUInteger v13 = v10->location;
            NSUInteger v14 = v10->length;
            ++v10;
            BOOL v16 = location == v13 && length == v14;
          }
          while (v16 && begin != end);
        }
      }
      else
      {
        LOBYTE(v16) = 0;
      }
    }
    else
    {
      LOBYTE(v16) = 0;
    }
  }

  return v16;
}

+ (id)snapshotterForDataSourceBackedView:(id)a3
{
  id v4 = a3;
  NSUInteger v5 = (void *)[objc_alloc((Class)a1) initWithDataSourceBackedView:v4];

  return v5;
}

+ (id)snapshotterForNoDataSource
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (_UIDataSourceSnapshotter)initWithSectionCounts:(id)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v25 = a3;
  id v4 = [(_UIDataSourceSnapshotter *)self init];
  if ([v25 count])
  {
    p_begin = (void **)&v4->_sectionRanges.__begin_;
    std::vector<_NSRange>::reserve((void **)&v4->_sectionRanges.__begin_, [v25 count]);
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v6 = v25;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v7)
    {
      NSUInteger v8 = 0;
      uint64_t v9 = *(void *)v27;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v27 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = [*(id *)(*((void *)&v26 + 1) + 8 * i) integerValue];
          uint64_t v12 = v11;
          end = v4->_sectionRanges.__end_;
          value = v4->_sectionRanges.__end_cap_.__value_;
          if (end >= value)
          {
            begin = (char *)*p_begin;
            uint64_t v17 = ((char *)end - (unsigned char *)*p_begin) >> 4;
            unint64_t v18 = v17 + 1;
            if ((unint64_t)(v17 + 1) >> 60) {
              abort();
            }
            uint64_t v19 = (char *)value - begin;
            if (v19 >> 3 > v18) {
              unint64_t v18 = v19 >> 3;
            }
            if ((unint64_t)v19 >= 0x7FFFFFFFFFFFFFF0) {
              unint64_t v20 = 0xFFFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v20 = v18;
            }
            if (v20)
            {
              unint64_t v20 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<_NSRange>>(v20);
              begin = (char *)v4->_sectionRanges.__begin_;
              end = v4->_sectionRanges.__end_;
            }
            else
            {
              uint64_t v21 = 0;
            }
            v22 = (_NSRange *)(v20 + 16 * v17);
            v22->NSUInteger location = v8;
            v22->NSUInteger length = v12;
            unint64_t v23 = v22;
            if (end != (_NSRange *)begin)
            {
              do
              {
                v23[-1] = end[-1];
                --v23;
                --end;
              }
              while (end != (_NSRange *)begin);
              begin = (char *)*p_begin;
            }
            unint64_t v15 = v22 + 1;
            v4->_sectionRanges.__begin_ = v23;
            v4->_sectionRanges.__end_ = v22 + 1;
            v4->_sectionRanges.__end_cap_.__value_ = (_NSRange *)(v20 + 16 * v21);
            if (begin) {
              operator delete(begin);
            }
          }
          else
          {
            end->NSUInteger location = v8;
            end->NSUInteger length = v11;
            unint64_t v15 = end + 1;
          }
          v4->_sectionRanges.__end_ = v15;
          v8 += v12;
        }
        uint64_t v7 = [v6 countByEnumeratingWithState:&v26 objects:v30 count:16];
      }
      while (v7);
    }
  }
  return v4;
}

- (_UIDataSourceSnapshotter)initWithDataSourceBackedView:(id)a3
{
  id v4 = a3;
  NSUInteger v5 = [(_UIDataSourceSnapshotter *)self init];
  id v6 = v5;
  if (v5) {
    _UIDataSourceSnapshotterCommonInit(v5, v4, 0);
  }

  return v6;
}

- (int64_t)numberOfItemsBeforeSection:(int64_t)a3
{
  begin = self->_sectionRanges.__begin_;
  if (a3 >= self->_sectionRanges.__end_ - begin) {
    return 0;
  }
  else {
    return begin[a3].location;
  }
}

- (BOOL)indexPathIsSectionAppendingInsert:(id)a3
{
  id v4 = a3;
  NSUInteger v5 = v4;
  if (v4)
  {
    uint64_t v6 = [v4 section];
    int64_t v7 = [(_UIDataSourceSnapshotter *)self numberOfSections];
    uint64_t v8 = [v5 item];
    int64_t v9 = [(_UIDataSourceSnapshotter *)self numberOfItemsInSection:v6];
    BOOL v11 = v6 < v7 && v8 == v9;
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (id)indexPathForAppendingInsertInSection:(int64_t)a3
{
  NSUInteger v5 = 0;
  if ((a3 & 0x8000000000000000) == 0)
  {
    if (self->_sectionRanges.__end_ - self->_sectionRanges.__begin_ > a3)
    {
      NSUInteger v5 = objc_msgSend(MEMORY[0x263F088C8], "indexPathForItem:inSection:", -[_UIDataSourceSnapshotter numberOfItemsInSection:](self, "numberOfItemsInSection:", a3), a3);
    }
    uint64_t v3 = vars8;
  }
  return v5;
}

- (BOOL)_decrementSectionCount:(int64_t)a3
{
  return [(_UIDataSourceSnapshotter *)self _decrementSectionCount:a3 byCount:1];
}

- (BOOL)_decrementSectionCount:(int64_t)a3 byCount:(int64_t)a4
{
  begin = self->_sectionRanges.__begin_;
  if (a3 >= self->_sectionRanges.__end_ - begin) {
    return 0;
  }
  NSUInteger v5 = &begin[a3];
  unint64_t length = v5->length;
  p_unint64_t length = &v5->length;
  unint64_t v8 = length - a4;
  if (length < a4) {
    return 0;
  }
  *p_unint64_t length = v8;
  [(_UIDataSourceSnapshotter *)self _recomputeRangeLocations];
  return 1;
}

- (BOOL)_deleteSection:(int64_t)a3
{
  begin = self->_sectionRanges.__begin_;
  end = self->_sectionRanges.__end_;
  BOOL v6 = (char *)end - (char *)begin > 0 && a3 < end - begin;
  if (v6)
  {
    unint64_t v8 = &begin[a3];
    int64_t v9 = (char *)((char *)end - (char *)&v8[1]);
    if (end != &v8[1]) {
      memmove(&begin[a3], &v8[1], (char *)end - (char *)&v8[1]);
    }
    self->_sectionRanges.__end_ = (_NSRange *)&v9[(void)v8];
    [(_UIDataSourceSnapshotter *)self _recomputeRangeLocations];
  }
  return v6;
}

- (BOOL)_deleteAllSections
{
  self->_sectionRanges.__end_ = self->_sectionRanges.__begin_;
  return 1;
}

- (BOOL)_incrementSectionCount:(int64_t)a3
{
  return [(_UIDataSourceSnapshotter *)self _incrementSectionCount:a3 byCount:1];
}

- (void)_resetToStateOfSnapshotter:(id)a3
{
  NSUInteger v5 = (_UIDataSourceSnapshotter *)a3;
  int64_t v7 = (char **)v5;
  if (!v5)
  {
    BOOL v6 = [MEMORY[0x263F08690] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"_UIDataSourceSnapshotter.mm", 351, @"Invalid parameter not satisfying: %@", @"snapshotter != nil" object file lineNumber description];

    NSUInteger v5 = 0;
  }
  if (self != v5) {
    std::vector<_NSRange>::__assign_with_size[abi:nn180100]<_NSRange*,_NSRange*>(&self->_sectionRanges.__begin_, v7[1], v7[2], (v7[2] - v7[1]) >> 4);
  }
}

@end
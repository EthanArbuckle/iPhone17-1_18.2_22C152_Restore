@interface NUIGridDimension
- (BOOL)isHidden;
- (NSArray)arrangedSubviews;
- (double)length;
- (double)spacingAfter;
- (id)initWithContainerGridView:(int)a3 isRow:;
- (int64_t)alignment;
- (void)dealloc;
- (void)invalidateArrangedSubviews;
- (void)setAlignment:(int64_t)a3;
- (void)setHidden:(BOOL)a3;
- (void)setLength:(double)a3;
- (void)setSpacingAfter:(double)a3;
@end

@implementation NUIGridDimension

- (id)initWithContainerGridView:(int)a3 isRow:
{
  if (result)
  {
    v7.receiver = result;
    v7.super_class = (Class)NUIGridDimension;
    result = objc_msgSendSuper2(&v7, sel_init);
    if (result)
    {
      *((void *)result + 3) = 0x7FEFFFFFFFFFFFFFLL;
      *((void *)result + 4) = 0x7FEFFFFFFFFFFFFFLL;
      __int16 v5 = *((_WORD *)result + 20);
      *((void *)result + 1) = a2;
      if (a3) {
        __int16 v6 = 256;
      }
      else {
        __int16 v6 = 0;
      }
      *((_WORD *)result + 20) = v5 & 0xFC00 | v6 | 0xFF;
    }
  }
  return result;
}

- (BOOL)isHidden
{
  $ED2F510FED2B259BD5B5EABD061698BE flags = self->_flags;
  if ((*(_WORD *)&flags & 0x400) != 0)
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8], @"%@ no longer attached to grid view <%p>.", self, self->_gridView format];
    $ED2F510FED2B259BD5B5EABD061698BE flags = self->_flags;
  }
  return (*(unsigned int *)&flags >> 9) & 1;
}

- (void)setAlignment:(int64_t)a3
{
  if ((*(_WORD *)&self->_flags & 0x400) != 0) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8], @"%@ no longer attached to grid view <%p>.", self, self->_gridView format];
  }
  -[NUIContainerView _assertNotInLayoutPass:]((uint64_t)self->_gridView);
  __int16 flags = (__int16)self->_flags;
  if ((char)flags != a3)
  {
    *(_WORD *)&self->___int16 flags = flags & 0xFF00 | a3;
    gridView = self->_gridView;
    [(NUIContainerView *)gridView setNeedsInvalidation:4];
  }
}

- (void)setHidden:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  if ((*(_WORD *)&self->_flags & 0x400) != 0) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8], @"%@ no longer attached to grid view <%p>.", self, self->_gridView format];
  }
  -[NUIContainerView _assertNotInLayoutPass:]((uint64_t)self->_gridView);
  __int16 flags = (__int16)self->_flags;
  if (((((flags & 0x200) == 0) ^ v3) & 1) == 0)
  {
    if (v3) {
      __int16 v6 = 512;
    }
    else {
      __int16 v6 = 0;
    }
    *(_WORD *)&self->___int16 flags = flags & 0xFDFF | v6;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    obj = [(NUIGridDimension *)self arrangedSubviews];
    uint64_t v22 = [(NSArray *)obj countByEnumeratingWithState:&v27 objects:v31 count:16];
    if (v22)
    {
      uint64_t v21 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v22; ++i)
        {
          if (*(void *)v28 != v21) {
            objc_enumerationMutation(obj);
          }
          v8 = *(void **)(*((void *)&v27 + 1) + 8 * i);
          [(NUIContainerGridView *)self->_gridView getColumnRange:&v25 rowRange:&v23 forArrangedSubview:v8];
          int v9 = [v8 isHidden];
          unint64_t v10 = v25;
          do
          {
            unint64_t v11 = v10;
            unint64_t v12 = v26 + v25;
            if (v10 >= v26 + v25) {
              break;
            }
            uint64_t v13 = [(NSMutableArray *)self->_gridView->_columns objectAtIndexedSubscript:v10];
            unint64_t v10 = v11 + 1;
          }
          while ((*(_WORD *)(v13 + 40) & 0x200) != 0);
          unint64_t v14 = v23;
          do
          {
            unint64_t v15 = v14;
            unint64_t v16 = v24 + v23;
            if (v14 >= v24 + v23) {
              break;
            }
            uint64_t v17 = [(NSMutableArray *)self->_gridView->_rows objectAtIndexedSubscript:v14];
            unint64_t v14 = v15 + 1;
          }
          while ((*(_WORD *)(v17 + 40) & 0x200) != 0);
          int v19 = v11 >= v12 || v15 >= v16;
          if (v9 != v19) {
            objc_msgSend(v8, "setHidden:");
          }
        }
        uint64_t v22 = [(NSArray *)obj countByEnumeratingWithState:&v27 objects:v31 count:16];
      }
      while (v22);
    }
    [(NUIContainerView *)self->_gridView invalidateIntrinsicContentSize];
  }
}

- (NSArray)arrangedSubviews
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if ((*(_WORD *)&self->_flags & 0x400) != 0) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8], @"%@ no longer attached to grid view <%p>.", self, self->_gridView format];
  }
  result = self->_arrangedSubviews;
  if ((*((unsigned char *)&self->_gridView->_gridViewFlags + 2) & 2) != 0)
  {

    self->_arrangedSubviews = 0;
  }
  else if (result)
  {
    return result;
  }
  gridView = self->_gridView;
  if ((*(_WORD *)&self->_flags & 0x100) != 0)
  {
    uint64_t v14 = [(NSMutableArray *)gridView->_rows indexOfObject:self];
    if (v14 != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v13 = objc_msgSend(MEMORY[0x1E4F1CAA0], "orderedSetWithArray:", -[NSMutableArray objectAtIndex:](self->_gridView->_viewRows, "objectAtIndex:", v14));
LABEL_22:
      result = (NSArray *)(id)[v13 array];
      self->_arrangedSubviews = result;
      return result;
    }
  }
  else
  {
    uint64_t v5 = [(NSMutableArray *)gridView->_columns indexOfObject:self];
    if (v5 != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v6 = v5;
      objc_super v7 = objc_msgSend(MEMORY[0x1E4F1CA70], "orderedSetWithCapacity:", -[NSMutableArray count](self->_gridView->_viewRows, "count"));
      long long v16 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      viewRows = self->_gridView->_viewRows;
      uint64_t v9 = [(NSMutableArray *)viewRows countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v17;
        do
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v17 != v11) {
              objc_enumerationMutation(viewRows);
            }
            objc_msgSend(v7, "addObject:", objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "objectAtIndex:", v6));
          }
          uint64_t v10 = [(NSMutableArray *)viewRows countByEnumeratingWithState:&v16 objects:v20 count:16];
        }
        while (v10);
      }
      uint64_t v13 = v7;
      goto LABEL_22;
    }
  }
  unint64_t v15 = (void *)MEMORY[0x1E4F1C978];
  return (NSArray *)[v15 array];
}

- (void)invalidateArrangedSubviews
{
  if (a1)
  {

    *(void *)(a1 + 16) = 0;
  }
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)NUIGridDimension;
  [(NUIGridDimension *)&v3 dealloc];
}

- (double)length
{
  if ((*(_WORD *)&self->_flags & 0x400) != 0) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8], @"%@ no longer attached to grid view <%p>.", self, self->_gridView format];
  }
  return self->_length;
}

- (void)setLength:(double)a3
{
  if ((*(_WORD *)&self->_flags & 0x400) != 0) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8], @"%@ no longer attached to grid view <%p>.", self, self->_gridView format];
  }
  -[NUIContainerView _assertNotInLayoutPass:]((uint64_t)self->_gridView);
  if (self->_length != a3)
  {
    self->_length = a3;
    gridView = self->_gridView;
    [(NUIContainerView *)gridView invalidateIntrinsicContentSize];
  }
}

- (double)spacingAfter
{
  if ((*(_WORD *)&self->_flags & 0x400) != 0) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8], @"%@ no longer attached to grid view <%p>.", self, self->_gridView format];
  }
  return self->_spacing;
}

- (void)setSpacingAfter:(double)a3
{
  if ((*(_WORD *)&self->_flags & 0x400) != 0) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8], @"%@ no longer attached to grid view <%p>.", self, self->_gridView format];
  }
  -[NUIContainerView _assertNotInLayoutPass:]((uint64_t)self->_gridView);
  if (self->_spacing != a3)
  {
    self->_spacing = a3;
    gridView = self->_gridView;
    [(NUIContainerView *)gridView setNeedsInvalidation:2];
  }
}

- (int64_t)alignment
{
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x400) != 0)
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8], @"%@ no longer attached to grid view <%p>.", self, self->_gridView format];
    return (char)*(_WORD *)&self->_flags;
  }
  return (char)flags;
}

@end
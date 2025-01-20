@interface NSMutableIndexSet
- (Class)classForCoder;
- (void)_addRangeToArray:(_NSRange)a3;
- (void)_convertToUsingRanges;
- (void)_ensureRangeCapacity:(unint64_t)a3;
- (void)_incrementBy:(unint64_t)a3 startingAtIndex:(unint64_t)a4;
- (void)_insertRange:(_NSRange)a3 inArrayAtIndex:(unint64_t)a4;
- (void)_mergeOverlappingRangesStartingAtIndex:(unint64_t)a3;
- (void)_removeAndDecrementBy:(unint64_t)a3 startingAtIndex:(unint64_t)a4;
- (void)_removeRangeInArrayAtIndex:(unint64_t)a3;
- (void)_replaceRangeInArrayAtIndex:(unint64_t)a3 withRange:(_NSRange)a4;
- (void)addIndex:(NSUInteger)value;
- (void)addIndexes:(NSIndexSet *)indexSet;
- (void)addIndexes:(const unint64_t *)a3 count:(unint64_t)a4;
- (void)addIndexesInRange:(NSRange)range;
- (void)addIndexesWithBitfield:(unint64_t)a3;
- (void)removeAllIndexes;
- (void)removeIndex:(NSUInteger)value;
- (void)removeIndexes:(NSIndexSet *)indexSet;
- (void)removeIndexesInRange:(NSRange)range;
- (void)removeIndexesInRange:(_NSRange)a3 options:(unint64_t)a4 passingTest:(id)a5;
- (void)removeIndexesPassingTest:(id)a3;
- (void)removeIndexesWithOptions:(unint64_t)a3 passingTest:(id)a4;
- (void)shiftIndexesStartingAtIndex:(NSUInteger)index by:(NSInteger)delta;
@end

@implementation NSMutableIndexSet

- (void)addIndex:(NSUInteger)value
{
  if ((*(unsigned char *)&self->super._indexSetFlags & 2) != 0)
  {
    if (value <= 0x3F)
    {
      self->super._internal._singleRange._range.location |= 1 << value;
      return;
    }
    [(NSMutableIndexSet *)self _convertToUsingRanges];
  }

  -[NSMutableIndexSet addIndexesInRange:](self, "addIndexesInRange:", value, 1);
}

- (void)addIndexesInRange:(NSRange)range
{
  NSUInteger length = range.length;
  NSUInteger location = range.location;
  NSUInteger v6 = range.location + range.length;
  if (range.length && (v6 & 0x8000000000000000) != 0)
  {
    v30 = _NSMethodExceptionProem((objc_class *)self, a2);
    v33.NSUInteger location = location;
    v33.NSUInteger length = length;
    v31 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C4A8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: Range %@ exceeds maximum index value of NSNotFound - 1", v30, NSStringFromRange(v33)), 0 reason userInfo];
    objc_exception_throw(v31);
  }
  if (range.length)
  {
    if ((*(unsigned char *)&self->super._indexSetFlags & 2) != 0)
    {
      if (v6 <= 0x40)
      {
        self->super._internal._singleRange._range.location |= 0xFFFFFFFFFFFFFFFFLL >> -LOBYTE(range.length) << SLOBYTE(range.location);
        return;
      }
      [(NSMutableIndexSet *)self _convertToUsingRanges];
    }
    unint64_t v7 = [(NSIndexSet *)self _indexOfRangeBeforeOrContainingIndex:location];
    if (v7 == 0x7FFFFFFFFFFFFFFFLL) {
      unint64_t v8 = 0;
    }
    else {
      unint64_t v8 = v7;
    }
    p_internal = &self->super._internal;
    p_NSUInteger length = &self->super._internal._singleRange._range.length;
    v11 = (uint64_t *)MEMORY[0x1E4FBA8E0];
    uint64_t v12 = *MEMORY[0x1E4FBA8E0];
    if (((unint64_t)self & 0xC000000000000007) == 0xC000000000000007) {
      uint64_t v12 = 0;
    }
    unint64_t v13 = v12 ^ (unint64_t)self;
    uint64_t v14 = 0xFFFFFFFFFFFFFFFLL;
    if ((~(_BYTE)v13 & 7) == 0) {
      uint64_t v14 = 0xFFFFFFFFFFFFFLL;
    }
    unint64_t v15 = v14 & (v13 >> 3);
    for (uint64_t i = v8; ; ++i)
    {
      unint64_t v17 = v15;
      if (((unint64_t)self & 0x8000000000000000) == 0)
      {
        $A8859644891BA8F5A580113D622AC538 indexSetFlags = self->super._indexSetFlags;
        v19 = &self->super._internal;
        if ((*(unsigned char *)&indexSetFlags & 2) == 0)
        {
          v19 = ($228E88DFACDD67E146FBAE62E08A49BD *)(&self->super._internal._singleBitfield + 1);
          if ((*(unsigned char *)&indexSetFlags & 1) == 0) {
            v19 = ($228E88DFACDD67E146FBAE62E08A49BD *)(p_internal->_singleRange._range.location + 8);
          }
        }
        unint64_t v17 = v19->_singleRange._range.location;
      }
      if (v17)
      {
        if (*(unsigned char *)&self->super._indexSetFlags) {
          unint64_t v17 = 1;
        }
        else {
          unint64_t v17 = *(void *)(p_internal->_singleRange._range.location + 8);
        }
      }
      if (v8 >= v17) {
        goto LABEL_43;
      }
      v20 = &self->super._internal;
      if ((*(unsigned char *)&self->super._indexSetFlags & 1) == 0) {
        v20 = ($228E88DFACDD67E146FBAE62E08A49BD *)(p_internal->_singleRange._range.location
      }
                                                  + 16 * *(void *)(p_internal->_singleRange._range.location + 24)
                                                  + 64);
      v21 = &v20[i];
      NSUInteger v22 = v21->_singleRange._range.location;
      NSUInteger v23 = v6 - v21->_singleRange._range.location;
      if (v6 < v21->_singleRange._range.location) {
        break;
      }
      NSUInteger v24 = v21->_singleRange._range.length + v22;
      if (location < v22)
      {
        NSUInteger v22 = location;
        if (v6 <= v24) {
          NSUInteger v23 = v24 - location;
        }
        else {
          NSUInteger v23 = length;
        }
        if (v6 <= v24) {
          NSUInteger length = v24 - location;
        }
LABEL_42:
        -[NSMutableIndexSet _replaceRangeInArrayAtIndex:withRange:](self, "_replaceRangeInArrayAtIndex:withRange:", v8, v22, v23);
LABEL_43:
        if (((unint64_t)self & 0x8000000000000000) != 0)
        {
          uint64_t v25 = *v11;
          if (((unint64_t)self & 0xC000000000000007) == 0xC000000000000007) {
            uint64_t v25 = 0;
          }
          unint64_t v26 = v25 ^ (unint64_t)self;
          uint64_t v27 = 0xFFFFFFFFFFFFFFFLL;
          if ((~(_BYTE)v26 & 7) == 0) {
            uint64_t v27 = 0xFFFFFFFFFFFFFLL;
          }
          uint64_t v28 = v27 & (v26 >> 3);
          if (!v28) {
            goto LABEL_60;
          }
LABEL_57:
          if (*(unsigned char *)&self->super._indexSetFlags) {
            uint64_t v28 = 1;
          }
          else {
            uint64_t v28 = *(void *)(p_internal->_singleRange._range.location + 8);
          }
        }
        else
        {
          $A8859644891BA8F5A580113D622AC538 v29 = self->super._indexSetFlags;
          if ((*(unsigned char *)&v29 & 2) != 0)
          {
            uint64_t v28 = p_internal->_singleRange._range.location;
            if (p_internal->_singleRange._range.location) {
              goto LABEL_57;
            }
          }
          else if (*(unsigned char *)&v29)
          {
            uint64_t v28 = *p_length;
            if (*p_length) {
              goto LABEL_57;
            }
          }
          else
          {
            uint64_t v28 = *(void *)(p_internal->_singleRange._range.location + 8);
            if (v28) {
              goto LABEL_57;
            }
          }
        }
LABEL_60:
        if (v28 == v8) {
          -[NSMutableIndexSet _addRangeToArray:](self, "_addRangeToArray:", location, length);
        }
        [(NSMutableIndexSet *)self _mergeOverlappingRangesStartingAtIndex:v8];
        return;
      }
      if (v6 <= v24) {
        return;
      }
      if (v24 >= location) {
        goto LABEL_42;
      }
      ++v8;
    }
    -[NSMutableIndexSet _insertRange:inArrayAtIndex:](self, "_insertRange:inArrayAtIndex:", location, length, v8);
  }
}

- (void)_replaceRangeInArrayAtIndex:(unint64_t)a3 withRange:(_NSRange)a4
{
  if (((unint64_t)self & 0x8000000000000000) != 0)
  {
    uint64_t v4 = *MEMORY[0x1E4FBA8E0];
    if ((~(unint64_t)self & 0xC000000000000007) == 0) {
      uint64_t v4 = 0;
    }
    unint64_t v5 = v4 ^ (unint64_t)self;
    uint64_t v6 = 0xFFFFFFFFFFFFFFFLL;
    if ((~(_BYTE)v5 & 7) == 0) {
      uint64_t v6 = 0xFFFFFFFFFFFFFLL;
    }
    NSUInteger location = v6 & (v5 >> 3);
    if (!location) {
      goto LABEL_17;
    }
  }
  else
  {
    $A8859644891BA8F5A580113D622AC538 indexSetFlags = self->super._indexSetFlags;
    if ((*(unsigned char *)&indexSetFlags & 2) != 0)
    {
      NSUInteger location = self->super._internal._singleRange._range.location;
      if (!location) {
        goto LABEL_17;
      }
    }
    else if (*(unsigned char *)&indexSetFlags)
    {
      NSUInteger location = self->super._internal._singleRange._range.length;
      if (!location) {
        goto LABEL_17;
      }
    }
    else
    {
      NSUInteger location = *(void *)(self->super._internal._singleRange._range.location + 8);
      if (!location) {
        goto LABEL_17;
      }
    }
  }
  if (*(unsigned char *)&self->super._indexSetFlags)
  {
    NSUInteger location = 1;
    if (a4.length) {
      goto LABEL_18;
    }
    goto LABEL_25;
  }
  NSUInteger location = *(void *)(self->super._internal._singleRange._range.location + 8);
LABEL_17:
  if (a4.length)
  {
LABEL_18:
    if (location < a3)
    {
      unint64_t v13 = +[NSString stringWithFormat:@"Index %ld out of range bounds [0...%ld]", a4.location, a3, location];
      objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v13 userInfo:0]);
    }
    p_internal = &self->super._internal;
    v10 = &self->super._internal;
    if ((*(unsigned char *)&self->super._indexSetFlags & 1) == 0) {
      v10 = ($228E88DFACDD67E146FBAE62E08A49BD *)(p_internal->_singleRange._range.location
    }
                                                + 16 * *(void *)(p_internal->_singleRange._range.location + 24)
                                                + 64);
    p_range = &v10[a3]._singleRange._range;
    NSUInteger length = p_range->length;
    _NSRange *p_range = a4;
    if ((*(unsigned char *)&self->super._indexSetFlags & 1) == 0)
    {
      atomic_store(0, (unint64_t *)(p_internal->_singleRange._range.location + 56));
      *(void *)(p_internal->_singleRange._range.location + 16) -= length;
      *(void *)(p_internal->_singleRange._range.location + 16) += a4.length;
    }
    return;
  }
LABEL_25:

  -[NSMutableIndexSet _removeRangeInArrayAtIndex:](self, "_removeRangeInArrayAtIndex:", a3, a4.location);
}

- (void)_mergeOverlappingRangesStartingAtIndex:(unint64_t)a3
{
  p_internal = &self->super._internal;
  unint64_t v6 = (unint64_t)self & 0xC000000000000007;
  unint64_t v7 = (uint64_t *)MEMORY[0x1E4FBA8E0];
LABEL_2:
  if (((unint64_t)self & 0x8000000000000000) == 0)
  {
    while (1)
    {
      $A8859644891BA8F5A580113D622AC538 indexSetFlags = self->super._indexSetFlags;
      if ((*(unsigned char *)&indexSetFlags & 2) != 0)
      {
        if (!p_internal->_singleRange._range.location) {
          return;
        }
      }
      else if (*(unsigned char *)&indexSetFlags)
      {
        if (!self->super._internal._singleRange._range.length) {
          return;
        }
      }
      else if (!*(void *)(p_internal->_singleRange._range.location + 8))
      {
        return;
      }
LABEL_17:
      $A8859644891BA8F5A580113D622AC538 v12 = self->super._indexSetFlags;
      if ((*(unsigned char *)&v12 & 1) == 0 && !*(void *)(p_internal->_singleRange._range.location + 8)) {
        return;
      }
      if (((unint64_t)self & 0x8000000000000000) != 0) {
        break;
      }
      if ((*(unsigned char *)&v12 & 2) != 0)
      {
        NSUInteger location = p_internal->_singleRange._range.location;
        goto LABEL_34;
      }
      if ((*(unsigned char *)&v12 & 1) == 0)
      {
        NSUInteger v20 = p_internal->_singleRange._range.location;
        uint64_t v27 = *(void *)(p_internal->_singleRange._range.location + 8);
        if (v27)
        {
          if (a3 >= v27 - 1) {
            return;
          }
LABEL_39:
          NSUInteger v20 = p_internal->_singleRange._range.location;
        }
        else if (a3 == -1)
        {
          return;
        }
        uint64_t v18 = v20 + 16 * *(void *)(v20 + 24) + 64;
        goto LABEL_41;
      }
      if (self->super._internal._singleRange._range.length) {
        unint64_t v17 = 0;
      }
      else {
        unint64_t v17 = -1;
      }
      uint64_t v18 = (uint64_t)p_internal;
      if (a3 >= v17) {
        return;
      }
LABEL_41:
      v21 = (uint64_t *)(v18 + 16 * a3);
      uint64_t v22 = *v21;
      uint64_t v23 = v21[1];
      NSUInteger v24 = (unint64_t *)(v18 + 16 * (a3 + 1));
      unint64_t v25 = v23 + v22;
      if (v25 < *v24) {
        return;
      }
      unint64_t v26 = v24[1] + *v24;
      if (v25 < v26)
      {
        -[NSMutableIndexSet _replaceRangeInArrayAtIndex:withRange:](self, "_replaceRangeInArrayAtIndex:withRange:", a3, v22, v26 - v22);
        [(NSMutableIndexSet *)self _removeRangeInArrayAtIndex:++a3];
        goto LABEL_2;
      }
      [(NSMutableIndexSet *)self _removeRangeInArrayAtIndex:a3 + 1];
      if (((unint64_t)self & 0x8000000000000000) != 0) {
        goto LABEL_3;
      }
    }
    uint64_t v13 = *v7;
    if (v6 == 0xC000000000000007) {
      uint64_t v13 = 0;
    }
    unint64_t v14 = v13 ^ (unint64_t)self;
    if ((~(_BYTE)v14 & 7) != 0) {
      uint64_t v15 = 0xFFFFFFFFFFFFFFFLL;
    }
    else {
      uint64_t v15 = 0xFFFFFFFFFFFFFLL;
    }
    NSUInteger location = v15 & (v14 >> 3);
LABEL_34:
    uint64_t v19 = location != 0;
    if ((*(unsigned char *)&v12 & 1) == 0)
    {
      if (location) {
        uint64_t v19 = *(void *)(p_internal->_singleRange._range.location + 8);
      }
    }
    if (a3 >= v19 - 1) {
      return;
    }
    uint64_t v18 = (uint64_t)p_internal;
    if ((*(unsigned char *)&v12 & 1) == 0) {
      goto LABEL_39;
    }
    goto LABEL_41;
  }
LABEL_3:
  uint64_t v8 = *v7;
  if (v6 == 0xC000000000000007) {
    uint64_t v8 = 0;
  }
  unint64_t v9 = v8 ^ (unint64_t)self;
  if ((~(_BYTE)v9 & 7) != 0) {
    uint64_t v10 = 0xFFFFFFFFFFFFFFFLL;
  }
  else {
    uint64_t v10 = 0xFFFFFFFFFFFFFLL;
  }
  if ((v10 & (v9 >> 3)) != 0) {
    goto LABEL_17;
  }
}

- (void)removeIndex:(NSUInteger)value
{
  if ((*(unsigned char *)&self->super._indexSetFlags & 2) != 0)
  {
    if (value <= 0x3F) {
      self->super._internal._singleRange._range.location &= ~(1 << value);
    }
  }
  else
  {
    -[NSMutableIndexSet removeIndexesInRange:](self, "removeIndexesInRange:", value, 1);
  }
}

- (void)removeIndexesInRange:(NSRange)range
{
  if (!range.length) {
    return;
  }
  NSUInteger length = range.length;
  NSUInteger location = range.location;
  if ((*(unsigned char *)&self->super._indexSetFlags & 2) == 0)
  {
    if (range.location)
    {
      unint64_t v6 = [(NSIndexSet *)self _indexOfRangeAfterOrContainingIndex:range.location];
      if (v6 == 0x7FFFFFFFFFFFFFFFLL) {
        return;
      }
    }
    else
    {
      unint64_t v6 = 0;
    }
    NSUInteger v9 = location + length;
    p_internal = &self->super._internal;
    while (1)
    {
      if (((unint64_t)self & 0x8000000000000000) != 0)
      {
        uint64_t v11 = *MEMORY[0x1E4FBA8E0];
        if (((unint64_t)self & 0xC000000000000007) == 0xC000000000000007) {
          uint64_t v11 = 0;
        }
        unint64_t v12 = v11 ^ (unint64_t)self;
        if ((~(_BYTE)v12 & 7) != 0) {
          uint64_t v13 = 0xFFFFFFFFFFFFFFFLL;
        }
        else {
          uint64_t v13 = 0xFFFFFFFFFFFFFLL;
        }
        NSUInteger v14 = v13 & (v12 >> 3);
        if (!v14) {
          goto LABEL_34;
        }
      }
      else
      {
        $A8859644891BA8F5A580113D622AC538 indexSetFlags = self->super._indexSetFlags;
        if ((*(unsigned char *)&indexSetFlags & 2) != 0)
        {
          NSUInteger v14 = p_internal->_singleRange._range.location;
          if (!p_internal->_singleRange._range.location) {
            goto LABEL_34;
          }
        }
        else if (*(unsigned char *)&indexSetFlags)
        {
          NSUInteger v14 = self->super._internal._singleRange._range.length;
          if (!v14) {
            goto LABEL_34;
          }
        }
        else
        {
          NSUInteger v14 = *(void *)(p_internal->_singleRange._range.location + 8);
          if (!v14) {
            goto LABEL_34;
          }
        }
      }
      if (*(unsigned char *)&self->super._indexSetFlags) {
        NSUInteger v14 = 1;
      }
      else {
        NSUInteger v14 = *(void *)(p_internal->_singleRange._range.location + 8);
      }
LABEL_34:
      if (v6 >= v14) {
        return;
      }
      v16 = &self->super._internal;
      if ((*(unsigned char *)&self->super._indexSetFlags & 1) == 0) {
        v16 = ($228E88DFACDD67E146FBAE62E08A49BD *)(p_internal->_singleRange._range.location
      }
                                                  + 16 * *(void *)(p_internal->_singleRange._range.location + 24)
                                                  + 64);
      unint64_t v17 = &v16[v6];
      NSUInteger v18 = v17->_singleRange._range.location;
      if (v9 < v17->_singleRange._range.location) {
        return;
      }
      NSUInteger v19 = v17->_singleRange._range.length + v18;
      if (location > v18)
      {
        if (v19 > v9)
        {
          -[NSMutableIndexSet _replaceRangeInArrayAtIndex:withRange:](self, "_replaceRangeInArrayAtIndex:withRange:", v6, v9, v19 - v9);
          -[NSMutableIndexSet _insertRange:inArrayAtIndex:](self, "_insertRange:inArrayAtIndex:", v18, location - v18, v6);
          return;
        }
        if (location < v19) {
          -[NSMutableIndexSet _replaceRangeInArrayAtIndex:withRange:](self, "_replaceRangeInArrayAtIndex:withRange:", v6, v18, location - v18);
        }
        ++v6;
      }
      else
      {
        if (v19 > v9)
        {
          -[NSMutableIndexSet _replaceRangeInArrayAtIndex:withRange:](self, "_replaceRangeInArrayAtIndex:withRange:", v6, v9, v19 - v9);
          return;
        }
        [(NSMutableIndexSet *)self _removeRangeInArrayAtIndex:v6];
      }
    }
  }
  if (range.location <= 0x3F)
  {
    NSUInteger v7 = range.location + range.length;
    if (range.location + range.length >= 0x40) {
      NSUInteger v7 = 64;
    }
    if (v7 == range.location) {
      unint64_t v8 = -1;
    }
    else {
      unint64_t v8 = ~(0xFFFFFFFFFFFFFFFFLL >> (LOBYTE(range.location) - v7) << SLOBYTE(range.location));
    }
    self->super._internal._singleRange._range.location &= v8;
  }
}

- (void)_insertRange:(_NSRange)a3 inArrayAtIndex:(unint64_t)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  if (((unint64_t)self & 0x8000000000000000) == 0)
  {
    $A8859644891BA8F5A580113D622AC538 indexSetFlags = self->super._indexSetFlags;
    if ((*(unsigned char *)&indexSetFlags & 2) != 0)
    {
      NSUInteger v11 = self->super._internal._singleRange._range.location;
      if (!v11) {
        goto LABEL_18;
      }
    }
    else if (*(unsigned char *)&indexSetFlags)
    {
      NSUInteger v11 = self->super._internal._singleRange._range.length;
      if (!v11) {
        goto LABEL_18;
      }
    }
    else
    {
      NSUInteger v11 = *(void *)(self->super._internal._singleRange._range.location + 8);
      if (!v11) {
        goto LABEL_18;
      }
    }
    goto LABEL_15;
  }
  uint64_t v8 = *MEMORY[0x1E4FBA8E0];
  if ((~(unint64_t)self & 0xC000000000000007) == 0) {
    uint64_t v8 = 0;
  }
  unint64_t v9 = v8 ^ (unint64_t)self;
  uint64_t v10 = 0xFFFFFFFFFFFFFFFLL;
  if ((~(_BYTE)v9 & 7) == 0) {
    uint64_t v10 = 0xFFFFFFFFFFFFFLL;
  }
  NSUInteger v11 = v10 & (v9 >> 3);
  if (v11)
  {
LABEL_15:
    if (*(unsigned char *)&self->super._indexSetFlags) {
      NSUInteger v11 = 1;
    }
    else {
      NSUInteger v11 = *(void *)(self->super._internal._singleRange._range.location + 8);
    }
  }
LABEL_18:
  if (v11 < a4)
  {
    v30 = +[NSString stringWithFormat:@"Index %ld out of range bounds [0...%ld]", a4, v11];
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v30 userInfo:0]);
  }
  [(NSMutableIndexSet *)self _ensureRangeCapacity:v11 + 1];
  p_internal = &self->super._internal;
  if (*(unsigned char *)&self->super._indexSetFlags)
  {
    NSUInteger v24 = &p_internal[a4];
    v24->_singleRange._range.NSUInteger location = location;
    v24->_singleRange._range.NSUInteger length = length;
  }
  else
  {
    NSUInteger v14 = (void *)p_internal->_singleRange._range.location;
    uint64_t v16 = *(void *)p_internal->_singleRange._range.location;
    uint64_t v15 = *(void *)(p_internal->_singleRange._range.location + 8);
    uint64_t v17 = v15 - a4;
    unint64_t v18 = *(void *)(p_internal->_singleRange._range.location + 24);
    uint64_t v19 = v18 + v15;
    if (v15 - a4 > a4 && v18 != 0 || v16 == v19)
    {
      if (v15 == a4)
      {
        if (v18 <= 1) {
          uint64_t v22 = 1;
        }
        else {
          uint64_t v22 = v18 >> 1;
        }
        memmove(&v14[2 * v18 + 8 + -2 * v22], &v14[2 * v18 + 8], 16 * a4);
        NSUInteger v14 = (void *)p_internal->_singleRange._range.location;
        uint64_t v23 = *(void *)(p_internal->_singleRange._range.location + 24) - v22;
      }
      else
      {
        if (a4)
        {
          memmove(&v14[2 * v18 + 6], &v14[2 * v18 + 8], 16 * a4);
          NSUInteger v14 = (void *)p_internal->_singleRange._range.location;
          unint64_t v18 = *(void *)(p_internal->_singleRange._range.location + 24);
        }
        uint64_t v23 = v18 - 1;
      }
      v14[3] = v23;
    }
    else if (a4)
    {
      if (v15 != a4) {
        memmove(&v14[2 * v18 + 10 + 2 * a4], &v14[2 * v18 + 8 + 2 * a4], 16 * v17);
      }
    }
    else
    {
      unint64_t v25 = v16 - v19;
      uint64_t v26 = (unint64_t)(v16 - v19) >> 1;
      if (v25 <= 1) {
        uint64_t v27 = 1;
      }
      else {
        uint64_t v27 = v26;
      }
      memmove(&v14[2 * v18 + 8 + 2 * v27], &v14[2 * v18 + 8], 16 * v17);
      *(void *)(p_internal->_singleRange._range.location + 24) = v27 - 1;
    }
    uint64_t v28 = &self->super._internal;
    if ((*(unsigned char *)&self->super._indexSetFlags & 1) == 0) {
      uint64_t v28 = ($228E88DFACDD67E146FBAE62E08A49BD *)(p_internal->_singleRange._range.location
    }
                                                + 16 * *(void *)(p_internal->_singleRange._range.location + 24)
                                                + 64);
    $A8859644891BA8F5A580113D622AC538 v29 = &v28[a4];
    v29->_singleRange._range.NSUInteger location = location;
    v29->_singleRange._range.NSUInteger length = length;
    atomic_store(0, (unint64_t *)(p_internal->_singleRange._range.location + 56));
    ++*(void *)(p_internal->_singleRange._range.location + 8);
    *(void *)(p_internal->_singleRange._range.location + 16) += length;
  }
}

- (void)_ensureRangeCapacity:(unint64_t)a3
{
  $A8859644891BA8F5A580113D622AC538 indexSetFlags = self->super._indexSetFlags;
  if (*(unsigned char *)&indexSetFlags) {
    unint64_t v5 = 1;
  }
  else {
    unint64_t v5 = *(void *)self->super._internal._singleRange._range.location;
  }
  if (v5 < a3)
  {
    if (a3 == 1)
    {
      self->super._$A8859644891BA8F5A580113D622AC538 indexSetFlags = ($A8859644891BA8F5A580113D622AC538)(*(_DWORD *)&indexSetFlags | 1);
    }
    else
    {
      unint64_t v6 = 2 * v5;
      if (v6 <= a3) {
        unint64_t v6 = a3;
      }
      if (a3 >= 4) {
        unint64_t v7 = v6;
      }
      else {
        unint64_t v7 = 4;
      }
      if (*(unsigned char *)&indexSetFlags)
      {
        if (((unint64_t)self & 0x8000000000000000) != 0)
        {
          uint64_t v19 = *MEMORY[0x1E4FBA8E0];
          if ((~(unint64_t)self & 0xC000000000000007) == 0) {
            uint64_t v19 = 0;
          }
          unint64_t v20 = v19 ^ (unint64_t)self;
          uint64_t v21 = 0xFFFFFFFFFFFFFFFLL;
          if ((~(_BYTE)v20 & 7) == 0) {
            uint64_t v21 = 0xFFFFFFFFFFFFFLL;
          }
          NSUInteger v22 = v21 & (v20 >> 3);
          NSUInteger location = v22;
        }
        else
        {
          uint64_t v24 = 16;
          if ((*(unsigned char *)&indexSetFlags & 2) == 0) {
            uint64_t v24 = 24;
          }
          NSUInteger v22 = *(NSUInteger *)((char *)&self->super.super.isa + v24);
          if ((*(unsigned char *)&indexSetFlags & 2) != 0) {
            NSUInteger location = self->super._internal._singleRange._range.location;
          }
          else {
            NSUInteger location = self->super._internal._singleRange._range.length;
          }
        }
        BOOL v25 = v22 != 0;
        if (location) {
          NSUInteger length = self->super._internal._singleRange._range.length;
        }
        else {
          NSUInteger length = 0;
        }
        p_$228E88DFACDD67E146FBAE62E08A49BD internal = &self->super._internal;
        $228E88DFACDD67E146FBAE62E08A49BD internal = self->super._internal;
        self->super._$A8859644891BA8F5A580113D622AC538 indexSetFlags = ($A8859644891BA8F5A580113D622AC538)(*(_DWORD *)&indexSetFlags & 0xFFFFFFFE);
        uint64_t v28 = (unint64_t *)malloc_type_malloc(16 * v7 + 64, 0xF39377F9uLL);
        self->super._internal._singleRange._range.NSUInteger location = (NSUInteger)v28;
        atomic_store(0, v28 + 7);
        *(void *)self->super._internal._singleRange._range.NSUInteger location = v7;
        *(void *)(self->super._internal._singleRange._range.location + 8) = v25;
        *(void *)(self->super._internal._singleRange._range.location + 16) = length;
        unint64_t v29 = (v7 - v25) >> 1;
        if (v7 < 5) {
          unint64_t v29 = 0;
        }
        *(void *)(self->super._internal._singleRange._range.location + 24) = v29;
        if ((*(unsigned char *)&self->super._indexSetFlags & 1) == 0) {
          p_$228E88DFACDD67E146FBAE62E08A49BD internal = ($228E88DFACDD67E146FBAE62E08A49BD *)(p_internal->_singleRange._range.location
        }
                                                           + 16
                                                           * *(void *)(p_internal->_singleRange._range.location + 24)
                                                           + 64);
        $228E88DFACDD67E146FBAE62E08A49BD *p_internal = internal;
      }
      else
      {
        uint64_t v8 = *(void *)(self->super._internal._singleRange._range.location + 24);
        unint64_t v9 = (unint64_t *)MEMORY[0x185306D80]();
        self->super._internal._singleRange._range.NSUInteger location = (NSUInteger)v9;
        *unint64_t v9 = v7;
        NSUInteger v10 = self->super._internal._singleRange._range.location;
        unint64_t v11 = *(void *)(v10 + 8);
        BOOL v13 = v7 >= v11;
        unint64_t v12 = v7 - v11;
        BOOL v13 = v13 && v7 >= 5;
        unint64_t v14 = v12 >> 1;
        if (!v13) {
          unint64_t v14 = 0;
        }
        *(void *)(v10 + 24) = v14;
        NSUInteger v15 = self->super._internal._singleRange._range.location;
        uint64_t v16 = *(void *)(v15 + 24);
        if (v8 != v16)
        {
          uint64_t v17 = *(void *)(v15 + 8);
          NSUInteger v18 = v15 + 64;
          memmove((void *)(v18 + 16 * v16), (const void *)(v18 + 16 * v8), 16 * v17);
        }
      }
    }
  }
}

uint64_t __35__NSMutableIndexSet_removeIndexes___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeIndexesInRange:", a2, a3);
}

- (void)_addRangeToArray:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  unint64_t v6 = [(NSIndexSet *)self rangeCount];

  -[NSMutableIndexSet _insertRange:inArrayAtIndex:](self, "_insertRange:inArrayAtIndex:", location, length, v6);
}

- (void)_removeRangeInArrayAtIndex:(unint64_t)a3
{
  if (((unint64_t)self & 0x8000000000000000) == 0)
  {
    $A8859644891BA8F5A580113D622AC538 indexSetFlags = self->super._indexSetFlags;
    if ((*(unsigned char *)&indexSetFlags & 2) != 0)
    {
      NSUInteger location = self->super._internal._singleRange._range.location;
      if (!location) {
        goto LABEL_18;
      }
    }
    else if (*(unsigned char *)&indexSetFlags)
    {
      NSUInteger location = self->super._internal._singleRange._range.length;
      if (!location) {
        goto LABEL_18;
      }
    }
    else
    {
      NSUInteger location = *(void *)(self->super._internal._singleRange._range.location + 8);
      if (!location) {
        goto LABEL_18;
      }
    }
    goto LABEL_15;
  }
  uint64_t v4 = *MEMORY[0x1E4FBA8E0];
  if ((~(unint64_t)self & 0xC000000000000007) == 0) {
    uint64_t v4 = 0;
  }
  unint64_t v5 = v4 ^ (unint64_t)self;
  uint64_t v6 = 0xFFFFFFFFFFFFFFFLL;
  if ((~(_BYTE)v5 & 7) == 0) {
    uint64_t v6 = 0xFFFFFFFFFFFFFLL;
  }
  NSUInteger location = v6 & (v5 >> 3);
  if (location)
  {
LABEL_15:
    if (*(unsigned char *)&self->super._indexSetFlags) {
      NSUInteger location = 1;
    }
    else {
      NSUInteger location = *(void *)(self->super._internal._singleRange._range.location + 8);
    }
  }
LABEL_18:
  if (location < a3)
  {
    unint64_t v14 = +[NSString stringWithFormat:@"Index %ld out of range bounds [0...%ld]", a3, location];
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v14 userInfo:0]);
  }
  if (*(unsigned char *)&self->super._indexSetFlags)
  {
    self->super._internal._singleRange._range.NSUInteger length = 0;
  }
  else
  {
    NSUInteger v9 = self->super._internal._singleRange._range.location;
    uint64_t v10 = *(void *)(v9 + 24);
    unint64_t v11 = (void *)(v9 + 16 * v10 + 64);
    uint64_t v12 = v11[2 * a3 + 1];
    unint64_t v13 = *(void *)(v9 + 8) + ~a3;
    if (v13 <= a3)
    {
      if (v13) {
        memmove(&v11[2 * a3], &v11[2 * a3 + 2], 16 * v13);
      }
    }
    else
    {
      if (a3)
      {
        memmove((void *)(v9 + 16 * v10 + 80), v11, 16 * a3);
        NSUInteger v9 = self->super._internal._singleRange._range.location;
        uint64_t v10 = *(void *)(v9 + 24);
      }
      *(void *)(v9 + 24) = v10 + 1;
    }
    atomic_store(0, (unint64_t *)(self->super._internal._singleRange._range.location + 56));
    --*(void *)(self->super._internal._singleRange._range.location + 8);
    *(void *)(self->super._internal._singleRange._range.location + 16) -= v12;
  }
}

uint64_t __32__NSMutableIndexSet_addIndexes___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "addIndexesInRange:", a2, a3);
}

- (void)_incrementBy:(unint64_t)a3 startingAtIndex:(unint64_t)a4
{
  if (!a3) {
    return;
  }
  if (((unint64_t)self & 0x8000000000000000) != 0)
  {
    uint64_t v7 = *MEMORY[0x1E4FBA8E0];
    if ((~(unint64_t)self & 0xC000000000000007) == 0) {
      uint64_t v7 = 0;
    }
    unint64_t v8 = v7 ^ (unint64_t)self;
    uint64_t v9 = 0xFFFFFFFFFFFFFFFLL;
    if ((~(_BYTE)v8 & 7) == 0) {
      uint64_t v9 = 0xFFFFFFFFFFFFFLL;
    }
    if ((v9 & (v8 >> 3)) == 0) {
      goto LABEL_23;
    }
  }
  else
  {
    $A8859644891BA8F5A580113D622AC538 indexSetFlags = self->super._indexSetFlags;
    if ((*(unsigned char *)&indexSetFlags & 2) != 0)
    {
      if (!self->super._internal._singleRange._range.location) {
        goto LABEL_23;
      }
    }
    else if (*(unsigned char *)&indexSetFlags)
    {
      if (!self->super._internal._singleRange._range.length) {
        goto LABEL_23;
      }
    }
    else if (!*(void *)(self->super._internal._singleRange._range.location + 8))
    {
      goto LABEL_23;
    }
  }
  if (*(unsigned char *)&self->super._indexSetFlags)
  {
    if (a4 <= 0x7FFFFFFFFFFFFFFELL)
    {
      uint64_t v14 = 0;
      p_$228E88DFACDD67E146FBAE62E08A49BD internal = &self->super._internal;
LABEL_22:
      if (a3 + p_internal[v14]._singleRange._range.location + p_internal[v14]._singleRange._range.length - 1 >= 0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v28 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C4A8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: Incrementing by %ld would push last index beyond maximum index value of NSNotFound - 1", _NSMethodExceptionProem((objc_class *)self, a2), a3), 0 reason userInfo];
        objc_exception_throw(v28);
      }
    }
  }
  else if (a4 <= 0x7FFFFFFFFFFFFFFELL)
  {
    NSUInteger location = self->super._internal._singleRange._range.location;
    uint64_t v12 = *(void *)(location + 8);
    if (v12)
    {
      p_$228E88DFACDD67E146FBAE62E08A49BD internal = ($228E88DFACDD67E146FBAE62E08A49BD *)(location + 16 * *(void *)(location + 24) + 64);
      uint64_t v14 = v12 - 1;
      goto LABEL_22;
    }
  }
LABEL_23:
  unint64_t v15 = [(NSIndexSet *)self _indexOfRangeAfterOrContainingIndex:a4];
  if (v15 == 0x7FFFFFFFFFFFFFFFLL) {
    return;
  }
  NSUInteger v16 = v15;
  uint64_t v17 = &self->super._internal;
  NSUInteger v18 = &self->super._internal;
  if ((*(unsigned char *)&self->super._indexSetFlags & 1) == 0) {
    NSUInteger v18 = ($228E88DFACDD67E146FBAE62E08A49BD *)(v17->_singleRange._range.location
  }
                                              + 16 * *(void *)(v17->_singleRange._range.location + 24)
                                              + 64);
  uint64_t v19 = &v18[v15];
  unint64_t v31 = v19->_singleRange._range.location;
  if (v19->_singleRange._range.location >= a4)
  {
    unint64_t v29 = 0;
    unint64_t v30 = 0;
  }
  else
  {
    unint64_t v30 = v19->_singleRange._range.location - a4 + v19->_singleRange._range.length;
    unint64_t v29 = a4 + a3;
    -[NSMutableIndexSet _replaceRangeInArrayAtIndex:withRange:](self, "_replaceRangeInArrayAtIndex:withRange:", v15, v19->_singleRange._range.location, a4 - v19->_singleRange._range.location);
    ++v16;
  }
  uint64_t v20 = v16;
  uint64_t v21 = (uint64_t *)MEMORY[0x1E4FBA8E0];
  if (((unint64_t)self & 0x8000000000000000) != 0) {
    goto LABEL_30;
  }
LABEL_37:
  $A8859644891BA8F5A580113D622AC538 v26 = self->super._indexSetFlags;
  if ((*(unsigned char *)&v26 & 2) != 0)
  {
    NSUInteger length = v17->_singleRange._range.location;
    if (v17->_singleRange._range.location) {
      goto LABEL_44;
    }
    goto LABEL_47;
  }
  if (*(unsigned char *)&v26)
  {
    NSUInteger length = self->super._internal._singleRange._range.length;
    if (length) {
      goto LABEL_44;
    }
    goto LABEL_47;
  }
  NSUInteger length = *(void *)(v17->_singleRange._range.location + 8);
  if (length)
  {
LABEL_44:
    if (*(unsigned char *)&self->super._indexSetFlags) {
      NSUInteger length = 1;
    }
    else {
      NSUInteger length = *(void *)(v17->_singleRange._range.location + 8);
    }
  }
LABEL_47:
  while (v16 < length)
  {
    uint64_t v27 = &self->super._internal;
    if ((*(unsigned char *)&self->super._indexSetFlags & 1) == 0) {
      uint64_t v27 = ($228E88DFACDD67E146FBAE62E08A49BD *)(v17->_singleRange._range.location
    }
                                                + 16 * *(void *)(v17->_singleRange._range.location + 24)
                                                + 64);
    -[NSMutableIndexSet _replaceRangeInArrayAtIndex:withRange:](self, "_replaceRangeInArrayAtIndex:withRange:", v16++, v27[v20]._singleRange._range.location + a3, v27[v20]._singleRange._range.length);
    ++v20;
    if (((unint64_t)self & 0x8000000000000000) == 0) {
      goto LABEL_37;
    }
LABEL_30:
    uint64_t v22 = *v21;
    if (((unint64_t)self & 0xC000000000000007) == 0xC000000000000007) {
      uint64_t v22 = 0;
    }
    unint64_t v23 = v22 ^ (unint64_t)self;
    if ((~(_BYTE)v23 & 7) != 0) {
      uint64_t v24 = 0xFFFFFFFFFFFFFFFLL;
    }
    else {
      uint64_t v24 = 0xFFFFFFFFFFFFFLL;
    }
    NSUInteger length = v24 & (v23 >> 3);
    if (length) {
      goto LABEL_44;
    }
  }
  if (v31 < a4)
  {
    -[NSMutableIndexSet addIndexesInRange:](self, "addIndexesInRange:", v29, v30);
  }
}

- (void)_removeAndDecrementBy:(unint64_t)a3 startingAtIndex:(unint64_t)a4
{
  if (!a3) {
    return;
  }
  unint64_t v7 = [(NSIndexSet *)self _indexOfRangeAfterOrContainingIndex:a4];
  NSUInteger v8 = v7;
  unint64_t v9 = v7;
  if (v7)
  {
    if (v7 == 0x7FFFFFFFFFFFFFFFLL) {
      return;
    }
    p_$228E88DFACDD67E146FBAE62E08A49BD internal = &self->super._internal;
    if ((*(unsigned char *)&self->super._indexSetFlags & 1) == 0) {
      p_$228E88DFACDD67E146FBAE62E08A49BD internal = ($228E88DFACDD67E146FBAE62E08A49BD *)(p_internal->_singleRange._range.location
    }
                                                       + 16
                                                       * *(void *)(p_internal->_singleRange._range.location + 24)
                                                       + 64);
    p_NSUInteger location = &p_internal[v7]._singleRange._range.location;
    unint64_t v13 = *p_location;
    unint64_t v12 = p_location[1];
    BOOL v15 = a4 >= v13;
    unint64_t v14 = a4 - v13;
    BOOL v15 = !v15 || v14 >= v12;
    uint64_t v16 = v15;
    unint64_t v9 = v7 - v16;
  }
  unint64_t v34 = v9;
  unint64_t v17 = a3 + a4 - 1;
  NSUInteger v18 = &self->super._internal;
  uint64_t v19 = (uint64_t *)MEMORY[0x1E4FBA8E0];
  while (1)
  {
    if (((unint64_t)self & 0x8000000000000000) == 0)
    {
      $A8859644891BA8F5A580113D622AC538 indexSetFlags = self->super._indexSetFlags;
      if ((*(unsigned char *)&indexSetFlags & 2) != 0)
      {
        NSUInteger location = v18->_singleRange._range.location;
        if (!v18->_singleRange._range.location) {
          goto LABEL_33;
        }
      }
      else if (*(unsigned char *)&indexSetFlags)
      {
        NSUInteger location = self->super._internal._singleRange._range.length;
        if (!location) {
          goto LABEL_33;
        }
      }
      else
      {
        NSUInteger location = *(void *)(v18->_singleRange._range.location + 8);
        if (!location) {
          goto LABEL_33;
        }
      }
LABEL_30:
      if (*(unsigned char *)&self->super._indexSetFlags) {
        NSUInteger location = 1;
      }
      else {
        NSUInteger location = *(void *)(v18->_singleRange._range.location + 8);
      }
      goto LABEL_33;
    }
    uint64_t v20 = *v19;
    if (((unint64_t)self & 0xC000000000000007) == 0xC000000000000007) {
      uint64_t v20 = 0;
    }
    unint64_t v21 = v20 ^ (unint64_t)self;
    if ((~(_BYTE)v21 & 7) != 0) {
      uint64_t v22 = 0xFFFFFFFFFFFFFFFLL;
    }
    else {
      uint64_t v22 = 0xFFFFFFFFFFFFFLL;
    }
    NSUInteger location = v22 & (v21 >> 3);
    if (location) {
      goto LABEL_30;
    }
LABEL_33:
    if (v8 >= location) {
      break;
    }
    BOOL v25 = &self->super._internal;
    if ((*(unsigned char *)&self->super._indexSetFlags & 1) == 0) {
      BOOL v25 = ($228E88DFACDD67E146FBAE62E08A49BD *)(v18->_singleRange._range.location
    }
                                                + 16 * *(void *)(v18->_singleRange._range.location + 24)
                                                + 64);
    $A8859644891BA8F5A580113D622AC538 v26 = &v25[v8];
    unint64_t v27 = v26->_singleRange._range.location;
    NSUInteger length = v26->_singleRange._range.length;
    BOOL v15 = v17 >= v26->_singleRange._range.location;
    unint64_t v29 = v17 - v26->_singleRange._range.location;
    if (!v15)
    {
      v27 -= a3;
      goto LABEL_51;
    }
    unint64_t v30 = v27 + length - 1;
    if (v27 >= a4 && v30 <= v17)
    {
LABEL_44:
      -[NSMutableIndexSet _removeRangeInArrayAtIndex:](self, "_removeRangeInArrayAtIndex:", v8, v34);
    }
    else
    {
      if (v27 <= a4 && v17 <= v30)
      {
        unint64_t v32 = a3;
LABEL_49:
        length -= v32;
LABEL_51:
        -[NSMutableIndexSet _replaceRangeInArrayAtIndex:withRange:](self, "_replaceRangeInArrayAtIndex:withRange:", v8, v27, length, v34);
        goto LABEL_52;
      }
      if (v17 <= v30)
      {
        unint64_t v31 = v29 + 1;
        length -= v31;
        if (length)
        {
          unint64_t v27 = v27 - a3 + v31;
          goto LABEL_51;
        }
        goto LABEL_44;
      }
      if (v27 <= a4)
      {
        unint64_t v33 = v30 - a4;
        if (v30 >= a4)
        {
          BOOL v15 = __CFADD__(v33, 1);
          unint64_t v32 = v33 + 1;
          if (!v15) {
            goto LABEL_49;
          }
        }
      }
LABEL_52:
      ++v8;
    }
  }

  [(NSMutableIndexSet *)self _mergeOverlappingRangesStartingAtIndex:v34];
}

- (void)removeIndexes:(NSIndexSet *)indexSet
{
  v23[5] = *MEMORY[0x1E4F143B8];
  if (!indexSet) {
    return;
  }
  if (((unint64_t)self & 0x8000000000000000) != 0)
  {
    uint64_t v5 = *MEMORY[0x1E4FBA8E0];
    if ((~(unint64_t)self & 0xC000000000000007) == 0) {
      uint64_t v5 = 0;
    }
    unint64_t v6 = v5 ^ (unint64_t)self;
    uint64_t v7 = 0xFFFFFFFFFFFFFFFLL;
    if ((~(_BYTE)v6 & 7) == 0) {
      uint64_t v7 = 0xFFFFFFFFFFFFFLL;
    }
    if ((v7 & (v6 >> 3)) == 0) {
      return;
    }
  }
  else
  {
    $A8859644891BA8F5A580113D622AC538 indexSetFlags = self->super._indexSetFlags;
    if ((*(unsigned char *)&indexSetFlags & 2) != 0)
    {
      if (!self->super._internal._singleRange._range.location) {
        return;
      }
    }
    else if (*(unsigned char *)&indexSetFlags)
    {
      if (!self->super._internal._singleRange._range.length) {
        return;
      }
    }
    else if (!*(void *)(self->super._internal._singleRange._range.location + 8))
    {
      return;
    }
  }
  if ((*(unsigned char *)&self->super._indexSetFlags & 1) != 0
    || *(void *)(self->super._internal._singleRange._range.location + 8))
  {
    if (indexSet == (NSIndexSet *)self)
    {
      [(NSIndexSet *)indexSet removeAllIndexes];
    }
    else
    {
      unint64_t v9 = (__objc2_class *)objc_opt_class();
      if (NSIndexSet == v9
        || _NSConstantIndexSet == v9
        || NSMutableIndexSet == v9)
      {
        if (((unint64_t)indexSet & 0x8000000000000000) != 0)
        {
          uint64_t v12 = *MEMORY[0x1E4FBA8E0];
          if ((~(unint64_t)indexSet & 0xC000000000000007) == 0) {
            uint64_t v12 = 0;
          }
          unint64_t v13 = v12 ^ (unint64_t)indexSet;
          uint64_t v14 = 0xFFFFFFFFFFFFFFFLL;
          if ((~(_BYTE)v13 & 7) == 0) {
            uint64_t v14 = 0xFFFFFFFFFFFFFLL;
          }
          NSUInteger location = v14 & (v13 >> 3);
        }
        else
        {
          if ((*(unsigned char *)&indexSet->_indexSetFlags & 2) == 0)
          {
            v23[0] = MEMORY[0x1E4F143A8];
            v23[1] = 3221225472;
            v23[2] = __35__NSMutableIndexSet_removeIndexes___block_invoke;
            v23[3] = &unk_1E51F8588;
            v23[4] = self;
            [(NSIndexSet *)indexSet enumerateRangesUsingBlock:v23];
            return;
          }
          NSUInteger location = indexSet->_internal._singleRange._range.location;
        }
        NSUInteger v16 = ~location;
        if ((*(unsigned char *)&self->super._indexSetFlags & 2) != 0)
        {
          self->super._internal._singleRange._range.location &= v16;
        }
        else
        {
          uint64_t v17 = 0;
          unint64_t v18 = 0;
LABEL_40:
          if (v18) {
            uint64_t v19 = v17;
          }
          else {
            uint64_t v19 = 0;
          }
          uint64_t v20 = v19 - 1;
          while (((-1 << v18) & location) != 0)
          {
            unint64_t v21 = __clz(__rbit64((-1 << v18) & location));
            unint64_t v22 = (-1 << v21) & v16;
            unint64_t v18 = __clz(__rbit64(v22));
            if (v17 == ++v20)
            {
              ++v17;
              -[NSMutableIndexSet removeIndexesInRange:](self, "removeIndexesInRange:", v21, v18 - v21);
              if (v18 <= 0x3F) {
                goto LABEL_40;
              }
              return;
            }
            if (!v22 || v18 > 0x3F) {
              return;
            }
          }
        }
      }
      else
      {
        NSUInteger v10 = [(NSIndexSet *)indexSet firstIndex];
        if (v10 != 0x7FFFFFFFFFFFFFFFLL)
        {
          for (NSUInteger i = v10;
                i != 0x7FFFFFFFFFFFFFFFLL;
                NSUInteger i = [(NSIndexSet *)indexSet indexGreaterThanIndex:i])
          {
            [(NSMutableIndexSet *)self removeIndex:i];
          }
        }
      }
    }
  }
}

- (void)addIndexes:(NSIndexSet *)indexSet
{
  v22[5] = *MEMORY[0x1E4F143B8];
  if (!indexSet || indexSet == (NSIndexSet *)self) {
    return;
  }
  if (((unint64_t)self & 0x8000000000000000) == 0)
  {
    $A8859644891BA8F5A580113D622AC538 indexSetFlags = self->super._indexSetFlags;
    if ((*(unsigned char *)&indexSetFlags & 2) != 0)
    {
      if (self->super._internal._singleRange._range.location) {
        goto LABEL_15;
      }
    }
    else if (*(unsigned char *)&indexSetFlags)
    {
      if (self->super._internal._singleRange._range.length) {
        goto LABEL_15;
      }
    }
    else if (*(void *)(self->super._internal._singleRange._range.location + 8))
    {
      goto LABEL_15;
    }
LABEL_31:
    [(NSMutableIndexSet *)self removeAllIndexes];
    [(NSIndexSet *)self _setContentToContentFromIndexSet:indexSet];
    return;
  }
  uint64_t v5 = *MEMORY[0x1E4FBA8E0];
  if ((~(unint64_t)self & 0xC000000000000007) == 0) {
    uint64_t v5 = 0;
  }
  unint64_t v6 = v5 ^ (unint64_t)self;
  uint64_t v7 = 0xFFFFFFFFFFFFFFFLL;
  if ((~(_BYTE)v6 & 7) == 0) {
    uint64_t v7 = 0xFFFFFFFFFFFFFLL;
  }
  if ((v7 & (v6 >> 3)) == 0) {
    goto LABEL_31;
  }
LABEL_15:
  unint64_t v9 = (__objc2_class *)objc_opt_class();
  if (NSIndexSet == v9
    || _NSConstantIndexSet == v9
    || NSMutableIndexSet == v9)
  {
    if (((unint64_t)indexSet & 0x8000000000000000) != 0)
    {
      uint64_t v12 = *MEMORY[0x1E4FBA8E0];
      if ((~(unint64_t)indexSet & 0xC000000000000007) == 0) {
        uint64_t v12 = 0;
      }
      unint64_t v13 = v12 ^ (unint64_t)indexSet;
      uint64_t v14 = 0xFFFFFFFFFFFFFFFLL;
      if ((~(_BYTE)v13 & 7) == 0) {
        uint64_t v14 = 0xFFFFFFFFFFFFFLL;
      }
      NSUInteger location = v14 & (v13 >> 3);
    }
    else
    {
      if ((*(unsigned char *)&indexSet->_indexSetFlags & 2) == 0)
      {
        v22[0] = MEMORY[0x1E4F143A8];
        v22[1] = 3221225472;
        v22[2] = __32__NSMutableIndexSet_addIndexes___block_invoke;
        v22[3] = &unk_1E51F8588;
        v22[4] = self;
        [(NSIndexSet *)indexSet enumerateRangesUsingBlock:v22];
        return;
      }
      NSUInteger location = indexSet->_internal._singleRange._range.location;
    }
    if ((*(unsigned char *)&self->super._indexSetFlags & 2) != 0)
    {
      self->super._internal._singleRange._range.location |= location;
    }
    else
    {
      uint64_t v16 = 0;
      unint64_t v17 = 0;
LABEL_37:
      if (v17) {
        uint64_t v18 = v16;
      }
      else {
        uint64_t v18 = 0;
      }
      uint64_t v19 = v18 - 1;
      while (((-1 << v17) & location) != 0)
      {
        unint64_t v20 = __clz(__rbit64((-1 << v17) & location));
        unint64_t v21 = (-1 << v20) & ~location;
        unint64_t v17 = __clz(__rbit64(v21));
        if (v16 == ++v19)
        {
          ++v16;
          -[NSMutableIndexSet addIndexesInRange:](self, "addIndexesInRange:", v20, v17 - v20);
          if (v17 <= 0x3F) {
            goto LABEL_37;
          }
          return;
        }
        if (!v21 || v17 > 0x3F) {
          return;
        }
      }
    }
  }
  else
  {
    NSUInteger v10 = [(NSIndexSet *)indexSet firstIndex];
    if (v10 != 0x7FFFFFFFFFFFFFFFLL)
    {
      for (NSUInteger i = v10;
            i != 0x7FFFFFFFFFFFFFFFLL;
            NSUInteger i = [(NSIndexSet *)indexSet indexGreaterThanIndex:i])
      {
        [(NSMutableIndexSet *)self addIndex:i];
      }
    }
  }
}

- (void)removeAllIndexes
{
  int indexSetFlags = (int)self->super._indexSetFlags;
  if ((indexSetFlags & 1) == 0)
  {
    free(self->super._internal._multipleRanges._data);
    int indexSetFlags = *(_DWORD *)&self->super._indexSetFlags | 1;
  }
  self->super._int indexSetFlags = ($A8859644891BA8F5A580113D622AC538)(indexSetFlags | 2);
  self->super._internal._singleRange._range.NSUInteger location = 0;
}

- (void)shiftIndexesStartingAtIndex:(NSUInteger)index by:(NSInteger)delta
{
  if (delta && [(NSIndexSet *)self count])
  {
    if (((unint64_t)self & 0x8000000000000000) != 0 || (*(unsigned char *)&self->super._indexSetFlags & 2) != 0) {
      [(NSMutableIndexSet *)self _convertToUsingRanges];
    }
    if (delta < 1)
    {
      -[NSMutableIndexSet _removeAndDecrementBy:startingAtIndex:](self, "_removeAndDecrementBy:startingAtIndex:");
    }
    else
    {
      [(NSMutableIndexSet *)self _incrementBy:delta startingAtIndex:index];
    }
  }
}

- (void)_convertToUsingRanges
{
  p_$228E88DFACDD67E146FBAE62E08A49BD internal = &self->super._internal;
  NSUInteger location = self->super._internal._singleRange._range.location;
  if (location)
  {
    NSUInteger v5 = ~location;
    uint64_t v6 = 1;
    unint64_t v7 = self->super._internal._singleRange._range.location;
    while (1)
    {
      unint64_t v8 = (-1 << __clz(__rbit64(v7))) & v5;
      if (!v8) {
        break;
      }
      ++v6;
      unint64_t v7 = (-1 << __clz(__rbit64(v8))) & location;
      if (!v7)
      {
        --v6;
        break;
      }
    }
    self->super._int indexSetFlags = ($A8859644891BA8F5A580113D622AC538)(*(_DWORD *)&self->super._indexSetFlags & 0xFFFFFFFC | 1);
    self->super._internal._singleRange._range.NSUInteger length = 0;
    if (v6)
    {
      if (v6 == 1)
      {
        NSUInteger v9 = __clz(__rbit64(location));
        self->super._internal._singleRange._range.NSUInteger location = v9;
        self->super._internal._singleRange._range.NSUInteger length = __clz(__rbit64((-1 << v9) & v5)) - v9;
      }
      else
      {
        [(NSMutableIndexSet *)self _ensureRangeCapacity:v6 + 1];
        uint64_t v10 = 0;
        unint64_t v11 = 0;
        *(void *)(self->super._internal._singleRange._range.location + 24) = 0;
LABEL_11:
        if (v11) {
          uint64_t v12 = v10;
        }
        else {
          uint64_t v12 = 0;
        }
        uint64_t v13 = v12 - 1;
        do
        {
          unint64_t v14 = (-1 << v11) & location;
          if (!v14) {
            break;
          }
          unint64_t v15 = __clz(__rbit64(v14));
          unint64_t v16 = (-1 << v15) & v5;
          unint64_t v11 = __clz(__rbit64(v16));
          if (v10 == ++v13)
          {
            uint64_t v17 = (uint64_t)p_internal;
            if ((*(unsigned char *)&self->super._indexSetFlags & 1) == 0) {
              uint64_t v17 = p_internal->_singleRange._range.location
            }
                  + 16 * *(void *)(p_internal->_singleRange._range.location + 24)
                  + 64;
            uint64_t v18 = (unint64_t *)(v17 + 16 * v10++);
            *uint64_t v18 = v15;
            v18[1] = v11 - v15;
            *(void *)(p_internal->_singleRange._range.location + 16) += v11 - v15;
            if (v11 < 0x40) {
              goto LABEL_11;
            }
            break;
          }
        }
        while (v16 && v11 <= 0x3F);
        *(void *)(p_internal->_singleRange._range.location + 8) = v6;
      }
    }
  }
  else
  {
    self->super._int indexSetFlags = ($A8859644891BA8F5A580113D622AC538)(*(_DWORD *)&self->super._indexSetFlags & 0xFFFFFFFC | 1);
    self->super._internal._singleRange._range.NSUInteger length = 0;
  }
}

- (Class)classForCoder
{
  return (Class)NSMutableIndexSet;
}

- (void)addIndexes:(const unint64_t *)a3 count:(unint64_t)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (a4)
  {
    if ((*(unsigned char *)&self->super._indexSetFlags & 2) != 0)
    {
      uint64_t v12 = 0;
      unint64_t v13 = a4;
      do
      {
        unint64_t v14 = a3[v13 - 1];
        if (v14 > 0x3F)
        {
          if (v14 != 0x7FFFFFFFFFFFFFFFLL) {
            goto LABEL_3;
          }
        }
        else
        {
          v12 |= 1 << v14;
        }
        --v13;
      }
      while (v13);
      self->super._internal._singleRange._range.location |= v12;
    }
    else
    {
LABEL_3:
      id v5 = _NSGroupIndexesIntoSimpleRanges((uint64_t *)a3, a4);
      long long v16 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v15 count:16];
      if (v6)
      {
        uint64_t v7 = v6;
        uint64_t v8 = *(void *)v17;
        do
        {
          for (uint64_t i = 0; i != v7; ++i)
          {
            if (*(void *)v17 != v8) {
              objc_enumerationMutation(v5);
            }
            uint64_t v10 = [*(id *)(*((void *)&v16 + 1) + 8 * i) rangeValue];
            -[NSMutableIndexSet addIndexesInRange:](self, "addIndexesInRange:", v10, v11);
          }
          uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v15 count:16];
        }
        while (v7);
      }
    }
  }
}

- (void)addIndexesWithBitfield:(unint64_t)a3
{
  if ((*(unsigned char *)&self->super._indexSetFlags & 2) != 0)
  {
    self->super._internal._singleRange._range.location |= a3;
  }
  else
  {
    uint64_t v5 = 0;
    unint64_t v6 = 0;
LABEL_3:
    if (v6) {
      uint64_t v7 = v5;
    }
    else {
      uint64_t v7 = 0;
    }
    uint64_t v8 = v7 - 1;
    while (((-1 << v6) & a3) != 0)
    {
      unint64_t v9 = __clz(__rbit64((-1 << v6) & a3));
      unint64_t v10 = (-1 << v9) & ~a3;
      unint64_t v6 = __clz(__rbit64(v10));
      if (v5 == ++v8)
      {
        ++v5;
        -[NSMutableIndexSet addIndexesInRange:](self, "addIndexesInRange:", v9, v6 - v9);
        if (v6 < 0x40) {
          goto LABEL_3;
        }
        return;
      }
      if (!v10 || v6 > 0x3F) {
        return;
      }
    }
  }
}

- (void)removeIndexesWithOptions:(unint64_t)a3 passingTest:(id)a4
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if ((a3 & 2) != 0) {
    unint64_t v6 = a3 & 0xFFFFFFFFFFFFFFFELL;
  }
  else {
    unint64_t v6 = a3;
  }
  __NSIndexSetParameterCheckIterate((objc_class *)self, a2, (uint64_t)a4, v6, 0, 0x7FFFFFFFFFFFFFFELL);
  uint64_t v7 = objc_alloc_init(NSMutableIndexSet);
  int v9 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __58__NSMutableIndexSet_removeIndexesWithOptions_passingTest___block_invoke;
  v8[3] = &unk_1E51F85B0;
  v8[5] = a4;
  v8[6] = &v9;
  v8[4] = v7;
  __NSIndexSetEnumerate((uint64_t)self, v6, 0, 0x7FFFFFFFFFFFFFFELL, (uint64_t)v8);
  [(NSMutableIndexSet *)self removeIndexes:v7];
}

void __58__NSMutableIndexSet_removeIndexesWithOptions_passingTest___block_invoke(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned int (**)(void))(*(void *)(a1 + 40) + 16))())
  {
    os_unfair_lock_lock(*(os_unfair_lock_t *)(a1 + 48));
    [*(id *)(a1 + 32) addIndex:a2];
    uint64_t v4 = *(os_unfair_lock_s **)(a1 + 48);
    os_unfair_lock_unlock(v4);
  }
}

- (void)removeIndexesInRange:(_NSRange)a3 options:(unint64_t)a4 passingTest:(id)a5
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  unint64_t v9 = a4 & 0xF7FFFFFFFFFFFFFELL;
  if ((a4 & 2) == 0) {
    unint64_t v9 = a4;
  }
  uint64_t v10 = v9 | 0x800000000000000;
  __NSIndexSetParameterCheckIterate((objc_class *)self, a2, (uint64_t)a5, v9 | 0x800000000000000, a3.location, a3.length);
  uint64_t v11 = objc_alloc_init(NSMutableIndexSet);
  int v13 = 0;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __62__NSMutableIndexSet_removeIndexesInRange_options_passingTest___block_invoke;
  v12[3] = &unk_1E51F85B0;
  v12[5] = a5;
  v12[6] = &v13;
  v12[4] = v11;
  __NSIndexSetEnumerate((uint64_t)self, v10, location, length, (uint64_t)v12);
  [(NSMutableIndexSet *)self removeIndexes:v11];
}

void __62__NSMutableIndexSet_removeIndexesInRange_options_passingTest___block_invoke(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned int (**)(void))(*(void *)(a1 + 40) + 16))())
  {
    os_unfair_lock_lock(*(os_unfair_lock_t *)(a1 + 48));
    [*(id *)(a1 + 32) addIndex:a2];
    uint64_t v4 = *(os_unfair_lock_s **)(a1 + 48);
    os_unfair_lock_unlock(v4);
  }
}

- (void)removeIndexesPassingTest:(id)a3
{
}

@end
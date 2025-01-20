@interface IMTranscriptBubbleSizeCache
- (CGSize)sizeForMaximumWidth:(double)a3;
- (IMTranscriptBubbleSizeCache)init;
- (NSMutableArray)sizeCache;
- (id)_cacheEntryForMaximumWidth:(double)a3 getEffectiveIndex:(unint64_t *)a4;
- (void)_insertCacheEntry:(id)a3;
- (void)flush;
- (void)setSize:(CGSize)a3 forMaximumWidth:(double)a4;
- (void)setSizeCache:(id)a3;
@end

@implementation IMTranscriptBubbleSizeCache

- (IMTranscriptBubbleSizeCache)init
{
  v8.receiver = self;
  v8.super_class = (Class)IMTranscriptBubbleSizeCache;
  v4 = [(IMTranscriptBubbleSizeCache *)&v8 init];
  if (v4)
  {
    uint64_t v5 = objc_msgSend_array(MEMORY[0x263EFF980], v2, v3);
    sizeCache = v4->_sizeCache;
    v4->_sizeCache = (NSMutableArray *)v5;
  }
  return v4;
}

- (CGSize)sizeForMaximumWidth:(double)a3
{
  uint64_t v13 = 0;
  uint64_t v3 = objc_msgSend__cacheEntryForMaximumWidth_getEffectiveIndex_(self, a2, (uint64_t)&v13, a3);
  v6 = v3;
  if (v3)
  {
    objc_msgSend_size(v3, v4, v5);
    double v8 = v7;
    double v10 = v9;
  }
  else
  {
    double v8 = *MEMORY[0x263F001B0];
    double v10 = *(double *)(MEMORY[0x263F001B0] + 8);
  }

  double v11 = v8;
  double v12 = v10;
  result.height = v12;
  result.width = v11;
  return result;
}

- (void)setSize:(CGSize)a3 forMaximumWidth:(double)a4
{
  double height = a3.height;
  double width = a3.width;
  double v8 = [_IMTranscriptBubbleSizeCacheEntry alloc];
  id v12 = (id)objc_msgSend_initWithSize_maximumWidth_(v8, v9, v10, width, height, a4);
  objc_msgSend__insertCacheEntry_(self, v11, (uint64_t)v12);
}

- (void)flush
{
}

- (void)_insertCacheEntry:(id)a3
{
  id v4 = a3;
  if (objc_msgSend_count(self->_sizeCache, v5, v6))
  {
    uint64_t v13 = 0;
    objc_msgSend_minimumWidth(v4, v7, v8);
    double v11 = objc_msgSend__cacheEntryForMaximumWidth_getEffectiveIndex_(self, v9, (uint64_t)&v13);
    sizeCache = self->_sizeCache;
    if (v11) {
      objc_msgSend_replaceObjectAtIndex_withObject_(sizeCache, v10, v13, v4);
    }
    else {
      objc_msgSend_insertObject_atIndex_(sizeCache, v10, (uint64_t)v4, v13);
    }
  }
  else
  {
    objc_msgSend_addObject_(self->_sizeCache, v7, (uint64_t)v4);
  }
}

- (id)_cacheEntryForMaximumWidth:(double)a3 getEffectiveIndex:(unint64_t *)a4
{
  uint64_t v7 = objc_msgSend_count(self->_sizeCache, a2, (uint64_t)a4);
  if (v7)
  {
    unint64_t v9 = v7;
    unint64_t v10 = 0;
    while (1)
    {
      double v11 = objc_msgSend_objectAtIndex_(self->_sizeCache, v8, (v9 + v10) >> 1);
      objc_msgSend_minimumWidth(v11, v12, v13);
      if (v16 <= a3)
      {
        objc_msgSend_maximumWidth(v11, v14, v15);
        if (v17 >= a3)
        {
          unint64_t v10 = (v9 + v10) >> 1;
          goto LABEL_12;
        }
        unint64_t v10 = ((v9 + v10) >> 1) + 1;
      }
      else
      {
        unint64_t v9 = (v9 + v10) >> 1;
      }

      if (v10 >= v9) {
        goto LABEL_10;
      }
    }
  }
  unint64_t v10 = 0;
LABEL_10:
  double v11 = 0;
LABEL_12:
  *a4 = v10;
  return v11;
}

- (NSMutableArray)sizeCache
{
  return (NSMutableArray *)objc_getProperty(self, a2, 8, 1);
}

- (void)setSizeCache:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
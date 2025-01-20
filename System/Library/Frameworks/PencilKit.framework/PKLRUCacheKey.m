@interface PKLRUCacheKey
- (BOOL)isEqual:(id)a3;
- (unint64_t)hash;
@end

@implementation PKLRUCacheKey

- (BOOL)isEqual:(id)a3
{
  v4 = (PKLRUCacheKey *)a3;
  if (v4 == self)
  {
    BOOL v12 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      if (self) {
        key = self->_key;
      }
      else {
        key = 0;
      }
      v7 = key;
      v8 = v7;
      if (v5) {
        v9 = v5->_key;
      }
      else {
        v9 = 0;
      }
      if (![(NSCopying *)v7 isEqual:v9])
      {
        BOOL v12 = 0;
        goto LABEL_15;
      }
      if (self)
      {
        int64_t scaleFactor = self->_scaleFactor;
        if (v5)
        {
LABEL_10:
          int64_t v11 = v5->_scaleFactor;
LABEL_11:
          BOOL v12 = scaleFactor == v11;
LABEL_15:

          goto LABEL_16;
        }
      }
      else
      {
        int64_t scaleFactor = 0;
        if (v5) {
          goto LABEL_10;
        }
      }
      int64_t v11 = 0;
      goto LABEL_11;
    }
    BOOL v12 = 0;
  }
LABEL_16:

  return v12;
}

- (unint64_t)hash
{
  if (self) {
    key = self->_key;
  }
  else {
    key = 0;
  }
  v4 = key;
  uint64_t v5 = [(NSCopying *)v4 hash];
  if (self) {
    unint64_t scaleFactor = self->_scaleFactor;
  }
  else {
    unint64_t scaleFactor = 0;
  }
  unint64_t v7 = 0x94D049BB133111EBLL
     * ((0xBF58476D1CE4E5B9 * (scaleFactor ^ (scaleFactor >> 30))) ^ ((0xBF58476D1CE4E5B9
                                                                       * (scaleFactor ^ (scaleFactor >> 30))) >> 27));
  unint64_t v8 = v5 ^ (v7 >> 31) ^ v7;

  return v8;
}

- (void).cxx_destruct
{
}

@end
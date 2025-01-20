@interface _GEOTileDBUpdateAccessTimeOperation
- (BOOL)canIncreaseDataSizeInDB;
- (BOOL)isSupercededByOperation:(id)a3;
- (uint64_t)dataForKey:(uint64_t)a3 ETag:(void *)a4 originalLoadReason:(unsigned char *)a5 isKnownNotToExist:(unsigned char *)a6;
- (uint64_t)key;
- (unint64_t)sizeInBytes;
- (void)initWithTileKey:(uint64_t)a3 timestamp:(_OWORD *)a4;
- (void)performWithDB:(id)a3;
@end

@implementation _GEOTileDBUpdateAccessTimeOperation

- (BOOL)isSupercededByOperation:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    unsigned int v6 = [v5 reason];
    BOOL v7 = 0;
    if (v6 <= 4 && ((1 << v6) & 0x13) != 0)
    {
      v8 = (void *)[v5 key];
      BOOL v7 = *(void *)&self->_key == *v8 && *(void *)&self->_anon_c[4] == v8[1];
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v10 = (void *)[v4 key];
      BOOL v7 = *(void *)&self->_key == *v10 && *(void *)&self->_anon_c[4] == v10[1];
    }
    else
    {
      BOOL v7 = 0;
    }
  }

  return v7;
}

- (uint64_t)key
{
  return a1 + 8;
}

- (void)performWithDB:(id)a3
{
}

- (BOOL)canIncreaseDataSizeInDB
{
  return 0;
}

- (uint64_t)dataForKey:(uint64_t)a3 ETag:(void *)a4 originalLoadReason:(unsigned char *)a5 isKnownNotToExist:(unsigned char *)a6
{
  if (a4) {
    *a4 = 0;
  }
  if (a6) {
    *a6 = 0;
  }
  if (a5) {
    *a5 = 0;
  }
  return 0;
}

- (void)initWithTileKey:(uint64_t)a3 timestamp:(_OWORD *)a4
{
  v10.receiver = a1;
  v10.super_class = (Class)_GEOTileDBUpdateAccessTimeOperation;
  unsigned int v6 = [(_GEOTileDBUpdateAccessTimeOperation *)&v10 init];
  BOOL v7 = v6;
  if (v6)
  {
    *(_OWORD *)(v6 + 8) = *a4;
    *((double *)v6 + 3) = a2;
    v8 = v6;
  }

  return v7;
}

- (unint64_t)sizeInBytes
{
  return 8;
}

@end
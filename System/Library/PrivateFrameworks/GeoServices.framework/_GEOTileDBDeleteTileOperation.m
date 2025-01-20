@interface _GEOTileDBDeleteTileOperation
- (BOOL)canIncreaseDataSizeInDB;
- (BOOL)isSupercededByOperation:(id)a3;
- (uint64_t)dataForKey:(void *)a3 ETag:(void *)a4 originalLoadReason:(unsigned char *)a5 isKnownNotToExist:(BOOL *)a6;
- (uint64_t)key;
- (unint64_t)sizeInBytes;
- (void)initWithTileKey:(_OWORD *)a3;
- (void)performWithDB:(id)a3;
@end

@implementation _GEOTileDBDeleteTileOperation

- (void)initWithTileKey:(_OWORD *)a3
{
  v8.receiver = a1;
  v8.super_class = (Class)_GEOTileDBDeleteTileOperation;
  v4 = [(_GEOTileDBDeleteTileOperation *)&v8 init];
  v5 = v4;
  if (v4)
  {
    *(_OWORD *)(v4 + 8) = *a3;
    v6 = v4;
  }

  return v5;
}

- (uint64_t)key
{
  return a1 + 8;
}

- (unint64_t)sizeInBytes
{
  return 0;
}

- (BOOL)canIncreaseDataSizeInDB
{
  return 0;
}

- (void)performWithDB:(id)a3
{
}

- (BOOL)isSupercededByOperation:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    uint64_t v5 = [v4 key];
    BOOL v7 = *(void *)&self->_key == *(void *)v5 && self[1].super.isa == *(Class *)(v5 + 8);
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (uint64_t)dataForKey:(void *)a3 ETag:(void *)a4 originalLoadReason:(unsigned char *)a5 isKnownNotToExist:(BOOL *)a6
{
  BOOL v7 = *(void *)(a1 + 8) != *a3 || *(void *)(a1 + 16) != a3[1];
  if (a4) {
    *a4 = 0;
  }
  if (a6) {
    *a6 = !v7;
  }
  if (a5) {
    *a5 = 0;
  }
  return 0;
}

@end
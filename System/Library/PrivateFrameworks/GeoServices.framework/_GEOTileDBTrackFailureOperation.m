@interface _GEOTileDBTrackFailureOperation
- (BOOL)canIncreaseDataSizeInDB;
- (BOOL)isSupercededByOperation:(id)a3;
- (uint64_t)dataForKey:(uint64_t)a3 ETag:(void *)a4 originalLoadReason:(unsigned char *)a5 isKnownNotToExist:(unsigned char *)a6;
- (uint64_t)key;
- (unint64_t)sizeInBytes;
- (void)initWithTileKey:(_OWORD *)a3 tileSet:(int)a4 shouldProactivelyLoad:(char)a5;
- (void)performWithDB:(id)a3;
@end

@implementation _GEOTileDBTrackFailureOperation

- (void)initWithTileKey:(_OWORD *)a3 tileSet:(int)a4 shouldProactivelyLoad:(char)a5
{
  v12.receiver = a1;
  v12.super_class = (Class)_GEOTileDBTrackFailureOperation;
  v8 = [(_GEOTileDBTrackFailureOperation *)&v12 init];
  v9 = v8;
  if (v8)
  {
    *(_OWORD *)(v8 + 8) = *a3;
    *((_DWORD *)v8 + 6) = a4;
    v8[28] = a5;
    v10 = v8;
  }

  return v9;
}

- (uint64_t)key
{
  return a1 + 8;
}

- (unint64_t)sizeInBytes
{
  return 20;
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
  v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = (void *)[v4 key];
    if (*(void *)&self->_key != *v5 || *(void *)&self->_anon_c[4] != v5[1]) {
      goto LABEL_16;
    }
    BOOL v7 = v4[28] != 0;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_16:
        BOOL v7 = 0;
        goto LABEL_17;
      }
    }
    v8 = (void *)[v4 key];
    BOOL v7 = *(void *)&self->_key == *v8 && *(void *)&self->_anon_c[4] == v8[1];
  }
LABEL_17:

  return v7;
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

@end
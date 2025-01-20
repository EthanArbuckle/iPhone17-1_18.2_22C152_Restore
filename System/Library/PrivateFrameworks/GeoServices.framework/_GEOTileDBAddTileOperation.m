@interface _GEOTileDBAddTileOperation
- (BOOL)canIncreaseDataSizeInDB;
- (BOOL)isSupercededByOperation:(id)a3;
- (id)dataForKey:(void *)a3 ETag:(void *)a4 originalLoadReason:(unsigned char *)a5 isKnownNotToExist:(unsigned char *)a6;
- (id)initWithTileKey:(_OWORD *)a3 tileSet:(int)a4 data:(void *)a5 ETag:(void *)a6 reason:(char)a7 externalResourceUUID:(void *)a8 forSubscriptionWithIdentifier:(void *)a9;
- (uint64_t)key;
- (unint64_t)sizeInBytes;
- (unsigned)reason;
- (void)performWithDB:(id)a3;
@end

@implementation _GEOTileDBAddTileOperation

- (id)initWithTileKey:(_OWORD *)a3 tileSet:(int)a4 data:(void *)a5 ETag:(void *)a6 reason:(char)a7 externalResourceUUID:(void *)a8 forSubscriptionWithIdentifier:(void *)a9
{
  id v16 = a5;
  id v17 = a6;
  id v18 = a8;
  id v19 = a9;
  v28.receiver = a1;
  v28.super_class = (Class)_GEOTileDBAddTileOperation;
  v20 = [(_GEOTileDBAddTileOperation *)&v28 init];
  id v21 = v20;
  if (v20)
  {
    *(_OWORD *)(v20 + 8) = *a3;
    *((_DWORD *)v20 + 6) = a4;
    objc_storeStrong((id *)v20 + 4, a5);
    uint64_t v22 = [v17 copy];
    v23 = (void *)*((void *)v21 + 5);
    *((void *)v21 + 5) = v22;

    *((unsigned char *)v21 + 48) = a7;
    objc_storeStrong((id *)v21 + 7, a8);
    uint64_t v24 = [v19 copy];
    v25 = (void *)*((void *)v21 + 8);
    *((void *)v21 + 8) = v24;

    id v26 = v21;
  }

  return v21;
}

- (uint64_t)key
{
  return a1 + 8;
}

- (unint64_t)sizeInBytes
{
  return [(GEOTileData *)self->_data length];
}

- (BOOL)canIncreaseDataSizeInDB
{
  return 1;
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
    v5 = (void *)[v4 key];
    BOOL v7 = *(void *)&self->_key == *v5 && *(void *)&self->_anon_c[4] == v5[1];
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (id)dataForKey:(void *)a3 ETag:(void *)a4 originalLoadReason:(unsigned char *)a5 isKnownNotToExist:(unsigned char *)a6
{
  if (*(void *)(a1 + 8) != *a3 || *(void *)(a1 + 16) != a3[1])
  {
    id v10 = 0;
    id v11 = 0;
    char v12 = 0;
    if (!a4) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  id v10 = *(id *)(a1 + 32);
  id v11 = *(id *)(a1 + 40);
  char v12 = *(unsigned char *)(a1 + 48);
  if (a4) {
LABEL_6:
  }
    *a4 = v11;
LABEL_7:
  if (a6) {
    *a6 = 0;
  }
  if (a5) {
    *a5 = v12;
  }

  return v10;
}

- (unsigned)reason
{
  return self->_reason;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subscriptionIdentifier, 0);
  objc_storeStrong((id *)&self->_externalResourceUUID, 0);
  objc_storeStrong((id *)&self->_ETag, 0);

  objc_storeStrong((id *)&self->_data, 0);
}

@end
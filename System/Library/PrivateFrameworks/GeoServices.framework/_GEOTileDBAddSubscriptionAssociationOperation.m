@interface _GEOTileDBAddSubscriptionAssociationOperation
- (BOOL)canIncreaseDataSizeInDB;
- (BOOL)isSupercededByOperation:(id)a3;
- (uint64_t)dataForKey:(uint64_t)a3 ETag:(void *)a4 originalLoadReason:(unsigned char *)a5 isKnownNotToExist:(unsigned char *)a6;
- (uint64_t)key;
- (unint64_t)sizeInBytes;
- (void)initWithTileKey:(_OWORD *)a3 subscriptionIdentifier:(void *)a4;
- (void)performWithDB:(id)a3;
@end

@implementation _GEOTileDBAddSubscriptionAssociationOperation

- (void)initWithTileKey:(_OWORD *)a3 subscriptionIdentifier:(void *)a4
{
  id v6 = a4;
  v13.receiver = a1;
  v13.super_class = (Class)_GEOTileDBAddSubscriptionAssociationOperation;
  v7 = [(_GEOTileDBAddSubscriptionAssociationOperation *)&v13 init];
  v8 = v7;
  if (v7)
  {
    *(_OWORD *)(v7 + 8) = *a3;
    uint64_t v9 = [v6 copy];
    v10 = (void *)v8[3];
    v8[3] = v9;

    v11 = v8;
  }

  return v8;
}

- (uint64_t)key
{
  return a1 + 8;
}

- (unint64_t)sizeInBytes
{
  return [(NSString *)self->_subscriptionIdentifier lengthOfBytesUsingEncoding:4] + 16;
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
  if (objc_opt_isKindOfClass())
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

- (void).cxx_destruct
{
}

@end
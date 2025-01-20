@interface PHObjectChangeDetails
- (BOOL)assetCollectionTitlePropertiesChanged;
- (BOOL)assetContentChanged;
- (BOOL)objectWasDeleted;
- (PHObjectChangeDetails)initWithPHObject:(id)a3;
- (id)description;
- (id)objectAfterChanges;
- (id)objectBeforeChanges;
- (void)_calculateDiffs;
@end

@implementation PHObjectChangeDetails

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_objectAfterChanges, 0);

  objc_storeStrong((id *)&self->_objectBeforeChanges, 0);
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)PHObjectChangeDetails;
  v3 = [(PHObjectChangeDetails *)&v8 description];
  v4 = [(PHObjectChangeDetails *)self objectBeforeChanges];
  v5 = [(PHObjectChangeDetails *)self objectAfterChanges];
  v6 = [v3 stringByAppendingFormat:@" before=%@, after=%@, assetContentChanged=%d", v4, v5, -[PHObjectChangeDetails assetContentChanged](self, "assetContentChanged")];

  return v6;
}

- (BOOL)objectWasDeleted
{
  v2 = PLResultWithUnfairLock();
  char v3 = [v2 BOOLValue];

  return v3;
}

uint64_t __41__PHObjectChangeDetails_objectWasDeleted__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _calculateDiffs];
  v2 = NSNumber;
  char v3 = *(void **)(*(void *)(a1 + 32) + 16);
  if (v3) {
    uint64_t v4 = [v3 isDeleted];
  }
  else {
    uint64_t v4 = 1;
  }

  return [v2 numberWithInt:v4];
}

- (BOOL)assetCollectionTitlePropertiesChanged
{
  v2 = PLResultWithUnfairLock();
  char v3 = [v2 BOOLValue];

  return v3;
}

uint64_t __62__PHObjectChangeDetails_assetCollectionTitlePropertiesChanged__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _calculateDiffs];
  v2 = NSNumber;
  uint64_t v3 = *(unsigned __int8 *)(*(void *)(a1 + 32) + 25);

  return [v2 numberWithBool:v3];
}

- (BOOL)assetContentChanged
{
  v2 = PLResultWithUnfairLock();
  char v3 = [v2 BOOLValue];

  return v3;
}

uint64_t __44__PHObjectChangeDetails_assetContentChanged__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _calculateDiffs];
  v2 = NSNumber;
  uint64_t v3 = *(unsigned __int8 *)(*(void *)(a1 + 32) + 24);

  return [v2 numberWithBool:v3];
}

- (void)_calculateDiffs
{
  os_unfair_lock_assert_owner(&self->_stateLock);
  if (!self->_objectAfterChanges)
  {
    uint64_t v3 = [(PHObject *)self->_objectBeforeChanges photoLibrary];
    uint64_t v4 = [v3 fetchUpdatedObject:self->_objectBeforeChanges];
    objectAfterChanges = self->_objectAfterChanges;
    self->_objectAfterChanges = v4;

    v6 = self->_objectAfterChanges;
    if (v6)
    {
      if (![(PHObject *)v6 isDeleted])
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          self->_assetContentChanged = [(PHObject *)self->_objectAfterChanges hasContentEqualTo:self->_objectBeforeChanges] ^ 1;
          return;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v19 = self->_objectBeforeChanges;
          v7 = self->_objectAfterChanges;
          id v8 = [(PHObject *)v19 localizedTitle];
          id v9 = [(PHObject *)v7 localizedTitle];
          if (v8 == v9)
          {
          }
          else
          {
            v10 = v9;
            char v11 = [v8 isEqualToString:v9];

            if ((v11 & 1) == 0) {
              goto LABEL_15;
            }
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v12 = [(PHObject *)v19 subtitle];
            id v13 = [(PHObject *)v7 subtitle];
            if (v12 == v13)
            {
            }
            else
            {
              v14 = v13;
              char v15 = [v12 isEqualToString:v13];

              if ((v15 & 1) == 0)
              {
LABEL_15:
                char v16 = 0;
LABEL_21:
                self->_assetCollectionTitlePropertiesChanged = v16 ^ 1;

                return;
              }
            }
          }
          v17 = [(PHObject *)v19 titleFontName];
          v18 = [(PHObject *)v7 titleFontName];
          if (v17 == v18) {
            char v16 = 1;
          }
          else {
            char v16 = [v17 isEqualToString:v18];
          }

          goto LABEL_21;
        }
      }
    }
  }
}

- (id)objectAfterChanges
{
  v2 = PLResultWithUnfairLock();

  return v2;
}

id __43__PHObjectChangeDetails_objectAfterChanges__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _calculateDiffs];
  if ([*(id *)(*(void *)(a1 + 32) + 16) isDeleted]) {
    v2 = 0;
  }
  else {
    v2 = *(void **)(*(void *)(a1 + 32) + 16);
  }

  return v2;
}

- (id)objectBeforeChanges
{
  return self->_objectBeforeChanges;
}

- (PHObjectChangeDetails)initWithPHObject:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PHObjectChangeDetails;
  v6 = [(PHObjectChangeDetails *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_objectBeforeChanges, a3);
    v7->_stateLock._os_unfair_lock_opaque = 0;
  }

  return v7;
}

@end
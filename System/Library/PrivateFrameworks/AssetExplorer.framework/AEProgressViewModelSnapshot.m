@interface AEProgressViewModelSnapshot
- (AEProgressViewModelSnapshot)initWithProgressByIndexPath:(id)a3 dataSourceIdenfitier:(int64_t)a4;
- (BOOL)hasProgressForIndexPath:(PXSimpleIndexPath *)a3;
- (NSDictionary)_progressByIndexPath;
- (PXIndexPathSet)_pathsWithProgress;
- (id)progressForIndexPath:(PXSimpleIndexPath *)a3;
- (int64_t)correspondingDataSourceIdentifier;
@end

@implementation AEProgressViewModelSnapshot

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__pathsWithProgress, 0);
  objc_storeStrong((id *)&self->__progressByIndexPath, 0);
}

- (PXIndexPathSet)_pathsWithProgress
{
  return self->__pathsWithProgress;
}

- (NSDictionary)_progressByIndexPath
{
  return self->__progressByIndexPath;
}

- (int64_t)correspondingDataSourceIdentifier
{
  return self->_correspondingDataSourceIdentifier;
}

- (id)progressForIndexPath:(PXSimpleIndexPath *)a3
{
  v4 = [(AEProgressViewModelSnapshot *)self _progressByIndexPath];
  PXSimpleIndexPath v8 = *a3;
  v5 = PXIndexPathFromSimpleIndexPath();
  v6 = objc_msgSend(v4, "objectForKey:", v5, *(_OWORD *)&v8.dataSourceIdentifier, *(_OWORD *)&v8.item);

  return v6;
}

- (BOOL)hasProgressForIndexPath:(PXSimpleIndexPath *)a3
{
  v4 = [(AEProgressViewModelSnapshot *)self _pathsWithProgress];
  long long v5 = *(_OWORD *)&a3->item;
  v7[0] = *(_OWORD *)&a3->dataSourceIdentifier;
  v7[1] = v5;
  LOBYTE(a3) = [v4 containsIndexPath:v7];

  return (char)a3;
}

- (AEProgressViewModelSnapshot)initWithProgressByIndexPath:(id)a3 dataSourceIdenfitier:(int64_t)a4
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v7 = a3;
  v25.receiver = self;
  v25.super_class = (Class)AEProgressViewModelSnapshot;
  PXSimpleIndexPath v8 = [(AEProgressViewModelSnapshot *)&v25 init];
  v9 = v8;
  if (v8)
  {
    v8->_correspondingDataSourceIdentifier = a4;
    if (v7)
    {
      objc_storeStrong((id *)&v8->__progressByIndexPath, a3);
      id v10 = objc_alloc_init(MEMORY[0x263F5E158]);
      long long v23 = 0u;
      long long v24 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      v11 = [(NSDictionary *)v9->__progressByIndexPath keyEnumerator];
      uint64_t v12 = [v11 countByEnumeratingWithState:&v21 objects:v26 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v22;
        do
        {
          uint64_t v15 = 0;
          do
          {
            if (*(void *)v22 != v14) {
              objc_enumerationMutation(v11);
            }
            long long v19 = 0u;
            long long v20 = 0u;
            PXSimpleIndexPathFromIndexPath();
            v18[0] = v19;
            v18[1] = v20;
            [v10 addIndexPath:v18];
            ++v15;
          }
          while (v13 != v15);
          uint64_t v13 = [v11 countByEnumeratingWithState:&v21 objects:v26 count:16];
        }
        while (v13);
      }

      pathsWithProgress = v9->__pathsWithProgress;
      v9->__pathsWithProgress = (PXIndexPathSet *)v10;
    }
  }

  return v9;
}

@end
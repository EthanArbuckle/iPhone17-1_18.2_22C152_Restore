@interface GEOTileDBSubscriptionMetadata
- (BOOL)isFullyLoadedForDataType:(unsigned int)a3 dataSubtype:(unsigned int)a4 version:(unint64_t)a5 associatedDataCount:(unint64_t *)a6 associatedDataSize:(unint64_t *)a7;
- (GEOTileDBSubscriptionMetadata)initWithDataStates:(id)a3 downloadState:(int64_t)a4;
- (int64_t)downloadState;
@end

@implementation GEOTileDBSubscriptionMetadata

- (GEOTileDBSubscriptionMetadata)initWithDataStates:(id)a3 downloadState:(int64_t)a4
{
  id v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)GEOTileDBSubscriptionMetadata;
  v7 = [(GEOTileDBSubscriptionMetadata *)&v13 init];
  v8 = v7;
  if (v7)
  {
    v7->_downloadState = a4;
    uint64_t v9 = [v6 copy];
    dataStates = v8->_dataStates;
    v8->_dataStates = (NSArray *)v9;

    v11 = v8;
  }

  return v8;
}

- (BOOL)isFullyLoadedForDataType:(unsigned int)a3 dataSubtype:(unsigned int)a4 version:(unint64_t)a5 associatedDataCount:(unint64_t *)a6 associatedDataSize:(unint64_t *)a7
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  v12 = self->_dataStates;
  uint64_t v13 = [(NSArray *)v12 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v25;
    if (a4 | a3) {
      BOOL v16 = 0;
    }
    else {
      BOOL v16 = a5 == 0;
    }
    char v17 = v16;
    while (2)
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v25 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v19 = *(void *)(*((void *)&v24 + 1) + 8 * v18);
        if (v19)
        {
          if (*(_DWORD *)(v19 + 16) == a3 && *(_DWORD *)(v19 + 20) == a4 && *(void *)(v19 + 8) == a5)
          {
            int v22 = *(unsigned __int8 *)(v19 + 24);
            if (*(unsigned char *)(v19 + 24))
            {
              if (a6) {
                *a6 = *(void *)(v19 + 32);
              }
              if (a7) {
                *a7 = *(void *)(v19 + 40);
              }
            }
            BOOL v21 = v22 != 0;
            goto LABEL_28;
          }
        }
        else if (v17)
        {
          goto LABEL_27;
        }
        ++v18;
      }
      while (v14 != v18);
      uint64_t v20 = [(NSArray *)v12 countByEnumeratingWithState:&v24 objects:v28 count:16];
      uint64_t v14 = v20;
      BOOL v21 = 0;
      if (v20) {
        continue;
      }
      break;
    }
  }
  else
  {
LABEL_27:
    BOOL v21 = 0;
  }
LABEL_28:

  return v21;
}

- (int64_t)downloadState
{
  return self->_downloadState;
}

- (void).cxx_destruct
{
}

@end
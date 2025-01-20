@interface BLDownloadDRM
- (BLDownloadDRM)initWithSinfArray:(id)a3;
- (BLSinfsArray)pinfsArray;
- (BLSinfsArray)sinfsArray;
- (BOOL)isDRMFree;
- (NSArray)sinfs;
- (id)_sinfsArrayWithDataKey:(id)a3;
- (id)firstDataForSinfDataKey:(id)a3;
- (id)sinfForIdentifier:(int64_t)a3;
- (void)setSinfs:(id)a3;
@end

@implementation BLDownloadDRM

- (BLDownloadDRM)initWithSinfArray:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)BLDownloadDRM;
  v5 = [(BLDownloadDRM *)&v21 init];
  if (v5)
  {
    v6 = (NSArray *)objc_alloc_init((Class)NSMutableArray);
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v7 = v4;
    id v8 = [v7 countByEnumeratingWithState:&v17 objects:v22 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v18;
      do
      {
        v11 = 0;
        do
        {
          if (*(void *)v18 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void *)(*((void *)&v17 + 1) + 8 * (void)v11);
          v13 = [BLDownloadSinf alloc];
          v14 = -[BLDownloadSinf initWithDictionary:](v13, "initWithDictionary:", v12, (void)v17);
          if (v14) {
            [(NSArray *)v6 addObject:v14];
          }

          v11 = (char *)v11 + 1;
        }
        while (v9 != v11);
        id v9 = [v7 countByEnumeratingWithState:&v17 objects:v22 count:16];
      }
      while (v9);
    }

    sinfs = v5->_sinfs;
    v5->_sinfs = v6;
  }
  return v5;
}

- (id)firstDataForSinfDataKey:(id)a3
{
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v5 = self->_sinfs;
  id v6 = [(NSArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v14;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "dataForSinfDataKey:", v4, (void)v13);
        if (v10)
        {
          v11 = (void *)v10;
          goto LABEL_11;
        }
      }
      id v7 = [(NSArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  v11 = 0;
LABEL_11:

  return v11;
}

- (BOOL)isDRMFree
{
  v2 = [(BLDownloadDRM *)self firstDataForSinfDataKey:off_1001C75B8[0]];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BLSinfsArray)pinfsArray
{
  return (BLSinfsArray *)[(BLDownloadDRM *)self _sinfsArrayWithDataKey:off_1001C75C0[0]];
}

- (id)sinfForIdentifier:(int64_t)a3
{
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = self->_sinfs;
  id v5 = [(NSArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v9, "identifier", (void)v12) == (id)a3)
        {
          id v10 = v9;
          goto LABEL_11;
        }
      }
      id v6 = [(NSArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  id v10 = 0;
LABEL_11:

  return v10;
}

- (BLSinfsArray)sinfsArray
{
  return (BLSinfsArray *)[(BLDownloadDRM *)self _sinfsArrayWithDataKey:off_1001C75C8];
}

- (id)_sinfsArrayWithDataKey:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)NSMutableArray);
  id v6 = [(BLDownloadDRM *)self sinfs];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = [*(id *)(*((void *)&v14 + 1) + 8 * i) dataForSinfDataKey:v4];
        if (v11) {
          [v5 addObject:v11];
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }
  if ([v5 count]) {
    long long v12 = [[BLSinfsArray alloc] initWithSINFs:v5];
  }
  else {
    long long v12 = 0;
  }

  return v12;
}

- (NSArray)sinfs
{
  return self->_sinfs;
}

- (void)setSinfs:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
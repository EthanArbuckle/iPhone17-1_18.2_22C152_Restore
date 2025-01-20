@interface CPLCloudKitDownloadResourcesOperationContext
- (CPLCloudKitDownloadResourcesOperationContext)initWithResourceType:(unint64_t)a3;
- (id)extendedStatusDescriptionStrings;
- (id)operationDescription;
- (unint64_t)resourceType;
- (void)addResource:(id)a3;
- (void)recordCompletionForResource:(id)a3 withError:(id)a4;
- (void)updateProgress:(double)a3 forResource:(id)a4;
@end

@implementation CPLCloudKitDownloadResourcesOperationContext

- (CPLCloudKitDownloadResourcesOperationContext)initWithResourceType:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CPLCloudKitDownloadResourcesOperationContext;
  result = [(CPLCloudKitDownloadResourcesOperationContext *)&v5 init];
  if (result) {
    result->_resourceType = a3;
  }
  return result;
}

- (void)addResource:(id)a3
{
  id v4 = a3;
  resourceToProgressMap = self->_resourceToProgressMap;
  id v8 = v4;
  if (!resourceToProgressMap)
  {
    v6 = (NSMapTable *)[objc_alloc((Class)NSMapTable) initWithKeyOptions:0 valueOptions:0 capacity:6];
    v7 = self->_resourceToProgressMap;
    self->_resourceToProgressMap = v6;

    id v4 = v8;
    resourceToProgressMap = self->_resourceToProgressMap;
  }
  [(NSMapTable *)resourceToProgressMap setObject:&off_100291D40 forKey:v4];
}

- (void)updateProgress:(double)a3 forResource:(id)a4
{
  uint64_t v5 = (uint64_t)(a3 * 100.0);
  id v6 = a4;
  id v7 = +[NSNumber numberWithInteger:v5];
  [(NSMapTable *)self->_resourceToProgressMap setObject:v7 forKey:v6];
}

- (void)recordCompletionForResource:(id)a3 withError:(id)a4
{
  resourceToProgressMap = self->_resourceToProgressMap;
  if (a4) {
    id v6 = &off_100291D58;
  }
  else {
    id v6 = &off_100291D70;
  }
  [(NSMapTable *)resourceToProgressMap setObject:v6 forKey:a3];
}

- (id)operationDescription
{
  v2 = +[CPLResource shortDescriptionForResourceType:self->_resourceType];
  v3 = [@"for " stringByAppendingString:v2];

  return v3;
}

- (id)extendedStatusDescriptionStrings
{
  id v40 = objc_alloc_init((Class)NSMutableArray);
  uint64_t v3 = 72;
  v50 = self;
  NSUInteger v4 = [(NSMapTable *)self->_resourceToProgressMap count];
  uint64_t v5 = +[NSUserDefaults standardUserDefaults];
  unsigned __int8 v46 = [v5 BOOLForKey:@"CPLUseCompactCloudKitStatus"];

  if (v4)
  {
    long long v53 = 0u;
    long long v54 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    id v6 = v50->_resourceToProgressMap;
    id v7 = [(NSMapTable *)v6 countByEnumeratingWithState:&v51 objects:v55 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = 0;
      uint64_t v10 = 0;
      uint64_t v11 = 0;
      v47 = 0;
      uint64_t v49 = *(void *)v52;
      v45 = v6;
      do
      {
        v12 = 0;
        id v48 = v8;
        do
        {
          if (*(void *)v52 != v49) {
            objc_enumerationMutation(v6);
          }
          v13 = *(void **)(*((void *)&v51 + 1) + 8 * (void)v12);
          v14 = [*(id *)((char *)&v50->super.super.isa + v3) objectForKey:v13];
          uint64_t v15 = (uint64_t)[v14 integerValue];
          if (v15 < 100)
          {
            uint64_t v16 = v15;
            uint64_t v17 = v3;
            v18 = [v13 identity];
            id v19 = [v18 fileSize];
            if ((v46 & 1) == 0)
            {
              uint64_t v43 = v11;
              uint64_t v44 = v9;
              if (v14)
              {
                CFStringRef v20 = &stru_10027FEB8;
                if (v16 < 0) {
                  CFStringRef v20 = @" [error]";
                }
                CFStringRef v41 = v20;
                uint64_t v42 = v16 & ~(v16 >> 63);
                id v21 = objc_alloc((Class)NSString);
                v22 = [v13 itemScopedIdentifier];
                v23 = [v18 fileUTI];
                v24 = +[NSByteCountFormatter stringFromByteCount:v19 countStyle:3];
                id v25 = [v21 initWithFormat:@"\t%@ (%@, %@) [%ld%%]%@", v22, v23, v24, v42, v41];
              }
              else
              {
                id v26 = objc_alloc((Class)NSString);
                v22 = [v13 itemScopedIdentifier];
                v23 = [v18 fileUTI];
                v24 = +[NSByteCountFormatter stringFromByteCount:v19 countStyle:3];
                id v25 = [v26 initWithFormat:@"\t%@ (%@, %@) [waiting]", v22, v23, v24, v38, v39];
              }
              id v27 = v25;

              [v40 addObject:v27];
              v47 = v27;
              uint64_t v11 = v43;
              uint64_t v9 = v44;
            }
            v11 += (uint64_t)v19;
            ++v9;

            uint64_t v3 = v17;
            id v6 = v45;
            id v8 = v48;
          }
          else
          {
            ++v10;
          }

          v12 = (char *)v12 + 1;
        }
        while (v8 != v12);
        id v8 = [(NSMapTable *)v6 countByEnumeratingWithState:&v51 objects:v55 count:16];
      }
      while (v8);

      if (v10)
      {
        id v28 = objc_alloc((Class)NSString);
        uint64_t v29 = +[CPLResource shortDescriptionForResourceType:v50->_resourceType];
        uint64_t v30 = v11;
        v31 = (void *)v29;
        v32 = +[NSByteCountFormatter stringFromByteCount:v30 countStyle:3];
        id v33 = [v28 initWithFormat:@"\t\t%lu (+ %lu downloaded) x %@ in batch (%@)", v9, v10, v31, v32];
LABEL_24:
        v36 = v33;

        [v40 addObject:v36];
        goto LABEL_25;
      }
      uint64_t v34 = v11;
    }
    else
    {

      v47 = 0;
      uint64_t v34 = 0;
      uint64_t v9 = 0;
    }
    id v35 = objc_alloc((Class)NSString);
    v31 = +[CPLResource shortDescriptionForResourceType:v50->_resourceType];
    v32 = +[NSByteCountFormatter stringFromByteCount:v34 countStyle:3];
    id v33 = [v35 initWithFormat:@"\t\t%lu x %@ in batch (%@)", v9, v31, v32, v38];
    goto LABEL_24;
  }
LABEL_25:
  return v40;
}

- (unint64_t)resourceType
{
  return self->_resourceType;
}

- (void).cxx_destruct
{
}

@end
@interface ATXApp2VecClustering
+ (id)sharedInstance;
+ (void)resetSharedInstance;
- (ATXApp2VecClustering)init;
- (float)_getL2DistanceFrom:(const float *)a3 to:(float *)a4;
- (id)_getClosestClusterCentroidForVector:(const float *)a3;
- (id)_mergeClusterCentroids:(id)a3 forBundleIds:(id)a4;
- (id)getClosestClusterCentroidForBundleId:(id)a3;
- (id)getClusterCentroidsForBundleIds:(id)a3;
- (void)init;
@end

@implementation ATXApp2VecClustering

- (ATXApp2VecClustering)init
{
  v3 = [MEMORY[0x1E4F4AF08] pathForResource:@"_ATXApp2VecClusters" ofType:@"dat" isDirectory:0];
  v4 = [MEMORY[0x1E4F4AF08] pathForResource:@"_ATXApp2VecMapping" ofType:@"dat" isDirectory:0];
  v15.receiver = self;
  v15.super_class = (Class)ATXApp2VecClustering;
  v5 = [(ATXApp2VecClustering *)&v15 init];
  if (v5)
  {
    if (v3) {
      BOOL v6 = v4 == 0;
    }
    else {
      BOOL v6 = 1;
    }
    if (!v6)
    {
      v7 = [[ATXApp2VecMapping alloc] initWithPath:v3];
      clusterCentroids = v5->_clusterCentroids;
      v5->_clusterCentroids = v7;

      v9 = [[ATXApp2VecMapping alloc] initWithPath:v4];
      appEmbeddings = v5->_appEmbeddings;
      v5->_appEmbeddings = v9;

      uint64_t v11 = [(ATXApp2VecMapping *)v5->_appEmbeddings vectorLength];
      v5->_vectorLength = v11;
      if (v11 != [(ATXApp2VecMapping *)v5->_clusterCentroids vectorLength]) {
        -[ATXApp2VecClustering init]();
      }
    }
    if (v5->_clusterCentroids && v5->_appEmbeddings)
    {
      char v12 = 1;
    }
    else
    {
      v13 = __atxlog_handle_default();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        [(ATXApp2VecClustering *)(uint64_t)v3 init];
      }

      char v12 = 0;
    }
    v5->_loaded = v12;
  }

  return v5;
}

+ (id)sharedInstance
{
  pthread_mutex_lock(&sharedInstanceLock_0);
  id v2 = (id)sharedInstance_0;
  if (!v2)
  {
    id v2 = (id)objc_opt_new();
    objc_storeStrong((id *)&sharedInstance_0, v2);
  }
  pthread_mutex_unlock(&sharedInstanceLock_0);
  return v2;
}

+ (void)resetSharedInstance
{
  pthread_mutex_lock(&sharedInstanceLock_0);
  id v2 = (void *)sharedInstance_0;
  sharedInstance_0 = 0;

  pthread_mutex_unlock(&sharedInstanceLock_0);
}

- (id)getClusterCentroidsForBundleIds:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v4, "count"));
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = -[ATXApp2VecClustering getClosestClusterCentroidForBundleId:](self, "getClosestClusterCentroidForBundleId:", *(void *)(*((void *)&v14 + 1) + 8 * i), (void)v14);
        [v5 addObject:v11];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  char v12 = [(ATXApp2VecClustering *)self _mergeClusterCentroids:v5 forBundleIds:v6];

  return v12;
}

- (id)_mergeClusterCentroids:(id)a3 forBundleIds:(id)a4
{
  uint64_t v78 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v66 = self;
  if (self->_loaded)
  {
    uint64_t v8 = objc_opt_new();
    if ([v7 count])
    {
      unint64_t v9 = 0;
      do
      {
        v10 = [v6 objectAtIndexedSubscript:v9];
        uint64_t v11 = [v8 objectForKeyedSubscript:v10];

        if (!v11)
        {
          id v12 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          v13 = [v6 objectAtIndexedSubscript:v9];
          [v8 setObject:v12 forKeyedSubscript:v13];
        }
        long long v14 = [v6 objectAtIndexedSubscript:v9];
        long long v15 = [v8 objectForKeyedSubscript:v14];
        long long v16 = [v7 objectAtIndexedSubscript:v9];
        [v15 addObject:v16];

        ++v9;
      }
      while ([v7 count] > v9);
    }
    id v57 = v7;
    id v17 = v6;
    v18 = [v8 allKeys];
    long long v72 = 0u;
    long long v73 = 0u;
    long long v74 = 0u;
    long long v75 = 0u;
    uint64_t v19 = [v18 countByEnumeratingWithState:&v72 objects:v77 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v73;
      v55 = v8;
      id v56 = v6;
      uint64_t v53 = v21;
      v54 = v18;
      do
      {
        uint64_t v22 = 0;
        uint64_t v58 = v20;
        do
        {
          if (*(void *)v73 != v21) {
            objc_enumerationMutation(v18);
          }
          v23 = *(void **)(*((void *)&v72 + 1) + 8 * v22);
          id v24 = [v8 objectForKeyedSubscript:v23];
          if ([v24 count] == 1)
          {
            v60 = &v52;
            uint64_t v61 = v22;
            appEmbeddings = v66->_appEmbeddings;
            v26 = (char *)&v52 - ((4 * v66->_vectorLength + 15) & 0xFFFFFFFFFFFFFFF0);
            id v62 = v24;
            v27 = [v24 objectAtIndexedSubscript:0];
            v64 = v26;
            LODWORD(appEmbeddings) = [(ATXApp2VecMapping *)appEmbeddings getVectorForBundleId:v27 into:v26];

            if (appEmbeddings)
            {
              id v28 = v23;
              v59 = &v52;
              v63 = (char *)&v52 - ((4 * v66->_vectorLength + 15) & 0xFFFFFFFFFFFFFFF0);
              long long v70 = 0u;
              long long v71 = 0u;
              long long v68 = 0u;
              long long v69 = 0u;
              id v67 = v8;
              uint64_t v29 = [v67 countByEnumeratingWithState:&v68 objects:v76 count:16];
              id v65 = v28;
              if (v29)
              {
                uint64_t v30 = v29;
                uint64_t v31 = *(void *)v69;
                float v32 = 3.4028e38;
                id v65 = v28;
                do
                {
                  for (uint64_t i = 0; i != v30; ++i)
                  {
                    if (*(void *)v69 != v31) {
                      objc_enumerationMutation(v67);
                    }
                    id v34 = *(id *)(*((void *)&v68 + 1) + 8 * i);
                    if (v34 != v28)
                    {
                      if ([*(id *)(*((void *)&v68 + 1) + 8 * i) integerValue])
                      {
                        v35 = v66;
                        clusterCentroids = v66->_clusterCentroids;
                        v37 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v34, "integerValue") - 1);
                        v38 = [v37 stringValue];
                        v39 = clusterCentroids;
                        v40 = v63;
                        [(ATXApp2VecMapping *)v39 getVectorForBundleId:v38 into:v63];

                        [(ATXApp2VecClustering *)v35 _getL2DistanceFrom:v64 to:v40];
                        if (v41 < v32)
                        {
                          float v42 = v41;
                          id v43 = v34;

                          float v32 = v42;
                          id v65 = v43;
                        }
                      }
                    }
                  }
                  uint64_t v30 = [v67 countByEnumeratingWithState:&v68 objects:v76 count:16];
                }
                while (v30);
              }
              id v44 = v67;

              [v44 removeObjectForKey:v28];
              id v45 = v65;
              v46 = [v44 objectForKeyedSubscript:v65];
              id v47 = v62;
              v48 = [v62 objectAtIndexedSubscript:0];
              [v46 addObject:v48];

              v49 = [v47 objectAtIndexedSubscript:0];
              uint64_t v50 = [v57 indexOfObject:v49];

              id v17 = v56;
              [v56 setObject:v45 atIndexedSubscript:v50];

              v18 = v54;
              uint64_t v8 = v55;
              uint64_t v21 = v53;
              uint64_t v20 = v58;
            }
            uint64_t v22 = v61;
            id v24 = v62;
          }

          ++v22;
        }
        while (v22 != v20);
        uint64_t v20 = [v18 countByEnumeratingWithState:&v72 objects:v77 count:16];
      }
      while (v20);
    }

    id v6 = v17;
    id v7 = v57;
  }

  return v6;
}

- (id)getClosestClusterCentroidForBundleId:(id)a3
{
  v7[1] = *MEMORY[0x1E4F143B8];
  if (self->_loaded)
  {
    id v4 = (char *)v7 - ((4 * self->_vectorLength + 15) & 0xFFFFFFFFFFFFFFF0);
    if ([(ATXApp2VecMapping *)self->_appEmbeddings getVectorForBundleId:a3 into:v4])
    {
      v5 = [(ATXApp2VecClustering *)self _getClosestClusterCentroidForVector:v4];
    }
    else
    {
      v5 = &unk_1F27F17D0;
    }
  }
  else
  {
    v5 = &unk_1F27F17D0;
  }
  return v5;
}

- (id)_getClosestClusterCentroidForVector:(const float *)a3
{
  v18[1] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [(ATXApp2VecMapping *)self->_clusterCentroids appCount];
  v18[0] = v18;
  id v6 = (char *)v18 - ((4 * self->_vectorLength + 15) & 0xFFFFFFFFFFFFFFF0);
  if (v5 < 1)
  {
    uint64_t v9 = 0;
  }
  else
  {
    uint64_t v7 = v5;
    uint64_t v8 = 0;
    uint64_t v9 = 0;
    float v10 = 3.4028e38;
    do
    {
      clusterCentroids = self->_clusterCentroids;
      id v12 = objc_msgSend(NSNumber, "numberWithInt:", v8, v18[0]);
      v13 = [v12 stringValue];
      [(ATXApp2VecMapping *)clusterCentroids getVectorForBundleId:v13 into:v6];

      [(ATXApp2VecClustering *)self _getL2DistanceFrom:a3 to:v6];
      if (v14 < v10) {
        uint64_t v9 = v8 + 1;
      }
      uint64_t v15 = v8 + 1;
      if (v14 < v10) {
        float v10 = v14;
      }
      ++v8;
    }
    while (v7 != v15);
  }
  long long v16 = objc_msgSend(NSNumber, "numberWithInteger:", v9, v18[0]);
  return v16;
}

- (float)_getL2DistanceFrom:(const float *)a3 to:(float *)a4
{
  catlas_saxpby_NEWLAPACK();
  cblas_snrm2_NEWLAPACK();
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appEmbeddings, 0);
  objc_storeStrong((id *)&self->_clusterCentroids, 0);
}

- (void)init
{
  __assert_rtn("-[ATXApp2VecClustering init]", "ATXApp2VecClustering.m", 34, "_vectorLength == [_clusterCentroids vectorLength]");
}

@end
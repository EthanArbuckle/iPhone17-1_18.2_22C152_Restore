@interface AMDCoreMLDataProvider
- (AMDCoreMLDataProvider)initWithInputs:(int64_t)a3 featureSizeMap:(id)a4 inputDictionary:(id)a5;
- (id)fetchData:(int64_t)a3 error:(id *)a4 errorDomain:(id)a5;
- (int64_t)count;
- (int64_t)numberOfDataPoints;
- (int64_t)numberOfIterationsPerEpoch:(int64_t)a3;
@end

@implementation AMDCoreMLDataProvider

- (AMDCoreMLDataProvider)initWithInputs:(int64_t)a3 featureSizeMap:(id)a4 inputDictionary:(id)a5
{
  v12 = self;
  SEL v11 = a2;
  int64_t v10 = a3;
  id location = 0;
  objc_storeStrong(&location, a4);
  id v8 = 0;
  objc_storeStrong(&v8, a5);
  v12->_length = v10;
  objc_storeStrong((id *)&v12->_inputDictionary, v8);
  objc_storeStrong((id *)&v12->_featureSizeMap, location);
  v12->_currentIndex = 0;
  v7 = v12;
  objc_storeStrong(&v8, 0);
  objc_storeStrong(&location, 0);
  objc_storeStrong((id *)&v12, 0);
  return v7;
}

- (int64_t)numberOfIterationsPerEpoch:(int64_t)a3
{
  return (self->_length - self->_length % a3) / a3;
}

- (int64_t)numberOfDataPoints
{
  return self->_length;
}

- (int64_t)count
{
  return self->_length;
}

- (id)fetchData:(int64_t)a3 error:(id *)a4 errorDomain:(id)a5
{
  v47 = self;
  SEL v46 = a2;
  int64_t v45 = a3;
  v44 = a4;
  id location = 0;
  objc_storeStrong(&location, a5);
  id v42 = objc_alloc_init((Class)NSMutableDictionary);
  memset(__b, 0, sizeof(__b));
  obj = v47->_featureSizeMap;
  NSUInteger v26 = [(NSDictionary *)obj countByEnumeratingWithState:__b objects:v54 count:16];
  if (v26)
  {
    uint64_t v22 = *(void *)__b[2];
    uint64_t v23 = 0;
    NSUInteger v24 = v26;
    while (1)
    {
      uint64_t v21 = v23;
      if (*(void *)__b[2] != v22) {
        objc_enumerationMutation(obj);
      }
      uint64_t v41 = *(void *)(__b[1] + 8 * v23);
      id v39 = [(NSDictionary *)v47->_featureSizeMap objectForKey:v41];
      if (v39)
      {
        id v37 = [(NSDictionary *)v47->_inputDictionary objectForKey:v41];
        if (v37)
        {
          uint64_t v36 = 0;
          int64_t currentIndex = v47->_currentIndex;
          uint64_t v36 = 4 * currentIndex * (void)[v39 longValue];
          uint64_t v35 = 0;
          int64_t v19 = v45;
          uint64_t v35 = 4 * v19 * (void)[v39 longValue];
          unint64_t v34 = v36 + v35;
          unint64_t v20 = v36;
          if (v20 >= (unint64_t)[v37 length]) {
            goto LABEL_11;
          }
          unint64_t v17 = v34;
          if (v17 <= (unint64_t)[v37 length])
          {
            id v33 = objc_alloc_init((Class)NSMutableArray);
            for (int i = v36; i < v34; i += 4)
            {
              int v31 = 0;
              uint64_t v50 = i;
              uint64_t v49 = 4;
              uint64_t v51 = i;
              uint64_t v52 = 4;
              v30[1] = (id)i;
              v30[2] = (id)4;
              objc_msgSend(v37, "getBytes:range:", &v31, i, 4);
              LODWORD(v11) = v31;
              v30[0] = +[NSNumber numberWithFloat:v11];
              [v33 addObject:v30[0]];
              objc_storeStrong(v30, 0);
            }
            v16 = +[NSNumber numberWithInteger:v45];
            v53[0] = v16;
            v53[1] = v39;
            v15 = +[NSArray arrayWithObjects:v53 count:2];
            id v29 = +[MLMultiArray doubleMultiArrayWithShape:valueArray:error:](MLMultiArray, "doubleMultiArrayWithShape:valueArray:error:");

            [v42 setObject:v29 forKey:v41];
            objc_storeStrong(&v29, 0);
            objc_storeStrong(&v33, 0);
            int v38 = 0;
          }
          else
          {
LABEL_11:
            id v9 = objc_alloc((Class)NSError);
            id v10 = [v9 initWithDomain:location code:91 userInfo:0];
            id *v44 = v10;
            id v48 = 0;
            int v38 = 1;
          }
        }
        else
        {
          id v7 = objc_alloc((Class)NSError);
          id v8 = [v7 initWithDomain:location code:81 userInfo:0];
          id *v44 = v8;
          id v48 = 0;
          int v38 = 1;
        }
        objc_storeStrong(&v37, 0);
      }
      else
      {
        id v5 = objc_alloc((Class)NSError);
        id v6 = [v5 initWithDomain:location code:80 userInfo:0];
        id *v44 = v6;
        id v48 = 0;
        int v38 = 1;
      }
      objc_storeStrong(&v39, 0);
      if (v38) {
        break;
      }
      ++v23;
      if (v21 + 1 >= v24)
      {
        uint64_t v23 = 0;
        NSUInteger v24 = [(NSDictionary *)obj countByEnumeratingWithState:__b objects:v54 count:16];
        if (!v24) {
          goto LABEL_20;
        }
      }
    }
  }
  else
  {
LABEL_20:
    int v38 = 0;
  }

  if (!v38)
  {
    id v12 = objc_alloc((Class)MLDictionaryFeatureProvider);
    id v28 = [v12 initWithDictionary:v42 error:v44];
    id v27 = [&__NSArray0__struct mutableCopy];
    [v27 addObject:v28];
    v47->_currentIndex += v45;
    if (v47->_currentIndex + v45 > v47->_length) {
      v47->_int64_t currentIndex = 0;
    }
    id v48 = [objc_alloc((Class)MLArrayBatchProvider) initWithFeatureProviderArray:v27];
    int v38 = 1;
    objc_storeStrong(&v27, 0);
    objc_storeStrong(&v28, 0);
  }
  objc_storeStrong(&v42, 0);
  objc_storeStrong(&location, 0);
  v13 = v48;

  return v13;
}

- (void).cxx_destruct
{
}

@end
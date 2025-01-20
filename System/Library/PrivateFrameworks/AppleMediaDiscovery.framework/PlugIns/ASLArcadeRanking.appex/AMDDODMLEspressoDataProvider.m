@interface AMDDODMLEspressoDataProvider
- (AMDDODMLEspressoDataProvider)initWithInputs:(int64_t)a3 featureSizeMap:(id)a4 inputDictionary:(id)a5;
- (id)bindDataToInputsDirectly:(id)a3 batchSize:(int64_t)a4 error:(id *)a5 errorDomain:(id)a6;
- (int64_t)count;
- (int64_t)numberOfDataPoints;
- (int64_t)numberOfIterationsPerEpoch:(int64_t)a3;
@end

@implementation AMDDODMLEspressoDataProvider

- (AMDDODMLEspressoDataProvider)initWithInputs:(int64_t)a3 featureSizeMap:(id)a4 inputDictionary:(id)a5
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

- (id)bindDataToInputsDirectly:(id)a3 batchSize:(int64_t)a4 error:(id *)a5 errorDomain:(id)a6
{
  v44 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  unint64_t v42 = a4;
  v41 = a5;
  id v40 = 0;
  objc_storeStrong(&v40, a6);
  memset(__b, 0, sizeof(__b));
  id v26 = location[0];
  id v27 = [v26 countByEnumeratingWithState:__b objects:v50 count:16];
  if (v27)
  {
    uint64_t v20 = *(void *)__b[2];
    uint64_t v21 = 0;
    id v22 = v27;
    while (1)
    {
      uint64_t v19 = v21;
      if (*(void *)__b[2] != v20) {
        objc_enumerationMutation(v26);
      }
      uint64_t v39 = *(void *)(__b[1] + 8 * v21);
      v37 = 0;
      id v17 = [location[0] objectForKeyedSubscript:v39];
      v18 = (uint64_t *)[v17 mutableBytes];

      v37 = v18;
      id v36 = [(NSDictionary *)v44->_inputDictionary objectForKey:v39];
      if (v36)
      {
        id v34 = [(NSDictionary *)v44->_featureSizeMap objectForKey:v39];
        if (v34)
        {
          id v10 = [v34 longValue];
          if (v37[2] * v37[3] * v37[4] * v37[5] == (void)v10 * v42)
          {
            uint64_t v33 = *v37;
            unint64_t v32 = (unint64_t)[v36 length] / 4;
            for (unint64_t i = 0; i < v42; ++i)
            {
              unint64_t v30 = (unint64_t)[v34 longValue];
              for (unint64_t j = 0; j < v30; ++j)
              {
                unint64_t v28 = v44->_currentIndex * v30 + i * v30 + j;
                if (v28 >= v32)
                {
                  id v13 = objc_alloc((Class)NSError);
                  id v14 = [v13 initWithDomain:v40 code:91 userInfo:0];
                  id *v41 = v14;
                  v45 = 0;
                  int v35 = 1;
                  goto LABEL_20;
                }
                uint64_t v47 = 4 * v28;
                uint64_t v46 = 4;
                uint64_t v48 = 4 * v28;
                uint64_t v49 = 4;
                objc_msgSend(v36, "getBytes:range:", v33 + 4 * (i * v30 + j), 4 * v28, 4);
              }
            }
            int v35 = 0;
          }
          else
          {
            id v11 = objc_alloc((Class)NSError);
            id v12 = [v11 initWithDomain:v40 code:82 userInfo:0];
            id *v41 = v12;
            v45 = 0;
            int v35 = 1;
          }
        }
        else
        {
          id v8 = objc_alloc((Class)NSError);
          id v9 = [v8 initWithDomain:v40 code:80 userInfo:0];
          id *v41 = v9;
          v45 = 0;
          int v35 = 1;
        }
LABEL_20:
        objc_storeStrong(&v34, 0);
      }
      else
      {
        id v6 = objc_alloc((Class)NSError);
        id v7 = [v6 initWithDomain:v40 code:81 userInfo:0];
        id *v41 = v7;
        v45 = 0;
        int v35 = 1;
      }
      objc_storeStrong(&v36, 0);
      if (v35) {
        break;
      }
      ++v21;
      if (v19 + 1 >= (unint64_t)v22)
      {
        uint64_t v21 = 0;
        id v22 = [v26 countByEnumeratingWithState:__b objects:v50 count:16];
        if (!v22) {
          goto LABEL_24;
        }
      }
    }
  }
  else
  {
LABEL_24:
    int v35 = 0;
  }

  if (!v35)
  {
    v44->_currentIndex += v42;
    if ((int64_t)(v44->_currentIndex + v42) > v44->_length) {
      v44->_currentIndex = 0;
    }
    v45 = +[NSNumber numberWithLong:1];
    int v35 = 1;
  }
  objc_storeStrong(&v40, 0);
  objc_storeStrong(location, 0);
  v15 = v45;

  return v15;
}

- (void).cxx_destruct
{
}

@end
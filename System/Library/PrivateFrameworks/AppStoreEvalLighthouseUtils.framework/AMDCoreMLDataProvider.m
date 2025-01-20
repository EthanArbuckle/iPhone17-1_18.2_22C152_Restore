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
  uint64_t v56 = *MEMORY[0x263EF8340];
  v48 = self;
  SEL v47 = a2;
  int64_t v46 = a3;
  v45 = a4;
  id location = 0;
  objc_storeStrong(&location, a5);
  id v43 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  memset(__b, 0, sizeof(__b));
  obj = v48->_featureSizeMap;
  uint64_t v27 = [(NSDictionary *)obj countByEnumeratingWithState:__b objects:v55 count:16];
  if (v27)
  {
    uint64_t v23 = *(void *)__b[2];
    uint64_t v24 = 0;
    unint64_t v25 = v27;
    while (1)
    {
      uint64_t v22 = v24;
      if (*(void *)__b[2] != v23) {
        objc_enumerationMutation(obj);
      }
      uint64_t v42 = *(void *)(__b[1] + 8 * v24);
      id v40 = [(NSDictionary *)v48->_featureSizeMap objectForKey:v42];
      if (v40)
      {
        id v38 = [(NSDictionary *)v48->_inputDictionary objectForKey:v42];
        if (v38)
        {
          uint64_t v37 = 0;
          int64_t currentIndex = v48->_currentIndex;
          uint64_t v37 = 4 * currentIndex * [v40 longValue];
          uint64_t v36 = 0;
          int64_t v20 = v46;
          uint64_t v36 = 4 * v20 * [v40 longValue];
          unint64_t v35 = v37 + v36;
          unint64_t v21 = v37;
          if (v21 >= [v38 length]) {
            goto LABEL_11;
          }
          unint64_t v18 = v35;
          if (v18 <= [v38 length])
          {
            id v34 = objc_alloc_init(MEMORY[0x263EFF980]);
            for (int i = v37; i < v35; i += 4)
            {
              int v32 = 0;
              uint64_t v51 = i;
              uint64_t v50 = 4;
              uint64_t v52 = i;
              uint64_t v53 = 4;
              v31[1] = (id)i;
              v31[2] = (id)4;
              objc_msgSend(v38, "getBytes:range:", &v32, i, 4);
              LODWORD(v11) = v32;
              v31[0] = (id)[NSNumber numberWithFloat:v11];
              [v34 addObject:v31[0]];
              objc_storeStrong(v31, 0);
            }
            v15 = (void *)MEMORY[0x263F00DA8];
            id v17 = (id)[NSNumber numberWithInteger:v46];
            v54[0] = v17;
            v54[1] = v40;
            id v16 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v54 count:2];
            id v30 = (id)objc_msgSend(v15, "doubleMultiArrayWithShape:valueArray:error:");

            [v43 setObject:v30 forKey:v42];
            objc_storeStrong(&v30, 0);
            objc_storeStrong(&v34, 0);
            int v39 = 0;
          }
          else
          {
LABEL_11:
            id v9 = objc_alloc(MEMORY[0x263F087E8]);
            id v10 = (id)[v9 initWithDomain:location code:91 userInfo:0];
            id *v45 = v10;
            uint64_t v49 = 0;
            int v39 = 1;
          }
        }
        else
        {
          id v7 = objc_alloc(MEMORY[0x263F087E8]);
          id v8 = (id)[v7 initWithDomain:location code:81 userInfo:0];
          id *v45 = v8;
          uint64_t v49 = 0;
          int v39 = 1;
        }
        objc_storeStrong(&v38, 0);
      }
      else
      {
        id v5 = objc_alloc(MEMORY[0x263F087E8]);
        id v6 = (id)[v5 initWithDomain:location code:80 userInfo:0];
        id *v45 = v6;
        uint64_t v49 = 0;
        int v39 = 1;
      }
      objc_storeStrong(&v40, 0);
      if (v39) {
        break;
      }
      ++v24;
      if (v22 + 1 >= v25)
      {
        uint64_t v24 = 0;
        unint64_t v25 = [(NSDictionary *)obj countByEnumeratingWithState:__b objects:v55 count:16];
        if (!v25) {
          goto LABEL_20;
        }
      }
    }
  }
  else
  {
LABEL_20:
    int v39 = 0;
  }

  if (!v39)
  {
    id v12 = objc_alloc(MEMORY[0x263F00D38]);
    id v29 = (id)[v12 initWithDictionary:v43 error:v45];
    id v28 = (id)[MEMORY[0x263EFFA68] mutableCopy];
    [v28 addObject:v29];
    v48->_currentIndex += v46;
    if (v48->_currentIndex + v46 > v48->_length) {
      v48->_int64_t currentIndex = 0;
    }
    uint64_t v49 = [objc_alloc(MEMORY[0x263F00D10]) initWithFeatureProviderArray:v28];
    int v39 = 1;
    objc_storeStrong(&v28, 0);
    objc_storeStrong(&v29, 0);
  }
  objc_storeStrong(&v43, 0);
  objc_storeStrong(&location, 0);
  v13 = (void *)v49;
  return v13;
}

- (void).cxx_destruct
{
}

@end
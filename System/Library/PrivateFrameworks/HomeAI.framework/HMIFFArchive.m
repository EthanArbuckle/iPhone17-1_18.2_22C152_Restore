@interface HMIFFArchive
- (HMIFFArchive)initWithJSONPath:(id)a3 error:(id *)a4;
- (NSArray)allPersons;
- (NSArray)allPersonsAndFaceCrops;
- (NSArray)homePersons;
- (NSArray)homePersonsAndFaceCrops;
- (NSArray)photosPersons;
- (NSArray)photosPersonsAndFaceCrops;
- (NSDictionary)ffData;
- (id)faceCropsForPerson:(id)a3;
- (id)sourceUUIDForPerson:(id)a3;
@end

@implementation HMIFFArchive

- (HMIFFArchive)initWithJSONPath:(id)a3 error:(id *)a4
{
  v35[8] = *MEMORY[0x263EF8340];
  id v6 = a3;
  v34.receiver = self;
  v34.super_class = (Class)HMIFFArchive;
  v7 = [(HMIFFArchive *)&v34 init];
  if (v7)
  {
    v8 = (void *)MEMORY[0x263EFF8F8];
    v9 = [NSURL fileURLWithPath:v6];
    v10 = [v8 dataWithContentsOfURL:v9];

    if (v10)
    {
      v35[0] = objc_opt_class();
      v35[1] = objc_opt_class();
      v35[2] = objc_opt_class();
      v35[3] = objc_opt_class();
      v35[4] = objc_opt_class();
      v35[5] = objc_opt_class();
      v35[6] = objc_opt_class();
      v35[7] = objc_opt_class();
      v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v35 count:8];
      v12 = (void *)MEMORY[0x263F08928];
      v13 = [MEMORY[0x263EFFA08] setWithArray:v11];
      id v33 = 0;
      v14 = [v12 unarchivedObjectOfClasses:v13 fromData:v10 error:&v33];
      id v15 = v33;

      if (v14)
      {
        objc_storeStrong((id *)&v7->_ffData, v14);
        v16 = [(HMIFFArchive *)v7 ffData];
        uint64_t v17 = [v16 objectForKeyedSubscript:@"homePersonsAndFaceCrops"];
        homePersonsAndFaceCrops = v7->_homePersonsAndFaceCrops;
        v7->_homePersonsAndFaceCrops = (NSArray *)v17;

        v19 = [(HMIFFArchive *)v7 ffData];
        uint64_t v20 = [v19 objectForKeyedSubscript:@"photosPersonsAndFaceCrops"];
        photosPersonsAndFaceCrops = v7->_photosPersonsAndFaceCrops;
        v7->_photosPersonsAndFaceCrops = (NSArray *)v20;

        v22 = [(HMIFFArchive *)v7 homePersonsAndFaceCrops];

        if (v22)
        {
          v23 = [(HMIFFArchive *)v7 homePersonsAndFaceCrops];
          v24 = [(HMIFFArchive *)v7 photosPersonsAndFaceCrops];
          uint64_t v25 = [v23 arrayByAddingObjectsFromArray:v24];
          allPersonsAndFaceCrops = v7->_allPersonsAndFaceCrops;
          v7->_allPersonsAndFaceCrops = (NSArray *)v25;
        }
        else
        {
          uint64_t v29 = [(HMIFFArchive *)v7 photosPersonsAndFaceCrops];
          v30 = v7->_allPersonsAndFaceCrops;
          v7->_allPersonsAndFaceCrops = (NSArray *)v29;
        }
      }
      else
      {
        if (a4) {
          *a4 = v15;
        }
        HMIErrorLogC(v15);
      }

      if (v14) {
        goto LABEL_14;
      }
    }
    else
    {
      v27 = [MEMORY[0x263F087E8] hmiErrorWithCode:-1 description:@"Failed to read json file"];
      v28 = v27;
      if (a4) {
        *a4 = v27;
      }
      HMIErrorLogC(v28);
    }
    v31 = 0;
    goto LABEL_16;
  }
LABEL_14:
  v31 = v7;
LABEL_16:

  return v31;
}

- (NSArray)photosPersons
{
  v2 = [(HMIFFArchive *)self photosPersonsAndFaceCrops];
  v3 = objc_msgSend(v2, "na_map:", &__block_literal_global_27);

  return (NSArray *)v3;
}

uint64_t __29__HMIFFArchive_photosPersons__block_invoke(uint64_t a1, void *a2)
{
  return [a2 objectForKeyedSubscript:@"person"];
}

- (NSArray)homePersons
{
  v2 = [(HMIFFArchive *)self homePersonsAndFaceCrops];
  v3 = objc_msgSend(v2, "na_map:", &__block_literal_global_60);

  return (NSArray *)v3;
}

uint64_t __27__HMIFFArchive_homePersons__block_invoke(uint64_t a1, void *a2)
{
  return [a2 objectForKeyedSubscript:@"person"];
}

- (NSArray)allPersons
{
  v2 = [(HMIFFArchive *)self allPersonsAndFaceCrops];
  v3 = objc_msgSend(v2, "na_map:", &__block_literal_global_62);

  return (NSArray *)v3;
}

uint64_t __26__HMIFFArchive_allPersons__block_invoke(uint64_t a1, void *a2)
{
  return [a2 objectForKeyedSubscript:@"person"];
}

- (id)faceCropsForPerson:(id)a3
{
  id v4 = a3;
  v5 = [(HMIFFArchive *)self allPersonsAndFaceCrops];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __35__HMIFFArchive_faceCropsForPerson___block_invoke;
  v10[3] = &unk_26477C5F0;
  id v11 = v4;
  id v6 = v4;
  v7 = objc_msgSend(v5, "na_firstObjectPassingTest:", v10);

  if (v7)
  {
    v8 = [v7 objectForKeyedSubscript:@"faceCrops"];
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

uint64_t __35__HMIFFArchive_faceCropsForPerson___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  v3 = [a2 objectForKeyedSubscript:@"person"];
  uint64_t v4 = [v2 isEqual:v3];

  return v4;
}

- (id)sourceUUIDForPerson:(id)a3
{
  id v4 = a3;
  v5 = [(HMIFFArchive *)self allPersonsAndFaceCrops];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __36__HMIFFArchive_sourceUUIDForPerson___block_invoke;
  v10[3] = &unk_26477C5F0;
  id v11 = v4;
  id v6 = v4;
  v7 = objc_msgSend(v5, "na_firstObjectPassingTest:", v10);

  if (v7)
  {
    v8 = [v7 objectForKeyedSubscript:@"sourceUUID"];
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

uint64_t __36__HMIFFArchive_sourceUUIDForPerson___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  v3 = [a2 objectForKeyedSubscript:@"person"];
  uint64_t v4 = [v2 isEqual:v3];

  return v4;
}

- (NSDictionary)ffData
{
  return (NSDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (NSArray)homePersonsAndFaceCrops
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (NSArray)photosPersonsAndFaceCrops
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (NSArray)allPersonsAndFaceCrops
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allPersonsAndFaceCrops, 0);
  objc_storeStrong((id *)&self->_photosPersonsAndFaceCrops, 0);
  objc_storeStrong((id *)&self->_homePersonsAndFaceCrops, 0);
  objc_storeStrong((id *)&self->_ffData, 0);
}

@end
@interface DTGPUAPSDataContainer
+ (BOOL)supportsSecureCoding;
+ (id)fromData:(id)a3 error:(id *)a4;
- (DTGPUAPSDataContainer)initWithCoder:(id)a3;
- (DTGPUAPSDataContainer)initWithConfig:(id)a3 baseFolder:(id)a4;
- (NSDictionary)config;
- (id)encode;
- (id)getData:(id)a3;
- (unint64_t)numBuffersAtRDEIndex:(unint64_t)a3;
- (unint64_t)numRDEs;
- (unint64_t)numUSCs;
- (void)addConfigEntry:(id)a3 value:(id)a4;
- (void)addCustomData:(id)a3 data:(id)a4;
- (void)addDataForRDESourceIndex:(unsigned int)a3 bufferIndex:(unsigned int)a4 data:(id)a5;
- (void)addDataForUSCAtIndex:(unsigned int)a3 data:(id)a4;
- (void)encodeWithCoder:(id)a3;
- (void)enumerateRDEData:(id)a3;
- (void)enumerateUSCData:(id)a3;
@end

@implementation DTGPUAPSDataContainer

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)fromData:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = (void *)[objc_alloc(MEMORY[0x263F08928]) initForReadingFromData:v5 error:a4];
  [v6 setClass:objc_opt_class() forClassName:@"XRGPUAPSDataContainer"];
  v7 = [v6 decodeObjectOfClass:objc_opt_class() forKey:*MEMORY[0x263F081D0]];

  return v7;
}

- (DTGPUAPSDataContainer)initWithCoder:(id)a3
{
  v33[7] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)DTGPUAPSDataContainer;
  id v5 = [(DTGPUAPSDataContainer *)&v32 init];
  if (v5)
  {
    v6 = (void *)MEMORY[0x263EFFA08];
    v33[0] = objc_opt_class();
    v33[1] = objc_opt_class();
    v33[2] = objc_opt_class();
    v33[3] = objc_opt_class();
    v33[4] = objc_opt_class();
    v33[5] = objc_opt_class();
    v33[6] = objc_opt_class();
    v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v33 count:7];
    v8 = [v6 setWithArray:v7];

    v9 = [v4 decodeObjectOfClasses:v8 forKey:@"config"];
    v10 = [v4 decodeObjectOfClasses:v8 forKey:@"data"];
    v11 = [v4 decodeObjectOfClasses:v8 forKey:@"uscFiles"];
    v12 = [v4 decodeObjectOfClasses:v8 forKey:@"rdeFiles"];
    v13 = [v4 decodeObjectOfClasses:v8 forKey:@"customFiles"];
    v14 = (void *)MEMORY[0x263EFFA78];
    if (v9) {
      v15 = v9;
    }
    else {
      v15 = (void *)MEMORY[0x263EFFA78];
    }
    uint64_t v16 = [MEMORY[0x263EFF9A0] dictionaryWithDictionary:v15];
    config = v5->_config;
    v5->_config = (NSMutableDictionary *)v16;

    if (v10) {
      v18 = v10;
    }
    else {
      v18 = v14;
    }
    uint64_t v19 = [MEMORY[0x263EFF9A0] dictionaryWithDictionary:v18];
    data = v5->_data;
    v5->_data = (NSMutableDictionary *)v19;

    v21 = (void *)MEMORY[0x263EFFA68];
    if (v11) {
      v22 = v11;
    }
    else {
      v22 = (void *)MEMORY[0x263EFFA68];
    }
    uint64_t v23 = [MEMORY[0x263EFF980] arrayWithArray:v22];
    uscFiles = v5->_uscFiles;
    v5->_uscFiles = (NSMutableArray *)v23;

    if (v12) {
      v25 = v12;
    }
    else {
      v25 = v21;
    }
    uint64_t v26 = [MEMORY[0x263EFF980] arrayWithArray:v25];
    rdeFiles = v5->_rdeFiles;
    v5->_rdeFiles = (NSMutableArray *)v26;

    if (v13) {
      v28 = v13;
    }
    else {
      v28 = v21;
    }
    uint64_t v29 = [MEMORY[0x263EFF980] arrayWithArray:v28];
    customFiles = v5->_customFiles;
    v5->_customFiles = (NSMutableArray *)v29;
  }
  return v5;
}

- (DTGPUAPSDataContainer)initWithConfig:(id)a3 baseFolder:(id)a4
{
  uint64_t v55 = *MEMORY[0x263EF8340];
  id v40 = a3;
  id v43 = a4;
  v52.receiver = self;
  v52.super_class = (Class)DTGPUAPSDataContainer;
  v6 = [(DTGPUAPSDataContainer *)&v52 init];
  if (v6)
  {
    uint64_t v7 = [MEMORY[0x263EFF9A0] dictionaryWithDictionary:v40];
    config = v6->_config;
    v6->_config = (NSMutableDictionary *)v7;

    uint64_t v9 = objc_opt_new();
    data = v6->_data;
    v6->_data = (NSMutableDictionary *)v9;

    uint64_t v11 = objc_opt_new();
    uscFiles = v6->_uscFiles;
    v6->_uscFiles = (NSMutableArray *)v11;

    uint64_t v13 = objc_opt_new();
    rdeFiles = v6->_rdeFiles;
    v6->_rdeFiles = (NSMutableArray *)v13;

    uint64_t v15 = objc_opt_new();
    customFiles = v6->_customFiles;
    v6->_customFiles = (NSMutableArray *)v15;

    if (v43)
    {
      v42 = [MEMORY[0x263F08850] defaultManager];
      [v40 objectForKeyedSubscript:@"APSFiles"];
      long long v50 = 0u;
      long long v51 = 0u;
      long long v48 = 0u;
      long long v49 = 0u;
      obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v17 = [obj countByEnumeratingWithState:&v48 objects:v54 count:16];
      if (v17)
      {
        uint64_t v18 = *(void *)v49;
        while (2)
        {
          for (uint64_t i = 0; i != v17; ++i)
          {
            if (*(void *)v49 != v18) {
              objc_enumerationMutation(obj);
            }
            v20 = *(void **)(*((void *)&v48 + 1) + 8 * i);
            v21 = [v20 objectForKeyedSubscript:@"USCIndex"];
            uint64_t v22 = [v21 unsignedIntValue];

            uint64_t v23 = [v20 objectForKeyedSubscript:@"File"];
            v24 = [v43 stringByAppendingPathComponent:v23];
            if (([v42 fileExistsAtPath:v24] & 1) == 0
              || ([MEMORY[0x263EFF8F8] dataWithContentsOfFile:v24],
                  (v25 = objc_claimAutoreleasedReturnValue()) == 0))
            {

LABEL_25:
              v37 = 0;
              goto LABEL_26;
            }
            [(DTGPUAPSDataContainer *)v6 addDataForUSCAtIndex:v22 data:v25];
          }
          uint64_t v17 = [obj countByEnumeratingWithState:&v48 objects:v54 count:16];
          if (v17) {
            continue;
          }
          break;
        }
      }

      [v40 objectForKeyedSubscript:@"RDEFiles"];
      long long v46 = 0u;
      long long v47 = 0u;
      long long v44 = 0u;
      long long v45 = 0u;
      id v26 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v27 = [v26 countByEnumeratingWithState:&v44 objects:v53 count:16];
      if (v27)
      {
        uint64_t v39 = *(void *)v45;
        while (2)
        {
          for (uint64_t j = 0; j != v27; ++j)
          {
            if (*(void *)v45 != v39) {
              objc_enumerationMutation(v26);
            }
            uint64_t v29 = *(void **)(*((void *)&v44 + 1) + 8 * j);
            v30 = [v29 objectForKeyedSubscript:@"SourceIndex"];
            uint64_t v31 = [v30 unsignedIntValue];

            objc_super v32 = [v29 objectForKeyedSubscript:@"BufferIndex"];
            uint64_t v33 = [v32 unsignedIntValue];

            v34 = [v29 objectForKeyedSubscript:@"File"];
            v35 = [v43 stringByAppendingPathComponent:v34];
            if (([v42 fileExistsAtPath:v35] & 1) == 0
              || ([MEMORY[0x263EFF8F8] dataWithContentsOfFile:v35],
                  (v36 = objc_claimAutoreleasedReturnValue()) == 0))
            {

              goto LABEL_25;
            }
            [(DTGPUAPSDataContainer *)v6 addDataForRDESourceIndex:v31 bufferIndex:v33 data:v36];
          }
          uint64_t v27 = [v26 countByEnumeratingWithState:&v44 objects:v53 count:16];
          if (v27) {
            continue;
          }
          break;
        }
      }
    }
  }
  v37 = v6;
LABEL_26:

  return v37;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeObject:self->_data forKey:@"data"];
  [v4 encodeObject:self->_config forKey:@"config"];
  [v4 encodeObject:self->_customFiles forKey:@"customFiles"];
  [v4 encodeObject:self->_uscFiles forKey:@"uscFiles"];
  [v4 encodeObject:self->_rdeFiles forKey:@"rdeFiles"];
}

- (void)addDataForUSCAtIndex:(unsigned int)a3 data:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  v12[2] = *MEMORY[0x263EF8340];
  id v6 = a4;
  uint64_t v7 = [NSString stringWithFormat:@"XR_GPU_APS_USC_%d", v4];
  uscFiles = self->_uscFiles;
  v11[0] = @"USCIndex";
  uint64_t v9 = [NSNumber numberWithUnsignedInt:v4];
  v11[1] = @"File";
  v12[0] = v9;
  v12[1] = v7;
  v10 = [NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:2];
  [(NSMutableArray *)uscFiles addObject:v10];

  [(NSMutableDictionary *)self->_data setObject:v6 forKeyedSubscript:v7];
}

- (void)addDataForRDESourceIndex:(unsigned int)a3 bufferIndex:(unsigned int)a4 data:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  uint64_t v6 = *(void *)&a3;
  v15[3] = *MEMORY[0x263EF8340];
  id v8 = a5;
  uint64_t v9 = [NSString stringWithFormat:@"XR_GPU_APS_RDE_%d_%d", v6, v5];
  rdeFiles = self->_rdeFiles;
  v14[0] = @"BufferIndex";
  uint64_t v11 = [NSNumber numberWithUnsignedInt:v5];
  v15[0] = v11;
  v14[1] = @"SourceIndex";
  v12 = [NSNumber numberWithUnsignedInt:v6];
  v14[2] = @"File";
  v15[1] = v12;
  v15[2] = v9;
  uint64_t v13 = [NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:3];
  [(NSMutableArray *)rdeFiles addObject:v13];

  [(NSMutableDictionary *)self->_data setObject:v8 forKeyedSubscript:v9];
}

- (void)addCustomData:(id)a3 data:(id)a4
{
  v11[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  [(NSMutableDictionary *)self->_data setObject:v7 forKeyedSubscript:v6];
  customFiles = self->_customFiles;
  v10 = @"File";
  v11[0] = v6;
  uint64_t v9 = [NSDictionary dictionaryWithObjects:v11 forKeys:&v10 count:1];
  [(NSMutableArray *)customFiles addObject:v9];

  [(NSMutableDictionary *)self->_data setObject:v7 forKeyedSubscript:v6];
}

- (id)encode
{
  [(NSMutableDictionary *)self->_config setObject:self->_uscFiles forKeyedSubscript:@"APSFiles"];
  [(NSMutableDictionary *)self->_config setObject:self->_rdeFiles forKeyedSubscript:@"RDEFiles"];
  [(NSMutableDictionary *)self->_config setObject:self->_customFiles forKeyedSubscript:@"CustomFiles"];
  v3 = (void *)MEMORY[0x263F08910];
  return (id)[v3 archivedDataWithRootObject:self requiringSecureCoding:1 error:0];
}

- (NSDictionary)config
{
  [(NSMutableDictionary *)self->_config setObject:self->_uscFiles forKeyedSubscript:@"APSFiles"];
  [(NSMutableDictionary *)self->_config setObject:self->_rdeFiles forKeyedSubscript:@"RDEFiles"];
  [(NSMutableDictionary *)self->_config setObject:self->_customFiles forKeyedSubscript:@"CustomFiles"];
  config = self->_config;
  return (NSDictionary *)config;
}

- (void)enumerateUSCData:(id)a3
{
  id v4 = a3;
  uscFiles = self->_uscFiles;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_2308D2A50;
  v7[3] = &unk_264B8F4F0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(NSMutableArray *)uscFiles enumerateObjectsUsingBlock:v7];
}

- (void)enumerateRDEData:(id)a3
{
  id v4 = a3;
  rdeFiles = self->_rdeFiles;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_2308D2BF8;
  v7[3] = &unk_264B8F4F0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(NSMutableArray *)rdeFiles enumerateObjectsUsingBlock:v7];
}

- (id)getData:(id)a3
{
  v3 = [(NSMutableDictionary *)self->_data objectForKeyedSubscript:a3];
  return v3;
}

- (unint64_t)numUSCs
{
  return [(NSMutableArray *)self->_uscFiles count];
}

- (unint64_t)numRDEs
{
  return [(NSMutableArray *)self->_rdeFiles count];
}

- (unint64_t)numBuffersAtRDEIndex:(unint64_t)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v4 = self->_rdeFiles;
  unint64_t v5 = 0;
  uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        v10 = [v9 objectForKeyedSubscript:@"SourceIndex"];
        BOOL v11 = [v10 unsignedIntValue] == a3;

        if (v11)
        {
          v12 = [v9 objectForKeyedSubscript:@"BufferIndex"];
          unsigned int v13 = [v12 unsignedIntValue];

          if (v5 <= v13) {
            unint64_t v5 = v13;
          }
        }
      }
      uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v6);
  }

  return v5;
}

- (void)addConfigEntry:(id)a3 value:(id)a4
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customFiles, 0);
  objc_storeStrong((id *)&self->_rdeFiles, 0);
  objc_storeStrong((id *)&self->_uscFiles, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_config, 0);
}

@end
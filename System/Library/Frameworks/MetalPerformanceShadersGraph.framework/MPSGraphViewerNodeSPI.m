@interface MPSGraphViewerNodeSPI
- (MPSGraphViewerNodeSPI)initWithJSONDictionary:(id)a3;
- (MPSGraphViewerNodeSPI)initWithType:(id)a3 inputs:(id)a4 outputs:(id)a5 properties:(id)a6 regions:(id)a7;
- (NSArray)inputs;
- (NSArray)outputs;
- (NSArray)properties;
- (NSArray)regions;
- (NSString)localizedDescription;
- (NSString)type;
- (id)jsonDictionary;
- (void)setLocalizedDescription:(id)a3;
@end

@implementation MPSGraphViewerNodeSPI

- (MPSGraphViewerNodeSPI)initWithType:(id)a3 inputs:(id)a4 outputs:(id)a5 properties:(id)a6 regions:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v20 = a7;
  v21.receiver = self;
  v21.super_class = (Class)MPSGraphViewerNodeSPI;
  v17 = [(MPSGraphViewerNodeSPI *)&v21 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_type, a3);
    objc_storeStrong((id *)&v18->_inputs, a4);
    objc_storeStrong((id *)&v18->_outputs, a5);
    objc_storeStrong((id *)&v18->_properties, a6);
    objc_storeStrong((id *)&v18->_regions, a7);
  }

  return v18;
}

- (MPSGraphViewerNodeSPI)initWithJSONDictionary:(id)a3
{
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  id v47 = a3;
  v69.receiver = self;
  v69.super_class = (Class)MPSGraphViewerNodeSPI;
  v4 = [(MPSGraphViewerNodeSPI *)&v69 init];
  v46 = v4;
  if (v4)
  {
    uint64_t v5 = [v47 objectForKey:@"type"];
    type = v4->_type;
    v4->_type = (NSString *)v5;

    id v52 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    [v47 objectForKey:@"inputs"];
    long long v67 = 0u;
    long long v68 = 0u;
    long long v65 = 0u;
    long long v66 = 0u;
    obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v7 = [obj countByEnumeratingWithState:&v65 objects:v73 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v66;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v66 != v8) {
            objc_enumerationMutation(obj);
          }
          v10 = [[MPSGraphViewerNodePortSPI alloc] initWithJSONDictionary:*(void *)(*((void *)&v65 + 1) + 8 * i)];
          [v52 addObject:v10];
        }
        uint64_t v7 = [obj countByEnumeratingWithState:&v65 objects:v73 count:16];
      }
      while (v7);
    }

    uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithArray:v52];
    inputs = v46->_inputs;
    v46->_inputs = (NSArray *)v11;

    id v51 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    [v47 objectForKey:@"outputs"];
    long long v63 = 0u;
    long long v64 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    id v49 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v13 = [v49 countByEnumeratingWithState:&v61 objects:v72 count:16];
    if (v13)
    {
      uint64_t v14 = *(void *)v62;
      do
      {
        for (uint64_t j = 0; j != v13; ++j)
        {
          if (*(void *)v62 != v14) {
            objc_enumerationMutation(v49);
          }
          id v16 = [[MPSGraphViewerNodePortSPI alloc] initWithJSONDictionary:*(void *)(*((void *)&v61 + 1) + 8 * j)];
          [v51 addObject:v16];
        }
        uint64_t v13 = [v49 countByEnumeratingWithState:&v61 objects:v72 count:16];
      }
      while (v13);
    }

    uint64_t v17 = [MEMORY[0x1E4F1C978] arrayWithArray:v51];
    outputs = v46->_outputs;
    v46->_outputs = (NSArray *)v17;

    id v19 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    [v47 objectForKey:@"properties"];
    long long v59 = 0u;
    long long v60 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    id v48 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v20 = [v48 countByEnumeratingWithState:&v57 objects:v71 count:16];
    if (v20)
    {
      uint64_t v21 = *(void *)v58;
      do
      {
        uint64_t v22 = 0;
        do
        {
          if (*(void *)v58 != v21) {
            objc_enumerationMutation(v48);
          }
          v23 = *(void **)(*((void *)&v57 + 1) + 8 * v22);
          v24 = [v23 objectForKey:@"type"];
          if (!v24)
          {
            v28 = [v23 objectForKey:@"isEnum"];
            v27 = v28;
            if (v28 && [(MPSGraphViewerNodePropertyStringSPI *)v28 BOOLValue])
            {
              v29 = [[MPSGraphViewerNodePropertyEnumSPI alloc] initWithJSONDictionary:v23];
              [v19 addObject:v29];
            }
            else
            {
              v29 = [[MPSGraphViewerNodePropertyDataSPI alloc] initWithJSONDictionary:v23];
              [v19 addObject:v29];
            }

            goto LABEL_31;
          }
          v25 = +[MPSGraphViewerNodePropertyStringSPI type];
          int v26 = [v24 isEqualToString:v25];

          if (v26)
          {
            v27 = [[MPSGraphViewerNodePropertyStringSPI alloc] initWithJSONDictionary:v23];
            [v19 addObject:v27];
LABEL_31:

            goto LABEL_32;
          }
          v30 = +[MPSGraphViewerNodePropertyEnumSPI type];
          int v31 = [v24 isEqualToString:v30];

          if (v31)
          {
            v27 = [[MPSGraphViewerNodePropertyEnumSPI alloc] initWithJSONDictionary:v23];
            [v19 addObject:v27];
            goto LABEL_31;
          }
          v32 = +[MPSGraphViewerNodePropertyDataSPI type];
          int v33 = [v24 isEqualToString:v32];

          if (v33)
          {
            v27 = [[MPSGraphViewerNodePropertyDataSPI alloc] initWithJSONDictionary:v23];
            [v19 addObject:v27];
            goto LABEL_31;
          }
LABEL_32:

          ++v22;
        }
        while (v20 != v22);
        uint64_t v34 = [v48 countByEnumeratingWithState:&v57 objects:v71 count:16];
        uint64_t v20 = v34;
      }
      while (v34);
    }

    uint64_t v35 = [MEMORY[0x1E4F1C978] arrayWithArray:v19];
    properties = v46->_properties;
    v46->_properties = (NSArray *)v35;

    id v37 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    [v47 objectForKey:@"regions"];
    long long v55 = 0u;
    long long v56 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    id v38 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v39 = [v38 countByEnumeratingWithState:&v53 objects:v70 count:16];
    if (v39)
    {
      uint64_t v40 = *(void *)v54;
      do
      {
        for (uint64_t k = 0; k != v39; ++k)
        {
          if (*(void *)v54 != v40) {
            objc_enumerationMutation(v38);
          }
          v42 = [[MPSGraphViewerNodeRegionSPI alloc] initWithJSONDictionary:*(void *)(*((void *)&v53 + 1) + 8 * k)];
          [v37 addObject:v42];
        }
        uint64_t v39 = [v38 countByEnumeratingWithState:&v53 objects:v70 count:16];
      }
      while (v39);
    }

    uint64_t v43 = [MEMORY[0x1E4F1C978] arrayWithArray:v37];
    regions = v46->_regions;
    v46->_regions = (NSArray *)v43;
  }
  return v46;
}

- (id)jsonDictionary
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  v4 = [(MPSGraphViewerNodeSPI *)self inputs];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v42 objects:v51 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v43;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v43 != v6) {
          objc_enumerationMutation(v4);
        }
        uint64_t v8 = [*(id *)(*((void *)&v42 + 1) + 8 * i) jsonDictionary];
        [v3 addObject:v8];
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v42 objects:v51 count:16];
    }
    while (v5);
  }

  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  v10 = [(MPSGraphViewerNodeSPI *)self outputs];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v38 objects:v50 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v39;
    do
    {
      for (uint64_t j = 0; j != v11; ++j)
      {
        if (*(void *)v39 != v12) {
          objc_enumerationMutation(v10);
        }
        uint64_t v14 = [*(id *)(*((void *)&v38 + 1) + 8 * j) jsonDictionary];
        [v9 addObject:v14];
      }
      uint64_t v11 = [v10 countByEnumeratingWithState:&v38 objects:v50 count:16];
    }
    while (v11);
  }

  id v15 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v16 = [(MPSGraphViewerNodeSPI *)self properties];
  uint64_t v17 = [v16 countByEnumeratingWithState:&v34 objects:v49 count:16];
  if (v17)
  {
    uint64_t v18 = *(void *)v35;
    do
    {
      for (uint64_t k = 0; k != v17; ++k)
      {
        if (*(void *)v35 != v18) {
          objc_enumerationMutation(v16);
        }
        uint64_t v20 = [*(id *)(*((void *)&v34 + 1) + 8 * k) jsonDictionary];
        [v15 addObject:v20];
      }
      uint64_t v17 = [v16 countByEnumeratingWithState:&v34 objects:v49 count:16];
    }
    while (v17);
  }

  id v21 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  uint64_t v22 = [(MPSGraphViewerNodeSPI *)self regions];
  uint64_t v23 = [v22 countByEnumeratingWithState:&v30 objects:v48 count:16];
  if (v23)
  {
    uint64_t v24 = *(void *)v31;
    do
    {
      for (uint64_t m = 0; m != v23; ++m)
      {
        if (*(void *)v31 != v24) {
          objc_enumerationMutation(v22);
        }
        int v26 = [*(id *)(*((void *)&v30 + 1) + 8 * m) jsonDictionary];
        [v21 addObject:v26];
      }
      uint64_t v23 = [v22 countByEnumeratingWithState:&v30 objects:v48 count:16];
    }
    while (v23);
  }

  v46[0] = @"type";
  v27 = [(MPSGraphViewerNodeSPI *)self type];
  v47[0] = v27;
  v47[1] = v3;
  v46[1] = @"inputs";
  v46[2] = @"outputs";
  v47[2] = v9;
  v47[3] = v15;
  v46[3] = @"properties";
  v46[4] = @"regions";
  v47[4] = v21;
  v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v47 forKeys:v46 count:5];

  return v28;
}

- (NSString)type
{
  return self->_type;
}

- (NSArray)inputs
{
  return self->_inputs;
}

- (NSArray)outputs
{
  return self->_outputs;
}

- (NSArray)properties
{
  return self->_properties;
}

- (NSArray)regions
{
  return self->_regions;
}

- (NSString)localizedDescription
{
  return self->_localizedDescription;
}

- (void)setLocalizedDescription:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedDescription, 0);
  objc_storeStrong((id *)&self->_regions, 0);
  objc_storeStrong((id *)&self->_properties, 0);
  objc_storeStrong((id *)&self->_outputs, 0);
  objc_storeStrong((id *)&self->_inputs, 0);

  objc_storeStrong((id *)&self->_type, 0);
}

@end
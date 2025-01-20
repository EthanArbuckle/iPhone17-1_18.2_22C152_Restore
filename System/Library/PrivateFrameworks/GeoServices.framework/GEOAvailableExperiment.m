@interface GEOAvailableExperiment
- (GEOAvailableExperiment)initWithIdentifier:(id)a3 name:(id)a4;
- (NSArray)branches;
- (NSString)identifier;
- (NSString)name;
- (id)_branchForLabel:(id)a3;
- (id)description;
- (void)_addBranch:(id)a3;
@end

@implementation GEOAvailableExperiment

- (GEOAvailableExperiment)initWithIdentifier:(id)a3 name:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)GEOAvailableExperiment;
  v8 = [(GEOAvailableExperiment *)&v15 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    identifier = v8->_identifier;
    v8->_identifier = (NSString *)v9;

    uint64_t v11 = [v7 copy];
    name = v8->_name;
    v8->_name = (NSString *)v11;

    v13 = v8;
  }

  return v8;
}

- (id)description
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1E4F28E78];
  v17.receiver = self;
  v17.super_class = (Class)GEOAvailableExperiment;
  v4 = [(GEOAvailableExperiment *)&v17 description];
  v5 = [v3 stringWithFormat:@"%@ %@ %@\n", v4, self->_identifier, self->_name];

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = self->_branches;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v13 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = [*(id *)(*((void *)&v13 + 1) + 8 * i) _descriptionWithIndent:1];
        [v5 appendFormat:@"\t-> %@\n", v11];
      }
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v13 objects:v18 count:16];
    }
    while (v8);
  }

  return v5;
}

- (void)_addBranch:(id)a3
{
  id v4 = a3;
  branches = self->_branches;
  id v8 = v4;
  if (!branches)
  {
    id v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_branches;
    self->_branches = v6;

    id v4 = v8;
    branches = self->_branches;
  }
  [(NSMutableArray *)branches addObject:v4];
}

- (id)_branchForLabel:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v5 = self->_branches;
  id v6 = (id)[(NSMutableArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        v10 = objc_msgSend(v9, "label", (void)v13);
        char v11 = [v10 isEqualToString:v4];

        if (v11)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[(NSMutableArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)name
{
  return self->_name;
}

- (NSArray)branches
{
  return &self->_branches->super;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_branches, 0);
  objc_storeStrong((id *)&self->_name, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
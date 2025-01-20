@interface MTLStitchedLibraryDescriptorSPI
- (id)description;
- (id)formattedDescription:(unint64_t)a3;
@end

@implementation MTLStitchedLibraryDescriptorSPI

- (id)formattedDescription:(unint64_t)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  unint64_t v4 = a3 + 4;
  uint64_t v5 = [@"\n" stringByPaddingToLength:a3 + 4 withString:@" " startingAtIndex:0];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  v27 = self;
  v6 = [(MTLStitchedLibraryDescriptor *)self functionGraphs];
  uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v33 objects:v39 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    id v9 = 0;
    uint64_t v10 = *(void *)v34;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v34 != v10) {
          objc_enumerationMutation(v6);
        }
        v12 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        if (v9) {
          [v9 appendString:v5];
        }
        else {
          id v9 = (id)objc_opt_new();
        }
        objc_msgSend(v9, "appendString:", objc_msgSend(v12, "formattedDescription:", v4));
      }
      uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v33 objects:v39 count:16];
    }
    while (v8);
  }
  else
  {
    id v9 = 0;
  }
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  v13 = [(MTLStitchedLibraryDescriptor *)self binaryArchives];
  uint64_t v14 = [(NSArray *)v13 countByEnumeratingWithState:&v29 objects:v38 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    id v16 = 0;
    uint64_t v17 = *(void *)v30;
    do
    {
      for (uint64_t j = 0; j != v15; ++j)
      {
        if (*(void *)v30 != v17) {
          objc_enumerationMutation(v13);
        }
        v19 = *(void **)(*((void *)&v29 + 1) + 8 * j);
        if (v16) {
          [v16 appendString:v5];
        }
        else {
          id v16 = (id)objc_opt_new();
        }
        objc_msgSend(v16, "appendString:", objc_msgSend(v19, "formattedDescription:", v4));
      }
      uint64_t v15 = [(NSArray *)v13 countByEnumeratingWithState:&v29 objects:v38 count:16];
    }
    while (v15);
  }
  else
  {
    id v16 = 0;
  }
  v20 = NSString;
  v28.receiver = v27;
  v28.super_class = (Class)MTLStitchedLibraryDescriptorSPI;
  id v21 = [(MTLStitchedLibraryDescriptor *)&v28 description];
  v37[0] = v5;
  v37[1] = @"functionGraphs =";
  v22 = (void *)MEMORY[0x1E4F1CBF0];
  if (v9) {
    id v23 = v9;
  }
  else {
    id v23 = (id)MEMORY[0x1E4F1CBF0];
  }
  v37[2] = v23;
  v37[3] = v5;
  v37[4] = @"functions =";
  uint64_t v24 = [(MTLStitchedLibraryDescriptor *)v27 functions];
  if (!v24) {
    uint64_t v24 = [MEMORY[0x1E4F1CA98] null];
  }
  v37[5] = v24;
  v37[6] = v5;
  if (v16) {
    id v25 = v16;
  }
  else {
    id v25 = v22;
  }
  v37[7] = @"binaryArchives =";
  v37[8] = v25;
  return (id)[v20 stringWithFormat:@"%@%@", v21, objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v37, 9), "componentsJoinedByString:", @" "];
}

- (id)description
{
  return [(MTLStitchedLibraryDescriptorSPI *)self formattedDescription:0];
}

@end
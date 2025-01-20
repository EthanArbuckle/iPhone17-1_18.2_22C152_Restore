@interface MTLStitchedLibraryDescriptor
- (MTLStitchedLibraryDescriptor)init;
- (NSArray)binaryArchives;
- (NSArray)functionGraphs;
- (NSArray)functions;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)formattedDescription:(unint64_t)a3;
- (unint64_t)options;
- (void)dealloc;
- (void)setBinaryArchives:(id)a3;
- (void)setFunctionGraphs:(NSArray *)functionGraphs;
- (void)setFunctions:(NSArray *)functions;
- (void)setOptions:(unint64_t)a3;
@end

@implementation MTLStitchedLibraryDescriptor

- (MTLStitchedLibraryDescriptor)init
{
  v4.receiver = self;
  v4.super_class = (Class)MTLStitchedLibraryDescriptor;
  v2 = [(MTLStitchedLibraryDescriptor *)&v4 init];
  [(MTLStitchedLibraryDescriptor *)v2 setBinaryArchives:MEMORY[0x1E4F1CBF0]];
  return v2;
}

- (void)setBinaryArchives:(id)a3
{
}

- (unint64_t)options
{
  return self->_options;
}

- (NSArray)binaryArchives
{
  return self->_binaryArchives;
}

- (void)setFunctions:(NSArray *)functions
{
}

- (void)setFunctionGraphs:(NSArray *)functionGraphs
{
}

- (NSArray)functions
{
  return self->_functions;
}

- (NSArray)functionGraphs
{
  return self->_functionGraphs;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)MTLStitchedLibraryDescriptor;
  [(MTLStitchedLibraryDescriptor *)&v3 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  [v4 setFunctionGraphs:self->_functionGraphs];
  [v4 setFunctions:self->_functions];
  [v4 setBinaryArchives:self->_binaryArchives];
  [v4 setOptions:self->_options];
  return v4;
}

- (id)formattedDescription:(unint64_t)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  unint64_t v4 = a3 + 4;
  uint64_t v5 = [@"\n" stringByPaddingToLength:a3 + 4 withString:@" " startingAtIndex:0];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  functionGraphs = self->_functionGraphs;
  uint64_t v7 = [(NSArray *)functionGraphs countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    id v9 = 0;
    uint64_t v10 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v20 != v10) {
          objc_enumerationMutation(functionGraphs);
        }
        v12 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        if (v9) {
          [v9 appendString:v5];
        }
        else {
          id v9 = (id)objc_opt_new();
        }
        objc_msgSend(v9, "appendString:", objc_msgSend(v12, "formattedDescription:", v4));
      }
      uint64_t v8 = [(NSArray *)functionGraphs countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v8);
  }
  else
  {
    id v9 = 0;
  }
  v13 = NSString;
  v18.receiver = self;
  v18.super_class = (Class)MTLStitchedLibraryDescriptor;
  id v14 = [(MTLStitchedLibraryDescriptor *)&v18 description];
  v23[0] = v5;
  v23[1] = @"functionGraphs =";
  id v15 = (id)MEMORY[0x1E4F1CBF0];
  if (v9) {
    id v15 = v9;
  }
  v23[2] = v15;
  v23[3] = v5;
  v23[4] = @"functions =";
  functions = self->_functions;
  if (!functions) {
    functions = (NSArray *)[MEMORY[0x1E4F1CA98] null];
  }
  v23[5] = functions;
  return (id)[v13 stringWithFormat:@"%@%@", v14, objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v23, 6), "componentsJoinedByString:", @" "];
}

- (id)description
{
  return [(MTLStitchedLibraryDescriptor *)self formattedDescription:0];
}

- (void)setOptions:(unint64_t)a3
{
  self->_options = a3;
}

@end
@interface ARTechniqueGatherContext
+ (BOOL)supportsSecureCoding;
- (ARTechniqueGatherContext)initWithCoder:(id)a3;
- (ARTechniqueGatherContext)initWithParentContext:(id)a3;
- (NSArray)gatheredData;
- (NSString)description;
- (id)anchorsToAdd;
- (id)anchorsToRemove;
- (id)imageData;
- (id)parentContext;
- (id)resultDataOfClass:(Class)a3;
- (int64_t)cameraPosition;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ARTechniqueGatherContext

- (ARTechniqueGatherContext)initWithParentContext:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ARTechniqueGatherContext;
  v6 = [(ARTechniqueGatherContext *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong(&v6->_parentContext, a3);
  }

  return v7;
}

- (NSArray)gatheredData
{
  return (NSArray *)MEMORY[0x1E4F1CBF0];
}

- (id)imageData
{
  v2 = [(ARTechniqueGatherContext *)self parentContext];
  v3 = [v2 imageData];

  return v3;
}

- (int64_t)cameraPosition
{
  v2 = [(ARTechniqueGatherContext *)self parentContext];
  int64_t v3 = [v2 cameraPosition];

  return v3;
}

- (id)resultDataOfClass:(Class)a3
{
  id v5 = objc_msgSend(self->_parentContext, "resultDataOfClass:");
  v6 = [(ARTechniqueGatherContext *)self gatheredData];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __46__ARTechniqueGatherContext_resultDataOfClass___block_invoke;
  v12[3] = &__block_descriptor_40_e41_B24__0___ARResultData__8__NSDictionary_16lu32l8;
  v12[4] = a3;
  v7 = [MEMORY[0x1E4F28F60] predicateWithBlock:v12];
  v8 = [v6 filteredArrayUsingPredicate:v7];

  if (v5)
  {
    id v9 = [v5 arrayByAddingObjectsFromArray:v8];
  }
  else
  {
    id v9 = v8;
  }
  v10 = v9;

  return v10;
}

uint64_t __46__ARTechniqueGatherContext_resultDataOfClass___block_invoke()
{
  return objc_opt_isKindOfClass() & 1;
}

- (id)anchorsToAdd
{
  int64_t v3 = [(ARTechniqueGatherContext *)self parentContext];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(ARTechniqueGatherContext *)self parentContext];
    v6 = [v5 anchorsToAdd];
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)anchorsToRemove
{
  int64_t v3 = [(ARTechniqueGatherContext *)self parentContext];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(ARTechniqueGatherContext *)self parentContext];
    v6 = [v5 anchorsToRemove];
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (NSString)description
{
  int64_t v3 = (void *)MEMORY[0x1E4F28E78];
  v10.receiver = self;
  v10.super_class = (Class)ARTechniqueGatherContext;
  char v4 = [(ARTechniqueGatherContext *)&v10 description];
  id v5 = [v3 stringWithFormat:@"%@\n", v4];

  v6 = [(ARTechniqueGatherContext *)self gatheredData];
  [v5 appendFormat:@"gatheredData: %@\n", v6];

  v7 = [(ARTechniqueGatherContext *)self imageData];
  [v5 appendFormat:@"imageData: %@\n", v7];

  v8 = [(ARTechniqueGatherContext *)self parentContext];
  [v5 appendFormat:@"parentContext: %@\n", v8];

  return (NSString *)v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ARTechniqueGatherContext)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ARTechniqueGatherContext;
  id v5 = [(ARTechniqueGatherContext *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectForKey:@"parentContext"];
    id parentContext = v5->_parentContext;
    v5->_id parentContext = (id)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
}

- (id)parentContext
{
  return self->_parentContext;
}

- (void).cxx_destruct
{
}

@end
@interface GEMagicResult
- (GEMagicResult)initWithMimeType:(id)a3 description:(id)a4 typeHierarchy:(id)a5;
- (NSArray)uniformTypeHierarchy;
- (NSString)description;
- (NSString)mimeType;
- (NSString)uniformType;
- (void)dealloc;
@end

@implementation GEMagicResult

- (NSArray)uniformTypeHierarchy
{
  return self->uniformTypeHierarchy;
}

- (NSString)uniformType
{
  return self->uniformType;
}

- (NSString)description
{
  return self->description;
}

- (NSString)mimeType
{
  return self->mimeType;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)GEMagicResult;
  [(GEMagicResult *)&v3 dealloc];
}

- (GEMagicResult)initWithMimeType:(id)a3 description:(id)a4 typeHierarchy:(id)a5
{
  v10.receiver = self;
  v10.super_class = (Class)GEMagicResult;
  v8 = [(GEMagicResult *)&v10 init];
  if (v8)
  {
    v8->mimeType = (NSString *)[a3 copy];
    v8->description = (NSString *)[a4 copy];
    v8->uniformTypeHierarchy = (NSArray *)[a5 copy];
    if ([(NSArray *)[(GEMagicResult *)v8 uniformTypeHierarchy] count]) {
      v8->uniformType = (NSString *)[(NSArray *)[(GEMagicResult *)v8 uniformTypeHierarchy] objectAtIndex:0];
    }
  }
  return v8;
}

@end
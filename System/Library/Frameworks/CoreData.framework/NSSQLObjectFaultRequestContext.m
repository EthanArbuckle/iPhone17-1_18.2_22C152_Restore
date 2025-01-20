@interface NSSQLObjectFaultRequestContext
- (BOOL)executeRequestCore:(id *)a3;
- (NSSQLFetchRequestContext)createFetchRequestContext;
- (NSSQLObjectFaultRequestContext)initWithObjectID:(id)a3 context:(id)a4 sqlCore:(id)a5;
- (void)dealloc;
@end

@implementation NSSQLObjectFaultRequestContext

- (NSSQLObjectFaultRequestContext)initWithObjectID:(id)a3 context:(id)a4 sqlCore:(id)a5
{
  v8.receiver = self;
  v8.super_class = (Class)NSSQLObjectFaultRequestContext;
  v6 = [(NSSQLStoreRequestContext *)&v8 initWithRequest:0 context:a4 sqlCore:a5];
  if (v6)
  {
    v6->_objectID = (NSManagedObjectID *)a3;
    v6->_forConflictAnalysis = 0;
  }
  return v6;
}

- (void)dealloc
{
  self->_objectID = 0;
  self->_fetchRequest = 0;
  v3.receiver = self;
  v3.super_class = (Class)NSSQLObjectFaultRequestContext;
  [(NSSQLStoreRequestContext *)&v3 dealloc];
}

- (NSSQLFetchRequestContext)createFetchRequestContext
{
  v1 = a1;
  if (a1)
  {
    externalDataLinksDirectory = a1->_externalDataLinksDirectory;
    if (!externalDataLinksDirectory)
    {
      objc_super v3 = objc_alloc_init(NSFetchRequest);
      v1->_externalDataLinksDirectory = (NSString *)v3;
      [(NSFetchRequest *)v3 setEntity:[(NSString *)v1->_externalDataReferencesDirectory entity]];
      uint64_t v4 = [(NSString *)v1->_externalDataReferencesDirectory _referenceData64];
      v5 = (void *)[objc_alloc(NSNumber) initWithLongLong:v4];
      v6 = (void *)[objc_alloc(MEMORY[0x1E4F28BC0]) initWithObject:v5];

      v7 = (void *)[objc_alloc(MEMORY[0x1E4F28DA0]) initWithObject:@"_pk"];
      objc_super v8 = (void *)[objc_alloc(MEMORY[0x1E4F28D98]) initWithKeyPath:v7];

      v9 = (void *)[objc_alloc(MEMORY[0x1E4F28B98]) initWithLeftExpression:v8 rightExpression:v6 modifier:0 type:4 options:0];
      [(NSString *)v1->_externalDataLinksDirectory setPredicate:v9];
      [(NSString *)v1->_externalDataLinksDirectory setIncludesSubentities:0];

      externalDataLinksDirectory = v1->_externalDataLinksDirectory;
    }
    v1 = [[NSSQLFetchRequestContext alloc] initWithRequest:externalDataLinksDirectory context:v1->super._context sqlCore:v1->super._sqlCore];
    [(NSSQLFetchRequestContext *)v1 setIsFaultRequest:1];
  }
  return v1;
}

- (BOOL)executeRequestCore:(id *)a3
{
  id v5 = _executeNewRowValuesForObjectFaultRequest(self);
  [(NSSQLStoreRequestContext *)self setResult:v5];

  if (a3 && *a3)
  {
    if (self)
    {
      objc_setProperty_nonatomic(self, v6, *a3, 40);
      return !self->super._exception && self->super._error == 0;
    }
    return 1;
  }
  if (!self) {
    return 1;
  }
  return !self->super._exception && self->super._error == 0;
}

@end
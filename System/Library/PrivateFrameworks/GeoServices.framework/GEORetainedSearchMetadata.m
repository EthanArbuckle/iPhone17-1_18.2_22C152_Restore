@interface GEORetainedSearchMetadata
- (GEORetainedSearchMetadata)initWithRetainedSearchMetadata:(id)a3;
- (NSString)_query;
- (NSString)sourceAppID;
- (id)_retainedSearchMetadata;
- (id)copyWithZone:(_NSZone *)a3;
@end

@implementation GEORetainedSearchMetadata

- (GEORetainedSearchMetadata)initWithRetainedSearchMetadata:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GEORetainedSearchMetadata;
  v6 = [(GEORetainedSearchMetadata *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_retainedSearchMetadata, a3);
  }

  return v7;
}

- (NSString)_query
{
  v2 = [(GEORetainedSearchMetadata *)self _retainedSearchMetadata];
  v3 = -[GEOPDRetainedSearchMetadata query](v2);

  return (NSString *)v3;
}

- (id)_retainedSearchMetadata
{
  return self->_retainedSearchMetadata;
}

- (NSString)sourceAppID
{
  return -[GEOPDRetainedSearchMetadata sourceAppId]((id *)&self->_retainedSearchMetadata->super.super.isa);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_alloc((Class)objc_opt_class());
  v6 = [(GEORetainedSearchMetadata *)self _retainedSearchMetadata];
  v7 = (void *)[v6 copyWithZone:a3];
  v8 = (void *)[v5 initWithRetainedSearchMetadata:v7];

  return v8;
}

- (void).cxx_destruct
{
}

@end
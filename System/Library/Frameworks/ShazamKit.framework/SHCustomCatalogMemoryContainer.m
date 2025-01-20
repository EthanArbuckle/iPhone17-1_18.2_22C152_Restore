@interface SHCustomCatalogMemoryContainer
- (BOOL)loadFromData:(id)a3 error:(id *)a4;
- (BOOL)loadFromURL:(id)a3 error:(id *)a4;
- (BOOL)writeToURL:(id)a3 error:(id *)a4;
- (NSArray)referenceSignatures;
- (NSData)dataRepresentation;
- (SHCustomCatalogMemoryContainer)init;
- (SHCustomCatalogStorage)container;
- (id)mediaItemsForReferenceSignature:(id)a3;
- (id)referenceSignatureForTrackID:(unint64_t)a3;
- (void)addSignature:(id)a3 representingMediaItems:(id)a4;
@end

@implementation SHCustomCatalogMemoryContainer

- (SHCustomCatalogMemoryContainer)init
{
  v6.receiver = self;
  v6.super_class = (Class)SHCustomCatalogMemoryContainer;
  v2 = [(SHCustomCatalogMemoryContainer *)&v6 init];
  if (v2)
  {
    v3 = objc_alloc_init(SHCustomCatalogMemoryStorage);
    container = v2->_container;
    v2->_container = (SHCustomCatalogStorage *)v3;
  }
  return v2;
}

- (void)addSignature:(id)a3 representingMediaItems:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(SHCustomCatalogMemoryContainer *)self container];
  [v8 addSignature:v7 representingMediaItems:v6];
}

- (BOOL)loadFromData:(id)a3 error:(id *)a4
{
  return 0;
}

- (BOOL)loadFromURL:(id)a3 error:(id *)a4
{
  return 0;
}

- (id)mediaItemsForReferenceSignature:(id)a3
{
  id v4 = a3;
  v5 = [(SHCustomCatalogMemoryContainer *)self container];
  id v6 = [v5 mediaItemsForReferenceSignature:v4];

  return v6;
}

- (id)referenceSignatureForTrackID:(unint64_t)a3
{
  id v4 = [(SHCustomCatalogMemoryContainer *)self container];
  v5 = [v4 referenceSignatureForTrackID:a3];

  return v5;
}

- (BOOL)writeToURL:(id)a3 error:(id *)a4
{
  return 0;
}

- (NSArray)referenceSignatures
{
  v2 = [(SHCustomCatalogMemoryContainer *)self container];
  v3 = [v2 referenceSignatures];

  return (NSArray *)v3;
}

- (NSData)dataRepresentation
{
  v2 = (void *)MEMORY[0x263EFF940];
  uint64_t v3 = *MEMORY[0x263EFF498];
  id v4 = [NSString stringWithFormat:@"In memory Custom Catalog containers cannot be written to disk"];
  id v5 = [v2 exceptionWithName:v3 reason:v4 userInfo:0];

  objc_exception_throw(v5);
}

- (SHCustomCatalogStorage)container
{
  return self->_container;
}

- (void).cxx_destruct
{
}

@end
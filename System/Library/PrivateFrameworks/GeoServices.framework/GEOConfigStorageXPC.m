@interface GEOConfigStorageXPC
- (id)_instanceSpecificGetKey:(id)a3;
- (id)_instanceSpecificGetKeyPath:(id)a3;
- (void)_instanceSpecificSetValue:(id)a3 forKey:(id)a4;
@end

@implementation GEOConfigStorageXPC

- (id)_instanceSpecificGetKey:(id)a3
{
  return [(GEOConfigPersistence *)self->super._persister xpcDefaultForKeyPath:a3];
}

- (void)_instanceSpecificSetValue:(id)a3 forKey:(id)a4
{
}

- (id)_instanceSpecificGetKeyPath:(id)a3
{
  return [(GEOConfigPersistence *)self->super._persister xpcDefaultForKeyPathComponents:a3];
}

@end
@interface IXAppInstallObjectsMetadata
- (IXAppInstallObjectsMetadata)init;
- (NSHashTable)instances;
- (unint64_t)count;
- (void)addObject:(id)a3;
- (void)setCount:(unint64_t)a3;
- (void)setInstances:(id)a3;
@end

@implementation IXAppInstallObjectsMetadata

- (IXAppInstallObjectsMetadata)init
{
  v6.receiver = self;
  v6.super_class = (Class)IXAppInstallObjectsMetadata;
  v2 = [(IXAppInstallObjectsMetadata *)&v6 init];
  v3 = v2;
  if (v2)
  {
    [(IXAppInstallObjectsMetadata *)v2 setCount:0];
    v4 = [MEMORY[0x1E4F28D30] hashTableWithOptions:517];
    [(IXAppInstallObjectsMetadata *)v3 setInstances:v4];
  }
  return v3;
}

- (void)addObject:(id)a3
{
  id v4 = a3;
  [(IXAppInstallObjectsMetadata *)self setCount:[(IXAppInstallObjectsMetadata *)self count] + 1];
  id v5 = [(IXAppInstallObjectsMetadata *)self instances];
  [v5 addObject:v4];
}

- (unint64_t)count
{
  return self->_count;
}

- (void)setCount:(unint64_t)a3
{
  self->_count = a3;
}

- (NSHashTable)instances
{
  return self->_instances;
}

- (void)setInstances:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
@interface GEOBusinessInfoModuleConfiguration
- (GEOBusinessInfoModuleConfiguration)initWithBusinessInfoModuleConfiguration:(id)a3;
- (NSArray)factoidItemIndexes;
@end

@implementation GEOBusinessInfoModuleConfiguration

- (GEOBusinessInfoModuleConfiguration)initWithBusinessInfoModuleConfiguration:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GEOBusinessInfoModuleConfiguration;
  v6 = [(GEOBusinessInfoModuleConfiguration *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_businessInfosModuleConfig, a3);
  }

  return v7;
}

- (NSArray)factoidItemIndexes
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  for (unint64_t i = 0; ; ++i)
  {
    businessInfosModuleConfig = self->_businessInfosModuleConfig;
    unint64_t v6 = businessInfosModuleConfig ? businessInfosModuleConfig->_factoidItemIndexs.count : 0;
    if (i >= v6) {
      break;
    }
    v7 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[GEOPDBusinessInfosModuleConfiguration factoidItemIndexAtIndex:]((uint64_t)businessInfosModuleConfig, i));
    [v3 addObject:v7];
  }
  v8 = (void *)[v3 copy];

  return (NSArray *)v8;
}

- (void).cxx_destruct
{
}

@end
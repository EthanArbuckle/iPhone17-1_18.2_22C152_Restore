@interface ISURLResourcePropertySpecification
+ (id)sharedInstance;
- (NSArray)applicationProperties;
- (NSArray)generalProperties;
- (NSArray)iconInitWithURLProperties;
- (NSArray)otherProperties;
- (NSArray)volumeProperties;
- (NSSet)allowedMissingProperties;
- (id)_init;
@end

@implementation ISURLResourcePropertySpecification

uint64_t __52__ISURLResourcePropertySpecification_sharedInstance__block_invoke()
{
  sharedInstance_sharedInstance_1 = [[ISURLResourcePropertySpecification alloc] _init];
  return MEMORY[0x1F41817F8]();
}

- (id)_init
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  v23.receiver = self;
  v23.super_class = (Class)ISURLResourcePropertySpecification;
  v2 = [(ISURLResourcePropertySpecification *)&v23 init];
  if (v2)
  {
    uint64_t v3 = *MEMORY[0x1E4F1C658];
    v26[0] = *MEMORY[0x1E4F1C628];
    v26[1] = v3;
    uint64_t v4 = *MEMORY[0x1E4F1C6A0];
    v26[2] = *MEMORY[0x1E4F1C640];
    v26[3] = v4;
    uint64_t v5 = *MEMORY[0x1E4F1C618];
    v26[4] = *MEMORY[0x1E4F1C610];
    v26[5] = v5;
    uint64_t v6 = *MEMORY[0x1E4F1C670];
    v26[6] = *MEMORY[0x1E4F1C680];
    v26[7] = v6;
    uint64_t v7 = *MEMORY[0x1E4F1CDE0];
    v26[8] = *MEMORY[0x1E4F1C700];
    v26[9] = v7;
    uint64_t v27 = *MEMORY[0x1E4F1CDD8];
    uint64_t v8 = v27;
    uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:11];
    generalProperties = v2->_generalProperties;
    v2->_generalProperties = (NSArray *)v9;

    applicationProperties = v2->_applicationProperties;
    v12 = (NSArray *)MEMORY[0x1E4F1CBF0];
    v2->_applicationProperties = (NSArray *)MEMORY[0x1E4F1CBF0];

    volumeProperties = v2->_volumeProperties;
    v2->_volumeProperties = v12;

    uint64_t v14 = *MEMORY[0x1E4F1C688];
    v25[0] = *MEMORY[0x1E4F1C520];
    v25[1] = v14;
    uint64_t v15 = *MEMORY[0x1E4F1C530];
    v25[2] = *MEMORY[0x1E4F1C698];
    v25[3] = v15;
    v25[4] = *MEMORY[0x1E4F1C518];
    uint64_t v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:5];
    otherProperties = v2->_otherProperties;
    v2->_otherProperties = (NSArray *)v16;

    v18 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v24 = v8;
    v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v24 count:1];
    uint64_t v20 = [v18 setWithArray:v19];
    allowedMissingProperties = v2->_allowedMissingProperties;
    v2->_allowedMissingProperties = (NSSet *)v20;
  }
  return v2;
}

- (NSArray)generalProperties
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_0 != -1) {
    dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_11);
  }
  v2 = (void *)sharedInstance_sharedInstance_1;
  return v2;
}

- (NSArray)iconInitWithURLProperties
{
  return self->_generalProperties;
}

- (NSSet)allowedMissingProperties
{
  return self->_allowedMissingProperties;
}

- (NSArray)applicationProperties
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (NSArray)volumeProperties
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (NSArray)otherProperties
{
  return (NSArray *)objc_getProperty(self, a2, 40, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_otherProperties, 0);
  objc_storeStrong((id *)&self->_allowedMissingProperties, 0);
  objc_storeStrong((id *)&self->_volumeProperties, 0);
  objc_storeStrong((id *)&self->_applicationProperties, 0);
  objc_storeStrong((id *)&self->_generalProperties, 0);
}

@end
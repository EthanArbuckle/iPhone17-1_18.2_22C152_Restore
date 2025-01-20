@interface FPSpotlightQueryDescriptor
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToItemQueryDescriptor:(id)a3;
- (BOOL)keepCollectorsAlive;
- (BOOL)supportsQueryingAllMountPoints;
- (BOOL)supportsSemanticSearch;
- (FPQueryEnumerationSettings)settings;
- (FPSpotlightQueryDescriptor)init;
- (FPSpotlightQueryDescriptor)initWithSettings:(id)a3;
- (NSString)name;
- (id)queryStringForMountPoint:(id)a3;
- (unint64_t)desiredCount;
- (unint64_t)hash;
@end

@implementation FPSpotlightQueryDescriptor

- (BOOL)keepCollectorsAlive
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
    && [(FPSpotlightQueryDescriptor *)self isEqualToItemQueryDescriptor:v4];

  return v5;
}

- (unint64_t)hash
{
  v3 = [(FPSpotlightQueryDescriptor *)self queryStringForMountPoint:@"FPQueryCollectionDefaultMountPointIdentifier"];
  uint64_t v4 = [v3 hash];

  return [(FPSpotlightQueryDescriptor *)self desiredCount] ^ v4;
}

- (BOOL)isEqualToItemQueryDescriptor:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 queryStringForMountPoint:@"FPQueryCollectionDefaultMountPointIdentifier"];
  v6 = [(FPSpotlightQueryDescriptor *)self queryStringForMountPoint:@"FPQueryCollectionDefaultMountPointIdentifier"];
  if ([v5 isEqualToString:v6])
  {
    uint64_t v7 = [v4 desiredCount];
    BOOL v8 = v7 == [(FPSpotlightQueryDescriptor *)self desiredCount];
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (unint64_t)desiredCount
{
  return -1;
}

- (FPQueryEnumerationSettings)settings
{
  return self->_settings;
}

- (FPSpotlightQueryDescriptor)initWithSettings:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FPSpotlightQueryDescriptor;
  v6 = [(FPSpotlightQueryDescriptor *)&v9 init];
  uint64_t v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_settings, a3);
  }

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_settings, 0);

  objc_storeStrong((id *)&self->_searchQuery, 0);
}

- (BOOL)supportsSemanticSearch
{
  return [(FPQueryEnumerationSettings *)self->_settings allowSemanticSearchResults];
}

- (BOOL)supportsQueryingAllMountPoints
{
  return 1;
}

- (FPSpotlightQueryDescriptor)init
{
  v3 = objc_opt_new();
  id v4 = [(FPSpotlightQueryDescriptor *)self initWithSettings:v3];

  return v4;
}

- (NSString)name
{
  v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

- (id)queryStringForMountPoint:(id)a3
{
  id v5 = (void *)MEMORY[0x1E4F28B00];
  id v6 = a3;
  uint64_t v7 = [v5 currentHandler];
  BOOL v8 = NSStringFromSelector(a2);
  [v7 handleFailureInMethod:a2, self, @"FPSpotlightQueryDescriptor.m", 48, @"Subclass should always override %@ (%@)", v8, v6 object file lineNumber description];

  return 0;
}

@end
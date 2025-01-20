@interface NSFileProviderKnownFolderDescriptor
+ (BOOL)supportsSecureCoding;
- (NSFileProviderKnownFolderDescriptor)initWithCoder:(id)a3;
- (NSFileProviderKnownFolderDescriptor)initWithKnownFolder:(id)a3 logicalLocation:(id)a4;
- (NSFileProviderKnownFolderDescriptor)initWithKnownFolder:(id)a3 logicalLocation:(id)a4 detachOptions:(unint64_t)a5;
- (NSFileProviderKnownFolderLocation)location;
- (NSURL)knownFolder;
- (NSURL)logicalLocation;
- (unint64_t)detachOptions;
- (void)encodeWithCoder:(id)a3;
- (void)setLocation:(id)a3;
@end

@implementation NSFileProviderKnownFolderDescriptor

- (NSFileProviderKnownFolderDescriptor)initWithKnownFolder:(id)a3 logicalLocation:(id)a4 detachOptions:(unint64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)NSFileProviderKnownFolderDescriptor;
  v11 = [(NSFileProviderKnownFolderDescriptor *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_knownFolder, a3);
    objc_storeStrong((id *)&v12->_logicalLocation, a4);
    v12->_detachOptions = a5;
  }

  return v12;
}

- (NSFileProviderKnownFolderDescriptor)initWithKnownFolder:(id)a3 logicalLocation:(id)a4
{
  return [(NSFileProviderKnownFolderDescriptor *)self initWithKnownFolder:a3 logicalLocation:a4 detachOptions:1];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSFileProviderKnownFolderDescriptor)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)NSFileProviderKnownFolderDescriptor;
  v5 = [(NSFileProviderKnownFolderDescriptor *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_knownFolder"];
    knownFolder = v5->_knownFolder;
    v5->_knownFolder = (NSURL *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_logicalLocation"];
    logicalLocation = v5->_logicalLocation;
    v5->_logicalLocation = (NSURL *)v8;

    v5->_detachOptions = [v4 decodeIntegerForKey:@"_detachOptions"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  knownFolder = self->_knownFolder;
  id v5 = a3;
  [v5 encodeObject:knownFolder forKey:@"_knownFolder"];
  [v5 encodeObject:self->_logicalLocation forKey:@"_logicalLocation"];
  [v5 encodeInteger:self->_detachOptions forKey:@"_detachOptions"];
}

- (NSFileProviderKnownFolderLocation)location
{
  return self->_location;
}

- (void)setLocation:(id)a3
{
}

- (NSURL)knownFolder
{
  return self->_knownFolder;
}

- (NSURL)logicalLocation
{
  return self->_logicalLocation;
}

- (unint64_t)detachOptions
{
  return self->_detachOptions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logicalLocation, 0);
  objc_storeStrong((id *)&self->_knownFolder, 0);

  objc_storeStrong((id *)&self->_location, 0);
}

@end
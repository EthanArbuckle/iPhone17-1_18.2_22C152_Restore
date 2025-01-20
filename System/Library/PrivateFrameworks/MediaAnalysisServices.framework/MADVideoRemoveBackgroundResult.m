@interface MADVideoRemoveBackgroundResult
+ (BOOL)supportsSecureCoding;
- (MADVideoRemoveBackgroundResult)initWithCoder:(id)a3;
- (MADVideoRemoveBackgroundResult)initWithUniformTypeIdentifier:(id)a3 width:(unint64_t)a4 height:(unint64_t)a5 data:(id)a6;
- (NSData)data;
- (UTType)uniformTypeIdentifier;
- (id)description;
- (unint64_t)height;
- (unint64_t)width;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MADVideoRemoveBackgroundResult

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MADVideoRemoveBackgroundResult)initWithUniformTypeIdentifier:(id)a3 width:(unint64_t)a4 height:(unint64_t)a5 data:(id)a6
{
  id v11 = a3;
  id v12 = a6;
  v16.receiver = self;
  v16.super_class = (Class)MADVideoRemoveBackgroundResult;
  v13 = [(MADVideoRemoveBackgroundResult *)&v16 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_uniformTypeIdentifier, a3);
    v14->_width = a4;
    v14->_height = a5;
    objc_storeStrong((id *)&v14->_data, a6);
  }

  return v14;
}

- (MADVideoRemoveBackgroundResult)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MADVideoRemoveBackgroundResult;
  v5 = [(MADVideoResult *)&v11 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"UniformTypeIdentifier"];
    uniformTypeIdentifier = v5->_uniformTypeIdentifier;
    v5->_uniformTypeIdentifier = (UTType *)v6;

    v5->_width = [v4 decodeIntegerForKey:@"Width"];
    v5->_height = [v4 decodeIntegerForKey:@"Height"];
    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Data"];
    data = v5->_data;
    v5->_data = (NSData *)v8;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MADVideoRemoveBackgroundResult;
  id v4 = a3;
  [(MADVideoResult *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_uniformTypeIdentifier, @"UniformTypeIdentifier", v5.receiver, v5.super_class);
  [v4 encodeInteger:self->_width forKey:@"Width"];
  [v4 encodeInteger:self->_height forKey:@"Height"];
  [v4 encodeObject:self->_data forKey:@"Data"];
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] string];
  id v4 = (objc_class *)objc_opt_class();
  objc_super v5 = NSStringFromClass(v4);
  [v3 appendFormat:@"<%@ %p, ", v5, self];

  [v3 appendFormat:@"uniformTypeIdentifier: %@, ", self->_uniformTypeIdentifier];
  [v3 appendFormat:@"width: %u, ", self->_width];
  [v3 appendFormat:@"height: %u, ", self->_height];
  [v3 appendFormat:@"data: %@>", self->_data];
  return v3;
}

- (UTType)uniformTypeIdentifier
{
  return self->_uniformTypeIdentifier;
}

- (unint64_t)width
{
  return self->_width;
}

- (unint64_t)height
{
  return self->_height;
}

- (NSData)data
{
  return self->_data;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_uniformTypeIdentifier, 0);
}

@end
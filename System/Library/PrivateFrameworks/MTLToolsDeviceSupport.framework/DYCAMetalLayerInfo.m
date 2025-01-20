@interface DYCAMetalLayerInfo
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (CGRect)frame;
- (DYCAMetalLayerInfo)initWithCoder:(id)a3;
- (NSString)capturableObjectType;
- (NSString)displayName;
- (NSString)name;
- (unint64_t)deviceAddress;
- (unint64_t)layerAddress;
- (unint64_t)layerStreamRef;
- (unint64_t)streamRef;
@end

@implementation DYCAMetalLayerInfo

- (DYCAMetalLayerInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)DYCAMetalLayerInfo;
  v5 = [(DYCAMetalLayerInfo *)&v15 init];
  if (v5)
  {
    v5->_deviceAddress = [v4 decodeInt64ForKey:@"deviceAddress"];
    v5->_layerAddress = [v4 decodeInt64ForKey:@"layerAddress"];
    v5->_layerStreamRef = [v4 decodeInt64ForKey:@"layerStreamRef"];
    [v4 decodeCGRectForKey:@"frame"];
    v5->_frame.origin.x = v6;
    v5->_frame.origin.y = v7;
    v5->_frame.size.width = v8;
    v5->_frame.size.height = v9;
    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"name"];
    name = v5->_name;
    v5->_name = (NSString *)v10;

    if ([(NSString *)v5->_name length])
    {
      v12 = v5->_name;
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"0x%08llx [%.0f,%.0f %.0f×%.0f]", v5->_layerAddress, *(void *)&v5->_frame.origin.x, *(void *)&v5->_frame.origin.y, *(void *)&v5->_frame.size.width, *(void *)&v5->_frame.size.height);
      v12 = (NSString *)objc_claimAutoreleasedReturnValue();
    }
    displayName = v5->_displayName;
    v5->_displayName = v12;
  }
  return v5;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (NSString)capturableObjectType
{
  return (NSString *)(id)*MEMORY[0x263F3FA68];
}

- (unint64_t)streamRef
{
  return self->_layerStreamRef;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  BOOL v6 = v5 == objc_opt_class() && self->_layerAddress == v4[3];

  return v6;
}

- (unint64_t)deviceAddress
{
  return self->_deviceAddress;
}

- (unint64_t)layerAddress
{
  return self->_layerAddress;
}

- (CGRect)frame
{
  double x = self->_frame.origin.x;
  double y = self->_frame.origin.y;
  double width = self->_frame.size.width;
  double height = self->_frame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (NSString)name
{
  return self->_name;
}

- (unint64_t)layerStreamRef
{
  return self->_layerStreamRef;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
}

@end
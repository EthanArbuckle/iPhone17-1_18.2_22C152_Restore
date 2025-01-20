@interface DYGTCAMetalLayerInfo
+ (BOOL)supportsSecureCoding;
- (CGRect)frame;
- (DYGTCAMetalLayerInfo)initWithCoder:(id)a3;
- (NSString)name;
- (unint64_t)deviceAddress;
- (unint64_t)deviceStreamRef;
- (unint64_t)layerAddress;
- (unint64_t)layerStreamRef;
- (void)encodeWithCoder:(id)a3;
- (void)setDeviceAddress:(unint64_t)a3;
- (void)setDeviceStreamRef:(unint64_t)a3;
- (void)setFrame:(CGRect)a3;
- (void)setLayerAddress:(unint64_t)a3;
- (void)setLayerStreamRef:(unint64_t)a3;
- (void)setName:(id)a3;
@end

@implementation DYGTCAMetalLayerInfo

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DYGTCAMetalLayerInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)DYGTCAMetalLayerInfo;
  v5 = [(DYGTCAMetalLayerInfo *)&v13 init];
  if (v5)
  {
    v5->_deviceAddress = [v4 decodeInt64ForKey:@"deviceAddress"];
    v5->_deviceStreamRef = [v4 decodeInt64ForKey:@"deviceStreamRef"];
    v5->_layerAddress = [v4 decodeInt64ForKey:@"layerAddress"];
    v5->_layerStreamRef = [v4 decodeInt64ForKey:@"layerStreamRef"];
    [v4 decodeRectForKey:@"frame"];
    v5->_frame.origin.x = v6;
    v5->_frame.origin.y = v7;
    v5->_frame.size.width = v8;
    v5->_frame.size.height = v9;
    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"name"];
    name = v5->_name;
    v5->_name = (NSString *)v10;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t deviceAddress = self->_deviceAddress;
  id v5 = a3;
  [v5 encodeInt64:deviceAddress forKey:@"deviceAddress"];
  [v5 encodeInt64:self->_deviceStreamRef forKey:@"deviceStreamRef"];
  [v5 encodeInt64:self->_layerAddress forKey:@"layerAddress"];
  [v5 encodeInt64:self->_layerStreamRef forKey:@"layerStreamRef"];
  objc_msgSend(v5, "encodeRect:forKey:", @"frame", self->_frame.origin.x, self->_frame.origin.y, self->_frame.size.width, self->_frame.size.height);
  [v5 encodeObject:self->_name forKey:@"name"];
}

- (unint64_t)deviceAddress
{
  return self->_deviceAddress;
}

- (void)setDeviceAddress:(unint64_t)a3
{
  self->_unint64_t deviceAddress = a3;
}

- (unint64_t)deviceStreamRef
{
  return self->_deviceStreamRef;
}

- (void)setDeviceStreamRef:(unint64_t)a3
{
  self->_deviceStreamRef = a3;
}

- (unint64_t)layerAddress
{
  return self->_layerAddress;
}

- (void)setLayerAddress:(unint64_t)a3
{
  self->_layerAddress = a3;
}

- (unint64_t)layerStreamRef
{
  return self->_layerStreamRef;
}

- (void)setLayerStreamRef:(unint64_t)a3
{
  self->_layerStreamRef = a3;
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

- (void)setFrame:(CGRect)a3
{
  self->_frame = a3;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
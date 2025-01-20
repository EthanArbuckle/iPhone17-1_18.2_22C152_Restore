@interface CUNetInterfaceInfo
- (NSString)interfaceName;
- (NSString)ipv4String;
- (void)setInterfaceName:(id)a3;
- (void)setIpv4String:(id)a3;
@end

@implementation CUNetInterfaceInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ipv4String, 0);
  objc_storeStrong((id *)&self->_interfaceName, 0);
}

- (void)setIpv4String:(id)a3
{
}

- (NSString)ipv4String
{
  return self->_ipv4String;
}

- (void)setInterfaceName:(id)a3
{
}

- (NSString)interfaceName
{
  return self->_interfaceName;
}

@end
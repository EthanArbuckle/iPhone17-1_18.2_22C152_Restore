@interface AppleEthernetInterface
- (NSString)BSDName;
- (NSString)displayName;
- (void)setBSDName:(id)a3;
- (void)setDisplayName:(id)a3;
@end

@implementation AppleEthernetInterface

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
}

- (NSString)BSDName
{
  return self->_BSDName;
}

- (void)setBSDName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_BSDName, 0);

  objc_storeStrong((id *)&self->_displayName, 0);
}

@end
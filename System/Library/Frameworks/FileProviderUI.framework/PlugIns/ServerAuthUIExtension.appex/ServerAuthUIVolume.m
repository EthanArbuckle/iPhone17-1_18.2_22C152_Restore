@interface ServerAuthUIVolume
- (NSString)displayName;
- (NSString)identifier;
- (void)setDisplayName:(id)a3;
- (void)setIdentifier:(id)a3;
@end

@implementation ServerAuthUIVolume

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayName, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
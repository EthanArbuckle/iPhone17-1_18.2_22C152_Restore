@interface AXAssertionIdentifierTypePair
- (NSString)identifier;
- (NSString)type;
- (void)setIdentifier:(id)a3;
- (void)setType:(id)a3;
@end

@implementation AXAssertionIdentifierTypePair

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)type
{
  return self->_type;
}

- (void)setType:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
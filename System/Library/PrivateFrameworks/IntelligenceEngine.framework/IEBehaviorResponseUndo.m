@interface IEBehaviorResponseUndo
- (NSDictionary)userData;
- (NSString)identifier;
- (void)setIdentifier:(id)a3;
- (void)setUserData:(id)a3;
@end

@implementation IEBehaviorResponseUndo

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSDictionary)userData
{
  return self->_userData;
}

- (void)setUserData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userData, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
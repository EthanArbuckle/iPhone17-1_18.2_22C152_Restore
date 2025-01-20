@interface GDHMHomeAccessControlMock
- (BOOL)isAdministrator;
- (GDHMHomeAccessControlMock)initWithIsAdminAnswer:(BOOL)a3;
@end

@implementation GDHMHomeAccessControlMock

- (BOOL)isAdministrator
{
  return self->_isAdminAnswer;
}

- (GDHMHomeAccessControlMock)initWithIsAdminAnswer:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)GDHMHomeAccessControlMock;
  result = [(GDHMHomeAccessControlMock *)&v5 init];
  if (result) {
    result->_isAdminAnswer = a3;
  }
  return result;
}

@end
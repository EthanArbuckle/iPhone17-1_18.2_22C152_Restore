@interface IDSRegistrationProperties
- (NSArray)interesting;
- (NSArray)lackAll;
- (NSArray)requireAll;
- (void)setInteresting:(id)a3;
- (void)setLackAll:(id)a3;
- (void)setRequireAll:(id)a3;
@end

@implementation IDSRegistrationProperties

- (NSArray)interesting
{
  return self->_interesting;
}

- (void)setInteresting:(id)a3
{
}

- (NSArray)requireAll
{
  return self->_requireAll;
}

- (void)setRequireAll:(id)a3
{
}

- (NSArray)lackAll
{
  return self->_lackAll;
}

- (void)setLackAll:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lackAll, 0);
  objc_storeStrong((id *)&self->_requireAll, 0);

  objc_storeStrong((id *)&self->_interesting, 0);
}

@end
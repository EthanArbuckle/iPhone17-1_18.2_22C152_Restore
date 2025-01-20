@interface TIMockContact
- (NSString)firstName;
- (NSString)lastName;
- (NSString)middleName;
- (NSString)nickName;
- (float)relevancyScore;
- (void)setFirstName:(id)a3;
- (void)setLastName:(id)a3;
- (void)setMiddleName:(id)a3;
- (void)setNickName:(id)a3;
- (void)setRelevancyScore:(float)a3;
@end

@implementation TIMockContact

- (NSString)lastName
{
  return self->_lastName;
}

- (void)setLastName:(id)a3
{
}

- (NSString)middleName
{
  return self->_middleName;
}

- (void)setMiddleName:(id)a3
{
}

- (NSString)firstName
{
  return self->_firstName;
}

- (void)setFirstName:(id)a3
{
}

- (NSString)nickName
{
  return self->_nickName;
}

- (void)setNickName:(id)a3
{
}

- (float)relevancyScore
{
  return self->_relevancyScore;
}

- (void)setRelevancyScore:(float)a3
{
  self->_relevancyScore = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nickName, 0);
  objc_storeStrong((id *)&self->_firstName, 0);
  objc_storeStrong((id *)&self->_middleName, 0);

  objc_storeStrong((id *)&self->_lastName, 0);
}

@end
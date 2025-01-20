@interface HMMutablePerson
- (id)copyWithZone:(_NSZone *)a3;
@end

@implementation HMMutablePerson

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[HMPerson allocWithZone:a3];
  v5 = [(HMPerson *)self UUID];
  v6 = [(HMPerson *)v4 initWithUUID:v5];

  v7 = [(HMPerson *)self name];
  [(HMPerson *)v6 setName:v7];

  v8 = [(HMPerson *)self personLinks];
  [(HMPerson *)v6 setPersonLinks:v8];

  v9 = [(HMPerson *)self externalPersonUUID];
  [(HMPerson *)v6 setExternalPersonUUID:v9];

  return v6;
}

@end
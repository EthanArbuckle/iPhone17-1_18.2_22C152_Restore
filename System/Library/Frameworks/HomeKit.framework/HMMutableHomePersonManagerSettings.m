@interface HMMutableHomePersonManagerSettings
- (id)copyWithZone:(_NSZone *)a3;
@end

@implementation HMMutableHomePersonManagerSettings

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [+[HMHomePersonManagerSettings allocWithZone:a3] init];
  [(HMHomePersonManagerSettings *)v4 setFaceClassificationEnabled:[(HMHomePersonManagerSettings *)self isFaceClassificationEnabled]];
  return v4;
}

@end
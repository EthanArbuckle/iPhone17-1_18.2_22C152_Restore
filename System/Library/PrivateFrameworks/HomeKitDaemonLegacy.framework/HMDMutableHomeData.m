@interface HMDMutableHomeData
- (id)copyWithZone:(_NSZone *)a3;
@end

@implementation HMDMutableHomeData

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [+[HMDHomeData allocWithZone:](HMDHomeData, "allocWithZone:") init];
  __HMDHomeDataCopyProperties(v5, self, (uint64_t)a3);
  return v5;
}

@end
@interface HMBMutableAction
- (id)copyWithZone:(_NSZone *)a3;
@end

@implementation HMBMutableAction

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [+[HMBAction allocWithZone:a3] init];
  [(HMBAction *)v4 setShouldUpdateClients:[(HMBAction *)self shouldUpdateClients]];
  return v4;
}

@end
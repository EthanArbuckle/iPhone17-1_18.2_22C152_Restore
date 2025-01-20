@interface HMSettingsCreator
- (id)createSettingsWithOwner:(id)a3;
@end

@implementation HMSettingsCreator

- (id)createSettingsWithOwner:(id)a3
{
  id v3 = a3;
  v4 = [[HMSettings alloc] initWithSettingsOwner:v3];

  return v4;
}

@end
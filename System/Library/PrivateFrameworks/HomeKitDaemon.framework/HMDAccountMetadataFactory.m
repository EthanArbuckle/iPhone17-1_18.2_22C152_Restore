@interface HMDAccountMetadataFactory
+ (id)makeInstance;
- (HMDAccountMetadataFactory)init;
@end

@implementation HMDAccountMetadataFactory

+ (id)makeInstance
{
  if (qword_2686D6370 != -1) {
    swift_once();
  }
  v2 = (void *)qword_2687029E8;
  return v2;
}

- (HMDAccountMetadataFactory)init
{
  v3.receiver = self;
  v3.super_class = (Class)HMDAccountMetadataFactory;
  return [(HMDAccountMetadataFactory *)&v3 init];
}

@end
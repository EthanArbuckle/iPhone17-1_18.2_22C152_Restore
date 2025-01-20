@interface HMDStatusChannelProvider
- (id)createStatusChannelWithPrefix:(id)a3 identifier:(id)a4 queue:(id)a5;
@end

@implementation HMDStatusChannelProvider

- (id)createStatusChannelWithPrefix:(id)a3 identifier:(id)a4 queue:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = [[HMDStatusChannel alloc] initWithChannelPrefix:v9 identifier:v8 queue:v7];

  return v10;
}

@end
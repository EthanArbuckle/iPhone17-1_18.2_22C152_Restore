@interface HMDHAPAccessoryPrimaryResidentReadTask
- (id)_makeLocalTaskWithRequests:(id)a3 completion:(id)a4;
@end

@implementation HMDHAPAccessoryPrimaryResidentReadTask

- (id)_makeLocalTaskWithRequests:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [HMDHAPAccessoryLocalReadTask alloc];
  v9 = [(HMDHAPAccessoryTask *)self context];
  v10 = [(HMDHAPAccessoryTask *)v8 initWithContext:v9 requests:v7 completion:v6];

  return v10;
}

@end
@interface AMDDODMLASLArcadeRanking
- (id)performTask:(id)a3 outError:(id *)a4;
@end

@implementation AMDDODMLASLArcadeRanking

- (id)performTask:(id)a3 outError:(id *)a4
{
  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v8[1] = a4;
  v4 = [AMDDODMLTask alloc];
  v8[0] = [(AMDDODMLTask *)v4 initWithErrorDomain:off_10002A510];
  id v7 = [v8[0] performTask:location[0] error:a4];
  objc_storeStrong(v8, 0);
  objc_storeStrong(location, 0);

  return v7;
}

@end
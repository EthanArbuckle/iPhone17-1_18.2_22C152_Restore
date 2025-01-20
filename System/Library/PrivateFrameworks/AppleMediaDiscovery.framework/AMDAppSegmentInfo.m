@interface AMDAppSegmentInfo
- (AMDAppSegmentInfo)initWithAppIdentifier:(id)a3 andSegments:(id)a4;
- (BOOL)isEqualToApp:(id)a3;
- (NSSet)segments;
- (NSString)appIdentifier;
- (void)setAppIdentifier:(id)a3;
- (void)setSegments:(id)a3;
@end

@implementation AMDAppSegmentInfo

- (AMDAppSegmentInfo)initWithAppIdentifier:(id)a3 andSegments:(id)a4
{
  v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v9 = 0;
  objc_storeStrong(&v9, a4);
  v4 = v11;
  v11 = 0;
  v8.receiver = v4;
  v8.super_class = (Class)AMDAppSegmentInfo;
  v11 = [(AMDAppSegmentInfo *)&v8 init];
  objc_storeStrong((id *)&v11, v11);
  [(AMDAppSegmentInfo *)v11 setAppIdentifier:location[0]];
  [(AMDAppSegmentInfo *)v11 setSegments:v9];
  v7 = v11;
  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v11, 0);
  return v7;
}

- (BOOL)isEqualToApp:(id)a3
{
  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v4 = [(AMDAppSegmentInfo *)v12 appIdentifier];
  id v5 = (id)[location[0] appIdentifier];
  char v9 = 0;
  char v7 = 0;
  char v6 = 0;
  if (-[NSString isEqual:](v4, "isEqual:"))
  {
    v10 = [(AMDAppSegmentInfo *)v12 segments];
    char v9 = 1;
    id v8 = (id)[location[0] segments];
    char v7 = 1;
    char v6 = -[NSSet isEqual:](v10, "isEqual:");
  }
  char v13 = v6 & 1;
  if (v7) {

  }
  if (v9) {
  objc_storeStrong(location, 0);
  }
  return v13 & 1;
}

- (NSString)appIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setAppIdentifier:(id)a3
{
}

- (NSSet)segments
{
  return (NSSet *)objc_getProperty(self, a2, 16, 1);
}

- (void)setSegments:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
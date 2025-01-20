@interface ASGeoCodingKeyedUnarchiver
- (id)allowedClasses;
@end

@implementation ASGeoCodingKeyedUnarchiver

- (id)allowedClasses
{
  v14 = self;
  v15[0] = v14;
  v13 = self;
  v15[1] = v13;
  v2 = self;
  v15[2] = v2;
  v3 = self;
  v15[3] = v3;
  v4 = self;
  v15[4] = v4;
  v5 = self;
  v15[5] = v5;
  v6 = self;
  v15[6] = v6;
  v7 = self;
  v15[7] = v7;
  v8 = self;
  v15[8] = v8;
  v9 = self;
  v15[9] = v9;
  v10 = +[NSArray arrayWithObjects:v15 count:10];
  v11 = +[NSSet setWithArray:v10];

  return v11;
}

@end
@interface ASGeoCodingKeyedUnarchiver
- (id)allowedClasses;
@end

@implementation ASGeoCodingKeyedUnarchiver

- (id)allowedClasses
{
  v16[10] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v15 = self;
  v16[0] = v15;
  v14 = self;
  v16[1] = v14;
  v3 = self;
  v16[2] = v3;
  v4 = self;
  v16[3] = v4;
  v5 = self;
  v16[4] = v5;
  v6 = self;
  v16[5] = v6;
  v7 = self;
  v16[6] = v7;
  v8 = self;
  v16[7] = v8;
  v9 = self;
  v16[8] = v9;
  v10 = self;
  v16[9] = v10;
  v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:10];
  v12 = [v2 setWithArray:v11];

  return v12;
}

@end
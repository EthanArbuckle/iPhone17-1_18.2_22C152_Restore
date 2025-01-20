@interface BRContainerIconSupportedNames
@end

@implementation BRContainerIconSupportedNames

void ___BRContainerIconSupportedNames_block_invoke()
{
  v12[8] = *MEMORY[0x1E4F143B8];
  id v11 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  v0 = [NSString stringWithFormat:@"%dx%d_%@", 40, 40, @"iOS"];
  v12[0] = v0;
  v1 = [NSString stringWithFormat:@"%dx%d_%@", 80, 80, @"iOS"];
  v12[1] = v1;
  v2 = [NSString stringWithFormat:@"%dx%d_%@", 120, 120, @"iOS"];
  v12[2] = v2;
  v3 = [NSString stringWithFormat:@"%dx%d_%@", 16, 16, @"OSX"];
  v12[3] = v3;
  v4 = [NSString stringWithFormat:@"%dx%d_%@", 32, 32, @"OSX"];
  v12[4] = v4;
  v5 = [NSString stringWithFormat:@"%dx%d_%@", 64, 64, @"OSX"];
  v12[5] = v5;
  v6 = [NSString stringWithFormat:@"%dx%d_%@", 128, 128, @"OSX"];
  v12[6] = v6;
  v7 = [NSString stringWithFormat:@"%dx%d_%@", 256, 256, @"OSX"];
  v12[7] = v7;
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:8];
  uint64_t v9 = [v11 initWithArray:v8];
  v10 = (void *)_BRContainerIconSupportedNames_iconNames;
  _BRContainerIconSupportedNames_iconNames = v9;
}

@end
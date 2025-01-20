@interface MADServicePublic
+ (id)allowedClasses;
+ (id)allowedMultiModalRequestClasses;
+ (id)allowedTextRequestClasses;
+ (id)allowedTextResultClasses;
+ (id)allowedVideoRequestClasses;
+ (id)allowedVideoResultClasses;
+ (id)serverProtocol;
+ (id)serviceName;
@end

@implementation MADServicePublic

+ (id)serviceName
{
  return @"com.apple.mediaanalysisd.service.public";
}

+ (id)serverProtocol
{
  return &unk_1F3832FB8;
}

+ (id)allowedClasses
{
  v6[24] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  v6[0] = objc_opt_class();
  v6[1] = objc_opt_class();
  v6[2] = objc_opt_class();
  v6[3] = objc_opt_class();
  v6[4] = objc_opt_class();
  v6[5] = objc_opt_class();
  v6[6] = objc_opt_class();
  v6[7] = objc_opt_class();
  v6[8] = objc_opt_class();
  v6[9] = objc_opt_class();
  v6[10] = objc_opt_class();
  v6[11] = objc_opt_class();
  v6[12] = objc_opt_class();
  v6[13] = objc_opt_class();
  v6[14] = objc_opt_class();
  v6[15] = objc_opt_class();
  v6[16] = objc_opt_class();
  v6[17] = objc_opt_class();
  v6[18] = objc_opt_class();
  v6[19] = objc_opt_class();
  v6[20] = objc_opt_class();
  v6[21] = objc_opt_class();
  v6[22] = objc_opt_class();
  v6[23] = objc_opt_class();
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:24];
  v4 = [v2 setWithArray:v3];

  return v4;
}

+ (id)allowedVideoRequestClasses
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v6 count:3];
  v4 = objc_msgSend(v2, "setWithArray:", v3, v6, v7);

  return v4;
}

+ (id)allowedVideoResultClasses
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v6 count:3];
  v4 = objc_msgSend(v2, "setWithArray:", v3, v6, v7);

  return v4;
}

+ (id)allowedTextRequestClasses
{
  v6[2] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  v6[0] = objc_opt_class();
  v6[1] = objc_opt_class();
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:2];
  v4 = [v2 setWithArray:v3];

  return v4;
}

+ (id)allowedTextResultClasses
{
  v6[2] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  v6[0] = objc_opt_class();
  v6[1] = objc_opt_class();
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:2];
  v4 = [v2 setWithArray:v3];

  return v4;
}

+ (id)allowedMultiModalRequestClasses
{
  v6[2] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  v6[0] = objc_opt_class();
  v6[1] = objc_opt_class();
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:2];
  v4 = [v2 setWithArray:v3];

  return v4;
}

@end
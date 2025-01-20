@interface CHSSystemVersionStringToCompareAgainstFromSDKAndPlatform
@end

@implementation CHSSystemVersionStringToCompareAgainstFromSDKAndPlatform

void ___CHSSystemVersionStringToCompareAgainstFromSDKAndPlatform_block_invoke()
{
  v9[2] = *MEMORY[0x1E4F143B8];
  v8[0] = &unk_1EE0C1DB8;
  v6[0] = &unk_1EE0C1DD0;
  v6[1] = &unk_1EE0C1DE8;
  v7[0] = @"14.0";
  v7[1] = @"17.0";
  v6[2] = &unk_1EE0C1E00;
  v6[3] = &unk_1EE0C1E18;
  v7[2] = @"17.0";
  v7[3] = @"17.0";
  v6[4] = &unk_1EE0C1E30;
  v7[4] = @"17.0";
  v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:5];
  v8[1] = &unk_1EE0C1DD0;
  v9[0] = v0;
  v4[0] = &unk_1EE0C1DD0;
  v4[1] = &unk_1EE0C1DE8;
  v5[0] = @"15.0";
  v5[1] = @"18.0";
  v4[2] = &unk_1EE0C1E00;
  v4[3] = &unk_1EE0C1E18;
  v5[2] = @"18.0";
  v5[3] = @"18.0";
  v4[4] = &unk_1EE0C1E30;
  v5[4] = @"18.0";
  v1 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4 count:5];
  v9[1] = v1;
  uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:2];
  v3 = (void *)__sdkVersionPlatformToSystemVersion;
  __sdkVersionPlatformToSystemVersion = v2;
}

@end
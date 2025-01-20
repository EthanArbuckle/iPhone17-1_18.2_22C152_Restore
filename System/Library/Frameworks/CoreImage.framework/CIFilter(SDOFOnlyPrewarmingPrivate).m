@interface CIFilter(SDOFOnlyPrewarmingPrivate)
- (void)prewarmingString;
@end

@implementation CIFilter(SDOFOnlyPrewarmingPrivate)

- (void)prewarmingString
{
  OUTLINED_FUNCTION_5_2();
  [(id)objc_opt_class() description];
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_1_0(&dword_193671000, v0, v1, "%{public}@: Unable to create XMP data from CGImageMetadataRef for key %{public}@", v2, v3, v4, v5, v6);
}

+ (void)prewarmedFilterFromString:()SDOFOnlyPrewarmingPrivate .cold.1()
{
  OUTLINED_FUNCTION_5_2();
  [(id)objc_opt_class() description];
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_1_0(&dword_193671000, v0, v1, "%{public}@: Unable to unarchive data: = %{public}@", v2, v3, v4, v5, v6);
}

+ (void)prewarmedFilterFromString:()SDOFOnlyPrewarmingPrivate .cold.2()
{
  [(id)objc_opt_class() description];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_193671000, v0, v1, "%{public}@: Unable to find name of filter to create", v2, v3, v4, v5, v6);
}

+ (void)prewarmedFilterFromString:()SDOFOnlyPrewarmingPrivate .cold.3()
{
  OUTLINED_FUNCTION_5_2();
  [(id)objc_opt_class() description];
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_1_0(&dword_193671000, v0, v1, "%{public}@: Unable to create filter with name %{public}@", v2, v3, v4, v5, v6);
}

+ (void)prewarmedFilterFromString:()SDOFOnlyPrewarmingPrivate .cold.4()
{
  OUTLINED_FUNCTION_5_2();
  [(id)objc_opt_class() description];
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_1_0(&dword_193671000, v0, v1, "%{public}@: Unable extract XMP metadata for key %{public}@", v2, v3, v4, v5, v6);
}

+ (void)prewarmedFilterFromString:()SDOFOnlyPrewarmingPrivate .cold.5()
{
  [(id)objc_opt_class() description];
  OUTLINED_FUNCTION_1_0(&dword_193671000, v0, v1, "%{public}@: Unable to load camera calibration data %{public}@", v2, v3, v4, v5, 2u);
}

+ (void)prewarmedFilterFromString:()SDOFOnlyPrewarmingPrivate .cold.6()
{
}

+ (void)prewarmedFilterFromString:()SDOFOnlyPrewarmingPrivate .cold.7()
{
  OUTLINED_FUNCTION_5_2();
  [(id)objc_opt_class() description];
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_1_0(&dword_193671000, v0, v1, "%{public}@: Unable to decompress data: = %{public}@", v2, v3, v4, v5, v6);
}

- (void)verifyPrewarmedFilter:()SDOFOnlyPrewarmingPrivate .cold.1()
{
}

- (void)verifyPrewarmedFilter:()SDOFOnlyPrewarmingPrivate .cold.2()
{
}

- (void)verifyPrewarmedFilter:()SDOFOnlyPrewarmingPrivate .cold.3()
{
  [(id)objc_opt_class() description];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_193671000, v0, v1, "%{public}@: pixel size not identical", v2, v3, v4, v5, v6);
}

- (void)verifyPrewarmedFilter:()SDOFOnlyPrewarmingPrivate .cold.4()
{
  [(id)objc_opt_class() description];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_193671000, v0, v1, "%{public}@: lens distortion center not identical", v2, v3, v4, v5, v6);
}

- (void)verifyPrewarmedFilter:()SDOFOnlyPrewarmingPrivate .cold.5()
{
  [(id)objc_opt_class() description];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_193671000, v0, v1, "%{public}@: inverse lens distortion lookup table not identical", v2, v3, v4, v5, v6);
}

- (void)verifyPrewarmedFilter:()SDOFOnlyPrewarmingPrivate .cold.6()
{
  [(id)objc_opt_class() description];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_193671000, v0, v1, "%{public}@: lens distortion lookup table not identical", v2, v3, v4, v5, v6);
}

- (void)verifyPrewarmedFilter:()SDOFOnlyPrewarmingPrivate .cold.7()
{
  [(id)objc_opt_class() description];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_193671000, v0, v1, "%{public}@: Extrinsic matrix dimensions not identical", v2, v3, v4, v5, v6);
}

- (void)verifyPrewarmedFilter:()SDOFOnlyPrewarmingPrivate .cold.8()
{
  [(id)objc_opt_class() description];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_193671000, v0, v1, "%{public}@: Intrinsic matrix dimensions not identical", v2, v3, v4, v5, v6);
}

- (void)verifyPrewarmedFilter:()SDOFOnlyPrewarmingPrivate .cold.9()
{
  [(id)objc_opt_class() description];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_193671000, v0, v1, "%{public}@: Intrinsic matrix may not identical", v2, v3, v4, v5, v6);
}

- (void)verifyPrewarmedFilter:()SDOFOnlyPrewarmingPrivate .cold.10()
{
  [(id)objc_opt_class() description];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_193671000, v0, v1, "%{public}@: Colorspaces not identical", v2, v3, v4, v5, v6);
}

@end
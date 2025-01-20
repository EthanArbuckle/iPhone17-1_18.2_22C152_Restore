@interface ASCloudDevice(CloudKitCodingSupport)
@end

@implementation ASCloudDevice(CloudKitCodingSupport)

+ (void)cloudDeviceWithRecord:()CloudKitCodingSupport .cold.1(void *a1)
{
  id v2 = a1;
  v3 = [(id)OUTLINED_FUNCTION_7() values];
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_3(&dword_21EC60000, v4, v5, "Cloud device record missing build: %@", v6, v7, v8, v9, v10);
}

+ (void)cloudDeviceWithRecord:()CloudKitCodingSupport .cold.2(void *a1)
{
  id v2 = a1;
  v3 = [(id)OUTLINED_FUNCTION_7() values];
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_3(&dword_21EC60000, v4, v5, "Cloud device record missing OS version: %@", v6, v7, v8, v9, v10);
}

+ (void)cloudDeviceWithRecord:()CloudKitCodingSupport .cold.3(void *a1)
{
  id v2 = a1;
  v3 = [(id)OUTLINED_FUNCTION_7() values];
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_3(&dword_21EC60000, v4, v5, "Cloud device record missing device type: %@", v6, v7, v8, v9, v10);
}

+ (void)cloudDeviceWithRecord:()CloudKitCodingSupport .cold.4()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_21EC60000, v0, v1, "Cloud device record missing modification date", v2, v3, v4, v5, v6);
}

@end
@interface FPPreflightUserInteraction(CloudDocs)
@end

@implementation FPPreflightUserInteraction(CloudDocs)

+ (void)userInteractionErrorsInInfoPlistDict:()CloudDocs forAction:bundleID:hierarchyServicer:sourceNSFPItems:destinationNSFPItem:localizationLookup:provider:domain:extensionCapabilities:useFPFS:.cold.1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_23(&dword_1A33AE000, v0, v1, "[ERROR] Got nil fpItem for sourceItem %@", v2);
}

@end
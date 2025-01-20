@interface BRContainer(BRInternalAdditions)
+ (void)postContainerListUpdateNotification;
@end

@implementation BRContainer(BRInternalAdditions)

+ (void)versionOfBundle:()BRInternalAdditions changedFromVersion:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_4();
  _os_log_error_impl(&dword_19ED3F000, v0, (os_log_type_t)0x90u, "[ERROR] unable to retrieve properties without a bundle%@", v1, 0xCu);
}

+ (void)postContainerListUpdateNotification
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_19ED3F000, v0, v1, "[CRIT] Assertion failed: [BRContainerCache hasDaemonicParts]%@", v2, v3, v4, v5, v6);
}

+ (void)postContainerStatusChangeNotificationWithID:()BRInternalAdditions key:value:.cold.1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_19ED3F000, v0, v1, "[CRIT] Assertion failed: value != nil%@", v2, v3, v4, v5, v6);
}

- (void)_updateMetadataOnDiskWithProperties:()BRInternalAdditions .cold.1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_19ED3F000, v0, v1, "[CRIT] Assertion failed: !_mangledID.isCloudDocsMangledID%@", v2, v3, v4, v5, v6);
}

- (void)updateMetadataWithExtractorProperties:()BRInternalAdditions iconPaths:bundleID:.cold.1(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_6(&dword_19ED3F000, v1, v2, "[DEBUG] removed temporary path at '%@'%@", (void)v3, DWORD2(v3));
}

- (void)updateMetadataWithExtractorProperties:()BRInternalAdditions iconPaths:bundleID:.cold.2()
{
  OUTLINED_FUNCTION_11(*MEMORY[0x1E4F143B8]);
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_6(&dword_19ED3F000, v1, v2, "[DEBUG] metadata for container %@ are already up-to-date%@", (void)v3, DWORD2(v3));
}

- (void)updateMetadataWithExtractorProperties:()BRInternalAdditions iconPaths:bundleID:.cold.3()
{
  OUTLINED_FUNCTION_11(*MEMORY[0x1E4F143B8]);
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_6(&dword_19ED3F000, v1, v2, "[DEBUG] metadata for container %@ are equal except version number; perform local update only%@",
    (void)v3,
    DWORD2(v3));
}

- (void)updateMetadataWithExtractorProperties:()BRInternalAdditions iconPaths:bundleID:.cold.4()
{
  OUTLINED_FUNCTION_11(*MEMORY[0x1E4F143B8]);
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_6(&dword_19ED3F000, v1, v2, "[DEBUG] metadata for container %@ are equal except version number but icons are different%@", (void)v3, DWORD2(v3));
}

- (void)updateMetadataWithExtractorProperties:()BRInternalAdditions iconPaths:bundleID:.cold.5()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_19ED3F000, v0, v1, "[CRIT] Assertion failed: (!isEqual && !isEqualExceptVersionNumber) || (isEqual != isEqualExceptVersionNumber)%@", v2, v3, v4, v5, v6);
}

- (void)updateMetadataWithExtractorProperties:()BRInternalAdditions iconPaths:bundleID:.cold.6()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_19ED3F000, v0, v1, "[CRIT] Assertion failed: ![bundleID isEqualToString:BRDaemonBundleID]%@", v2, v3, v4, v5, v6);
}

- (void)updateMetadataWithExtractorProperties:()BRInternalAdditions iconPaths:bundleID:.cold.7()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_19ED3F000, v0, v1, "[CRIT] Assertion failed: bundleID%@", v2, v3, v4, v5, v6);
}

- (void)updateMetadataWithExtractorProperties:()BRInternalAdditions iconPaths:bundleID:.cold.8()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_19ED3F000, v0, v1, "[CRIT] Assertion failed: updatedProperties%@", v2, v3, v4, v5, v6);
}

- (void)updateMetadataWithRecordData:()BRInternalAdditions iconPaths:.cold.1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_0(&dword_19ED3F000, v0, v1, "[DEBUG] stripped plist from potential icon names%@", v2, v3, v4, v5, v6);
}

- (void)updateMetadataWithRecordData:()BRInternalAdditions iconPaths:.cold.2()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_19ED3F000, v0, v1, "[CRIT] Assertion failed: recordData%@", v2, v3, v4, v5, v6);
}

+ (void)_generateiOSIconsForMangledID:()BRInternalAdditions usingBundle:generatedIcons:.cold.1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_0(&dword_19ED3F000, v0, v1, "[DEBUG] unable to retrieve app icon%@", v2, v3, v4, v5, v6);
}

+ (void)_generateiOSIconsForMangledID:()BRInternalAdditions usingBundle:generatedIcons:.cold.2()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_0(&dword_19ED3F000, v0, v1, "[DEBUG] unable to find filenames that match the icons names.%@", v2, v3, v4, v5, v6);
}

+ (void)_generateiOSIconsForMangledID:()BRInternalAdditions usingBundle:generatedIcons:.cold.3(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_19ED3F000, v1, v2, "[ERROR] unable to generate icons for %@ without icon metadata%@", (void)v3, DWORD2(v3));
}

+ (void)_generateiOSIconsForMangledID:()BRInternalAdditions usingBundle:generatedIcons:.cold.4(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_6(&dword_19ED3F000, v1, v2, "[DEBUG] icon generated %@%@", (void)v3, DWORD2(v3));
}

+ (void)_generateiOSIconsForMangledID:()BRInternalAdditions usingBundle:generatedIcons:.cold.5(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_6(&dword_19ED3F000, v1, v2, "[DEBUG] unable to retrieve app icon %@%@", (void)v3, DWORD2(v3));
}

+ (void)_generateiOSIconsForMangledID:()BRInternalAdditions usingBundle:generatedIcons:.cold.6(void *a1)
{
  LODWORD(v3) = 134218242;
  *(void *)((char *)&v3 + 4) = *a1;
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_6(&dword_19ED3F000, v1, v2, "[DEBUG] ┏%llx generate iOS icons%@", (void)v3, DWORD2(v3));
}

- (void)containsExcludedDocumentsOnTheFSWithExcludedButPreservedFilename:()BRInternalAdditions excludedButPreservedExtensions:andStampUploadedAppWithXattr:.cold.1(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_6(&dword_19ED3F000, v1, v2, "[DEBUG] found an excluded file: %@%@", (void)v3, DWORD2(v3));
}

@end
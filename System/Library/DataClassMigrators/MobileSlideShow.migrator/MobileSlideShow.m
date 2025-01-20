Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return _CFPreferencesAppSynchronize(applicationID);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return _CFPreferencesCopyAppValue(key, applicationID);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
}

void CFRelease(CFTypeRef cf)
{
}

uint64_t MGGetBoolAnswer()
{
  return _MGGetBoolAnswer();
}

uint64_t PLCompleteDateFormatter()
{
  return _PLCompleteDateFormatter();
}

uint64_t PLHasInternalDiagnostics()
{
  return _PLHasInternalDiagnostics();
}

uint64_t PLMigrationGetLog()
{
  return _PLMigrationGetLog();
}

uint64_t PLStringFromDataMigrationRestoreType()
{
  return _PLStringFromDataMigrationRestoreType();
}

uint64_t PLStringFromQoSClass()
{
  return _PLStringFromQoSClass();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

{
}

{
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_enumerationMutation(id obj)
{
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

void objc_storeStrong(id *location, id obj)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

qos_class_t qos_class_self(void)
{
  return _qos_class_self();
}

id objc_msgSend__didRestoreFromDevice(void *a1, const char *a2, ...)
{
  return [a1 _didRestoreFromDevice];
}

id objc_msgSend__didRestoreFromMegaBackup(void *a1, const char *a2, ...)
{
  return [a1 _didRestoreFromMegaBackup];
}

id objc_msgSend__didRestoreFromiTunes(void *a1, const char *a2, ...)
{
  return [a1 _didRestoreFromiTunes];
}

id objc_msgSend__generateMigrationFilegroupsAndOptions(void *a1, const char *a2, ...)
{
  return [a1 _generateMigrationFilegroupsAndOptions];
}

id objc_msgSend__migrateAssetsdPreferencesDomain(void *a1, const char *a2, ...)
{
  return [a1 _migrateAssetsdPreferencesDomain];
}

id objc_msgSend__migrateCameraRollFiles(void *a1, const char *a2, ...)
{
  return [a1 _migrateCameraRollFiles];
}

id objc_msgSend__migrateMetadataFilesToPhotoData(void *a1, const char *a2, ...)
{
  return [a1 _migrateMetadataFilesToPhotoData];
}

id objc_msgSend__recordDataMigrationInfo(void *a1, const char *a2, ...)
{
  return [a1 _recordDataMigrationInfo];
}

id objc_msgSend__removeOldLargeThubnails(void *a1, const char *a2, ...)
{
  return [a1 _removeOldLargeThubnails];
}

id objc_msgSend__setOTARestoreTokenIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 _setOTARestoreTokenIfNeeded];
}

id objc_msgSend_assetsdClient(void *a1, const char *a2, ...)
{
  return [a1 assetsdClient];
}

id objc_msgSend_cameraRollPlistName(void *a1, const char *a2, ...)
{
  return [a1 cameraRollPlistName];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_createMetadataDirectoryIfNecessary(void *a1, const char *a2, ...)
{
  return [a1 createMetadataDirectoryIfNecessary];
}

id objc_msgSend_currentBuildVersionString(void *a1, const char *a2, ...)
{
  return [a1 currentBuildVersionString];
}

id objc_msgSend_dataMigrationWillFinish(void *a1, const char *a2, ...)
{
  return [a1 dataMigrationWillFinish];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_dcfDirectories(void *a1, const char *a2, ...)
{
  return [a1 dcfDirectories];
}

id objc_msgSend_deleteFiles(void *a1, const char *a2, ...)
{
  return [a1 deleteFiles];
}

id objc_msgSend_deleteObsoleteFiles(void *a1, const char *a2, ...)
{
  return [a1 deleteObsoleteFiles];
}

id objc_msgSend_didMigrateBackupFromDifferentDevice(void *a1, const char *a2, ...)
{
  return [a1 didMigrateBackupFromDifferentDevice];
}

id objc_msgSend_didRestoreFromBackup(void *a1, const char *a2, ...)
{
  return [a1 didRestoreFromBackup];
}

id objc_msgSend_didRestoreFromCloudBackup(void *a1, const char *a2, ...)
{
  return [a1 didRestoreFromCloudBackup];
}

id objc_msgSend_didUpgrade(void *a1, const char *a2, ...)
{
  return [a1 didUpgrade];
}

id objc_msgSend_fileGroups(void *a1, const char *a2, ...)
{
  return [a1 fileGroups];
}

id objc_msgSend_fileManager(void *a1, const char *a2, ...)
{
  return [a1 fileManager];
}

id objc_msgSend_hasObsoleteFiles(void *a1, const char *a2, ...)
{
  return [a1 hasObsoleteFiles];
}

id objc_msgSend_hasVideoFile(void *a1, const char *a2, ...)
{
  return [a1 hasVideoFile];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_libraryURL(void *a1, const char *a2, ...)
{
  return [a1 libraryURL];
}

id objc_msgSend_migrationClient(void *a1, const char *a2, ...)
{
  return [a1 migrationClient];
}

id objc_msgSend_pathExtension(void *a1, const char *a2, ...)
{
  return [a1 pathExtension];
}

id objc_msgSend_pathForContainingDirectory(void *a1, const char *a2, ...)
{
  return [a1 pathForContainingDirectory];
}

id objc_msgSend_pathForFullSizeImage(void *a1, const char *a2, ...)
{
  return [a1 pathForFullSizeImage];
}

id objc_msgSend_pathForPrebakedThumbnail(void *a1, const char *a2, ...)
{
  return [a1 pathForPrebakedThumbnail];
}

id objc_msgSend_pathForPrebakedWildcatThumbnailsFile(void *a1, const char *a2, ...)
{
  return [a1 pathForPrebakedWildcatThumbnailsFile];
}

id objc_msgSend_pathForThumbnailFile(void *a1, const char *a2, ...)
{
  return [a1 pathForThumbnailFile];
}

id objc_msgSend_pathForVideoFile(void *a1, const char *a2, ...)
{
  return [a1 pathForVideoFile];
}

id objc_msgSend_pathForVideoPreviewFile(void *a1, const char *a2, ...)
{
  return [a1 pathForVideoPreviewFile];
}

id objc_msgSend_pathManager(void *a1, const char *a2, ...)
{
  return [a1 pathManager];
}

id objc_msgSend_performMigration(void *a1, const char *a2, ...)
{
  return [a1 performMigration];
}

id objc_msgSend_removeAsidePhotosDatabase(void *a1, const char *a2, ...)
{
  return [a1 removeAsidePhotosDatabase];
}

id objc_msgSend_removeInternalMemoriesRelatedSnapshotDirectory(void *a1, const char *a2, ...)
{
  return [a1 removeInternalMemoriesRelatedSnapshotDirectory];
}

id objc_msgSend_removeLegacyMetadataFiles(void *a1, const char *a2, ...)
{
  return [a1 removeLegacyMetadataFiles];
}

id objc_msgSend_removeModelInterestDatabase(void *a1, const char *a2, ...)
{
  return [a1 removeModelInterestDatabase];
}

id objc_msgSend_stringByDeletingLastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 stringByDeletingLastPathComponent];
}

id objc_msgSend_systemLibraryPathManager(void *a1, const char *a2, ...)
{
  return [a1 systemLibraryPathManager];
}

id objc_msgSend_thumbnailFilename(void *a1, const char *a2, ...)
{
  return [a1 thumbnailFilename];
}

id objc_msgSend_userDataDisposition(void *a1, const char *a2, ...)
{
  return [a1 userDataDisposition];
}

id objc_msgSend_writeToFile_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeToFile:options:error:");
}
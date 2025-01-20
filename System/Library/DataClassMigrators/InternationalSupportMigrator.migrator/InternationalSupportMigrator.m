uint64_t DMCopyCurrentBuildVersion()
{
  return _DMCopyCurrentBuildVersion();
}

uint64_t DMGetPreviousBuildVersion()
{
  return _DMGetPreviousBuildVersion();
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

id objc_msgSend_performMigration(void *a1, const char *a2, ...)
{
  return [a1 performMigration];
}

id objc_msgSend_userDataDisposition(void *a1, const char *a2, ...)
{
  return [a1 userDataDisposition];
}
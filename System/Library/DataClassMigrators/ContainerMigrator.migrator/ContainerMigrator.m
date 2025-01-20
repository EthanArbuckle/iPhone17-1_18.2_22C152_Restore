void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  __os_log_fault_impl(dso, log, type, format, buf, size);
}

uint64_t container_log_handle_for_category()
{
  return _container_log_handle_for_category();
}

uint64_t container_perform_data_migration()
{
  return _container_perform_data_migration();
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}
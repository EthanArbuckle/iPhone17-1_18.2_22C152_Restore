@interface _CNAutocompleteQueryCacheMissOSLogging
- (OS_os_log)os_log;
- (_CNAutocompleteQueryCacheMissOSLogging)init;
- (void)didReturnCacheFalseNegatives:(id)a3;
- (void)didReturnCacheFalsePositives:(id)a3;
@end

@implementation _CNAutocompleteQueryCacheMissOSLogging

- (_CNAutocompleteQueryCacheMissOSLogging)init
{
  v7.receiver = self;
  v7.super_class = (Class)_CNAutocompleteQueryCacheMissOSLogging;
  v2 = [(_CNAutocompleteQueryCacheMissOSLogging *)&v7 init];
  if (v2)
  {
    os_log_t v3 = os_log_create("com.apple.contacts.autocomplete", "cache");
    os_log = v2->_os_log;
    v2->_os_log = (OS_os_log *)v3;

    v5 = v2;
  }

  return v2;
}

- (void)didReturnCacheFalseNegatives:(id)a3
{
  id v4 = a3;
  v5 = [(_CNAutocompleteQueryCacheMissOSLogging *)self os_log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    -[_CNAutocompleteQueryCacheMissOSLogging didReturnCacheFalseNegatives:](v4);
  }
}

- (void)didReturnCacheFalsePositives:(id)a3
{
  id v4 = a3;
  v5 = [(_CNAutocompleteQueryCacheMissOSLogging *)self os_log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    -[_CNAutocompleteQueryCacheMissOSLogging didReturnCacheFalsePositives:](v4);
  }
}

- (OS_os_log)os_log
{
  return (OS_os_log *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
}

- (void)didReturnCacheFalseNegatives:(void *)a1 .cold.1(void *a1)
{
  [a1 count];
  OUTLINED_FUNCTION_0(&dword_1BEF57000, v1, v2, "Server returned %lu result(s) not returned from the cache", v3, v4, v5, v6, 0);
}

- (void)didReturnCacheFalsePositives:(void *)a1 .cold.1(void *a1)
{
  [a1 count];
  OUTLINED_FUNCTION_0(&dword_1BEF57000, v1, v2, "Cache returned %lu result(s) not returned by the server", v3, v4, v5, v6, 0);
}

@end
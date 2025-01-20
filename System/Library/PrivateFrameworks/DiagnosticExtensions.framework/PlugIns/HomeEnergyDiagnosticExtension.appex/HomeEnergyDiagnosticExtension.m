void sub_1000038FC(os_log_t log)
{
  int v1;
  uint64_t v2;

  v1 = 138412290;
  v2 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Unable to find directory: %@.", (uint8_t *)&v1, 0xCu);
}

void sub_100003978(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Unable to find contents in directory: %@.", (uint8_t *)&v2, 0xCu);
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_enumerationMutation(id obj)
{
}

void objc_storeStrong(id *location, id obj)
{
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return [a1 path];
}
        v8 = ithCapacity:"", [v6 count]);
        v22 = 0u;
        v23 = 0u;
        v24 = 0u;
        v25 = 0u;
        v19 = v6;
        v9 = v6;
        v10 = [v9 countByEnumeratingWithState:&v22 objects:v27 count:16];
        if (v10)
        {
          v11 = v10;
          v12 = *(void *)v23;
          do
          {
            for (i = 0; i != v11; i = (char *)i + 1)
            {
              if (*(void *)v23 != v12) {
                objc_enumerationMutation(v9);
              }
              v14 = objc_msgSend(*(id *)(*((void *)&v22 + 1) + 8 * i), "path", v19);
              if (([v14 containsString:@"LocalCache.store"] & 1) != 0
                || [v14 containsString:@"HomeEnergyDiagnosticsDump.plist"])
              {
                v15 = +[DEAttachmentItem attachmentWithPath:v14];
                [v8 addObject:v15];
              }
            }
            v11 = [v9 countByEnumeratingWithState:&v22 objects:v27 count:16];
          }
          while (v11);
        }

        v16 = [v8 copy];
        uint64_t v3 = v21;
        v6 = v19;
        v7 = v20;
        goto LABEL_23;
      }
    }
    else
    {
      v17 = self->_log;
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        sub_100003978((uint64_t)v7, v17);
      }
    }
    v16 = &__NSArray0__struct;
LABEL_23:

    goto LABEL_24;
  }
  if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR)) {
    sub_1000038FC(log);
  }
  v7 = 0;
  v16 = &__NSArray0__struct;
LABEL_24:

  return v16;
}

- (void).cxx_destruct
{
}

@end
@interface OfficeImportCompatibility
+ (id)searchableAttributesForOfficeFile:(id)a3;
@end

@implementation OfficeImportCompatibility

+ (id)searchableAttributesForOfficeFile:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if (!sub_23695A124())
  {
LABEL_11:
    v10 = 0;
    goto LABEL_12;
  }
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x2050000000;
  v4 = (void *)qword_2688A6ED8;
  uint64_t v17 = qword_2688A6ED8;
  if (!qword_2688A6ED8)
  {
    *(void *)buf = MEMORY[0x263EF8330];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = sub_23695A1F4;
    v19 = &unk_264CB4568;
    v20 = &v14;
    sub_23695A1F4(buf);
    v4 = (void *)v15[3];
  }
  id v5 = v4;
  _Block_object_dispose(&v14, 8);
  v6 = objc_opt_new();
  v9 = v6;
  if (!v6)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_2367AD000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Could not load OISpotlightImporter", buf, 2u);
    }
    goto LABEL_11;
  }
  id v13 = 0;
  v10 = objc_msgSend_searchableAttributesForOfficeFileAtURL_error_(v6, v7, (uint64_t)v3, (uint64_t)&v13, v8);
  id v11 = v13;
  if (!v10 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412546;
    *(void *)&buf[4] = v3;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v11;
    _os_log_error_impl(&dword_2367AD000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Could not extract metadata from %@: error %@", buf, 0x16u);
  }

LABEL_12:
  return v10;
}

@end
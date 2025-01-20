@interface IDSUserManagement
+ (BOOL)isThreadDataSeparated;
@end

@implementation IDSUserManagement

+ (BOOL)isThreadDataSeparated
{
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x2050000000;
  v2 = (void *)qword_100A4CA00;
  uint64_t v12 = qword_100A4CA00;
  if (!qword_100A4CA00)
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100405DB0;
    v8[3] = &unk_10097ED88;
    v8[4] = &v9;
    sub_100405DB0((uint64_t)v8);
    v2 = (void *)v10[3];
  }
  id v3 = v2;
  _Block_object_dispose(&v9, 8);
  v4 = [v3 currentPersona];
  unsigned int v5 = [v4 isDataSeparatedPersona];
  if (v5 && os_variant_allows_internal_security_policies())
  {
    v6 = +[IMIDSLog daemon];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_100724168(v4, v6);
    }
  }
  return v5;
}

@end
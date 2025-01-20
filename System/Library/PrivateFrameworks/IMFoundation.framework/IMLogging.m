@interface IMLogging
+ (BOOL)loggingEnabledForLevel:(int)a3;
+ (id)dateFormatter;
+ (id)logFileDirectory;
+ (id)stringForDate;
+ (id)timeFormatter;
+ (void)enableConsoleLoggingForLevel:(int)a3;
+ (void)logAtLevel:(int)a3 type:(id)a4 category:(id)a5 format:(id)a6;
+ (void)logAtLevel:(int)a3 type:(id)a4 category:(id)a5 format:(id)a6 arguments:(char *)a7;
+ (void)logAtLevel:(int)a3 type:(id)a4 category:(id)a5 insertProcessInfo:(BOOL)a6 format:(id)a7;
+ (void)logAtLevel:(int)a3 type:(id)a4 category:(id)a5 insertProcessInfo:(BOOL)a6 format:(id)a7 arguments:(char *)a8;
+ (void)logAtLevel:(int)a3 type:(id)a4 category:(id)a5 insertProcessInfo:(BOOL)a6 simpleLogString:(id)a7;
+ (void)logAtLevel:(int)a3 type:(id)a4 category:(id)a5 insertProcessInfo:(BOOL)a6 simpleLogString:(id)a7 format:(id)a8 arguments:(char *)a9 time:(unint64_t)a10;
+ (void)logAtLevel:(int)a3 type:(id)a4 category:(id)a5 insertProcessInfo:(BOOL)a6 simpleLogString:(id)a7 time:(unint64_t)a8;
+ (void)logString:(id)a3 toFolder:(id)a4 toFileNamed:(id)a5;
@end

@implementation IMLogging

+ (BOOL)loggingEnabledForLevel:(int)a3
{
  return 1;
}

+ (id)stringForDate
{
  return IMCreateStringFromDate(0);
}

+ (void)logAtLevel:(int)a3 type:(id)a4 category:(id)a5 format:(id)a6
{
  objc_msgSend_logAtLevel_type_category_insertProcessInfo_format_arguments_(a1, a2, *(uint64_t *)&a3, (uint64_t)a4, a5, 1, a6, &v6);
}

+ (void)logAtLevel:(int)a3 type:(id)a4 category:(id)a5 insertProcessInfo:(BOOL)a6 format:(id)a7
{
  objc_msgSend_logAtLevel_type_category_insertProcessInfo_format_arguments_(a1, a2, *(uint64_t *)&a3, (uint64_t)a4, a5, a6, a7, &v7);
}

+ (void)logAtLevel:(int)a3 type:(id)a4 category:(id)a5 format:(id)a6 arguments:(char *)a7
{
}

+ (void)logAtLevel:(int)a3 type:(id)a4 category:(id)a5 insertProcessInfo:(BOOL)a6 simpleLogString:(id)a7 format:(id)a8 arguments:(char *)a9 time:(unint64_t)a10
{
  BOOL v12 = a6;
  id v52 = a5;
  id v15 = a7;
  id v16 = a8;
  id v17 = a4;
  v18 = IMCreateStringFromDate(a10);
  id v19 = objc_alloc(MEMORY[0x1E4F28E78]);
  v22 = objc_msgSend_initWithString_(v19, v20, (uint64_t)v18, v21);
  if (v15) {
    FormatString = (__CFString *)v15;
  }
  else {
    FormatString = _IMFastCreateFormatString(v16, a9);
  }
  v31 = FormatString;
  if (dword_1E92DA970 >= a3) {
    _IMLog(@"%@", v24, v25, v26, v27, v28, v29, v30, (char)FormatString);
  }
  if (qword_1E92DB7E8 != -1) {
    dispatch_once(&qword_1E92DB7E8, &unk_1EE230AB8);
  }
  id v32 = (id)qword_1E92DB7E0;
  if (objc_msgSend_length(v52, v33, v34, v35))
  {
    id v38 = v52;

    id v32 = v38;
  }
  v39 = objc_msgSend_stringByAppendingString_(v32, v36, @".log", v37);
  objc_msgSend_appendString_(v22, v40, @" ", v41);
  if (v12)
  {
    uint64_t v44 = qword_1E92DB7E0;
    uint64_t v45 = getpid();
    objc_msgSend_appendFormat_(v22, v46, @"%@[%i]: %@", v47, v44, v45, v31);
  }
  else
  {
    objc_msgSend_appendString_(v22, v42, (uint64_t)v31, v43);
  }
  objc_msgSend_appendString_(v22, v48, @"\n", v49);
  objc_msgSend_logString_toFolder_toFileNamed_(a1, v50, (uint64_t)v22, (uint64_t)v17, v39);
}

+ (void)logAtLevel:(int)a3 type:(id)a4 category:(id)a5 insertProcessInfo:(BOOL)a6 format:(id)a7 arguments:(char *)a8
{
}

+ (void)logAtLevel:(int)a3 type:(id)a4 category:(id)a5 insertProcessInfo:(BOOL)a6 simpleLogString:(id)a7 time:(unint64_t)a8
{
}

+ (void)logAtLevel:(int)a3 type:(id)a4 category:(id)a5 insertProcessInfo:(BOOL)a6 simpleLogString:(id)a7
{
}

+ (id)logFileDirectory
{
  if (qword_1E92DB7F0 != -1) {
    dispatch_once(&qword_1E92DB7F0, &unk_1EE230E38);
  }
  v2 = (void *)qword_1E92DB7F8;
  return v2;
}

+ (id)dateFormatter
{
  v4 = objc_msgSend_currentThread(MEMORY[0x1E4F29060], a2, v2, v3);
  v8 = objc_msgSend_threadDictionary(v4, v5, v6, v7);

  objc_msgSend_objectForKey_(v8, v9, @"_IMLoggingDateFormatter", v10);
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    id v11 = objc_alloc_init(MEMORY[0x1E4F28C10]);
    objc_msgSend_setDateFormat_(v11, v12, @"MM/dd/YY HH:mm:ss", v13);
    id v14 = objc_alloc(MEMORY[0x1E4F1CA20]);
    id v17 = objc_msgSend_initWithLocaleIdentifier_(v14, v15, @"en_US", v16);
    objc_msgSend_setLocale_(v11, v18, (uint64_t)v17, v19);
    objc_msgSend_setObject_forKey_(v8, v20, (uint64_t)v11, @"_IMLoggingDateFormatter");
  }
  return v11;
}

+ (id)timeFormatter
{
  v4 = objc_msgSend_currentThread(MEMORY[0x1E4F29060], a2, v2, v3);
  v8 = objc_msgSend_threadDictionary(v4, v5, v6, v7);

  objc_msgSend_objectForKey_(v8, v9, @"_IMLoggingTimeFormatter", v10);
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    id v11 = objc_alloc_init(MEMORY[0x1E4F28C10]);
    objc_msgSend_setDateFormat_(v11, v12, @"HH:mm:ss", v13);
    id v14 = objc_alloc(MEMORY[0x1E4F1CA20]);
    id v17 = objc_msgSend_initWithLocaleIdentifier_(v14, v15, @"en_US", v16);
    objc_msgSend_setLocale_(v11, v18, (uint64_t)v17, v19);
    objc_msgSend_setObject_forKey_(v8, v20, (uint64_t)v11, @"_IMLoggingTimeFormatter");
  }
  return v11;
}

+ (void)logString:(id)a3 toFolder:(id)a4 toFileNamed:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (qword_1E92DB818 != -1) {
    dispatch_once(&qword_1E92DB818, &unk_1EE230138);
  }
  id v11 = qword_1E92DB810;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = sub_1918CB4E4;
  v15[3] = &unk_1E57241F8;
  id v16 = v9;
  id v17 = v10;
  id v18 = v8;
  id v19 = a1;
  id v12 = v8;
  id v13 = v10;
  id v14 = v9;
  dispatch_async(v11, v15);
}

+ (void)enableConsoleLoggingForLevel:(int)a3
{
  dword_1E92DA970 = a3;
}

@end
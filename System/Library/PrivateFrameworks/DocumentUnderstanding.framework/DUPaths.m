@interface DUPaths
+ (id)filename:(id)a3;
+ (id)filename:(id)a3 createIfNeeded:(BOOL)a4;
+ (id)filename:(id)a3 subdirectory:(id)a4;
+ (id)filename:(id)a3 subdirectory:(id)a4 createIfNeeded:(BOOL)a5;
+ (id)subdirectory:(id)a3;
+ (id)subdirectory:(id)a3 createIfNeeded:(BOOL)a4;
+ (id)topDirectory;
+ (id)topDirectoryCreateIfNeeded:(BOOL)a3;
@end

@implementation DUPaths

+ (id)filename:(id)a3 subdirectory:(id)a4 createIfNeeded:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  v10 = (void *)MEMORY[0x237E079B0]();
  v13 = objc_msgSend_subdirectory_createIfNeeded_(a1, v11, (uint64_t)v9, v5, v12);
  v17 = objc_msgSend_stringByAppendingPathComponent_(v13, v14, (uint64_t)v8, v15, v16);

  return v17;
}

+ (id)filename:(id)a3 subdirectory:(id)a4
{
  return (id)MEMORY[0x270F9A6D0](a1, sel_filename_subdirectory_createIfNeeded_, a3, a4, 1);
}

+ (id)filename:(id)a3 createIfNeeded:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = (void *)MEMORY[0x237E079B0]();
  v11 = objc_msgSend_topDirectoryCreateIfNeeded_(a1, v8, v4, v9, v10);
  uint64_t v15 = objc_msgSend_stringByAppendingPathComponent_(v11, v12, (uint64_t)v6, v13, v14);

  return v15;
}

+ (id)filename:(id)a3
{
  return (id)((uint64_t (*)(id, char *, id, uint64_t))MEMORY[0x270F9A6D0])(a1, sel_filename_createIfNeeded_, a3, 1);
}

+ (id)subdirectory:(id)a3 createIfNeeded:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = (void *)MEMORY[0x237E079B0]();
  v11 = objc_msgSend_topDirectoryCreateIfNeeded_(a1, v8, v4, v9, v10);
  uint64_t v15 = objc_msgSend_stringByAppendingPathComponent_(v11, v12, (uint64_t)v6, v13, v14);

  if (v4) {
    sub_23696C414((uint64_t)a1, v15);
  }

  return v15;
}

+ (id)subdirectory:(id)a3
{
  return (id)objc_msgSend_subdirectory_createIfNeeded_(a1, a2, (uint64_t)a3, 1, v3);
}

+ (id)topDirectoryCreateIfNeeded:(BOOL)a3
{
  return sub_23696C848((uint64_t)a1, a3);
}

+ (id)topDirectory
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_23696CA98;
  block[3] = &unk_264CB45A0;
  block[4] = a1;
  if (qword_2688A6EE8 != -1) {
    dispatch_once(&qword_2688A6EE8, block);
  }
  v2 = (void *)qword_2688A6EE0;
  return v2;
}

@end
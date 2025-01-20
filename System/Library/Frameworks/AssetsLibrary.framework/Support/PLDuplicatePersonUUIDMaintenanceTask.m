@interface PLDuplicatePersonUUIDMaintenanceTask
- (BOOL)runTaskWithTransaction:(id)a3;
@end

@implementation PLDuplicatePersonUUIDMaintenanceTask

- (BOOL)runTaskWithTransaction:(id)a3
{
  id v4 = a3;
  [(PLMaintenanceTask *)self photoLibrary];
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10000CB4C;
  v8[3] = &unk_10002D550;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  id v9 = v5;
  v10 = &v11;
  [v5 performBlockAndWait:v8];
  char v6 = *((unsigned char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return v6;
}

@end
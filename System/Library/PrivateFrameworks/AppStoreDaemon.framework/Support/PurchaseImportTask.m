@interface PurchaseImportTask
- (PurchaseImportTask)init;
- (void)main;
@end

@implementation PurchaseImportTask

- (PurchaseImportTask)init
{
  v3.receiver = self;
  v3.super_class = (Class)PurchaseImportTask;
  result = [(Task *)&v3 init];
  if (result) {
    result->_lock._os_unfair_lock_opaque = 0;
  }
  return result;
}

- (void)main
{
  objc_super v3 = +[NSMutableArray arrayWithCapacity:[(NSArray *)self->_storeItems count]];
  BOOL v4 = [(NSArray *)self->_storeItems count] > 1;
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  storeItems = self->_storeItems;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100251BE4;
  v12[3] = &unk_100523B60;
  v12[4] = self;
  BOOL v15 = v4;
  id v6 = v3;
  id v13 = v6;
  v14 = &v16;
  [(NSArray *)storeItems enumerateObjectsUsingBlock:v12];
  v7 = sub_1002ED270();
  sub_1002EDDA0((uint64_t)v7, 0x4000);

  sub_1002B0890((uint64_t)self->_purchaseBatch, v6, self->_purchaseInfo);
  if (*((unsigned char *)v17 + 24))
  {
    v8 = sub_1002ED270();
    sub_1002EE378((uint64_t)v8);
  }
  v9 = ASDLogHandleForCategory();
  os_signpost_id_t v10 = [(PurchaseInfo *)self->_purchaseInfo signpostID];
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)v11 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v9, OS_SIGNPOST_INTERVAL_END, v10, "Purchase/Import", "", v11, 2u);
  }

  [(Task *)self completeWithSuccess];
  _Block_object_dispose(&v16, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storeItems, 0);
  objc_storeStrong((id *)&self->_purchaseInfo, 0);
  objc_storeStrong((id *)&self->_purchaseBatch, 0);
}

@end
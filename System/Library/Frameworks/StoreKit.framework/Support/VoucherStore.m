@interface VoucherStore
+ (VoucherStore)sharedInstance;
- (VoucherStore)init;
- (void)insertVoucher:(id)a3 forExternalID:(id)a4;
- (void)removeVoucherForExternalID:(id)a3;
- (void)usingVoucherForExternalID:(id)a3 applyQOSClass:(unsigned int)a4 executeBlock:(id)a5;
@end

@implementation VoucherStore

+ (VoucherStore)sharedInstance
{
  if (qword_10039FDA0 != -1) {
    dispatch_once(&qword_10039FDA0, &stru_100359530);
  }
  v2 = (void *)qword_10039FDA8;

  return (VoucherStore *)v2;
}

- (VoucherStore)init
{
  v6.receiver = self;
  v6.super_class = (Class)VoucherStore;
  v2 = [(VoucherStore *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    vouchers = v2->_vouchers;
    v2->_vouchers = v3;
  }
  return v2;
}

- (void)insertVoucher:(id)a3 forExternalID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (qword_10039FDF8 != -1) {
    dispatch_once(&qword_10039FDF8, &stru_100359550);
  }
  v8 = qword_10039FDB0;
  if (os_log_type_enabled((os_log_t)qword_10039FDB0, OS_LOG_TYPE_DEBUG)) {
    sub_1002C672C((uint64_t)v7, (uint64_t)v6, v8);
  }
  v9 = self;
  objc_sync_enter(v9);
  [(NSMutableDictionary *)v9->_vouchers setObject:v6 forKeyedSubscript:v7];
  objc_sync_exit(v9);
}

- (void)removeVoucherForExternalID:(id)a3
{
  id v4 = a3;
  if (qword_10039FDF8 != -1) {
    dispatch_once(&qword_10039FDF8, &stru_100359550);
  }
  v5 = qword_10039FDB0;
  if (os_log_type_enabled((os_log_t)qword_10039FDB0, OS_LOG_TYPE_DEBUG)) {
    sub_1002C67B4((uint64_t)v4, v5);
  }
  id v6 = self;
  objc_sync_enter(v6);
  [(NSMutableDictionary *)v6->_vouchers setObject:0 forKeyedSubscript:v4];
  objc_sync_exit(v6);
}

- (void)usingVoucherForExternalID:(id)a3 applyQOSClass:(unsigned int)a4 executeBlock:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v10 = self;
  objc_sync_enter(v10);
  v11 = [(NSMutableDictionary *)v10->_vouchers objectForKeyedSubscript:v8];
  objc_sync_exit(v10);

  if (qword_10039FDF8 != -1) {
    dispatch_once(&qword_10039FDF8, &stru_100359550);
  }
  v12 = qword_10039FDB0;
  if (os_log_type_enabled((os_log_t)qword_10039FDB0, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    id v17 = v8;
    __int16 v18 = 1024;
    unsigned int v19 = a4;
    __int16 v20 = 2112;
    v21 = v11;
    _os_log_debug_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "(VoucherStore) Executing block for externalID: %@, QOS(0x%x) Voucher %@", buf, 0x1Cu);
  }
  v15 = v9;
  id v13 = v9;
  v14 = (void (**)(void))dispatch_block_create_with_voucher_and_qos_class();
  v14[2]();
}

- (void).cxx_destruct
{
}

@end
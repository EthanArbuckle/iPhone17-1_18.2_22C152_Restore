@interface CLOSTransaction
- (CLOSTransaction)initWithDescription:(const char *)a3;
- (void)dealloc;
@end

@implementation CLOSTransaction

- (CLOSTransaction)initWithDescription:(const char *)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v10.receiver = self;
  v10.super_class = (Class)CLOSTransaction;
  v4 = [(CLOSTransaction *)&v10 init];
  if (v4)
  {
    v4->_description = (NSString *)(id)[NSString stringWithUTF8String:a3];
    v4->_transaction = (OS_os_transaction *)os_transaction_create();
    if (qword_1E929F6F0 != -1) {
      dispatch_once(&qword_1E929F6F0, &unk_1EE005AE0);
    }
    v5 = qword_1E929F6F8;
    if (os_log_type_enabled((os_log_t)qword_1E929F6F8, OS_LOG_TYPE_DEFAULT))
    {
      description = v4->_description;
      *(_DWORD *)buf = 134218242;
      p_transaction = &v4->_transaction;
      __int16 v17 = 2112;
      v18 = description;
      _os_log_impl(&dword_1906B8000, v5, OS_LOG_TYPE_DEFAULT, "os_transaction created: (%p) %@", buf, 0x16u);
    }
    if (sub_1906CB57C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1E929F6F0 != -1) {
        dispatch_once(&qword_1E929F6F0, &unk_1EE005AE0);
      }
      v8 = v4->_description;
      int v11 = 134218242;
      v12 = &v4->_transaction;
      __int16 v13 = 2112;
      v14 = v8;
      v9 = (char *)_os_log_send_and_compose_impl();
      sub_1906D4A28("Generic", 1, 0, 2, "-[CLOSTransaction initWithDescription:]", "CoreLocation: %s\n", v9);
      if (v9 != (char *)buf) {
        free(v9);
      }
    }
  }
  return v4;
}

- (void)dealloc
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (qword_1E929F6F0 != -1) {
    dispatch_once(&qword_1E929F6F0, &unk_1EE005AE0);
  }
  v3 = qword_1E929F6F8;
  if (os_log_type_enabled((os_log_t)qword_1E929F6F8, OS_LOG_TYPE_DEFAULT))
  {
    description = self->_description;
    *(_DWORD *)buf = 134218242;
    p_transaction = &self->_transaction;
    __int16 v14 = 2112;
    v15 = description;
    _os_log_impl(&dword_1906B8000, v3, OS_LOG_TYPE_DEFAULT, "os_transaction released: (%p) %@", buf, 0x16u);
  }
  if (sub_1906CB57C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1E929F6F0 != -1) {
      dispatch_once(&qword_1E929F6F0, &unk_1EE005AE0);
    }
    v5 = self->_description;
    int v8 = 134218242;
    v9 = &self->_transaction;
    __int16 v10 = 2112;
    int v11 = v5;
    v6 = (char *)_os_log_send_and_compose_impl();
    sub_1906D4A28("Generic", 1, 0, 2, "-[CLOSTransaction dealloc]", "CoreLocation: %s\n", v6);
    if (v6 != (char *)buf) {
      free(v6);
    }
  }

  self->_transaction = 0;
  self->_description = 0;
  v7.receiver = self;
  v7.super_class = (Class)CLOSTransaction;
  [(CLOSTransaction *)&v7 dealloc];
}

@end
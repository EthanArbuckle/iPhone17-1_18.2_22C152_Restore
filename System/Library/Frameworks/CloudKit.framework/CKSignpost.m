@interface CKSignpost
+ (id)signpost;
- (CKSignpost)init;
- (CKSignpost)initWithLog:(id)a3;
- (OS_os_log)log;
- (unint64_t)identifier;
@end

@implementation CKSignpost

- (void).cxx_destruct
{
}

- (OS_os_log)log
{
  return self->_log;
}

- (unint64_t)identifier
{
  return self->_identifier;
}

+ (id)signpost
{
  v2 = objc_alloc_init(CKSignpost);

  return v2;
}

- (CKSignpost)init
{
  os_log_t v3 = os_log_create("com.apple.cloudkit", "Telemetry");
  v6 = (CKSignpost *)objc_msgSend_initWithLog_(self, v4, (uint64_t)v3, v5);

  return v6;
}

- (CKSignpost)initWithLog:(id)a3
{
  uint64_t v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CKSignpost;
  v6 = [(CKSignpost *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_log, a3);
    v7->_identifier = os_signpost_id_generate(v5);
  }

  return v7;
}

@end
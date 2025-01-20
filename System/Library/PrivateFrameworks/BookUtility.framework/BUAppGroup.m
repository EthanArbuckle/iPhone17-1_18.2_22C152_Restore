@interface BUAppGroup
+ (BOOL)isUnitTesting;
+ (BUAppGroup)books;
- (BUAppGroup)initWithIdentifier:(id)a3;
- (NSString)identifier;
- (NSURL)containerURL;
- (NSUserDefaults)userDefaults;
@end

@implementation BUAppGroup

+ (BOOL)isUnitTesting
{
  if (qword_26AB404E0 != -1) {
    dispatch_once(&qword_26AB404E0, &unk_26CF10A78);
  }
  return byte_267D298C0;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSURL)containerURL
{
  containerURL = self->_containerURL;
  if (containerURL) {
    goto LABEL_8;
  }
  v4 = objc_opt_class();
  if (objc_msgSend_isUnitTesting(v4, v5, v6))
  {
    if (qword_267D298C8 != -1) {
      dispatch_once(&qword_267D298C8, &unk_26CF10A98);
    }
    v9 = (NSURL *)(id)qword_267D298D0;
    v10 = self->_containerURL;
    self->_containerURL = v9;
  }
  else
  {
    v10 = objc_msgSend_defaultManager(MEMORY[0x263F08850], v7, v8);
    v13 = objc_msgSend_identifier(self, v11, v12);
    objc_msgSend_containerURLForSecurityApplicationGroupIdentifier_(v10, v14, (uint64_t)v13);
    v15 = (NSURL *)objc_claimAutoreleasedReturnValue();
    v16 = self->_containerURL;
    self->_containerURL = v15;
  }
  containerURL = self->_containerURL;
  if (containerURL)
  {
LABEL_8:
    v17 = containerURL;
  }
  else
  {
    BookUtilityLog();
    v19 = (char *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v19, OS_LOG_TYPE_FAULT)) {
      sub_21E1F0F3C(self, v19, v20);
    }

    v21 = NSURL;
    v22 = NSTemporaryDirectory();
    objc_msgSend_fileURLWithPath_isDirectory_(v21, v23, (uint64_t)v22, 1);
    v17 = (NSURL *)objc_claimAutoreleasedReturnValue();
  }

  return v17;
}

- (NSUserDefaults)userDefaults
{
  return self->_userDefaults;
}

- (BUAppGroup)initWithIdentifier:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)BUAppGroup;
  uint64_t v6 = [(BUAppGroup *)&v13 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_identifier, a3);
    id v8 = objc_alloc(MEMORY[0x263EFFA40]);
    uint64_t v10 = objc_msgSend_initWithSuiteName_(v8, v9, (uint64_t)v5);
    userDefaults = v7->_userDefaults;
    v7->_userDefaults = (NSUserDefaults *)v10;
  }
  return v7;
}

+ (BUAppGroup)books
{
  if (qword_26AB40508 != -1) {
    dispatch_once(&qword_26AB40508, &unk_26CF10AB8);
  }
  v2 = (void *)qword_26AB40510;

  return (BUAppGroup *)v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userDefaults, 0);
  objc_storeStrong((id *)&self->_containerURL, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
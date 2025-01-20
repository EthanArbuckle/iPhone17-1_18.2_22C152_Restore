@interface CTRFollowUpController
- (BOOL)ctrUtilPostFollowUpItem:(id)a3;
- (CTRFollowUpController)init;
- (FLFollowUpController)ctrFollowUpController;
- (id)createFolloUpItem:(id)a3;
- (void)ctrUtilClearFollowUpItem:(id)a3;
- (void)setCtrFollowUpController:(id)a3;
@end

@implementation CTRFollowUpController

- (CTRFollowUpController)init
{
  v6.receiver = self;
  v6.super_class = (Class)CTRFollowUpController;
  v2 = [(CTRFollowUpController *)&v6 init];
  if (v2)
  {
    v3 = (FLFollowUpController *)[objc_alloc((Class)FLFollowUpController) initWithClientIdentifier:@"com.apple.fillmore.hw.fault"];
    ctrFollowUpController = v2->_ctrFollowUpController;
    v2->_ctrFollowUpController = v3;
  }
  return v2;
}

- (id)createFolloUpItem:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)FLFollowUpItem);
  v5 = v4;
  if (v4)
  {
    [v4 setUniqueIdentifier:v3];
    objc_super v6 = objc_alloc_init((Class)FLFollowUpNotification);
    if (v6)
    {
      v7 = +[NSMutableSet set];
      [v7 addObject:FLNotificationOptionNotificationCenter];
      [v6 setOptions:v7];
      [v5 setNotification:v6];
      id v8 = v5;

      goto LABEL_10;
    }
    v9 = log_get_logging_obg("com.apple.wpantund", "default");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[CTRFollowUpController createFolloUpItem:](v9);
    }
  }
  else
  {
    objc_super v6 = log_get_logging_obg("com.apple.wpantund", "default");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[CTRFollowUpController createFolloUpItem:](v6);
    }
  }
  id v8 = 0;
LABEL_10:

  return v8;
}

- (void)ctrUtilClearFollowUpItem:(id)a3
{
  id v4 = a3;
  ctrFollowUpController = self->_ctrFollowUpController;
  id v15 = v4;
  objc_super v6 = +[NSArray arrayWithObjects:&v15 count:1];
  unsigned int v7 = [(FLFollowUpController *)ctrFollowUpController clearPendingFollowUpItemsWithUniqueIdentifiers:v6 error:0];

  id v8 = log_get_logging_obg("com.apple.wpantund", "default");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v9 = 136315650;
    v10 = "-[CTRFollowUpController ctrUtilClearFollowUpItem:]";
    __int16 v11 = 2112;
    id v12 = v4;
    __int16 v13 = 1024;
    unsigned int v14 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s: Cleared followup item, Unique Identifier : %@, ret : %d", (uint8_t *)&v9, 0x1Cu);
  }
}

- (BOOL)ctrUtilPostFollowUpItem:(id)a3
{
  id v4 = a3;
  if (!self->_ctrFollowUpController)
  {
    v5 = log_get_logging_obg("com.apple.wpantund", "default");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      int v9 = 136315394;
      v10 = "-[CTRFollowUpController ctrUtilPostFollowUpItem:]";
      __int16 v11 = 2112;
      id v12 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s: Unique Identifier : %@, Followup controller instance is nil, returning false", (uint8_t *)&v9, 0x16u);
    }
    goto LABEL_10;
  }
  v5 = [(CTRFollowUpController *)self createFolloUpItem:v4];
  if (!v5)
  {
    v5 = log_get_logging_obg("com.apple.wpantund", "default");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[CTRFollowUpController ctrUtilPostFollowUpItem:]((uint64_t)v4, v5);
    }
LABEL_10:
    LOBYTE(v6) = 0;
    goto LABEL_11;
  }
  unsigned int v6 = [(FLFollowUpController *)self->_ctrFollowUpController postFollowUpItem:v5 error:0];
  unsigned int v7 = log_get_logging_obg("com.apple.wpantund", "default");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v9 = 136315650;
    v10 = "-[CTRFollowUpController ctrUtilPostFollowUpItem:]";
    __int16 v11 = 2112;
    id v12 = v4;
    __int16 v13 = 1024;
    unsigned int v14 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s: Unique Identifier : %@, Followup item post return val is : %d", (uint8_t *)&v9, 0x1Cu);
  }

LABEL_11:
  return v6;
}

- (FLFollowUpController)ctrFollowUpController
{
  return self->_ctrFollowUpController;
}

- (void)setCtrFollowUpController:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)createFolloUpItem:(os_log_t)log .cold.1(os_log_t log)
{
  int v1 = 136315138;
  v2 = "-[CTRFollowUpController createFolloUpItem:]";
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "%s: Failed to allocate Followup item", (uint8_t *)&v1, 0xCu);
}

- (void)createFolloUpItem:(os_log_t)log .cold.2(os_log_t log)
{
  int v1 = 136315138;
  v2 = "-[CTRFollowUpController createFolloUpItem:]";
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "%s: Failed to allocate Followup notification", (uint8_t *)&v1, 0xCu);
}

- (void)ctrUtilPostFollowUpItem:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2 = 136315394;
  id v3 = "-[CTRFollowUpController ctrUtilPostFollowUpItem:]";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "%s: Unique Identifier : %@, Failed to allocate Followup item, returning false", (uint8_t *)&v2, 0x16u);
}

@end
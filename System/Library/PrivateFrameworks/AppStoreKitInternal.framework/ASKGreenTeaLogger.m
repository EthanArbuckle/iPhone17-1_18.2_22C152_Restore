@interface ASKGreenTeaLogger
- (ASKGreenTeaLogger)init;
- (ct_green_tea_logger_s)logger;
- (void)dealloc;
- (void)willAccessLocationForSearch;
- (void)willRequestAppList;
- (void)willTransmitLocationForSearch;
@end

@implementation ASKGreenTeaLogger

- (ASKGreenTeaLogger)init
{
  v4.receiver = self;
  v4.super_class = (Class)ASKGreenTeaLogger;
  v2 = [(ASKGreenTeaLogger *)&v4 init];
  if (v2) {
    v2->_logger = (ct_green_tea_logger_s *)ct_green_tea_logger_create();
  }
  return v2;
}

- (void)dealloc
{
  ct_green_tea_logger_destroy();
  v3.receiver = self;
  v3.super_class = (Class)ASKGreenTeaLogger;
  [(ASKGreenTeaLogger *)&v3 dealloc];
}

- (void)willAccessLocationForSearch
{
  [(ASKGreenTeaLogger *)self logger];
  v2 = getCTGreenTeaOsLogHandle();
  objc_super v3 = v2;
  if (v2 && os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)objc_super v4 = 0;
    _os_log_impl(&dword_1E157D000, v3, OS_LOG_TYPE_INFO, "Accessing location for search ad targeting", v4, 2u);
  }
}

- (void)willTransmitLocationForSearch
{
  [(ASKGreenTeaLogger *)self logger];
  v2 = getCTGreenTeaOsLogHandle();
  objc_super v3 = v2;
  if (v2 && os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)objc_super v4 = 0;
    _os_log_impl(&dword_1E157D000, v3, OS_LOG_TYPE_INFO, "Transmitting location to store platform for search ad targeting", v4, 2u);
  }
}

- (void)willRequestAppList
{
  [(ASKGreenTeaLogger *)self logger];
  v2 = getCTGreenTeaOsLogHandle();
  objc_super v3 = v2;
  if (v2 && os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)objc_super v4 = 0;
    _os_log_impl(&dword_1E157D000, v3, OS_LOG_TYPE_INFO, "Accessing application list to update installed status", v4, 2u);
  }
}

- (ct_green_tea_logger_s)logger
{
  return self->_logger;
}

@end
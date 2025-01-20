@interface CADBirthdayListener
+ (BOOL)birthdayCalendarEnabled;
+ (id)sharedListener;
+ (void)reset;
+ (void)setBirthdayCalendarEnabled:(BOOL)a3;
+ (void)start;
- (BOOL)birthdayCalendarEnabled;
- (CADBirthdayListener)init;
- (CalBirthdayListener)ekBirthdayListener;
- (Class)listenerClass;
- (void)reset;
- (void)setBirthdayCalendarEnabled:(BOOL)a3;
- (void)setEkBirthdayListener:(id)a3;
- (void)setListenerClass:(Class)a3;
- (void)start;
@end

@implementation CADBirthdayListener

- (CADBirthdayListener)init
{
  v8.receiver = self;
  v8.super_class = (Class)CADBirthdayListener;
  v2 = [(CADBirthdayListener *)&v8 init];
  if (v2)
  {
    uint64_t v3 = EKWeakLinkClass();
    Class listenerClass = v2->_listenerClass;
    v2->_Class listenerClass = (Class)v3;

    uint64_t v5 = [(objc_class *)v2->_listenerClass sharedListener];
    ekBirthdayListener = v2->_ekBirthdayListener;
    v2->_ekBirthdayListener = (CalBirthdayListener *)v5;
  }
  return v2;
}

+ (id)sharedListener
{
  if (sharedListener_onceToken != -1) {
    dispatch_once(&sharedListener_onceToken, &__block_literal_global_24);
  }
  v2 = (void *)sharedListener__sharedListener;
  return v2;
}

uint64_t __37__CADBirthdayListener_sharedListener__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  sharedListener__sharedListener = v0;
  return MEMORY[0x1F41817F8](v0);
}

+ (void)start
{
  v2 = CADLogHandle;
  if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1BBC88000, v2, OS_LOG_TYPE_DEBUG, "Starting birthday manager", v4, 2u);
  }
  uint64_t v3 = +[CADBirthdayListener sharedListener];
  [v3 start];
}

+ (void)reset
{
  id v2 = +[CADBirthdayListener sharedListener];
  [v2 reset];
}

- (void)start
{
  id v2 = [(CADBirthdayListener *)self ekBirthdayListener];
  [v2 start];
}

- (void)reset
{
  id v2 = [(CADBirthdayListener *)self ekBirthdayListener];
  [v2 reset];
}

- (void)setBirthdayCalendarEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  v4 = [(CADBirthdayListener *)self ekBirthdayListener];
  id v5 = v4;
  if (v3) {
    [v4 addBirthdayCalendars];
  }
  else {
    [v4 disableBirthdayCalendars];
  }
}

- (BOOL)birthdayCalendarEnabled
{
  return [(objc_class *)self->_listenerClass areBirthdaysEnabled];
}

+ (void)setBirthdayCalendarEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = +[CADBirthdayListener sharedListener];
  [v4 setBirthdayCalendarEnabled:v3];
}

+ (BOOL)birthdayCalendarEnabled
{
  id v2 = +[CADBirthdayListener sharedListener];
  char v3 = [v2 birthdayCalendarEnabled];

  return v3;
}

- (CalBirthdayListener)ekBirthdayListener
{
  return self->_ekBirthdayListener;
}

- (void)setEkBirthdayListener:(id)a3
{
}

- (Class)listenerClass
{
  return self->_listenerClass;
}

- (void)setListenerClass:(Class)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listenerClass, 0);
  objc_storeStrong((id *)&self->_ekBirthdayListener, 0);
}

@end
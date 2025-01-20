@interface DAUserInterruptAlertFactory
+ (id)sharedInstance;
+ (void)activateAlertForSuiteName:(id)a3 withHandler:(id)a4;
+ (void)reset;
- (DAUserInterruptAlert)visibleAlert;
- (DAUserInterruptAlertFactory)init;
- (NSLock)alertVisibleLock;
- (void)activateAlertForSuiteName:(id)a3 withHandler:(id)a4;
- (void)setAlertVisibleLock:(id)a3;
- (void)setVisibleAlert:(id)a3;
@end

@implementation DAUserInterruptAlertFactory

+ (id)sharedInstance
{
  if (qword_100186938 != -1) {
    dispatch_once(&qword_100186938, &stru_10014BDD8);
  }
  v2 = (void *)qword_100186930;

  return v2;
}

+ (void)activateAlertForSuiteName:(id)a3 withHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [a1 sharedInstance];
  [v8 activateAlertForSuiteName:v7 withHandler:v6];
}

+ (void)reset
{
  id v4 = [a1 sharedInstance];
  v2 = [v4 alertVisibleLock];
  [v2 lock];

  [v4 setVisibleAlert:0];
  v3 = [v4 alertVisibleLock];
  [v3 unlock];
}

- (DAUserInterruptAlertFactory)init
{
  v6.receiver = self;
  v6.super_class = (Class)DAUserInterruptAlertFactory;
  v2 = [(DAUserInterruptAlertFactory *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    alertVisibleLock = v2->_alertVisibleLock;
    v2->_alertVisibleLock = (NSLock *)v3;
  }
  return v2;
}

- (void)activateAlertForSuiteName:(id)a3 withHandler:(id)a4
{
  id v14 = a3;
  id v6 = a4;
  id v7 = [(DAUserInterruptAlertFactory *)self alertVisibleLock];
  [v7 lock];

  id v8 = [(DAUserInterruptAlertFactory *)self visibleAlert];

  if (!v8)
  {
    v9 = [[DAUserInterruptAlert alloc] initWithSuiteName:v14 withHandler:v6];
    [(DAUserInterruptAlertFactory *)self setVisibleAlert:v9];

    v10 = [(DAUserInterruptAlertFactory *)self alertVisibleLock];
    [v10 unlock];

    v11 = [(DAUserInterruptAlertFactory *)self visibleAlert];
    [v11 activate];

    v12 = [(DAUserInterruptAlertFactory *)self alertVisibleLock];
    [v12 lock];

    [(DAUserInterruptAlertFactory *)self setVisibleAlert:0];
  }
  v13 = [(DAUserInterruptAlertFactory *)self alertVisibleLock];
  [v13 unlock];
}

- (NSLock)alertVisibleLock
{
  return self->_alertVisibleLock;
}

- (void)setAlertVisibleLock:(id)a3
{
}

- (DAUserInterruptAlert)visibleAlert
{
  return self->_visibleAlert;
}

- (void)setVisibleAlert:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visibleAlert, 0);

  objc_storeStrong((id *)&self->_alertVisibleLock, 0);
}

@end
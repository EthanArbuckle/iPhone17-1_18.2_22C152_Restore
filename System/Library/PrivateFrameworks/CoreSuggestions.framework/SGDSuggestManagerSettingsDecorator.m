@interface SGDSuggestManagerSettingsDecorator
+ (void)initialize;
- (SGDSuggestManagerSettingsDecorator)initWithManager:(id)a3;
- (id)methodSignatureForSelector:(SEL)a3;
- (void)forwardInvocation:(id)a3;
@end

@implementation SGDSuggestManagerSettingsDecorator

- (id)methodSignatureForSelector:(SEL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SGDSuggestManagerSettingsDecorator;
  v5 = -[SGDSuggestManagerSettingsDecorator methodSignatureForSelector:](&v7, "methodSignatureForSelector:");
  if (!v5)
  {
    v5 = [(SGDSuggestManager *)self->_manager methodSignatureForSelector:a3];
  }

  return v5;
}

- (SGDSuggestManagerSettingsDecorator)initWithManager:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SGDSuggestManagerSettingsDecorator;
  v6 = [(SGDSuggestManagerSettingsDecorator *)&v12 init];
  objc_super v7 = v6;
  if (!v6) {
    goto LABEL_4;
  }
  if (v5)
  {
    objc_storeStrong((id *)&v6->_manager, a3);
LABEL_4:
    v8 = v7;
    goto LABEL_8;
  }
  v9 = sgLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Can't initialize decorator for nil manager.", v11, 2u);
  }

  v8 = 0;
LABEL_8:

  return v8;
}

- (void)forwardInvocation:(id)a3
{
  id v4 = a3;
  [v4 selector];
  if (objc_opt_respondsToSelector())
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100003980;
    v7[3] = &unk_10000C488;
    id v8 = v4;
    v9 = self;
    +[_PASXPCUtilities runWithExceptionBarrier:v7];
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)SGDSuggestManagerSettingsDecorator;
    [(SGDSuggestManagerSettingsDecorator *)&v6 forwardInvocation:v4];
  }
}

- (void).cxx_destruct
{
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    +[SGAggregateLogging assetVersion];
  }
}

@end
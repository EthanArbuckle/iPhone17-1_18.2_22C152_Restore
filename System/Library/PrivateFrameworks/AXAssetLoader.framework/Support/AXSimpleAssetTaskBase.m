@interface AXSimpleAssetTaskBase
+ (BOOL)synchronous;
+ (id)taskGroupIdentifier;
+ (id)taskIdentifier;
+ (id)triggers;
+ (void)invokeWithArguments:(id)a3;
- (AXSimpleAssetTaskBase)initWithTrigger:(id)a3;
- (AXSimpleAssetTaskTrigger)trigger;
- (NSString)description;
- (OS_os_transaction)transaction;
- (unint64_t)completionStatus;
- (void)dealloc;
- (void)setCompletionStatus:(unint64_t)a3;
- (void)setTransaction:(id)a3;
- (void)setTrigger:(id)a3;
@end

@implementation AXSimpleAssetTaskBase

- (AXSimpleAssetTaskBase)initWithTrigger:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)AXSimpleAssetTaskBase;
  v5 = [(AXSimpleAssetTaskBase *)&v8 init];
  v6 = v5;
  if (v5)
  {
    [(AXSimpleAssetTaskBase *)v5 setCompletionStatus:0];
    [(AXSimpleAssetTaskBase *)v6 setTrigger:v4];
  }

  return v6;
}

- (void)dealloc
{
  v3 = AXLogAssetDaemon();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_100014D2C(self, v3);
  }

  v4.receiver = self;
  v4.super_class = (Class)AXSimpleAssetTaskBase;
  [(AXSimpleAssetTaskBase *)&v4 dealloc];
}

+ (id)taskGroupIdentifier
{
  return 0;
}

+ (id)taskIdentifier
{
  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

+ (id)triggers
{
  return &__NSArray0__struct;
}

+ (BOOL)synchronous
{
  return 1;
}

- (NSString)description
{
  v3 = (objc_class *)objc_opt_class();
  objc_super v4 = NSStringFromClass(v3);
  v5 = [(id)objc_opt_class() taskIdentifier];
  v6 = [(id)objc_opt_class() taskGroupIdentifier];
  v7 = [(AXSimpleAssetTaskBase *)self trigger];
  objc_super v8 = +[NSString stringWithFormat:@"%@<%p> ID=%@ Group=%@ Trigger=%@", v4, self, v5, v6, v7];

  return (NSString *)v8;
}

+ (void)invokeWithArguments:(id)a3
{
  id v3 = a3;
  id v5 = +[AXSimpleAssetTaskManager sharedInstance];
  objc_super v4 = [(id)objc_opt_class() taskIdentifier];
  [v5 invokeTaskById:v4 arguments:v3];
}

- (OS_os_transaction)transaction
{
  return self->_transaction;
}

- (void)setTransaction:(id)a3
{
}

- (AXSimpleAssetTaskTrigger)trigger
{
  return self->_trigger;
}

- (void)setTrigger:(id)a3
{
}

- (unint64_t)completionStatus
{
  return self->_completionStatus;
}

- (void)setCompletionStatus:(unint64_t)a3
{
  self->_completionStatus = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trigger, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
}

@end
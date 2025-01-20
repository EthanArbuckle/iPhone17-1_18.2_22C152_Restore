@interface APSTopicFilterPolicy
- (APSTopicFilterPolicy)initWithDelegate:(id)a3;
- (APSTopicFilterPolicyDelegate)delegate;
- (id)topicChosenByPolicyFromTopics:(id)a3;
- (int64_t)filterChosenByPolicyForTopic:(id)a3;
- (void)filtersWillPotentiallyBeChangedBy:(id)a3;
- (void)logFilterPolicyInformation;
- (void)setDelegate:(id)a3;
@end

@implementation APSTopicFilterPolicy

- (APSTopicFilterPolicy)initWithDelegate:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)APSTopicFilterPolicy;
  v5 = [(APSTopicFilterPolicy *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_delegate, v4);
  }

  return v6;
}

- (void)filtersWillPotentiallyBeChangedBy:(id)a3
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412546;
    v7 = self;
    __int16 v8 = 2112;
    id v9 = a3;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@: Filter will potentially be changed by %@", (uint8_t *)&v6, 0x16u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained filtersWillPotentiallyBeChangedByPolicy:self];
}

- (int64_t)filterChosenByPolicyForTopic:(id)a3
{
  id v4 = a3;
  v5 = NSStringFromSelector(a2);
  int v6 = +[NSString stringWithFormat:@"You must override %@ in a subclass", v5];
  id v7 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

- (id)topicChosenByPolicyFromTopics:(id)a3
{
  id v4 = a3;
  v5 = NSStringFromSelector(a2);
  int v6 = +[NSString stringWithFormat:@"You must override %@ in a subclass", v5];
  id v7 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

- (void)logFilterPolicyInformation
{
  v2 = NSStringFromSelector(a2);
  v3 = +[NSString stringWithFormat:@"You must override %@ in a subclass", v2];
  id v4 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v3 userInfo:0];

  objc_exception_throw(v4);
}

- (APSTopicFilterPolicyDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (APSTopicFilterPolicyDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
@interface HMDLoggingEventForwarder
- (HMDLoggingEventForwarder)initWithEventForwarder:(id)a3 logEventSubmitter:(id)a4;
- (void)forwardEvent:(id)a3 topic:(id)a4 completion:(id)a5;
@end

@implementation HMDLoggingEventForwarder

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logEventSubmitter, 0);
  objc_storeStrong((id *)&self->_eventForwarder, 0);
}

- (void)forwardEvent:(id)a3 topic:(id)a4 completion:(id)a5
{
  id v14 = a3;
  id v8 = a4;
  id v10 = a5;
  if (self)
  {
    objc_msgSend(objc_getProperty(self, v9, 8, 1), "forwardEvent:topic:completion:", v14, v8, v10);
    id v11 = v8;
    v12 = [[HMDEventRouterPostedEventLogEvent alloc] initWithTopic:v11];

    objc_msgSend(objc_getProperty(self, v13, 16, 1), "submitLogEvent:", v12);
  }
  else
  {
    [0 forwardEvent:v14 topic:v8 completion:v10];
  }
}

- (HMDLoggingEventForwarder)initWithEventForwarder:(id)a3 logEventSubmitter:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HMDLoggingEventForwarder;
  v9 = [(HMDLoggingEventForwarder *)&v12 init];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_eventForwarder, a3);
    objc_storeStrong((id *)&v10->_logEventSubmitter, a4);
  }

  return v10;
}

@end
@interface BCCoreAnalytics
+ (id)sharedInstance;
+ (void)logEventForChatSuggestDidNotAppearForBizItem:(id)a3 error:(id)a4 isVisible:(BOOL)a5 latency:(int64_t)a6;
+ (void)logEventForView:(id)a3 bizItem:(id)a4 bizItemReturnedAfterAction:(BOOL)a5 latency:(int64_t)a6;
- (NSString)lastActionTaken;
- (int64_t)lastActionLatency;
- (void)setLastActionLatency:(int64_t)a3;
- (void)setLastActionTaken:(id)a3;
- (void)setLastActionTaken:(id)a3 withLatency:(int64_t)a4;
@end

@implementation BCCoreAnalytics

+ (id)sharedInstance
{
  v2 = (void *)qword_100016860;
  if (!qword_100016860)
  {
    if (qword_100016868 != -1) {
      dispatch_once(&qword_100016868, &stru_1000103D8);
    }
    v2 = (void *)qword_100016860;
  }

  return v2;
}

+ (void)logEventForView:(id)a3 bizItem:(id)a4 bizItemReturnedAfterAction:(BOOL)a5 latency:(int64_t)a6
{
  id v6 = a4;
  v7 = v6;
  if (v6)
  {
    id v8 = v6;
    AnalyticsSendEventLazy();
  }
}

+ (void)logEventForChatSuggestDidNotAppearForBizItem:(id)a3 error:(id)a4 isVisible:(BOOL)a5 latency:(int64_t)a6
{
  id v9 = a3;
  id v10 = a4;
  v11 = v10;
  if (v9 && !v10)
  {
    v12 = v17;
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v13 = sub_1000048B4;
    v14 = v9;
LABEL_6:
    v12[2] = v13;
    v12[3] = &unk_100010400;
    id v15 = v14;
    *((unsigned char *)v12 + 48) = a5;
    v12[4] = v15;
    v12[5] = a6;
    AnalyticsSendEventLazy();

    goto LABEL_7;
  }
  if (v10)
  {
    v12 = v16;
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v13 = sub_100004A00;
    v14 = v10;
    goto LABEL_6;
  }
LABEL_7:
}

- (void)setLastActionTaken:(id)a3 withLatency:(int64_t)a4
{
  [(BCCoreAnalytics *)self setLastActionTaken:a3];

  [(BCCoreAnalytics *)self setLastActionLatency:a4];
}

- (NSString)lastActionTaken
{
  return self->_lastActionTaken;
}

- (void)setLastActionTaken:(id)a3
{
}

- (int64_t)lastActionLatency
{
  return self->_lastActionLatency;
}

- (void)setLastActionLatency:(int64_t)a3
{
  self->_lastActionLatency = a3;
}

- (void).cxx_destruct
{
}

@end
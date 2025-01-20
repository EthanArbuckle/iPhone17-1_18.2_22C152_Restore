@interface CLBThermalController
- (CLBThermalController)init;
- (int)coldToken;
- (int)hotToken;
- (int)sunToken;
- (unint64_t)coldLevel;
- (unint64_t)hotLevel;
- (unint64_t)sunLevel;
- (void)_logThermalEvent:(id)a3;
- (void)_respondToCurrentThermalCondition;
- (void)_startObservingThermalEvents;
- (void)setColdLevel:(unint64_t)a3;
- (void)setColdToken:(int)a3;
- (void)setHotLevel:(unint64_t)a3;
- (void)setHotToken:(int)a3;
- (void)setSunLevel:(unint64_t)a3;
- (void)setSunToken:(int)a3;
@end

@implementation CLBThermalController

- (CLBThermalController)init
{
  v5.receiver = self;
  v5.super_class = (Class)CLBThermalController;
  v2 = [(CLBThermalController *)&v5 init];
  v3 = v2;
  if (v2)
  {
    *(void *)&v2->_hotToken = -1;
    v2->_sunToken = -1;
    [(CLBThermalController *)v2 _startObservingThermalEvents];
  }
  return v3;
}

- (void)_logThermalEvent:(id)a3
{
  id v3 = a3;
  id v4 = [objc_alloc((Class)NSString) initWithFormat:v3 arguments:&v7];

  id v5 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithObjects:", v4, 0);
  v6 = GetThermalState();
  [v5 addObjectsFromArray:v6];

  logEventForAppleCare();
}

- (void)_respondToCurrentThermalCondition
{
}

- (void)_startObservingThermalEvents
{
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_10001B064;
  handler[3] = &unk_10015CA10;
  handler[4] = self;
  uint64_t v3 = notify_register_dispatch(kOSThermalNotificationPressureLevelName, &self->_hotToken, (dispatch_queue_t)&_dispatch_main_q, handler);
  if (v3)
  {
    uint64_t v4 = v3;
    id v5 = +[CLFLog commonLog];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_100100168(v4, v5, v6, v7, v8, v9, v10, v11);
    }
  }
  else
  {
    notify_get_state([(CLBThermalController *)self hotToken], &self->_hotLevel);
  }
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_10001B108;
  v29[3] = &unk_10015CA10;
  v29[4] = self;
  uint64_t v12 = notify_register_dispatch("com.apple.system.thermalpressurelevel.cold", &self->_coldToken, (dispatch_queue_t)&_dispatch_main_q, v29);

  if (v12)
  {
    v13 = +[CLFLog commonLog];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_1001000FC(v12, v13, v14, v15, v16, v17, v18, v19);
    }
  }
  else
  {
    notify_get_state([(CLBThermalController *)self coldToken], &self->_coldLevel);
  }
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_10001B178;
  v28[3] = &unk_10015CA10;
  v28[4] = self;
  uint64_t v20 = notify_register_dispatch("com.apple.system.thermalsunlightstate", &self->_sunToken, (dispatch_queue_t)&_dispatch_main_q, v28);

  if (v20)
  {
    v21 = +[CLFLog commonLog];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      sub_100100090(v20, v21, v22, v23, v24, v25, v26, v27);
    }
  }
  else
  {
    notify_get_state([(CLBThermalController *)self sunToken], &self->_sunLevel);
  }
  [(CLBThermalController *)self _respondToCurrentThermalCondition];
}

- (unint64_t)hotLevel
{
  return self->_hotLevel;
}

- (void)setHotLevel:(unint64_t)a3
{
  self->_hotLevel = a3;
}

- (unint64_t)coldLevel
{
  return self->_coldLevel;
}

- (void)setColdLevel:(unint64_t)a3
{
  self->_coldLevel = a3;
}

- (unint64_t)sunLevel
{
  return self->_sunLevel;
}

- (void)setSunLevel:(unint64_t)a3
{
  self->_sunLevel = a3;
}

- (int)hotToken
{
  return self->_hotToken;
}

- (void)setHotToken:(int)a3
{
  self->_hotToken = a3;
}

- (int)coldToken
{
  return self->_coldToken;
}

- (void)setColdToken:(int)a3
{
  self->_coldToken = a3;
}

- (int)sunToken
{
  return self->_sunToken;
}

- (void)setSunToken:(int)a3
{
  self->_sunToken = a3;
}

@end
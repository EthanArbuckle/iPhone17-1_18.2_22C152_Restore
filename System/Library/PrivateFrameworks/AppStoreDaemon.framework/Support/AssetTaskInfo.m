@interface AssetTaskInfo
@end

@implementation AssetTaskInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_task, 0);
  objc_destroyWeak((id *)&self->_session);
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_properties, 0);
  objc_destroyWeak((id *)&self->_promise);
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_networkActivity, 0);
  objc_storeStrong((id *)&self->_metrics, 0);
  objc_storeStrong((id *)&self->_logKey, 0);
  objc_storeStrong((id *)&self->_keepAlive, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_configurationID, 0);
}

@end
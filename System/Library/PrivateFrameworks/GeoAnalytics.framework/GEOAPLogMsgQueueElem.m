@interface GEOAPLogMsgQueueElem
- (BOOL)isEqual:(id)a3;
- (GEOAPLogMsgQueueElem)initWithLogMsg:(id)a3 uploadBatchId:(unint64_t)a4 expireTime:(id)a5 createTime:(id)a6;
- (NSData)logMsg;
- (NSDate)expireTime;
- (id)copy;
- (unint64_t)hash;
- (unint64_t)uploadBatchId;
@end

@implementation GEOAPLogMsgQueueElem

- (GEOAPLogMsgQueueElem)initWithLogMsg:(id)a3 uploadBatchId:(unint64_t)a4 expireTime:(id)a5 createTime:(id)a6
{
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)GEOAPLogMsgQueueElem;
  v14 = [(GEOAPQueueElem *)&v17 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_logMsg, a3);
    v15->_uploadBatchId = a4;
    objc_storeStrong((id *)&v15->_expireTime, a5);
    objc_storeStrong((id *)&v15->super._createTime, a6);
  }

  return v15;
}

- (unint64_t)uploadBatchId
{
  return self->_uploadBatchId;
}

- (NSData)logMsg
{
  return self->_logMsg;
}

- (NSDate)expireTime
{
  return self->_expireTime;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expireTime, 0);
  objc_storeStrong((id *)&self->_logMsg, 0);
}

- (id)copy
{
  v3 = [GEOAPLogMsgQueueElem alloc];
  logMsg = self->_logMsg;
  unint64_t uploadBatchId = self->_uploadBatchId;
  expireTime = self->_expireTime;
  createTime = self->super._createTime;
  return [(GEOAPLogMsgQueueElem *)v3 initWithLogMsg:logMsg uploadBatchId:uploadBatchId expireTime:expireTime createTime:createTime];
}

- (unint64_t)hash
{
  unint64_t uploadBatchId = self->_uploadBatchId;
  unint64_t v4 = (unint64_t)[(NSData *)self->_logMsg hash] ^ uploadBatchId;
  return v4 ^ (unint64_t)[(NSDate *)self->_expireTime hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    id uploadBatchId = self->_uploadBatchId;
    if (uploadBatchId == [v5 uploadBatchId])
    {
      logMsg = self->_logMsg;
      v8 = [v5 logMsg];
      if ([(NSData *)logMsg isEqual:v8])
      {
        expireTime = self->_expireTime;
        v10 = [v5 expireTime];
        unsigned __int8 v11 = [(NSDate *)expireTime isEqualToDate:v10];
      }
      else
      {
        unsigned __int8 v11 = 0;
      }
    }
    else
    {
      unsigned __int8 v11 = 0;
    }
  }
  else
  {
    unsigned __int8 v11 = 0;
  }

  return v11;
}

@end
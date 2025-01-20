@interface ADCommandExecutionContext
- (ADCommandExecutionContext)initWithInfo:(id)a3;
- (ADPeerInfo)originPeerInfo;
- (AFCommandExecutionInfo)info;
- (BOOL)isFromRemote;
- (BOOL)presentedUIResponse;
- (NSDate)creationDate;
- (NSString)personaId;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)performBlock:(id)a3;
- (void)setPersonaId:(id)a3;
- (void)setPresentedUIResponse:(BOOL)a3;
- (void)updateInfoUsingBlock:(id)a3;
@end

@implementation ADCommandExecutionContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_personaId, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_voucher, 0);
  objc_storeStrong((id *)&self->_info, 0);
}

- (void)setPersonaId:(id)a3
{
}

- (NSString)personaId
{
  return self->_personaId;
}

- (void)setPresentedUIResponse:(BOOL)a3
{
  self->_presentedUIResponse = a3;
}

- (BOOL)presentedUIResponse
{
  return self->_presentedUIResponse;
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [ADCommandExecutionContext alloc];
  id v5 = [(AFCommandExecutionInfo *)self->_info copy];
  v6 = [(ADCommandExecutionContext *)v4 initWithInfo:v5];

  return v6;
}

- (void)performBlock:(id)a3
{
  v4 = self->_voucher;
  id v5 = (void (**)(void))a3;
  voucher_adopt();
  v5[2](v5);

  v6 = (void *)voucher_adopt();
}

- (AFCommandExecutionInfo)info
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_info;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (id)description
{
  v3 = [(ADCommandExecutionContext *)self info];
  id v4 = objc_alloc((Class)NSString);
  v14.receiver = self;
  v14.super_class = (Class)ADCommandExecutionContext;
  id v5 = [(ADCommandExecutionContext *)&v14 description];
  v6 = [v3 executionID];
  v7 = [v3 requestID];
  v8 = [v3 turnId];
  v9 = [v3 originPeerInfo];
  v10 = AFPeerInfoGetCompactDescription();
  v11 = [v3 instanceInfo];
  id v12 = [v4 initWithFormat:@"%@ (id = %@, requestID = %@, turnID = %@, originPeer = %@, instance = %@)", v5, v6, v7, v8, v10, v11];

  return v12;
}

- (ADPeerInfo)originPeerInfo
{
  v2 = [(ADCommandExecutionContext *)self info];
  v3 = [v2 originPeerInfo];

  if (v3) {
    id v4 = [[ADPeerInfo alloc] initWithAFPeerInfo:v3];
  }
  else {
    id v4 = 0;
  }

  return v4;
}

- (BOOL)isFromRemote
{
  v2 = [(ADCommandExecutionContext *)self info];
  v3 = [v2 originPeerInfo];
  BOOL v4 = v3 != 0;

  return v4;
}

- (void)updateInfoUsingBlock:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v10 = v4;
    id v5 = [(ADCommandExecutionContext *)self info];
    if (v5)
    {
      v6 = v5;
      id v7 = [v5 mutatedCopyWithMutator:v10];
    }
    else
    {
      id v7 = +[AFCommandExecutionInfo newWithBuilder:v10];
    }
    os_unfair_lock_lock(&self->_lock);
    v8 = (AFCommandExecutionInfo *)[v7 copy];
    info = self->_info;
    self->_info = v8;

    os_unfair_lock_unlock(&self->_lock);
    id v4 = v10;
  }
}

- (ADCommandExecutionContext)initWithInfo:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)ADCommandExecutionContext;
  id v5 = [(ADCommandExecutionContext *)&v14 init];
  v6 = v5;
  if (v5)
  {
    v5->_lock._os_unfair_lock_opaque = 0;
    id v7 = (AFCommandExecutionInfo *)[v4 copy];
    info = v6->_info;
    v6->_info = v7;

    uint64_t v9 = +[NSDate now];
    creationDate = v6->_creationDate;
    v6->_creationDate = (NSDate *)v9;

    uint64_t v11 = voucher_copy();
    voucher = v6->_voucher;
    v6->_voucher = (OS_voucher *)v11;
  }
  return v6;
}

@end
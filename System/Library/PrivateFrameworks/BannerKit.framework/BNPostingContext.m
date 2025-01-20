@interface BNPostingContext
- (BNPostingContext)initWithPresentable:(id)a3 presentationOptions:(unint64_t)a4 userInfo:(id)a5;
- (BNPresentable)presentable;
- (NSDictionary)userInfo;
- (NSUUID)pendingIdentifier;
- (unint64_t)presentationOptions;
@end

@implementation BNPostingContext

- (BNPostingContext)initWithPresentable:(id)a3 presentationOptions:(unint64_t)a4 userInfo:(id)a5
{
  id v10 = a3;
  id v11 = a5;
  if (!v10)
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"BNPresentableQueue.m", 180, @"Invalid parameter not satisfying: %@", @"presentable" object file lineNumber description];
  }
  v16.receiver = self;
  v16.super_class = (Class)BNPostingContext;
  v12 = [(BNPostingContext *)&v16 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_presentable, a3);
    v13->_presentationOptions = a4;
    objc_storeStrong((id *)&v13->_userInfo, a5);
  }

  return v13;
}

- (NSUUID)pendingIdentifier
{
  v2 = [(NSDictionary *)self->_userInfo objectForKey:@"BNPresentableQueueUserInfoUniquePendingIdentifierKey"];
  uint64_t v3 = objc_opt_class();
  id v4 = v2;
  if (v3)
  {
    if (objc_opt_isKindOfClass()) {
      v5 = v4;
    }
    else {
      v5 = 0;
    }
  }
  else
  {
    v5 = 0;
  }
  id v6 = v5;

  return (NSUUID *)v6;
}

- (BNPresentable)presentable
{
  return self->_presentable;
}

- (unint64_t)presentationOptions
{
  return self->_presentationOptions;
}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_presentable, 0);
}

@end
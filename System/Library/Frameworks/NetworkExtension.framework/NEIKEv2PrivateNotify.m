@interface NEIKEv2PrivateNotify
- (BOOL)isEqual:(id)a3;
- (NEIKEv2PrivateNotify)initWithNotifyStatus:(unsigned __int16)a3 notifyData:(id)a4;
- (NSData)notifyData;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unsigned)notifyStatus;
@end

@implementation NEIKEv2PrivateNotify

- (void).cxx_destruct
{
}

- (NSData)notifyData
{
  return self->_notifyData;
}

- (unsigned)notifyStatus
{
  return self->_notifyStatus;
}

- (id)description
{
  id v3 = [NSString alloc];
  unsigned int v4 = [(NEIKEv2PrivateNotify *)self notifyStatus];
  v5 = [(NEIKEv2PrivateNotify *)self notifyData];
  v6 = (void *)[v3 initWithFormat:@"[Private Notify %u %@]", v4, v5];

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    id v5 = v4;
    int v6 = [v5 notifyStatus];
    if (self) {
      self->_notifyStatus = v6;
    }
    if (v6)
    {
      v7 = [(NEIKEv2PrivateNotify *)self notifyData];
      v8 = [v5 notifyData];
      if (v7 == v8)
      {
        char v11 = 1;
      }
      else
      {
        v9 = [(NEIKEv2PrivateNotify *)self notifyData];
        v10 = [v5 notifyData];
        char v11 = [v9 isEqual:v10];
      }
    }
    else
    {
      char v11 = 0;
    }
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  uint64_t v5 = [(NEIKEv2PrivateNotify *)self notifyStatus];
  int v6 = [(NEIKEv2PrivateNotify *)self notifyData];
  v7 = (void *)[v6 copy];
  v8 = (void *)[v4 initWithNotifyStatus:v5 notifyData:v7];

  return v8;
}

- (NEIKEv2PrivateNotify)initWithNotifyStatus:(unsigned __int16)a3 notifyData:(id)a4
{
  unsigned int v4 = a3;
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if (v4 >> 13 <= 4)
  {
    v10 = ne_log_obj();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      unsigned int v14 = v4;
      _os_log_error_impl(&dword_19DDAF000, v10, OS_LOG_TYPE_ERROR, "Invalid private notify status %u", buf, 8u);
    }

    goto LABEL_7;
  }
  v12.receiver = self;
  v12.super_class = (Class)NEIKEv2PrivateNotify;
  v7 = [(NEIKEv2PrivateNotify *)&v12 init];
  if (!v7)
  {
    ne_log_obj();
    self = (NEIKEv2PrivateNotify *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&self->super, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_19DDAF000, &self->super, OS_LOG_TYPE_FAULT, "[super init] failed", buf, 2u);
    }
LABEL_7:
    v8 = 0;
    goto LABEL_8;
  }
  v8 = v7;
  v7->_notifyStatus = v4;
  v9 = (NSData *)v6;
  self = (NEIKEv2PrivateNotify *)v8->_notifyData;
  v8->_notifyData = v9;
LABEL_8:

  return v8;
}

@end
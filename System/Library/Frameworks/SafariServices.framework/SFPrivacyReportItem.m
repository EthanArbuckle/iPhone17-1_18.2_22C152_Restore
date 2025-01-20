@interface SFPrivacyReportItem
- (BOOL)isEqual:(id)a3;
- (SFPrivacyReportItem)initWithType:(int64_t)a3;
- (SFPrivacyReportItem)initWithType:(int64_t)a3 userInfo:(id)a4;
- (id)userInfo;
- (int64_t)type;
- (unint64_t)hash;
@end

@implementation SFPrivacyReportItem

- (SFPrivacyReportItem)initWithType:(int64_t)a3
{
  return [(SFPrivacyReportItem *)self initWithType:a3 userInfo:0];
}

- (SFPrivacyReportItem)initWithType:(int64_t)a3 userInfo:(id)a4
{
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SFPrivacyReportItem;
  v8 = [(SFPrivacyReportItem *)&v12 init];
  v9 = v8;
  if (v8)
  {
    v8->_type = a3;
    objc_storeStrong(&v8->_userInfo, a4);
    v10 = v9;
  }

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    int64_t type = self->_type;
    if (type == [v5 type])
    {
      id userInfo = self->_userInfo;
      id v8 = [v5 userInfo];
      if (userInfo == v8)
      {
        char v11 = 1;
      }
      else
      {
        id v9 = self->_userInfo;
        v10 = [v5 userInfo];
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

- (unint64_t)hash
{
  int64_t type = self->_type;
  return [self->_userInfo hash] ^ type;
}

- (int64_t)type
{
  return self->_type;
}

- (id)userInfo
{
  return self->_userInfo;
}

- (void).cxx_destruct
{
}

@end
@interface DRProcessInfo
- ($115C4C562B26FF47E01F9F4EA65B5887)auditToken;
- (BOOL)isAnotherDevice;
- (BOOL)isAppleProcess;
- (BOOL)isSameProcessAsSource:(id)a3;
- (BOOL)isSameTeamAsSource:(id)a3;
- (DRProcessInfo)initWithAuditToken:(id *)a3;
- (NSString)bundleID;
- (NSString)teamID;
- (void)setAuditToken:(id *)a3;
- (void)setBundleID:(id)a3;
- (void)setIsAnotherDevice:(BOOL)a3;
- (void)setTeamID:(id)a3;
@end

@implementation DRProcessInfo

- (DRProcessInfo)initWithAuditToken:(id *)a3
{
  v13.receiver = self;
  v13.super_class = (Class)DRProcessInfo;
  v4 = [(DRProcessInfo *)&v13 init];
  v5 = v4;
  if (v4)
  {
    long long v6 = *(_OWORD *)&a3->var0[4];
    v12[0] = *(_OWORD *)a3->var0;
    v12[1] = v6;
    [(DRProcessInfo *)v4 setAuditToken:v12];
    if (CPCopyBundleIdentifierAndTeamFromAuditToken())
    {
      teamID = v5->_teamID;
      v5->_teamID = 0;

      bundleID = v5->_bundleID;
      v5->_bundleID = 0;
    }
    else
    {
      uint64_t v9 = CPCopyBundleIdentifierFromAuditToken();
      v10 = v5->_bundleID;
      v5->_bundleID = (NSString *)v9;
    }
  }
  return v5;
}

- (BOOL)isSameTeamAsSource:(id)a3
{
  id v5 = a3;
  long long v6 = [v5 teamID];
  if (!v6)
  {
    v3 = [(DRProcessInfo *)self teamID];
    if (!v3)
    {
      unsigned __int8 v9 = 1;
LABEL_6:

      goto LABEL_7;
    }
  }
  v7 = [v5 teamID];
  v8 = [(DRProcessInfo *)self teamID];
  unsigned __int8 v9 = [v7 isEqualToString:v8];

  if (!v6) {
    goto LABEL_6;
  }
LABEL_7:

  return v9;
}

- (BOOL)isSameProcessAsSource:(id)a3
{
  id v4 = a3;
  if ([(DRProcessInfo *)self isSameTeamAsSource:v4])
  {
    id v5 = [v4 bundleID];
    long long v6 = [(DRProcessInfo *)self bundleID];
    unsigned __int8 v7 = [v5 isEqualToString:v6];
  }
  else
  {
    unsigned __int8 v7 = 0;
  }

  return v7;
}

- (BOOL)isAppleProcess
{
  v2 = [(DRProcessInfo *)self teamID];
  BOOL v3 = v2 == 0;

  return v3;
}

- (NSString)teamID
{
  return self->_teamID;
}

- (void)setTeamID:(id)a3
{
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
}

- ($115C4C562B26FF47E01F9F4EA65B5887)auditToken
{
  long long v3 = *(_OWORD *)&self[1].var0[4];
  *(_OWORD *)retstr->var0 = *(_OWORD *)self[1].var0;
  *(_OWORD *)&retstr->var0[4] = v3;
  return self;
}

- (void)setAuditToken:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0[4];
  *(_OWORD *)self->_auditToken.val = *(_OWORD *)a3->var0;
  *(_OWORD *)&self->_auditToken.val[4] = v3;
}

- (BOOL)isAnotherDevice
{
  return self->_isAnotherDevice;
}

- (void)setIsAnotherDevice:(BOOL)a3
{
  self->_isAnotherDevice = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_teamID, 0);
}

@end
@interface HDTinkerPairedUserInfo
- (BOOL)isEqual:(id)a3;
- (NSNumber)dsid;
- (NSString)firstName;
- (NSString)lastName;
- (id)description;
- (void)setDsid:(id)a3;
- (void)setFirstName:(id)a3;
- (void)setLastName:(id)a3;
@end

@implementation HDTinkerPairedUserInfo

- (BOOL)isEqual:(id)a3
{
  v4 = (HDTinkerPairedUserInfo *)a3;
  if (self == v4)
  {
    BOOL v14 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      v6 = [(HDTinkerPairedUserInfo *)self firstName];
      uint64_t v7 = [(HDTinkerPairedUserInfo *)v5 firstName];
      if (v6 == (void *)v7)
      {
      }
      else
      {
        v8 = (void *)v7;
        uint64_t v9 = [(HDTinkerPairedUserInfo *)v5 firstName];
        if (!v9) {
          goto LABEL_19;
        }
        v10 = (void *)v9;
        v11 = [(HDTinkerPairedUserInfo *)self firstName];
        v12 = [(HDTinkerPairedUserInfo *)v5 firstName];
        int v13 = [v11 isEqualToString:v12];

        if (!v13) {
          goto LABEL_20;
        }
      }
      v6 = [(HDTinkerPairedUserInfo *)self lastName];
      uint64_t v15 = [(HDTinkerPairedUserInfo *)v5 lastName];
      if (v6 == (void *)v15)
      {
      }
      else
      {
        v8 = (void *)v15;
        uint64_t v16 = [(HDTinkerPairedUserInfo *)v5 lastName];
        if (!v16) {
          goto LABEL_19;
        }
        v17 = (void *)v16;
        v18 = [(HDTinkerPairedUserInfo *)self lastName];
        v19 = [(HDTinkerPairedUserInfo *)v5 lastName];
        int v20 = [v18 isEqualToString:v19];

        if (!v20) {
          goto LABEL_20;
        }
      }
      v6 = [(HDTinkerPairedUserInfo *)self dsid];
      uint64_t v21 = [(HDTinkerPairedUserInfo *)v5 dsid];
      if (v6 == (void *)v21)
      {

LABEL_24:
        BOOL v14 = 1;
        goto LABEL_21;
      }
      v8 = (void *)v21;
      uint64_t v22 = [(HDTinkerPairedUserInfo *)v5 dsid];
      if (v22)
      {
        v23 = (void *)v22;
        v24 = [(HDTinkerPairedUserInfo *)self dsid];
        v25 = [(HDTinkerPairedUserInfo *)v5 dsid];
        char v26 = [v24 isEqual:v25];

        if (v26) {
          goto LABEL_24;
        }
LABEL_20:
        BOOL v14 = 0;
LABEL_21:

        goto LABEL_22;
      }
LABEL_19:

      goto LABEL_20;
    }
    BOOL v14 = 0;
  }
LABEL_22:

  return v14;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(HDTinkerPairedUserInfo *)self firstName];
  v6 = [(HDTinkerPairedUserInfo *)self lastName];
  uint64_t v7 = [(HDTinkerPairedUserInfo *)self dsid];
  v8 = [v3 stringWithFormat:@"<%@:%p firstName:%@ lastName:%@ DSID:%@>", v4, self, v5, v6, v7];

  return v8;
}

- (NSString)firstName
{
  return self->_firstName;
}

- (void)setFirstName:(id)a3
{
}

- (NSString)lastName
{
  return self->_lastName;
}

- (void)setLastName:(id)a3
{
}

- (NSNumber)dsid
{
  return self->_dsid;
}

- (void)setDsid:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dsid, 0);
  objc_storeStrong((id *)&self->_lastName, 0);

  objc_storeStrong((id *)&self->_firstName, 0);
}

@end
@interface DAFolder
- (BOOL)hasRemoteChanges;
- (BOOL)isDefault;
- (BOOL)isEqual:(id)a3;
- (NSString)folderID;
- (NSString)folderName;
- (NSString)parentFolderID;
- (id)description;
- (int64_t)dataclass;
- (unint64_t)hash;
- (void)setDataclass:(int64_t)a3;
- (void)setFolderID:(id)a3;
- (void)setFolderName:(id)a3;
- (void)setHasRemoteChanges:(BOOL)a3;
- (void)setIsDefault:(BOOL)a3;
- (void)setParentFolderID:(id)a3;
@end

@implementation DAFolder

- (id)description
{
  v12.receiver = self;
  v12.super_class = (Class)DAFolder;
  v3 = [(DAFolder *)&v12 description];
  v4 = [(DAFolder *)self folderID];
  v5 = [(DAFolder *)self folderName];
  v6 = [(DAFolder *)self parentFolderID];
  int64_t v7 = [(DAFolder *)self dataclass];
  BOOL v8 = [(DAFolder *)self isDefault];
  v9 = @"NO";
  if (v8) {
    v9 = @"YES";
  }
  v10 = [v3 stringByAppendingFormat:@" folderID = %@, name = %@, _parentFolderID %@, _dataclass %ld, _isDefault %@", v4, v5, v6, v7, v9];

  return v10;
}

- (unint64_t)hash
{
  v2 = [(DAFolder *)self folderID];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v8 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = v8;
    v10 = [v9 folderName];
    if (v10 || ([(DAFolder *)self folderName], (unint64_t v3 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v11 = [v9 folderName];
      v4 = [(DAFolder *)self folderName];
      if (![v11 isEqualToString:v4])
      {
        LOBYTE(v13) = 0;
        goto LABEL_39;
      }
      v28 = v11;
      int v12 = 1;
    }
    else
    {
      int v12 = 0;
    }
    v14 = [v9 folderID];
    if (v14 || ([(DAFolder *)self folderID], (v23 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v5 = [v9 folderID];
      v6 = [(DAFolder *)self folderID];
      if (![v5 isEqualToString:v6])
      {
        LOBYTE(v13) = 0;
        goto LABEL_30;
      }
      int v24 = v12;
      int v25 = 1;
    }
    else
    {
      int v24 = v12;
      int v25 = 0;
      v23 = 0;
    }
    v26 = v6;
    v27 = v5;
    v15 = [v9 parentFolderID];
    if (v15 || ([(DAFolder *)self parentFolderID], (uint64_t v19 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v6 = objc_msgSend(v9, "parentFolderID", v19);
      v5 = [(DAFolder *)self parentFolderID];
      if (![v6 isEqualToString:v5])
      {
        LOBYTE(v13) = 0;
        goto LABEL_26;
      }
      v22 = v3;
      int v21 = 1;
    }
    else
    {
      v22 = v3;
      v20 = 0;
      int v21 = 0;
    }
    uint64_t v16 = objc_msgSend(v9, "dataclass", v20);
    if (v16 == [(DAFolder *)self dataclass])
    {
      int v17 = [v9 isDefault];
      int v13 = v17 ^ [(DAFolder *)self isDefault] ^ 1;
      if ((v21 & 1) == 0)
      {
LABEL_23:
        unint64_t v3 = v22;
        goto LABEL_27;
      }
    }
    else
    {
      LOBYTE(v13) = 0;
      if (!v21) {
        goto LABEL_23;
      }
    }
    unint64_t v3 = v22;
LABEL_26:

LABEL_27:
    v6 = v26;
    v5 = v27;
    if (v15)
    {

      if (v25)
      {
LABEL_29:
        int v12 = v24;
LABEL_30:

        if (v14) {
          goto LABEL_31;
        }
        goto LABEL_37;
      }
    }
    else
    {

      if (v25) {
        goto LABEL_29;
      }
    }
    int v12 = v24;
    if (v14)
    {
LABEL_31:

      if (!v12) {
        goto LABEL_32;
      }
LABEL_38:
      v11 = v28;
LABEL_39:

      if (v10) {
        goto LABEL_33;
      }
      goto LABEL_40;
    }
LABEL_37:

    if ((v12 & 1) == 0)
    {
LABEL_32:
      if (v10)
      {
LABEL_33:

        goto LABEL_34;
      }
LABEL_40:

      goto LABEL_33;
    }
    goto LABEL_38;
  }
  LOBYTE(v13) = 0;
LABEL_34:

  return v13;
}

- (NSString)folderName
{
  return self->_folderName;
}

- (void)setFolderName:(id)a3
{
}

- (NSString)folderID
{
  return self->_folderID;
}

- (void)setFolderID:(id)a3
{
}

- (NSString)parentFolderID
{
  return self->_parentFolderID;
}

- (void)setParentFolderID:(id)a3
{
}

- (int64_t)dataclass
{
  return self->_dataclass;
}

- (void)setDataclass:(int64_t)a3
{
  self->_dataclass = a3;
}

- (BOOL)isDefault
{
  return self->_isDefault;
}

- (void)setIsDefault:(BOOL)a3
{
  self->_isDefault = a3;
}

- (BOOL)hasRemoteChanges
{
  return self->_hasRemoteChanges;
}

- (void)setHasRemoteChanges:(BOOL)a3
{
  self->_hasRemoteChanges = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parentFolderID, 0);
  objc_storeStrong((id *)&self->_folderID, 0);
  objc_storeStrong((id *)&self->_folderName, 0);
}

@end
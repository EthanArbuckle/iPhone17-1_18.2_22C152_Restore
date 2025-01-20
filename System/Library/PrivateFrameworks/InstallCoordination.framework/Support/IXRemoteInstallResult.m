@interface IXRemoteInstallResult
- (BOOL)isEqual:(id)a3;
- (IXRemoteInstallResult)initWithDBUUID:(id)a3 dbSequenceNumber:(id)a4 URLOfInstalledApp:(id)a5 persistentIdentifier:(id)a6;
- (IXRemoteInstallResult)initWithURLOfInstalledApp:(id)a3 persistentIdentifier:(id)a4;
- (NSData)persistentIdentifier;
- (NSNumber)dbSequenceNumber;
- (NSURL)URLOfInstalledApp;
- (NSUUID)dbUUID;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)setDbSequenceNumber:(id)a3;
- (void)setDbUUID:(id)a3;
- (void)setPersistentIdentifier:(id)a3;
- (void)setURLOfInstalledApp:(id)a3;
@end

@implementation IXRemoteInstallResult

- (BOOL)isEqual:(id)a3
{
  v4 = (IXRemoteInstallResult *)a3;
  if (v4 == self)
  {
    BOOL v20 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      v6 = [(IXRemoteInstallResult *)self dbUUID];
      v7 = [(IXRemoteInstallResult *)v5 dbUUID];
      id v8 = v6;
      id v9 = v7;
      v10 = v9;
      if ((v8 != 0) != (v9 != 0) || v8 && v9 && ![v8 isEqual:v9]) {
        goto LABEL_22;
      }

      v11 = [(IXRemoteInstallResult *)self dbSequenceNumber];
      v12 = [(IXRemoteInstallResult *)v5 dbSequenceNumber];
      id v8 = v11;
      id v13 = v12;
      v10 = v13;
      if ((v8 != 0) != (v13 != 0) || v8 && v13 && ![v8 isEqual:v13]) {
        goto LABEL_22;
      }

      v14 = [(IXRemoteInstallResult *)self URLOfInstalledApp];
      v15 = [(IXRemoteInstallResult *)v5 URLOfInstalledApp];
      id v8 = v14;
      id v16 = v15;
      v10 = v16;
      if ((v8 != 0) != (v16 != 0) || v8 && v16 && ![v8 isEqual:v16]) {
        goto LABEL_22;
      }

      v17 = [(IXRemoteInstallResult *)self persistentIdentifier];
      v18 = [(IXRemoteInstallResult *)v5 persistentIdentifier];
      id v8 = v17;
      id v19 = v18;
      v10 = v19;
      if ((v8 != 0) != (v19 != 0) || v8 && v19 && ![v8 isEqual:v19]) {
LABEL_22:
      }
        BOOL v20 = 0;
      else {
        BOOL v20 = 1;
      }
    }
    else
    {
      BOOL v20 = 0;
    }
  }

  return v20;
}

- (unint64_t)hash
{
  v3 = [(IXRemoteInstallResult *)self dbUUID];
  unint64_t v4 = (unint64_t)[v3 hash];

  v5 = [(IXRemoteInstallResult *)self dbSequenceNumber];
  unint64_t v6 = (unint64_t)[v5 hash] ^ v4;

  v7 = [(IXRemoteInstallResult *)self URLOfInstalledApp];
  unint64_t v8 = (unint64_t)[v7 hash];

  id v9 = [(IXRemoteInstallResult *)self persistentIdentifier];
  unint64_t v10 = v6 ^ v8 ^ (unint64_t)[v9 hash];

  return v10;
}

- (id)description
{
  v3 = (objc_class *)objc_opt_class();
  unint64_t v4 = NSStringFromClass(v3);
  v5 = [(IXRemoteInstallResult *)self dbUUID];
  unint64_t v6 = [(IXRemoteInstallResult *)self dbSequenceNumber];
  v7 = [(IXRemoteInstallResult *)self URLOfInstalledApp];
  unint64_t v8 = +[NSString stringWithFormat:@"<%@ 0x%p: dbUUID=%@ dbSequenceNumber=%@ URLOfInstalledApp=%@>", v4, self, v5, v6, v7];

  return v8;
}

- (IXRemoteInstallResult)initWithDBUUID:(id)a3 dbSequenceNumber:(id)a4 URLOfInstalledApp:(id)a5 persistentIdentifier:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)IXRemoteInstallResult;
  v14 = [(IXRemoteInstallResult *)&v17 init];
  v15 = v14;
  if (v14)
  {
    [(IXRemoteInstallResult *)v14 setDbUUID:v10];
    [(IXRemoteInstallResult *)v15 setDbSequenceNumber:v11];
    [(IXRemoteInstallResult *)v15 setURLOfInstalledApp:v12];
    [(IXRemoteInstallResult *)v15 setPersistentIdentifier:v13];
  }

  return v15;
}

- (IXRemoteInstallResult)initWithURLOfInstalledApp:(id)a3 persistentIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)IXRemoteInstallResult;
  unint64_t v8 = [(IXRemoteInstallResult *)&v11 init];
  id v9 = v8;
  if (v8)
  {
    [(IXRemoteInstallResult *)v8 setURLOfInstalledApp:v6];
    [(IXRemoteInstallResult *)v9 setPersistentIdentifier:v7];
  }

  return v9;
}

- (id)dictionaryRepresentation
{
  v10[0] = @"DBUUID";
  v3 = [(IXRemoteInstallResult *)self dbUUID];
  unint64_t v4 = [v3 UUIDString];
  v11[0] = v4;
  v10[1] = @"DBSequenceNumber";
  v5 = [(IXRemoteInstallResult *)self dbSequenceNumber];
  v11[1] = v5;
  v10[2] = @"InstallPath";
  id v6 = [(IXRemoteInstallResult *)self URLOfInstalledApp];
  id v7 = [v6 path];
  v11[2] = v7;
  unint64_t v8 = +[NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:3];

  return v8;
}

- (NSUUID)dbUUID
{
  return self->_dbUUID;
}

- (void)setDbUUID:(id)a3
{
}

- (NSNumber)dbSequenceNumber
{
  return self->_dbSequenceNumber;
}

- (void)setDbSequenceNumber:(id)a3
{
}

- (NSURL)URLOfInstalledApp
{
  return self->_URLOfInstalledApp;
}

- (void)setURLOfInstalledApp:(id)a3
{
}

- (NSData)persistentIdentifier
{
  return self->_persistentIdentifier;
}

- (void)setPersistentIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_persistentIdentifier, 0);
  objc_storeStrong((id *)&self->_URLOfInstalledApp, 0);
  objc_storeStrong((id *)&self->_dbSequenceNumber, 0);

  objc_storeStrong((id *)&self->_dbUUID, 0);
}

@end
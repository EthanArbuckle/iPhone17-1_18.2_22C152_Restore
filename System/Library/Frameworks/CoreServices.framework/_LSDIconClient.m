@interface _LSDIconClient
- (void)getAlternateIconNameForIdentifier:(id)a3 reply:(id)a4;
- (void)setAlternateIconName:(id)a3 forIdentifier:(id)a4 iconsDictionary:(id)a5 reply:(id)a6;
@end

@implementation _LSDIconClient

- (void)setAlternateIconName:(id)a3 forIdentifier:(id)a4 iconsDictionary:(id)a5 reply:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = (void (**)(id, void, void *))a6;
  v14 = [(_LSDClient *)self XPCConnection];
  v15 = [v14 _xpcConnection];
  v16 = (void *)_LSCopyBundleIdentifierForXPCConnection(v15, 0);

  v17 = [(_LSDClient *)self XPCConnection];
  v18 = v17;
  if (v17)
  {
    [v17 auditToken];
  }
  else
  {
    long long v20 = 0u;
    long long v21 = 0u;
  }

  if (([v16 isEqualToString:v11] & 1) != 0
    || _LSCheckEntitlementForAuditToken((uint64_t)&v20, @"com.apple.lsapplicationworkspace.rebuildappdatabases"))
  {
    v19 = +[LSAltIconManager sharedInstance];
    [v19 setAlternateIconName:v10 forIdentifier:v11 iconsDictionary:v12 reply:v13];
  }
  else
  {
    v19 = _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28760], -54, (uint64_t)"-[_LSDIconClient setAlternateIconName:forIdentifier:iconsDictionary:reply:]", 66, 0);
    v13[2](v13, 0, v19);
  }
}

- (void)getAlternateIconNameForIdentifier:(id)a3 reply:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, void, void *))a4;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __58___LSDIconClient_getAlternateIconNameForIdentifier_reply___block_invoke;
  v17[3] = &unk_1E522E828;
  v17[4] = self;
  v8 = (void (**)(void))MEMORY[0x18530F950](v17);
  v9 = [(_LSDClient *)self XPCConnection];
  id v10 = [v9 _xpcConnection];
  if (_LSXPCConnectionMayMapDatabase(v10))
  {
  }
  else
  {
    id v11 = v8[2](v8);
    int v12 = [v11 isEqualToString:v6];

    if (!v12)
    {
      v14 = _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28760], -54, (uint64_t)"-[_LSDIconClient getAlternateIconNameForIdentifier:reply:]", 87, 0);
      v7[2](v7, 0, v14);
      goto LABEL_6;
    }
  }
  v13 = +[LSAltIconManager sharedInstance];
  id v16 = 0;
  v14 = [v13 alternateIconNameForIdentifier:v6 error:&v16];
  id v15 = v16;

  ((void (**)(id, void *, void *))v7)[2](v7, v14, v15);
LABEL_6:
}

@end
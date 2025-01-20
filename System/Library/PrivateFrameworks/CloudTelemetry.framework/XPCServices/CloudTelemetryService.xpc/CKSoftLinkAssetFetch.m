@interface CKSoftLinkAssetFetch
- (CKContainer)container;
- (void)fetchAssetWithTeamID:(id)a3 options:(id)a4 completionHandler:(id)a5;
- (void)setContainer:(id)a3;
- (void)setContainerPtr:(id)a3;
@end

@implementation CKSoftLinkAssetFetch

- (void)setContainerPtr:(id)a3
{
}

- (void)fetchAssetWithTeamID:(id)a3 options:(id)a4 completionHandler:(id)a5
{
  id v36 = a3;
  id v37 = a4;
  id v8 = a5;
  uint64_t v46 = 0;
  v47 = &v46;
  uint64_t v48 = 0x2050000000;
  v9 = (void *)qword_1000B09A0;
  uint64_t v49 = qword_1000B09A0;
  if (!qword_1000B09A0)
  {
    v41 = _NSConcreteStackBlock;
    uint64_t v42 = 3221225472;
    v43 = sub_1000042B4;
    v44 = &unk_1000A5B88;
    v45 = &v46;
    sub_1000042B4((uint64_t)&v41);
    v9 = (void *)v47[3];
  }
  v35 = v8;
  v10 = v9;
  _Block_object_dispose(&v46, 8);
  id v11 = objc_alloc_init(v10);
  [v11 setApplicationBundleIdentifierOverride:@"com.apple.CloudTelemetryService.xpc"];
  objc_msgSend(v11, "setAllowsCellularAccess:", objc_msgSend(v37, "allowsCellularAccess"));
  objc_msgSend(v11, "setAllowsExpensiveNetworkAccess:", objc_msgSend(v37, "_allowsExpensiveAccess"));
  [v11 setPreferAnonymousRequests:1];
  v12 = [(CKSoftLinkAssetFetch *)self container];
  if (!v12)
  {
    uint64_t v46 = 0;
    v47 = &v46;
    uint64_t v48 = 0x2050000000;
    v13 = (void *)qword_1000B09B0;
    uint64_t v49 = qword_1000B09B0;
    if (!qword_1000B09B0)
    {
      v41 = _NSConcreteStackBlock;
      uint64_t v42 = 3221225472;
      v43 = sub_100004478;
      v44 = &unk_1000A5B88;
      v45 = &v46;
      sub_100004478((uint64_t)&v41);
      v13 = (void *)v47[3];
    }
    id v14 = v13;
    _Block_object_dispose(&v46, 8);
    v12 = [v14 containerWithIdentifier:@"com.apple.acp.developer.apptelemetry.storebags"];
  }
  v15 = [v12 publicCloudDatabase];
  uint64_t v46 = 0;
  v47 = &v46;
  uint64_t v48 = 0x2050000000;
  v16 = (void *)qword_1000B09B8;
  uint64_t v49 = qword_1000B09B8;
  if (!qword_1000B09B8)
  {
    v41 = _NSConcreteStackBlock;
    uint64_t v42 = 3221225472;
    v43 = sub_1000044D0;
    v44 = &unk_1000A5B88;
    v45 = &v46;
    sub_1000044D0((uint64_t)&v41);
    v16 = (void *)v47[3];
  }
  v17 = v16;
  _Block_object_dispose(&v46, 8);
  id v18 = [v17 alloc];
  uint64_t v46 = 0;
  v47 = &v46;
  uint64_t v48 = 0x2020000000;
  v19 = (void *)qword_1000B09C0;
  uint64_t v49 = qword_1000B09C0;
  if (!qword_1000B09C0)
  {
    v41 = _NSConcreteStackBlock;
    uint64_t v42 = 3221225472;
    v43 = sub_100004528;
    v44 = &unk_1000A5B88;
    v45 = &v46;
    v20 = (void *)sub_10000430C();
    v21 = dlsym(v20, "CKCurrentUserDefaultName");
    *(void *)(v45[1] + 24) = v21;
    qword_1000B09C0 = *(void *)(v45[1] + 24);
    v19 = (void *)v47[3];
  }
  _Block_object_dispose(&v46, 8);
  if (!v19) {
    sub_10008B35C();
  }
  id v22 = [v18 initWithZoneName:v36 ownerName:*v19];
  if (os_variant_has_internal_diagnostics()) {
    CFStringRef v23 = @"%@StoreBagWithLocal.json";
  }
  else {
    CFStringRef v23 = @"%@StoreBag.json";
  }
  v24 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v23, v36);
  uint64_t v46 = 0;
  v47 = &v46;
  uint64_t v48 = 0x2050000000;
  v25 = (void *)qword_1000B09C8;
  uint64_t v49 = qword_1000B09C8;
  if (!qword_1000B09C8)
  {
    v41 = _NSConcreteStackBlock;
    uint64_t v42 = 3221225472;
    v43 = sub_100004578;
    v44 = &unk_1000A5B88;
    v45 = &v46;
    sub_100004578((uint64_t)&v41);
    v25 = (void *)v47[3];
  }
  v26 = v25;
  _Block_object_dispose(&v46, 8);
  id v27 = [[v26 alloc] initWithRecordName:v24 zoneID:v22];
  uint64_t v46 = 0;
  v47 = &v46;
  uint64_t v48 = 0x2050000000;
  v28 = (void *)qword_1000B09D0;
  uint64_t v49 = qword_1000B09D0;
  if (!qword_1000B09D0)
  {
    v41 = _NSConcreteStackBlock;
    uint64_t v42 = 3221225472;
    v43 = sub_1000045D0;
    v44 = &unk_1000A5B88;
    v45 = &v46;
    sub_1000045D0((uint64_t)&v41);
    v28 = (void *)v47[3];
  }
  v29 = v28;
  _Block_object_dispose(&v46, 8);
  id v30 = [v29 alloc];
  id v50 = v27;
  v31 = +[NSArray arrayWithObjects:&v50 count:1];
  id v32 = [v30 initWithRecordIDs:v31];

  [v32 setShouldFetchAssetContentInMemory:1];
  [v32 setDropInMemoryAssetContentASAP:0];
  [v32 setConfiguration:v11];
  v38[0] = _NSConcreteStackBlock;
  v38[1] = 3221225472;
  v38[2] = sub_1000041B8;
  v38[3] = &unk_1000A5B60;
  id v39 = v27;
  id v40 = v35;
  id v33 = v35;
  id v34 = v27;
  [v32 setFetchRecordsCompletionBlock:v38];
  [v15 addOperation:v32];
}

- (CKContainer)container
{
  return self->_container;
}

- (void)setContainer:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
@interface RepairController
- (RepairInputs)inputs;
- (void)setInputs:(id)a3;
- (void)setupWithInputs:(id)a3 responder:(id)a4;
- (void)start;
@end

@implementation RepairController

- (void)setupWithInputs:(id)a3 responder:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = handleForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 136315650;
    v16 = "-[RepairController setupWithInputs:responder:]";
    __int16 v17 = 2112;
    id v18 = v6;
    __int16 v19 = 2112;
    id v20 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s: %@, %@", (uint8_t *)&v15, 0x20u);
  }

  [(RepairController *)self setInputs:v6];
  v9 = [(RepairController *)self inputs];

  if (!v9)
  {
    v10 = [(RepairController *)self result];
    [v10 setStatusCode:&off_1000089F0];

    [(RepairController *)self setFinished:1];
  }
  v11 = +[NSSet setWithArray:&off_100008AE8];
  supportedSPCs = self->supportedSPCs;
  self->supportedSPCs = v11;

  v13 = [(NSSet *)self->supportedSPCs setByAddingObjectsFromArray:&off_100008B00];
  v14 = self->supportedSPCs;
  self->supportedSPCs = v13;
}

- (void)start
{
  uint64_t v3 = [(RepairController *)self result];
  [(id)v3 setStatusCode:&off_100008A08];

  LOBYTE(v3) = MGGetBoolAnswer();
  char v4 = MGGetBoolAnswer();
  if ((v3 & 1) == 0 && (v4 & 1) == 0)
  {
    v82 = handleForCategory();
    if (os_log_type_enabled(v82, OS_LOG_TYPE_ERROR)) {
      sub_10000600C(v82);
    }

    v73 = [(RepairController *)self result];
    v64 = v73;
    v74 = &off_100008A20;
    goto LABEL_52;
  }
  v5 = [(RepairController *)self inputs];
  id v6 = [v5 partSPC];
  [v6 intersectSet:self->supportedSPCs];

  id v7 = handleForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = [(RepairController *)self inputs];
    v9 = [v8 partSPC];
    *(_DWORD *)buf = 138412290;
    v116 = v9;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "selected PartSPCs:%@", buf, 0xCu);
  }
  v10 = [(RepairController *)self inputs];
  uint64_t v11 = [v10 partSPC];
  if (!v11)
  {

    goto LABEL_51;
  }
  v12 = (void *)v11;
  v13 = [(RepairController *)self inputs];
  v14 = [v13 partSPC];
  id v15 = [v14 count];

  if (!v15)
  {
LABEL_51:
    v73 = [(RepairController *)self result];
    v64 = v73;
    v74 = &off_100008A50;
LABEL_52:
    [v73 setStatusCode:v74];
    goto LABEL_53;
  }
  dispatch_semaphore_t v109 = dispatch_semaphore_create(0);
  id v16 = [objc_alloc((Class)NSXPCConnection) initWithMachServiceName:@"com.apple.corerepair" options:0];
  __int16 v17 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___CoreRepairHelperProtocol];
  [v16 setRemoteObjectInterface:v17];

  v108 = v16;
  [v16 resume];
  id v18 = objc_alloc_init((Class)NSMutableDictionary);
  __int16 v19 = [(RepairController *)self inputs];
  id v20 = [v19 patchItems];

  if (v20)
  {
    v21 = [(RepairController *)self inputs];
    v22 = [v21 patchItems];
    [v18 setObject:v22 forKeyedSubscript:@"patchItems"];
  }
  v23 = [(RepairController *)self inputs];
  unsigned int v24 = [v23 enableStagedSeal];

  if (v24)
  {
    v25 = [(RepairController *)self inputs];
    v26 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v25 enableStagedSeal]);
    [v18 setObject:v26 forKeyedSubscript:@"enableStagedSeal"];
  }
  v27 = [(RepairController *)self inputs];
  unsigned int v28 = [v27 ignoreStagedData];

  if (v28)
  {
    v29 = [(RepairController *)self inputs];
    v30 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v29 ignoreStagedData]);
    [v18 setObject:v30 forKeyedSubscript:@"ignoreStagedData"];
  }
  v31 = [(RepairController *)self inputs];
  unsigned int v32 = [v31 skipStageEAN];

  if (v32)
  {
    v33 = [(RepairController *)self inputs];
    v34 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v33 skipStageEAN]);
    [v18 setObject:v34 forKeyedSubscript:@"skipStageEAN"];
  }
  v35 = [(RepairController *)self inputs];
  unsigned int v36 = [v35 allowSelfService];

  if (v36)
  {
    v37 = [(RepairController *)self inputs];
    v38 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v37 allowSelfService]);
    [v18 setObject:v38 forKeyedSubscript:@"allowSelfService"];
  }
  v39 = [(RepairController *)self inputs];
  unsigned int v40 = [v39 allowUsedPart];

  if (v40)
  {
    v41 = [(RepairController *)self inputs];
    v42 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v41 allowUsedPart]);
    [v18 setObject:v42 forKeyedSubscript:@"allowUsedPart"];
  }
  v43 = [(RepairController *)self inputs];
  v44 = [v43 keyBlob];

  if (v44)
  {
    id v45 = objc_alloc((Class)NSData);
    v46 = [(RepairController *)self inputs];
    v47 = [v46 keyBlob];
    id v48 = [v45 initWithBase64EncodedString:v47 options:0];

    if (v48) {
      [v18 setObject:v48 forKeyedSubscript:@"keyBlob"];
    }
  }
  v113[0] = @"doSeal";
  v107 = [(RepairController *)self inputs];
  v106 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v107 doSeal]);
  v114[0] = v106;
  v113[1] = @"enableProxy";
  v105 = [(RepairController *)self inputs];
  v104 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v105 enableProxy]);
  v114[1] = v104;
  v113[2] = @"KBBSerialNumber";
  v103 = [(RepairController *)self inputs];
  uint64_t v49 = [v103 KBBSerialNumber];
  v50 = (void *)v49;
  if (!v49)
  {
    uint64_t v49 = +[NSNull null];
  }
  v86 = (void *)v49;
  v114[2] = v49;
  v113[3] = @"KGBSerialNumber";
  v101 = [(RepairController *)self inputs];
  uint64_t v51 = [v101 KGBSerialNumber];
  v52 = (void *)v51;
  if (!v51)
  {
    uint64_t v51 = +[NSNull null];
  }
  v85 = (void *)v51;
  v114[3] = v51;
  v113[4] = @"partSPC";
  v99 = [(RepairController *)self inputs];
  uint64_t v53 = [v99 partSPC];
  v54 = (void *)v53;
  if (!v53)
  {
    uint64_t v53 = +[NSNull null];
  }
  v100 = v52;
  v84 = (void *)v53;
  v114[4] = v53;
  v113[5] = @"updateProperties";
  v97 = [(RepairController *)self inputs];
  uint64_t v55 = [v97 updateProperties];
  v96 = (void *)v55;
  if (!v55)
  {
    uint64_t v55 = +[NSNull null];
  }
  v98 = v54;
  v102 = v50;
  v114[5] = v55;
  v113[6] = @"DisplayMaxDuration";
  v95 = [(RepairController *)self inputs];
  v94 = [v95 displayMaxDuration];
  v114[6] = v94;
  v113[7] = @"CAURL";
  v93 = [(RepairController *)self inputs];
  v92 = [v93 FDRCAURL];
  v114[7] = v92;
  v113[8] = @"DSURL";
  v91 = [(RepairController *)self inputs];
  v90 = [v91 FDRDSURL];
  v114[8] = v90;
  v113[9] = @"TrustObjectURL";
  v89 = [(RepairController *)self inputs];
  v88 = [v89 trustObjectURL];
  v114[9] = v88;
  v113[10] = @"SealingURL";
  v87 = [(RepairController *)self inputs];
  v56 = [v87 FDRSealingURL];
  v114[10] = v56;
  v113[11] = @"UseSOCKSHost";
  v57 = [(RepairController *)self inputs];
  v58 = [v57 SOCKSHost];
  v59 = v58;
  if (!v58)
  {
    v59 = +[NSNull null];
  }
  v114[11] = v59;
  v113[12] = @"UseSOCKSPort";
  v60 = [(RepairController *)self inputs];
  v61 = [v60 SOCKSPort];
  v62 = v61;
  if (!v61)
  {
    v62 = +[NSNull null];
  }
  v114[12] = v62;
  v63 = +[NSDictionary dictionaryWithObjects:v114 forKeys:v113 count:13];
  [v18 addEntriesFromDictionary:v63];

  if (!v61) {
  if (!v58)
  }

  v64 = v18;
  if (!v96) {

  }
  if (!v98) {
  if (!v100)
  }

  if (!v102) {
  v65 = [v108 remoteObjectProxy];
  }
  v110[0] = _NSConcreteStackBlock;
  v110[1] = 3221225472;
  v110[2] = sub_100005B44;
  v110[3] = &unk_100008198;
  v110[4] = self;
  id v111 = v108;
  v66 = v109;
  v112 = v66;
  id v67 = v108;
  [v65 seal:v18 withReply:v110];

  v68 = [(RepairController *)self inputs];
  v69 = [v68 timeoutPeriod];
  dispatch_time_t v70 = dispatch_time(0, 1000000000 * (int)[v69 intValue]);
  intptr_t v71 = dispatch_semaphore_wait(v66, v70);

  if (v71)
  {
    v72 = [(RepairController *)self result];
    [v72 setStatusCode:&off_100008A38];
  }
LABEL_53:

  v75 = [(RepairController *)self result];
  v76 = [v75 data];
  id v77 = [v76 mutableCopy];

  if (v77)
  {
    v78 = +[NSBundle mainBundle];
    v79 = [v78 objectForInfoDictionaryKey:@"CFBundleShortVersionString"];
    if (v79)
    {
      [v77 setObject:v79 forKeyedSubscript:@"pluginVersion"];
    }
    else
    {
      v80 = +[NSNull null];
      [v77 setObject:v80 forKeyedSubscript:@"pluginVersion"];
    }
    v81 = [(RepairController *)self result];
    [v81 setData:v77];
  }
  [(RepairController *)self setFinished:1];
}

- (RepairInputs)inputs
{
  return self->inputs;
}

- (void)setInputs:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->inputs, 0);
  objc_storeStrong((id *)&self->supportedSPCs, 0);

  objc_storeStrong((id *)&self->sealingMapSet, 0);
}

@end
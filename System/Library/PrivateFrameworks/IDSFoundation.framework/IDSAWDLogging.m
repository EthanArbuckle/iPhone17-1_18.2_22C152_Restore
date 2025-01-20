@interface IDSAWDLogging
+ (id)sharedInstance;
- (AWDServerConnection)AWDServerConnection;
- (BOOL)_shouldSubmit;
- (IDSAWDLogging)init;
- (id)_metricContainerForMetricType:(unsigned int)a3;
- (void)IDSQuickRelayEventType:(id)a3 eventSubType:(id)a4 duration:(id)a5 resultCode:(id)a6 providerType:(id)a7 transportType:(id)a8 interfaceType:(id)a9 skeEnabled:(id)a10 isInitiator:(id)a11 protocolVersion:(id)a12 retryCount:(id)a13 serviceName:(id)a14 subServiceName:(id)a15 participantCount:(id)a16;
- (void)_submitAWDMetric:(id)a3 withContainer:(id)a4;
- (void)submitMetric:(id)a3 withIdentifier:(unsigned int)a4;
@end

@implementation IDSAWDLogging

- (id)_metricContainerForMetricType:(unsigned int)a3
{
  v4 = objc_msgSend_newMetricContainerWithIdentifier_(self->_AWDServerConnection, a2, *(uint64_t *)&a3, v3);
  return v4;
}

- (void)_submitAWDMetric:(id)a3 withContainer:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v10 = v7;
  if (v6 && v7)
  {
    objc_msgSend_setMetric_(v7, v8, (uint64_t)v6, v9);
    int v13 = objc_msgSend_submitMetric_(self->_AWDServerConnection, v11, (uint64_t)v10, v12);
    v14 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      int v18 = objc_msgSend_metricId(v10, v15, v16, v17);
      v19 = @"NO";
      if (v13) {
        v19 = @"YES";
      }
      *(_DWORD *)buf = 67109378;
      int v24 = v18;
      __int16 v25 = 2112;
      v26 = v19;
      _os_log_impl(&dword_19D9BE000, v14, OS_LOG_TYPE_DEBUG, "Submitted metric: 0x%x succeeded? %@", buf, 0x12u);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    {
      objc_msgSend_metricId(v10, v20, v21, v22);
      _IDSLogV(1, @"IDSFoundation", @"IDSAWDLogging", @"Submitted metric: 0x%x succeeded? %@");
    }
  }
}

- (BOOL)_shouldSubmit
{
  return 1;
}

+ (id)sharedInstance
{
  if (qword_1EB2BB730 != -1) {
    dispatch_once(&qword_1EB2BB730, &unk_1EEFCD658);
  }
  v2 = (void *)qword_1EB2BB780;
  return v2;
}

- (IDSAWDLogging)init
{
  v13.receiver = self;
  v13.super_class = (Class)IDSAWDLogging;
  v2 = [(IDSAWDLogging *)&v13 init];
  if (v2)
  {
    id v3 = objc_alloc((Class)CUTWeakLinkClass());
    uint64_t v6 = objc_msgSend_initWithComponentId_andBlockOnConfiguration_(v3, v4, 39, v5, 1);
    AWDServerConnection = v2->_AWDServerConnection;
    v2->_AWDServerConnection = (AWDServerConnection *)v6;

    v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    double v9 = dispatch_get_global_queue(-32768, 0);
    dispatch_queue_t v10 = dispatch_queue_create_with_target_V2("com.apple.IDS.AWDLogging", v8, v9);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v10;
  }
  return v2;
}

- (void)submitMetric:(id)a3 withIdentifier:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  double v9 = objc_msgSend_newMetricContainerWithIdentifier_(self->_AWDServerConnection, v7, v4, v8);
  queue = self->_queue;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = sub_19DAAC038;
  v13[3] = &unk_1E5974100;
  v13[4] = self;
  id v14 = v6;
  id v15 = v9;
  id v11 = v9;
  id v12 = v6;
  IDSAWDSubmitBlockAsync(queue, v13);
}

- (AWDServerConnection)AWDServerConnection
{
  return (AWDServerConnection *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_AWDServerConnection, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)IDSQuickRelayEventType:(id)a3 eventSubType:(id)a4 duration:(id)a5 resultCode:(id)a6 providerType:(id)a7 transportType:(id)a8 interfaceType:(id)a9 skeEnabled:(id)a10 isInitiator:(id)a11 protocolVersion:(id)a12 retryCount:(id)a13 serviceName:(id)a14 subServiceName:(id)a15 participantCount:(id)a16
{
  id v78 = a3;
  id v21 = a4;
  id v22 = a5;
  id v23 = a6;
  id v77 = a7;
  id v76 = a8;
  id v24 = a9;
  id v25 = a10;
  id v26 = a11;
  id v27 = a12;
  id v75 = a13;
  id v74 = a14;
  id v73 = a15;
  id v72 = a16;
  v31 = objc_msgSend_sharedInstance(MEMORY[0x1E4F6C360], v28, v29, v30);
  char isInternalInstall = objc_msgSend_isInternalInstall(v31, v32, v33, v34);

  v39 = v26;
  if (!v26
    || (isInternalInstall & 1) != 0
    || (int v40 = objc_msgSend_BOOLValue(v26, v36, v37, v38),
        IDSAWDLogShouldSubmitHotShipQuickRelayMetric(v40, v41, v42, v43)))
  {
    queue = self->_queue;
    v79[0] = MEMORY[0x1E4F143A8];
    v79[1] = 3221225472;
    v79[2] = sub_19DB3E834;
    v79[3] = &unk_1E5975928;
    v79[4] = self;
    id v66 = v78;
    id v80 = v66;
    id v65 = v21;
    id v81 = v65;
    id v64 = v22;
    id v82 = v64;
    char v93 = isInternalInstall;
    id v63 = v23;
    id v83 = v63;
    id v62 = v77;
    id v84 = v62;
    id v69 = v23;
    id v61 = v76;
    id v85 = v61;
    id v70 = v22;
    id v60 = v24;
    id v86 = v60;
    id v44 = v25;
    id v87 = v44;
    id v68 = v21;
    id v45 = v39;
    id v88 = v45;
    id v46 = v27;
    id v89 = v46;
    v47 = v39;
    id v48 = v25;
    id v49 = v75;
    id v90 = v49;
    id v50 = v24;
    id v51 = v74;
    id v91 = v51;
    id v52 = v27;
    id v53 = v73;
    id v92 = v53;
    IDSAWDSubmitBlockAsync(queue, v79);
    id v59 = v53;
    id v27 = v52;
    id v57 = v49;
    id v58 = v51;
    id v24 = v50;
    id v25 = v48;
    v39 = v47;
    id v56 = v45;
    id v21 = v68;
    id v23 = v69;
    id v22 = v70;
    objc_msgSend_IDSCoreAnalyticsQuickRelayEventType_eventSubType_duration_resultCode_providerType_transportType_interfaceType_skeEnabled_isInitiator_protocolVersion_retryCount_serviceName_subServiceName_participantCount_(self, v54, (uint64_t)v66, v55, v65, v64, v63, v62, v61, v60, v44, v56, v46, v57, v58, v59, v72);
  }
}

@end
@interface IDSAPSUserPayload
- (IDSAPSUserPayload)initWithBlastDoorObject:(id)a3;
- (NSMutableDictionary)payload;
- (id)extractCommandResponseFrom:(id)a3;
- (id)extractCommandWebTunnelResponseFrom:(id)a3;
- (id)extractMadridDeliveryContextFrom:(id)a3;
- (id)extractMadridHttpHeadersFrom:(id)a3;
- (id)extractMadridProtocolPayloadFrom:(id)a3;
- (id)extractQuickRelayAllocationStatusFrom:(id)a3;
- (id)extractQuickRelaySelfAllocTokenFrom:(id)a3;
- (void)logDiffBetween:(id)a3 andTarget:(id)a4 withKeyPath:(id)a5;
- (void)logHeaderDiffAgainstSource:(id)a3;
- (void)setPayload:(id)a3;
@end

@implementation IDSAPSUserPayload

- (IDSAPSUserPayload)initWithBlastDoorObject:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)IDSAPSUserPayload;
  v6 = [(IDSAPSUserPayload *)&v18 init];
  if (v6)
  {
    v8 = objc_msgSend_valueForKey_(v4, v5, @"command", v7);
    int v12 = objc_msgSend_intValue(v8, v9, v10, v11);

    if (v12 == 97)
    {
      uint64_t v15 = objc_msgSend_extractCommandWebTunnelResponseFrom_(v6, v13, (uint64_t)v4, v14);
    }
    else
    {
      if (v12 == 255) {
        objc_msgSend_extractCommandResponseFrom_(v6, v13, (uint64_t)v4, v14);
      }
      else {
      uint64_t v15 = objc_msgSend_extractMadridProtocolPayloadFrom_(v6, v13, (uint64_t)v4, v14);
      }
    }
    payload = v6->_payload;
    v6->_payload = (NSMutableDictionary *)v15;
  }
  return v6;
}

- (id)extractCommandResponseFrom:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v5 = v3;
  v6 = NSNumber;
  uint64_t v10 = objc_msgSend_command(v5, v7, v8, v9);
  v13 = objc_msgSend_numberWithInteger_(v6, v11, v10, v12);
  objc_msgSend_setObject_forKey_(v4, v14, (uint64_t)v13, v15, @"c");

  if (objc_msgSend_has_messageId(v5, v16, v17, v18))
  {
    v22 = NSNumber;
    uint64_t v23 = objc_msgSend_messageId(v5, v19, v20, v21);
    v26 = objc_msgSend_numberWithLongLong_(v22, v24, v23, v25);
    objc_msgSend_setObject_forKey_(v4, v27, (uint64_t)v26, v28, @"i");
  }
  v29 = objc_msgSend_messageUUID(v5, v19, v20, v21);

  if (v29)
  {
    v33 = objc_msgSend_messageUUID(v5, v30, v31, v32);
    objc_msgSend_setObject_forKey_(v4, v34, (uint64_t)v33, v35, @"U");
  }
  if (objc_msgSend_has_responseStatus(v5, v30, v31, v32))
  {
    v39 = NSNumber;
    uint64_t v40 = objc_msgSend_responseStatus(v5, v36, v37, v38);
    v43 = objc_msgSend_numberWithInteger_(v39, v41, v40, v42);
    objc_msgSend_setObject_forKey_(v4, v44, (uint64_t)v43, v45, @"s");
  }
  if (objc_msgSend_has_failReason(v5, v36, v37, v38))
  {
    v49 = NSNumber;
    uint64_t v50 = objc_msgSend_failReason(v5, v46, v47, v48);
    v53 = objc_msgSend_numberWithInteger_(v49, v51, v50, v52);
    objc_msgSend_setObject_forKey_(v4, v54, (uint64_t)v53, v55, @"fR");
  }
  v56 = objc_msgSend_token(v5, v46, v47, v48);

  if (v56)
  {
    v60 = objc_msgSend_token(v5, v57, v58, v59);
    objc_msgSend_setObject_forKey_(v4, v61, (uint64_t)v60, v62, @"t");
  }
  if (objc_msgSend_has_internalBuild(v5, v57, v58, v59))
  {
    v66 = NSNumber;
    uint64_t v67 = objc_msgSend_internalBuild(v5, v63, v64, v65);
    v70 = objc_msgSend_numberWithBool_(v66, v68, v67, v69);
    objc_msgSend_setObject_forKey_(v4, v71, (uint64_t)v70, v72, @"x-internal");
  }
  if (objc_msgSend_has_loggingProfile(v5, v63, v64, v65))
  {
    v76 = NSNumber;
    uint64_t v77 = objc_msgSend_loggingProfile(v5, v73, v74, v75);
    v80 = objc_msgSend_numberWithBool_(v76, v78, v77, v79);
    objc_msgSend_setObject_forKey_(v4, v81, (uint64_t)v80, v82, @"x-logging");
  }
  v83 = objc_msgSend_applicationId(v5, v73, v74, v75);

  if (v83)
  {
    v87 = objc_msgSend_applicationId(v5, v84, v85, v86);
    objc_msgSend_setObject_forKey_(v4, v88, (uint64_t)v87, v89, @"qai");
  }
  if (objc_msgSend_has_requestType(v5, v84, v85, v86))
  {
    v93 = NSNumber;
    uint64_t v94 = objc_msgSend_requestType(v5, v90, v91, v92);
    v97 = objc_msgSend_numberWithInteger_(v93, v95, v94, v96);
    objc_msgSend_setObject_forKey_(v4, v98, (uint64_t)v97, v99, @"qat");
  }
  v100 = objc_msgSend_idsSessionId(v5, v90, v91, v92);

  if (v100)
  {
    v104 = objc_msgSend_idsSessionId(v5, v101, v102, v103);
    objc_msgSend_setObject_forKey_(v4, v105, (uint64_t)v104, v106, @"qids");
  }
  if (objc_msgSend_has_sharedSession(v5, v101, v102, v103))
  {
    v110 = NSNumber;
    uint64_t v111 = objc_msgSend_sharedSession(v5, v107, v108, v109);
    v114 = objc_msgSend_numberWithBool_(v110, v112, v111, v113);
    objc_msgSend_setObject_forKey_(v4, v115, (uint64_t)v114, v116, @"qrss");
  }
  if (objc_msgSend_has_protocolVersion(v5, v107, v108, v109))
  {
    v120 = NSNumber;
    uint64_t v121 = objc_msgSend_protocolVersion(v5, v117, v118, v119);
    v124 = objc_msgSend_numberWithInteger_(v120, v122, v121, v123);
    objc_msgSend_setObject_forKey_(v4, v125, (uint64_t)v124, v126, @"qv");
  }
  return v4;
}

- (id)extractCommandWebTunnelResponseFrom:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v6 = v4;
  double v7 = NSNumber;
  uint64_t v11 = objc_msgSend_command(v6, v8, v9, v10);
  double v14 = objc_msgSend_numberWithInteger_(v7, v12, v11, v13);
  objc_msgSend_setObject_forKey_(v5, v15, (uint64_t)v14, v16, @"c");

  if (objc_msgSend_has_messageId(v6, v17, v18, v19))
  {
    uint64_t v23 = NSNumber;
    uint64_t v24 = objc_msgSend_messageId(v6, v20, v21, v22);
    v27 = objc_msgSend_numberWithInteger_(v23, v25, v24, v26);
    objc_msgSend_setObject_forKey_(v5, v28, (uint64_t)v27, v29, @"i");
  }
  v30 = objc_msgSend_messageUUID(v6, v20, v21, v22);

  if (v30)
  {
    v34 = objc_msgSend_messageUUID(v6, v31, v32, v33);
    objc_msgSend_setObject_forKey_(v5, v35, (uint64_t)v34, v36, @"U");
  }
  if (objc_msgSend_has_responseStatus(v6, v31, v32, v33))
  {
    uint64_t v40 = NSNumber;
    uint64_t v41 = objc_msgSend_responseStatus(v6, v37, v38, v39);
    v44 = objc_msgSend_numberWithInteger_(v40, v42, v41, v43);
    objc_msgSend_setObject_forKey_(v5, v45, (uint64_t)v44, v46, @"s");
  }
  uint64_t v47 = objc_msgSend_contentType(v6, v37, v38, v39);

  if (v47)
  {
    v51 = objc_msgSend_contentType(v6, v48, v49, v50);
    objc_msgSend_setObject_forKey_(v5, v52, (uint64_t)v51, v53, @"cT");
  }
  if (objc_msgSend_has_epochTimeNanos(v6, v48, v49, v50))
  {
    v57 = NSNumber;
    uint64_t v58 = objc_msgSend_epochTimeNanos(v6, v54, v55, v56);
    v61 = objc_msgSend_numberWithLongLong_(v57, v59, v58, v60);
    objc_msgSend_setObject_forKey_(v5, v62, (uint64_t)v61, v63, @"e");
  }
  uint64_t v64 = objc_msgSend_httpUrl(v6, v54, v55, v56);

  if (v64)
  {
    v68 = objc_msgSend_httpUrl(v6, v65, v66, v67);
    objc_msgSend_setObject_forKey_(v5, v69, (uint64_t)v68, v70, @"u");
  }
  v71 = objc_msgSend_httpHeaders(v6, v65, v66, v67);
  uint64_t v74 = objc_msgSend_extractMadridHttpHeadersFrom_(self, v72, (uint64_t)v71, v73);
  v78 = v74;
  if (v74 && objc_msgSend_count(v74, v75, v76, v77)) {
    objc_msgSend_setObject_forKey_(v5, v79, (uint64_t)v78, v80, @"h");
  }

  v84 = objc_msgSend_httpBody(v6, v81, v82, v83);

  if (v84)
  {
    v88 = objc_msgSend_httpBody(v6, v85, v86, v87);
    objc_msgSend_setObject_forKey_(v5, v89, (uint64_t)v88, v90, @"b");
  }
  uint64_t v91 = objc_msgSend_httpBodyUrl(v6, v85, v86, v87);

  if (v91)
  {
    v95 = objc_msgSend_httpBodyUrl(v6, v92, v93, v94);
    objc_msgSend_setObject_forKey_(v5, v96, (uint64_t)v95, v97, @"bu");
  }
  v98 = objc_msgSend_httpBodyKey(v6, v92, v93, v94);

  if (v98)
  {
    uint64_t v102 = objc_msgSend_httpBodyKey(v6, v99, v100, v101);
    objc_msgSend_setObject_forKey_(v5, v103, (uint64_t)v102, v104, @"bk");
  }
  if (objc_msgSend_has_httpResponseStatus(v6, v99, v100, v101))
  {
    uint64_t v108 = NSNumber;
    uint64_t v109 = objc_msgSend_httpResponseStatus(v6, v105, v106, v107);
    v112 = objc_msgSend_numberWithInteger_(v108, v110, v109, v111);
    objc_msgSend_setObject_forKey_(v5, v113, (uint64_t)v112, v114, @"hs");
  }
  v115 = objc_msgSend_httpErrorMsg(v6, v105, v106, v107);

  if (v115)
  {
    double v119 = objc_msgSend_httpErrorMsg(v6, v116, v117, v118);
    objc_msgSend_setObject_forKey_(v5, v120, (uint64_t)v119, v121, @"hr");
  }
  return v5;
}

- (id)extractMadridHttpHeadersFrom:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v5 = v3;
  uint64_t v9 = objc_msgSend_adhocServiceOverride(v5, v6, v7, v8);

  if (v9)
  {
    double v13 = objc_msgSend_adhocServiceOverride(v5, v10, v11, v12);
    objc_msgSend_setObject_forKey_(v4, v14, (uint64_t)v13, v15, @"aS");
  }
  double v16 = objc_msgSend_responseIdentifierString(v5, v10, v11, v12);

  if (v16)
  {
    uint64_t v20 = objc_msgSend_responseIdentifierString(v5, v17, v18, v19);
    objc_msgSend_setObject_forKey_(v4, v21, (uint64_t)v20, v22, @"ri");
  }
  uint64_t v23 = objc_msgSend_strictTransportSecurity(v5, v17, v18, v19);

  if (v23)
  {
    v27 = objc_msgSend_strictTransportSecurity(v5, v24, v25, v26);
    objc_msgSend_setObject_forKey_(v4, v28, (uint64_t)v27, v29, @"strict-transport-security");
  }
  v30 = objc_msgSend_traceId(v5, v24, v25, v26);

  if (v30)
  {
    v34 = objc_msgSend_traceId(v5, v31, v32, v33);
    objc_msgSend_setObject_forKey_(v4, v35, (uint64_t)v34, v36, @"x-b3-traceid");
  }
  uint64_t v37 = objc_msgSend_splunkHint(v5, v31, v32, v33);

  if (v37)
  {
    uint64_t v41 = objc_msgSend_splunkHint(v5, v38, v39, v40);
    objc_msgSend_setObject_forKey_(v4, v42, (uint64_t)v41, v43, @"sh");
  }
  v44 = objc_msgSend_asHttpHeader(v5, v38, v39, v40);

  if (v44)
  {
    double v48 = objc_msgSend_asHttpHeader(v5, v45, v46, v47);
    objc_msgSend_setObject_forKey_(v4, v49, (uint64_t)v48, v50, @"as");
  }
  return v4;
}

- (id)extractMadridDeliveryContextFrom:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  if ((objc_opt_respondsToSelector() & 1) != 0
    && (objc_opt_respondsToSelector() & 1) != 0
    && objc_msgSend_has_count(v3, v5, v6, v7))
  {
    uint64_t v11 = NSNumber;
    uint64_t v12 = objc_msgSend_count(v3, v8, v9, v10);
    double v15 = objc_msgSend_numberWithUnsignedInteger_(v11, v13, v12, v14);
    objc_msgSend_setObject_forKey_(v4, v16, (uint64_t)v15, v17, @"c");
  }
  return v4;
}

- (id)extractQuickRelayAllocationStatusFrom:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v5 = v3;
  if (objc_msgSend_has_participantId(v5, v6, v7, v8))
  {
    uint64_t v12 = NSNumber;
    uint64_t v13 = objc_msgSend_participantId(v5, v9, v10, v11);
    double v16 = objc_msgSend_numberWithUnsignedLongLong_(v12, v14, v13, v15);
    objc_msgSend_setObject_forKey_(v4, v17, (uint64_t)v16, v18, @"qri");
  }
  if (objc_msgSend_has_allocationStatus(v5, v9, v10, v11))
  {
    double v22 = NSNumber;
    uint64_t v23 = objc_msgSend_allocationStatus(v5, v19, v20, v21);
    double v26 = objc_msgSend_numberWithInteger_(v22, v24, v23, v25);
    objc_msgSend_setObject_forKey_(v4, v27, (uint64_t)v26, v28, @"qrs");
  }
  double v29 = objc_msgSend_token(v5, v19, v20, v21);

  if (v29)
  {
    double v33 = objc_msgSend_token(v5, v30, v31, v32);
    objc_msgSend_setObject_forKey_(v4, v34, (uint64_t)v33, v35, @"t");
  }
  double v36 = objc_msgSend_destinationId(v5, v30, v31, v32);

  if (v36)
  {
    double v40 = objc_msgSend_destinationId(v5, v37, v38, v39);
    objc_msgSend_setObject_forKey_(v4, v41, (uint64_t)v40, v42, @"tP");
  }
  return v4;
}

- (id)extractQuickRelaySelfAllocTokenFrom:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v5 = v3;
  uint64_t v9 = objc_msgSend_relayIp(v5, v6, v7, v8);

  if (v9)
  {
    uint64_t v13 = objc_msgSend_relayIp(v5, v10, v11, v12);
    objc_msgSend_setObject_forKey_(v4, v14, (uint64_t)v13, v15, @"qrip");
  }
  double v16 = objc_msgSend_relayIpv6(v5, v10, v11, v12);

  if (v16)
  {
    uint64_t v20 = objc_msgSend_relayIpv6(v5, v17, v18, v19);
    objc_msgSend_setObject_forKey_(v4, v21, (uint64_t)v20, v22, @"qrip6");
  }
  if (objc_msgSend_has_relayPort(v5, v17, v18, v19))
  {
    double v26 = NSNumber;
    uint64_t v27 = objc_msgSend_relayPort(v5, v23, v24, v25);
    v30 = objc_msgSend_numberWithInteger_(v26, v28, v27, v29);
    objc_msgSend_setObject_forKey_(v4, v31, (uint64_t)v30, v32, @"qrp");
  }
  double v33 = objc_msgSend_relaySessionKey(v5, v23, v24, v25);

  if (v33)
  {
    uint64_t v37 = objc_msgSend_relaySessionKey(v5, v34, v35, v36);
    objc_msgSend_setObject_forKey_(v4, v38, (uint64_t)v37, v39, @"qrsk");
  }
  double v40 = objc_msgSend_relaySessionId(v5, v34, v35, v36);

  if (v40)
  {
    v44 = objc_msgSend_relaySessionId(v5, v41, v42, v43);
    objc_msgSend_setObject_forKey_(v4, v45, (uint64_t)v44, v46, @"qrsi");
  }
  double v47 = objc_msgSend_relayAccessToken(v5, v41, v42, v43);

  if (v47)
  {
    v51 = objc_msgSend_relayAccessToken(v5, v48, v49, v50);
    objc_msgSend_setObject_forKey_(v4, v52, (uint64_t)v51, v53, @"qrst");
  }
  if (objc_msgSend_has_relayProvider(v5, v48, v49, v50))
  {
    v57 = NSNumber;
    uint64_t v58 = objc_msgSend_relayProvider(v5, v54, v55, v56);
    v61 = objc_msgSend_numberWithInteger_(v57, v59, v58, v60);
    objc_msgSend_setObject_forKey_(v4, v62, (uint64_t)v61, v63, @"qrpr");
  }
  return v4;
}

- (id)extractMadridProtocolPayloadFrom:(id)a3
{
  uint64_t v1416 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v6 = v4;
  uint64_t v7 = NSNumber;
  uint64_t v11 = objc_msgSend_command(v6, v8, v9, v10);
  double v14 = objc_msgSend_numberWithInteger_(v7, v12, v11, v13);
  objc_msgSend_setObject_forKey_(v5, v15, (uint64_t)v14, v16, @"c");

  if (objc_msgSend_has_commandContext(v6, v17, v18, v19))
  {
    uint64_t v23 = NSNumber;
    uint64_t v24 = objc_msgSend_commandContext(v6, v20, v21, v22);
    uint64_t v27 = objc_msgSend_numberWithInteger_(v23, v25, v24, v26);
    objc_msgSend_setObject_forKey_(v5, v28, (uint64_t)v27, v29, @"cc");
  }
  if (objc_msgSend_has_version(v6, v20, v21, v22))
  {
    double v33 = NSNumber;
    uint64_t v34 = objc_msgSend_version(v6, v30, v31, v32);
    uint64_t v37 = objc_msgSend_numberWithInteger_(v33, v35, v34, v36);
    objc_msgSend_setObject_forKey_(v5, v38, (uint64_t)v37, v39, @"v");
  }
  double v40 = objc_msgSend_payload(v6, v30, v31, v32);

  if (v40)
  {
    v44 = objc_msgSend_payload(v6, v41, v42, v43);
    objc_msgSend_setObject_forKey_(v5, v45, (uint64_t)v44, v46, @"P");
  }
  double v47 = objc_msgSend_bulkedPayload(v6, v41, v42, v43);

  if (v47)
  {
    v51 = objc_msgSend_bulkedPayload(v6, v48, v49, v50);
    objc_msgSend_setObject_forKey_(v5, v52, (uint64_t)v51, v53, @"N");
  }
  v54 = objc_msgSend_fanoutPayload(v6, v48, v49, v50);

  if (v54)
  {
    uint64_t v58 = objc_msgSend_fanoutPayload(v6, v55, v56, v57);
    objc_msgSend_setObject_forKey_(v5, v59, (uint64_t)v58, v60, @"fP");
  }
  v61 = objc_msgSend_additionalPayload(v6, v55, v56, v57);

  if (v61)
  {
    double v65 = objc_msgSend_additionalPayload(v6, v62, v63, v64);
    objc_msgSend_setObject_forKey_(v5, v66, (uint64_t)v65, v67, @"aP");
  }
  v68 = objc_msgSend_payloadMetadata(v6, v62, v63, v64);

  if (v68)
  {
    double v72 = objc_msgSend_payloadMetadata(v6, v69, v70, v71);
    objc_msgSend_setObject_forKey_(v5, v73, (uint64_t)v72, v74, @"Pm");
  }
  double v75 = objc_msgSend_messageId(v6, v69, v70, v71);

  if (v75)
  {
    double v79 = objc_msgSend_messageId(v6, v76, v77, v78);
    objc_msgSend_setObject_forKey_(v5, v80, (uint64_t)v79, v81, @"i");
  }
  uint64_t v82 = objc_msgSend_messageUUID(v6, v76, v77, v78);

  if (v82)
  {
    uint64_t v86 = objc_msgSend_messageUUID(v6, v83, v84, v85);
    objc_msgSend_setObject_forKey_(v5, v87, (uint64_t)v86, v88, @"U");
  }
  if (objc_opt_respondsToSelector())
  {
    double v92 = objc_msgSend_queueId(v6, v89, v90, v91);

    if (v92)
    {
      uint64_t v93 = objc_msgSend_queueId(v6, v89, v90, v91);
      objc_msgSend_setObject_forKey_(v5, v94, (uint64_t)v93, v95, @"qI");
    }
  }
  if (objc_msgSend_has_deliveryStatus(v6, v89, v90, v91))
  {
    double v99 = NSNumber;
    uint64_t v100 = objc_msgSend_deliveryStatus(v6, v96, v97, v98);
    double v103 = objc_msgSend_numberWithBool_(v99, v101, v100, v102);
    objc_msgSend_setObject_forKey_(v5, v104, (uint64_t)v103, v105, @"D");
  }
  if (objc_opt_respondsToSelector())
  {
    uint64_t v109 = objc_msgSend_deliveryContext(v6, v106, v107, v108);
    v112 = objc_msgSend_extractMadridDeliveryContextFrom_(self, v110, (uint64_t)v109, v111);

    if (v112 && objc_msgSend_count(v112, v113, v114, v115)) {
      objc_msgSend_setObject_forKey_(v5, v116, (uint64_t)v112, v117, @"Dc");
    }
  }
  if (objc_msgSend_has_certifiedDeliveryVersion(v6, v106, v107, v108))
  {
    double v121 = NSNumber;
    uint64_t v122 = objc_msgSend_certifiedDeliveryVersion(v6, v118, v119, v120);
    v125 = objc_msgSend_numberWithInteger_(v121, v123, v122, v124);
    objc_msgSend_setObject_forKey_(v5, v126, (uint64_t)v125, v127, @"cdv");
  }
  v128 = objc_msgSend_certifiedDeliveryRts(v6, v118, v119, v120);

  if (v128)
  {
    v132 = objc_msgSend_certifiedDeliveryRts(v6, v129, v130, v131);
    objc_msgSend_setObject_forKey_(v5, v133, (uint64_t)v132, v134, @"cdr");
  }
  if (objc_msgSend_has_noResponseNeeded(v6, v129, v130, v131))
  {
    v138 = NSNumber;
    uint64_t v139 = objc_msgSend_noResponseNeeded(v6, v135, v136, v137);
    v142 = objc_msgSend_numberWithBool_(v138, v140, v139, v141);
    objc_msgSend_setObject_forKey_(v5, v143, (uint64_t)v142, v144, @"nr");
  }
  if (objc_msgSend_has_generateDeliveryReceipt(v6, v135, v136, v137))
  {
    v148 = NSNumber;
    uint64_t DeliveryReceipt = objc_msgSend_generateDeliveryReceipt(v6, v145, v146, v147);
    v152 = objc_msgSend_numberWithBool_(v148, v150, DeliveryReceipt, v151);
    objc_msgSend_setObject_forKey_(v5, v153, (uint64_t)v152, v154, @"gd");
  }
  v155 = objc_msgSend_sessionToken(v6, v145, v146, v147);

  if (v155)
  {
    v159 = objc_msgSend_sessionToken(v6, v156, v157, v158);
    objc_msgSend_setObject_forKey_(v5, v160, (uint64_t)v159, v161, @"sT");
  }
  v162 = objc_msgSend_homekitSessionToken(v6, v156, v157, v158);

  if (v162)
  {
    v166 = objc_msgSend_homekitSessionToken(v6, v163, v164, v165);
    objc_msgSend_setObject_forKey_(v5, v167, (uint64_t)v166, v168, @"hT");
  }
  v169 = objc_msgSend_destinationId(v6, v163, v164, v165);

  if (v169)
  {
    v173 = objc_msgSend_destinationId(v6, v170, v171, v172);
    objc_msgSend_setObject_forKey_(v5, v174, (uint64_t)v173, v175, @"tP");
  }
  v176 = objc_msgSend_userAgent(v6, v170, v171, v172);

  if (v176)
  {
    v180 = objc_msgSend_userAgent(v6, v177, v178, v179);
    objc_msgSend_setObject_forKey_(v5, v181, (uint64_t)v180, v182, @"ua");
  }
  v183 = objc_msgSend_MMCSOwnerId(v6, v177, v178, v179);

  if (v183)
  {
    v187 = objc_msgSend_MMCSOwnerId(v6, v184, v185, v186);
    objc_msgSend_setObject_forKey_(v5, v188, (uint64_t)v187, v189, @"mO");
  }
  v190 = objc_msgSend_MMCSFileSignature(v6, v184, v185, v186);

  if (v190)
  {
    v194 = objc_msgSend_MMCSFileSignature(v6, v191, v192, v193);
    objc_msgSend_setObject_forKey_(v5, v195, (uint64_t)v194, v196, @"mS");
  }
  if (objc_msgSend_has_MMCSFileLength(v6, v191, v192, v193))
  {
    v200 = NSNumber;
    uint64_t v201 = objc_msgSend_MMCSFileLength(v6, v197, v198, v199);
    v204 = objc_msgSend_numberWithLongLong_(v200, v202, v201, v203);
    objc_msgSend_setObject_forKey_(v5, v205, (uint64_t)v204, v206, @"mL");
  }
  v207 = objc_msgSend_MMCSAuthToken(v6, v197, v198, v199);

  if (v207)
  {
    v211 = objc_msgSend_MMCSAuthToken(v6, v208, v209, v210);
    objc_msgSend_setObject_forKey_(v5, v212, (uint64_t)v211, v213, @"mA");
  }
  v214 = objc_msgSend_MMCSAuthUrl(v6, v208, v209, v210);

  if (v214)
  {
    v218 = objc_msgSend_MMCSAuthUrl(v6, v215, v216, v217);
    objc_msgSend_setObject_forKey_(v5, v219, (uint64_t)v218, v220, @"mR");
  }
  v221 = objc_msgSend_MMCSAuthId(v6, v215, v216, v217);

  if (v221)
  {
    v225 = objc_msgSend_MMCSAuthId(v6, v222, v223, v224);
    objc_msgSend_setObject_forKey_(v5, v226, (uint64_t)v225, v227, @"mU");
  }
  v228 = objc_msgSend_MMCSDownloadAuthList(v6, v222, v223, v224);

  if (v228)
  {
    v232 = objc_msgSend_MMCSDownloadAuthList(v6, v229, v230, v231);
    objc_msgSend_setObject_forKey_(v5, v233, (uint64_t)v232, v234, @"dal");
  }
  v235 = objc_msgSend_MMCSDownloadUrlList(v6, v229, v230, v231);

  if (v235)
  {
    v239 = objc_msgSend_MMCSDownloadUrlList(v6, v236, v237, v238);
    objc_msgSend_setObject_forKey_(v5, v240, (uint64_t)v239, v241, @"dul");
  }
  v242 = objc_msgSend_MMCSDownloadUrl(v6, v236, v237, v238);

  if (v242)
  {
    v246 = objc_msgSend_MMCSDownloadUrl(v6, v243, v244, v245);
    objc_msgSend_setObject_forKey_(v5, v247, (uint64_t)v246, v248, @"dR");
  }
  v249 = objc_msgSend_MMCSUploadUrl(v6, v243, v244, v245);

  if (v249)
  {
    v253 = objc_msgSend_MMCSUploadUrl(v6, v250, v251, v252);
    objc_msgSend_setObject_forKey_(v5, v254, (uint64_t)v253, v255, @"uR");
  }
  if (objc_msgSend_has_MMCSExpiryNanos(v6, v250, v251, v252))
  {
    v259 = NSNumber;
    uint64_t v260 = objc_msgSend_MMCSExpiryNanos(v6, v256, v257, v258);
    v263 = objc_msgSend_numberWithLongLong_(v259, v261, v260, v262);
    objc_msgSend_setObject_forKey_(v5, v264, (uint64_t)v263, v265, @"mX");
  }
  if (objc_msgSend_has_contentVersion(v6, v256, v257, v258))
  {
    v269 = NSNumber;
    uint64_t v270 = objc_msgSend_contentVersion(v6, v266, v267, v268);
    v273 = objc_msgSend_numberWithInteger_(v269, v271, v270, v272);
    objc_msgSend_setObject_forKey_(v5, v274, (uint64_t)v273, v275, @"cV");
  }
  v276 = objc_msgSend_contentHeaders(v6, v266, v267, v268);

  if (v276)
  {
    v280 = objc_msgSend_contentHeaders(v6, v277, v278, v279);
    objc_msgSend_setObject_forKey_(v5, v281, (uint64_t)v280, v282, @"cH");
  }
  v283 = objc_msgSend_contentBody(v6, v277, v278, v279);

  if (v283)
  {
    v287 = objc_msgSend_contentBody(v6, v284, v285, v286);
    objc_msgSend_setObject_forKey_(v5, v288, (uint64_t)v287, v289, @"cB");
  }
  v290 = objc_msgSend_contentReferenceSignature(v6, v284, v285, v286);

  if (v290)
  {
    v294 = objc_msgSend_contentReferenceSignature(v6, v291, v292, v293);
    objc_msgSend_setObject_forKey_(v5, v295, (uint64_t)v294, v296, @"cR");
  }
  if (objc_msgSend_has_attachmentSize(v6, v291, v292, v293))
  {
    v300 = NSNumber;
    uint64_t v301 = objc_msgSend_attachmentSize(v6, v297, v298, v299);
    v304 = objc_msgSend_numberWithInteger_(v300, v302, v301, v303);
    objc_msgSend_setObject_forKey_(v5, v305, (uint64_t)v304, v306, @"mT");
  }
  v307 = objc_msgSend_token(v6, v297, v298, v299);

  if (v307)
  {
    v311 = objc_msgSend_token(v6, v308, v309, v310);
    objc_msgSend_setObject_forKey_(v5, v312, (uint64_t)v311, v313, @"t");
  }
  v314 = objc_msgSend_senderId(v6, v308, v309, v310);

  if (v314)
  {
    v318 = objc_msgSend_senderId(v6, v315, v316, v317);
    objc_msgSend_setObject_forKey_(v5, v319, (uint64_t)v318, v320, @"sP");
  }
  v321 = objc_msgSend_senderOpaqueId(v6, v315, v316, v317);

  if (v321)
  {
    v325 = objc_msgSend_senderOpaqueId(v6, v322, v323, v324);
    objc_msgSend_setObject_forKey_(v5, v326, (uint64_t)v325, v327, @"sI");
  }
  v328 = objc_msgSend_mspId(v6, v322, v323, v324);

  if (v328)
  {
    v332 = objc_msgSend_mspId(v6, v329, v330, v331);
    objc_msgSend_setObject_forKey_(v5, v333, (uint64_t)v332, v334, @"mP");
  }
  if (objc_msgSend_has_responseStatus(v6, v329, v330, v331))
  {
    v338 = NSNumber;
    uint64_t v339 = objc_msgSend_responseStatus(v6, v335, v336, v337);
    v342 = objc_msgSend_numberWithInteger_(v338, v340, v339, v341);
    objc_msgSend_setObject_forKey_(v5, v343, (uint64_t)v342, v344, @"s");
  }
  if (objc_msgSend_has_epochTimeNanos(v6, v335, v336, v337))
  {
    v348 = NSNumber;
    uint64_t v349 = objc_msgSend_epochTimeNanos(v6, v345, v346, v347);
    v352 = objc_msgSend_numberWithLongLong_(v348, v350, v349, v351);
    objc_msgSend_setObject_forKey_(v5, v353, (uint64_t)v352, v354, @"e");
  }
  if (objc_msgSend_has_originalEpochTimeNanos(v6, v345, v346, v347))
  {
    v358 = NSNumber;
    uint64_t v359 = objc_msgSend_originalEpochTimeNanos(v6, v355, v356, v357);
    v362 = objc_msgSend_numberWithLongLong_(v358, v360, v359, v361);
    objc_msgSend_setObject_forKey_(v5, v363, (uint64_t)v362, v364, @"oe");
  }
  if (objc_msgSend_has_failReason(v6, v355, v356, v357))
  {
    v368 = NSNumber;
    uint64_t v369 = objc_msgSend_failReason(v6, v365, v366, v367);
    v372 = objc_msgSend_numberWithInteger_(v368, v370, v369, v371);
    objc_msgSend_setObject_forKey_(v5, v373, (uint64_t)v372, v374, @"fR");
  }
  v375 = objc_msgSend_failMessageId(v6, v365, v366, v367);

  if (v375)
  {
    v379 = objc_msgSend_failMessageId(v6, v376, v377, v378);
    objc_msgSend_setObject_forKey_(v5, v380, (uint64_t)v379, v381, @"fU");
  }
  v382 = objc_msgSend_failMessageIdString(v6, v376, v377, v378);

  if (v382)
  {
    v386 = objc_msgSend_failMessageIdString(v6, v383, v384, v385);
    objc_msgSend_setObject_forKey_(v5, v387, (uint64_t)v386, v388, @"fM");
  }
  if (objc_msgSend_has_failDownloadAttachmentSize(v6, v383, v384, v385))
  {
    v392 = NSNumber;
    uint64_t v393 = objc_msgSend_failDownloadAttachmentSize(v6, v389, v390, v391);
    v396 = objc_msgSend_numberWithInteger_(v392, v394, v393, v395);
    objc_msgSend_setObject_forKey_(v5, v397, (uint64_t)v396, v398, @"fFS");
  }
  if (objc_msgSend_has_failUploadAttachmentSize(v6, v389, v390, v391))
  {
    v402 = NSNumber;
    uint64_t v403 = objc_msgSend_failUploadAttachmentSize(v6, v399, v400, v401);
    v406 = objc_msgSend_numberWithInteger_(v402, v404, v403, v405);
    objc_msgSend_setObject_forKey_(v5, v407, (uint64_t)v406, v408, @"fS");
  }
  v409 = objc_msgSend_failReasonMessage(v6, v399, v400, v401);

  if (v409)
  {
    v413 = objc_msgSend_failReasonMessage(v6, v410, v411, v412);
    objc_msgSend_setObject_forKey_(v5, v414, (uint64_t)v413, v415, @"fRM");
  }
  if (objc_msgSend_has_failTimeElapsed(v6, v410, v411, v412))
  {
    v419 = NSNumber;
    uint64_t v420 = objc_msgSend_failTimeElapsed(v6, v416, v417, v418);
    v423 = objc_msgSend_numberWithLongLong_(v419, v421, v420, v422);
    objc_msgSend_setObject_forKey_(v5, v424, (uint64_t)v423, v425, @"fTE");
  }
  v426 = objc_msgSend_encryptionType(v6, v416, v417, v418);

  if (v426)
  {
    v430 = objc_msgSend_encryptionType(v6, v427, v428, v429);
    objc_msgSend_setObject_forKey_(v5, v431, (uint64_t)v430, v432, @"E");
  }
  if (objc_msgSend_has_storageFlags(v6, v427, v428, v429))
  {
    v436 = NSNumber;
    uint64_t v437 = objc_msgSend_storageFlags(v6, v433, v434, v435);
    v440 = objc_msgSend_numberWithInteger_(v436, v438, v437, v439);
    objc_msgSend_setObject_forKey_(v5, v441, (uint64_t)v440, v442, @"H");
  }
  if (objc_msgSend_has_priority(v6, v433, v434, v435))
  {
    v446 = NSNumber;
    uint64_t v447 = objc_msgSend_priority(v6, v443, v444, v445);
    v450 = objc_msgSend_numberWithInteger_(v446, v448, v447, v449);
    objc_msgSend_setObject_forKey_(v5, v451, (uint64_t)v450, v452, @"pri");
  }
  if (objc_msgSend_has_senderExpectsAck(v6, v443, v444, v445))
  {
    v456 = NSNumber;
    uint64_t v457 = objc_msgSend_senderExpectsAck(v6, v453, v454, v455);
    v460 = objc_msgSend_numberWithInteger_(v456, v458, v457, v459);
    objc_msgSend_setObject_forKey_(v5, v461, (uint64_t)v460, v462, @"ack");
  }
  id v463 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v1408 = 0u;
  long long v1409 = 0u;
  long long v1410 = 0u;
  long long v1411 = 0u;
  v466 = objc_msgSend_dstIdTokenList(v6, v464, v465, 0.0);
  uint64_t v469 = objc_msgSend_countByEnumeratingWithState_objects_count_(v466, v467, (uint64_t)&v1408, v468, v1415, 16);
  if (v469)
  {
    uint64_t v472 = v469;
    uint64_t v473 = *(void *)v1409;
    do
    {
      uint64_t v474 = 0;
      do
      {
        if (*(void *)v1409 != v473) {
          objc_enumerationMutation(v466);
        }
        v475 = objc_msgSend_extractMadridProtocolPayloadFrom_(self, v470, *(void *)(*((void *)&v1408 + 1) + 8 * v474), v471);
        objc_msgSend_addObject_(v463, v476, (uint64_t)v475, v477);

        ++v474;
      }
      while (v472 != v474);
      uint64_t v472 = objc_msgSend_countByEnumeratingWithState_objects_count_(v466, v470, (uint64_t)&v1408, v471, v1415, 16);
    }
    while (v472);
  }

  if (objc_msgSend_count(v463, v478, v479, v480)) {
    objc_msgSend_setObject_forKey_(v5, v481, (uint64_t)v463, v482, @"dtl");
  }

  id v483 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v1404 = 0u;
  long long v1405 = 0u;
  long long v1406 = 0u;
  long long v1407 = 0u;
  v486 = objc_msgSend_madridMessageList(v6, v484, v485, 0.0);
  uint64_t v489 = objc_msgSend_countByEnumeratingWithState_objects_count_(v486, v487, (uint64_t)&v1404, v488, v1414, 16);
  if (v489)
  {
    uint64_t v492 = v489;
    uint64_t v493 = *(void *)v1405;
    do
    {
      uint64_t v494 = 0;
      do
      {
        if (*(void *)v1405 != v493) {
          objc_enumerationMutation(v486);
        }
        v495 = objc_msgSend_extractMadridProtocolPayloadFrom_(self, v490, *(void *)(*((void *)&v1404 + 1) + 8 * v494), v491);
        objc_msgSend_addObject_(v483, v496, (uint64_t)v495, v497);

        ++v494;
      }
      while (v492 != v494);
      uint64_t v492 = objc_msgSend_countByEnumeratingWithState_objects_count_(v486, v490, (uint64_t)&v1404, v491, v1414, 16);
    }
    while (v492);
  }

  if (objc_msgSend_count(v483, v498, v499, v500)) {
    objc_msgSend_setObject_forKey_(v5, v501, (uint64_t)v483, v502, @"mml");
  }

  if (objc_msgSend_has_storageCheckVersion(v6, v503, v504, v505))
  {
    v509 = NSNumber;
    uint64_t v510 = objc_msgSend_storageCheckVersion(v6, v506, v507, v508);
    v513 = objc_msgSend_numberWithInteger_(v509, v511, v510, v512);
    objc_msgSend_setObject_forKey_(v5, v514, (uint64_t)v513, v515, @"scv");
  }
  if (objc_msgSend_has_dateExpirationSeconds(v6, v506, v507, v508))
  {
    v519 = NSNumber;
    uint64_t v520 = objc_msgSend_dateExpirationSeconds(v6, v516, v517, v518);
    v523 = objc_msgSend_numberWithLongLong_(v519, v521, v520, v522);
    objc_msgSend_setObject_forKey_(v5, v524, (uint64_t)v523, v525, @"eX");
  }
  if (objc_msgSend_has_madridProtocol(v6, v516, v517, v518))
  {
    v529 = NSNumber;
    uint64_t v530 = objc_msgSend_madridProtocol(v6, v526, v527, v528);
    v533 = objc_msgSend_numberWithInteger_(v529, v531, v530, v532);
    objc_msgSend_setObject_forKey_(v5, v534, (uint64_t)v533, v535, @"xp");
  }
  if (objc_msgSend_has_internalBuild(v6, v526, v527, v528))
  {
    v539 = NSNumber;
    uint64_t v540 = objc_msgSend_internalBuild(v6, v536, v537, v538);
    v543 = objc_msgSend_numberWithBool_(v539, v541, v540, v542);
    objc_msgSend_setObject_forKey_(v5, v544, (uint64_t)v543, v545, @"x-internal");
  }
  if (objc_msgSend_has_loggingProfile(v6, v536, v537, v538))
  {
    v549 = NSNumber;
    uint64_t v550 = objc_msgSend_loggingProfile(v6, v546, v547, v548);
    v553 = objc_msgSend_numberWithBool_(v549, v551, v550, v552);
    objc_msgSend_setObject_forKey_(v5, v554, (uint64_t)v553, v555, @"x-logging");
  }
  if (objc_msgSend_has_traceProfile(v6, v546, v547, v548))
  {
    v559 = NSNumber;
    uint64_t v560 = objc_msgSend_traceProfile(v6, v556, v557, v558);
    v563 = objc_msgSend_numberWithBool_(v559, v561, v560, v562);
    objc_msgSend_setObject_forKey_(v5, v564, (uint64_t)v563, v565, @"x-trace");
  }
  if (objc_msgSend_has_groupMessage(v6, v556, v557, v558))
  {
    v569 = NSNumber;
    uint64_t v570 = objc_msgSend_groupMessage(v6, v566, v567, v568);
    v573 = objc_msgSend_numberWithBool_(v569, v571, v570, v572);
    objc_msgSend_setObject_forKey_(v5, v574, (uint64_t)v573, v575, @"gm");
  }
  v576 = objc_msgSend_contentType(v6, v566, v567, v568);

  if (v576)
  {
    v580 = objc_msgSend_contentType(v6, v577, v578, v579);
    objc_msgSend_setObject_forKey_(v5, v581, (uint64_t)v580, v582, @"cT");
  }
  v583 = objc_msgSend_adhocServiceOverride(v6, v577, v578, v579);

  if (v583)
  {
    v587 = objc_msgSend_adhocServiceOverride(v6, v584, v585, v586);
    objc_msgSend_setObject_forKey_(v5, v588, (uint64_t)v587, v589, @"aS");
  }
  v590 = objc_msgSend_responseIdentifier(v6, v584, v585, v586);

  if (v590)
  {
    v594 = objc_msgSend_responseIdentifier(v6, v591, v592, v593);
    objc_msgSend_setObject_forKey_(v5, v595, (uint64_t)v594, v596, @"rI");
  }
  v597 = objc_msgSend_responseIdentifierString(v6, v591, v592, v593);

  if (v597)
  {
    v601 = objc_msgSend_responseIdentifierString(v6, v598, v599, v600);
    objc_msgSend_setObject_forKey_(v5, v602, (uint64_t)v601, v603, @"ri");
  }
  v604 = objc_msgSend_strictTransportSecurity(v6, v598, v599, v600);

  if (v604)
  {
    v608 = objc_msgSend_strictTransportSecurity(v6, v605, v606, v607);
    objc_msgSend_setObject_forKey_(v5, v609, (uint64_t)v608, v610, @"strict-transport-security");
  }
  v611 = objc_msgSend_traceId(v6, v605, v606, v607);

  if (v611)
  {
    v615 = objc_msgSend_traceId(v6, v612, v613, v614);
    objc_msgSend_setObject_forKey_(v5, v616, (uint64_t)v615, v617, @"x-b3-traceid");
  }
  v618 = objc_msgSend_splunkHint(v6, v612, v613, v614);

  if (v618)
  {
    v622 = objc_msgSend_splunkHint(v6, v619, v620, v621);
    objc_msgSend_setObject_forKey_(v5, v623, (uint64_t)v622, v624, @"sh");
  }
  v625 = objc_msgSend_asHttpHeader(v6, v619, v620, v621);

  if (v625)
  {
    v629 = objc_msgSend_asHttpHeader(v6, v626, v627, v628);
    objc_msgSend_setObject_forKey_(v5, v630, (uint64_t)v629, v631, @"as");
  }
  if (objc_msgSend_has_homekitDeliveryStatus(v6, v626, v627, v628))
  {
    v635 = NSNumber;
    uint64_t v636 = objc_msgSend_homekitDeliveryStatus(v6, v632, v633, v634);
    v639 = objc_msgSend_numberWithInteger_(v635, v637, v636, v638);
    objc_msgSend_setObject_forKey_(v5, v640, (uint64_t)v639, v641, @"hD");
  }
  v642 = objc_msgSend_homekitReportId(v6, v632, v633, v634);

  if (v642)
  {
    v646 = objc_msgSend_homekitReportId(v6, v643, v644, v645);
    objc_msgSend_setObject_forKey_(v5, v647, (uint64_t)v646, v648, @"hI");
  }
  if (objc_msgSend_has_retryCount(v6, v643, v644, v645))
  {
    v652 = NSNumber;
    uint64_t v653 = objc_msgSend_retryCount(v6, v649, v650, v651);
    v656 = objc_msgSend_numberWithInteger_(v652, v654, v653, v655);
    objc_msgSend_setObject_forKey_(v5, v657, (uint64_t)v656, v658, @"rc");
  }
  v659 = objc_msgSend_testOptions(v6, v649, v650, v651);

  if (v659)
  {
    v663 = objc_msgSend_testOptions(v6, v660, v661, v662);
    objc_msgSend_setObject_forKey_(v5, v664, (uint64_t)v663, v665, @"x-test-opts");
  }
  if (objc_msgSend_has_fanoutChunkNumber(v6, v660, v661, v662))
  {
    v669 = NSNumber;
    uint64_t v670 = objc_msgSend_fanoutChunkNumber(v6, v666, v667, v668);
    v673 = objc_msgSend_numberWithInteger_(v669, v671, v670, v672);
    objc_msgSend_setObject_forKey_(v5, v674, (uint64_t)v673, v675, @"fcn");
  }
  if (objc_msgSend_has_fanoutLastChunk(v6, v666, v667, v668))
  {
    v679 = NSNumber;
    uint64_t Chunk = objc_msgSend_fanoutLastChunk(v6, v676, v677, v678);
    v683 = objc_msgSend_numberWithBool_(v679, v681, Chunk, v682);
    objc_msgSend_setObject_forKey_(v5, v684, (uint64_t)v683, v685, @"flc");
  }
  v686 = objc_msgSend_url(v6, v676, v677, v678);

  if (v686)
  {
    v690 = objc_msgSend_url(v6, v687, v688, v689);
    objc_msgSend_setObject_forKey_(v5, v691, (uint64_t)v690, v692, @"url");
  }
  if (objc_msgSend_has_faceTimeRetryCount(v6, v687, v688, v689))
  {
    v696 = NSNumber;
    uint64_t v697 = objc_msgSend_faceTimeRetryCount(v6, v693, v694, v695);
    v700 = objc_msgSend_numberWithInteger_(v696, v698, v697, v699);
    objc_msgSend_setObject_forKey_(v5, v701, (uint64_t)v700, v702, @"frc");
  }
  if (objc_msgSend_has_webtunnelVersion(v6, v693, v694, v695))
  {
    v706 = NSNumber;
    uint64_t v707 = objc_msgSend_webtunnelVersion(v6, v703, v704, v705);
    v710 = objc_msgSend_numberWithInteger_(v706, v708, v707, v709);
    objc_msgSend_setObject_forKey_(v5, v711, (uint64_t)v710, v712, @"wV");
  }
  v713 = objc_msgSend_httpUrl(v6, v703, v704, v705);

  if (v713)
  {
    v717 = objc_msgSend_httpUrl(v6, v714, v715, v716);
    objc_msgSend_setObject_forKey_(v5, v718, (uint64_t)v717, v719, @"u");
  }
  v720 = objc_msgSend_httpHeaders(v6, v714, v715, v716);
  v723 = objc_msgSend_extractMadridHttpHeadersFrom_(self, v721, (uint64_t)v720, v722);
  v727 = v723;
  if (v723 && objc_msgSend_count(v723, v724, v725, v726)) {
    objc_msgSend_setObject_forKey_(v5, v728, (uint64_t)v727, v729, @"h");
  }

  v733 = objc_msgSend_httpBody(v6, v730, v731, v732);

  if (v733)
  {
    v737 = objc_msgSend_httpBody(v6, v734, v735, v736);
    objc_msgSend_setObject_forKey_(v5, v738, (uint64_t)v737, v739, @"b");
  }
  v740 = objc_msgSend_httpBodyUrl(v6, v734, v735, v736);

  if (v740)
  {
    v744 = objc_msgSend_httpBodyUrl(v6, v741, v742, v743);
    objc_msgSend_setObject_forKey_(v5, v745, (uint64_t)v744, v746, @"bu");
  }
  v747 = objc_msgSend_httpBodyKey(v6, v741, v742, v743);

  if (v747)
  {
    v751 = objc_msgSend_httpBodyKey(v6, v748, v749, v750);
    objc_msgSend_setObject_forKey_(v5, v752, (uint64_t)v751, v753, @"bk");
  }
  if (objc_msgSend_has_httpResponseStatus(v6, v748, v749, v750))
  {
    v757 = NSNumber;
    uint64_t v758 = objc_msgSend_httpResponseStatus(v6, v754, v755, v756);
    v761 = objc_msgSend_numberWithInteger_(v757, v759, v758, v760);
    objc_msgSend_setObject_forKey_(v5, v762, (uint64_t)v761, v763, @"hs");
  }
  v764 = objc_msgSend_httpErrorMsg(v6, v754, v755, v756);

  if (v764)
  {
    v768 = objc_msgSend_httpErrorMsg(v6, v765, v766, v767);
    objc_msgSend_setObject_forKey_(v5, v769, (uint64_t)v768, v770, @"hr");
  }
  if (objc_msgSend_has_writeToCloudkit(v6, v765, v766, v767))
  {
    v774 = NSNumber;
    uint64_t v775 = objc_msgSend_writeToCloudkit(v6, v771, v772, v773);
    v778 = objc_msgSend_numberWithBool_(v774, v776, v775, v777);
    objc_msgSend_setObject_forKey_(v5, v779, (uint64_t)v778, v780, @"ck");
  }
  if (objc_msgSend_has_pessimisticCheck(v6, v771, v772, v773))
  {
    v784 = NSNumber;
    uint64_t v785 = objc_msgSend_pessimisticCheck(v6, v781, v782, v783);
    v788 = objc_msgSend_numberWithBool_(v784, v786, v785, v787);
    objc_msgSend_setObject_forKey_(v5, v789, (uint64_t)v788, v790, @"x-pessimistic");
  }
  if (objc_msgSend_has_unfilteredHeaders(v6, v781, v782, v783))
  {
    v794 = NSNumber;
    uint64_t v795 = objc_msgSend_unfilteredHeaders(v6, v791, v792, v793);
    v798 = objc_msgSend_numberWithBool_(v794, v796, v795, v797);
    objc_msgSend_setObject_forKey_(v5, v799, (uint64_t)v798, v800, @"nH");
  }
  if (objc_msgSend_has_deliveryStatusFlags(v6, v791, v792, v793))
  {
    v804 = NSNumber;
    uint64_t v805 = objc_msgSend_deliveryStatusFlags(v6, v801, v802, v803);
    v808 = objc_msgSend_numberWithInteger_(v804, v806, v805, v807);
    objc_msgSend_setObject_forKey_(v5, v809, (uint64_t)v808, v810, @"O");
  }
  v811 = objc_msgSend_conferenceURI(v6, v801, v802, v803);

  if (v811)
  {
    v815 = objc_msgSend_conferenceURI(v6, v812, v813, v814);
    objc_msgSend_setObject_forKey_(v5, v816, (uint64_t)v815, v817, @"curi");
  }
  v818 = objc_msgSend_selfSessionToken(v6, v812, v813, v814);

  if (v818)
  {
    v822 = objc_msgSend_selfSessionToken(v6, v819, v820, v821);
    objc_msgSend_setObject_forKey_(v5, v823, (uint64_t)v822, v824, @"sst");
  }
  v825 = objc_msgSend_queryHash(v6, v819, v820, v821);

  if (v825)
  {
    v829 = objc_msgSend_queryHash(v6, v826, v827, v828);
    objc_msgSend_setObject_forKey_(v5, v830, (uint64_t)v829, v831, @"qH");
  }
  if (objc_msgSend_has_testDropPoint(v6, v826, v827, v828))
  {
    v835 = NSNumber;
    uint64_t v836 = objc_msgSend_testDropPoint(v6, v832, v833, v834);
    v839 = objc_msgSend_numberWithInteger_(v835, v837, v836, v838);
    objc_msgSend_setObject_forKey_(v5, v840, (uint64_t)v839, v841, @"x-dp");
  }
  if (objc_msgSend_has_userPlusOne(v6, v832, v833, v834))
  {
    v845 = NSNumber;
    uint64_t v846 = objc_msgSend_userPlusOne(v6, v842, v843, v844);
    v849 = objc_msgSend_numberWithBool_(v845, v847, v846, v848);
    objc_msgSend_setObject_forKey_(v5, v850, (uint64_t)v849, v851, @"up1");
  }
  if (objc_msgSend_has_isInitiatorKey(v6, v842, v843, v844))
  {
    v855 = NSNumber;
    uint64_t isInitiatorKey = objc_msgSend_isInitiatorKey(v6, v852, v853, v854);
    v859 = objc_msgSend_numberWithBool_(v855, v857, isInitiatorKey, v858);
    objc_msgSend_setObject_forKey_(v5, v860, (uint64_t)v859, v861, @"is-initiator-key");
  }
  if (objc_msgSend_has_errorCode(v6, v852, v853, v854))
  {
    v865 = NSNumber;
    uint64_t v866 = objc_msgSend_errorCode(v6, v862, v863, v864);
    v869 = objc_msgSend_numberWithInteger_(v865, v867, v866, v868);
    objc_msgSend_setObject_forKey_(v5, v870, (uint64_t)v869, v871, @"eC");
  }
  if (objc_msgSend_has_messageCheckpoint(v6, v862, v863, v864))
  {
    v875 = NSNumber;
    uint64_t v876 = objc_msgSend_messageCheckpoint(v6, v872, v873, v874);
    v879 = objc_msgSend_numberWithBool_(v875, v877, v876, v878);
    objc_msgSend_setObject_forKey_(v5, v880, (uint64_t)v879, v881, @"mc");
  }
  if (objc_msgSend_has_conversationId(v6, v872, v873, v874))
  {
    v885 = NSNumber;
    uint64_t v886 = objc_msgSend_conversationId(v6, v882, v883, v884);
    v889 = objc_msgSend_numberWithInteger_(v885, v887, v886, v888);
    objc_msgSend_setObject_forKey_(v5, v890, (uint64_t)v889, v891, @"ci");
  }
  if (objc_msgSend_has_protocolVersion(v6, v882, v883, v884))
  {
    v895 = NSNumber;
    uint64_t v896 = objc_msgSend_protocolVersion(v6, v892, v893, v894);
    v899 = objc_msgSend_numberWithInteger_(v895, v897, v896, v898);
    objc_msgSend_setObject_forKey_(v5, v900, (uint64_t)v899, v901, @"qv");
  }
  v902 = objc_msgSend_applicationId(v6, v892, v893, v894);

  if (v902)
  {
    v906 = objc_msgSend_applicationId(v6, v903, v904, v905);
    objc_msgSend_setObject_forKey_(v5, v907, (uint64_t)v906, v908, @"qai");
  }
  if (objc_msgSend_has_reason(v6, v903, v904, v905))
  {
    v912 = NSNumber;
    uint64_t v913 = objc_msgSend_reason(v6, v909, v910, v911);
    v916 = objc_msgSend_numberWithInteger_(v912, v914, v913, v915);
    objc_msgSend_setObject_forKey_(v5, v917, (uint64_t)v916, v918, @"qr");
  }
  if (objc_msgSend_has_prevErrorCode(v6, v909, v910, v911))
  {
    v922 = NSNumber;
    uint64_t ErrorCode = objc_msgSend_prevErrorCode(v6, v919, v920, v921);
    v926 = objc_msgSend_numberWithInteger_(v922, v924, ErrorCode, v925);
    objc_msgSend_setObject_forKey_(v5, v927, (uint64_t)v926, v928, @"qpec");
  }
  v929 = objc_msgSend_prevAccessToken(v6, v919, v920, v921);

  if (v929)
  {
    v933 = objc_msgSend_prevAccessToken(v6, v930, v931, v932);
    objc_msgSend_setObject_forKey_(v5, v934, (uint64_t)v933, v935, @"qpat");
  }
  v936 = objc_msgSend_prevRelayIp(v6, v930, v931, v932);

  if (v936)
  {
    v940 = objc_msgSend_prevRelayIp(v6, v937, v938, v939);
    objc_msgSend_setObject_forKey_(v5, v941, (uint64_t)v940, v942, @"qpip");
  }
  if (objc_msgSend_has_prevTimestamp(v6, v937, v938, v939))
  {
    v946 = NSNumber;
    uint64_t Timestamp = objc_msgSend_prevTimestamp(v6, v943, v944, v945);
    v950 = objc_msgSend_numberWithInteger_(v946, v948, Timestamp, v949);
    objc_msgSend_setObject_forKey_(v5, v951, (uint64_t)v950, v952, @"qpt");
  }
  v953 = objc_msgSend_activeAccessToken(v6, v943, v944, v945);

  if (v953)
  {
    v957 = objc_msgSend_activeAccessToken(v6, v954, v955, v956);
    objc_msgSend_setObject_forKey_(v5, v958, (uint64_t)v957, v959, @"qaat");
  }
  v960 = objc_msgSend_activeRelayIp(v6, v954, v955, v956);

  if (v960)
  {
    v964 = objc_msgSend_activeRelayIp(v6, v961, v962, v963);
    objc_msgSend_setObject_forKey_(v5, v965, (uint64_t)v964, v966, @"qaip");
  }
  if (objc_msgSend_has_selfAllocTokenCountOld(v6, v961, v962, v963))
  {
    v970 = NSNumber;
    uint64_t v971 = objc_msgSend_selfAllocTokenCountOld(v6, v967, v968, v969);
    v974 = objc_msgSend_numberWithInteger_(v970, v972, v971, v973);
    objc_msgSend_setObject_forKey_(v5, v975, (uint64_t)v974, v976, @"qsatc");
  }
  if (objc_msgSend_has_selfAllocTokenCount(v6, v967, v968, v969))
  {
    v980 = NSNumber;
    uint64_t v981 = objc_msgSend_selfAllocTokenCount(v6, v977, v978, v979);
    v984 = objc_msgSend_numberWithInteger_(v980, v982, v981, v983);
    objc_msgSend_setObject_forKey_(v5, v985, (uint64_t)v984, v986, @"qsats");
  }
  if (objc_msgSend_has_qrNewSession(v6, v977, v978, v979))
  {
    v990 = NSNumber;
    uint64_t v991 = objc_msgSend_qrNewSession(v6, v987, v988, v989);
    v994 = objc_msgSend_numberWithBool_(v990, v992, v991, v993);
    objc_msgSend_setObject_forKey_(v5, v995, (uint64_t)v994, v996, @"qns");
  }
  if (objc_msgSend_has_requestType(v6, v987, v988, v989))
  {
    v1000 = NSNumber;
    uint64_t v1001 = objc_msgSend_requestType(v6, v997, v998, v999);
    v1004 = objc_msgSend_numberWithInteger_(v1000, v1002, v1001, v1003);
    objc_msgSend_setObject_forKey_(v5, v1005, (uint64_t)v1004, v1006, @"qat");
  }
  v1007 = objc_msgSend_idsSessionId(v6, v997, v998, v999);

  if (v1007)
  {
    v1011 = objc_msgSend_idsSessionId(v6, v1008, v1009, v1010);
    objc_msgSend_setObject_forKey_(v5, v1012, (uint64_t)v1011, v1013, @"qids");
  }
  if (objc_msgSend_has_relayProvider(v6, v1008, v1009, v1010))
  {
    v1017 = NSNumber;
    uint64_t v1018 = objc_msgSend_relayProvider(v6, v1014, v1015, v1016);
    v1021 = objc_msgSend_numberWithInteger_(v1017, v1019, v1018, v1020);
    objc_msgSend_setObject_forKey_(v5, v1022, (uint64_t)v1021, v1023, @"qrpr");
  }
  if (objc_msgSend_has_sharedSession(v6, v1014, v1015, v1016))
  {
    v1027 = NSNumber;
    uint64_t v1028 = objc_msgSend_sharedSession(v6, v1024, v1025, v1026);
    v1031 = objc_msgSend_numberWithBool_(v1027, v1029, v1028, v1030);
    objc_msgSend_setObject_forKey_(v5, v1032, (uint64_t)v1031, v1033, @"qrss");
  }
  v1034 = objc_msgSend_groupId(v6, v1024, v1025, v1026);

  if (v1034)
  {
    v1038 = objc_msgSend_groupId(v6, v1035, v1036, v1037);
    objc_msgSend_setObject_forKey_(v5, v1039, (uint64_t)v1038, v1040, @"qgid");
  }
  if (objc_msgSend_has_groupMemberCount(v6, v1035, v1036, v1037))
  {
    v1044 = NSNumber;
    uint64_t v1045 = objc_msgSend_groupMemberCount(v6, v1041, v1042, v1043);
    v1048 = objc_msgSend_numberWithInteger_(v1044, v1046, v1045, v1047);
    objc_msgSend_setObject_forKey_(v5, v1049, (uint64_t)v1048, v1050, @"qgmc");
  }
  if (objc_msgSend_has_allocateInfoAttribute(v6, v1041, v1042, v1043))
  {
    v1054 = NSNumber;
    uint64_t InfoAttribute = objc_msgSend_allocateInfoAttribute(v6, v1051, v1052, v1053);
    v1058 = objc_msgSend_numberWithInteger_(v1054, v1056, InfoAttribute, v1057);
    objc_msgSend_setObject_forKey_(v5, v1059, (uint64_t)v1058, v1060, @"qia");
  }
  v1061 = objc_msgSend_relayIp(v6, v1051, v1052, v1053);

  if (v1061)
  {
    v1065 = objc_msgSend_relayIp(v6, v1062, v1063, v1064);
    objc_msgSend_setObject_forKey_(v5, v1066, (uint64_t)v1065, v1067, @"qrip");
  }
  v1068 = objc_msgSend_relayIpv6(v6, v1062, v1063, v1064);

  if (v1068)
  {
    v1072 = objc_msgSend_relayIpv6(v6, v1069, v1070, v1071);
    objc_msgSend_setObject_forKey_(v5, v1073, (uint64_t)v1072, v1074, @"qrip6");
  }
  if (objc_msgSend_has_relayPort(v6, v1069, v1070, v1071))
  {
    v1078 = NSNumber;
    uint64_t v1079 = objc_msgSend_relayPort(v6, v1075, v1076, v1077);
    v1082 = objc_msgSend_numberWithInteger_(v1078, v1080, v1079, v1081);
    objc_msgSend_setObject_forKey_(v5, v1083, (uint64_t)v1082, v1084, @"qrp");
  }
  v1085 = objc_msgSend_relayAccessToken(v6, v1075, v1076, v1077);

  if (v1085)
  {
    v1089 = objc_msgSend_relayAccessToken(v6, v1086, v1087, v1088);
    objc_msgSend_setObject_forKey_(v5, v1090, (uint64_t)v1089, v1091, @"qrst");
  }
  v1092 = objc_msgSend_relaySessionKey(v6, v1086, v1087, v1088);

  if (v1092)
  {
    v1096 = objc_msgSend_relaySessionKey(v6, v1093, v1094, v1095);
    objc_msgSend_setObject_forKey_(v5, v1097, (uint64_t)v1096, v1098, @"qrsk");
  }
  v1099 = objc_msgSend_relaySessionId(v6, v1093, v1094, v1095);

  if (v1099)
  {
    v1103 = objc_msgSend_relaySessionId(v6, v1100, v1101, v1102);
    objc_msgSend_setObject_forKey_(v5, v1104, (uint64_t)v1103, v1105, @"qrsi");
  }
  if (objc_msgSend_has_expiryEpochTimeMillis(v6, v1100, v1101, v1102))
  {
    v1109 = NSNumber;
    uint64_t v1110 = objc_msgSend_expiryEpochTimeMillis(v6, v1106, v1107, v1108);
    v1113 = objc_msgSend_numberWithLongLong_(v1109, v1111, v1110, v1112);
    objc_msgSend_setObject_forKey_(v5, v1114, (uint64_t)v1113, v1115, @"qe");
  }
  v1116 = objc_msgSend_initiatorIp(v6, v1106, v1107, v1108);

  if (v1116)
  {
    v1120 = objc_msgSend_initiatorIp(v6, v1117, v1118, v1119);
    objc_msgSend_setObject_forKey_(v5, v1121, (uint64_t)v1120, v1122, @"qsi");
  }
  if (objc_msgSend_has_participantId(v6, v1117, v1118, v1119))
  {
    v1126 = NSNumber;
    uint64_t v1127 = objc_msgSend_participantId(v6, v1123, v1124, v1125);
    v1130 = objc_msgSend_numberWithUnsignedLongLong_(v1126, v1128, v1127, v1129);
    objc_msgSend_setObject_forKey_(v5, v1131, (uint64_t)v1130, v1132, @"qri");
  }
  v1133 = objc_msgSend_softwareVersion(v6, v1123, v1124, v1125);

  if (v1133)
  {
    v1137 = objc_msgSend_softwareVersion(v6, v1134, v1135, v1136);
    objc_msgSend_setObject_forKey_(v5, v1138, (uint64_t)v1137, v1139, @"qswv");
  }
  v1140 = objc_msgSend_relayBuildVersion(v6, v1134, v1135, v1136);

  if (v1140)
  {
    v1144 = objc_msgSend_relayBuildVersion(v6, v1141, v1142, v1143);
    objc_msgSend_setObject_forKey_(v5, v1145, (uint64_t)v1144, v1146, @"qrbv");
  }
  if (objc_msgSend_has_allocationEpochTimeMillis(v6, v1141, v1142, v1143))
  {
    v1150 = NSNumber;
    uint64_t v1151 = objc_msgSend_allocationEpochTimeMillis(v6, v1147, v1148, v1149);
    v1154 = objc_msgSend_numberWithLongLong_(v1150, v1152, v1151, v1153);
    objc_msgSend_setObject_forKey_(v5, v1155, (uint64_t)v1154, v1156, @"qsat");
  }
  if (objc_msgSend_has_allocationStatus(v6, v1147, v1148, v1149))
  {
    v1160 = NSNumber;
    uint64_t v1161 = objc_msgSend_allocationStatus(v6, v1157, v1158, v1159);
    v1164 = objc_msgSend_numberWithInteger_(v1160, v1162, v1161, v1163);
    objc_msgSend_setObject_forKey_(v5, v1165, (uint64_t)v1164, v1166, @"qrs");
  }
  id v1167 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v1400 = 0u;
  long long v1401 = 0u;
  long long v1402 = 0u;
  long long v1403 = 0u;
  v1170 = objc_msgSend_allocationStatuses(v6, v1168, v1169, 0.0);
  uint64_t v1173 = objc_msgSend_countByEnumeratingWithState_objects_count_(v1170, v1171, (uint64_t)&v1400, v1172, v1413, 16);
  if (v1173)
  {
    uint64_t v1176 = v1173;
    uint64_t v1177 = *(void *)v1401;
    do
    {
      uint64_t v1178 = 0;
      do
      {
        if (*(void *)v1401 != v1177) {
          objc_enumerationMutation(v1170);
        }
        v1179 = objc_msgSend_extractQuickRelayAllocationStatusFrom_(self, v1174, *(void *)(*((void *)&v1400 + 1) + 8 * v1178), v1175);
        objc_msgSend_addObject_(v1167, v1180, (uint64_t)v1179, v1181);

        ++v1178;
      }
      while (v1176 != v1178);
      uint64_t v1176 = objc_msgSend_countByEnumeratingWithState_objects_count_(v1170, v1174, (uint64_t)&v1400, v1175, v1413, 16);
    }
    while (v1176);
  }

  if (objc_msgSend_count(v1167, v1182, v1183, v1184)) {
    objc_msgSend_setObject_forKey_(v5, v1185, (uint64_t)v1167, v1186, @"qal");
  }

  id v1187 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v1396 = 0u;
  long long v1397 = 0u;
  long long v1398 = 0u;
  long long v1399 = 0u;
  v1190 = objc_msgSend_selfAllocTokenList(v6, v1188, v1189, 0.0, 0);
  uint64_t v1193 = objc_msgSend_countByEnumeratingWithState_objects_count_(v1190, v1191, (uint64_t)&v1396, v1192, v1412, 16);
  if (v1193)
  {
    uint64_t v1196 = v1193;
    uint64_t v1197 = *(void *)v1397;
    do
    {
      uint64_t v1198 = 0;
      do
      {
        if (*(void *)v1397 != v1197) {
          objc_enumerationMutation(v1190);
        }
        v1199 = objc_msgSend_extractQuickRelaySelfAllocTokenFrom_(self, v1194, *(void *)(*((void *)&v1396 + 1) + 8 * v1198), v1195);
        objc_msgSend_addObject_(v1187, v1200, (uint64_t)v1199, v1201);

        ++v1198;
      }
      while (v1196 != v1198);
      uint64_t v1196 = objc_msgSend_countByEnumeratingWithState_objects_count_(v1190, v1194, (uint64_t)&v1396, v1195, v1412, 16);
    }
    while (v1196);
  }

  if (objc_msgSend_count(v1187, v1202, v1203, v1204)) {
    objc_msgSend_setObject_forKey_(v5, v1205, (uint64_t)v1187, v1206, @"qsatv");
  }

  v1210 = objc_msgSend_relayReportingBlob(v6, v1207, v1208, v1209);

  if (v1210)
  {
    v1214 = objc_msgSend_relayReportingBlob(v6, v1211, v1212, v1213);
    objc_msgSend_setObject_forKey_(v5, v1215, (uint64_t)v1214, v1216, @"qrep");
  }
  if (objc_msgSend_has_relayServerType(v6, v1211, v1212, v1213))
  {
    v1220 = NSNumber;
    uint64_t v1221 = objc_msgSend_relayServerType(v6, v1217, v1218, v1219);
    v1224 = objc_msgSend_numberWithInteger_(v1220, v1222, v1221, v1223);
    objc_msgSend_setObject_forKey_(v5, v1225, (uint64_t)v1224, v1226, @"qrast");
  }
  if (objc_msgSend_has_qrErrorCode(v6, v1217, v1218, v1219))
  {
    v1230 = NSNumber;
    uint64_t v1231 = objc_msgSend_qrErrorCode(v6, v1227, v1228, v1229);
    v1234 = objc_msgSend_numberWithInteger_(v1230, v1232, v1231, v1233);
    objc_msgSend_setObject_forKey_(v5, v1235, (uint64_t)v1234, v1236, @"qec");
  }
  if (objc_msgSend_has_originalCommand(v6, v1227, v1228, v1229))
  {
    v1240 = NSNumber;
    uint64_t v1241 = objc_msgSend_originalCommand(v6, v1237, v1238, v1239);
    v1244 = objc_msgSend_numberWithInteger_(v1240, v1242, v1241, v1243);
    objc_msgSend_setObject_forKey_(v5, v1245, (uint64_t)v1244, v1246, @"oC");
  }
  if ((objc_opt_respondsToSelector() & 1) != 0
    && (objc_opt_respondsToSelector() & 1) != 0
    && objc_msgSend_has_relayHighPriorityPort(v6, v1247, v1248, v1249))
  {
    v1253 = NSNumber;
    uint64_t v1254 = objc_msgSend_relayHighPriorityPort(v6, v1250, v1251, v1252);
    v1257 = objc_msgSend_numberWithInteger_(v1253, v1255, v1254, v1256);
    objc_msgSend_setObject_forKey_(v5, v1258, (uint64_t)v1257, v1259, @"qrhpp");
  }
  if ((objc_opt_respondsToSelector() & 1) != 0
    && (objc_opt_respondsToSelector() & 1) != 0
    && objc_msgSend_has_quickRelayUserType(v6, v1260, v1261, v1262))
  {
    v1266 = NSNumber;
    uint64_t v1267 = objc_msgSend_quickRelayUserType(v6, v1263, v1264, v1265);
    v1270 = objc_msgSend_numberWithInteger_(v1266, v1268, v1267, v1269);
    objc_msgSend_setObject_forKey_(v5, v1271, (uint64_t)v1270, v1272, @"qtu");
  }
  if ((objc_opt_respondsToSelector() & 1) != 0
    && (objc_opt_respondsToSelector() & 1) != 0
    && objc_msgSend_has_ipFamilyPreference(v6, v1273, v1274, v1275))
  {
    v1279 = NSNumber;
    uint64_t v1280 = objc_msgSend_ipFamilyPreference(v6, v1276, v1277, v1278);
    v1283 = objc_msgSend_numberWithInteger_(v1279, v1281, v1280, v1282);
    objc_msgSend_setObject_forKey_(v5, v1284, (uint64_t)v1283, v1285, @"qipp");
  }
  if ((objc_opt_respondsToSelector() & 1) != 0
    && (objc_opt_respondsToSelector() & 1) != 0
    && objc_msgSend_has_isBulkedPayload(v6, v1286, v1287, v1288))
  {
    v1289 = NSNumber;
    uint64_t isBulkedPayload = objc_msgSend_isBulkedPayload(v6, v1286, v1287, v1288);
    v1293 = objc_msgSend_numberWithBool_(v1289, v1291, isBulkedPayload, v1292);
    objc_msgSend_setObject_forKey_(v5, v1294, (uint64_t)v1293, v1295, @"iB");
  }
  if (objc_msgSend_has_wantsAppAck(v6, v1286, v1287, v1288))
  {
    v1299 = NSNumber;
    uint64_t v1300 = objc_msgSend_wantsAppAck(v6, v1296, v1297, v1298);
    v1303 = objc_msgSend_numberWithBool_(v1299, v1301, v1300, v1302);
    objc_msgSend_setObject_forKey_(v5, v1304, (uint64_t)v1303, v1305, @"wA");
  }
  if (objc_opt_respondsToSelector())
  {
    v1309 = objc_msgSend_errorDomain(v6, v1306, v1307, v1308);

    if (v1309)
    {
      v1313 = objc_msgSend_errorDomain(v6, v1310, v1311, v1312);
      objc_msgSend_setObject_forKey_(v5, v1314, (uint64_t)v1313, v1315, @"eD");
    }
  }
  if ((objc_opt_respondsToSelector() & 1) != 0
    && (objc_opt_respondsToSelector() & 1) != 0
    && objc_msgSend_has_expectsPeerResponse(v6, v1316, v1317, v1318))
  {
    v1322 = NSNumber;
    uint64_t v1323 = objc_msgSend_expectsPeerResponse(v6, v1319, v1320, v1321);
    v1326 = objc_msgSend_numberWithBool_(v1322, v1324, v1323, v1325);
    objc_msgSend_setObject_forKey_(v5, v1327, (uint64_t)v1326, v1328, @"eR");
  }
  if ((objc_opt_respondsToSelector() & 1) != 0
    && (objc_opt_respondsToSelector() & 1) != 0
    && objc_msgSend_has_allowGDR(v6, v1329, v1330, v1331))
  {
    v1335 = NSNumber;
    uint64_t v1336 = objc_msgSend_allowGDR(v6, v1332, v1333, v1334);
    v1339 = objc_msgSend_numberWithInteger_(v1335, v1337, v1336, v1338);
    objc_msgSend_setObject_forKey_(v5, v1340, (uint64_t)v1339, v1341, @"gdr");
  }
  if ((objc_opt_respondsToSelector() & 1) != 0
    && objc_msgSend_has_deliveryMinimumTimeDelay(v6, v1342, v1343, v1344))
  {
    v1348 = NSNumber;
    uint64_t v1349 = objc_msgSend_deliveryMinimumTimeDelay(v6, v1345, v1346, v1347);
    v1352 = objc_msgSend_numberWithInteger_(v1348, v1350, v1349, v1351);
    objc_msgSend_setObject_forKey_(v5, v1353, (uint64_t)v1352, v1354, @"dMTs");
  }
  if ((objc_opt_respondsToSelector() & 1) != 0
    && objc_msgSend_has_deliveryMinimumTime(v6, v1355, v1356, v1357))
  {
    v1361 = NSNumber;
    uint64_t v1362 = objc_msgSend_deliveryMinimumTime(v6, v1358, v1359, v1360);
    v1365 = objc_msgSend_numberWithInteger_(v1361, v1363, v1362, v1364);
    objc_msgSend_setObject_forKey_(v5, v1366, (uint64_t)v1365, v1367, @"dmt");
  }
  if ((objc_opt_respondsToSelector() & 1) != 0
    && (objc_opt_respondsToSelector() & 1) != 0
    && objc_msgSend_has_sendMode(v6, v1368, v1369, v1370))
  {
    v1374 = NSNumber;
    uint64_t v1375 = objc_msgSend_sendMode(v6, v1371, v1372, v1373);
    v1378 = objc_msgSend_numberWithInteger_(v1374, v1376, v1375, v1377);
    objc_msgSend_setObject_forKey_(v5, v1379, (uint64_t)v1378, v1380, @"sm");
  }
  if ((objc_opt_respondsToSelector() & 1) != 0
    && (objc_opt_respondsToSelector() & 1) != 0
    && objc_msgSend_has_isTrustedSender(v6, v1381, v1382, v1383))
  {
    v1387 = NSNumber;
    uint64_t isTrustedSender = objc_msgSend_isTrustedSender(v6, v1384, v1385, v1386);
    v1391 = objc_msgSend_numberWithBool_(v1387, v1389, isTrustedSender, v1390);
    objc_msgSend_setObject_forKey_(v5, v1392, (uint64_t)v1391, v1393, @"htu");
  }
  id v1394 = v5;

  return v1394;
}

- (void)logHeaderDiffAgainstSource:(id)a3
{
  id v4 = a3;
  double v8 = objc_msgSend_payload(self, v5, v6, v7);
  if ((objc_msgSend_isEqualToDictionary_(v8, v9, (uint64_t)v4, v10) & 1) == 0)
  {
    uint64_t v11 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)double v14 = 0;
      _os_log_impl(&dword_19D9BE000, v11, OS_LOG_TYPE_DEFAULT, "Payload received from blastdoor does not match the incoming user payload.", v14, 2u);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
      _IDSLogV(0, @"IDSFoundation", @"IDSAPSUserPayload", @"Payload received from blastdoor does not match the incoming user payload.");
    }
    objc_msgSend_logDiffBetween_andTarget_withKeyPath_(self, v12, (uint64_t)v4, v13, v8, @".");
  }
}

- (void)logDiffBetween:(id)a3 andTarget:(id)a4 withKeyPath:(id)a5
{
  uint64_t v96 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v76 = a5;
  long long v82 = 0u;
  long long v83 = 0u;
  long long v84 = 0u;
  long long v85 = 0u;
  id obj = v7;
  uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v9, (uint64_t)&v82, v10, v95, 16);
  if (v12)
  {
    double v13 = "IDSAPSUserPayload";
    uint64_t v14 = *(void *)v83;
    double v15 = @"IDSAPSUserPayload";
    uint64_t v16 = 138413058;
    do
    {
      uint64_t v17 = 0;
      uint64_t v74 = v12;
      do
      {
        if (*(void *)v83 != v14) {
          objc_enumerationMutation(obj);
        }
        uint64_t v18 = *(void *)(*((void *)&v82 + 1) + 8 * v17);
        double v19 = objc_msgSend_objectForKey_(obj, v11, v18, *(double *)&v16, v67, v68, v69, v70);
        uint64_t v22 = objc_msgSend_objectForKey_(v8, v20, v18, v21);
        uint64_t v23 = (void *)v22;
        if (v19)
        {
          if (v22)
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass()))
            {
              double v26 = objc_msgSend_stringWithFormat_(NSString, v24, @"%@%@ .", v25, v76, v18);
              objc_msgSend_logDiffBetween_andTarget_withKeyPath_(self, v27, (uint64_t)v19, v28, v23, v26);
            }
            else if ((objc_msgSend_isEqual_(v19, v24, (uint64_t)v23, v25) & 1) == 0)
            {
              double v29 = OSLogHandleForIDSCategory();
              if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138413058;
                id v88 = v76;
                __int16 v89 = 2112;
                uint64_t v90 = v18;
                __int16 v91 = 2112;
                double v92 = v19;
                __int16 v93 = 2112;
                double v94 = v23;
                _os_log_impl(&dword_19D9BE000, v29, OS_LOG_TYPE_DEFAULT, "HeaderValueMismatch: key {%@%@}}, Source value {%@}, BlastDoor value {%@}", buf, 0x2Au);
              }

              if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
              {
                uint64_t v69 = (uint64_t)v19;
                uint64_t v70 = v23;
                id v67 = v76;
                uint64_t v68 = v18;
                _IDSLogV(0, @"IDSFoundation", v15, @"HeaderValueMismatch: key {%@%@}}, Source value {%@}, BlastDoor value {%@}");
              }
            }
          }
          else
          {
            v30 = OSLogHandleForIDSCategory();
            if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v31 = objc_opt_class();
              *(_DWORD *)buf = 138413058;
              id v88 = v76;
              __int16 v89 = 2112;
              uint64_t v90 = v18;
              __int16 v91 = 2112;
              double v92 = v31;
              __int16 v93 = 2112;
              double v94 = v19;
              id v32 = v8;
              uint64_t v33 = v14;
              uint64_t v34 = v15;
              uint64_t v35 = v13;
              id v36 = v31;
              _os_log_impl(&dword_19D9BE000, v30, OS_LOG_TYPE_DEFAULT, "MissingHeader: key {%@%@}, object class{%@}, value {%@}", buf, 0x2Au);

              double v13 = v35;
              double v15 = v34;
              uint64_t v14 = v33;
              id v8 = v32;
              uint64_t v12 = v74;
            }

            if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
            {
              uint64_t v69 = objc_opt_class();
              uint64_t v70 = v19;
              id v67 = v76;
              uint64_t v68 = v18;
              _IDSLogV(0, @"IDSFoundation", v15, @"MissingHeader: key {%@%@}, object class{%@}, value {%@}");
            }
          }
        }

        ++v17;
      }
      while (v12 != v17);
      uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v11, (uint64_t)&v82, *(double *)&v16, v95, 16);
    }
    while (v12);
  }

  id v37 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v41 = objc_msgSend_allKeys(obj, v38, v39, v40);
  double v71 = objc_msgSend_initWithArray_(v37, v42, (uint64_t)v41, v43);

  id v44 = objc_alloc(MEMORY[0x1E4F1CA80]);
  double v48 = objc_msgSend_allKeys(v8, v45, v46, v47);
  double v73 = objc_msgSend_initWithArray_(v44, v49, (uint64_t)v48, v50);

  objc_msgSend_minusSet_(v73, v51, (uint64_t)v71, v52);
  long long v80 = 0u;
  long long v81 = 0u;
  long long v78 = 0u;
  long long v79 = 0u;
  double v75 = objc_msgSend_allObjects(v73, v53, v54, 0.0);
  uint64_t v58 = objc_msgSend_countByEnumeratingWithState_objects_count_(v75, v55, (uint64_t)&v78, v56, v86, 16);
  if (v58)
  {
    uint64_t v59 = *(void *)v79;
    uint64_t v60 = 138413058;
    do
    {
      for (uint64_t i = 0; i != v58; ++i)
      {
        if (*(void *)v79 != v59) {
          objc_enumerationMutation(v75);
        }
        uint64_t v62 = *(void *)(*((void *)&v78 + 1) + 8 * i);
        uint64_t v63 = objc_msgSend_objectForKey_(v8, v57, v62, *(double *)&v60, v67, v68, v69, v70);
        double v64 = OSLogHandleForIDSCategory();
        if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
        {
          double v65 = objc_opt_class();
          *(_DWORD *)buf = 138413058;
          id v88 = v76;
          __int16 v89 = 2112;
          uint64_t v90 = v62;
          __int16 v91 = 2112;
          double v92 = v65;
          __int16 v93 = 2112;
          double v94 = v63;
          id v66 = v65;
          _os_log_impl(&dword_19D9BE000, v64, OS_LOG_TYPE_DEFAULT, "Extraheader: key {%@%@}, object class{%@}, value {%@}", buf, 0x2Au);
        }
        if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
        {
          uint64_t v69 = objc_opt_class();
          uint64_t v70 = v63;
          id v67 = v76;
          uint64_t v68 = v62;
          _IDSLogV(0, @"IDSFoundation", @"IDSAPSUserPayload", @"Extraheader: key {%@%@}, object class{%@}, value {%@}");
        }
      }
      uint64_t v58 = objc_msgSend_countByEnumeratingWithState_objects_count_(v75, v57, (uint64_t)&v78, *(double *)&v60, v86, 16);
    }
    while (v58);
  }
}

- (NSMutableDictionary)payload
{
  return self->_payload;
}

- (void)setPayload:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
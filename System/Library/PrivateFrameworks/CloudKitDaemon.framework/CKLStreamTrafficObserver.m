@interface CKLStreamTrafficObserver
- (CKDTrafficLogParser)parser;
- (CKLStreamTrafficObserver)initWithLogTypes:(unint64_t)a3;
- (NSMutableDictionary)requestDictionary;
- (NSPredicate)logMessageFilter;
- (OS_dispatch_queue)printQueue;
- (id)parserFromConfigurationMessage:(id)a3;
- (id)requestParsedBlock;
- (void)eventMatched:(id)a3;
- (void)finish;
- (void)parseRequestArrayAndPrint:(id)a3;
- (void)setLogMessageFilter:(id)a3;
- (void)setParser:(id)a3;
- (void)setPrintQueue:(id)a3;
- (void)setRequestDictionary:(id)a3;
- (void)setRequestParsedBlock:(id)a3;
@end

@implementation CKLStreamTrafficObserver

- (CKLStreamTrafficObserver)initWithLogTypes:(unint64_t)a3
{
  v12.receiver = self;
  v12.super_class = (Class)CKLStreamTrafficObserver;
  v3 = [(CKLStreamObserver *)&v12 initWithLogTypes:a3];
  if (v3)
  {
    v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    requestDictionary = v3->_requestDictionary;
    v3->_requestDictionary = v4;

    v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.cloudkitlog.parseandprint", v6);
    printQueue = v3->_printQueue;
    v3->_printQueue = (OS_dispatch_queue *)v7;

    v9 = objc_alloc_init(CKDTrafficLogParser);
    parser = v3->_parser;
    v3->_parser = v9;
  }
  return v3;
}

- (void)eventMatched:(id)a3
{
  v117[1] = *MEMORY[0x1E4F143B8];
  id v100 = a3;
  v99 = objc_msgSend_category(v100, v4, v5);
  objc_msgSend_composedMessage(v100, v6, v7);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend_isEqualToString_(v99, v9, @"LogFacilityTraffic") & 1) != 0
    || objc_msgSend_isEqualToString_(v99, v10, @"Traffic"))
  {
    if (objc_msgSend_hasPrefix_(v8, v10, @"SIM: "))
    {
      uint64_t v12 = objc_msgSend_substringFromIndex_(v8, v11, 5);

      id v8 = (id)v12;
    }
    int hasPrefix = objc_msgSend_hasPrefix_(v8, v11, @"traff-cont: ");
    v16 = objc_msgSend_printQueue(self, v14, v15);
    if (hasPrefix)
    {
      v17 = block;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = sub_1C4E8AFF8;
      block[3] = &unk_1E64F05C8;
      id v8 = v8;
      block[4] = v8;
      dispatch_async(v16, block);
    }
    else
    {
      v17 = v114;
      v114[0] = MEMORY[0x1E4F143A8];
      v114[1] = 3221225472;
      v114[2] = sub_1C4E8B088;
      v114[3] = &unk_1E64F05C8;
      id v8 = v8;
      v114[4] = v8;
      dispatch_async(v16, v114);
    }
    id v18 = (id)v17[4];
    goto LABEL_9;
  }
  if ((objc_msgSend_isEqualToString_(v99, v10, @"LogFacilityTrafficBinary") & 1) != 0
    || objc_msgSend_isEqualToString_(v99, v19, @"TrafficBinary"))
  {
    v21 = [CKLTrafficLogMessageFragment alloc];
    v24 = objc_msgSend_composedMessage(v100, v22, v23);
    id v18 = (id)objc_msgSend_initWithMessage_(v21, v25, (uint64_t)v24);

    if (v18)
    {
      v28 = objc_msgSend_requestDictionary(self, v26, v27);
      v31 = objc_msgSend_uuid(v18, v29, v30);
      v33 = objc_msgSend_objectForKeyedSubscript_(v28, v32, (uint64_t)v31);

      if (v33)
      {
        if (objc_msgSend_type(v18, v34, v35) == 6)
        {
          v112[0] = 0;
          v112[1] = v112;
          v112[2] = 0x3032000000;
          v112[3] = sub_1C4E8B0F4;
          v112[4] = sub_1C4E8B104;
          v36 = self;
          v113 = v36;
          v39 = objc_msgSend_printQueue(v36, v37, v38);
          v109[0] = MEMORY[0x1E4F143A8];
          v109[1] = 3221225472;
          v109[2] = sub_1C4E8B10C;
          v109[3] = &unk_1E64F1BC0;
          v111 = v112;
          id v110 = v33;
          dispatch_async(v39, v109);

          v42 = objc_msgSend_requestDictionary(v36, v40, v41);
          v45 = objc_msgSend_uuid(v18, v43, v44);
          objc_msgSend_removeObjectForKey_(v42, v46, (uint64_t)v45);

          _Block_object_dispose(v112, 8);
        }
        else
        {
          v107[0] = MEMORY[0x1E4F143A8];
          v107[1] = 3221225472;
          v107[2] = sub_1C4E8B11C;
          v107[3] = &unk_1E64F4810;
          id v76 = v18;
          id v108 = v76;
          uint64_t v78 = objc_msgSend_indexOfObjectWithOptions_passingTest_(v33, v77, 2, v107);
          if (v78 == 0x7FFFFFFFFFFFFFFFLL) {
            objc_msgSend_insertObject_atIndex_(v33, v79, (uint64_t)v76, 0);
          }
          else {
            objc_msgSend_insertObject_atIndex_(v33, v79, (uint64_t)v76, v78 + 1);
          }
        }
      }
      else
      {
        id v66 = objc_alloc(MEMORY[0x1E4F1CA48]);
        v68 = objc_msgSend_initWithObjects_(v66, v67, (uint64_t)v18, 0);
        v71 = objc_msgSend_requestDictionary(self, v69, v70);
        v74 = objc_msgSend_uuid(v18, v72, v73);
        objc_msgSend_setObject_forKeyedSubscript_(v71, v75, (uint64_t)v68, v74);
      }
    }
    goto LABEL_9;
  }
  if (!objc_msgSend_isEqualToString_(v99, v20, @"TrafficCompressed")) {
    goto LABEL_10;
  }
  v49 = objc_msgSend_parser(self, v47, v48);
  v117[0] = v8;
  v51 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v50, (uint64_t)v117, 1);
  id v106 = 0;
  char v53 = objc_msgSend_parse_error_(v49, v52, (uint64_t)v51, &v106);
  id v18 = v106;

  if (v53)
  {
    v56 = objc_msgSend_parser(self, v54, v55);
    id v105 = v18;
    objc_msgSend_consumeParsedTrafficLogsAndReturnError_(v56, v57, (uint64_t)&v105);
    id v98 = (id)objc_claimAutoreleasedReturnValue();
    id v97 = v105;

    if (v97)
    {
      id v60 = [NSString alloc];
      id v62 = objc_msgSend_initWithFormat_(v60, v61, @"cloudkitlog consume parsed logs error: %@", v97);
      v65 = (const char *)objc_msgSend_UTF8String(v62, v63, v64);
      puts(v65);
    }
    else
    {
      objc_msgSend_requestParsedBlock(self, v58, v59);
      id v18 = (id)objc_claimAutoreleasedReturnValue();

      if (!v18) {
        goto LABEL_29;
      }
      long long v103 = 0u;
      long long v104 = 0u;
      long long v101 = 0u;
      long long v102 = 0u;
      id v62 = v98;
      uint64_t v88 = objc_msgSend_countByEnumeratingWithState_objects_count_(v62, v85, (uint64_t)&v101, v116, 16);
      if (v88)
      {
        uint64_t v89 = *(void *)v102;
        do
        {
          for (uint64_t i = 0; i != v88; ++i)
          {
            if (*(void *)v102 != v89) {
              objc_enumerationMutation(v62);
            }
            uint64_t v91 = *(void *)(*((void *)&v101 + 1) + 8 * i);
            v92 = objc_msgSend_logMessageFilter(self, v86, v87);
            if (v92)
            {
              v93 = objc_msgSend_logMessageFilter(self, v86, v87);
              int v95 = objc_msgSend_evaluateWithObject_(v93, v94, v91);

              if (!v95) {
                continue;
              }
            }
            objc_msgSend_requestParsedBlock(self, v86, v87);
            v96 = (void (**)(void, void))objc_claimAutoreleasedReturnValue();
            v96[2](v96, v91);
          }
          uint64_t v88 = objc_msgSend_countByEnumeratingWithState_objects_count_(v62, v86, (uint64_t)&v101, v116, 16);
        }
        while (v88);
      }
    }

    id v18 = v97;
  }
  else
  {
    id v80 = [NSString alloc];
    id v98 = objc_msgSend_initWithFormat_(v80, v81, @"cloudkitlog parse error: %@", v18);
    v84 = (const char *)objc_msgSend_UTF8String(v98, v82, v83);
    puts(v84);
  }
LABEL_29:

LABEL_9:
LABEL_10:
}

- (void)parseRequestArrayAndPrint:(id)a3
{
  uint64_t v196 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v169 = self;
  uint64_t v7 = objc_msgSend_printQueue(self, v5, v6);
  dispatch_assert_queue_V2(v7);

  v10 = objc_msgSend_firstObject(v4, v8, v9);
  v167 = objc_msgSend_uuid(v10, v11, v12);

  id v13 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  id v14 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  id v15 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v171 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v16 = [CKDProtobufResponseBodyParser alloc];
  uint64_t v17 = objc_opt_class();
  v19 = objc_msgSend_initWithQoS_messageClass_parsingStandaloneMessage_(v16, v18, 25, v17, 0);
  v193[0] = MEMORY[0x1E4F143A8];
  v193[1] = 3221225472;
  v193[2] = sub_1C4E8BC00;
  v193[3] = &unk_1E64F25E0;
  id v174 = v15;
  id v194 = v174;
  v180 = v19;
  objc_msgSend_setObjectParsedBlock_(v19, v20, (uint64_t)v193);
  v177 = objc_opt_new();
  v168 = objc_opt_new();
  context = (void *)MEMORY[0x1C8789E70]();
  long long v189 = 0u;
  long long v190 = 0u;
  long long v191 = 0u;
  long long v192 = 0u;
  id obj = v4;
  uint64_t v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v21, (uint64_t)&v189, v195, 16);
  if (v22)
  {
    uint64_t v25 = v22;
    uint64_t v170 = 0;
    uint64_t v26 = 0;
    v178 = 0;
    id v172 = v14;
    uint64_t v173 = 0;
    v175 = 0;
    v176 = 0;
    uint64_t v27 = *(void *)v190;
    do
    {
      for (uint64_t i = 0; i != v25; ++i)
      {
        if (*(void *)v190 != v27) {
          objc_enumerationMutation(obj);
        }
        v29 = *(void **)(*((void *)&v189 + 1) + 8 * i);
        if (objc_msgSend_seqNum(v29, v23, v24) != v26)
        {
          id v32 = [NSString alloc];
          uint64_t v35 = objc_msgSend_uuid(v29, v33, v34);
          uint64_t v38 = objc_msgSend_seqNum(v29, v36, v37);
          id v40 = objc_msgSend_initWithFormat_(v32, v39, @"cloudkitlog parse error: A traffic log packet for request %@ was likely dropped. Was expecting sequence number %li but received %li. Will attempt to parse but might be unsuccessful", v35, v26, v38, context);
          v43 = (const char *)objc_msgSend_UTF8String(v40, v41, v42);
          puts(v43);

          uint64_t v26 = objc_msgSend_seqNum(v29, v44, v45);
        }
        v46 = objc_msgSend_dataString(v29, v30, v31);
        uint64_t v49 = objc_msgSend_length(v46, v47, v48);

        switch(objc_msgSend_type(v29, v50, v51))
        {
          case 1:
            id v54 = v13;
            id v55 = objc_alloc(MEMORY[0x1E4F1C9B8]);
            v58 = objc_msgSend_dataString(v29, v56, v57);
            id v60 = (id)objc_msgSend_initWithBase64EncodedString_options_(v55, v59, (uint64_t)v58, 0);

            v61 = (void *)MEMORY[0x1E4F28DC0];
            uint64_t v62 = objc_opt_class();
            uint64_t v64 = objc_msgSend_unarchivedObjectOfClass_fromData_error_(v61, v63, v62, v60, 0);

            uint64_t v67 = objc_msgSend_requestClassName(v64, v65, v66);
            v68 = (void *)v67;
            v69 = @"CKDPRequestOperation";
            if (v67) {
              v69 = (__CFString *)v67;
            }
            uint64_t v70 = v69;

            uint64_t v72 = (uint64_t)NSClassFromString(v70);
            if (!v72) {
              uint64_t v72 = objc_opt_class();
            }
            objc_msgSend_setMessageClass_(v180, v71, v72);
            uint64_t v75 = objc_msgSend_parsingStandaloneMessage(v64, v73, v74);
            objc_msgSend_setParsingStandaloneMessage_(v180, v76, v75);

            v175 = v64;
            id v13 = v54;
            id v14 = v172;
            break;
          case 2:
            id v77 = objc_alloc(MEMORY[0x1E4F1C9B8]);
            id v80 = objc_msgSend_dataString(v29, v78, v79);
            id v60 = (id)objc_msgSend_initWithBase64EncodedString_options_(v77, v81, (uint64_t)v80, 0);

            v82 = (void *)MEMORY[0x1E4F28DC0];
            uint64_t v83 = objc_opt_class();
            uint64_t v85 = objc_msgSend_unarchivedObjectOfClass_fromData_error_(v82, v84, v83, v60, 0);

            v176 = (void *)v85;
            break;
          case 3:
            v86 = objc_msgSend_dataString(v29, v52, v53);
            objc_msgSend_appendString_(v13, v87, (uint64_t)v86);

            id v88 = objc_alloc(MEMORY[0x1E4F1C9B8]);
            id v60 = (id)objc_msgSend_initWithBase64EncodedString_options_(v88, v89, (uint64_t)v13, 0);
            if (v60)
            {
              objc_msgSend_setString_(v13, v90, (uint64_t)&stru_1F2044F30);
              objc_msgSend_processData_completionHandler_(v180, v91, (uint64_t)v60, 0);
              objc_msgSend_appendData_(v177, v92, (uint64_t)v60);
            }
            LOBYTE(v170) = 1;
            break;
          case 4:
            objc_msgSend_setString_(v14, v52, (uint64_t)&stru_1F2044F30);
            v115 = objc_msgSend_dataString(v29, v113, v114);
            v117 = objc_msgSend_parserFromConfigurationMessage_(v169, v116, (uint64_t)v115);

            v185[0] = MEMORY[0x1E4F143A8];
            v185[1] = 3221225472;
            v185[2] = sub_1C4E8BCC8;
            v185[3] = &unk_1E64F25E0;
            id v186 = v171;
            objc_msgSend_setObjectParsedBlock_(v117, v118, (uint64_t)v185);
            id v60 = v186;
            v178 = v117;
            break;
          case 5:
            v93 = objc_msgSend_dataString(v29, v52, v53);
            objc_msgSend_appendString_(v14, v94, (uint64_t)v93);

            id v95 = objc_alloc(MEMORY[0x1E4F1C9B8]);
            id v60 = (id)objc_msgSend_initWithBase64EncodedString_options_(v95, v96, (uint64_t)v14, 0);
            if (v60)
            {
              objc_msgSend_setString_(v14, v97, (uint64_t)&stru_1F2044F30);
              objc_msgSend_processData_completionHandler_(v178, v98, (uint64_t)v60, 0);
              objc_msgSend_appendData_(v168, v99, (uint64_t)v60);
            }
            BYTE4(v170) = 1;
            break;
          case 7:
            ++v173;
            id v100 = objc_alloc_init(MEMORY[0x1E4F1CA48]);

            id v60 = v180;
            long long v101 = [CKDProtobufResponseBodyParser alloc];
            uint64_t v104 = objc_msgSend_messageClass(v60, v102, v103);
            uint64_t v107 = objc_msgSend_parsingStandaloneMessage(v60, v105, v106);
            id v108 = v101;
            id v14 = v172;
            id v110 = objc_msgSend_initWithQoS_messageClass_parsingStandaloneMessage_(v108, v109, 25, v104, v107);

            v187[0] = MEMORY[0x1E4F143A8];
            v187[1] = 3221225472;
            v187[2] = sub_1C4E8BC64;
            v187[3] = &unk_1E64F25E0;
            id v174 = v100;
            id v188 = v174;
            v180 = v110;
            objc_msgSend_setObjectParsedBlock_(v110, v111, (uint64_t)v187);
            uint64_t v112 = objc_opt_new();

            v177 = (void *)v112;
            break;
          default:
            __assert_rtn("-[CKLStreamTrafficObserver parseRequestArrayAndPrint:]", "CKLStreamTrafficObserver.m", 275, "false");
        }
        v26 += v49;
      }
      uint64_t v25 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v23, (uint64_t)&v189, v195, 16);
    }
    while (v25);
  }
  else
  {
    uint64_t v170 = 0;
    v178 = 0;
    uint64_t v173 = 0;
    v175 = 0;
    v176 = 0;
  }

  v119 = dispatch_group_create();
  dispatch_group_enter(v119);
  v183[0] = MEMORY[0x1E4F143A8];
  v183[1] = 3221225472;
  v183[2] = sub_1C4E8BD2C;
  v183[3] = &unk_1E64F08D0;
  v120 = v119;
  v184 = v120;
  objc_msgSend_finishWithCompletion_(v180, v121, (uint64_t)v183);
  v122 = v178;
  if (v178)
  {
    dispatch_group_enter(v120);
    v181[0] = MEMORY[0x1E4F143A8];
    v181[1] = 3221225472;
    v181[2] = sub_1C4E8BD7C;
    v181[3] = &unk_1E64F08D0;
    v182 = v120;
    objc_msgSend_finishWithCompletion_(v178, v123, (uint64_t)v181);
  }
  dispatch_time_t v124 = dispatch_time(0, 5000000000);
  v127 = v174;
  if (dispatch_group_wait(v120, v124))
  {
    id v128 = [NSString alloc];
    id v130 = objc_msgSend_initWithFormat_(v128, v129, @"cloudkitlog parse error: request object parser timed out for request %@. Likely lost some request object data logs.", v167);
    v133 = (const char *)objc_msgSend_UTF8String(v130, v131, v132);
    puts(v133);
  }
  if ((v170 & 1) != 0 && !objc_msgSend_count(v174, v125, v126))
  {
    id v134 = [NSString alloc];
    id v136 = objc_msgSend_initWithFormat_(v134, v135, @"cloudkitlog parse error: received request object data for request %@ but wasn't able to parse a single request object", v167);
    v139 = (const char *)objc_msgSend_UTF8String(v136, v137, v138);
    puts(v139);

    v141 = objc_msgSend_stringWithFormat_(NSString, v140, @"/tmp/%@.request.dat", v167);
    objc_msgSend_writeToFile_atomically_(v177, v142, (uint64_t)v141, 0);
    NSLog(&cfstr_WroteRawReques.isa, v141);
  }
  if ((v170 & 0x100000000) != 0 && !objc_msgSend_count(v171, v125, v126))
  {
    id v143 = [NSString alloc];
    id v145 = objc_msgSend_initWithFormat_(v143, v144, @"cloudkitlog parse error: received response object data for request %@ but wasn't able to parse a single response object", v167);
    v148 = (const char *)objc_msgSend_UTF8String(v145, v146, v147);
    puts(v148);

    v150 = objc_msgSend_stringWithFormat_(NSString, v149, @"/tmp/%@.response.dat", v167);
    objc_msgSend_writeToFile_atomically_(v168, v151, (uint64_t)v150, 0);
    NSLog(&cfstr_WroteRawRespon.isa, v150);
  }
  v152 = objc_msgSend_requestParsedBlock(v169, v125, v126);

  if (v152)
  {
    v153 = [CKLTrafficLogMessage alloc];
    v155 = objc_msgSend_initWithUuid_requestMetadata_requestObjects_bodyStreamResetCount_responseMetadata_responseObjects_(v153, v154, (uint64_t)v167, v175, v174, v173, v176, v171);
    uint64_t v158 = objc_msgSend_logMessageFilter(v169, v156, v157);
    if (!v158
      || (v161 = (void *)v158,
          objc_msgSend_logMessageFilter(v169, v159, v160),
          v162 = objc_claimAutoreleasedReturnValue(),
          int v164 = objc_msgSend_evaluateWithObject_(v162, v163, (uint64_t)v155),
          v162,
          v127 = v174,
          v161,
          v164))
    {
      objc_msgSend_requestParsedBlock(v169, v159, v160);
      v165 = (void (**)(void, void))objc_claimAutoreleasedReturnValue();
      ((void (**)(void, void *))v165)[2](v165, v155);
    }
    v122 = v178;
  }
}

- (void)finish
{
  v3 = objc_msgSend_printQueue(self, a2, v2);
  dispatch_sync(v3, &unk_1F2043790);
}

- (id)parserFromConfigurationMessage:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc(MEMORY[0x1E4F1C9B8]);
  uint64_t v6 = objc_msgSend_initWithBase64EncodedString_options_(v4, v5, (uint64_t)v3, 0);
  uint64_t v7 = (void *)MEMORY[0x1E4F28DC0];
  uint64_t v8 = objc_opt_class();
  v10 = objc_msgSend_unarchivedObjectOfClass_fromData_error_(v7, v9, v8, v6, 0);
  uint64_t v12 = objc_msgSend_substringWithRange_(v10, v11, 0, 1);
  uint64_t v15 = objc_msgSend_integerValue(v12, v13, v14);

  switch(v15)
  {
    case 0:
    case 4:
      objc_msgSend_substringFromIndex_(v10, v16, 2);
      uint64_t v17 = (NSString *)objc_claimAutoreleasedReturnValue();
      id v18 = v17;
      if (v17)
      {
        Class v19 = NSClassFromString(v17);
        v20 = [CKDProtobufResponseBodyParser alloc];
        uint64_t v22 = objc_msgSend_initWithQoS_messageClass_parsingStandaloneMessage_(v20, v21, 25, v19, v15 == 4);
      }
      else
      {
        uint64_t v22 = 0;
      }

      goto LABEL_10;
    case 1:
      uint64_t v23 = CKDJSONResponseBodyParser;
      goto LABEL_7;
    case 2:
      uint64_t v23 = CKDPlistResponseBodyParser;
      goto LABEL_7;
    case 3:
      uint64_t v23 = CKDPlaintextResponseBodyParser;
LABEL_7:
      id v24 = [v23 alloc];
      uint64_t v22 = objc_msgSend_initWithQoS_(v24, v25, 25);
LABEL_10:

      return v22;
    default:
      __assert_rtn("-[CKLStreamTrafficObserver parserFromConfigurationMessage:]", "CKLStreamTrafficObserver.m", 365, "false");
  }
}

- (NSPredicate)logMessageFilter
{
  return self->_logMessageFilter;
}

- (void)setLogMessageFilter:(id)a3
{
}

- (id)requestParsedBlock
{
  return self->_requestParsedBlock;
}

- (void)setRequestParsedBlock:(id)a3
{
}

- (NSMutableDictionary)requestDictionary
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 56, 1);
}

- (void)setRequestDictionary:(id)a3
{
}

- (OS_dispatch_queue)printQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 64, 1);
}

- (void)setPrintQueue:(id)a3
{
}

- (CKDTrafficLogParser)parser
{
  return (CKDTrafficLogParser *)objc_getProperty(self, a2, 72, 1);
}

- (void)setParser:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parser, 0);
  objc_storeStrong((id *)&self->_printQueue, 0);
  objc_storeStrong((id *)&self->_requestDictionary, 0);
  objc_storeStrong(&self->_requestParsedBlock, 0);
  objc_storeStrong((id *)&self->_logMessageFilter, 0);
}

@end
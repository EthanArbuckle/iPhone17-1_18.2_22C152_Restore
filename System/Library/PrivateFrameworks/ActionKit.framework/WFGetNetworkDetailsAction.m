@interface WFGetNetworkDetailsAction
- (id)outputContentClasses;
- (void)runAsynchronouslyWithInput:(id)a3;
@end

@implementation WFGetNetworkDetailsAction

- (id)outputContentClasses
{
  v26[1] = *MEMORY[0x263EF8340];
  v3 = [(WFGetNetworkDetailsAction *)self parameterStateForKey:@"WFNetworkDetailsNetwork"];
  v4 = [v3 value];
  if ([v4 isEqualToString:@"Wi-Fi"])
  {
    v5 = [(WFGetNetworkDetailsAction *)self parameterStateForKey:@"WFWiFiDetail"];
    v6 = [v5 value];
    if (([v6 isEqualToString:@"TX Rate"] & 1) != 0
      || ([v6 isEqualToString:@"RX Rate"] & 1) != 0
      || ([v6 isEqualToString:@"RSSI"] & 1) != 0
      || ([v6 isEqualToString:@"Noise"] & 1) != 0
      || [v6 isEqualToString:@"Channel Number"])
    {
      v26[0] = objc_opt_class();
      v7 = v26;
    }
    else
    {
      uint64_t v25 = objc_opt_class();
      v7 = &v25;
    }
    v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:1];

    goto LABEL_23;
  }
  if ([v4 isEqualToString:@"Cellular"])
  {
    v5 = [(WFGetNetworkDetailsAction *)self parameterStateForKey:@"WFCellularDetail"];
    v9 = [v5 value];
    if ([v9 isEqualToString:@"Is Roaming Abroad"])
    {
      uint64_t v24 = objc_opt_class();
      v10 = (void *)MEMORY[0x263EFF8C0];
      v11 = &v24;
    }
    else if ([v9 isEqualToString:@"Number of Signal Bars"])
    {
      uint64_t v23 = objc_opt_class();
      v10 = (void *)MEMORY[0x263EFF8C0];
      v11 = &v23;
    }
    else
    {
      if (([v9 isEqualToString:@"Carrier Name"] & 1) == 0
        && ([v9 isEqualToString:@"Country Code"] & 1) == 0
        && ![v9 isEqualToString:@"Radio Technology"])
      {
        v15 = getWFActionsLogObject();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 136315394;
          v19 = "-[WFGetNetworkDetailsAction outputContentClasses]";
          __int16 v20 = 2112;
          v21 = v9;
          _os_log_impl(&dword_23C364000, v15, OS_LOG_TYPE_FAULT, "%s Unexpected cellularSubject: %@", buf, 0x16u);
        }

        v17.receiver = self;
        v17.super_class = (Class)WFGetNetworkDetailsAction;
        uint64_t v13 = [(WFGetNetworkDetailsAction *)&v17 outputContentClasses];
        goto LABEL_22;
      }
      uint64_t v22 = objc_opt_class();
      v10 = (void *)MEMORY[0x263EFF8C0];
      v11 = &v22;
    }
    uint64_t v13 = [v10 arrayWithObjects:v11 count:1];
LABEL_22:
    v8 = (void *)v13;

LABEL_23:
    goto LABEL_24;
  }
  v12 = getWFActionsLogObject();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 136315394;
    v19 = "-[WFGetNetworkDetailsAction outputContentClasses]";
    __int16 v20 = 2112;
    v21 = v4;
    _os_log_impl(&dword_23C364000, v12, OS_LOG_TYPE_FAULT, "%s Unexpected subject: %@", buf, 0x16u);
  }

  v16.receiver = self;
  v16.super_class = (Class)WFGetNetworkDetailsAction;
  v8 = [(WFGetNetworkDetailsAction *)&v16 outputContentClasses];
LABEL_24:

  return v8;
}

- (void)runAsynchronouslyWithInput:(id)a3
{
  uint64_t v189 = *MEMORY[0x263EF8340];
  id v117 = a3;
  v136 = self;
  v118 = [(WFGetNetworkDetailsAction *)self parameterValueForKey:@"WFNetworkDetailsNetwork" ofClass:objc_opt_class()];
  if (![v118 isEqualToString:@"Wi-Fi"])
  {
    if (![v118 isEqualToString:@"Cellular"]) {
      goto LABEL_87;
    }
    id v163 = 0;
    v164 = &v163;
    uint64_t v165 = 0x2050000000;
    id v5 = (id)getCTTelephonyNetworkInfoClass_softClass;
    uint64_t v166 = getCTTelephonyNetworkInfoClass_softClass;
    if (!getCTTelephonyNetworkInfoClass_softClass)
    {
      v176 = (__CFString *)MEMORY[0x263EF8330];
      uint64_t v177 = 3221225472;
      v178 = (__CFString *)__getCTTelephonyNetworkInfoClass_block_invoke;
      v179 = (__CFString *)&unk_264E5EC88;
      v180 = (__CFString *)&v163;
      __getCTTelephonyNetworkInfoClass_block_invoke((uint64_t)&v176);
      id v5 = v164[3];
    }
    v6 = (objc_class *)v5;
    _Block_object_dispose(&v163, 8);
    id v120 = objc_alloc_init(v6);
    id v163 = 0;
    v164 = &v163;
    uint64_t v165 = 0x2050000000;
    id v7 = (id)getCoreTelephonyClientClass_softClass;
    uint64_t v166 = getCoreTelephonyClientClass_softClass;
    if (!getCoreTelephonyClientClass_softClass)
    {
      v176 = (__CFString *)MEMORY[0x263EF8330];
      uint64_t v177 = 3221225472;
      v178 = (__CFString *)__getCoreTelephonyClientClass_block_invoke;
      v179 = (__CFString *)&unk_264E5EC88;
      v180 = (__CFString *)&v163;
      __getCoreTelephonyClientClass_block_invoke((uint64_t)&v176);
      id v7 = v164[3];
    }
    v8 = (objc_class *)v7;
    _Block_object_dispose(&v163, 8);
    id v9 = [v8 alloc];
    v135 = (void *)[v9 initWithQueue:MEMORY[0x263EF83A0]];
    id v149 = 0;
    v10 = [v135 getActiveContexts:&v149];
    id v11 = v149;
    v12 = [v10 subscriptions];
    uint64_t v13 = objc_msgSend(v12, "if_map:", &__block_literal_global_5843);

    long long v147 = 0u;
    long long v148 = 0u;
    long long v145 = 0u;
    long long v146 = 0u;
    id obj = v13;
    uint64_t v134 = [obj countByEnumeratingWithState:&v145 objects:v162 count:16];
    if (!v134)
    {
LABEL_86:

      [(WFGetNetworkDetailsAction *)v136 finishRunningWithError:v11];
      goto LABEL_87;
    }
    uint64_t v133 = *(void *)v146;
LABEL_10:
    uint64_t v14 = 0;
    while (1)
    {
      if (*(void *)v146 != v133) {
        objc_enumerationMutation(obj);
      }
      uint64_t v15 = *(void *)(*((void *)&v145 + 1) + 8 * v14);
      id v144 = v11;
      objc_super v16 = [v135 getLocalizedOperatorName:v15 error:&v144];
      id v17 = v144;

      v18 = [(WFGetNetworkDetailsAction *)v136 parameterValueForKey:@"WFCellularDetail" ofClass:objc_opt_class()];
      v137 = (void *)[objc_alloc(MEMORY[0x263F33760]) initWithDisplayedCarrierName:v16];
      if ([v18 isEqualToString:@"Carrier Name"])
      {
        id v19 = v16;
        if (!v19) {
          goto LABEL_70;
        }
        goto LABEL_69;
      }
      if (![v18 isEqualToString:@"Radio Technology"]) {
        break;
      }
      __int16 v20 = [getCTServiceDescriptorClass() descriptorWithSubscriptionContext:v15];
      v132 = [v20 identifier];

      v21 = [v120 serviceCurrentRadioAccessTechnology];
      v131 = [v21 objectForKeyedSubscript:v132];

      if (v131)
      {
        id v129 = v131;
        id v163 = 0;
        v164 = &v163;
        uint64_t v165 = 0x2020000000;
        uint64_t v22 = (id *)getCTRadioAccessTechnologyGPRSSymbolLoc_ptr;
        uint64_t v166 = getCTRadioAccessTechnologyGPRSSymbolLoc_ptr;
        if (!getCTRadioAccessTechnologyGPRSSymbolLoc_ptr)
        {
          v176 = (__CFString *)MEMORY[0x263EF8330];
          uint64_t v177 = 3221225472;
          v178 = (__CFString *)__getCTRadioAccessTechnologyGPRSSymbolLoc_block_invoke;
          v179 = (__CFString *)&unk_264E5EC88;
          v180 = (__CFString *)&v163;
          uint64_t v23 = CoreTelephonyLibrary();
          uint64_t v24 = dlsym(v23, "CTRadioAccessTechnologyGPRS");
          *(void *)(v180->info + 24) = v24;
          getCTRadioAccessTechnologyGPRSSymbolLoc_ptr = *(void *)(v180->info + 24);
          uint64_t v22 = (id *)v164[3];
        }
        _Block_object_dispose(&v163, 8);
        if (!v22)
        {
          v91 = [MEMORY[0x263F08690] currentHandler];
          v92 = [NSString stringWithUTF8String:"NSString *getCTRadioAccessTechnologyGPRS(void)"];
          objc_msgSend(v91, "handleFailureInFunction:file:lineNumber:description:", v92, @"WFGetNetworkDetailsAction.m", 28, @"%s", dlerror(), v117);

          goto LABEL_101;
        }
        id v25 = *v22;
        id v163 = v25;
        v176 = @"GPRS";
        uint64_t v157 = 0;
        v158 = &v157;
        uint64_t v159 = 0x2020000000;
        v26 = (id *)getCTRadioAccessTechnologyEdgeSymbolLoc_ptr;
        uint64_t v160 = getCTRadioAccessTechnologyEdgeSymbolLoc_ptr;
        if (!getCTRadioAccessTechnologyEdgeSymbolLoc_ptr)
        {
          uint64_t v152 = MEMORY[0x263EF8330];
          uint64_t v153 = 3221225472;
          v154 = __getCTRadioAccessTechnologyEdgeSymbolLoc_block_invoke;
          v155 = &unk_264E5EC88;
          v156 = &v157;
          v27 = CoreTelephonyLibrary();
          v28 = dlsym(v27, "CTRadioAccessTechnologyEdge");
          *(void *)(v156[1] + 24) = v28;
          getCTRadioAccessTechnologyEdgeSymbolLoc_ptr = *(void *)(v156[1] + 24);
          v26 = (id *)v158[3];
        }
        _Block_object_dispose(&v157, 8);
        if (!v26)
        {
          v93 = [MEMORY[0x263F08690] currentHandler];
          v94 = [NSString stringWithUTF8String:"NSString *getCTRadioAccessTechnologyEdge(void)"];
          objc_msgSend(v93, "handleFailureInFunction:file:lineNumber:description:", v94, @"WFGetNetworkDetailsAction.m", 29, @"%s", dlerror(), v117);

          goto LABEL_101;
        }
        v128 = (id *)*v26;
        v164 = v128;
        uint64_t v177 = @"Edge";
        uint64_t v157 = 0;
        v158 = &v157;
        uint64_t v159 = 0x2020000000;
        v29 = (id *)getCTRadioAccessTechnologyWCDMASymbolLoc_ptr;
        uint64_t v160 = getCTRadioAccessTechnologyWCDMASymbolLoc_ptr;
        if (!getCTRadioAccessTechnologyWCDMASymbolLoc_ptr)
        {
          uint64_t v152 = MEMORY[0x263EF8330];
          uint64_t v153 = 3221225472;
          v154 = __getCTRadioAccessTechnologyWCDMASymbolLoc_block_invoke;
          v155 = &unk_264E5EC88;
          v156 = &v157;
          v30 = CoreTelephonyLibrary();
          v31 = dlsym(v30, "CTRadioAccessTechnologyWCDMA");
          *(void *)(v156[1] + 24) = v31;
          getCTRadioAccessTechnologyWCDMASymbolLoc_ptr = *(void *)(v156[1] + 24);
          v29 = (id *)v158[3];
        }
        _Block_object_dispose(&v157, 8);
        if (!v29)
        {
          v95 = [MEMORY[0x263F08690] currentHandler];
          v96 = [NSString stringWithUTF8String:"NSString *getCTRadioAccessTechnologyWCDMA(void)"];
          objc_msgSend(v95, "handleFailureInFunction:file:lineNumber:description:", v96, @"WFGetNetworkDetailsAction.m", 30, @"%s", dlerror(), v117);

          goto LABEL_101;
        }
        id v127 = *v29;
        uint64_t v165 = (uint64_t)v127;
        v178 = @"WCDMA";
        uint64_t v157 = 0;
        v158 = &v157;
        uint64_t v159 = 0x2020000000;
        v32 = (id *)getCTRadioAccessTechnologyHSDPASymbolLoc_ptr;
        uint64_t v160 = getCTRadioAccessTechnologyHSDPASymbolLoc_ptr;
        if (!getCTRadioAccessTechnologyHSDPASymbolLoc_ptr)
        {
          uint64_t v152 = MEMORY[0x263EF8330];
          uint64_t v153 = 3221225472;
          v154 = __getCTRadioAccessTechnologyHSDPASymbolLoc_block_invoke;
          v155 = &unk_264E5EC88;
          v156 = &v157;
          v33 = CoreTelephonyLibrary();
          v34 = dlsym(v33, "CTRadioAccessTechnologyHSDPA");
          *(void *)(v156[1] + 24) = v34;
          getCTRadioAccessTechnologyHSDPASymbolLoc_ptr = *(void *)(v156[1] + 24);
          v32 = (id *)v158[3];
        }
        _Block_object_dispose(&v157, 8);
        if (!v32)
        {
          v97 = [MEMORY[0x263F08690] currentHandler];
          v98 = [NSString stringWithUTF8String:"NSString *getCTRadioAccessTechnologyHSDPA(void)"];
          objc_msgSend(v97, "handleFailureInFunction:file:lineNumber:description:", v98, @"WFGetNetworkDetailsAction.m", 31, @"%s", dlerror(), v117);

          goto LABEL_101;
        }
        id v126 = *v32;
        uint64_t v166 = (uint64_t)v126;
        v179 = @"HSDPA";
        uint64_t v157 = 0;
        v158 = &v157;
        uint64_t v159 = 0x2020000000;
        v35 = (id *)getCTRadioAccessTechnologyHSUPASymbolLoc_ptr;
        uint64_t v160 = getCTRadioAccessTechnologyHSUPASymbolLoc_ptr;
        if (!getCTRadioAccessTechnologyHSUPASymbolLoc_ptr)
        {
          uint64_t v152 = MEMORY[0x263EF8330];
          uint64_t v153 = 3221225472;
          v154 = __getCTRadioAccessTechnologyHSUPASymbolLoc_block_invoke;
          v155 = &unk_264E5EC88;
          v156 = &v157;
          v36 = CoreTelephonyLibrary();
          v37 = dlsym(v36, "CTRadioAccessTechnologyHSUPA");
          *(void *)(v156[1] + 24) = v37;
          getCTRadioAccessTechnologyHSUPASymbolLoc_ptr = *(void *)(v156[1] + 24);
          v35 = (id *)v158[3];
        }
        _Block_object_dispose(&v157, 8);
        if (!v35)
        {
          v99 = [MEMORY[0x263F08690] currentHandler];
          v100 = [NSString stringWithUTF8String:"NSString *getCTRadioAccessTechnologyHSUPA(void)"];
          objc_msgSend(v99, "handleFailureInFunction:file:lineNumber:description:", v100, @"WFGetNetworkDetailsAction.m", 32, @"%s", dlerror(), v117);

          goto LABEL_101;
        }
        id v125 = *v35;
        id v167 = v125;
        v180 = @"HSUPA";
        uint64_t v157 = 0;
        v158 = &v157;
        uint64_t v159 = 0x2020000000;
        v38 = (id *)getCTRadioAccessTechnologyCDMA1xSymbolLoc_ptr;
        uint64_t v160 = getCTRadioAccessTechnologyCDMA1xSymbolLoc_ptr;
        if (!getCTRadioAccessTechnologyCDMA1xSymbolLoc_ptr)
        {
          uint64_t v152 = MEMORY[0x263EF8330];
          uint64_t v153 = 3221225472;
          v154 = __getCTRadioAccessTechnologyCDMA1xSymbolLoc_block_invoke;
          v155 = &unk_264E5EC88;
          v156 = &v157;
          v39 = CoreTelephonyLibrary();
          v40 = dlsym(v39, "CTRadioAccessTechnologyCDMA1x");
          *(void *)(v156[1] + 24) = v40;
          getCTRadioAccessTechnologyCDMA1xSymbolLoc_ptr = *(void *)(v156[1] + 24);
          v38 = (id *)v158[3];
        }
        _Block_object_dispose(&v157, 8);
        if (!v38)
        {
          v101 = [MEMORY[0x263F08690] currentHandler];
          v102 = [NSString stringWithUTF8String:"NSString *getCTRadioAccessTechnologyCDMA1x(void)"];
          objc_msgSend(v101, "handleFailureInFunction:file:lineNumber:description:", v102, @"WFGetNetworkDetailsAction.m", 33, @"%s", dlerror(), v117);

          goto LABEL_101;
        }
        id v124 = *v38;
        id v168 = v124;
        v181 = @"CDMA 1x";
        uint64_t v157 = 0;
        v158 = &v157;
        uint64_t v159 = 0x2020000000;
        v41 = (id *)getCTRadioAccessTechnologyCDMAEVDORev0SymbolLoc_ptr;
        uint64_t v160 = getCTRadioAccessTechnologyCDMAEVDORev0SymbolLoc_ptr;
        if (!getCTRadioAccessTechnologyCDMAEVDORev0SymbolLoc_ptr)
        {
          uint64_t v152 = MEMORY[0x263EF8330];
          uint64_t v153 = 3221225472;
          v154 = __getCTRadioAccessTechnologyCDMAEVDORev0SymbolLoc_block_invoke;
          v155 = &unk_264E5EC88;
          v156 = &v157;
          v42 = CoreTelephonyLibrary();
          v43 = dlsym(v42, "CTRadioAccessTechnologyCDMAEVDORev0");
          *(void *)(v156[1] + 24) = v43;
          getCTRadioAccessTechnologyCDMAEVDORev0SymbolLoc_ptr = *(void *)(v156[1] + 24);
          v41 = (id *)v158[3];
        }
        _Block_object_dispose(&v157, 8);
        if (!v41)
        {
          v103 = [MEMORY[0x263F08690] currentHandler];
          v104 = [NSString stringWithUTF8String:"NSString *getCTRadioAccessTechnologyCDMAEVDORev0(void)"];
          objc_msgSend(v103, "handleFailureInFunction:file:lineNumber:description:", v104, @"WFGetNetworkDetailsAction.m", 34, @"%s", dlerror(), v117);

          goto LABEL_101;
        }
        id v123 = *v41;
        id v169 = v123;
        v182 = @"CDMA EV-DO Rev 0";
        uint64_t v157 = 0;
        v158 = &v157;
        uint64_t v159 = 0x2020000000;
        v44 = (id *)getCTRadioAccessTechnologyCDMAEVDORevASymbolLoc_ptr;
        uint64_t v160 = getCTRadioAccessTechnologyCDMAEVDORevASymbolLoc_ptr;
        if (!getCTRadioAccessTechnologyCDMAEVDORevASymbolLoc_ptr)
        {
          uint64_t v152 = MEMORY[0x263EF8330];
          uint64_t v153 = 3221225472;
          v154 = __getCTRadioAccessTechnologyCDMAEVDORevASymbolLoc_block_invoke;
          v155 = &unk_264E5EC88;
          v156 = &v157;
          v45 = CoreTelephonyLibrary();
          v46 = dlsym(v45, "CTRadioAccessTechnologyCDMAEVDORevA");
          *(void *)(v156[1] + 24) = v46;
          getCTRadioAccessTechnologyCDMAEVDORevASymbolLoc_ptr = *(void *)(v156[1] + 24);
          v44 = (id *)v158[3];
        }
        _Block_object_dispose(&v157, 8);
        if (!v44)
        {
          v105 = [MEMORY[0x263F08690] currentHandler];
          v106 = [NSString stringWithUTF8String:"NSString *getCTRadioAccessTechnologyCDMAEVDORevA(void)"];
          objc_msgSend(v105, "handleFailureInFunction:file:lineNumber:description:", v106, @"WFGetNetworkDetailsAction.m", 35, @"%s", dlerror(), v117);

          goto LABEL_101;
        }
        id v122 = *v44;
        id v170 = v122;
        v183 = @"CDMA EV-DO Rev A";
        uint64_t v157 = 0;
        v158 = &v157;
        uint64_t v159 = 0x2020000000;
        v47 = (id *)getCTRadioAccessTechnologyCDMAEVDORevBSymbolLoc_ptr;
        uint64_t v160 = getCTRadioAccessTechnologyCDMAEVDORevBSymbolLoc_ptr;
        if (!getCTRadioAccessTechnologyCDMAEVDORevBSymbolLoc_ptr)
        {
          uint64_t v152 = MEMORY[0x263EF8330];
          uint64_t v153 = 3221225472;
          v154 = __getCTRadioAccessTechnologyCDMAEVDORevBSymbolLoc_block_invoke;
          v155 = &unk_264E5EC88;
          v156 = &v157;
          v48 = CoreTelephonyLibrary();
          v49 = dlsym(v48, "CTRadioAccessTechnologyCDMAEVDORevB");
          *(void *)(v156[1] + 24) = v49;
          getCTRadioAccessTechnologyCDMAEVDORevBSymbolLoc_ptr = *(void *)(v156[1] + 24);
          v47 = (id *)v158[3];
        }
        _Block_object_dispose(&v157, 8);
        if (!v47)
        {
          v107 = [MEMORY[0x263F08690] currentHandler];
          v108 = [NSString stringWithUTF8String:"NSString *getCTRadioAccessTechnologyCDMAEVDORevB(void)"];
          objc_msgSend(v107, "handleFailureInFunction:file:lineNumber:description:", v108, @"WFGetNetworkDetailsAction.m", 36, @"%s", dlerror(), v117);

          goto LABEL_101;
        }
        id v50 = *v47;
        id v171 = v50;
        v184 = @"CDMA EV-DO Rev B";
        uint64_t v157 = 0;
        v158 = &v157;
        uint64_t v159 = 0x2020000000;
        v51 = (id *)getCTRadioAccessTechnologyeHRPDSymbolLoc_ptr;
        uint64_t v160 = getCTRadioAccessTechnologyeHRPDSymbolLoc_ptr;
        if (!getCTRadioAccessTechnologyeHRPDSymbolLoc_ptr)
        {
          uint64_t v152 = MEMORY[0x263EF8330];
          uint64_t v153 = 3221225472;
          v154 = __getCTRadioAccessTechnologyeHRPDSymbolLoc_block_invoke;
          v155 = &unk_264E5EC88;
          v156 = &v157;
          v52 = CoreTelephonyLibrary();
          v53 = dlsym(v52, "CTRadioAccessTechnologyeHRPD");
          *(void *)(v156[1] + 24) = v53;
          getCTRadioAccessTechnologyeHRPDSymbolLoc_ptr = *(void *)(v156[1] + 24);
          v51 = (id *)v158[3];
        }
        _Block_object_dispose(&v157, 8);
        if (!v51)
        {
          v109 = [MEMORY[0x263F08690] currentHandler];
          v110 = [NSString stringWithUTF8String:"NSString *getCTRadioAccessTechnologyeHRPD(void)"];
          objc_msgSend(v109, "handleFailureInFunction:file:lineNumber:description:", v110, @"WFGetNetworkDetailsAction.m", 37, @"%s", dlerror(), v117);

          goto LABEL_101;
        }
        id v54 = *v51;
        id v172 = v54;
        v185 = @"HRPD";
        uint64_t v157 = 0;
        v158 = &v157;
        uint64_t v159 = 0x2020000000;
        v55 = (id *)getCTRadioAccessTechnologyLTESymbolLoc_ptr;
        uint64_t v160 = getCTRadioAccessTechnologyLTESymbolLoc_ptr;
        if (!getCTRadioAccessTechnologyLTESymbolLoc_ptr)
        {
          uint64_t v152 = MEMORY[0x263EF8330];
          uint64_t v153 = 3221225472;
          v154 = __getCTRadioAccessTechnologyLTESymbolLoc_block_invoke;
          v155 = &unk_264E5EC88;
          v156 = &v157;
          v56 = CoreTelephonyLibrary();
          v57 = dlsym(v56, "CTRadioAccessTechnologyLTE");
          *(void *)(v156[1] + 24) = v57;
          getCTRadioAccessTechnologyLTESymbolLoc_ptr = *(void *)(v156[1] + 24);
          v55 = (id *)v158[3];
        }
        _Block_object_dispose(&v157, 8);
        if (!v55)
        {
          v111 = [MEMORY[0x263F08690] currentHandler];
          v112 = [NSString stringWithUTF8String:"NSString *getCTRadioAccessTechnologyLTE(void)"];
          objc_msgSend(v111, "handleFailureInFunction:file:lineNumber:description:", v112, @"WFGetNetworkDetailsAction.m", 38, @"%s", dlerror(), v117);

          goto LABEL_101;
        }
        id v58 = *v55;
        id v173 = v58;
        v186 = @"LTE";
        uint64_t v157 = 0;
        v158 = &v157;
        uint64_t v159 = 0x2020000000;
        v59 = (id *)getCTRadioAccessTechnologyNRNSASymbolLoc_ptr;
        uint64_t v160 = getCTRadioAccessTechnologyNRNSASymbolLoc_ptr;
        if (!getCTRadioAccessTechnologyNRNSASymbolLoc_ptr)
        {
          uint64_t v152 = MEMORY[0x263EF8330];
          uint64_t v153 = 3221225472;
          v154 = __getCTRadioAccessTechnologyNRNSASymbolLoc_block_invoke;
          v155 = &unk_264E5EC88;
          v156 = &v157;
          v60 = CoreTelephonyLibrary();
          v61 = dlsym(v60, "CTRadioAccessTechnologyNRNSA");
          *(void *)(v156[1] + 24) = v61;
          getCTRadioAccessTechnologyNRNSASymbolLoc_ptr = *(void *)(v156[1] + 24);
          v59 = (id *)v158[3];
        }
        _Block_object_dispose(&v157, 8);
        if (!v59)
        {
          v113 = [MEMORY[0x263F08690] currentHandler];
          v114 = [NSString stringWithUTF8String:"NSString *getCTRadioAccessTechnologyNRNSA(void)"];
          objc_msgSend(v113, "handleFailureInFunction:file:lineNumber:description:", v114, @"WFGetNetworkDetailsAction.m", 39, @"%s", dlerror(), v117);

          goto LABEL_101;
        }
        v121 = v25;
        id v62 = *v59;
        id v174 = v62;
        v187 = @"5G NR NSA";
        uint64_t v157 = 0;
        v158 = &v157;
        uint64_t v159 = 0x2020000000;
        v63 = (id *)getCTRadioAccessTechnologyNRSymbolLoc_ptr;
        uint64_t v160 = getCTRadioAccessTechnologyNRSymbolLoc_ptr;
        if (!getCTRadioAccessTechnologyNRSymbolLoc_ptr)
        {
          uint64_t v152 = MEMORY[0x263EF8330];
          uint64_t v153 = 3221225472;
          v154 = __getCTRadioAccessTechnologyNRSymbolLoc_block_invoke;
          v155 = &unk_264E5EC88;
          v156 = &v157;
          v64 = CoreTelephonyLibrary();
          v65 = dlsym(v64, "CTRadioAccessTechnologyNR");
          *(void *)(v156[1] + 24) = v65;
          getCTRadioAccessTechnologyNRSymbolLoc_ptr = *(void *)(v156[1] + 24);
          v63 = (id *)v158[3];
        }
        _Block_object_dispose(&v157, 8);
        if (!v63)
        {
          v115 = [MEMORY[0x263F08690] currentHandler];
          v116 = [NSString stringWithUTF8String:"NSString *getCTRadioAccessTechnologyNR(void)"];
          objc_msgSend(v115, "handleFailureInFunction:file:lineNumber:description:", v116, @"WFGetNetworkDetailsAction.m", 40, @"%s", dlerror(), v117);

LABEL_101:
          __break(1u);
        }
        id v175 = *v63;
        v188 = @"5G NR";
        v66 = NSDictionary;
        id v67 = v175;
        v68 = [v66 dictionaryWithObjects:&v176 forKeys:&v163 count:13];

        id v19 = [v68 objectForKeyedSubscript:v129];
        if (!v19)
        {
          id v19 = [v129 stringByReplacingOccurrencesOfString:@"CTRadioAccessTechnology" withString:&stru_26F008428];
        }
      }
      else
      {
        id v19 = 0;
      }

LABEL_68:
      if (v19) {
        goto LABEL_69;
      }
LABEL_70:
      id v11 = v17;

      if (v134 == ++v14)
      {
        uint64_t v90 = [obj countByEnumeratingWithState:&v145 objects:v162 count:16];
        uint64_t v134 = v90;
        if (!v90) {
          goto LABEL_86;
        }
        goto LABEL_10;
      }
    }
    if ([v18 isEqualToString:@"Country Code"])
    {
      id v143 = v17;
      v69 = (void *)[v135 copyMobileCountryCode:v15 error:&v143];
      id v70 = v143;

      if (v69)
      {
        id v142 = v70;
        v71 = (void *)[v135 copyMobileSubscriberIsoCountryCode:v69 error:&v142];
        id v72 = v142;

        id v19 = [v71 uppercaseString];

        id v70 = v72;
      }
      else
      {
        id v19 = 0;
      }

LABEL_80:
      id v17 = v70;
      if (!v19) {
        goto LABEL_70;
      }
LABEL_69:
      v78 = (void *)MEMORY[0x263F337D0];
      v79 = [MEMORY[0x263F337E8] networkLocation];
      v161 = v137;
      v80 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v161 count:1];
      v81 = [v78 configurationWithOrigin:v79 disclosureLevel:1 disclosureWarnings:v80];

      v82 = [MEMORY[0x263F337C8] itemWithObject:v19 privacyConfiguration:v81];
      v83 = [(WFGetNetworkDetailsAction *)v136 output];
      [v83 addItem:v82];

      goto LABEL_70;
    }
    if ([v18 isEqualToString:@"Is Roaming Abroad"])
    {
      id v141 = v17;
      v73 = (void *)[v135 copyServingPlmn:v15 error:&v141];
      id v70 = v141;

      if ([v73 BOOLValue])
      {
        id v140 = v70;
        v74 = (void *)[v135 copyIsInHomeCountry:v15 error:&v140];
        id v75 = v140;

        int v76 = [v74 BOOLValue];
        uint64_t v77 = v76 ^ 1u;
        id v70 = v75;
      }
      else
      {
        uint64_t v77 = 0;
      }

      id v19 = [NSNumber numberWithBool:v77];
      goto LABEL_80;
    }
    if (![v18 isEqualToString:@"Number of Signal Bars"]) {
      goto LABEL_70;
    }
    v84 = [getCTServiceDescriptorClass() descriptorWithSubscriptionContext:v15];
    id v139 = v17;
    v85 = [v135 getPublicSignalStrength:v84 error:&v139];
    id v86 = v139;

    if (v85)
    {
      id v138 = v86;
      v87 = (void *)[v135 copyServingPlmn:v15 error:&v138];
      id v17 = v138;

      int v88 = [v87 BOOLValue];
      if (v88)
      {
        uint64_t v89 = [v85 displayBars];
LABEL_84:
        id v19 = (id)v89;

        goto LABEL_68;
      }
    }
    else
    {
      id v17 = v86;
    }
    uint64_t v89 = [NSNumber numberWithUnsignedInt:0];
    goto LABEL_84;
  }
  v4 = [(WFGetNetworkDetailsAction *)self parameterValueForKey:@"WFWiFiDetail" ofClass:objc_opt_class()];
  v150[0] = MEMORY[0x263EF8330];
  v150[1] = 3221225472;
  v150[2] = __56__WFGetNetworkDetailsAction_runAsynchronouslyWithInput___block_invoke;
  v150[3] = &unk_264E56718;
  v150[4] = self;
  id v151 = v4;
  id v119 = v4;
  +[WFWiFiSettingsClient createClientWithCompletionHandler:v150];

LABEL_87:
}

void __56__WFGetNetworkDetailsAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v5 = a2;
  v6 = v5;
  if (v5)
  {
    id v7 = v5;
    if ([*(id *)(a1 + 40) isEqualToString:@"Network Name"])
    {
      v8 = [v7 networkName];
      id v9 = objc_alloc(MEMORY[0x263F33968]);
      v10 = [v7 networkName];
      id v11 = (void *)[v9 initWithDisplayedNetworkName:v10];

      if (!v8) {
        goto LABEL_23;
      }
      goto LABEL_20;
    }
    if ([*(id *)(a1 + 40) isEqualToString:@"BSSID"])
    {
      v8 = [v7 BSSID];
      uint64_t v12 = objc_opt_new();
      goto LABEL_8;
    }
    if ([*(id *)(a1 + 40) isEqualToString:@"TX Rate"])
    {
      uint64_t v13 = [v7 txRate];
    }
    else if ([*(id *)(a1 + 40) isEqualToString:@"RX Rate"])
    {
      uint64_t v13 = [v7 rxRate];
    }
    else if ([*(id *)(a1 + 40) isEqualToString:@"RSSI"])
    {
      uint64_t v13 = [v7 RSSI];
    }
    else if ([*(id *)(a1 + 40) isEqualToString:@"Noise"])
    {
      uint64_t v13 = [v7 noise];
    }
    else
    {
      if ([*(id *)(a1 + 40) isEqualToString:@"Hardware MAC Address"])
      {
        v8 = [v7 hardwareMACAddress];
        v21 = [v7 hardwareMACAddress];
        uint64_t v22 = [v21 length];

        if (v22)
        {
          uint64_t v12 = [objc_alloc(MEMORY[0x263F338D0]) initWithDisplayedMACAddress:v8];
LABEL_8:
          id v11 = (void *)v12;
          if (!v8) {
            goto LABEL_23;
          }
          goto LABEL_20;
        }
LABEL_19:
        id v11 = 0;
        if (!v8)
        {
LABEL_23:
          [*(id *)(a1 + 32) finishRunningWithError:0];

          goto LABEL_24;
        }
LABEL_20:
        uint64_t v14 = [MEMORY[0x263EFF980] arrayWithCapacity:1];
        uint64_t v15 = v14;
        if (v11) {
          [v14 addObject:v11];
        }
        objc_super v16 = (void *)MEMORY[0x263F337D0];
        id v17 = [MEMORY[0x263F337E8] networkLocation];
        v18 = [v16 configurationWithOrigin:v17 disclosureLevel:1 disclosureWarnings:v15];

        id v19 = [MEMORY[0x263F337C8] itemWithObject:v8 privacyConfiguration:v18];
        __int16 v20 = [*(id *)(a1 + 32) output];
        [v20 addItem:v19];

        goto LABEL_23;
      }
      if ([*(id *)(a1 + 40) isEqualToString:@"Channel Number"])
      {
        uint64_t v13 = [v7 channel];
      }
      else
      {
        if (![*(id *)(a1 + 40) isEqualToString:@"Wi-Fi Standard"])
        {
          uint64_t v23 = getWFWorkflowExecutionLogObject();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
          {
            uint64_t v24 = *(void *)(a1 + 40);
            int v25 = 136315394;
            v26 = "-[WFGetNetworkDetailsAction runAsynchronouslyWithInput:]_block_invoke";
            __int16 v27 = 2112;
            uint64_t v28 = v24;
            _os_log_impl(&dword_23C364000, v23, OS_LOG_TYPE_FAULT, "%s Unexpected WFWiFiDetailKey %@ in WFGetNetworkDetailsAction", (uint8_t *)&v25, 0x16u);
          }

          v8 = 0;
          id v11 = 0;
          goto LABEL_23;
        }
        uint64_t v13 = [v7 wifiStandard];
      }
    }
    v8 = (void *)v13;
    goto LABEL_19;
  }
  [*(id *)(a1 + 32) finishRunningWithError:a3];
LABEL_24:
}

uint64_t __56__WFGetNetworkDetailsAction_runAsynchronouslyWithInput___block_invoke_229(uint64_t a1, void *a2)
{
  return [a2 context];
}

@end
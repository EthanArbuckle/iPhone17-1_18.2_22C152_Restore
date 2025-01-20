@interface CWFIO80211
- (BOOL)isMonitoringEvents;
- (CWFIO80211)init;
- (id)IO80211ControllerInfo;
- (id)IO80211InterfaceInfo:(id)a3 error:(id *)a4;
- (id)__IO80211InfoMatchingService:(unsigned int)a3;
- (id)eventHandler;
- (void)dealloc;
- (void)setEventHandler:(id)a3;
- (void)startEventMonitoring;
- (void)stopEventMonitoring;
@end

@implementation CWFIO80211

- (CWFIO80211)init
{
  kern_return_t v11;
  kern_return_t v12;
  IONotificationPortRef v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSMutableDictionary *publishIO80211VirtualInterfaceMap;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  NSMutableDictionary *terminatedIO80211VirtualInterfaceMap;
  kern_return_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  kern_return_t v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  kern_return_t v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  kern_return_t v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  const char *v64;
  uint64_t v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  kern_return_t v71;
  __uint64_t v72;
  void *v73;
  NSObject *v74;
  kern_return_t v75;
  __uint64_t v76;
  void *v77;
  kern_return_t v78;
  __uint64_t v79;
  void *v80;
  __uint64_t v81;
  void *v82;
  NSObject *v83;
  kern_return_t v84;
  __uint64_t v85;
  void *v86;
  NSObject *v87;
  __uint64_t v88;
  void *v89;
  kern_return_t v90;
  __uint64_t v91;
  void *v92;
  __uint64_t v93;
  void *v94;
  kern_return_t v95;
  __uint64_t v96;
  void *v97;
  __uint64_t v98;
  void *v99;
  id v100;
  id v101;
  id v102;
  id v103;
  id v104;
  id v105;
  id v106;
  id v107;
  id v108;
  id v109;
  mach_port_t v110;
  mach_port_t mainPort;
  objc_super v112;
  io_iterator_t notification;
  int v114;
  unint64_t v115;
  __int16 v116;
  unint64_t v117;
  __int16 v118;
  const char *v119;
  __int16 v120;
  const char *v121;
  __int16 v122;
  int v123;
  __int16 v124;
  unsigned char v125[24];
  uint64_t v126;

  v126 = *MEMORY[0x1E4F143B8];
  notification = 0;
  v112.receiver = self;
  v112.super_class = (Class)CWFIO80211;
  v2 = [(CWFIO80211 *)&v112 init];
  if (!v2) {
    goto LABEL_79;
  }
  v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v4 = dispatch_queue_create("com.apple.corewifi.io80211-mutex", v3);
  mutexQueue = v2->_mutexQueue;
  v2->_mutexQueue = (OS_dispatch_queue *)v4;

  if (!v2->_mutexQueue) {
    goto LABEL_79;
  }
  v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v7 = dispatch_queue_create("com.apple.corewifi.io80211-event", v6);
  eventQueue = v2->_eventQueue;
  v2->_eventQueue = (OS_dispatch_queue *)v7;

  if (!v2->_eventQueue) {
    goto LABEL_79;
  }
  mainPort = 0;
  v9 = (unsigned int *)MEMORY[0x1E4F14638];
  if (MEMORY[0x1BA995490](*MEMORY[0x1E4F14638], &mainPort)) {
    goto LABEL_79;
  }
  v10 = IONotificationPortCreate(mainPort);
  v2->_portRef = v10;
  if (!v10) {
    goto LABEL_79;
  }
  v2->_publishIO80211SkywalkInterface = 0;
  v11 = IOServiceAddMatchingNotification(v10, "IOServiceMatched", (CFDictionaryRef)&unk_1F0DC8938, (IOServiceMatchingCallback)sub_1B4F65760, v2, &v2->_publishIO80211SkywalkInterface);
  if (v11)
  {
    v71 = v11;
    v72 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
    v73 = CWFGetOSLog();
    if (v73)
    {
      v74 = CWFGetOSLog();
    }
    else
    {
      v74 = MEMORY[0x1E4F14500];
      v100 = MEMORY[0x1E4F14500];
    }

    if (!os_log_type_enabled(v74, OS_LOG_TYPE_ERROR)) {
      goto LABEL_64;
    }
    v114 = 134219778;
    v115 = v72 / 0x3B9ACA00;
    v116 = 2048;
    v117 = v72 % 0x3B9ACA00 / 0x3E8;
    v118 = 2082;
    v119 = "-[CWFIO80211 init]";
    v120 = 2082;
    v121 = "CWFIO80211.m";
    v122 = 1024;
    v123 = 144;
    v124 = 1024;
    *(_DWORD *)v125 = v71;
    *(_WORD *)&v125[4] = 2112;
    *(void *)&v125[6] = @"IO80211InterfaceRole";
    *(_WORD *)&v125[14] = 2112;
    *(void *)&v125[16] = @"Infrastructure";
    goto LABEL_63;
  }
  v2->_terminatedIO80211SkywalkInterface = 0;
  v12 = IOServiceAddMatchingNotification(v2->_portRef, "IOServiceTerminate", (CFDictionaryRef)&unk_1F0DC8988, (IOServiceMatchingCallback)sub_1B4F6576C, v2, &v2->_terminatedIO80211SkywalkInterface);
  if (v12)
  {
    v75 = v12;
    v76 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
    v77 = CWFGetOSLog();
    if (v77)
    {
      v74 = CWFGetOSLog();
    }
    else
    {
      v74 = MEMORY[0x1E4F14500];
      v101 = MEMORY[0x1E4F14500];
    }

    if (!os_log_type_enabled(v74, OS_LOG_TYPE_ERROR)) {
      goto LABEL_64;
    }
    v114 = 134219778;
    v115 = v76 / 0x3B9ACA00;
    v116 = 2048;
    v117 = v76 % 0x3B9ACA00 / 0x3E8;
    v118 = 2082;
    v119 = "-[CWFIO80211 init]";
    v120 = 2082;
    v121 = "CWFIO80211.m";
    v122 = 1024;
    v123 = 149;
    v124 = 1024;
    *(_DWORD *)v125 = v75;
    *(_WORD *)&v125[4] = 2112;
    *(void *)&v125[6] = @"IO80211InterfaceRole";
    *(_WORD *)&v125[14] = 2112;
    *(void *)&v125[16] = @"Infrastructure";
    goto LABEL_63;
  }
  sub_1B4F662F4(0, v2->_publishIO80211SkywalkInterface, @"IOServiceMatched");
  sub_1B4F662F4(0, v2->_terminatedIO80211SkywalkInterface, @"IOServiceTerminate");
  v110 = 0;
  if (MEMORY[0x1BA995490](*v9, &v110)) {
    goto LABEL_79;
  }
  v13 = IONotificationPortCreate(v110);
  v2->_portRefVirtual = v13;
  if (!v13) {
    goto LABEL_79;
  }
  v18 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v14, v15, v16, v17);
  publishIO80211VirtualInterfaceMap = v2->_publishIO80211VirtualInterfaceMap;
  v2->_publishIO80211VirtualInterfaceMap = (NSMutableDictionary *)v18;

  if (!v2->_publishIO80211VirtualInterfaceMap) {
    goto LABEL_79;
  }
  v24 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v20, v21, v22, v23);
  terminatedIO80211VirtualInterfaceMap = v2->_terminatedIO80211VirtualInterfaceMap;
  v2->_terminatedIO80211VirtualInterfaceMap = (NSMutableDictionary *)v24;

  if (!v2->_terminatedIO80211VirtualInterfaceMap) {
    goto LABEL_79;
  }
  notification = 0;
  v26 = IOServiceAddMatchingNotification(v2->_portRef, "IOServiceMatched", (CFDictionaryRef)&unk_1F0DC89D8, (IOServiceMatchingCallback)sub_1B4F65778, v2, &notification);
  if (v26)
  {
    v78 = v26;
    v79 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
    v80 = CWFGetOSLog();
    if (v80)
    {
      v74 = CWFGetOSLog();
    }
    else
    {
      v74 = MEMORY[0x1E4F14500];
      v102 = MEMORY[0x1E4F14500];
    }

    if (!os_log_type_enabled(v74, OS_LOG_TYPE_ERROR)) {
      goto LABEL_64;
    }
    v114 = 134219778;
    v115 = v79 / 0x3B9ACA00;
    v116 = 2048;
    v117 = v79 % 0x3B9ACA00 / 0x3E8;
    v118 = 2082;
    v119 = "-[CWFIO80211 init]";
    v120 = 2082;
    v121 = "CWFIO80211.m";
    v122 = 1024;
    v123 = 173;
    v124 = 1024;
    *(_DWORD *)v125 = v78;
    *(_WORD *)&v125[4] = 2112;
    *(void *)&v125[6] = @"IO80211VirtualInterfaceRole";
    *(_WORD *)&v125[14] = 2112;
    *(void *)&v125[16] = @"WiFi-Aware Data";
    goto LABEL_63;
  }
  v30 = objc_msgSend_valueWithPointer_(MEMORY[0x1E4F29238], v27, notification, v28, v29);
  objc_msgSend_setObject_forKeyedSubscript_(v2->_publishIO80211VirtualInterfaceMap, v31, (uint64_t)v30, @"WiFi-Aware Data", v32);

  v36 = objc_msgSend_objectForKeyedSubscript_(v2->_publishIO80211VirtualInterfaceMap, v33, @"WiFi-Aware Data", v34, v35);

  if (!v36)
  {
    v81 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
    v82 = CWFGetOSLog();
    if (v82)
    {
      v83 = CWFGetOSLog();
    }
    else
    {
      v83 = MEMORY[0x1E4F14500];
      v103 = MEMORY[0x1E4F14500];
    }

    if (!os_log_type_enabled(v83, OS_LOG_TYPE_ERROR)) {
      goto LABEL_77;
    }
    v114 = 134219522;
    v115 = v81 / 0x3B9ACA00;
    v116 = 2048;
    v117 = v81 % 0x3B9ACA00 / 0x3E8;
    v118 = 2082;
    v119 = "-[CWFIO80211 init]";
    v120 = 2082;
    v121 = "CWFIO80211.m";
    v122 = 1024;
    v123 = 176;
    v124 = 2112;
    *(void *)v125 = @"IO80211VirtualInterfaceRole";
    *(_WORD *)&v125[8] = 2112;
    *(void *)&v125[10] = @"WiFi-Aware Data";
    goto LABEL_76;
  }
  sub_1B4F662F4(0, notification, @"IOServiceMatched");
  notification = 0;
  v37 = IOServiceAddMatchingNotification(v2->_portRef, "IOServiceTerminate", (CFDictionaryRef)&unk_1F0DC8A28, (IOServiceMatchingCallback)sub_1B4F65784, v2, &notification);
  if (v37)
  {
    v84 = v37;
    v85 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
    v86 = CWFGetOSLog();
    if (v86)
    {
      v87 = CWFGetOSLog();
    }
    else
    {
      v87 = MEMORY[0x1E4F14500];
      v104 = MEMORY[0x1E4F14500];
    }

    if (!os_log_type_enabled(v87, OS_LOG_TYPE_ERROR)) {
      goto LABEL_72;
    }
    v114 = 134219778;
    v115 = v85 / 0x3B9ACA00;
    v116 = 2048;
    v117 = v85 % 0x3B9ACA00 / 0x3E8;
    v118 = 2082;
    v119 = "-[CWFIO80211 init]";
    v120 = 2082;
    v121 = "CWFIO80211.m";
    v122 = 1024;
    v123 = 186;
    v124 = 1024;
    *(_DWORD *)v125 = v84;
    *(_WORD *)&v125[4] = 2112;
    *(void *)&v125[6] = @"IO80211VirtualInterfaceRole";
    *(_WORD *)&v125[14] = 2112;
    *(void *)&v125[16] = @"WiFi-Aware Data";
    goto LABEL_71;
  }
  v41 = objc_msgSend_valueWithPointer_(MEMORY[0x1E4F29238], v38, notification, v39, v40);
  objc_msgSend_setObject_forKeyedSubscript_(v2->_terminatedIO80211VirtualInterfaceMap, v42, (uint64_t)v41, @"WiFi-Aware Data", v43);

  v47 = objc_msgSend_objectForKeyedSubscript_(v2->_terminatedIO80211VirtualInterfaceMap, v44, @"WiFi-Aware Data", v45, v46);

  if (!v47)
  {
    v88 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
    v89 = CWFGetOSLog();
    if (v89)
    {
      v83 = CWFGetOSLog();
    }
    else
    {
      v83 = MEMORY[0x1E4F14500];
      v105 = MEMORY[0x1E4F14500];
    }

    if (!os_log_type_enabled(v83, OS_LOG_TYPE_ERROR)) {
      goto LABEL_77;
    }
    v114 = 134219522;
    v115 = v88 / 0x3B9ACA00;
    v116 = 2048;
    v117 = v88 % 0x3B9ACA00 / 0x3E8;
    v118 = 2082;
    v119 = "-[CWFIO80211 init]";
    v120 = 2082;
    v121 = "CWFIO80211.m";
    v122 = 1024;
    v123 = 189;
    v124 = 2112;
    *(void *)v125 = @"IO80211VirtualInterfaceRole";
    *(_WORD *)&v125[8] = 2112;
    *(void *)&v125[10] = @"WiFi-Aware Data";
    goto LABEL_76;
  }
  sub_1B4F662F4(0, notification, @"IOServiceMatched");
  notification = 0;
  v48 = IOServiceAddMatchingNotification(v2->_portRef, "IOServiceMatched", (CFDictionaryRef)&unk_1F0DC8A78, (IOServiceMatchingCallback)sub_1B4F65778, v2, &notification);
  if (v48)
  {
    v90 = v48;
    v91 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
    v92 = CWFGetOSLog();
    if (v92)
    {
      v74 = CWFGetOSLog();
    }
    else
    {
      v74 = MEMORY[0x1E4F14500];
      v106 = MEMORY[0x1E4F14500];
    }

    if (!os_log_type_enabled(v74, OS_LOG_TYPE_ERROR)) {
      goto LABEL_64;
    }
    v114 = 134219778;
    v115 = v91 / 0x3B9ACA00;
    v116 = 2048;
    v117 = v91 % 0x3B9ACA00 / 0x3E8;
    v118 = 2082;
    v119 = "-[CWFIO80211 init]";
    v120 = 2082;
    v121 = "CWFIO80211.m";
    v122 = 1024;
    v123 = 200;
    v124 = 1024;
    *(_DWORD *)v125 = v90;
    *(_WORD *)&v125[4] = 2112;
    *(void *)&v125[6] = @"IO80211VirtualInterfaceRole";
    *(_WORD *)&v125[14] = 2112;
    *(void *)&v125[16] = @"SoftAP";
LABEL_63:
    _os_log_send_and_compose_impl();
LABEL_64:

LABEL_79:
    return 0;
  }
  v52 = objc_msgSend_valueWithPointer_(MEMORY[0x1E4F29238], v49, notification, v50, v51);
  objc_msgSend_setObject_forKeyedSubscript_(v2->_publishIO80211VirtualInterfaceMap, v53, (uint64_t)v52, @"SoftAP", v54);

  v58 = objc_msgSend_objectForKeyedSubscript_(v2->_publishIO80211VirtualInterfaceMap, v55, @"SoftAP", v56, v57);

  if (!v58)
  {
    v93 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
    v94 = CWFGetOSLog();
    if (v94)
    {
      v83 = CWFGetOSLog();
    }
    else
    {
      v83 = MEMORY[0x1E4F14500];
      v107 = MEMORY[0x1E4F14500];
    }

    if (!os_log_type_enabled(v83, OS_LOG_TYPE_ERROR)) {
      goto LABEL_77;
    }
    v114 = 134219522;
    v115 = v93 / 0x3B9ACA00;
    v116 = 2048;
    v117 = v93 % 0x3B9ACA00 / 0x3E8;
    v118 = 2082;
    v119 = "-[CWFIO80211 init]";
    v120 = 2082;
    v121 = "CWFIO80211.m";
    v122 = 1024;
    v123 = 203;
    v124 = 2112;
    *(void *)v125 = @"IO80211VirtualInterfaceRole";
    *(_WORD *)&v125[8] = 2112;
    *(void *)&v125[10] = @"SoftAP";
    goto LABEL_76;
  }
  sub_1B4F662F4(0, notification, @"IOServiceMatched");
  notification = 0;
  v59 = IOServiceAddMatchingNotification(v2->_portRef, "IOServiceTerminate", (CFDictionaryRef)&unk_1F0DC8AC8, (IOServiceMatchingCallback)sub_1B4F65784, v2, &notification);
  if (v59)
  {
    v95 = v59;
    v96 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
    v97 = CWFGetOSLog();
    if (v97)
    {
      v87 = CWFGetOSLog();
    }
    else
    {
      v87 = MEMORY[0x1E4F14500];
      v108 = MEMORY[0x1E4F14500];
    }

    if (!os_log_type_enabled(v87, OS_LOG_TYPE_ERROR)) {
      goto LABEL_72;
    }
    v114 = 134219778;
    v115 = v96 / 0x3B9ACA00;
    v116 = 2048;
    v117 = v96 % 0x3B9ACA00 / 0x3E8;
    v118 = 2082;
    v119 = "-[CWFIO80211 init]";
    v120 = 2082;
    v121 = "CWFIO80211.m";
    v122 = 1024;
    v123 = 213;
    v124 = 1024;
    *(_DWORD *)v125 = v95;
    *(_WORD *)&v125[4] = 2112;
    *(void *)&v125[6] = @"IO80211VirtualInterfaceRole";
    *(_WORD *)&v125[14] = 2112;
    *(void *)&v125[16] = @"SoftAP";
LABEL_71:
    _os_log_send_and_compose_impl();
LABEL_72:

    goto LABEL_79;
  }
  v63 = objc_msgSend_valueWithPointer_(MEMORY[0x1E4F29238], v60, notification, v61, v62);
  objc_msgSend_setObject_forKeyedSubscript_(v2->_terminatedIO80211VirtualInterfaceMap, v64, (uint64_t)v63, @"SoftAP", v65);

  v69 = objc_msgSend_objectForKeyedSubscript_(v2->_terminatedIO80211VirtualInterfaceMap, v66, @"SoftAP", v67, v68);

  if (!v69)
  {
    v98 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
    v99 = CWFGetOSLog();
    if (v99)
    {
      v83 = CWFGetOSLog();
    }
    else
    {
      v83 = MEMORY[0x1E4F14500];
      v109 = MEMORY[0x1E4F14500];
    }

    if (!os_log_type_enabled(v83, OS_LOG_TYPE_ERROR)) {
      goto LABEL_77;
    }
    v114 = 134219522;
    v115 = v98 / 0x3B9ACA00;
    v116 = 2048;
    v117 = v98 % 0x3B9ACA00 / 0x3E8;
    v118 = 2082;
    v119 = "-[CWFIO80211 init]";
    v120 = 2082;
    v121 = "CWFIO80211.m";
    v122 = 1024;
    v123 = 216;
    v124 = 2112;
    *(void *)v125 = @"IO80211VirtualInterfaceRole";
    *(_WORD *)&v125[8] = 2112;
    *(void *)&v125[10] = @"SoftAP";
LABEL_76:
    _os_log_send_and_compose_impl();
LABEL_77:

    if (notification) {
      IOObjectRelease(notification);
    }
    goto LABEL_79;
  }
  sub_1B4F662F4(0, notification, @"IOServiceMatched");
  return v2;
}

- (void)dealloc
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  io_object_t publishIO80211SkywalkInterface = self->_publishIO80211SkywalkInterface;
  if (publishIO80211SkywalkInterface) {
    IOObjectRelease(publishIO80211SkywalkInterface);
  }
  io_object_t terminatedIO80211SkywalkInterface = self->_terminatedIO80211SkywalkInterface;
  if (terminatedIO80211SkywalkInterface) {
    IOObjectRelease(terminatedIO80211SkywalkInterface);
  }
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  v8 = objc_msgSend_allValues(self->_publishIO80211VirtualInterfaceMap, a2, v2, v3, v4);
  uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v9, (uint64_t)&v42, (uint64_t)v47, 16);
  if (v10)
  {
    uint64_t v15 = v10;
    uint64_t v16 = *(void *)v43;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v43 != v16) {
          objc_enumerationMutation(v8);
        }
        v18 = *(void **)(*((void *)&v42 + 1) + 8 * i);
        if (objc_msgSend_pointerValue(v18, v11, v12, v13, v14))
        {
          io_object_t v19 = objc_msgSend_pointerValue(v18, v11, v12, v13, v14);
          IOObjectRelease(v19);
        }
      }
      uint64_t v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v11, (uint64_t)&v42, (uint64_t)v47, 16);
    }
    while (v15);
  }

  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  v24 = objc_msgSend_allValues(self->_terminatedIO80211VirtualInterfaceMap, v20, v21, v22, v23);
  uint64_t v26 = objc_msgSend_countByEnumeratingWithState_objects_count_(v24, v25, (uint64_t)&v38, (uint64_t)v46, 16);
  if (v26)
  {
    uint64_t v31 = v26;
    uint64_t v32 = *(void *)v39;
    do
    {
      for (uint64_t j = 0; j != v31; ++j)
      {
        if (*(void *)v39 != v32) {
          objc_enumerationMutation(v24);
        }
        v34 = *(void **)(*((void *)&v38 + 1) + 8 * j);
        if (objc_msgSend_pointerValue(v34, v27, v28, v29, v30))
        {
          io_object_t v35 = objc_msgSend_pointerValue(v34, v27, v28, v29, v30);
          IOObjectRelease(v35);
        }
      }
      uint64_t v31 = objc_msgSend_countByEnumeratingWithState_objects_count_(v24, v27, (uint64_t)&v38, (uint64_t)v46, 16);
    }
    while (v31);
  }

  portRef = self->_portRef;
  if (portRef) {
    IONotificationPortDestroy(portRef);
  }
  v37.receiver = self;
  v37.super_class = (Class)CWFIO80211;
  [(CWFIO80211 *)&v37 dealloc];
}

- (void)startEventMonitoring
{
  mutexQueue = self->_mutexQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1B4F659F8;
  block[3] = &unk_1E60BB768;
  block[4] = self;
  dispatch_sync(mutexQueue, block);
}

- (void)stopEventMonitoring
{
  mutexQueue = self->_mutexQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1B4F65AC8;
  block[3] = &unk_1E60BB768;
  block[4] = self;
  dispatch_sync(mutexQueue, block);
}

- (BOOL)isMonitoringEvents
{
  uint64_t v6 = 0;
  dispatch_queue_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  mutexQueue = self->_mutexQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = sub_1B4F65BD0;
  v5[3] = &unk_1E60BB790;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(mutexQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)__IO80211InfoMatchingService:(unsigned int)a3
{
  CFMutableDictionaryRef properties = 0;
  if (a3)
  {
    IORegistryEntryCreateCFProperties(a3, &properties, (CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0);
    IOObjectRelease(a3);
    uint64_t v10 = objc_msgSend_copy(properties, v6, v7, v8, v9);
  }
  else
  {
    uint64_t v10 = objc_msgSend_copy(0, a2, *(uint64_t *)&a3, v3, v4);
  }
  v11 = (void *)v10;
  if (properties) {
    CFRelease(properties);
  }
  return v11;
}

- (id)IO80211ControllerInfo
{
  kern_return_t MatchingServices;
  CFAllocatorRef v5;
  io_registry_entry_t v6;
  io_object_t v7;
  void *v8;
  CFDictionaryRef v9;
  void *v10;
  io_object_t v11;
  io_object_t v12;
  void *v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  kern_return_t v26;
  __uint64_t v27;
  void *v28;
  NSObject *v29;
  id v30;
  mach_port_t mainPort;
  io_iterator_t existing;
  io_iterator_t iterator[2];
  unsigned char properties[12];
  __int16 v35;
  unint64_t v36;
  __int16 v37;
  const char *v38;
  __int16 v39;
  const char *v40;
  __int16 v41;
  int v42;
  __int16 v43;
  kern_return_t v44;
  __int16 v45;
  __CFString *v46;
  uint64_t v47;
  uint64_t vars8;

  v47 = *MEMORY[0x1E4F143B8];
  existing = 0;
  mach_port_t v2 = *MEMORY[0x1E4F2EEF0];
  CFDictionaryRef v3 = IOServiceMatching("IOEthernetInterface");
  mainPort = v2;
  MatchingServices = IOServiceGetMatchingServices(v2, v3, &existing);
  if (MatchingServices)
  {
    uint64_t v26 = MatchingServices;
    v27 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
    uint64_t v28 = CWFGetOSLog();
    if (v28)
    {
      uint64_t v29 = CWFGetOSLog();
    }
    else
    {
      uint64_t v29 = MEMORY[0x1E4F14500];
      uint64_t v30 = MEMORY[0x1E4F14500];
    }

    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)CFMutableDictionaryRef properties = 134219522;
      *(void *)&properties[4] = v27 / 0x3B9ACA00;
      io_object_t v35 = 2048;
      v36 = v27 % 0x3B9ACA00 / 0x3E8;
      objc_super v37 = 2082;
      long long v38 = "__findWiFiController";
      long long v39 = 2082;
      long long v40 = "CWFIO80211.m";
      long long v41 = 1024;
      long long v42 = 465;
      long long v43 = 1024;
      long long v44 = v26;
      long long v45 = 2112;
      v46 = @"IOEthernetInterface";
      _os_log_send_and_compose_impl();
    }

    uint64_t v10 = 0;
  }
  else
  {
    v5 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    while (1)
    {
      uint64_t v6 = IOIteratorNext(existing);
      if (!v6) {
        break;
      }
      uint64_t v7 = v6;
      uint64_t v8 = (id)IORegistryEntryCreateCFProperty(v6, @"BSD Name", v5, 0);
      *(void *)iterator = 0;
      *(void *)CFMutableDictionaryRef properties = 0;
      uint64_t v9 = IOServiceMatching("IOSkywalkEthernetInterface");
      uint64_t v10 = 0;
      if (!IOServiceGetMatchingServices(mainPort, v9, &iterator[1]) && iterator[1])
      {
        v11 = IOIteratorNext(iterator[1]);
        if (v11)
        {
          uint64_t v12 = v11;
          do
          {
            if (IORegistryEntryGetParentEntry(v12, "IOService", iterator))
            {
              IOObjectRelease(v12);
            }
            else
            {
              uint64_t v13 = (void *)IORegistryEntrySearchCFProperty(v12, "IOService", @"IOClassNameOverride", v5, 1u);
              uint64_t v14 = (void *)IORegistryEntrySearchCFProperty(v12, "IOService", @"BSD Name", v5, 1u);
              if (objc_msgSend_isEqualToString_(v14, v15, (uint64_t)v8, v16, v17)
                && objc_msgSend_isEqualToString_(v13, v18, @"IO80211Controller", v19, v20))
              {
                IORegistryEntryCreateCFProperties(iterator[0], (CFMutableDictionaryRef *)properties, v5, 0);
              }
              if (v13) {
                CFRelease(v13);
              }
              if (v14) {
                CFRelease(v14);
              }
              IOObjectRelease(iterator[0]);
              IOObjectRelease(v12);
              if (*(void *)properties) {
                break;
              }
            }
            uint64_t v12 = IOIteratorNext(iterator[1]);
          }
          while (v12);
        }
        IOObjectRelease(iterator[1]);
        uint64_t v10 = objc_msgSend_copy(*(void **)properties, v21, v22, v23, v24);
        if (*(void *)properties) {
          CFRelease(*(CFTypeRef *)properties);
        }
      }

      if (v8) {
        CFRelease(v8);
      }
      IOObjectRelease(v7);
      if (v10) {
        goto LABEL_26;
      }
    }
    uint64_t v10 = 0;
LABEL_26:
    IOObjectRelease(existing);
  }
  return v10;
}

- (id)IO80211InterfaceInfo:(id)a3 error:(id *)a4
{
  id v5 = a3;
  Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  if (Mutable)
  {
    uint64_t v7 = Mutable;
    CFDictionarySetValue(Mutable, @"IOInterfaceName", v5);
    uint64_t v8 = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
    if (v8)
    {
      CFDictionaryRef v9 = v8;
      CFDictionarySetValue(v8, @"IOPropertyMatch", v7);
      uint64_t MatchingService = IOServiceGetMatchingService(*MEMORY[0x1E4F2EEF0], v9);
      uint64_t v14 = objc_msgSend___IO80211InfoMatchingService_(self, v11, MatchingService, v12, v13);
    }
    else
    {
      v18 = CWFGetOSLog();
      if (v18)
      {
        io_object_t v19 = CWFGetOSLog();
      }
      else
      {
        io_object_t v19 = MEMORY[0x1E4F14500];
        id v21 = MEMORY[0x1E4F14500];
      }

      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        _os_log_send_and_compose_impl();
      }

      uint64_t v14 = 0;
    }
    CFRelease(v7);
  }
  else
  {
    uint64_t v16 = CWFGetOSLog();
    if (v16)
    {
      v17 = CWFGetOSLog();
    }
    else
    {
      v17 = MEMORY[0x1E4F14500];
      id v20 = MEMORY[0x1E4F14500];
    }

    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      _os_log_send_and_compose_impl();
    }

    uint64_t v14 = 0;
  }

  return v14;
}

- (id)eventHandler
{
  return objc_getProperty(self, a2, 72, 1);
}

- (void)setEventHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_eventHandler, 0);
  objc_storeStrong((id *)&self->_terminatedIO80211VirtualInterfaceMap, 0);
  objc_storeStrong((id *)&self->_publishIO80211VirtualInterfaceMap, 0);
  objc_storeStrong((id *)&self->_eventQueue, 0);
  objc_storeStrong((id *)&self->_mutexQueue, 0);
}

@end
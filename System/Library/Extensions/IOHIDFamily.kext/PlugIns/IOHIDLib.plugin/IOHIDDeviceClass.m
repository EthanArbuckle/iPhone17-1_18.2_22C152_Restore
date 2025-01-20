@interface IOHIDDeviceClass
- (IOHIDDeviceClass)init;
- (__CFRunLoopSource)runLoopSource;
- (__IOHIDElement)getElement:(unsigned int)a3;
- (id)copyObsoleteDictionary:(id)a3;
- (id)propertyForElementKey:(id)a3;
- (int)close:(unsigned int)a3;
- (int)copyMatchingElements:(id)a3 elements:(const __CFArray *)a4 options:(unsigned int)a5;
- (int)getAsyncEventSource:(const void *)a3;
- (int)getProperty:(id)a3 property:(const void *)a4;
- (int)getReport:(int)a3 reportID:(unsigned int)a4 report:(char *)a5 reportLength:(int64_t *)a6 timeout:(unsigned int)a7 callback:(void *)a8 context:(void *)a9 options:(unsigned int)a10;
- (int)getValue:(__IOHIDElement *)a3 value:(__IOHIDValue *)a4 timeout:(unsigned int)a5 callback:(void *)a6 context:(void *)a7 options:(unsigned int)a8;
- (int)initConnect;
- (int)initElements;
- (int)open:(unsigned int)a3;
- (int)probe:(id)a3 service:(unsigned int)a4 outScore:(int *)a5;
- (int)queryInterface:(id)a3 outInterface:(void *)a4;
- (int)setInputReportCallback:(char *)a3 reportLength:(int64_t)a4 callback:(void *)a5 context:(void *)a6 options:(unsigned int)a7;
- (int)setInputReportWithTimeStampCallback:(char *)a3 reportLength:(int64_t)a4 callback:(void *)a5 context:(void *)a6 options:(unsigned int)a7;
- (int)setProperty:(id)a3 property:(id)a4;
- (int)setReport:(int)a3 reportID:(unsigned int)a4 report:(const char *)a5 reportLength:(int64_t)a6 timeout:(unsigned int)a7 callback:(void *)a8 context:(void *)a9 options:(unsigned int)a10;
- (int)setValue:(__IOHIDElement *)a3 value:(__IOHIDValue *)a4 timeout:(unsigned int)a5 callback:(void *)a6 context:(void *)a7 options:(unsigned int)a8;
- (int)start:(id)a3 service:(unsigned int)a4;
- (int)stop;
- (unsigned)connect;
- (unsigned)getPort;
- (unsigned)port;
- (unsigned)service;
- (void)dealloc;
- (void)initPort;
- (void)initQueue;
- (void)releaseReport:(unint64_t)a3;
- (void)valueAvailableCallback:(int)a3;
@end

@implementation IOHIDDeviceClass

- (int)queryInterface:(id)a3 outInterface:(void *)a4
{
  uint64_t v5 = *(void *)&a3.var8;
  uint64_t v6 = *(void *)&a3.var0;
  CFUUIDRef v8 = CFUUIDCreateFromUUIDBytes(0, (CFUUIDBytes)a3);
  CFUUIDRef v9 = CFUUIDGetConstantUUIDWithBytes((CFAllocatorRef)*MEMORY[0x263EFFB30], 0, 0, 0, 0, 0, 0, 0, 0, 0xC0u, 0, 0, 0, 0, 0, 0, 0x46u);
  if (CFEqual(v8, v9)
    || (CFUUIDRef v10 = CFUUIDGetConstantUUIDWithBytes(0, 0xC2u, 0x44u, 0xE8u, 0x58u, 0x10u, 0x9Cu, 0x11u, 0xD4u, 0x91u, 0xD4u, 0, 0x50u, 0xE4u, 0xC6u, 0x42u, 0x6Fu), CFEqual(v8, v10)))
  {
    uint64_t v11 = 16;
LABEL_4:
    *a4 = (char *)self + v11;
    CFRetain(self);
    int Interface_outInterface = 0;
    goto LABEL_5;
  }
  CFUUIDRef v14 = CFUUIDGetConstantUUIDWithBytes(0, 0x47u, 0x4Bu, 0xDCu, 0x8Eu, 0x9Fu, 0x4Au, 0x11u, 0xDAu, 0xB3u, 0x66u, 0, 0xDu, 0x93u, 0x6Du, 6u, 0xD2u);
  if (CFEqual(v8, v14)
    || (CFUUIDRef v15 = CFUUIDGetConstantUUIDWithBytes(0, 0xB4u, 0x73u, 0x25u, 0x6Cu, 0x6Au, 0x72u, 0x4Eu, 4u, 0xB6u, 0x94u, 0xC4u, 0, 0x1Du, 0x20u, 0x20u, 0x20u), CFEqual(v8, v15)))
  {
    uint64_t v11 = 24;
    goto LABEL_4;
  }
  CFUUIDRef v16 = CFUUIDGetConstantUUIDWithBytes(0, 0x2Eu, 0xC7u, 0x8Bu, 0xDBu, 0x9Fu, 0x4Eu, 0x11u, 0xDAu, 0xB6u, 0x5Cu, 0, 0xDu, 0x93u, 0x6Du, 6u, 0xD2u);
  if (CFEqual(v8, v16))
  {
    objc_msgSend_initPort(self, v17, v18, v19, v20);
    objc_msgSend_initElements(self, v21, v22, v23, v24);
    v25 = IOHIDQueueClass;
LABEL_15:
    id v35 = [v25 alloc];
    v39 = objc_msgSend_initWithDevice_(v35, v36, (uint64_t)self, v37, v38);
    int Interface_outInterface = objc_msgSend_queryInterface_outInterface_(v39, v40, v6, v5, (uint64_t)a4);

    goto LABEL_5;
  }
  CFUUIDRef v26 = CFUUIDGetConstantUUIDWithBytes(0, 0x1Fu, 0x2Eu, 0x78u, 0xFAu, 0x9Fu, 0xFAu, 0x11u, 0xDAu, 0x90u, 0xB4u, 0, 0xDu, 0x93u, 0x6Du, 6u, 0xD2u);
  if (CFEqual(v8, v26))
  {
    objc_msgSend_initPort(self, v27, v28, v29, v30);
    objc_msgSend_initElements(self, v31, v32, v33, v34);
    v25 = IOHIDTransactionClass;
    goto LABEL_15;
  }
  int Interface_outInterface = -2147483644;
LABEL_5:
  if (v8) {
    CFRelease(v8);
  }
  return Interface_outInterface;
}

- (int)probe:(id)a3 service:(unsigned int)a4 outScore:(int *)a5
{
  if (IOObjectConformsTo(a4, "IOHIDDevice")) {
    return 0;
  }
  else {
    return -536870201;
  }
}

- (__IOHIDElement)getElement:(unsigned int)a3
{
  if (objc_msgSend_count(self->_sortedElements, a2, *(uint64_t *)&a3, v3, v4) <= (unint64_t)a3) {
    return 0;
  }
  CFUUIDRef v10 = objc_msgSend_objectAtIndex_(self->_sortedElements, v7, a3, v8, v9);
  if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    CFUUIDRef v15 = (__IOHIDElement *)objc_msgSend_elementRef(v10, v11, v12, v13, v14);
  }
  else {
    CFUUIDRef v15 = 0;
  }

  return v15;
}

- (int)initElements
{
  kern_return_t v10;
  uint64_t v11;
  id v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  mach_port_t connect;
  NSObject *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *outputStruct;
  kern_return_t v24;
  NSMutableArray *v25;
  NSMutableArray *v26;
  size_t v27;
  unint64_t v28;
  NSObject *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  int *v34;
  int v35;
  unsigned int v36;
  unsigned int v37;
  id v38;
  const char *v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t i;
  void *v49;
  int v50;
  int v51;
  int v52;
  id v53;
  const char *v54;
  void *v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  int v65;
  id v66;
  const char *v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  const char *v72;
  uint64_t v73;
  uint64_t v74;
  id v75;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  void *v79;
  mach_port_t v80;
  const char *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  void *v85;
  NSMutableArray *v86;
  NSMutableArray *reportElements;
  size_t j;
  NSObject *v89;
  const char *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  HIDLibElement *v95;
  const char *v96;
  void *v97;
  const char *v98;
  uint64_t v99;
  uint64_t v100;
  const char *v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  const char *v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  id v109;
  const char *v110;
  uint64_t v111;
  uint64_t v112;
  NSMutableArray *v113;
  NSMutableArray *sortedElements;
  const char *v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  id v119;
  const char *v120;
  uint64_t v121;
  const char *v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t k;
  void *v129;
  NSMutableArray *v130;
  unsigned int v131;
  const char *v132;
  uint64_t v133;
  NSMutableArray *v134;
  const char *v135;
  uint64_t v136;
  const char *v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t m;
  void *v144;
  NSMutableArray *v145;
  unsigned int v146;
  const char *v147;
  uint64_t v148;
  int v149;
  NSObject *v151;
  uint64_t v152;
  unsigned int v153;
  NSObject *v154;
  int v155;
  int v156;
  unsigned int v157;
  long long v158;
  long long v159;
  long long v160;
  long long v161;
  long long v162;
  long long v163;
  long long v164;
  long long v165;
  long long v166;
  long long v167;
  long long v168;
  long long v169;
  size_t v170;
  uint64_t input;
  uint32_t outputCnt;
  unsigned char v173[128];
  unsigned char v174[128];
  unsigned char v175[128];
  uint64_t output;
  unint64_t v177;
  uint64_t v178;

  v178 = *MEMORY[0x263EF8340];
  output = 0xAAAAAAAAAAAAAAAALL;
  v177 = 0xAAAAAAAAAAAAAAAALL;
  outputCnt = 2;
  v170 = 0xAAAAAAAAAAAAAAAALL;
  input = 0;
  os_unfair_recursive_lock_lock_with_options();
  uint64_t v3 = 88;
  elements = self->_elements;
  os_unfair_recursive_lock_unlock();
  if (elements) {
    return 0;
  }
  int inited = objc_msgSend_initConnect(self, v5, v6, v7, v8);
  if (inited) {
    return inited;
  }
  CFUUIDRef v10 = IOConnectCallScalarMethod(self->_connect, 0xEu, 0, 0, &output, &outputCnt);
  if (v10)
  {
    v149 = v10;
    uint64_t v18 = _IOHIDLogCategory();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_240775B00();
    }
  }
  else
  {
    uint64_t v11 = v177;
    v170 = 96 * output;
    uint64_t v12 = objc_alloc(MEMORY[0x263EFF990]);
    CFUUIDRef v16 = objc_msgSend_initWithLength_(v12, v13, v170, v14, v15);
    connect = self->_connect;
    uint64_t v18 = v16;
    outputStruct = objc_msgSend_mutableBytes(v18, v19, v20, v21, v22);
    uint64_t v24 = IOConnectCallMethod(connect, 0xFu, &input, 1u, 0, 0, 0, 0, outputStruct, &v170);
    if (v24)
    {
      v149 = v24;
      v151 = _IOHIDLogCategory();
      if (os_log_type_enabled(v151, OS_LOG_TYPE_ERROR)) {
        sub_240775A98();
      }
    }
    else
    {
      v152 = v11;
      os_unfair_recursive_lock_lock_with_options();
      v25 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
      CFUUIDRef v26 = self->_elements;
      self->_elements = v25;

      if (v170)
      {
        v27 = 0;
        v157 = 0;
        uint64_t v28 = 0x2650D3000;
        v154 = v18;
        while (1)
        {
          uint64_t v29 = v18;
          uint64_t v34 = (int *)(objc_msgSend_mutableBytes(v29, v30, v31, v32, v33) + v27);
          id v35 = *v34;
          v36 = v34[1];
          uint64_t v37 = v157;
          if (v36 > v157) {
            uint64_t v37 = v34[1];
          }
          v157 = v37;
          if (v34[2])
          {
            v153 = v34[1];
            v155 = *v34;
            v168 = 0u;
            v169 = 0u;
            v166 = 0u;
            v167 = 0u;
            uint64_t v38 = *(id *)((char *)&self->super.super.super.isa + v3);
            v40 = objc_msgSend_countByEnumeratingWithState_objects_count_(v38, v39, (uint64_t)&v166, (uint64_t)v175, 16);
            if (v40)
            {
              v45 = v40;
              v46 = 0;
              v47 = *(void *)v167;
              do
              {
                for (i = 0; i != v45; ++i)
                {
                  if (*(void *)v167 != v47) {
                    objc_enumerationMutation(v38);
                  }
                  v49 = *(void **)(*((void *)&v166 + 1) + 8 * i);
                  v50 = v34[2];
                  if (v50 == objc_msgSend_elementCookie(v49, v41, v42, v43, v44)) {
                    v46 = objc_msgSend_elementRef(v49, v41, v42, v43, v44);
                  }
                }
                v45 = objc_msgSend_countByEnumeratingWithState_objects_count_(v38, v41, (uint64_t)&v166, (uint64_t)v175, 16);
              }
              while (v45);
            }
            else
            {
              v46 = 0;
            }

            v52 = *v34;
            v51 = v34[1];
            uint64_t v18 = v154;
            uint64_t v3 = 88;
            uint64_t v28 = 0x2650D3000uLL;
            id v35 = v155;
            v36 = v153;
          }
          else
          {
            v46 = 0;
            v51 = v34[1];
            v52 = *v34;
          }
          if (v52 == v51) {
            break;
          }
          if (v36 + 1 != v35)
          {
            v156 = v27;
            v27 = v3;
            v63 = 0;
            v64 = 0;
            if (v36 + 1 - v35 <= 1) {
              v65 = 1;
            }
            else {
              v65 = v36 + 1 - v35;
            }
            do
            {
              v66 = objc_alloc(*(Class *)(v28 + 3744));
              v55 = objc_msgSend_initWithElementStruct_parent_index_(v66, v67, (uint64_t)v34, v46, v63);

              objc_msgSend_elementRef(v55, v68, v69, v70, v71);
              _IOHIDElementSetDeviceInterface();
              objc_msgSend_addObject_(*(void **)((char *)&self->super.super.super.isa + v27), v72, (uint64_t)v55, v73, v74);
              v63 = (v63 + 1);
              v64 = v55;
            }
            while (v65 != v63);
            goto LABEL_30;
          }
LABEL_31:
          v27 = (v27 + 96);
          if (v27 >= v170) {
            goto LABEL_34;
          }
        }
        v156 = v27;
        v53 = objc_alloc(*(Class *)(v28 + 3744));
        v55 = objc_msgSend_initWithElementStruct_parent_index_(v53, v54, (uint64_t)v34, v46, 0);
        objc_msgSend_elementRef(v55, v56, v57, v58, v59);
        _IOHIDElementSetDeviceInterface();
        objc_msgSend_addObject_(*(void **)((char *)&self->super.super.super.isa + v3), v60, (uint64_t)v55, v61, v62);
        v27 = v3;
LABEL_30:

        uint64_t v3 = v27;
        uint64_t v18 = v154;
        LODWORD(v27) = v156;
        goto LABEL_31;
      }
      v157 = 0;
LABEL_34:
      os_unfair_recursive_lock_unlock();
      input = 1;
      v170 = 96 * v152;
      v75 = objc_alloc(MEMORY[0x263EFF990]);
      v79 = objc_msgSend_initWithLength_(v75, v76, v170, v77, v78);

      v80 = self->_connect;
      uint64_t v18 = v79;
      v85 = objc_msgSend_mutableBytes(v18, v81, v82, v83, v84);
      LODWORD(v79) = IOConnectCallMethod(v80, 0xFu, &input, 1u, 0, 0, 0, 0, v85, &v170);
      os_unfair_recursive_lock_lock_with_options();
      if (!v79)
      {
        v86 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
        reportElements = self->_reportElements;
        self->_reportElements = v86;

        if (v170)
        {
          for (j = 0; j < v170; j = (j + 96))
          {
            v89 = v18;
            v94 = objc_msgSend_mutableBytes(v89, v90, v91, v92, v93) + j;
            v95 = [HIDLibElement alloc];
            v97 = objc_msgSend_initWithElementStruct_parent_index_(v95, v96, v94, 0, 0);
            objc_msgSend_addObject_(self->_reportElements, v98, (uint64_t)v97, v99, v100);
            if (objc_msgSend_elementCookie(v97, v101, v102, v103, v104) > v157) {
              v157 = objc_msgSend_elementCookie(v97, v105, v106, v107, v108);
            }
          }
        }
      }
      v109 = objc_alloc(MEMORY[0x263EFF980]);
      v113 = (NSMutableArray *)objc_msgSend_initWithCapacity_(v109, v110, v157 + 1, v111, v112);
      sortedElements = self->_sortedElements;
      self->_sortedElements = v113;

      if (v157 != -1)
      {
        v117 = 0;
        v118 = MEMORY[0x263EFFA80];
        do
          objc_msgSend_setObject_atIndexedSubscript_(self->_sortedElements, v115, v118, v117++, v116);
        while (v157 + 1 != v117);
      }
      v164 = 0u;
      v165 = 0u;
      v162 = 0u;
      v163 = 0u;
      v119 = *(id *)((char *)&self->super.super.super.isa + v3);
      v121 = objc_msgSend_countByEnumeratingWithState_objects_count_(v119, v120, (uint64_t)&v162, (uint64_t)v174, 16);
      if (v121)
      {
        v126 = v121;
        v127 = *(void *)v163;
        do
        {
          for (k = 0; k != v126; ++k)
          {
            if (*(void *)v163 != v127) {
              objc_enumerationMutation(v119);
            }
            v129 = *(void **)(*((void *)&v162 + 1) + 8 * k);
            v130 = self->_sortedElements;
            v131 = objc_msgSend_elementCookie(v129, v122, v123, v124, v125);
            objc_msgSend_replaceObjectAtIndex_withObject_(v130, v132, v131, (uint64_t)v129, v133);
          }
          v126 = objc_msgSend_countByEnumeratingWithState_objects_count_(v119, v122, (uint64_t)&v162, (uint64_t)v174, 16);
        }
        while (v126);
      }

      v160 = 0u;
      v161 = 0u;
      v158 = 0u;
      v159 = 0u;
      v134 = self->_reportElements;
      v136 = objc_msgSend_countByEnumeratingWithState_objects_count_(v134, v135, (uint64_t)&v158, (uint64_t)v173, 16);
      if (v136)
      {
        v141 = v136;
        v142 = *(void *)v159;
        do
        {
          for (m = 0; m != v141; ++m)
          {
            if (*(void *)v159 != v142) {
              objc_enumerationMutation(v134);
            }
            v144 = *(void **)(*((void *)&v158 + 1) + 8 * m);
            v145 = self->_sortedElements;
            v146 = objc_msgSend_elementCookie(v144, v137, v138, v139, v140);
            objc_msgSend_replaceObjectAtIndex_withObject_(v145, v147, v146, (uint64_t)v144, v148);
          }
          v141 = objc_msgSend_countByEnumeratingWithState_objects_count_(v134, v137, (uint64_t)&v158, (uint64_t)v173, 16);
        }
        while (v141);
      }

      os_unfair_recursive_lock_unlock();
      v149 = 0;
    }
  }

  return v149;
}

- (void)initPort
{
  v6.version = 0;
  memset(&v6.retain, 0, 24);
  v6.info = self;
  os_unfair_recursive_lock_lock_with_options();
  if (!self->_port)
  {
    mach_port_t NotificationPort = IODataQueueAllocateNotificationPort();
    self->_port = NotificationPort;
    if (NotificationPort)
    {
      CFAllocatorRef v4 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
      uint64_t v5 = CFMachPortCreateWithPort((CFAllocatorRef)*MEMORY[0x263EFFB08], NotificationPort, (CFMachPortCallBack)sub_2407717B8, &v6, 0);
      self->_machPort = v5;
      if (v5) {
        self->_runLoopSource = CFMachPortCreateRunLoopSource(v4, v5, 0);
      }
    }
  }
  os_unfair_recursive_lock_unlock();
}

- (unsigned)getPort
{
  objc_msgSend_initPort(self, a2, v2, v3, v4);
  return self->_port;
}

- (void)initQueue
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  os_unfair_recursive_lock_lock_with_options();
  if (!self->_queue)
  {
    objc_msgSend_initPort(self, v3, v4, v5, v6);
    if (!objc_msgSend_initElements(self, v7, v8, v9, v10))
    {
      uint64_t v11 = [IOHIDQueueClass alloc];
      uint64_t v13 = (IOHIDQueueClass *)objc_msgSend_initWithDevice_port_source_(v11, v12, (uint64_t)self, self->_port, (uint64_t)self->_runLoopSource);
      queue = self->_queue;
      self->_queue = v13;

      v17 = self->_queue;
      if (v17)
      {
        objc_msgSend_setValueAvailableCallback_context_(v17, v15, (uint64_t)sub_2407719F8, (uint64_t)self, v16);
        long long v33 = 0u;
        long long v34 = 0u;
        long long v35 = 0u;
        long long v36 = 0u;
        uint64_t v18 = self->_reportElements;
        uint64_t v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v19, (uint64_t)&v33, (uint64_t)v37, 16);
        if (v20)
        {
          uint64_t v25 = v20;
          uint64_t v26 = *(void *)v34;
          do
          {
            uint64_t v27 = 0;
            do
            {
              if (*(void *)v34 != v26) {
                objc_enumerationMutation(v18);
              }
              uint64_t v28 = self->_queue;
              uint64_t v29 = objc_msgSend_elementRef(*(void **)(*((void *)&v33 + 1) + 8 * v27), v21, v22, v23, v24, (void)v33);
              objc_msgSend_addElement_(v28, v30, v29, v31, v32);
              ++v27;
            }
            while (v25 != v27);
            uint64_t v25 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v21, (uint64_t)&v33, (uint64_t)v37, 16);
          }
          while (v25);
        }
      }
      else
      {
        _IOHIDLogCategory();
        uint64_t v18 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(&v18->super.super, OS_LOG_TYPE_ERROR)) {
          sub_240775B68(&v18->super.super);
        }
      }
    }
  }
  os_unfair_recursive_lock_unlock();
}

- (int)initConnect
{
  kern_return_t v3;
  BOOL v4;
  int v5;
  NSObject *v7;
  io_connect_t connect;

  os_unfair_recursive_lock_lock_with_options();
  if (self->_connect) {
    goto LABEL_7;
  }
  connect = -1431655766;
  os_unfair_recursive_lock_unlock();
  uint64_t v3 = IOServiceOpen(self->_service, *MEMORY[0x263EF8960], 0x484944u, &connect);
  if (v3) {
    uint64_t v4 = 1;
  }
  else {
    uint64_t v4 = connect == 0;
  }
  if (!v4)
  {
    os_unfair_recursive_lock_lock_with_options();
    self->_connect = connect;
LABEL_7:
    os_unfair_recursive_lock_unlock();
    return 0;
  }
  uint64_t v5 = v3;
  uint64_t v7 = _IOHIDLogCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    sub_240775BAC();
  }

  return v5;
}

- (int)start:(id)a3 service:(unsigned int)a4
{
  kern_return_t v6;
  NSObject *v8;

  uint64_t v6 = IOObjectRetain(a4);
  if (v6)
  {
    uint64_t v8 = _IOHIDLogCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_240775C14();
    }
  }
  else
  {
    os_unfair_recursive_lock_lock_with_options();
    self->_service = a4;
    os_unfair_recursive_lock_unlock();
  }
  return v6;
}

- (int)stop
{
  return 0;
}

- (int)open:(unsigned int)a3
{
  kern_return_t v7;
  int v8;
  NSObject *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  BOOL v14;
  BOOL v15;
  NSObject *v17;
  uint8_t v18[8];
  uint64_t input;

  input = a3;
  int inited = objc_msgSend_initConnect(self, a2, *(uint64_t *)&a3, v3, v4);
  if (inited) {
    return inited;
  }
  uint64_t v7 = IOConnectCallScalarMethod(self->_connect, 1u, &input, 1u, 0, 0);
  uint64_t v8 = v7;
  if (v7 == -536870203)
  {
    uint64_t v9 = _IOHIDLogCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v18 = 0;
      _os_log_impl(&dword_240766000, v9, OS_LOG_TYPE_INFO, "Device is seized, reports will be dropped until the seizing client closes\n", v18, 2u);
    }

    goto LABEL_7;
  }
  if (!v7)
  {
LABEL_7:
    os_unfair_recursive_lock_lock_with_options();
    if (v8) {
      uint64_t v14 = v8 == -536870203;
    }
    else {
      uint64_t v14 = 1;
    }
    CFUUIDRef v15 = v14;
    self->_opened = v15;
    if (self->_inputReportCallback || self->_inputReportTimestampCallback) {
      objc_msgSend_start(self->_queue, v10, v11, v12, v13);
    }
    os_unfair_recursive_lock_unlock();
    return v8;
  }
  v17 = _IOHIDLogCategory();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
    sub_240775C7C();
  }

  return v8;
}

- (int)close:(unsigned int)a3
{
  os_unfair_recursive_lock_lock_with_options();
  if (self->_opened)
  {
    os_unfair_recursive_lock_unlock();
    int inited = objc_msgSend_initConnect(self, v4, v5, v6, v7);
    os_unfair_recursive_lock_lock_with_options();
    if (!inited)
    {
      if (self->_inputReportCallback || self->_inputReportTimestampCallback) {
        objc_msgSend_stop(self->_queue, v9, v10, v11, v12);
      }
      os_unfair_recursive_lock_unlock();
      int inited = IOConnectCallScalarMethod(self->_connect, 2u, 0, 0, 0, 0);
      os_unfair_recursive_lock_lock_with_options();
      self->_opened = 0;
    }
  }
  else
  {
    int inited = -536870195;
  }
  os_unfair_recursive_lock_unlock();
  return inited;
}

- (int)getProperty:(id)a3 property:(const void *)a4
{
  uint64_t v6 = (__CFString *)a3;
  if (a4)
  {
    os_unfair_recursive_lock_lock_with_options();
    uint64_t v10 = objc_msgSend_objectForKeyedSubscript_(self->_properties, v7, (uint64_t)v6, v8, v9);

    os_unfair_recursive_lock_unlock();
    if (!v10)
    {
      if (objc_msgSend_isEqualToString_(v6, v11, @"UniqueID", v12, v13))
      {
        uint64_t entryID = 0xAAAAAAAAAAAAAAAALL;
        IORegistryEntryGetRegistryEntryID(self->_service, &entryID);
        CFProperty = CFNumberCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], kCFNumberLongLongType, &entryID);
      }
      else
      {
        int isEqualToString = objc_msgSend_isEqualToString_(v6, v14, @"Built-In", v15, v16);
        io_registry_entry_t service = self->_service;
        if (isEqualToString) {
          CFProperty = (void *)IORegistryEntryCreateCFProperty(service, v6, (CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
        }
        else {
          CFProperty = (void *)IORegistryEntrySearchCFProperty(service, "IOService", v6, (CFAllocatorRef)*MEMORY[0x263EFFB08], 3u);
        }
      }
      uint64_t v10 = CFProperty;
      if (CFProperty)
      {
        uint64_t v25 = objc_msgSend_mutableCopy(v6, v18, v19, v20, v21);
        os_unfair_recursive_lock_lock_with_options();
        objc_msgSend_setObject_forKeyedSubscript_(self->_properties, v26, (uint64_t)v10, (uint64_t)v25, v27);
        os_unfair_recursive_lock_unlock();
        CFRelease(v10);
      }
    }
    int v22 = 0;
    *a4 = v10;
  }
  else
  {
    int v22 = -536870206;
  }

  return v22;
}

- (int)setProperty:(id)a3 property:(id)a4
{
  kern_return_t v33;
  const char *v34;
  uint64_t v35;

  uint64_t v6 = (__CFString *)a3;
  id v7 = a4;
  uint64_t v15 = objc_msgSend_mutableCopy(v6, v8, v9, v10, v11);
  if (v7) {
    DeepCopy = (void *)CFPropertyListCreateDeepCopy((CFAllocatorRef)*MEMORY[0x263EFFB08], v7, 2uLL);
  }
  else {
    DeepCopy = 0;
  }
  if (objc_msgSend_isEqualToString_(v6, v12, @"IOHIDDeviceSuspend", v13, v14))
  {
    if (self->_queue)
    {
      int v25 = objc_msgSend_BOOLValue(v7, v17, v18, v19, v20);
      queue = self->_queue;
      if (v25) {
        objc_msgSend_stop(queue, v21, v22, v23, v24);
      }
      else {
        objc_msgSend_start(queue, v21, v22, v23, v24);
      }
    }
    goto LABEL_13;
  }
  if ((objc_msgSend_isEqualToString_(v6, v17, @"MaxReportBufferCount", v19, v20) & 1) == 0
    && (objc_msgSend_isEqualToString_(v6, v27, @"ReportBufferEntrySize", v28, v29) & 1) == 0
    && !objc_msgSend_isEqualToString_(v6, v30, @"IOHIDDeviceForceInterfaceRematch", v31, v32))
  {
LABEL_13:
    long long v33 = 0;
    goto LABEL_14;
  }
  long long v33 = IOConnectSetCFProperty(self->_connect, v6, v7);
LABEL_14:
  os_unfair_recursive_lock_lock_with_options();
  objc_msgSend_setObject_forKeyedSubscript_(self->_properties, v34, (uint64_t)DeepCopy, (uint64_t)v15, v35);
  os_unfair_recursive_lock_unlock();

  return v33;
}

- (int)getAsyncEventSource:(const void *)a3
{
  if (!a3) {
    return -536870206;
  }
  objc_msgSend_initPort(self, a2, (uint64_t)a3, v3, v4);
  os_unfair_recursive_lock_lock_with_options();
  *a3 = self->_runLoopSource;
  os_unfair_recursive_lock_unlock();
  return 0;
}

- (id)propertyForElementKey:(id)a3
{
  id v3 = a3;
  id v7 = objc_msgSend_substringToIndex_(v3, v4, 1, v5, v6);
  uint64_t v12 = objc_msgSend_lowercaseString(v7, v8, v9, v10, v11);

  uint64_t v14 = objc_msgSend_stringByReplacingCharactersInRange_withString_(v3, v13, 0, 1, (uint64_t)v12);

  return v14;
}

- (id)copyObsoleteDictionary:(id)a3
{
  uint64_t v203 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v190 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v198 = 0u;
  long long v199 = 0u;
  long long v200 = 0u;
  long long v201 = 0u;
  id obj = v3;
  uint64_t v191 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v4, (uint64_t)&v198, (uint64_t)v202, 16);
  if (v191)
  {
    uint64_t v189 = *(void *)v199;
    do
    {
      for (uint64_t i = 0; i != v191; ++i)
      {
        if (*(void *)v199 != v189) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void **)(*((void *)&v198 + 1) + 8 * i);
        *(void *)&long long v11 = 0xAAAAAAAAAAAAAAAALL;
        *((void *)&v11 + 1) = 0xAAAAAAAAAAAAAAAALL;
        HIDWORD(v196) = -1431655766;
        unsigned int v197 = -1431655766;
        long long v194 = v11;
        long long v195 = v11;
        DWORD2(v192) = -1431655766;
        unsigned int v193 = -1431655766;
        if (v10)
        {
          objc_msgSend_elementStruct(v10, v5, v6, v7, v8);
        }
        else
        {
          long long v196 = 0u;
          unsigned int v197 = 0;
          long long v194 = 0u;
          long long v195 = 0u;
          long long v192 = 0u;
          unsigned int v193 = 0;
        }
        id v12 = objc_alloc_init(MEMORY[0x263EFF9A0]);
        uint64_t v13 = NSNumber;
        uint64_t v18 = objc_msgSend_elementCookie(v10, v14, v15, v16, v17);
        uint64_t v22 = objc_msgSend_numberWithUnsignedInt_(v13, v19, v18, v20, v21);
        objc_msgSend_setObject_forKeyedSubscript_(v12, v23, (uint64_t)v22, @"ElementCookie", v24);

        uint64_t v28 = objc_msgSend_numberWithUnsignedInt_(NSNumber, v25, DWORD2(v192), v26, v27);
        objc_msgSend_setObject_forKeyedSubscript_(v12, v29, (uint64_t)v28, @"CollectionCookie", v30);

        uint64_t v31 = NSNumber;
        uint64_t v36 = objc_msgSend_type(v10, v32, v33, v34, v35);
        v40 = objc_msgSend_numberWithUnsignedInt_(v31, v37, v36, v38, v39);
        objc_msgSend_setObject_forKeyedSubscript_(v12, v41, (uint64_t)v40, @"Type", v42);

        v43 = NSNumber;
        uint64_t v48 = objc_msgSend_usage(v10, v44, v45, v46, v47);
        v52 = objc_msgSend_numberWithUnsignedInt_(v43, v49, v48, v50, v51);
        objc_msgSend_setObject_forKeyedSubscript_(v12, v53, (uint64_t)v52, @"Usage", v54);

        v55 = NSNumber;
        uint64_t v60 = objc_msgSend_usagePage(v10, v56, v57, v58, v59);
        v64 = objc_msgSend_numberWithUnsignedInt_(v55, v61, v60, v62, v63);
        objc_msgSend_setObject_forKeyedSubscript_(v12, v65, (uint64_t)v64, @"UsagePage", v66);

        v67 = NSNumber;
        uint64_t v72 = objc_msgSend_reportID(v10, v68, v69, v70, v71);
        v76 = objc_msgSend_numberWithUnsignedChar_(v67, v73, v72, v74, v75);
        objc_msgSend_setObject_forKeyedSubscript_(v12, v77, (uint64_t)v76, @"ReportID", v78);

        if (HIDWORD(v196))
        {
          v82 = objc_msgSend_numberWithUnsignedInt_(NSNumber, v79, v197, v80, v81);
          objc_msgSend_setObject_forKeyedSubscript_(v12, v83, (uint64_t)v82, @"DuplicateIndex", v84);
        }
        v85 = objc_msgSend_numberWithUnsignedInt_(NSNumber, v79, DWORD1(v195), v80, v81);
        objc_msgSend_setObject_forKeyedSubscript_(v12, v86, (uint64_t)v85, @"Size", v87);

        v91 = objc_msgSend_numberWithUnsignedInt_(NSNumber, v88, DWORD2(v195), v89, v90);
        objc_msgSend_setObject_forKeyedSubscript_(v12, v92, (uint64_t)v91, @"ReportSize", v93);

        v97 = objc_msgSend_numberWithUnsignedInt_(NSNumber, v94, HIDWORD(v195), v95, v96);
        objc_msgSend_setObject_forKeyedSubscript_(v12, v98, (uint64_t)v97, @"ReportCount", v99);

        v103 = objc_msgSend_numberWithBool_(NSNumber, v100, (v193 >> 6) & 1, v101, v102);
        objc_msgSend_setObject_forKeyedSubscript_(v12, v104, (uint64_t)v103, @"HasNullState", v105);

        v109 = objc_msgSend_numberWithBool_(NSNumber, v106, (v193 >> 5) & 1, v107, v108);
        objc_msgSend_setObject_forKeyedSubscript_(v12, v110, (uint64_t)v109, @"HasPreferredState", v111);

        v115 = objc_msgSend_numberWithBool_(NSNumber, v112, (v193 >> 4) & 1, v113, v114);
        objc_msgSend_setObject_forKeyedSubscript_(v12, v116, (uint64_t)v115, @"IsNonLinear", v117);

        v121 = objc_msgSend_numberWithBool_(NSNumber, v118, (v193 >> 2) & 1, v119, v120);
        objc_msgSend_setObject_forKeyedSubscript_(v12, v122, (uint64_t)v121, @"IsRelative", v123);

        v127 = objc_msgSend_numberWithBool_(NSNumber, v124, (v193 >> 3) & 1, v125, v126);
        objc_msgSend_setObject_forKeyedSubscript_(v12, v128, (uint64_t)v127, @"IsWrapping", v129);

        v133 = objc_msgSend_numberWithBool_(NSNumber, v130, (v193 >> 1) & 1, v131, v132);
        objc_msgSend_setObject_forKeyedSubscript_(v12, v134, (uint64_t)v133, @"IsArray", v135);

        v139 = objc_msgSend_numberWithInt_(NSNumber, v136, DWORD2(v194), v137, v138);
        objc_msgSend_setObject_forKeyedSubscript_(v12, v140, (uint64_t)v139, @"Max", v141);

        v145 = objc_msgSend_numberWithInt_(NSNumber, v142, DWORD1(v194), v143, v144);
        objc_msgSend_setObject_forKeyedSubscript_(v12, v146, (uint64_t)v145, @"Min", v147);

        v151 = objc_msgSend_numberWithInt_(NSNumber, v148, v195, v149, v150);
        objc_msgSend_setObject_forKeyedSubscript_(v12, v152, (uint64_t)v151, @"ScaledMax", v153);

        v157 = objc_msgSend_numberWithInt_(NSNumber, v154, HIDWORD(v194), v155, v156);
        objc_msgSend_setObject_forKeyedSubscript_(v12, v158, (uint64_t)v157, @"ScaledMin", v159);

        v160 = NSNumber;
        uint64_t v165 = objc_msgSend_unit(v10, v161, v162, v163, v164);
        v169 = objc_msgSend_numberWithUnsignedInt_(v160, v166, v165, v167, v168);
        objc_msgSend_setObject_forKeyedSubscript_(v12, v170, (uint64_t)v169, @"Unit", v171);

        v172 = NSNumber;
        uint64_t v177 = objc_msgSend_unitExponent(v10, v173, v174, v175, v176);
        v181 = objc_msgSend_numberWithUnsignedChar_(v172, v178, v177, v179, v180);
        objc_msgSend_setObject_forKeyedSubscript_(v12, v182, (uint64_t)v181, @"UnitExponent", v183);

        objc_msgSend_addObject_(v190, v184, (uint64_t)v12, v185, v186);
      }
      uint64_t v191 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v5, (uint64_t)&v198, (uint64_t)v202, 16);
    }
    while (v191);
  }

  return v190;
}

- (int)copyMatchingElements:(id)a3 elements:(const __CFArray *)a4 options:(unsigned int)a5
{
  char v5 = a5;
  uint64_t v54 = *MEMORY[0x263EF8340];
  id v12 = a3;
  if (a4)
  {
    int inited = objc_msgSend_initElements(self, v8, v9, v10, v11);
    if (!inited)
    {
      os_unfair_recursive_lock_lock_with_options();
      id v14 = objc_alloc(MEMORY[0x263EFF980]);
      uint64_t v18 = objc_msgSend_initWithArray_(v14, v15, (uint64_t)self->_elements, v16, v17);
      os_unfair_recursive_lock_unlock();
      v51[0] = MEMORY[0x263EF8330];
      v51[1] = 3221225472;
      v51[2] = sub_240772A1C;
      v51[3] = &unk_2650D4040;
      v51[4] = self;
      id v19 = v18;
      id v52 = v19;
      objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v12, v20, (uint64_t)v51, v21, v22);
      if (objc_msgSend_count(v19, v23, v24, v25, v26))
      {
        if (v5)
        {
          id v30 = (id)objc_msgSend_copyObsoleteDictionary_(self, v27, (uint64_t)v19, v28, v29);
        }
        else
        {
          id v30 = objc_alloc_init(MEMORY[0x263EFF980]);
          long long v47 = 0u;
          long long v48 = 0u;
          long long v49 = 0u;
          long long v50 = 0u;
          id v31 = v19;
          uint64_t v33 = objc_msgSend_countByEnumeratingWithState_objects_count_(v31, v32, (uint64_t)&v47, (uint64_t)v53, 16);
          if (v33)
          {
            uint64_t v38 = v33;
            uint64_t v39 = *(void *)v48;
            do
            {
              for (uint64_t i = 0; i != v38; ++i)
              {
                if (*(void *)v48 != v39) {
                  objc_enumerationMutation(v31);
                }
                uint64_t v41 = objc_msgSend_elementRef(*(void **)(*((void *)&v47 + 1) + 8 * i), v34, v35, v36, v37, (void)v47);
                objc_msgSend_addObject_(v30, v42, v41, v43, v44);
              }
              uint64_t v38 = objc_msgSend_countByEnumeratingWithState_objects_count_(v31, v34, (uint64_t)&v47, (uint64_t)v53, 16);
            }
            while (v38);
          }
        }
      }
      else
      {
        id v30 = 0;
      }
      CFArrayRef v45 = (const __CFArray *)v30;
      *a4 = v45;

      int inited = 0;
    }
  }
  else
  {
    int inited = -536870206;
  }

  return inited;
}

- (int)setValue:(__IOHIDElement *)a3 value:(__IOHIDValue *)a4 timeout:(unsigned int)a5 callback:(void *)a6 context:(void *)a7 options:(unsigned int)a8
{
  kern_return_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  kern_return_t inited;
  HIDLibElement *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  int v39;
  CFIndex Length;
  size_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  NSObject *v46;
  uint64_t entryID;
  uint64_t input;

  id v12 = -536870206;
  input = 0;
  os_unfair_recursive_lock_lock_with_options();
  if (!self->_opened)
  {
    id v30 = 0;
    uint64_t v25 = 0;
    id v12 = -536870195;
    goto LABEL_17;
  }
  int inited = objc_msgSend_initElements(self, v13, v14, v15, v16);
  if (inited)
  {
    id v30 = 0;
    uint64_t v25 = 0;
    id v12 = inited;
    goto LABEL_17;
  }
  uint64_t v18 = [HIDLibElement alloc];
  uint64_t v25 = objc_msgSend_initWithElementRef_(v18, v19, (uint64_t)a3, v20, v21);
  if (!v25)
  {
    id v30 = 0;
    goto LABEL_21;
  }
  uint64_t v26 = objc_msgSend_indexOfObject_(self->_elements, v22, (uint64_t)v25, v23, v24);
  if (v26 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v30 = 0;
    goto LABEL_17;
  }
  id v30 = objc_msgSend_objectAtIndex_(self->_elements, v27, v26, v28, v29);
  if (objc_msgSend_type(v30, v31, v32, v33, v34) == 129)
  {
    if (!a4) {
      goto LABEL_17;
    }
  }
  else
  {
    uint64_t v39 = objc_msgSend_type(v30, v35, v36, v37, v38);
    if (!a4 || v39 != 257) {
      goto LABEL_17;
    }
  }
  if ((a8 & 0x10000) != 0)
  {
    id v12 = 0;
    goto LABEL_17;
  }
  Length = IOHIDValueGetLength(a4);
  if (Length < 0)
  {
LABEL_21:
    id v12 = -536870212;
    goto LABEL_17;
  }
  uint64_t v41 = (Length + 8);
  uint64_t v42 = malloc_type_malloc(v41, 0x38FC185BuLL);
  _IOHIDValueCopyToElementValueHeader();
  id v12 = IOConnectCallMethod(self->_connect, 0xBu, &input, 1u, v42, v41, 0, 0, 0, 0);
  free(v42);
  if (v12)
  {
    uint64_t entryID = 0xAAAAAAAAAAAAAAAALL;
    IORegistryEntryGetRegistryEntryID(self->_service, &entryID);
    uint64_t v46 = _IOHIDLogCategory();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR)) {
      sub_240775D6C((uint64_t *)&entryID, v12, v46);
    }
  }
  else
  {
    objc_msgSend_setValueRef_(v30, v43, (uint64_t)a4, v44, v45);
  }
LABEL_17:
  os_unfair_recursive_lock_unlock();

  return v12;
}

- (int)getValue:(__IOHIDElement *)a3 value:(__IOHIDValue *)a4 timeout:(unsigned int)a5 callback:(void *)a6 context:(void *)a7 options:(unsigned int)a8
{
  kern_return_t v8;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  kern_return_t inited;
  HIDLibElement *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *outputStruct;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  unint64_t v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  const void *v58;
  uint64_t v60;
  int inputStruct;
  uint64_t input[2];
  BOOL v63;
  uint64_t v64;

  v64 = *MEMORY[0x263EF8340];
  uint64_t v8 = -536870206;
  input[0] = 0;
  input[1] = 0;
  uint64_t v63 = 0;
  if (!a4)
  {
    id v30 = 0;
    uint64_t v25 = 0;
    goto LABEL_26;
  }
  os_unfair_recursive_lock_lock_with_options();
  if (!self->_opened)
  {
    id v30 = 0;
    uint64_t v25 = 0;
    uint64_t v8 = -536870195;
    goto LABEL_32;
  }
  int inited = objc_msgSend_initElements(self, v13, v14, v15, v16);
  if (inited)
  {
    id v30 = 0;
    uint64_t v25 = 0;
    uint64_t v8 = inited;
    goto LABEL_32;
  }
  uint64_t v18 = [HIDLibElement alloc];
  uint64_t v25 = objc_msgSend_initWithElementRef_(v18, v19, (uint64_t)a3, v20, v21);
  if (!v25)
  {
    id v30 = 0;
    uint64_t v8 = -536870212;
    goto LABEL_32;
  }
  uint64_t v26 = objc_msgSend_indexOfObject_(self->_elements, v22, (uint64_t)v25, v23, v24);
  if (v26 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v30 = 0;
    goto LABEL_32;
  }
  id v30 = objc_msgSend_objectAtIndex_(self->_elements, v27, v26, v28, v29);
  if (objc_msgSend_type(v30, v31, v32, v33, v34) == 513)
  {
LABEL_32:
    os_unfair_recursive_lock_unlock();
    goto LABEL_26;
  }
  if (objc_msgSend_valueRef(v30, v35, v36, v37, v38)) {
    *a4 = (__IOHIDValue *)objc_msgSend_valueRef(v30, v39, v40, v41, v42);
  }
  if ((a8 & 0x10000) != 0)
  {
    uint64_t v8 = 0;
    goto LABEL_32;
  }
  if ((a8 & 0x40000) != 0 || objc_msgSend_type(v30, v39, v40, v41, v42) != 257) {
    uint64_t v63 = (a8 & 0x20000) == 0;
  }
  inputStruct = objc_msgSend_elementCookie(v30, v39, v40, v41, v42);
  objc_msgSend_elementRef(v30, v43, v44, v45, v46);
  uint64_t v60 = _IOHIDElementGetLength() + 24;
  outputStruct = malloc_type_malloc(v60, 0xFEF6E212uLL);
  uint64_t v8 = IOConnectCallMethod(self->_connect, 0xAu, input, 3u, &inputStruct, 4uLL, 0, 0, outputStruct, (size_t *)&v60);
  if (v8)
  {
    os_unfair_recursive_lock_unlock();
    if (!outputStruct) {
      goto LABEL_26;
    }
  }
  else
  {
    id v52 = outputStruct[1];
    if (off_26B9460F0 && off_26B9460F0() && off_26B9460F8) {
      id v52 = off_26B9460F8(v52);
    }
    if (!objc_msgSend_valueRef(v30, v48, v49, v50, v51)
      || objc_msgSend_timestamp(v30, v53, v54, v55, v56) < v52
      || objc_msgSend_type(v30, v53, v54, v55, v56) == 257)
    {
      objc_msgSend_elementRef(v30, v53, v54, v55, v56);
      uint64_t v57 = _IOHIDValueCreateWithElementValuePtr();
      if (v57)
      {
        uint64_t v58 = (const void *)v57;
        objc_msgSend_setValueRef_(v30, v53, v57, v55, v56);
        CFRelease(v58);
      }
    }
    *a4 = (__IOHIDValue *)objc_msgSend_valueRef(v30, v53, v54, v55, v56);
    os_unfair_recursive_lock_unlock();
  }
  free(outputStruct);
LABEL_26:

  return v8;
}

- (void)valueAvailableCallback:(int)a3
{
  IOHIDValueRef value = (IOHIDValueRef)0xAAAAAAAAAAAAAAAALL;
  os_unfair_recursive_lock_lock_with_options();
  inputReportBufferCFIndex Length = self->_inputReportBufferLength;
  inputReportBuffer = self->_inputReportBuffer;
  os_unfair_recursive_lock_unlock();
  if (!objc_msgSend_copyNextValue_(self->_queue, v5, (uint64_t)&value, v6, v7))
  {
    CFIndex Length = 0;
    do
    {
      if (IOHIDValueGetBytePtr(value) && IOHIDValueGetLength(value))
      {
        CFIndex Length = inputReportBufferLength;
        if (inputReportBufferLength >= IOHIDValueGetLength(value)) {
          CFIndex Length = IOHIDValueGetLength(value);
        }
        IOHIDValueRef v13 = value;
        if (Length < 0) {
          goto LABEL_14;
        }
        BytePtr = IOHIDValueGetBytePtr(value);
        memmove(inputReportBuffer, BytePtr, Length);
      }
      Element = IOHIDValueGetElement(value);
      uint64_t ReportID = IOHIDElementGetReportID(Element);
      uint64_t TimeStamp = IOHIDValueGetTimeStamp(value);
      os_unfair_recursive_lock_lock_with_options();
      inputReportCallback = self->_inputReportCallback;
      inputReportTimestampCallback = self->_inputReportTimestampCallback;
      inputReportContext = self->_inputReportContext;
      os_unfair_recursive_lock_unlock();
      if (inputReportCallback)
      {
        os_unfair_recursive_lock_lock_with_options();
        ((void (*)(void *, void, IOHIDDeviceTimeStampedDeviceInterface **, void, uint64_t, char *, CFIndex))inputReportCallback)(inputReportContext, 0, &self->_device, 0, ReportID, inputReportBuffer, Length);
        os_unfair_recursive_lock_unlock();
      }
      if (inputReportTimestampCallback)
      {
        os_unfair_recursive_lock_lock_with_options();
        ((void (*)(void *, void, IOHIDDeviceTimeStampedDeviceInterface **, void, uint64_t, char *, CFIndex, uint64_t))inputReportTimestampCallback)(inputReportContext, 0, &self->_device, 0, ReportID, inputReportBuffer, Length, TimeStamp);
        os_unfair_recursive_lock_unlock();
      }
      IOHIDValueRef v13 = value;
LABEL_14:
      CFRelease(v13);
    }
    while (!objc_msgSend_copyNextValue_(self->_queue, v21, (uint64_t)&value, v22, v23));
  }
  objc_msgSend_signalQueueEmpty(self->_queue, v8, v9, v10, v11, inputReportBufferLength);
}

- (int)setInputReportCallback:(char *)a3 reportLength:(int64_t)a4 callback:(void *)a5 context:(void *)a6 options:(unsigned int)a7
{
  os_unfair_recursive_lock_lock_with_options();
  os_unfair_recursive_lock_lock_with_options();
  self->_inputReportBuffer = a3;
  self->_inputReportBufferCFIndex Length = a4;
  self->_inputReportContext = a6;
  self->_inputReportCallback = a5;
  os_unfair_recursive_lock_unlock();
  os_unfair_recursive_lock_unlock();
  objc_msgSend_initQueue(self, v12, v13, v14, v15);
  os_unfair_recursive_lock_lock_with_options();
  if (self->_opened) {
    objc_msgSend_start(self->_queue, v16, v17, v18, v19);
  }
  os_unfair_recursive_lock_unlock();
  return 0;
}

- (int)setReport:(int)a3 reportID:(unsigned int)a4 report:(const char *)a5 reportLength:(int64_t)a6 timeout:(unsigned int)a7 callback:(void *)a8 context:(void *)a9 options:(unsigned int)a10
{
  kern_return_t v17;
  BOOL opened;
  long long v19;
  _DWORD *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t reference[2];
  long long v28;
  long long v29;
  long long v30;
  uint64_t input[2];
  uint64_t v32;
  uint64_t v33;

  uint64_t v33 = *MEMORY[0x263EF8340];
  uint64_t v17 = -536870212;
  input[0] = a3;
  input[1] = a4;
  uint64_t v32 = 0;
  os_unfair_recursive_lock_lock_with_options();
  opened = self->_opened;
  os_unfair_recursive_lock_unlock();
  if (!opened) {
    return -536870195;
  }
  if (!a8) {
    return IOConnectCallMethod(self->_connect, 0xDu, input, 3u, a5, a6, 0, 0, 0, 0);
  }
  *(void *)&uint64_t v19 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v19 + 1) = 0xAAAAAAAAAAAAAAAALL;
  uint64_t v29 = v19;
  id v30 = v19;
  *(_OWORD *)reference = v19;
  uint64_t v28 = v19;
  uint64_t v32 = a7;
  uint64_t v20 = malloc_type_malloc(0x38uLL, 0x109004093AC984DuLL);
  if (v20)
  {
    uint64_t v25 = v20;
    *uint64_t v20 = a3;
    *((void *)v20 + 1) = a5;
    v20[4] = a4;
    *((void *)v20 + 3) = a8;
    *((void *)v20 + 4) = a9;
    *((void *)v20 + 5) = self;
    *((void *)v20 + 6) = &self->_device;
    reference[1] = (uint64_t)sub_240773674;
    *(void *)&uint64_t v28 = v20;
    objc_msgSend_initPort(self, v21, v22, v23, v24);
    uint64_t v17 = IOConnectCallAsyncMethod(self->_connect, 0xDu, self->_port, reference, 3u, input, 3u, a5, a6, 0, 0, 0, 0);
    if (v17) {
      free(v25);
    }
  }
  return v17;
}

- (int)getReport:(int)a3 reportID:(unsigned int)a4 report:(char *)a5 reportLength:(int64_t *)a6 timeout:(unsigned int)a7 callback:(void *)a8 context:(void *)a9 options:(unsigned int)a10
{
  kern_return_t v10;
  BOOL opened;
  long long v19;
  _DWORD *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v27;
  uint64_t reference[2];
  long long v29;
  long long v30;
  long long v31;
  uint64_t input[2];
  uint64_t v33;
  uint64_t v34;

  uint64_t v34 = *MEMORY[0x263EF8340];
  uint64_t v10 = -536870212;
  uint64_t v33 = 0;
  uint64_t v27 = *a6;
  if (v27 < 1) {
    return -536870206;
  }
  os_unfair_recursive_lock_lock_with_options();
  opened = self->_opened;
  os_unfair_recursive_lock_unlock();
  if (!opened) {
    return -536870195;
  }
  input[0] = a3;
  input[1] = a4;
  if (!a8)
  {
    uint64_t v10 = IOConnectCallMethod(self->_connect, 0xCu, input, 3u, 0, 0, 0, 0, a5, (size_t *)&v27);
LABEL_9:
    *a6 = v27;
    return v10;
  }
  *(void *)&uint64_t v19 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v19 + 1) = 0xAAAAAAAAAAAAAAAALL;
  id v30 = v19;
  id v31 = v19;
  *(_OWORD *)reference = v19;
  uint64_t v29 = v19;
  uint64_t v33 = a7;
  uint64_t v20 = malloc_type_malloc(0x38uLL, 0x109004093AC984DuLL);
  if (v20)
  {
    uint64_t v25 = v20;
    *uint64_t v20 = a3;
    *((void *)v20 + 1) = a5;
    v20[4] = a4;
    *((void *)v20 + 3) = a8;
    *((void *)v20 + 4) = a9;
    *((void *)v20 + 5) = self;
    *((void *)v20 + 6) = &self->_device;
    reference[1] = (uint64_t)sub_240773674;
    *(void *)&uint64_t v29 = v20;
    objc_msgSend_initPort(self, v21, v22, v23, v24);
    uint64_t v10 = IOConnectCallAsyncMethod(self->_connect, 0xCu, self->_port, reference, 3u, input, 3u, 0, 0, 0, 0, a5, (size_t *)&v27);
    if (v10) {
      free(v25);
    }
    goto LABEL_9;
  }
  return v10;
}

- (int)setInputReportWithTimeStampCallback:(char *)a3 reportLength:(int64_t)a4 callback:(void *)a5 context:(void *)a6 options:(unsigned int)a7
{
  os_unfair_recursive_lock_lock_with_options();
  self->_inputReportBuffer = a3;
  self->_inputReportBufferCFIndex Length = a4;
  self->_inputReportContext = a6;
  self->_inputReportTimestampCallback = a5;
  os_unfair_recursive_lock_unlock();
  objc_msgSend_initQueue(self, v12, v13, v14, v15);
  os_unfair_recursive_lock_lock_with_options();
  if (self->_opened) {
    objc_msgSend_start(self->_queue, v16, v17, v18, v19);
  }
  os_unfair_recursive_lock_unlock();
  return 0;
}

- (void)releaseReport:(unint64_t)a3
{
  v3[1] = *MEMORY[0x263EF8340];
  v3[0] = a3;
  IOConnectCallScalarMethod(self->_connect, 0x11u, v3, 1u, 0, 0);
}

- (IOHIDDeviceClass)init
{
  v11.receiver = self;
  v11.super_class = (Class)IOHIDDeviceClass;
  uint64_t v2 = [(IOHIDPlugin *)&v11 init];
  if (v2)
  {
    id v3 = (char *)malloc_type_malloc(0x80uLL, 0x800408754F03FuLL);
    v2->_device = (IOHIDDeviceTimeStampedDeviceInterface *)v3;
    vtbl = v2->super.super._vtbl;
    Release = vtbl->Release;
    long long v6 = *(_OWORD *)&vtbl->QueryInterface;
    *(void *)id v3 = v2;
    *(_OWORD *)(v3 + 8) = v6;
    *((void *)v3 + 3) = Release;
    *((void *)v3 + 4) = sub_240773BFC;
    *((void *)v3 + 5) = sub_240773C0C;
    *((void *)v3 + 6) = sub_240773C1C;
    *((void *)v3 + 7) = sub_240773C30;
    *((void *)v3 + 8) = sub_240773C44;
    *((void *)v3 + 9) = sub_240773C54;
    *((void *)v3 + 10) = sub_240773C6C;
    *((void *)v3 + 11) = sub_240773C90;
    *((void *)v3 + 12) = sub_240773CB4;
    *((void *)v3 + 13) = sub_240773CD4;
    *((void *)v3 + 14) = sub_240773D24;
    *((void *)v3 + 15) = sub_240773D74;
    uint64_t v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    properties = v2->_properties;
    v2->_properties = v7;

    v2->_deviceLock = 0;
    v2->_callbackLock = 0;
    uint64_t v9 = v2;
  }

  return v2;
}

- (void)dealloc
{
  free(self->_device);
  runLoopSource = self->_runLoopSource;
  if (runLoopSource) {
    CFRelease(runLoopSource);
  }
  machPort = self->_machPort;
  if (machPort)
  {
    CFMachPortInvalidate(machPort);
    CFRelease(self->_machPort);
  }
  mach_port_name_t port = self->_port;
  if (port) {
    mach_port_mod_refs(*MEMORY[0x263EF8960], port, 1u, -1);
  }
  io_connect_t connect = self->_connect;
  if (connect) {
    IOServiceClose(connect);
  }
  io_object_t service = self->_service;
  if (service) {
    IOObjectRelease(service);
  }
  v8.receiver = self;
  v8.super_class = (Class)IOHIDDeviceClass;
  [(IOHIDPlugin *)&v8 dealloc];
}

- (unsigned)port
{
  return self->_port;
}

- (__CFRunLoopSource)runLoopSource
{
  return self->_runLoopSource;
}

- (unsigned)connect
{
  return self->_connect;
}

- (unsigned)service
{
  return self->_service;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_protectedEvent, 0);
  objc_storeStrong((id *)&self->_properties, 0);
  objc_storeStrong((id *)&self->_reportElements, 0);
  objc_storeStrong((id *)&self->_sortedElements, 0);
  objc_storeStrong((id *)&self->_elements, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end
@interface IOHIDUPSClass
- (BOOL)pollEventUpdate;
- (BOOL)updateEvent;
- (IOHIDUPSClass)init;
- (id)copyElements:(id)a3 psKey:(id)a4;
- (id)latestElement:(id)a3 psKey:(id)a4;
- (int)createAsyncEventSource:(const void *)a3;
- (int)getCapabilities:(const __CFSet *)a3;
- (int)getEvent:(const __CFDictionary *)a3;
- (int)getProperties:(const __CFDictionary *)a3;
- (int)probe:(id)a3 service:(unsigned int)a4 outScore:(int *)a5;
- (int)queryInterface:(id)a3 outInterface:(void *)a4;
- (int)sendCommand:(id)a3;
- (int)setEventCallback:(void *)a3 target:(void *)a4 refcon:(void *)a5;
- (int)start:(id)a3 service:(unsigned int)a4;
- (int)stop;
- (void)dealloc;
- (void)initialEventUpdate;
- (void)parseElements:(id)a3;
- (void)parseProperties:(id)a3;
- (void)updateElements:(id)a3;
- (void)valueAvailableCallback:(int)a3;
@end

@implementation IOHIDUPSClass

- (int)queryInterface:(id)a3 outInterface:(void *)a4
{
  CFUUIDRef v6 = CFUUIDCreateFromUUIDBytes(0, (CFUUIDBytes)a3);
  CFUUIDRef v7 = CFUUIDGetConstantUUIDWithBytes((CFAllocatorRef)*MEMORY[0x263EFFB30], 0, 0, 0, 0, 0, 0, 0, 0, 0xC0u, 0, 0, 0, 0, 0, 0, 0x46u);
  if (CFEqual(v6, v7)
    || (CFUUIDRef v8 = CFUUIDGetConstantUUIDWithBytes(0, 0xC2u, 0x44u, 0xE8u, 0x58u, 0x10u, 0x9Cu, 0x11u, 0xD4u, 0x91u, 0xD4u, 0, 0x50u, 0xE4u, 0xC6u, 0x42u, 0x6Fu), CFEqual(v6, v8)))
  {
    v9 = &OBJC_IVAR___IOHIDPlugin__plugin;
  }
  else
  {
    CFUUIDRef v12 = CFUUIDGetConstantUUIDWithBytes(0, 0x63u, 0xF8u, 0xBFu, 0xC4u, 0x26u, 0xA0u, 0x11u, 0xD8u, 0x88u, 0xB4u, 0, 0xAu, 0x95u, 0x8Au, 0x2Cu, 0x78u);
    if (!CFEqual(v6, v12))
    {
      CFUUIDRef v13 = CFUUIDGetConstantUUIDWithBytes(0, 0xE6u, 0xEu, 7u, 0x99u, 0x9Au, 0xA6u, 0x49u, 0xDFu, 0xB5u, 0x5Bu, 0xA5u, 0xC9u, 0x4Bu, 0xA0u, 0x7Au, 0x4Au);
      if (!CFEqual(v6, v13))
      {
        int v10 = -2147483644;
        if (!v6) {
          return v10;
        }
        goto LABEL_5;
      }
    }
    v9 = &OBJC_IVAR___IOHIDUPSClass__ups;
  }
  *a4 = (char *)self + *v9;
  CFRetain(self);
  int v10 = 0;
  if (v6) {
LABEL_5:
  }
    CFRelease(v6);
  return v10;
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

- (void)parseProperties:(id)a3
{
  uint64_t v84 = *MEMORY[0x263EF8340];
  id v4 = a3;
  CFUUIDRef v8 = objc_msgSend_objectForKeyedSubscript_(v4, v5, @"Transport", v6, v7);
  objc_msgSend_setObject_forKeyedSubscript_(self->_properties, v9, (uint64_t)v8, @"Transport Type", v10);

  v14 = objc_msgSend_objectForKeyedSubscript_(v4, v11, @"Product", v12, v13);
  objc_msgSend_setObject_forKeyedSubscript_(self->_properties, v15, (uint64_t)v14, @"Name", v16);

  v20 = objc_msgSend_objectForKeyedSubscript_(self->_properties, v17, @"Name", v18, v19);

  if (!v20)
  {
    v24 = objc_msgSend_objectForKeyedSubscript_(v4, v21, @"Manufacturer", v22, v23);
    objc_msgSend_setObject_forKeyedSubscript_(self->_properties, v25, (uint64_t)v24, @"Name", v26);
  }
  v27 = objc_msgSend_objectForKeyedSubscript_(v4, v21, @"VendorID", v22, v23);
  objc_msgSend_setObject_forKeyedSubscript_(self->_properties, v28, (uint64_t)v27, @"Vendor ID", v29);

  v33 = objc_msgSend_objectForKeyedSubscript_(v4, v30, @"ProductID", v31, v32);
  objc_msgSend_setObject_forKeyedSubscript_(self->_properties, v34, (uint64_t)v33, @"Product ID", v35);

  v39 = objc_msgSend_objectForKeyedSubscript_(v4, v36, @"SerialNumber", v37, v38);
  objc_msgSend_setObject_forKeyedSubscript_(self->_properties, v40, (uint64_t)v39, @"Accessory Identifier", v41);

  v45 = objc_msgSend_objectForKey_(v4, v42, @"ModelNumber", v43, v44);

  if (v45)
  {
    v49 = objc_msgSend_objectForKey_(v4, v46, @"ModelNumber", v47, v48);
    objc_msgSend_setObject_forKeyedSubscript_(self->_properties, v50, (uint64_t)v49, @"Model Number", v51);
  }
  v52 = objc_msgSend_objectForKeyedSubscript_(v4, v46, @"PrimaryUsagePage", v47, v48);
  int v57 = objc_msgSend_intValue(v52, v53, v54, v55, v56);

  v61 = objc_msgSend_objectForKeyedSubscript_(v4, v58, @"PrimaryUsage", v59, v60);
  int v66 = objc_msgSend_intValue(v61, v62, v63, v64, v65);

  v70 = objc_msgSend_objectForKeyedSubscript_(v4, v67, @"Accessory Category", v68, v69);

  if (v70)
  {
    v74 = objc_msgSend_objectForKeyedSubscript_(v4, v71, @"Accessory Category", v72, v73);
    objc_msgSend_setObject_forKeyedSubscript_(self->_properties, v75, (uint64_t)v74, @"Accessory Category", v76);
  }
  else if (v57 == 1 && v66 == 6)
  {
    objc_msgSend_setObject_forKeyedSubscript_(self->_properties, v71, @"Keyboard", @"Accessory Category", v73);
  }
  else if (v57 == 1 && v66 == 2)
  {
    objc_msgSend_setObject_forKeyedSubscript_(self->_properties, v71, @"Mouse", @"Accessory Category", v73);
  }
  else
  {
    v77 = objc_msgSend_objectForKeyedSubscript_(v4, v71, @"GameControllerType", v72, v73);

    if (v77) {
      objc_msgSend_setObject_forKeyedSubscript_(self->_properties, v78, @"Game Controller", @"Accessory Category", v79);
    }
  }
  v80 = _IOHIDLogCategory();
  if (os_log_type_enabled(v80, OS_LOG_TYPE_DEFAULT))
  {
    properties = self->_properties;
    int v82 = 138412290;
    v83 = properties;
    _os_log_impl(&dword_240766000, v80, OS_LOG_TYPE_DEFAULT, "properties: %@", (uint8_t *)&v82, 0xCu);
  }
}

- (void)parseElements:(id)a3
{
  uint64_t v153 = *MEMORY[0x263EF8340];
  long long v145 = 0u;
  long long v146 = 0u;
  long long v147 = 0u;
  long long v148 = 0u;
  obuint64_t j = a3;
  uint64_t v137 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v4, (uint64_t)&v145, (uint64_t)v152, 16);
  if (v137)
  {
    uint64_t v136 = *(void *)v146;
    do
    {
      for (uint64_t i = 0; i != v137; ++i)
      {
        if (*(void *)v146 != v136) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void *)(*((void *)&v145 + 1) + 8 * i);
        uint64_t v10 = [HIDLibElement alloc];
        v14 = objc_msgSend_initWithElementRef_(v10, v11, v9, v12, v13);
        id v15 = objc_alloc_init(MEMORY[0x263EFF980]);
        unsigned int v20 = objc_msgSend_type(v14, v16, v17, v18, v19);
        int v25 = objc_msgSend_type(v14, v21, v22, v23, v24);
        int v30 = objc_msgSend_usagePage(v14, v26, v27, v28, v29);
        uint64_t v139 = i;
        if (v30 > 65279)
        {
          if (v30 == 65280)
          {
            if (objc_msgSend_usage(v14, v31, v32, v33, v34) == 33)
            {
              objc_msgSend_setPsKey_(v14, v31, @"Device Color", v33, v34);
LABEL_107:
              objc_msgSend_setIsConstant_(v14, v39, 1, v40, v41);
            }
          }
          else if (v30 == 65293)
          {
            int v36 = objc_msgSend_usage(v14, v31, v32, v33, v34);
            if (v36 <= 4095)
            {
              switch(v36)
              {
                case 1:
                  uint64_t v37 = @"AppleRawCurrentCapacity";
                  goto LABEL_113;
                case 2:
                  uint64_t v37 = @"Nominal Capacity";
                  goto LABEL_113;
                case 3:
                  uint64_t v37 = @"Battery Case Cumulative Current";
                  goto LABEL_113;
                case 4:
                  uint64_t v37 = @"FamilyCode";
                  goto LABEL_113;
                case 5:
                  if (v25 == 129) {
                    uint64_t v37 = @"Set Address";
                  }
                  else {
                    uint64_t v37 = @"Address";
                  }
                  goto LABEL_113;
                case 6:
                  uint64_t v37 = @"Battery Case Charging Voltage";
                  goto LABEL_113;
                case 7:
                  if (v25 == 129) {
                    uint64_t v37 = @"Send Average Charging Current";
                  }
                  else {
                    uint64_t v37 = @"Battery Case Average Charging Current";
                  }
                  goto LABEL_113;
                case 11:
                  uint64_t v37 = @"Incoming Voltage";
                  goto LABEL_113;
                case 12:
                  uint64_t v37 = @"Incoming Current";
                  goto LABEL_113;
                case 13:
                  uint64_t v37 = @"Cell 0 Voltage";
                  goto LABEL_113;
                case 14:
                  uint64_t v37 = @"Cell 1 Voltage";
                  goto LABEL_113;
                case 16:
                  v42 = @"Lifetime Cell0 Max Voltage";
                  goto LABEL_106;
                case 17:
                  v42 = @"Lifetime Cell1 Max Voltage";
                  goto LABEL_106;
                case 18:
                  v42 = @"Lifetime Cell0 Min Voltage";
                  goto LABEL_106;
                case 19:
                  v42 = @"Lifetime Cell1 Min Voltage";
                  goto LABEL_106;
                case 20:
                  v42 = @"Lifetime Max Charge Current";
                  goto LABEL_106;
                case 21:
                  v42 = @"Lifetime Max Discharge Current";
                  goto LABEL_106;
                case 22:
                  v42 = @"Lifetime Max Temperature";
                  goto LABEL_106;
                case 23:
                  v42 = @"Lifetime Min Temperature";
                  goto LABEL_106;
                case 24:
                  v42 = @"Lifetime Firmware Runtime";
                  goto LABEL_106;
                case 25:
                  v42 = @"Lifetime Time Below Low Temperature";
                  goto LABEL_106;
                case 26:
                  v42 = @"Lifetime Time Above Low Temperature";
                  goto LABEL_106;
                case 27:
                  v42 = @"Lifetime Time Above Mid Temperature";
                  goto LABEL_106;
                case 28:
                  v42 = @"Lifetime Time Above High Temperature";
                  goto LABEL_106;
                case 29:
                  v42 = @"Kiosk Mode Count";
                  goto LABEL_106;
                case 30:
                  v42 = @"Attach Count Device Type 0";
                  goto LABEL_106;
                case 31:
                  v42 = @"Attach Count Device Type 1";
                  goto LABEL_106;
                case 32:
                  v42 = @"Attach Count AirPods Case";
                  goto LABEL_106;
                case 33:
                  v42 = @"Attach Count Other";
                  goto LABEL_106;
                case 34:
                  v42 = @"Attach Count Less Than 5W Adapter";
                  goto LABEL_106;
                case 35:
                  v42 = @"Attach Count 5W Adapter";
                  goto LABEL_106;
                case 36:
                  v42 = @"Attach Count 7.5W Adapter";
                  goto LABEL_106;
                case 37:
                  v42 = @"Attach Count 10.5W Adapter";
                  goto LABEL_106;
                case 38:
                  v42 = @"Attach Count 12W Adapter";
                  goto LABEL_106;
                case 39:
                  v42 = @"Attach Count 15W Adapter";
                  goto LABEL_106;
                case 40:
                  v42 = @"Attach Count 18 - 20W Adapter";
                  goto LABEL_106;
                case 41:
                  v42 = @"Attach Count Over 20W Adapter";
                  goto LABEL_106;
                case 42:
                  uint64_t v37 = @"Host Available Power dW";
                  goto LABEL_113;
                case 43:
                  uint64_t v37 = @"Rx Power Limit";
LABEL_113:
                  objc_msgSend_setPsKey_(v14, v31, (uint64_t)v37, v33, v34);
                  goto LABEL_114;
                case 44:
                  v42 = @"Lifetime Cell0 Max Q";
                  goto LABEL_106;
                case 45:
                  v42 = @"Lifetime Cell1 Max Q";
LABEL_106:
                  objc_msgSend_setPsKey_(v14, v31, (uint64_t)v42, v33, v34);
                  goto LABEL_107;
                default:
                  goto LABEL_114;
              }
            }
            switch(v36)
            {
              case 4096:
                objc_msgSend_setPsKey_(v14, v31, @"PowerStatus", v33, v34);
                break;
              case 4097:
                objc_msgSend_setPsKey_(v14, v31, @"ChargingStatus", v33, v34);
                break;
              case 4098:
                objc_msgSend_setPsKey_(v14, v31, @"InductiveStatus", v33, v34);
                break;
            }
          }
        }
        else if (v30 == 132)
        {
          int v38 = objc_msgSend_usage(v14, v31, v32, v33, v34);
          if (v38 > 85)
          {
            if (v38 <= 89)
            {
              if (v38 == 86)
              {
                if (v20 >= 5) {
                  objc_msgSend_setPsKey_(v14, v31, @"Startup Delay", v33, v34);
                }
              }
              else if (v38 == 87 && v20 >= 5)
              {
                objc_msgSend_setPsKey_(v14, v31, @"Delayed Remove Power", v33, v34);
              }
            }
            else if (v38 == 90)
            {
              if (v20 >= 5) {
                objc_msgSend_setPsKey_(v14, v31, @"Enable Audible Alarm", v33, v34);
              }
            }
            else if (v38 == 98)
            {
              objc_msgSend_setPsKey_(v14, v31, @"Internal Failure", v33, v34);
            }
            else if (v38 == 109 && v20 >= 5)
            {
              objc_msgSend_setPsKey_(v14, v31, @"Enable Charging", v33, v34);
            }
          }
          else if (v38 <= 53)
          {
            if (v38 == 48)
            {
              objc_msgSend_setPsKey_(v14, v31, @"Voltage", v33, v34);
            }
            else if (v38 == 49)
            {
              objc_msgSend_setPsKey_(v14, v31, @"Current", v33, v34);
            }
          }
          else
          {
            switch(v38)
            {
              case '6':
                if (v25 == 129) {
                  objc_msgSend_setPsKey_(v14, v31, @"Send Current Temperature", v33, v34);
                }
                else {
                  objc_msgSend_setPsKey_(v14, v31, @"Temperature", v33, v34);
                }
                break;
              case '@':
                if (v20 >= 5) {
                  objc_msgSend_setPsKey_(v14, v31, @"Set Required Voltage", v33, v34);
                }
                break;
              case 'A':
                if (v20 > 4)
                {
                  if (v25 == 129) {
                    objc_msgSend_setPsKey_(v14, v31, @"Set Current Limit", v33, v34);
                  }
                }
                else
                {
                  objc_msgSend_setPsKey_(v14, v31, @"Battery Case Available Current", v33, v34);
                }
                break;
            }
          }
        }
        else if (v30 == 133)
        {
          int v35 = objc_msgSend_usage(v14, v31, v32, v33, v34);
          switch(v35)
          {
            case 'e':
            case 'f':
              if (v25 == 129) {
                objc_msgSend_setPsKey_(v14, v31, @"Send Current State of Charge", v33, v34);
              }
              else {
                objc_msgSend_setPsKey_(v14, v31, @"Current Capacity", v33, v34);
              }
              break;
            case 'g':
              objc_msgSend_setPsKey_(v14, v31, @"Max Capacity", v33, v34);
              break;
            case 'h':
              objc_msgSend_setPsKey_(v14, v31, @"Time to Empty", v33, v34);
              break;
            case 'i':
              break;
            case 'j':
              objc_msgSend_setPsKey_(v14, v31, @"Time to Full Charge", v33, v34);
              break;
            case 'k':
              objc_msgSend_setPsKey_(v14, v31, @"CycleCount", v33, v34);
              break;
            default:
              if ((v35 - 68) >= 2)
              {
                if (v35 == 208) {
                  objc_msgSend_setPsKey_(v14, v31, @"Power Source State", v33, v34);
                }
              }
              else
              {
                objc_msgSend_setPsKey_(v14, v31, @"Is Charging", v33, v34);
              }
              break;
          }
        }
LABEL_114:
        uint64_t v43 = objc_msgSend_psKey(v14, v31, v32, v33, v34);

        if (!v43)
        {
          id v64 = 0;
          goto LABEL_138;
        }
        int v135 = v25;
        unsigned int v47 = v20;
        p_elements = &self->_elements;
        objc_msgSend_addObjectsFromArray_(v15, v44, (uint64_t)self->_elements.input, v45, v46);
        objc_msgSend_addObjectsFromArray_(v15, v49, (uint64_t)self->_elements.output, v50, v51);
        objc_msgSend_addObjectsFromArray_(v15, v52, (uint64_t)self->_elements.feature, v53, v54);
        uint64_t v59 = objc_msgSend_psKey(v14, v55, v56, v57, v58);
        uint64_t v60 = self;
        id v138 = v15;
        uint64_t v63 = objc_msgSend_copyElements_psKey_(self, v61, (uint64_t)v15, (uint64_t)v59, v62);

        long long v143 = 0u;
        long long v144 = 0u;
        long long v141 = 0u;
        long long v142 = 0u;
        id v64 = v63;
        uint64_t v66 = objc_msgSend_countByEnumeratingWithState_objects_count_(v64, v65, (uint64_t)&v141, (uint64_t)v151, 16);
        if (v66)
        {
          uint64_t v71 = v66;
          uint64_t v72 = *(void *)v142;
          do
          {
            for (uint64_t j = 0; j != v71; ++j)
            {
              if (*(void *)v142 != v72) {
                objc_enumerationMutation(v64);
              }
              v74 = *(void **)(*((void *)&v141 + 1) + 8 * j);
              int v75 = objc_msgSend_usagePage(v74, v67, v68, v69, v70);
              if (v75 == objc_msgSend_usagePage(v14, v76, v77, v78, v79))
              {
                int v80 = objc_msgSend_usage(v74, v67, v68, v69, v70);
                if (v80 == objc_msgSend_usage(v14, v81, v82, v83, v84))
                {
                  objc_msgSend_type(v74, v67, v68, v69, v70);
                  objc_msgSend_type(v14, v85, v86, v87, v88);
                }
              }
            }
            uint64_t v71 = objc_msgSend_countByEnumeratingWithState_objects_count_(v64, v67, (uint64_t)&v141, (uint64_t)v151, 16);
          }
          while (v71);
        }

        self = v60;
        capabilities = v60->_capabilities;
        v94 = objc_msgSend_psKey(v14, v90, v91, v92, v93);
        objc_msgSend_addObject_(capabilities, v95, (uint64_t)v94, v96, v97);

        if (v47 <= 4)
        {
          objc_msgSend_addObject_(p_elements->input, v98, (uint64_t)v14, v99, v100);
LABEL_130:
          id v15 = v138;
          uint64_t i = v139;
          goto LABEL_138;
        }
        if (v135 == 129)
        {
          objc_msgSend_addObject_(p_elements->output, v98, (uint64_t)v14, v99, v100);
          goto LABEL_130;
        }
        objc_msgSend_addObject_(p_elements->feature, v98, (uint64_t)v14, v99, v100);
        v101 = _IOHIDLogCategory();
        if (os_log_type_enabled(v101, OS_LOG_TYPE_DEFAULT))
        {
          int v106 = objc_msgSend_usagePage(v14, v102, v103, v104, v105);
          int v111 = objc_msgSend_usage(v14, v107, v108, v109, v110);
          *(_DWORD *)buf = 67109376;
          *(_DWORD *)v150 = v106;
          *(_WORD *)&v150[4] = 1024;
          *(_DWORD *)&v150[6] = v111;
          _os_log_impl(&dword_240766000, v101, OS_LOG_TYPE_DEFAULT, "Feature element (UP : %x, U : %x) added for polling", buf, 0xEu);
        }

        uint64_t i = v139;
        if (!v60->_timer)
        {
          v112 = _IOHIDLogCategory();
          if (os_log_type_enabled(v112, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_240766000, v112, OS_LOG_TYPE_DEFAULT, "Create time for polling feature reports", buf, 2u);
          }

          id v113 = objc_alloc(MEMORY[0x263EFFA20]);
          v118 = objc_msgSend_date(MEMORY[0x263EFF910], v114, v115, v116, v117);
          v140[0] = MEMORY[0x263EF8330];
          v140[1] = 3221225472;
          v140[2] = sub_24076E0F4;
          v140[3] = &unk_2650D3FF0;
          v140[4] = v60;
          uint64_t v120 = objc_msgSend_initWithFireDate_interval_repeats_block_(v113, v119, (uint64_t)v118, 1, (uint64_t)v140, 5.0);
          timer = v60->_timer;
          v60->_timer = (NSTimer *)v120;
        }
        id v15 = v138;
LABEL_138:
      }
      uint64_t v137 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v122, (uint64_t)&v145, (uint64_t)v152, 16);
    }
    while (v137);
  }
  objc_msgSend_addObjectsFromArray_(self->_commandElements, v5, (uint64_t)self->_elements.output, v6, v7);
  objc_msgSend_addObjectsFromArray_(self->_commandElements, v123, (uint64_t)self->_elements.feature, v124, v125);
  objc_msgSend_addObjectsFromArray_(self->_eventElements, v126, (uint64_t)self->_elements.input, v127, v128);
  objc_msgSend_addObjectsFromArray_(self->_eventElements, v129, (uint64_t)self->_elements.feature, v130, v131);
  v132 = _IOHIDLogCategory();
  if (os_log_type_enabled(v132, OS_LOG_TYPE_DEFAULT))
  {
    v133 = self->_capabilities;
    *(_DWORD *)buf = 138412290;
    *(void *)v150 = v133;
    _os_log_impl(&dword_240766000, v132, OS_LOG_TYPE_DEFAULT, "capabilities: %@", buf, 0xCu);
  }
}

- (id)copyElements:(id)a3 psKey:(id)a4
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v8 = v5;
  uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v9, (uint64_t)&v25, (uint64_t)v29, 16);
  if (v10)
  {
    uint64_t v15 = v10;
    uint64_t v16 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v26 != v16) {
          objc_enumerationMutation(v8);
        }
        uint64_t v18 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        uint64_t v19 = objc_msgSend_psKey(v18, v11, v12, v13, v14, (void)v25);
        int isEqualToString = objc_msgSend_isEqualToString_(v19, v20, (uint64_t)v6, v21, v22);

        if (isEqualToString) {
          objc_msgSend_addObject_(v7, v11, (uint64_t)v18, v13, v14);
        }
      }
      uint64_t v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v11, (uint64_t)&v25, (uint64_t)v29, 16);
    }
    while (v15);
  }

  return v7;
}

- (id)latestElement:(id)a3 psKey:(id)a4
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v10 = (id)objc_msgSend_copyElements_psKey_(self, v8, (uint64_t)v6, (uint64_t)v7, v9);
  uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v11, (uint64_t)&v29, (uint64_t)v33, 16);
  if (v12)
  {
    uint64_t v17 = v12;
    uint64_t v18 = 0;
    unint64_t v19 = 0;
    uint64_t v20 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v30 != v20) {
          objc_enumerationMutation(v10);
        }
        uint64_t v22 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        if (objc_msgSend_timestamp(v22, v13, v14, v15, v16, (void)v29) > v19)
        {
          id v23 = v22;

          unint64_t v19 = objc_msgSend_timestamp(v23, v24, v25, v26, v27);
          uint64_t v18 = v23;
        }
      }
      uint64_t v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v13, (uint64_t)&v29, (uint64_t)v33, 16);
    }
    while (v17);
  }
  else
  {
    uint64_t v18 = 0;
  }

  return v18;
}

- (void)updateElements:(id)a3
{
  uint64_t v106 = *MEMORY[0x263EF8340];
  id v4 = a3;
  transaction = self->_transaction;
  if (!transaction)
  {
    id v6 = _IOHIDLogCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_240775584();
    }
    goto LABEL_7;
  }
  if (((unsigned int (*)(IOHIDDeviceTransactionInterface **, void, void))(*transaction)->setDirection)(transaction, 0, 0))
  {
    id v6 = _IOHIDLogCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_240775620();
    }
LABEL_7:

    goto LABEL_8;
  }
  long long v96 = 0u;
  long long v97 = 0u;
  long long v94 = 0u;
  long long v95 = 0u;
  id v7 = v4;
  uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v8, (uint64_t)&v94, (uint64_t)v105, 16);
  if (v9)
  {
    uint64_t v14 = v9;
    id v88 = v4;
    uint64_t v15 = 0;
    uint64_t v16 = *(void *)v95;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v95 != v16) {
          objc_enumerationMutation(v7);
        }
        uint64_t v18 = *(void **)(*((void *)&v94 + 1) + 8 * i);
        if (!objc_msgSend_isConstant(v18, v10, v11, v12, v13)
          || (objc_msgSend_isUpdated(v18, v10, v11, v12, v13) & 1) == 0)
        {
          unint64_t v19 = self->_transaction;
          addElement = (*v19)->addElement;
          uint64_t v21 = objc_msgSend_elementRef(v18, v10, v11, v12, v13);
          int v22 = ((uint64_t (*)(IOHIDDeviceTransactionInterface **, uint64_t, void))addElement)(v19, v21, 0);
          if (v22)
          {
            int v23 = v22;
            uint64_t v24 = _IOHIDLogCategory();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 67109120;
              int v99 = v23;
              _os_log_impl(&dword_240766000, v24, OS_LOG_TYPE_DEFAULT, "Failed to add element to transaction %x", buf, 8u);
            }
          }
          else
          {
            ++v15;
          }
        }
      }
      uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v10, (uint64_t)&v94, (uint64_t)v105, 16);
    }
    while (v14);

    id v4 = v88;
    if (v15)
    {
      if (((unsigned int (*)(IOHIDDeviceTransactionInterface **, void, void, void, void))(*self->_transaction)->commit)(self->_transaction, 0, 0, 0, 0))
      {
        ((void (*)(IOHIDDeviceTransactionInterface **, void))(*self->_transaction)->clear)(self->_transaction, 0);
        id v6 = _IOHIDLogCategory();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
          sub_2407755B8();
        }
        goto LABEL_7;
      }
      long long v92 = 0u;
      long long v93 = 0u;
      long long v90 = 0u;
      long long v91 = 0u;
      id v26 = v7;
      uint64_t v28 = objc_msgSend_countByEnumeratingWithState_objects_count_(v26, v27, (uint64_t)&v90, (uint64_t)v104, 16);
      if (!v28) {
        goto LABEL_56;
      }
      uint64_t v34 = v28;
      uint64_t v35 = *(void *)v91;
      *(void *)&long long v33 = 67109632;
      long long v87 = v33;
LABEL_33:
      uint64_t v36 = 0;
      while (1)
      {
        if (*(void *)v91 != v35) {
          objc_enumerationMutation(v26);
        }
        uint64_t v37 = *(void **)(*((void *)&v90 + 1) + 8 * v36);
        uint64_t v89 = 0;
        if (objc_msgSend_isConstant(v37, v29, v30, v31, v32, v87)
          && (objc_msgSend_isUpdated(v37, v29, v30, v31, v32) & 1) != 0)
        {
          goto LABEL_51;
        }
        int v38 = self->_transaction;
        getValue = (*v38)->getValue;
        uint64_t v40 = objc_msgSend_elementRef(v37, v29, v30, v31, v32);
        int v41 = ((uint64_t (*)(IOHIDDeviceTransactionInterface **, uint64_t, uint64_t *, void))getValue)(v38, v40, &v89, 0);
        if (v41) {
          BOOL v45 = 1;
        }
        else {
          BOOL v45 = v89 == 0;
        }
        if (v45)
        {
          int v46 = v41;
          unsigned int v47 = _IOHIDLogCategory();
          BOOL v48 = os_log_type_enabled(v47, OS_LOG_TYPE_ERROR);
          if (v46)
          {
            if (v48)
            {
              int v53 = objc_msgSend_usagePage(v37, v49, v50, v51, v52);
              int v58 = objc_msgSend_usage(v37, v54, v55, v56, v57);
              *(_DWORD *)buf = v87;
              int v99 = v53;
              __int16 v100 = 1024;
              int v101 = v58;
              __int16 v102 = 1024;
              int v103 = v46;
              uint64_t v59 = v47;
              uint64_t v60 = "Unable to update element UP: %x, U : %x failed(%#x)";
              uint32_t v61 = 20;
LABEL_54:
              _os_log_error_impl(&dword_240766000, v59, OS_LOG_TYPE_ERROR, v60, buf, v61);
            }
          }
          else if (v48)
          {
            int v80 = objc_msgSend_usagePage(v37, v49, v50, v51, v52);
            int v85 = objc_msgSend_usage(v37, v81, v82, v83, v84);
            *(_DWORD *)buf = 67109376;
            int v99 = v80;
            __int16 v100 = 1024;
            int v101 = v85;
            uint64_t v59 = v47;
            uint64_t v60 = "Unable to update element UP: %x, U : %x no value";
            uint32_t v61 = 14;
            goto LABEL_54;
          }
        }
        else
        {
          objc_msgSend_setValueRef_(v37, v42, v89, v43, v44);
          objc_msgSend_setIsUpdated_(v37, v62, 1, v63, v64);
          if (!objc_msgSend_isConstant(v37, v65, v66, v67, v68)) {
            goto LABEL_51;
          }
          unsigned int v47 = _IOHIDLogCategory();
          if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
          {
            int v74 = objc_msgSend_usagePage(v37, v70, v71, v72, v73);
            int v79 = objc_msgSend_usage(v37, v75, v76, v77, v78);
            *(_DWORD *)buf = 67109376;
            int v99 = v74;
            __int16 v100 = 1024;
            int v101 = v79;
            _os_log_impl(&dword_240766000, v47, OS_LOG_TYPE_DEFAULT, "Constant feature element UP : %x , U : %x updated", buf, 0xEu);
          }
        }

LABEL_51:
        if (v34 == ++v36)
        {
          uint64_t v86 = objc_msgSend_countByEnumeratingWithState_objects_count_(v26, v29, (uint64_t)&v90, (uint64_t)v104, 16);
          uint64_t v34 = v86;
          if (!v86)
          {
LABEL_56:

            ((void (*)(IOHIDDeviceTransactionInterface **, void))(*self->_transaction)->clear)(self->_transaction, 0);
            id v4 = v88;
            goto LABEL_8;
          }
          goto LABEL_33;
        }
      }
    }
  }
  else
  {
  }
  uint64_t v25 = _IOHIDLogCategory();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_240766000, v25, OS_LOG_TYPE_DEFAULT, "Nothing to commit skip", buf, 2u);
  }

  ((void (*)(IOHIDDeviceTransactionInterface **, void))(*self->_transaction)->clear)(self->_transaction, 0);
LABEL_8:
}

- (BOOL)updateEvent
{
  uint64_t v267 = *MEMORY[0x263EF8340];
  objc_msgSend_removeAllObjects(self->_upsUpdatedEvent, a2, v2, v3, v4);
  long long v259 = 0u;
  long long v260 = 0u;
  long long v257 = 0u;
  long long v258 = 0u;
  obuint64_t j = self->_eventElements;
  uint64_t v255 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v6, (uint64_t)&v257, (uint64_t)v266, 16);
  if (!v255)
  {
    char v256 = 0;
    uint64_t v249 = 0;
    uint64_t v250 = 0;
    uint64_t v248 = 0;
    goto LABEL_99;
  }
  char v256 = 0;
  uint64_t v249 = 0;
  uint64_t v250 = 0;
  uint64_t v248 = 0;
  uint64_t v254 = *(void *)v258;
  do
  {
    uint64_t v11 = 0;
    do
    {
      if (*(void *)v258 != v254) {
        objc_enumerationMutation(obj);
      }
      uint64_t v12 = *(void **)(*((void *)&v257 + 1) + 8 * v11);
      eventElements = self->_eventElements;
      uint64_t v14 = objc_msgSend_psKey(v12, v7, v8, v9, v10);
      uint64_t v17 = objc_msgSend_latestElement_psKey_(self, v15, (uint64_t)eventElements, (uint64_t)v14, v16);

      if (!v17 || (objc_msgSend_isEqual_(v12, v18, (uint64_t)v17, v20, v21) & 1) != 0)
      {
        upsEvent = self->_upsEvent;
        int v23 = objc_msgSend_psKey(v12, v18, v19, v20, v21);
        uint64_t v27 = objc_msgSend_objectForKeyedSubscript_(upsEvent, v24, (uint64_t)v23, v25, v26);

        objc_msgSend_psKey(v12, v28, v29, v30, v31);
        uint64_t v32 = (__CFString *)objc_claimAutoreleasedReturnValue();
        uint64_t v37 = objc_msgSend_integerValue(v12, v33, v34, v35, v36);
        LODWORD(upsEvent) = objc_msgSend_unitExponent(v12, v38, v39, v40, v41);
        int v46 = objc_msgSend_unitExponent(v12, v42, v43, v44, v45);
        int v51 = v46 - 16;
        if (upsEvent < 8) {
          int v51 = v46;
        }
        double v52 = (double)v51;
        int v53 = objc_msgSend_usagePage(v12, v47, v48, v49, v50);
        if (v53 != 65293)
        {
          if (v53 == 133)
          {
            int v88 = objc_msgSend_usage(v12, v54, v55, v56, v57);
            if (v88 <= 100)
            {
              if (v88 == 68)
              {
                uint64_t v178 = objc_msgSend_integerValue(v12, v54, v59, v56, v57);
                uint64_t v179 = MEMORY[0x263EFFA88];
                v180 = (void *)MEMORY[0x263EFFA80];
                if (v178) {
                  v180 = (void *)MEMORY[0x263EFFA88];
                }
                uint64_t v136 = v180;
                HIDWORD(v250) |= objc_msgSend_integerValue(v12, v181, v182, v183, v184) != 0;
                LODWORD(v249) = objc_msgSend_isEqual_(v27, v185, v179, v186, v187);
              }
              else
              {
                if (v88 != 69) {
                  goto LABEL_57;
                }
                uint64_t v139 = objc_msgSend_integerValue(v12, v54, v59, v56, v57);
                v140 = &unk_26F4E4698;
                if (!v139) {
                  v140 = &unk_26F4E4680;
                }
                uint64_t v136 = v140;
                LODWORD(v250) = v250 | (objc_msgSend_integerValue(v12, v141, v142, v143, v144) != 0);
                HIDWORD(v248) = objc_msgSend_isEqual_(v27, v145, (uint64_t)&unk_26F4E4680, v146, v147);
              }
            }
            else
            {
              switch(v88)
              {
                case 'e':
                case 'f':
                  if (objc_msgSend_unit(v12, v54, v59, v56, v57) == 1052673) {
                    uint64_t v37 = (int)((double)(int)v37 / 3.6);
                  }
                  if (!objc_msgSend_unit(v12, v89, v90, v91, v92))
                  {
                    long long v93 = objc_msgSend_numberWithInt_(NSNumber, v54, v37, v56, v57);
                    char isEqual = objc_msgSend_isEqual_(v27, v94, (uint64_t)v93, v95, v96);

                    if ((isEqual & 1) == 0)
                    {
                      int v99 = objc_msgSend_integerValue(v12, v54, v98, v56, v57);
                      __int16 v102 = objc_msgSend_copyElements_psKey_(self, v100, (uint64_t)self->_eventElements, @"Time to Full Charge", v101);
                      v107 = v102;
                      if (v102 && objc_msgSend_count(v102, v103, v104, v105, v106))
                      {
                        int v246 = v99;
                        uint64_t v109 = objc_msgSend_objectAtIndex_(v107, v103, 0, v108, v106);
                        uint64_t v245 = objc_msgSend_integerValue(v109, v110, v111, v112, v113);
                        v251 = v109;
                        if ((objc_msgSend_isEqual_(v109, v114, (uint64_t)v27, v115, v116) & 1) == 0)
                        {
                          v118 = objc_msgSend_numberWithInt_(NSNumber, v103, ((int)((double)(100 - v246) / 100.0 * (double)v245) / 60), v117, v106);
                          objc_msgSend_setObject_forKeyedSubscript_(self->_upsUpdatedEvent, v119, (uint64_t)v118, @"Time to Full Charge", v120);
                        }
                      }
                      else
                      {
                        v251 = 0;
                      }
                      v196 = objc_msgSend_copyElements_psKey_(self, v103, (uint64_t)self->_eventElements, @"Time to Empty", v106);

                      if (v196 && objc_msgSend_count(v196, v197, v198, v199, v200))
                      {
                        v247 = objc_msgSend_objectAtIndex_(v196, v201, 0, v202, v203);

                        v252 = NSNumber;
                        uint64_t v208 = objc_msgSend_integerValue(v247, v204, v205, v206, v207);
                        v212 = objc_msgSend_numberWithInteger_(v252, v209, v208 / 60, v210, v211);
                        objc_msgSend_setObject_forKeyedSubscript_(self->_upsUpdatedEvent, v213, (uint64_t)v212, @"Time to Empty", v214);

                        v215 = v247;
                      }
                      else
                      {
                        v215 = v251;
                      }
                    }
                  }
                  goto LABEL_57;
                case 'g':
                  goto LABEL_54;
                case 'h':
                  objc_msgSend_numberWithInt_(NSNumber, v54, ((int)v37 / 60), v56, v57);
                  goto LABEL_58;
                case 'i':
                  goto LABEL_57;
                case 'j':
                  v164 = objc_msgSend_copyElements_psKey_(self, v54, (uint64_t)self->_eventElements, @"Current Capacity", v57);
                  v169 = v164;
                  if (v164 && objc_msgSend_count(v164, v165, v166, v167, v168))
                  {
                    v173 = objc_msgSend_objectAtIndex_(v169, v170, 0, v171, v172);
                    uint64_t v37 = ((int)((double)(100
                                                                    - objc_msgSend_integerValue(v173, v174, v175, v176, v177))/ 100.0* (double)(int)v37)/ 60);
                  }
                  goto LABEL_57;
                default:
                  if (v88 != 208) {
                    goto LABEL_57;
                  }
                  uint64_t v155 = objc_msgSend_integerValue(v12, v54, v59, v56, v57);
                  v156 = @"Battery Power";
                  if (v155) {
                    v156 = @"AC Power";
                  }
                  uint64_t v136 = v156;
                  HIDWORD(v249) |= objc_msgSend_integerValue(v12, v157, v158, v159, v160) != 0;
                  LODWORD(v248) = objc_msgSend_isEqual_(v27, v161, @"AC Power", v162, v163);
                  break;
              }
            }
            goto LABEL_60;
          }
          if (v53 != 132) {
            goto LABEL_57;
          }
          int v58 = objc_msgSend_usage(v12, v54, v55, v56, v57);
          if (v58 <= 53)
          {
            if (v58 != 48)
            {
              if (v58 != 49) {
                goto LABEL_57;
              }
              goto LABEL_44;
            }
LABEL_42:
            uint64_t v37 = (1000 * v37);
            if (objc_msgSend_unit(v12, v54, v59, v56, v57) != 15782177) {
              goto LABEL_57;
            }
            double v137 = v52 + -7.0;
LABEL_46:
            double v138 = __exp10(v137) * (double)(int)v37;
          }
          else
          {
            if (v58 != 54)
            {
              if (v58 != 65)
              {
                if (v58 == 98)
                {
                  uint64_t v60 = objc_msgSend_integerValue(v12, v54, v59, v56, v57);
                  uint32_t v61 = &unk_26F4E4698;
                  if (v60) {
                    uint32_t v61 = &unk_26F4E4680;
                  }
                  uint64_t v62 = v61;
                  goto LABEL_59;
                }
LABEL_57:
                objc_msgSend_numberWithInt_(NSNumber, v54, v37, v56, v57);
LABEL_58:
                uint64_t v62 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
LABEL_59:
                uint64_t v136 = v62;
LABEL_60:
                char v148 = objc_msgSend_isEqual_(v136, v54, (uint64_t)v27, v56, v57);
                if (objc_msgSend_timestamp(v12, v149, v150, v151, v152) && (v148 & 1) == 0) {
                  objc_msgSend_setObject_forKeyedSubscript_(self->_upsUpdatedEvent, v153, (uint64_t)v136, (uint64_t)v32, v154);
                }
                v256 |= v148 ^ 1;

                goto LABEL_64;
              }
LABEL_44:
              uint64_t v37 = (1000 * v37);
              if (objc_msgSend_unit(v12, v54, v59, v56, v57) != 1048577) {
                goto LABEL_57;
              }
              double v137 = v52;
              goto LABEL_46;
            }
            if (objc_msgSend_unit(v12, v54, v59, v56, v57) != 65537) {
              goto LABEL_57;
            }
            double v138 = (double)(int)(__exp10(v52) * (double)(int)v37) + -273.15;
          }
LABEL_56:
          uint64_t v37 = (int)v138;
          goto LABEL_57;
        }
        int v121 = objc_msgSend_usage(v12, v54, v55, v56, v57);
        if ((v121 - 16) >= 0x1E)
        {
          if (v121 <= 4095)
          {
            switch(v121)
            {
              case 1:
              case 2:
LABEL_54:
                if (objc_msgSend_unit(v12, v54, v59, v56, v57) != 1052673) {
                  goto LABEL_57;
                }
                double v138 = (double)(int)v37 / 3.6;
                break;
              case 3:
              case 12:
                goto LABEL_44;
              case 5:
                objc_msgSend_dataValue(v12, v54, v59, v56, v57);
                uint64_t v136 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
                goto LABEL_35;
              case 6:
              case 11:
              case 13:
              case 14:
                goto LABEL_42;
              case 7:
                uint64_t v37 = (1000 * v37);
                if (objc_msgSend_unit(v12, v54, v59, v56, v57) == 1048577) {
                  uint64_t v37 = (int)(__exp10(v52) * (double)(int)v37);
                }
                v193 = objc_msgSend_numberWithInt_(NSNumber, v216, v37, v217, v218);
                objc_msgSend_setObject_forKeyedSubscript_(self->_debugInformation, v219, (uint64_t)v193, @"Battery Case Average Charging Current", v220);
                goto LABEL_94;
              default:
                goto LABEL_57;
            }
            goto LABEL_56;
          }
          switch(v121)
          {
            case 4096:
              v221 = NSNumber;
              uint64_t v222 = objc_msgSend_integerValue(v12, v54, v59, v56, v57);
              v193 = objc_msgSend_numberWithInteger_(v221, v223, v222, v224, v225);
              objc_msgSend_setObject_forKeyedSubscript_(self->_debugInformation, v226, (uint64_t)v193, @"PowerStatus", v227);
              break;
            case 4097:
              v228 = NSNumber;
              uint64_t v229 = objc_msgSend_integerValue(v12, v54, v59, v56, v57);
              v193 = objc_msgSend_numberWithInteger_(v228, v230, v229, v231, v232);
              objc_msgSend_setObject_forKeyedSubscript_(self->_debugInformation, v233, (uint64_t)v193, @"ChargingStatus", v234);
              break;
            case 4098:
              v188 = NSNumber;
              uint64_t v189 = objc_msgSend_integerValue(v12, v54, v59, v56, v57);
              v193 = objc_msgSend_numberWithInteger_(v188, v190, v189, v191, v192);
              objc_msgSend_setObject_forKeyedSubscript_(self->_debugInformation, v194, (uint64_t)v193, @"InductiveStatus", v195);
              break;
            default:
              goto LABEL_57;
          }
LABEL_94:

          uint64_t v136 = self->_debugInformation;
        }
        else
        {
          v122 = NSNumber;
          uint64_t v123 = objc_msgSend_integerValue(v12, v54, v59, v56, v57);
          uint64_t v127 = objc_msgSend_numberWithInteger_(v122, v124, v123, v125, v126);
          debugInformation = self->_debugInformation;
          v133 = objc_msgSend_psKey(v12, v129, v130, v131, v132);
          objc_msgSend_setObject_forKeyedSubscript_(debugInformation, v134, (uint64_t)v127, (uint64_t)v133, v135);

          uint64_t v136 = self->_debugInformation;
        }
        uint64_t v32 = @"Debug Information";
LABEL_35:
        if (!v136) {
          goto LABEL_57;
        }
        goto LABEL_60;
      }
      uint64_t v27 = _IOHIDLogCategory();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        int v67 = objc_msgSend_usagePage(v12, v63, v64, v65, v66);
        int v72 = objc_msgSend_usage(v12, v68, v69, v70, v71);
        int v77 = objc_msgSend_type(v12, v73, v74, v75, v76);
        uint64_t v82 = objc_msgSend_integerValue(v12, v78, v79, v80, v81);
        long long v87 = objc_msgSend_psKey(v12, v83, v84, v85, v86);
        *(_DWORD *)buf = 67110146;
        *(_DWORD *)v262 = v67;
        *(_WORD *)&v262[4] = 1024;
        *(_DWORD *)&v262[6] = v72;
        LOWORD(v263) = 1024;
        *(_DWORD *)((char *)&v263 + 2) = v77;
        HIWORD(v263) = 2048;
        *(void *)v264 = v82;
        *(_WORD *)&v264[8] = 2112;
        v265 = v87;
        _os_log_impl(&dword_240766000, v27, OS_LOG_TYPE_DEFAULT, "Skipping duplicate element (UP : %x U : %x Type : %u IV: %ld) with key %@\n", buf, 0x28u);
      }
LABEL_64:

      ++v11;
    }
    while (v255 != v11);
    uint64_t v235 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v7, (uint64_t)&v257, (uint64_t)v266, 16);
    uint64_t v255 = v235;
  }
  while (v235);
LABEL_99:

  v236 = _IOHIDLogCategory();
  if (os_log_type_enabled(v236, OS_LOG_TYPE_DEFAULT))
  {
    v237 = "No";
    if ((v249 & 0x100000000) != 0) {
      v238 = "Yes";
    }
    else {
      v238 = "No";
    }
    if ((v250 & 0x100000000) != 0) {
      v239 = "Yes";
    }
    else {
      v239 = "No";
    }
    *(_DWORD *)buf = 136315650;
    *(void *)v262 = v238;
    *(_WORD *)&v262[8] = 2080;
    v263 = v239;
    if (v250) {
      v237 = "Yes";
    }
    *(_WORD *)v264 = 2080;
    *(void *)&v264[2] = v237;
    _os_log_impl(&dword_240766000, v236, OS_LOG_TYPE_DEFAULT, "Power Source status isACSource : %s , isCharging : %s , isDischarging : %s", buf, 0x20u);
  }

  if (((HIDWORD(v249) ^ v248) & 1) != 0
    || ((HIDWORD(v250) ^ v249) & 1) != 0
    || ((v250 ^ HIDWORD(v248)) & 1) != 0)
  {
    upsUpdatedEvent = self->_upsUpdatedEvent;
    if ((v250 | ~BYTE4(v250)) & ~BYTE4(v249)) {
      objc_msgSend_setObject_forKeyedSubscript_(upsUpdatedEvent, v240, @"Battery Power", @"Power Source State", v242);
    }
    else {
      objc_msgSend_setObject_forKeyedSubscript_(upsUpdatedEvent, v240, @"AC Power", @"Power Source State", v242);
    }
  }
  objc_msgSend_addEntriesFromDictionary_(self->_upsEvent, v240, (uint64_t)self->_upsUpdatedEvent, v241, v242);
  return v256 & 1;
}

- (void)valueAvailableCallback:(int)a3
{
  if (!a3)
  {
    do
    {
      IOHIDValueRef value = 0;
      int v6 = ((uint64_t (*)(IOHIDDeviceQueueInterface **, IOHIDValueRef *, void, void))(*self->_queue)->copyNextValue)(self->_queue, &value, 0, 0);
      if (value)
      {
        IOHIDElementRef Element = IOHIDValueGetElement(value);
        uint64_t v8 = [HIDLibElement alloc];
        uint64_t v12 = objc_msgSend_initWithElementRef_(v8, v9, (uint64_t)Element, v10, v11);
        uint64_t v16 = objc_msgSend_indexOfObject_(self->_elements.input, v13, (uint64_t)v12, v14, v15);
        uint64_t v20 = objc_msgSend_objectAtIndex_(self->_elements.input, v17, v16, v18, v19);
        objc_msgSend_setValueRef_(v20, v21, (uint64_t)value, v22, v23);
        CFRelease(value);
      }
    }
    while (!v6);
  }
  objc_msgSend_updateEvent(self, a2, *(uint64_t *)&a3, v3, v4);
  if (self->_eventCallback)
  {
    sub_24076E2BC(self->_upsEvent, @"dispatchEvent");
    ((void (*)(void *, void, void *, IOUPSPlugInInterface_v140 **, NSMutableDictionary *))self->_eventCallback)(self->_eventTarget, 0, self->_eventRefcon, &self->_ups, self->_upsUpdatedEvent);
  }
}

- (void)initialEventUpdate
{
  p_elements = &self->_elements;
  objc_msgSend_updateElements_(self, a2, (uint64_t)self->_elements.input, v2, v3);
  objc_msgSend_updateElements_(self, v6, (uint64_t)p_elements->feature, v7, v8);

  objc_msgSend_updateEvent(self, v9, v10, v11, v12);
}

- (BOOL)pollEventUpdate
{
  objc_msgSend_updateElements_(self, a2, (uint64_t)self->_elements.feature, v2, v3);

  return objc_msgSend_updateEvent(self, v5, v6, v7, v8);
}

- (int)start:(id)a3 service:(unsigned int)a4
{
  kern_return_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  CFUUIDRef v10;
  CFUUIDRef v11;
  kern_return_t v12;
  IOCFPlugInInterface **v13;
  HRESULT (__cdecl *QueryInterface)(void *, REFIID, LPVOID *);
  CFUUIDRef v15;
  CFUUIDBytes v16;
  IOHIDDeviceTimeStampedDeviceInterface ***p_device;
  int v18;
  int v19;
  IOHIDDeviceTimeStampedDeviceInterface **v20;
  HRESULT (__cdecl *v21)(void *, REFIID, LPVOID *);
  CFUUIDRef v22;
  CFUUIDBytes v23;
  IOHIDDeviceQueueInterface ***p_queue;
  IOHIDDeviceTimeStampedDeviceInterface **v25;
  HRESULT (__cdecl *v26)(void *, REFIID, LPVOID *);
  CFUUIDRef v27;
  CFUUIDBytes v28;
  IOHIDDeviceTransactionInterface ***p_transaction;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  IOHIDDeviceQueueInterface **v33;
  IOReturn (__cdecl *setDepth)(void *, uint32_t, IOOptionBits);
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  NSMutableArray *v40;
  const char *v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t i;
  void *v50;
  IOHIDDeviceQueueInterface **v51;
  IOReturn (__cdecl *addElement)(void *, IOHIDElementRef, IOOptionBits);
  uint64_t v53;
  int v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  int v59;
  NSObject *v61;
  NSObject *v62;
  long long v63;
  long long v64;
  long long v65;
  long long v66;
  SInt32 theScore;
  IOCFPlugInInterface **theInterface;
  CFTypeRef cf;
  CFMutableDictionaryRef properties;
  unsigned char v71[128];
  uint64_t v72;

  int v72 = *MEMORY[0x263EF8340];
  cf = 0;
  properties = 0;
  theInterface = 0;
  theScore = 0;
  uint64_t v6 = IORegistryEntryCreateCFProperties(a4, &properties, (CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
  if (v6)
  {
    uint64_t v59 = v6;
    uint32_t v61 = _IOHIDLogCategory();
    if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR)) {
      sub_240775A30();
    }
    goto LABEL_61;
  }
  if (!properties)
  {
    uint64_t v62 = _IOHIDLogCategory();
    if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR)) {
      sub_240775688();
    }
    goto LABEL_64;
  }
  objc_msgSend_parseProperties_(self, v7, (uint64_t)properties, v8, v9);
  uint64_t v10 = CFUUIDGetConstantUUIDWithBytes(0, 0x7Du, 0xDEu, 0xECu, 0xA8u, 0xA7u, 0xB4u, 0x11u, 0xDAu, 0x8Au, 0xEu, 0, 0x14u, 0x51u, 0x97u, 0x58u, 0xEFu);
  uint64_t v11 = CFUUIDGetConstantUUIDWithBytes(0, 0xC2u, 0x44u, 0xE8u, 0x58u, 0x10u, 0x9Cu, 0x11u, 0xD4u, 0x91u, 0xD4u, 0, 0x50u, 0xE4u, 0xC6u, 0x42u, 0x6Fu);
  uint64_t v12 = IOCreatePlugInInterfaceForService(a4, v10, v11, &theInterface, &theScore);
  if (v12)
  {
    uint64_t v59 = v12;
    uint32_t v61 = _IOHIDLogCategory();
    if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR)) {
      sub_2407759C8();
    }
    goto LABEL_61;
  }
  uint64_t v13 = theInterface;
  if (!theInterface)
  {
    uint64_t v62 = _IOHIDLogCategory();
    if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR)) {
      sub_2407756BC();
    }
    goto LABEL_64;
  }
  QueryInterface = (*theInterface)->QueryInterface;
  uint64_t v15 = CFUUIDGetConstantUUIDWithBytes(0, 0x47u, 0x4Bu, 0xDCu, 0x8Eu, 0x9Fu, 0x4Au, 0x11u, 0xDAu, 0xB3u, 0x66u, 0, 0xDu, 0x93u, 0x6Du, 6u, 0xD2u);
  uint64_t v16 = CFUUIDGetUUIDBytes(v15);
  p_device = &self->_device;
  if (((unsigned int (*)(IOCFPlugInInterface **, void, void, IOHIDDeviceTimeStampedDeviceInterface ***))QueryInterface)(v13, *(void *)&v16.byte0, *(void *)&v16.byte8, &self->_device))
  {
    uint32_t v61 = _IOHIDLogCategory();
    if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR)) {
      sub_240775960();
    }
    goto LABEL_60;
  }
  if (!*p_device)
  {
    uint64_t v62 = _IOHIDLogCategory();
    if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR)) {
      sub_2407756F0();
    }
    goto LABEL_64;
  }
  uint64_t v18 = ((uint64_t (*)(IOHIDDeviceTimeStampedDeviceInterface **, void))(**p_device)->open)(*p_device, 0);
  if (v18)
  {
    uint64_t v59 = v18;
    uint32_t v61 = _IOHIDLogCategory();
    if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR)) {
      sub_2407758F8();
    }
    goto LABEL_61;
  }
  uint64_t v19 = ((uint64_t (*)(IOHIDDeviceTimeStampedDeviceInterface **, void, CFTypeRef *, void))(**p_device)->copyMatchingElements)(*p_device, 0, &cf, 0);
  if (v19)
  {
    uint64_t v59 = v19;
    uint32_t v61 = _IOHIDLogCategory();
    if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR)) {
      sub_240775890();
    }
    goto LABEL_61;
  }
  if (!cf)
  {
    uint64_t v62 = _IOHIDLogCategory();
    if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR)) {
      sub_240775724();
    }
    goto LABEL_64;
  }
  uint64_t v20 = *p_device;
  uint64_t v21 = (**p_device)->QueryInterface;
  uint64_t v22 = CFUUIDGetConstantUUIDWithBytes(0, 0x2Eu, 0xC7u, 0x8Bu, 0xDBu, 0x9Fu, 0x4Eu, 0x11u, 0xDAu, 0xB6u, 0x5Cu, 0, 0xDu, 0x93u, 0x6Du, 6u, 0xD2u);
  uint64_t v23 = CFUUIDGetUUIDBytes(v22);
  p_queue = &self->_queue;
  if (((unsigned int (*)(IOHIDDeviceTimeStampedDeviceInterface **, void, void, IOHIDDeviceQueueInterface ***))v21)(v20, *(void *)&v23.byte0, *(void *)&v23.byte8, &self->_queue))
  {
    uint32_t v61 = _IOHIDLogCategory();
    if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR)) {
      sub_240775828();
    }
    goto LABEL_60;
  }
  if (!*p_queue)
  {
    uint64_t v62 = _IOHIDLogCategory();
    if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR)) {
      sub_240775758();
    }
    goto LABEL_64;
  }
  uint64_t v25 = *p_device;
  uint64_t v26 = (**p_device)->QueryInterface;
  uint64_t v27 = CFUUIDGetConstantUUIDWithBytes(0, 0x1Fu, 0x2Eu, 0x78u, 0xFAu, 0x9Fu, 0xFAu, 0x11u, 0xDAu, 0x90u, 0xB4u, 0, 0xDu, 0x93u, 0x6Du, 6u, 0xD2u);
  uint64_t v28 = CFUUIDGetUUIDBytes(v27);
  p_transaction = &self->_transaction;
  if (((unsigned int (*)(IOHIDDeviceTimeStampedDeviceInterface **, void, void, IOHIDDeviceTransactionInterface ***))v26)(v25, *(void *)&v28.byte0, *(void *)&v28.byte8, &self->_transaction))
  {
    uint32_t v61 = _IOHIDLogCategory();
    if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR)) {
      sub_2407757C0();
    }
LABEL_60:
    uint64_t v59 = -536870212;
LABEL_61:

    goto LABEL_28;
  }
  if (!*p_transaction)
  {
    uint64_t v62 = _IOHIDLogCategory();
    if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR)) {
      sub_24077578C();
    }
LABEL_64:

    uint64_t v59 = -536870911;
    goto LABEL_28;
  }
  ((void (*)(IOHIDDeviceTransactionInterface **, uint64_t, void))(**p_transaction)->setDirection)(*p_transaction, 1, 0);
  objc_msgSend_parseElements_(self, v30, (uint64_t)cf, v31, v32);
  long long v33 = *p_queue;
  setDepth = (**p_queue)->setDepth;
  uint64_t v39 = objc_msgSend_count(self->_elements.input, v35, v36, v37, v38);
  ((void (*)(IOHIDDeviceQueueInterface **, uint64_t, void))setDepth)(v33, v39, 0);
  uint64_t v63 = 0u;
  uint64_t v64 = 0u;
  uint64_t v65 = 0u;
  uint64_t v66 = 0u;
  uint64_t v40 = self->_elements.input;
  v42 = objc_msgSend_countByEnumeratingWithState_objects_count_(v40, v41, (uint64_t)&v63, (uint64_t)v71, 16);
  if (v42)
  {
    unsigned int v47 = v42;
    uint64_t v48 = *(void *)v64;
    do
    {
      for (uint64_t i = 0; i != v47; ++i)
      {
        if (*(void *)v64 != v48) {
          objc_enumerationMutation(v40);
        }
        uint64_t v50 = *(void **)(*((void *)&v63 + 1) + 8 * i);
        if (objc_msgSend_type(v50, v43, v44, v45, v46) <= 4)
        {
          int v51 = *p_queue;
          addIOHIDElementRef Element = (**p_queue)->addElement;
          int v53 = objc_msgSend_elementRef(v50, v43, v44, v45, v46);
          ((void (*)(IOHIDDeviceQueueInterface **, uint64_t, void))addElement)(v51, v53, 0);
        }
      }
      unsigned int v47 = objc_msgSend_countByEnumeratingWithState_objects_count_(v40, v43, (uint64_t)&v63, (uint64_t)v71, 16);
    }
    while (v47);
  }

  uint64_t v54 = ((uint64_t (*)(IOHIDDeviceQueueInterface **, __CFRunLoopSource **))(**p_queue)->getAsyncEventSource)(*p_queue, &self->_runLoopSource);
  if (v54) {
    goto LABEL_35;
  }
  if (!self->_runLoopSource)
  {
    uint64_t v59 = 0;
    goto LABEL_28;
  }
  uint64_t v54 = ((uint64_t (*)(IOHIDDeviceQueueInterface **, uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t), IOHIDUPSClass *))(**p_queue)->setValueAvailableCallback)(*p_queue, sub_2407701F8, self);
  if (v54)
  {
LABEL_35:
    uint64_t v59 = v54;
    goto LABEL_28;
  }
  uint64_t v59 = ((uint64_t (*)(IOHIDDeviceQueueInterface **, void))(**p_queue)->start)(*p_queue, 0);
  if (!v59) {
    objc_msgSend_initialEventUpdate(self, v55, v56, v57, v58);
  }
LABEL_28:
  if (theInterface) {
    ((void (*)(IOCFPlugInInterface **))(*theInterface)->Release)(theInterface);
  }
  if (cf) {
    CFRelease(cf);
  }
  if (properties) {
    CFRelease(properties);
  }
  return v59;
}

- (int)stop
{
  queue = self->_queue;
  if (queue) {
    ((void (*)(IOHIDDeviceQueueInterface **, void))(*queue)->stop)(queue, 0);
  }
  ((void (*)(IOHIDDeviceTimeStampedDeviceInterface **, void))(*self->_device)->close)(self->_device, 0);
  return 0;
}

- (int)getProperties:(const __CFDictionary *)a3
{
  if (!a3) {
    return -536870206;
  }
  int result = 0;
  *a3 = (const __CFDictionary *)self->_properties;
  return result;
}

- (int)getCapabilities:(const __CFSet *)a3
{
  if (!a3) {
    return -536870206;
  }
  int result = 0;
  *a3 = (const __CFSet *)self->_capabilities;
  return result;
}

- (int)getEvent:(const __CFDictionary *)a3
{
  if (!a3) {
    return -536870206;
  }
  *a3 = (const __CFDictionary *)self->_upsEvent;
  sub_24076E2BC(self->_upsEvent, @"getEvent");
  return 0;
}

- (int)setEventCallback:(void *)a3 target:(void *)a4 refcon:(void *)a5
{
  self->_eventCallback = a3;
  self->_eventTarget = a4;
  self->_eventRefcon = a5;
  return 0;
}

- (int)sendCommand:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = _IOHIDLogCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v19 = v4;
    _os_log_impl(&dword_240766000, v5, OS_LOG_TYPE_DEFAULT, "sendCommand: %@", buf, 0xCu);
  }
  int v6 = -536870206;

  if (v4 && objc_msgSend_count(v4, v7, v8, v9, v10))
  {
    transaction = self->_transaction;
    if (transaction)
    {
      ((void (*)(IOHIDDeviceTransactionInterface **, uint64_t, void))(*transaction)->setDirection)(transaction, 1, 0);
      v17[0] = MEMORY[0x263EF8330];
      v17[1] = 3221225472;
      v17[2] = sub_2407704EC;
      v17[3] = &unk_2650D4018;
      v17[4] = self;
      objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v4, v12, (uint64_t)v17, v13, v14);
      int v6 = ((uint64_t (*)(IOHIDDeviceTransactionInterface **, void, void, void, void))(*self->_transaction)->commit)(self->_transaction, 0, 0, 0, 0);
      ((void (*)(IOHIDDeviceTransactionInterface **, void))(*self->_transaction)->clear)(self->_transaction, 0);
    }
    else
    {
      uint64_t v15 = _IOHIDLogCategory();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        sub_240775584();
      }

      int v6 = -536870212;
    }
  }

  return v6;
}

- (int)createAsyncEventSource:(const void *)a3
{
  id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
  timer = self->_timer;
  if (timer)
  {
    CFRetain(timer);
    objc_msgSend_addObject_(v5, v7, (uint64_t)self->_timer, v8, v9);
  }
  runLoopSource = self->_runLoopSource;
  if (runLoopSource)
  {
    CFRetain(runLoopSource);
    objc_msgSend_addObject_(v5, v11, (uint64_t)self->_runLoopSource, v12, v13);
  }
  *a3 = v5;
  return 0;
}

- (IOHIDUPSClass)init
{
  v29.receiver = self;
  v29.super_class = (Class)IOHIDUPSClass;
  uint64_t v2 = [(IOHIDPlugin *)&v29 init];
  if (v2)
  {
    uint64_t v3 = (char *)malloc_type_malloc(0x50uLL, 0x80040A1CEA83AuLL);
    v2->_ups = (IOUPSPlugInInterface_v140 *)v3;
    vtbl = v2->super.super._vtbl;
    Release = vtbl->Release;
    long long v6 = *(_OWORD *)&vtbl->QueryInterface;
    *(void *)uint64_t v3 = v2;
    *(_OWORD *)(v3 + 8) = v6;
    *((void *)v3 + 3) = Release;
    *((void *)v3 + 4) = sub_2407709D8;
    *((void *)v3 + 5) = sub_2407709E8;
    *((void *)v3 + 6) = sub_2407709F8;
    *((void *)v3 + 7) = sub_240770A08;
    *((void *)v3 + 8) = sub_240770A20;
    *((void *)v3 + 9) = sub_240770A30;
    uint64_t v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    properties = v2->_properties;
    v2->_properties = v7;

    uint64_t v9 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    capabilities = v2->_capabilities;
    v2->_capabilities = v9;

    uint64_t v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    input = v2->_elements.input;
    v2->_elements.input = v11;

    uint64_t v13 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    output = v2->_elements.output;
    v2->_elements.output = v13;

    uint64_t v15 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    feature = v2->_elements.feature;
    v2->_elements.feature = v15;

    uint64_t v17 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    commandElements = v2->_commandElements;
    v2->_commandElements = v17;

    id v19 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    eventElements = v2->_eventElements;
    v2->_eventElements = v19;

    uint64_t v21 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    upsEvent = v2->_upsEvent;
    v2->_upsEvent = v21;

    uint64_t v23 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    upsUpdatedEvent = v2->_upsUpdatedEvent;
    v2->_upsUpdatedEvent = v23;

    uint64_t v25 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    debugInformation = v2->_debugInformation;
    v2->_debugInformation = v25;

    uint64_t v27 = v2;
  }

  return v2;
}

- (void)dealloc
{
  free(self->_ups);
  queue = self->_queue;
  if (queue) {
    ((void (*)(IOHIDDeviceQueueInterface **))(*queue)->Release)(queue);
  }
  transaction = self->_transaction;
  if (transaction) {
    ((void (*)(IOHIDDeviceTransactionInterface **))(*transaction)->Release)(transaction);
  }
  device = self->_device;
  if (device) {
    ((void (*)(IOHIDDeviceTimeStampedDeviceInterface **))(*device)->Release)(device);
  }
  v6.receiver = self;
  v6.super_class = (Class)IOHIDUPSClass;
  [(IOHIDPlugin *)&v6 dealloc];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_eventElements, 0);
  objc_storeStrong((id *)&self->_commandElements, 0);
  sub_240770BC4((uint64_t)&self->_elements);
  objc_storeStrong((id *)&self->_debugInformation, 0);
  objc_storeStrong((id *)&self->_upsUpdatedEvent, 0);
  objc_storeStrong((id *)&self->_upsEvent, 0);
  objc_storeStrong((id *)&self->_capabilities, 0);

  objc_storeStrong((id *)&self->_properties, 0);
}

@end
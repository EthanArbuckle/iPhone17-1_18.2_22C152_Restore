@interface CellDataActivationFailureAlertItem
- (CellDataActivationFailureAlertItem)initWithErrorCode:(int)a3 reason:(id)a4 additionalData:(dict)a5 suggestWiFi:(BOOL)a6 cellularDataOn:(BOOL)a7 wifiOn:(BOOL)a8 satelliteOn:(BOOL)a9 registry:(shared_ptr<const Registry>)a10 logger:(const void *)a11;
- (id).cxx_construct;
- (void)button_config:(BOOL)a3;
- (void)dealloc;
- (void)show;
@end

@implementation CellDataActivationFailureAlertItem

- (CellDataActivationFailureAlertItem)initWithErrorCode:(int)a3 reason:(id)a4 additionalData:(dict)a5 suggestWiFi:(BOOL)a6 cellularDataOn:(BOOL)a7 wifiOn:(BOOL)a8 satelliteOn:(BOOL)a9 registry:(shared_ptr<const Registry>)a10 logger:(const void *)a11
{
  v53.receiver = self;
  v53.super_class = (Class)CellDataActivationFailureAlertItem;
  v17 = [(CellDataActivationFailureAlertItem *)&v53 init];
  v18 = v17;
  if (!v17) {
    return v18;
  }
  v19 = *(Registry **)a10.__ptr_;
  uint64_t v20 = *((void *)a10.__ptr_ + 1);
  if (v20) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v20 + 8), 1uLL, memory_order_relaxed);
  }
  cntrl = (std::__shared_weak_count *)v17->fRegistry.__cntrl_;
  v18->fRegistry.__ptr_ = v19;
  v18->fRegistry.__cntrl_ = (__shared_weak_count *)v20;
  if (cntrl) {
    sub_10004D2C8(cntrl);
  }
  v18->fLogger = a10.__cntrl_;
  v18->_error = a3;
  v18->_suggestWiFi = a6;
  if (a4) {
    v22 = (NSString *)[a4 copy];
  }
  else {
    v22 = 0;
  }
  v18->_reason = v22;
  v23 = *(dispatch_object_s **)a5.fObj.fObj;
  if (v23) {
    xpc_retain(v23);
  }
  else {
    v23 = (dispatch_object_s *)xpc_null_create();
  }
  fObj = v18->_additionalData.fObj.fObj;
  v18->_additionalData.fObj.fObj = v23;
  xpc_release(fObj);
  v18->_settingsText = 0;
  ptr = v18->fRegistry.__ptr_;
  v26 = (std::__shared_weak_count *)v18->fRegistry.__cntrl_;
  if (v26) {
    atomic_fetch_add_explicit(&v26->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  v18->_okText = (NSString *)sub_100BAEC44(ptr, v26, @"OK", @"OK");
  if (v26) {
    sub_10004D2C8(v26);
  }
  if (!a9)
  {
    BOOL v33 = !a7 || a8;
    v34 = v18->fRegistry.__ptr_;
    v35 = (std::__shared_weak_count *)v18->fRegistry.__cntrl_;
    if (v33)
    {
      if (v35) {
        atomic_fetch_add_explicit(&v35->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      v36 = (NSString *)sub_100BAEC44(v34, v35, @"EDGE_OFF_FAILURE_TITLE", @"Cellular Data is Turned Off");
    }
    else
    {
      if (v35) {
        atomic_fetch_add_explicit(&v35->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      v36 = (NSString *)sub_100BAEC44(v34, v35, @"EDGE_OFF_FAILURE_TITLE_CELLULAR_DATA_ON", @"Cellular Data is not available");
    }
    v18->_title = v36;
    if (v35) {
      sub_10004D2C8(v35);
    }
    ServiceMap = (std::mutex *)Registry::getServiceMap(v37, v18->fRegistry.__ptr_);
    v39 = ServiceMap;
    if ((v40 & 0x8000000000000000) != 0)
    {
      v41 = (unsigned __int8 *)(v40 & 0x7FFFFFFFFFFFFFFFLL);
      uint64_t v42 = 5381;
      do
      {
        unint64_t v40 = v42;
        unsigned int v43 = *v41++;
        uint64_t v42 = (33 * v42) ^ v43;
      }
      while (v43);
    }
    std::mutex::lock(ServiceMap);
    unint64_t v54 = v40;
    v44 = sub_10004D37C(&v39[1].__m_.__sig, &v54);
    if (v44)
    {
      uint64_t v45 = v44[3];
      v30 = (std::__shared_weak_count *)v44[4];
      if (v30)
      {
        atomic_fetch_add_explicit(&v30->__shared_owners_, 1uLL, memory_order_relaxed);
        std::mutex::unlock(v39);
        atomic_fetch_add_explicit(&v30->__shared_owners_, 1uLL, memory_order_relaxed);
        sub_10004D2C8(v30);
        char v46 = 0;
        goto LABEL_46;
      }
    }
    else
    {
      uint64_t v45 = 0;
    }
    std::mutex::unlock(v39);
    v30 = 0;
    char v46 = 1;
LABEL_46:
    int v49 = (*(uint64_t (**)(uint64_t))(*(void *)v45 + 152))(v45);
    v50 = v18->fRegistry.__ptr_;
    v51 = (std::__shared_weak_count *)v18->fRegistry.__cntrl_;
    if (v49)
    {
      if (v33)
      {
        if (v51) {
          atomic_fetch_add_explicit(&v51->__shared_owners_, 1uLL, memory_order_relaxed);
        }
        v52 = (NSString *)sub_100BAEC44(v50, v51, @"EDGE_OFF_FAILURE_BODY_WLAN", @"Turn on cellular data or Use WLAN to access data.");
      }
      else
      {
        if (v51) {
          atomic_fetch_add_explicit(&v51->__shared_owners_, 1uLL, memory_order_relaxed);
        }
        v52 = (NSString *)sub_100BAEC44(v50, v51, @"EDGE_OFF_FAILURE_BODY_WLAN_CELLULAR_DATA_ON", @"Use WLAN to access data.");
      }
    }
    else if (v33)
    {
      if (v51) {
        atomic_fetch_add_explicit(&v51->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      v52 = (NSString *)sub_100BAEC44(v50, v51, @"EDGE_OFF_FAILURE_BODY", @"Turn on cellular data or use Wi-Fi to access data.");
    }
    else
    {
      if (v51) {
        atomic_fetch_add_explicit(&v51->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      v52 = (NSString *)sub_100BAEC44(v50, v51, @"EDGE_OFF_FAILURE_BODY_CELLULAR_DATA_ON", @"Use Wi-Fi to access data.");
    }
    v18->_body = v52;
    if (v51) {
      sub_10004D2C8(v51);
    }
    if ((v46 & 1) == 0) {
      goto LABEL_42;
    }
    return v18;
  }
  v27 = v18->fRegistry.__ptr_;
  v28 = (std::__shared_weak_count *)v18->fRegistry.__cntrl_;
  if (v28) {
    atomic_fetch_add_explicit(&v28->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  v18->_title = (NSString *)sub_100BAEC44(v27, v28, @"EDGE_OFF_FAILURE_TITLE_CELLULAR_DATA_ON", @"Cellular Data is not available");
  if (v28) {
    sub_10004D2C8(v28);
  }
  v29 = v18->fRegistry.__ptr_;
  v30 = (std::__shared_weak_count *)v18->fRegistry.__cntrl_;
  if (v30)
  {
    atomic_fetch_add_explicit(&v30->__shared_owners_, 1uLL, memory_order_relaxed);
    uint64_t v31 = kBifrostLocalizationTable;
    add_explicit = (uint64_t *)atomic_fetch_add_explicit(&v30->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  else
  {
    add_explicit = (uint64_t *)&kBifrostLocalizationTable;
    uint64_t v31 = kBifrostLocalizationTable;
  }
  id v47 = sub_100BB35BC(v29, v31, @"BIFROST_CELLULAR_DATA_NOT_AVAILABLE", @"Cellular data is not available for this app when connected to satellite.", add_explicit);
  if (v30) {
    sub_10004D2C8(v30);
  }
  v18->_body = (NSString *)v47;
  if (v30) {
LABEL_42:
  }
    sub_10004D2C8(v30);
  return v18;
}

- (void)dealloc
{
  reason = self->_reason;
  if (reason) {

  }
  settingsText = self->_settingsText;
  if (settingsText) {

  }
  okText = self->_okText;
  if (okText) {

  }
  body = self->_body;
  if (body) {

  }
  title = self->_title;
  if (title) {

  }
  v8.receiver = self;
  v8.super_class = (Class)CellDataActivationFailureAlertItem;
  [(CellDataActivationFailureAlertItem *)&v8 dealloc];
}

- (void)button_config:(BOOL)a3
{
  BOOL v3 = a3;
  ptr = self->fRegistry.__ptr_;
  cntrl = self->fRegistry.__cntrl_;
  if (cntrl) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
  }
  id v7 = sub_100BAEC44(ptr, (std::__shared_weak_count *)cntrl, @"EDGE_FAILURE", self->_title);
  if (cntrl) {
    sub_10004D2C8((std::__shared_weak_count *)cntrl);
  }
  [+[CellDataActivationFailureAlertState sharedInstance] setAction:0];
  xpc_type_t type = xpc_get_type(self->_additionalData.fObj.fObj);
  v9 = (uint64_t *)&_xpc_type_dictionary;
  if (type == (xpc_type_t)&_xpc_type_dictionary
    && xpc_dictionary_get_value(self->_additionalData.fObj.fObj, kDataActivateFailureReasonKey))
  {
    if (qword_101B14190)
    {
      v17 = std::__shared_weak_count::lock((std::__shared_weak_count *)qword_101B14190);
      if (v17) {
        uint64_t v20 = DataPlanManagerBootstrap::sInstance;
      }
      else {
        uint64_t v20 = 0;
      }
    }
    else
    {
      uint64_t v20 = 0;
      v17 = 0;
    }
    v134[0] = 0;
    v134[1] = 0;
    uint64_t v135 = 0;
    cf[0] = &self->_additionalData;
    cf[1] = (CFTypeRef)kDataActivateFailureReasonKey;
    sub_100048BAC((uint64_t)cf, &object);
    p_additionalData = 0;
    v137 = 0;
    uint64_t v138 = 0;
    xpc::dyn_cast_or_default();
    if (SHIBYTE(v138) < 0) {
      operator delete(p_additionalData);
    }
    xpc_release(object);
    v28 = self->fRegistry.__ptr_;
    v29 = self->fRegistry.__cntrl_;
    if (v29) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)v29 + 1, 1uLL, memory_order_relaxed);
    }
    id v7 = sub_100BAEC44(v28, (std::__shared_weak_count *)v29, @"Cellular Data Plan", 0);
    if (v29) {
      sub_10004D2C8((std::__shared_weak_count *)v29);
    }
    cf[0] = 0;
    p_additionalData = &self->_additionalData;
    v137 = "DataPlanCsn";
    sub_100048BAC((uint64_t)&p_additionalData, &v131);
    xpc::bridge((uint64_t *)&object, (xpc *)&v131, v30);
    sub_1000C15D8(cf, (CFTypeRef *)&object);
    sub_1000577C4((const void **)&object);
    xpc_release(v131);
    xpc_object_t object = 0;
    p_additionalData = &self->_additionalData;
    v137 = "DataPlanUrl";
    sub_100048BAC((uint64_t)&p_additionalData, &v130);
    xpc::bridge((uint64_t *)&v131, (xpc *)&v130, v31);
    sub_100056248(&object, (CFTypeRef *)&v131);
    sub_1000577C4((const void **)&v131);
    xpc_release(v130);
    xpc_object_t v131 = 0;
    p_additionalData = &self->_additionalData;
    v137 = "DataPlanIccid";
    sub_100048BAC((uint64_t)&p_additionalData, &v129);
    xpc::bridge((uint64_t *)&v130, (xpc *)&v129, v32);
    sub_100056248(&v131, (CFTypeRef *)&v130);
    sub_1000577C4((const void **)&v130);
    xpc_release(v129);
    if (v20)
    {
      if (SHIBYTE(v135) < 0)
      {
        sub_10004FC84(__p, v134[0], (unint64_t)v134[1]);
      }
      else
      {
        *(_OWORD *)__p = *(_OWORD *)v134;
        uint64_t v128 = v135;
      }
      (*(void (**)(uint64_t, void **))(*(void *)v20 + 104))(v20, __p);
      if (SHIBYTE(v128) < 0) {
        operator delete(__p[0]);
      }
    }
    int v47 = SHIBYTE(v135);
    if (v135 >= 0) {
      size_t v48 = HIBYTE(v135);
    }
    else {
      size_t v48 = (size_t)v134[1];
    }
    if (v48 != strlen(kDataActivateFailureReasonDataPlanExpiredSequoia)
      || (v135 >= 0 ? (int v49 = v134) : (int v49 = (void **)v134[0]),
          memcmp(v49, kDataActivateFailureReasonDataPlanExpiredSequoia, v48)))
    {
      if (v48 == strlen(kDataActivateFailureReasonDataPlanNoPlanSelected)
        && (v47 >= 0 ? (v50 = v134) : (v50 = (void **)v134[0]),
            !memcmp(v50, kDataActivateFailureReasonDataPlanNoPlanSelected, v48)))
      {
        v70 = self->fRegistry.__ptr_;
        v71 = self->fRegistry.__cntrl_;
        if (v71) {
          atomic_fetch_add_explicit((atomic_ullong *volatile)v71 + 1, 1uLL, memory_order_relaxed);
        }
        id v43 = sub_100BAEC44(v70, (std::__shared_weak_count *)v71, @"You have not selected a plan for use. Please go to Settings to select a plan.", 0);
        if (v71) {
          sub_10004D2C8((std::__shared_weak_count *)v71);
        }
        v72 = self->fRegistry.__ptr_;
        v73 = self->fRegistry.__cntrl_;
        if (v73) {
          atomic_fetch_add_explicit((atomic_ullong *volatile)v73 + 1, 1uLL, memory_order_relaxed);
        }
        id v56 = sub_100BAEC44(v72, (std::__shared_weak_count *)v73, @"Cancel", 0);
        if (v73) {
          sub_10004D2C8((std::__shared_weak_count *)v73);
        }
        [+[CellDataActivationFailureAlertState sharedInstance] setAction:3];
        id v55 = 0;
      }
      else
      {
        if (v48 != strlen(kDataActivateFailureReasonDataPlanNoExistingPlan)
          || (v47 >= 0 ? (v51 = v134) : (v51 = (void **)v134[0]),
              memcmp(v51, kDataActivateFailureReasonDataPlanNoExistingPlan, v48)))
        {
          if (v48 != strlen(kDataActivateFailureReasonDataPlanUnusableProfile)
            || (v47 >= 0 ? (v52 = v134) : (v52 = (void **)v134[0]),
                memcmp(v52, kDataActivateFailureReasonDataPlanUnusableProfile, v48)))
          {
            if (v48 != strlen(kDataActivateFailureReasonDataPlanConnectToWifi)
              || (v47 >= 0 ? (objc_super v53 = v134) : (objc_super v53 = (void **)v134[0]),
                  memcmp(v53, kDataActivateFailureReasonDataPlanConnectToWifi, v48)))
            {
              id v43 = 0;
LABEL_116:
              id v55 = 0;
              id v56 = 0;
              goto LABEL_186;
            }
            ServiceMap = (std::mutex *)Registry::getServiceMap(v54, self->fRegistry.__ptr_);
            v94 = ServiceMap;
            if (v95 < 0)
            {
              v96 = (unsigned __int8 *)(v95 & 0x7FFFFFFFFFFFFFFFLL);
              uint64_t v97 = 5381;
              do
              {
                uint64_t v95 = v97;
                unsigned int v98 = *v96++;
                uint64_t v97 = (33 * v97) ^ v98;
              }
              while (v98);
            }
            std::mutex::lock(ServiceMap);
            p_additionalData = (dict *)v95;
            v99 = sub_10004D37C(&v94[1].__m_.__sig, (unint64_t *)&p_additionalData);
            if (v99)
            {
              uint64_t v100 = v99[3];
              v101 = (std::__shared_weak_count *)v99[4];
              if (v101)
              {
                atomic_fetch_add_explicit(&v101->__shared_owners_, 1uLL, memory_order_relaxed);
                std::mutex::unlock(v94);
                atomic_fetch_add_explicit(&v101->__shared_owners_, 1uLL, memory_order_relaxed);
                sub_10004D2C8(v101);
                char v102 = 0;
LABEL_262:
                int v115 = (*(uint64_t (**)(uint64_t))(*(void *)v100 + 152))(v100);
                v116 = self->fRegistry.__ptr_;
                v117 = self->fRegistry.__cntrl_;
                if (v115)
                {
                  if (v117) {
                    atomic_fetch_add_explicit((atomic_ullong *volatile)v117 + 1, 1uLL, memory_order_relaxed);
                  }
                  id v7 = sub_100BAEC44(v116, (std::__shared_weak_count *)v117, @"No WLAN Network Connected", 0);
                  if (v117) {
                    sub_10004D2C8((std::__shared_weak_count *)v117);
                  }
                  v118 = self->fRegistry.__ptr_;
                  v119 = self->fRegistry.__cntrl_;
                  if (v119) {
                    atomic_fetch_add_explicit((atomic_ullong *volatile)v119 + 1, 1uLL, memory_order_relaxed);
                  }
                  id v120 = sub_100BAEC44(v118, (std::__shared_weak_count *)v119, @"You can set up cellular data or connect to a WLAN network to access data.", 0);
                }
                else
                {
                  if (v117) {
                    atomic_fetch_add_explicit((atomic_ullong *volatile)v117 + 1, 1uLL, memory_order_relaxed);
                  }
                  id v7 = sub_100BAEC44(v116, (std::__shared_weak_count *)v117, @"No Wi-Fi Network Connected", 0);
                  if (v117) {
                    sub_10004D2C8((std::__shared_weak_count *)v117);
                  }
                  v121 = self->fRegistry.__ptr_;
                  v119 = self->fRegistry.__cntrl_;
                  if (v119) {
                    atomic_fetch_add_explicit((atomic_ullong *volatile)v119 + 1, 1uLL, memory_order_relaxed);
                  }
                  id v120 = sub_100BAEC44(v121, (std::__shared_weak_count *)v119, @"You can set up cellular data or connect to a Wi-Fi network to access data.", 0);
                }
                id v43 = v120;
                if (v119) {
                  sub_10004D2C8((std::__shared_weak_count *)v119);
                }
                if ((v102 & 1) == 0) {
                  sub_10004D2C8(v101);
                }
                [+[CellDataActivationFailureAlertState sharedInstance] setAction:1];
                goto LABEL_116;
              }
            }
            else
            {
              uint64_t v100 = 0;
            }
            std::mutex::unlock(v94);
            v101 = 0;
            char v102 = 1;
            goto LABEL_262;
          }
          v83 = self->fRegistry.__ptr_;
          v84 = self->fRegistry.__cntrl_;
          if (v84) {
            atomic_fetch_add_explicit((atomic_ullong *volatile)v84 + 1, 1uLL, memory_order_relaxed);
          }
          id v43 = sub_100BAEC44(v83, (std::__shared_weak_count *)v84, @"Contact Carrier to use this SIM with this iPad.", 0);
          if (v84) {
            sub_10004D2C8((std::__shared_weak_count *)v84);
          }
          v85 = self->fRegistry.__ptr_;
          v86 = self->fRegistry.__cntrl_;
          if (v86) {
            atomic_fetch_add_explicit((atomic_ullong *volatile)v86 + 1, 1uLL, memory_order_relaxed);
          }
          id v55 = sub_100BAEC44(v85, (std::__shared_weak_count *)v86, @"Learn More", 0);
          if (v86) {
            sub_10004D2C8((std::__shared_weak_count *)v86);
          }
          [+[CellDataActivationFailureAlertState sharedInstance] setAction:2];
          v87 = +[CellDataActivationFailureAlertState sharedInstance];
          xpc_object_t v123 = object;
          if (object) {
            CFRetain(object);
          }
          [(CellDataActivationFailureAlertState *)v87 setDataPlanUrl:&v123];
          sub_1000558F4((const void **)&v123);
          v88 = +[CellDataActivationFailureAlertState sharedInstance];
          xpc_object_t v122 = v131;
          if (v131) {
            CFRetain(v131);
          }
          v68 = &v122;
          [(CellDataActivationFailureAlertState *)v88 setDataPlanIccid:&v122];
          id v56 = 0;
          goto LABEL_185;
        }
        v77 = self->fRegistry.__ptr_;
        v78 = self->fRegistry.__cntrl_;
        if (v78) {
          atomic_fetch_add_explicit((atomic_ullong *volatile)v78 + 1, 1uLL, memory_order_relaxed);
        }
        id v43 = sub_100BAEC44(v77, (std::__shared_weak_count *)v78, @"You have not signed up for a data plan. Would you like to set up a new account? If you don’t, you can do it later in Settings.", 0);
        if (v78) {
          sub_10004D2C8((std::__shared_weak_count *)v78);
        }
        v79 = self->fRegistry.__ptr_;
        v80 = self->fRegistry.__cntrl_;
        if (v80) {
          atomic_fetch_add_explicit((atomic_ullong *volatile)v80 + 1, 1uLL, memory_order_relaxed);
        }
        id v55 = sub_100BAEC44(v79, (std::__shared_weak_count *)v80, @"Now", 0);
        if (v80) {
          sub_10004D2C8((std::__shared_weak_count *)v80);
        }
        v81 = self->fRegistry.__ptr_;
        v82 = self->fRegistry.__cntrl_;
        if (v82) {
          atomic_fetch_add_explicit((atomic_ullong *volatile)v82 + 1, 1uLL, memory_order_relaxed);
        }
        id v56 = sub_100BAEC44(v81, (std::__shared_weak_count *)v82, @"Later", 0);
        if (v82) {
          sub_10004D2C8((std::__shared_weak_count *)v82);
        }
        [+[CellDataActivationFailureAlertState sharedInstance] setAction:3];
      }
LABEL_186:
      sub_1000558F4((const void **)&v131);
      sub_1000558F4((const void **)&object);
      sub_100030068(cf);
      if (SHIBYTE(v135) < 0) {
        operator delete(v134[0]);
      }
      if (!v17) {
        goto LABEL_232;
      }
LABEL_231:
      sub_10004D2C8(v17);
      goto LABEL_232;
    }
    v57 = self->fRegistry.__ptr_;
    v58 = self->fRegistry.__cntrl_;
    if (v58) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)v58 + 1, 1uLL, memory_order_relaxed);
    }
    id v7 = sub_100BAEC44(v57, (std::__shared_weak_count *)v58, @"No Cellular Data Remaining", 0);
    if (v58) {
      sub_10004D2C8((std::__shared_weak_count *)v58);
    }
    v59 = self->fRegistry.__ptr_;
    v60 = self->fRegistry.__cntrl_;
    if (v60) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)v60 + 1, 1uLL, memory_order_relaxed);
    }
    id v43 = sub_100BAEC44(v59, (std::__shared_weak_count *)v60, @"There is no data remaining on your current plan. You can add more data now, or do it later in Settings.", 0);
    if (v60) {
      sub_10004D2C8((std::__shared_weak_count *)v60);
    }
    v61 = self->fRegistry.__ptr_;
    v62 = self->fRegistry.__cntrl_;
    if (v62) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)v62 + 1, 1uLL, memory_order_relaxed);
    }
    id v55 = sub_100BAEC44(v61, (std::__shared_weak_count *)v62, @"Add Data", 0);
    if (v62) {
      sub_10004D2C8((std::__shared_weak_count *)v62);
    }
    v63 = self->fRegistry.__ptr_;
    v64 = self->fRegistry.__cntrl_;
    if (v64) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)v64 + 1, 1uLL, memory_order_relaxed);
    }
    id v56 = sub_100BAEC44(v63, (std::__shared_weak_count *)v64, @"Later", 0);
    if (v64) {
      sub_10004D2C8((std::__shared_weak_count *)v64);
    }
    [+[CellDataActivationFailureAlertState sharedInstance] setAction:2];
    v65 = +[CellDataActivationFailureAlertState sharedInstance];
    CFTypeRef v126 = cf[0];
    if (cf[0]) {
      CFRetain(cf[0]);
    }
    [(CellDataActivationFailureAlertState *)v65 setDataPlanCsn:&v126];
    sub_100030068(&v126);
    v66 = +[CellDataActivationFailureAlertState sharedInstance];
    xpc_object_t v125 = object;
    if (object) {
      CFRetain(object);
    }
    [(CellDataActivationFailureAlertState *)v66 setDataPlanUrl:&v125];
    sub_1000558F4((const void **)&v125);
    v67 = +[CellDataActivationFailureAlertState sharedInstance];
    xpc_object_t v124 = v131;
    if (v131) {
      CFRetain(v131);
    }
    v68 = &v124;
    [(CellDataActivationFailureAlertState *)v67 setDataPlanIccid:&v124];
LABEL_185:
    sub_1000558F4((const void **)v68);
    goto LABEL_186;
  }
  v10 = (std::mutex *)Registry::getServiceMap(v9, self->fRegistry.__ptr_);
  v11 = v10;
  if (v12 < 0)
  {
    v13 = (unsigned __int8 *)(v12 & 0x7FFFFFFFFFFFFFFFLL);
    uint64_t v14 = 5381;
    do
    {
      uint64_t v12 = v14;
      unsigned int v15 = *v13++;
      uint64_t v14 = (33 * v14) ^ v15;
    }
    while (v15);
  }
  std::mutex::lock(v10);
  p_additionalData = (dict *)v12;
  v16 = sub_10004D37C(&v11[1].__m_.__sig, (unint64_t *)&p_additionalData);
  if (!v16)
  {
    uint64_t v18 = 0;
    goto LABEL_18;
  }
  uint64_t v18 = v16[3];
  v17 = (std::__shared_weak_count *)v16[4];
  if (!v17)
  {
LABEL_18:
    std::mutex::unlock(v11);
    v17 = 0;
    char v19 = 1;
    goto LABEL_19;
  }
  atomic_fetch_add_explicit(&v17->__shared_owners_, 1uLL, memory_order_relaxed);
  std::mutex::unlock(v11);
  atomic_fetch_add_explicit(&v17->__shared_owners_, 1uLL, memory_order_relaxed);
  sub_10004D2C8(v17);
  char v19 = 0;
LABEL_19:
  int error = self->_error;
  switch(error)
  {
    case '7':
      v22 = self->fRegistry.__ptr_;
      v23 = self->fRegistry.__cntrl_;
      if (v23) {
        atomic_fetch_add_explicit((atomic_ullong *volatile)v23 + 1, 1uLL, memory_order_relaxed);
      }
      id v24 = sub_100BAEC44(v22, (std::__shared_weak_count *)v23, @"kGprsIllegalMs", self->_body);
      goto LABEL_228;
    case '8':
      v35 = self->fRegistry.__ptr_;
      v23 = self->fRegistry.__cntrl_;
      if (v23) {
        atomic_fetch_add_explicit((atomic_ullong *volatile)v23 + 1, 1uLL, memory_order_relaxed);
      }
      id v24 = sub_100BAEC44(v35, (std::__shared_weak_count *)v23, @"kGprsIllegalMe", self->_body);
      goto LABEL_228;
    case '9':
      v36 = self->fRegistry.__ptr_;
      v23 = self->fRegistry.__cntrl_;
      if (v23) {
        atomic_fetch_add_explicit((atomic_ullong *volatile)v23 + 1, 1uLL, memory_order_relaxed);
      }
      id v24 = sub_100BAEC44(v36, (std::__shared_weak_count *)v23, @"kGprsServicesNotAllowed", self->_body);
      goto LABEL_228;
    case ':':
      v37 = self->fRegistry.__ptr_;
      v23 = self->fRegistry.__cntrl_;
      if (v23) {
        atomic_fetch_add_explicit((atomic_ullong *volatile)v23 + 1, 1uLL, memory_order_relaxed);
      }
      id v24 = sub_100BAEC44(v37, (std::__shared_weak_count *)v23, @"kGprsPlmnNotAllowed", self->_body);
      goto LABEL_228;
    case ';':
      v38 = self->fRegistry.__ptr_;
      v23 = self->fRegistry.__cntrl_;
      if (v23) {
        atomic_fetch_add_explicit((atomic_ullong *volatile)v23 + 1, 1uLL, memory_order_relaxed);
      }
      id v24 = sub_100BAEC44(v38, (std::__shared_weak_count *)v23, @"kGprsLocationAreaNotAllowed", self->_body);
      goto LABEL_228;
    case '<':
      v39 = self->fRegistry.__ptr_;
      v23 = self->fRegistry.__cntrl_;
      if (v23) {
        atomic_fetch_add_explicit((atomic_ullong *volatile)v23 + 1, 1uLL, memory_order_relaxed);
      }
      id v24 = sub_100BAEC44(v39, (std::__shared_weak_count *)v23, @"kGprsRoamingNotAllowedInLocationArea", self->_body);
      goto LABEL_228;
    case '=':
      goto LABEL_43;
    case '>':
      unint64_t v40 = self->fRegistry.__ptr_;
      v23 = self->fRegistry.__cntrl_;
      if (v23) {
        atomic_fetch_add_explicit((atomic_ullong *volatile)v23 + 1, 1uLL, memory_order_relaxed);
      }
      id v24 = sub_100BAEC44(v40, (std::__shared_weak_count *)v23, @"kGprsServiceOptionNotSupported", self->_body);
      goto LABEL_228;
    case '?':
      if (!v3 || !v18) {
        goto LABEL_140;
      }
      if (((*(uint64_t (**)(uint64_t))(*(void *)v18 + 152))(v18) & 1) == 0)
      {
        v103 = self->fRegistry.__ptr_;
        v104 = self->fRegistry.__cntrl_;
        if (v104) {
          atomic_fetch_add_explicit((atomic_ullong *volatile)v104 + 1, 1uLL, memory_order_relaxed);
        }
        id v43 = sub_100BAEC44(v103, (std::__shared_weak_count *)v104, @"kGprsServiceOptionNotSubscribedWithOptions", self->_body);
        if (v104) {
          sub_10004D2C8((std::__shared_weak_count *)v104);
        }
        goto LABEL_74;
      }
      if ((*(unsigned int (**)(uint64_t))(*(void *)v18 + 152))(v18))
      {
        v41 = self->fRegistry.__ptr_;
        uint64_t v42 = self->fRegistry.__cntrl_;
        if (v42) {
          atomic_fetch_add_explicit((atomic_ullong *volatile)v42 + 1, 1uLL, memory_order_relaxed);
        }
        id v43 = sub_100BAEC44(v41, (std::__shared_weak_count *)v42, @"kGprsServiceOptionNotSubscribedWithOptionsWLAN", self->_body);
        if (v42) {
          sub_10004D2C8((std::__shared_weak_count *)v42);
        }
LABEL_74:
        [+[CellDataActivationFailureAlertState sharedInstance] setAction:1];
        goto LABEL_230;
      }
LABEL_140:
      v69 = self->fRegistry.__ptr_;
      v23 = self->fRegistry.__cntrl_;
      if (v23) {
        atomic_fetch_add_explicit((atomic_ullong *volatile)v23 + 1, 1uLL, memory_order_relaxed);
      }
      id v24 = sub_100BAEC44(v69, (std::__shared_weak_count *)v23, @"kGprsServiceOptionNotSubscribed", self->_body);
      goto LABEL_228;
    case '@':
      v44 = self->fRegistry.__ptr_;
      v23 = self->fRegistry.__cntrl_;
      if (v23) {
        atomic_fetch_add_explicit((atomic_ullong *volatile)v23 + 1, 1uLL, memory_order_relaxed);
      }
      id v24 = sub_100BAEC44(v44, (std::__shared_weak_count *)v23, @"kGprsServiceOptionTemporarilyOutOfOrder", self->_body);
      goto LABEL_228;
    case 'A':
      uint64_t v45 = self->fRegistry.__ptr_;
      v23 = self->fRegistry.__cntrl_;
      if (v23) {
        atomic_fetch_add_explicit((atomic_ullong *volatile)v23 + 1, 1uLL, memory_order_relaxed);
      }
      id v24 = sub_100BAEC44(v45, (std::__shared_weak_count *)v23, @"kGprsPdpAuthenticationFailure", self->_body);
      goto LABEL_228;
    case 'B':
      char v46 = self->fRegistry.__ptr_;
      v23 = self->fRegistry.__cntrl_;
      if (v23) {
        atomic_fetch_add_explicit((atomic_ullong *volatile)v23 + 1, 1uLL, memory_order_relaxed);
      }
      id v24 = sub_100BAEC44(v46, (std::__shared_weak_count *)v23, @"kGprsInvalidMobileClass", self->_body);
      goto LABEL_228;
    default:
      if (error == 104)
      {
        [+[CellDataActivationFailureAlertState sharedInstance] setAction:1];
        if (v18 && (*(unsigned int (**)(uint64_t))(*(void *)v18 + 152))(v18))
        {
          v25 = self->fRegistry.__ptr_;
          v26 = self->fRegistry.__cntrl_;
          if (v26) {
            atomic_fetch_add_explicit((atomic_ullong *volatile)v26 + 1, 1uLL, memory_order_relaxed);
          }
          id v7 = sub_100BAEC44(v25, (std::__shared_weak_count *)v26, @"WLANCALLING_FAILURE_TITLE", @"WLAN Calling Unavailable");
          if (v26) {
            sub_10004D2C8((std::__shared_weak_count *)v26);
          }
          v27 = self->fRegistry.__ptr_;
          v23 = self->fRegistry.__cntrl_;
          if (v23) {
            atomic_fetch_add_explicit((atomic_ullong *volatile)v23 + 1, 1uLL, memory_order_relaxed);
          }
          id v24 = sub_100BAEC44(v27, (std::__shared_weak_count *)v23, @"WLANCALLING_FAILURE_BODY", @"WLAN Calling is not available. Contact your carrier for more information. You can manage WLAN Calling in Settings.");
        }
        else
        {
          v74 = self->fRegistry.__ptr_;
          v75 = self->fRegistry.__cntrl_;
          if (v75) {
            atomic_fetch_add_explicit((atomic_ullong *volatile)v75 + 1, 1uLL, memory_order_relaxed);
          }
          id v7 = sub_100BAEC44(v74, (std::__shared_weak_count *)v75, @"WIFICALLING_FAILURE_TITLE", @"Wi-Fi Calling Unavailable");
          if (v75) {
            sub_10004D2C8((std::__shared_weak_count *)v75);
          }
          v76 = self->fRegistry.__ptr_;
          v23 = self->fRegistry.__cntrl_;
          if (v23) {
            atomic_fetch_add_explicit((atomic_ullong *volatile)v23 + 1, 1uLL, memory_order_relaxed);
          }
          id v24 = sub_100BAEC44(v76, (std::__shared_weak_count *)v23, @"WIFICALLING_FAILURE_BODY", @"Wi-Fi Calling is not available. Contact your carrier for more information. You can manage Wi-Fi Calling in Settings.");
        }
        goto LABEL_228;
      }
LABEL_43:
      reason = self->_reason;
      if (!reason) {
        goto LABEL_208;
      }
      if ([(NSString *)reason isEqualToString:kCTRegistrationDataActivationPreventionReasonIntlRoamingOff])
      {
        if (v3) {
          [+[CellDataActivationFailureAlertState sharedInstance] setAction:1];
        }
        v34 = @"EDGE_ROAMING_FAILURE";
      }
      else
      {
        if (![(NSString *)self->_reason isEqualToString:kCTRegistrationDataActivationPreventionReasonOff])
        {
LABEL_208:
          id v43 = 0;
          goto LABEL_230;
        }
        [+[CellDataActivationFailureAlertState sharedInstance] setAction:1];
        v34 = @"EDGE_OFF_FAILURE";
      }
      v89 = self->fRegistry.__ptr_;
      v90 = self->fRegistry.__cntrl_;
      if (v90) {
        atomic_fetch_add_explicit((atomic_ullong *volatile)v90 + 1, 1uLL, memory_order_relaxed);
      }
      id v7 = sub_100BAEC44(v89, (std::__shared_weak_count *)v90, [(__CFString *)v34 stringByAppendingString:@"_TITLE"], self->_title);
      if (v90) {
        sub_10004D2C8((std::__shared_weak_count *)v90);
      }
      if (self->_suggestWiFi)
      {
        if (!v18) {
          goto LABEL_225;
        }
        if ((*(unsigned int (**)(uint64_t))(*(void *)v18 + 144))(v18))
        {
          id v91 = [(__CFString *)v34 stringByAppendingString:@"_BODY"];
          if ((*(unsigned int (**)(uint64_t))(*(void *)v18 + 152))(v18)) {
            id v91 = [v91 stringByAppendingString:@"_WLAN"];
          }
          if (([v91 isEqualToString:@"EDGE_ROAMING_FAILURE_BODY"] & v3) == 1) {
            id v91 = [v91 stringByAppendingString:@"_WITHSETTINGS"];
          }
          if (([v91 isEqualToString:@"EDGE_ROAMING_FAILURE_BODY_WLAN"] & v3) == 1) {
            id v91 = [v91 stringByAppendingString:@"_WITHSETTINGS"];
          }
          v92 = self->fRegistry.__ptr_;
          v23 = self->fRegistry.__cntrl_;
          if (v23) {
            atomic_fetch_add_explicit((atomic_ullong *volatile)v23 + 1, 1uLL, memory_order_relaxed);
          }
          id v24 = sub_100BAEC44(v92, (std::__shared_weak_count *)v23, v91, self->_body);
          goto LABEL_228;
        }
      }
      else if (!v18)
      {
        goto LABEL_225;
      }
      if ((*(unsigned int (**)(uint64_t))(*(void *)v18 + 152))(v18))
      {
        v105 = self->fRegistry.__ptr_;
        v23 = self->fRegistry.__cntrl_;
        if (v23) {
          atomic_fetch_add_explicit((atomic_ullong *volatile)v23 + 1, 1uLL, memory_order_relaxed);
        }
        id v24 = sub_100BAEC44(v105, (std::__shared_weak_count *)v23, [(__CFString *)v34 stringByAppendingString:@"_BODY_NO_WLAN"], self->_body);
        goto LABEL_228;
      }
LABEL_225:
      v106 = self->fRegistry.__ptr_;
      v23 = self->fRegistry.__cntrl_;
      if (v23) {
        atomic_fetch_add_explicit((atomic_ullong *volatile)v23 + 1, 1uLL, memory_order_relaxed);
      }
      id v24 = sub_100BAEC44(v106, (std::__shared_weak_count *)v23, [(__CFString *)v34 stringByAppendingString:@"_BODY_NO_WIFI"], self->_body);
LABEL_228:
      id v43 = v24;
      if (v23) {
        sub_10004D2C8((std::__shared_weak_count *)v23);
      }
LABEL_230:
      id v55 = 0;
      id v56 = 0;
      if ((v19 & 1) == 0) {
        goto LABEL_231;
      }
LABEL_232:
      if ([+[CellDataActivationFailureAlertState sharedInstance] action]&& !v55)
      {
        v107 = self->fRegistry.__ptr_;
        v108 = self->fRegistry.__cntrl_;
        if (v108) {
          atomic_fetch_add_explicit((atomic_ullong *volatile)v108 + 1, 1uLL, memory_order_relaxed);
        }
        id v55 = sub_100BAEC44(v107, (std::__shared_weak_count *)v108, @"EDGE_FAILURE_SETTINGS", @"Settings");
        if (v108) {
          sub_10004D2C8((std::__shared_weak_count *)v108);
        }
      }
      if (v56) {
        goto LABEL_244;
      }
      v109 = self->fRegistry.__ptr_;
      v110 = self->fRegistry.__cntrl_;
      if (v110) {
        atomic_fetch_add_explicit((atomic_ullong *volatile)v110 + 1, 1uLL, memory_order_relaxed);
      }
      id v56 = sub_100BAEC44(v109, (std::__shared_weak_count *)v110, @"EDGE_OK", self->_okText);
      if (v110) {
        sub_10004D2C8((std::__shared_weak_count *)v110);
      }
      if (v56)
      {
LABEL_244:
        okText = self->_okText;
        if (okText) {

        }
        self->_okText = (NSString *)[v56 copy];
      }
      if (v55)
      {
        settingsText = self->_settingsText;
        if (settingsText) {

        }
        self->_settingsText = (NSString *)[v55 copy];
      }
      if (v43)
      {
        body = self->_body;
        if (body) {

        }
        self->_body = (NSString *)[v43 copy];
      }
      if (v7)
      {
        title = self->_title;
        if (title) {

        }
        self->_title = (NSString *)[v7 copy];
      }
      return;
  }
}

- (void)show
{
  id v3 = +[NSMutableDictionary dictionary];
  [v3 setObject:self->_title forKeyedSubscript:kCFUserNotificationAlertHeaderKey];
  [v3 setObject:self->_body forKeyedSubscript:kCFUserNotificationAlertMessageKey];
  [v3 setObject:self->_okText forKeyedSubscript:kCFUserNotificationDefaultButtonTitleKey];
  [v3 setObject:&__kCFBooleanTrue forKeyedSubscript:kCFUserNotificationAlertTopMostKey];
  [v3 setObject:&__kCFBooleanTrue forKeyedSubscript:SBUserNotificationDismissOnLock];
  settingsText = self->_settingsText;
  if (settingsText) {
    [v3 setObject:settingsText forKeyedSubscript:kCFUserNotificationAlternateButtonTitleKey];
  }
  v5 = +[SBSUserNotificationImageDefinition definitionWithSystemImageName:tintColor:](SBSUserNotificationImageDefinition, "definitionWithSystemImageName:tintColor:", @"antenna.radiowaves.left.and.right", +[BSColor colorWithRed:0.505882353 green:0.819607843 blue:0.341176471 alpha:1.0]);
  id v6 = objc_alloc_init((Class)SBSUserNotificationSystemApertureContentDefinition);
  [v6 setLeadingImageDefinition:v5];
  [v6 setAlertMessage:self->_body];
  [v6 setPreventsAutomaticDismissal:1];
  [v6 setDefaultButtonTitle:self->_okText];
  if (self->_settingsText) {
    objc_msgSend(v6, "setAlternateButtonTitle:");
  }
  [v3 setObject:&__kCFBooleanTrue forKeyedSubscript:SBUserNotificationSystemAperturePresentationKey];
  id v7 = [v6 build];
  [v3 setObject:v7 forKeyedSubscript:SBUserNotificationSystemApertureContentDefinitionKey];
  SInt32 error = 0;
  objc_super v8 = CFUserNotificationCreate(0, 0.0, 3uLL, &error, (CFDictionaryRef)v3);
  v9 = v8;
  uint64_t v10 = error;
  if (!error && v8)
  {
    CFRunLoopSourceRef RunLoopSource = CFUserNotificationCreateRunLoopSource(0, v8, (CFUserNotificationCallBack)sub_100BB050C, 0);
    if (RunLoopSource)
    {
      uint64_t v12 = RunLoopSource;
      [+[CellDataActivationFailureAlertState sharedInstance] lockScheduled];
      Main = CFRunLoopGetMain();
      CFRunLoopAddSource(Main, v12, kCFRunLoopCommonModes);
      v9 = v12;
    }
    else
    {
      unsigned int v15 = *(NSObject **)self->fLogger;
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "#I Couldn't create runloop source for notification", buf, 2u);
      }
    }
LABEL_15:
    CFRelease(v9);
    return;
  }
  uint64_t v14 = *(NSObject **)self->fLogger;
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v18 = v10;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "#I Couldn't create notification!  SInt32 error = %ld", buf, 0xCu);
  }
  if (v9) {
    goto LABEL_15;
  }
}

- (void).cxx_destruct
{
  cntrl = self->fRegistry.__cntrl_;
  if (cntrl) {
    sub_10004D2C8((std::__shared_weak_count *)cntrl);
  }
  xpc_release(self->_additionalData.fObj.fObj);
  self->_additionalData.fObj.fObj = 0;
}

- (id).cxx_construct
{
  self->_additionalData.fObj.fObj = (dispatch_object_s *)xpc_null_create();
  self->fRegistry.__ptr_ = 0;
  self->fRegistry.__cntrl_ = 0;
  return self;
}

@end
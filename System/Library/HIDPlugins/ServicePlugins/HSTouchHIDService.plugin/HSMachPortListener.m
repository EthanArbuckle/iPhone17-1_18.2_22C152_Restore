@interface HSMachPortListener
+ (SendRight)getSendRightFromServer:(const SendRight *)a3;
- (HSMachPortListener)initWithReceiveRight:(ReceiveRight *)a3 queue:(id)a4 clientHandler:(id)a5;
- (id).cxx_construct;
- (void)_handleClient;
- (void)close;
- (void)dealloc;
@end

@implementation HSMachPortListener

+ (SendRight)getSendRightFromServer:(const SendRight *)a3
{
  kern_return_t v37;
  mach_port_t previous;
  os_log_type_t v39;
  id v40;
  char *v41;
  BOOL v42;
  mach_msg_return_t v43;
  mach_msg_header_t msg;
  int v45;
  os_log_type_t type;
  id location;
  char *v48;
  unsigned char v50[24];
  HSUtil::PortRight *v51;
  SEL v52;
  id v53;
  HSUtil::SendRight *v54;
  uint8_t v55[48];
  char v56[1024];
  uint8_t v57[48];
  char v58[1024];
  uint8_t v59[48];
  char v60[1024];
  uint8_t v61[48];
  char v62[1024];
  uint8_t v63[48];
  char v64[1024];
  uint8_t v65[48];
  char v66[1024];
  uint8_t v67[56];
  char v68[1024];
  SendRight result;

  v12 = v3;
  v54 = v3;
  v53 = a1;
  v52 = a2;
  v51 = (HSUtil::PortRight *)a3;
  if (!HSUtil::PortRight::operator BOOL((uint64_t)a3))
  {
    v11 = +[NSAssertionHandler currentHandler];
    [(NSAssertionHandler *)v11 handleFailureInMethod:v52, v53, @"HSMachPortListener.mm", 21, @"Invalid parameter not satisfying: %@", @"serverSendRight" object file lineNumber description];
  }
  HSUtil::ReceiveRight::ReceiveRight((HSUtil::PortRight *)v50);
  if (HSUtil::PortRight::operator BOOL((uint64_t)v50))
  {
    *(void *)&msg.msgh_remote_port = 0;
    *(void *)&msg.msgh_voucher_port = 0;
    *(void *)&msg.msgh_bits = 5139;
    msg.msgh_remote_port = HSUtil::PortRight::port(v51);
    msg.msgh_local_port = HSUtil::PortRight::port((HSUtil::PortRight *)v50);
    msg.msgh_voucher_port = 0;
    msg.msgh_id = 0;
    v43 = mach_msg(&msg, 17, 0x18u, 0, 0, 0, 0);
    v42 = v43 == 0;
    if (v43)
    {
      v41 = basename_r("/Library/Caches/com.apple.xbs/Sources/HIDSensingPipeline/HIDSensingPipeline/HSMachPortListener.mm", v66);
      v40 = &_os_log_default;
      v39 = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled((os_log_t)v40, OS_LOG_TYPE_ERROR))
      {
        __os_log_helper_16_2_4_8_32_8_32_8_0_8_32((uint64_t)v65, (uint64_t)"+[HSMachPortListener getSendRightFromServer:]", (uint64_t)v41, 37, (uint64_t)"mr==MACH_MSG_SUCCESS");
        _os_log_error_impl(&def_411C8, (os_log_t)v40, v39, "Assertion failed (%s @ %s:%ju): %s", v65, 0x2Au);
      }
      objc_storeStrong(&v40, 0);
      HSUtil::SendRight::SendRight(v12);
      v45 = 1;
    }
    else
    {
      previous = 0;
      mach_port_t task = mach_task_self_;
      mach_port_name_t name = HSUtil::PortRight::port((HSUtil::PortRight *)v50);
      mach_port_t notify = HSUtil::PortRight::port((HSUtil::PortRight *)v50);
      v37 = mach_port_request_notification(task, name, 70, 0, notify, 0x15u, &previous);
      BOOL v36 = v37 == 0;
      if (v37)
      {
        v35 = basename_r("/Library/Caches/com.apple.xbs/Sources/HIDSensingPipeline/HIDSensingPipeline/HSMachPortListener.mm", v64);
        id v34 = &_os_log_default;
        os_log_type_t v33 = OS_LOG_TYPE_ERROR;
        if (os_log_type_enabled((os_log_t)v34, OS_LOG_TYPE_ERROR))
        {
          __os_log_helper_16_2_4_8_32_8_32_8_0_8_32((uint64_t)v63, (uint64_t)"+[HSMachPortListener getSendRightFromServer:]", (uint64_t)v35, 44, (uint64_t)"kr==KERN_SUCCESS");
          _os_log_error_impl(&def_411C8, (os_log_t)v34, v33, "Assertion failed (%s @ %s:%ju): %s", v63, 0x2Au);
        }
        objc_storeStrong(&v34, 0);
        HSUtil::SendRight::SendRight(v12);
        v45 = 1;
      }
      else
      {
        HSUtil::SendRight::SendRight(v32, previous);
        if (!HSUtil::PortRight::operator BOOL((uint64_t)v32))
        {
          mach_port_name_t rcv_name = HSUtil::PortRight::port((HSUtil::PortRight *)v50);
          v43 = mach_msg(&v27, 2, 0, 0x58u, rcv_name, 0, 0);
          BOOL v26 = v43 == 0;
          if (v43)
          {
            v25 = basename_r("/Library/Caches/com.apple.xbs/Sources/HIDSensingPipeline/HIDSensingPipeline/HSMachPortListener.mm", v60);
            os_log_t oslog = &_os_log_default;
            os_log_type_t v23 = OS_LOG_TYPE_ERROR;
            if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
            {
              __os_log_helper_16_2_4_8_32_8_32_8_0_8_32((uint64_t)v59, (uint64_t)"+[HSMachPortListener getSendRightFromServer:]", (uint64_t)v25, 66, (uint64_t)"mr==MACH_MSG_SUCCESS");
              _os_log_error_impl(&def_411C8, oslog, v23, "Assertion failed (%s @ %s:%ju): %s", v59, 0x2Au);
            }
            objc_storeStrong((id *)&oslog, 0);
            HSUtil::SendRight::SendRight(v12);
            v45 = 1;
          }
          else
          {
            HSUtil::SendRight::SendRight((HSUtil::SendRight *)v22);
            if ((v27.msgh_bits & 0x1F) == 0x10)
            {
              HSUtil::ReceiveRight::ReceiveRight(v21, v27.msgh_remote_port);
              v45 = 4;
              HSUtil::ReceiveRight::~ReceiveRight((HSUtil::ReceiveRight *)v21);
            }
            else if ((v27.msgh_bits & 0x1F) == 18 || (v27.msgh_bits & 0x1F) == 17)
            {
              HSUtil::SendRight::SendRight(v20, v27.msgh_remote_port);
              HSUtil::SendRight::operator=((uint64_t)v22, (uint64_t)v20);
              HSUtil::SendRight::~SendRight((HSUtil::SendRight *)v20);
            }
            BOOL v19 = v27.msgh_id == 0;
            if (v27.msgh_id)
            {
              v18 = basename_r("/Library/Caches/com.apple.xbs/Sources/HIDSensingPipeline/HIDSensingPipeline/HSMachPortListener.mm", v58);
              os_log_t v17 = &_os_log_default;
              os_log_type_t v16 = OS_LOG_TYPE_ERROR;
              if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
              {
                __os_log_helper_16_2_4_8_32_8_32_8_0_8_32((uint64_t)v57, (uint64_t)"+[HSMachPortListener getSendRightFromServer:]", (uint64_t)v18, 85, (uint64_t)"!recvMsg.header.msgh_id");
                _os_log_error_impl(&def_411C8, v17, v16, "Assertion failed (%s @ %s:%ju): %s", v57, 0x2Au);
              }
              objc_storeStrong((id *)&v17, 0);
              HSUtil::SendRight::SendRight(v12);
              v45 = 1;
            }
            else if (HSUtil::PortRight::operator BOOL((uint64_t)v22))
            {
              HSUtil::SendRight::SendRight(v12, (uint64_t)v22);
              v45 = 1;
            }
            else
            {
              v14 = basename_r("/Library/Caches/com.apple.xbs/Sources/HIDSensingPipeline/HIDSensingPipeline/HSMachPortListener.mm", v56);
              os_log_t v13 = &_os_log_default;
              if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
              {
                __os_log_helper_16_2_4_8_32_8_32_8_0_8_32((uint64_t)v55, (uint64_t)"+[HSMachPortListener getSendRightFromServer:]", (uint64_t)v14, 87, (uint64_t)"replySendRight");
                _os_log_error_impl(&def_411C8, v13, OS_LOG_TYPE_ERROR, "Assertion failed (%s @ %s:%ju): %s", v55, 0x2Au);
              }
              objc_storeStrong((id *)&v13, 0);
              HSUtil::SendRight::SendRight(v12);
              v45 = 1;
            }
            HSUtil::SendRight::~SendRight((HSUtil::SendRight *)v22);
          }
        }
        else
        {
          v30 = basename_r("/Library/Caches/com.apple.xbs/Sources/HIDSensingPipeline/HIDSensingPipeline/HSMachPortListener.mm", v62);
          id v29 = &_os_log_default;
          os_log_type_t v28 = OS_LOG_TYPE_ERROR;
          if (os_log_type_enabled((os_log_t)v29, OS_LOG_TYPE_ERROR))
          {
            __os_log_helper_16_2_4_8_32_8_32_8_0_8_32((uint64_t)v61, (uint64_t)"+[HSMachPortListener getSendRightFromServer:]", (uint64_t)v30, 49, (uint64_t)"!oldNotifySendRight");
            _os_log_error_impl(&def_411C8, (os_log_t)v29, v28, "Assertion failed (%s @ %s:%ju): %s", v61, 0x2Au);
          }
          objc_storeStrong(&v29, 0);
          HSUtil::SendRight::SendRight(v12);
          v45 = 1;
        }
        HSUtil::SendRight::~SendRight((HSUtil::SendRight *)v32);
      }
    }
  }
  else
  {
    v48 = basename_r("/Library/Caches/com.apple.xbs/Sources/HIDSensingPipeline/HIDSensingPipeline/HSMachPortListener.mm", v68);
    location = &_os_log_default;
    type = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_4_8_32_8_32_8_0_8_32((uint64_t)v67, (uint64_t)"+[HSMachPortListener getSendRightFromServer:]", (uint64_t)v48, 25, (uint64_t)"receiveRight");
      _os_log_error_impl(&def_411C8, (os_log_t)location, type, "Assertion failed (%s @ %s:%ju): %s", v67, 0x2Au);
    }
    objc_storeStrong(&location, 0);
    HSUtil::SendRight::SendRight(v12);
    v45 = 1;
  }
  HSUtil::ReceiveRight::~ReceiveRight((HSUtil::ReceiveRight *)v50);
  result._mp = v6;
  result._vptr$PortRight = v5;
  return result;
}

- (HSMachPortListener)initWithReceiveRight:(ReceiveRight *)a3 queue:(id)a4 clientHandler:(id)a5
{
  id val = self;
  SEL v51 = a2;
  v50 = a3;
  id location = 0;
  objc_storeStrong(&location, a4);
  id v48 = 0;
  objc_storeStrong(&v48, a5);
  if (!HSUtil::PortRight::operator BOOL((uint64_t)v50))
  {
    v18 = +[NSAssertionHandler currentHandler];
    [(NSAssertionHandler *)v18 handleFailureInMethod:v51, val, @"HSMachPortListener.mm", 95, @"Invalid parameter not satisfying: %@", @"receiveRight" object file lineNumber description];
  }
  if (!location)
  {
    os_log_t v17 = +[NSAssertionHandler currentHandler];
    [(NSAssertionHandler *)v17 handleFailureInMethod:v51, val, @"HSMachPortListener.mm", 96, @"Invalid parameter not satisfying: %@", @"queue" object file lineNumber description];
  }
  if (!v48)
  {
    os_log_type_t v16 = +[NSAssertionHandler currentHandler];
    [(NSAssertionHandler *)v16 handleFailureInMethod:v51, val, @"HSMachPortListener.mm", 97, @"Invalid parameter not satisfying: %@", @"clientHandler" object file lineNumber description];
  }
  id v5 = val;
  id val = 0;
  v47.receiver = v5;
  v47.super_class = (Class)HSMachPortListener;
  v15 = [(HSMachPortListener *)&v47 init];
  id val = v15;
  objc_storeStrong(&val, v15);
  if (v15)
  {
    objc_storeStrong((id *)val + 1, location);
    id handle_4 = objc_retainBlock(v48);
    uint64_t v6 = (void *)*((void *)val + 2);
    *((void *)val + 2) = handle_4;

    std::unique_lock<std::mutex>::unique_lock[abi:ne180100]((uint64_t)v45, (uint64_t)val + 24);
    std::make_shared[abi:ne180100]<HSUtil::ReceiveRight,HSUtil::ReceiveRight,void>((uint64_t)v50, v44);
    std::shared_ptr<std::vector<std::atomic<HSUtil::CoderKey const*>>>::operator=[abi:ne180100]((uint64_t *)val + 11, v44);
    std::shared_ptr<std::vector<std::atomic<HSUtil::CoderKey const*>>>::~shared_ptr[abi:ne180100]((uint64_t)v44);
    v7 = (HSUtil::PortRight *)std::__compressed_pair_elem<std::allocator<HSUtil::Encoder::ContainerRecord> &,1,false>::__get[abi:ne180100]((uint64_t)val + 88);
    unsigned int handle = HSUtil::PortRight::port(v7);
    dispatch_source_t v8 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_mach_recv, handle, 0, *((dispatch_queue_t *)val + 1));
    v9 = (void *)*((void *)val + 13);
    *((void *)val + 13) = v8;

    BOOL v43 = 0;
    BOOL v43 = *((void *)val + 13) != 0;
    if (v43)
    {
      objc_initWeak(&from, val);
      source = *((void *)val + 13);
      handler = _NSConcreteStackBlock;
      int v34 = -1073741824;
      int v35 = 0;
      BOOL v36 = __63__HSMachPortListener_initWithReceiveRight_queue_clientHandler___block_invoke;
      v37 = &unk_141240;
      objc_copyWeak(&v38, &from);
      dispatch_source_set_event_handler(source, &handler);
      v26[0] = 0;
      v26[1] = v26;
      int v27 = 301989888;
      int v28 = 64;
      id v29 = __Block_byref_object_copy__1;
      v30 = __Block_byref_object_dispose__1;
      v31 = "";
      std::shared_ptr<std::vector<std::atomic<HSUtil::CoderKey const*>>>::shared_ptr[abi:ne180100](v32, (void *)val + 11);
      v10 = *((void *)val + 13);
      v20 = _NSConcreteStackBlock;
      int v21 = -1073741824;
      int v22 = 0;
      os_log_type_t v23 = __63__HSMachPortListener_initWithReceiveRight_queue_clientHandler___block_invoke_36;
      v24 = &unk_142B68;
      v25 = v26;
      dispatch_source_set_cancel_handler(v10, &v20);
      dispatch_resume(*((dispatch_object_t *)val + 13));
      v53 = (HSMachPortListener *)val;
      int v46 = 1;
      _Block_object_dispose(v26, 8);
      std::shared_ptr<std::vector<std::atomic<HSUtil::CoderKey const*>>>::~shared_ptr[abi:ne180100]((uint64_t)v32);
      objc_destroyWeak(&v38);
      objc_destroyWeak(&from);
    }
    else
    {
      v42 = basename_r("/Library/Caches/com.apple.xbs/Sources/HIDSensingPipeline/HIDSensingPipeline/HSMachPortListener.mm", v55);
      os_log_t oslog = &_os_log_default;
      os_log_type_t type = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
      {
        __os_log_helper_16_2_4_8_32_8_32_8_0_8_32((uint64_t)v54, (uint64_t)"-[HSMachPortListener initWithReceiveRight:queue:clientHandler:]", (uint64_t)v42, 109, (uint64_t)"_state.source");
        _os_log_error_impl(&def_411C8, oslog, type, "Assertion failed (%s @ %s:%ju): %s", v54, 0x2Au);
      }
      objc_storeStrong((id *)&oslog, 0);
      v53 = 0;
      int v46 = 1;
    }
    std::unique_lock<std::mutex>::~unique_lock[abi:ne180100]((uint64_t)v45);
  }
  else
  {
    v53 = 0;
    int v46 = 1;
  }
  objc_storeStrong(&v48, 0);
  objc_storeStrong(&location, 0);
  objc_storeStrong(&val, 0);
  return v53;
}

void __63__HSMachPortListener_initWithReceiveRight_queue_clientHandler___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleClient];
}

uint64_t __63__HSMachPortListener_initWithReceiveRight_queue_clientHandler___block_invoke_36(uint64_t a1)
{
  return std::shared_ptr<HSUtil::ReceiveRight>::reset[abi:ne180100]((uint64_t *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                              + 48));
}

- (void)dealloc
{
  v4 = self;
  SEL v3 = a2;
  [(HSMachPortListener *)self close];
  v2.receiver = v4;
  v2.super_class = (Class)HSMachPortListener;
  [(HSMachPortListener *)&v2 dealloc];
}

- (void)close
{
  uint64_t v6 = self;
  SEL v5 = a2;
  std::unique_lock<std::mutex>::unique_lock[abi:ne180100]((uint64_t)v4, (uint64_t)self + 24);
  if (std::shared_ptr<std::vector<std::atomic<HSUtil::CoderKey const*>>>::operator BOOL[abi:ne180100]((uint64_t)v6 + 88))
  {
    dispatch_source_cancel(*((dispatch_source_t *)v6 + 13));
    objc_storeStrong((id *)v6 + 13, 0);
    std::shared_ptr<std::vector<std::atomic<HSUtil::CoderKey const*>>>::shared_ptr[abi:ne180100](v2);
    std::shared_ptr<std::vector<std::atomic<HSUtil::CoderKey const*>>>::operator=[abi:ne180100]((uint64_t *)v6 + 11, v2);
    std::shared_ptr<std::vector<std::atomic<HSUtil::CoderKey const*>>>::~shared_ptr[abi:ne180100]((uint64_t)v2);
    int v3 = 0;
  }
  else
  {
    int v3 = 1;
  }
  std::unique_lock<std::mutex>::~unique_lock[abi:ne180100]((uint64_t)v4);
}

- (void)_handleClient
{
  mach_msg_return_t v28;
  mach_msg_header_t msg;
  audit_token_t v30;
  int v31;
  std::unique_lock<std::mutex> v32;
  uint64_t v33;
  uint64_t v34;
  SecTaskRef v35;
  uint8_t v36[48];
  char v37[1024];
  uint8_t v38[48];
  char v39[1024];
  uint8_t v40[48];
  char v41[1024];
  uint8_t v42[56];
  char v43[1024];

  int v34 = __chkstk_darwin(self, a2);
  os_log_type_t v33 = v2;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(v34 + 8));
  std::unique_lock<std::mutex>::unique_lock[abi:ne180100]((uint64_t)&v32, v34 + 24);
  if (std::shared_ptr<std::vector<std::atomic<HSUtil::CoderKey const*>>>::operator BOOL[abi:ne180100](v34 + 88))
  {
    int v3 = (HSUtil::PortRight *)std::__compressed_pair_elem<std::allocator<HSUtil::Encoder::ContainerRecord> &,1,false>::__get[abi:ne180100](v34 + 88);
    mach_port_name_t rcv_name = HSUtil::PortRight::port(v3);
    int v28 = mach_msg(&msg, 50331906, 0, 0x4Cu, rcv_name, 0, 0);
    BOOL v27 = v28 == 0;
    if (v28)
    {
      BOOL v26 = basename_r("/Library/Caches/com.apple.xbs/Sources/HIDSensingPipeline/HIDSensingPipeline/HSMachPortListener.mm", v43);
      id location = &_os_log_default;
      os_log_type_t type = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_ERROR))
      {
        __os_log_helper_16_2_4_8_32_8_32_8_0_8_32((uint64_t)v42, (uint64_t)"-[HSMachPortListener _handleClient]", (uint64_t)v26, 162, (uint64_t)"mr==MACH_MSG_SUCCESS");
        _os_log_error_impl(&def_411C8, (os_log_t)location, type, "Assertion failed (%s @ %s:%ju): %s", v42, 0x2Au);
      }
      objc_storeStrong(&location, 0);
      v31 = 1;
    }
    else
    {
      HSUtil::SendRight::SendRight((HSUtil::SendRight *)v23);
      if ((msg.msgh_bits & 0x1F) == 0x10)
      {
        HSUtil::ReceiveRight::ReceiveRight(v22, msg.msgh_remote_port);
        v31 = 2;
        HSUtil::ReceiveRight::~ReceiveRight((HSUtil::ReceiveRight *)v22);
      }
      else if ((msg.msgh_bits & 0x1F) == 18 || (msg.msgh_bits & 0x1F) == 17)
      {
        HSUtil::SendRight::SendRight(v21, msg.msgh_remote_port);
        HSUtil::SendRight::operator=((uint64_t)v23, (uint64_t)v21);
        HSUtil::SendRight::~SendRight((HSUtil::SendRight *)v21);
      }
      if (HSUtil::PortRight::operator BOOL((uint64_t)v23))
      {
        std::unique_lock<std::mutex>::unlock(&v32);
        audit_token_t token = v30;
        int v35 = SecTaskCreateWithAuditToken(0, &token);
        id v16 = v35;
        BOOL v14 = v16 != 0;
        if (v16)
        {
          (*(void (**)(void *__return_ptr))(*(void *)(v34 + 16) + 16))(v10);
          if (HSUtil::PortRight::operator BOOL((uint64_t)v10))
          {
            v9.msgh_size = 0;
            v9.msgh_bits = 4883;
            v9.msgh_remote_port = HSUtil::PortRight::port((HSUtil::PortRight *)v23);
            v9.msgh_local_port = HSUtil::PortRight::port((HSUtil::PortRight *)v10);
            v9.msgh_voucher_port = 0;
            v9.msgh_id = 0;
            int v28 = mach_msg(&v9, 17, 0x18u, 0, 0, 0, 0);
            BOOL v8 = v28 == 0;
            if (v28)
            {
              v7 = basename_r("/Library/Caches/com.apple.xbs/Sources/HIDSensingPipeline/HIDSensingPipeline/HSMachPortListener.mm", v37);
              os_log_t v6 = &_os_log_default;
              if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
              {
                __os_log_helper_16_2_4_8_32_8_32_8_0_8_32((uint64_t)v36, (uint64_t)"-[HSMachPortListener _handleClient]", (uint64_t)v7, 203, (uint64_t)"mr==MACH_MSG_SUCCESS");
                _os_log_error_impl(&def_411C8, v6, OS_LOG_TYPE_ERROR, "Assertion failed (%s @ %s:%ju): %s", v36, 0x2Au);
              }
              objc_storeStrong((id *)&v6, 0);
              v31 = 1;
            }
            else
            {
              v31 = 0;
            }
          }
          else
          {
            v31 = 1;
          }
          HSUtil::SendRight::~SendRight((HSUtil::SendRight *)v10);
        }
        else
        {
          os_log_t v13 = basename_r("/Library/Caches/com.apple.xbs/Sources/HIDSensingPipeline/HIDSensingPipeline/HSMachPortListener.mm", v39);
          os_log_t oslog = &_os_log_default;
          os_log_type_t v11 = OS_LOG_TYPE_ERROR;
          if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
          {
            __os_log_helper_16_2_4_8_32_8_32_8_0_8_32((uint64_t)v38, (uint64_t)"-[HSMachPortListener _handleClient]", (uint64_t)v13, 186, (uint64_t)"task");
            _os_log_error_impl(&def_411C8, oslog, v11, "Assertion failed (%s @ %s:%ju): %s", v38, 0x2Au);
          }
          objc_storeStrong((id *)&oslog, 0);
          v31 = 1;
        }
        objc_storeStrong(&v16, 0);
      }
      else
      {
        BOOL v19 = basename_r("/Library/Caches/com.apple.xbs/Sources/HIDSensingPipeline/HIDSensingPipeline/HSMachPortListener.mm", v41);
        id v18 = &_os_log_default;
        os_log_type_t v17 = OS_LOG_TYPE_ERROR;
        if (os_log_type_enabled((os_log_t)v18, OS_LOG_TYPE_ERROR))
        {
          __os_log_helper_16_2_4_8_32_8_32_8_0_8_32((uint64_t)v40, (uint64_t)"-[HSMachPortListener _handleClient]", (uint64_t)v19, 181, (uint64_t)"replySendRight");
          _os_log_error_impl(&def_411C8, (os_log_t)v18, v17, "Assertion failed (%s @ %s:%ju): %s", v40, 0x2Au);
        }
        objc_storeStrong(&v18, 0);
        v31 = 1;
      }
      HSUtil::SendRight::~SendRight((HSUtil::SendRight *)v23);
    }
  }
  else
  {
    v31 = 1;
  }
  std::unique_lock<std::mutex>::~unique_lock[abi:ne180100]((uint64_t)&v32);
}

- (void).cxx_destruct
{
}

- (id).cxx_construct
{
  return self;
}

@end
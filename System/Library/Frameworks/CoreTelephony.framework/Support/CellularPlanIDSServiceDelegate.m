@interface CellularPlanIDSServiceDelegate
- (BOOL)registerWithName:(id)a3 supportedIncomingMessageTypes:(bitset<16UL>)a4 validateDeviceCallback:(id)a5 devicesChangedCallback:(id)a6 incomingMessageCallback:(id)a7;
- (BOOL)sendMessage:(CellularPlanIDSMessage *)a3 responseHandler:;
- (CellularPlanIDSServiceDelegate)initWithQueue:(dispatch_queue_s *)a3 registry:(const void *)a4 serviceType:(unsigned __int8)a5;
- (id).cxx_construct;
- (id)_getDevicesForMessageType:(unsigned __int16)a3;
- (id)_sendProtobufMessage:(CellularPlanIDSMessage *)a3 destinations:;
- (id)_sendResourceMessage:(CellularPlanIDSMessage *)a3 destinations:;
- (optional<CellularPlanIDSDevice>)_lookupDevice:(SEL)a3 forMessageType:(id)a4;
- (void)_handleIncomingIndication:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)_handleIncomingRequest:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)_handleIncomingResponse:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)_service:(id)a3 devicesChanged:(id)a4 isQueried:(BOOL)a5;
- (void)_setTimeoutForMessageId:()basic_string<char responseTimer:()std:(std::allocator<char>> *)data :char_traits<char> timeout:;
- (void)dealloc;
- (void)handledResponse:()basic_string<char;
- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7 context:(id)a8;
- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 hasBeenDeliveredWithContext:(id)a6;
- (void)service:(id)a3 account:(id)a4 incomingResourceAtURL:(id)a5 metadata:(id)a6 fromID:(id)a7 context:(id)a8;
- (void)service:(id)a3 account:(id)a4 incomingUnhandledProtobuf:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)service:(id)a3 devicesChanged:(id)a4;
- (void)service:(id)a3 linkedDevicesChanged:(id)a4;
- (void)startService;
- (void)updateTimeoutForTransaction:()basic_string<char timeout:()std:(std::allocator<char>> *)a3 :char_traits<char>;
@end

@implementation CellularPlanIDSServiceDelegate

- (CellularPlanIDSServiceDelegate)initWithQueue:(dispatch_queue_s *)a3 registry:(const void *)a4 serviceType:(unsigned __int8)a5
{
  v14.receiver = self;
  v14.super_class = (Class)CellularPlanIDSServiceDelegate;
  id v7 = [(CellularPlanIDSServiceDelegate *)&v14 init];
  v8 = v7;
  if (v7)
  {
    uint64_t v10 = *(void *)a4;
    uint64_t v9 = *((void *)a4 + 1);
    if (v9) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v9 + 8), 1uLL, memory_order_relaxed);
    }
    v11 = (std::__shared_weak_count *)*((void *)v7 + 4);
    v8[3] = v10;
    v8[4] = v9;
    if (v11) {
      sub_10004D2C8(v11);
    }
    if (a3) {
      dispatch_retain((dispatch_object_t)a3);
    }
    v12 = v8[2];
    v8[2] = a3;
    if (v12) {
      dispatch_release(v12);
    }
    operator new();
  }
  return 0;
}

- (void)startService
{
  v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
  v4 = dispatch_queue_create("cp.ids.init", v3);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100505360;
  block[3] = &unk_101999238;
  block[4] = self;
  dispatch_async(v4, block);
  if (v4) {
    dispatch_release(v4);
  }
}

- (BOOL)registerWithName:(id)a3 supportedIncomingMessageTypes:(bitset<16UL>)a4 validateDeviceCallback:(id)a5 devicesChangedCallback:(id)a6 incomingMessageCallback:(id)a7
{
  id v45 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  v16 = (void **)*((void *)self + 13);
  v17 = (char *)*((void *)self + 14);
  if (v16 == (void **)v17)
  {
LABEL_5:
    unint64_t v19 = *((void *)self + 15);
    if ((unint64_t)v17 >= v19)
    {
      unint64_t v21 = 0xCCCCCCCCCCCCCCCDLL * ((v17 - (char *)v16) >> 3) + 1;
      if (v21 > 0x666666666666666) {
        sub_10006A748();
      }
      unint64_t v22 = 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(v19 - (void)v16) >> 3);
      if (2 * v22 > v21) {
        unint64_t v21 = 2 * v22;
      }
      if (v22 >= 0x333333333333333) {
        unint64_t v23 = 0x666666666666666;
      }
      else {
        unint64_t v23 = v21;
      }
      if (v23)
      {
        if (v23 > 0x666666666666666) {
          sub_10006A7CC();
        }
        v24 = (char *)operator new(40 * v23);
      }
      else
      {
        v24 = 0;
      }
      v27 = &v24[8 * ((v17 - (char *)v16) >> 3)];
      v28 = &v24[40 * v23];
      *((void *)v27 + 4) = 0;
      *(_OWORD *)v27 = 0u;
      *((_OWORD *)v27 + 1) = 0u;
      v20 = v27 + 40;
      if (v16 == (void **)v17)
      {
        *((void *)self + 13) = v27;
        *((void *)self + 14) = v20;
        *((void *)self + 15) = v28;
      }
      else
      {
        uint64_t v29 = 0;
        do
        {
          v30 = &v27[v29];
          v31 = &v17[v29];
          uint64_t v32 = *(void *)&v17[v29 - 40];
          *((void *)v31 - 5) = 0;
          *((void *)v30 - 5) = v32;
          *((void *)v30 - 4) = *(void *)&v17[v29 - 32];
          long long v33 = *(_OWORD *)&v17[v29 - 24];
          *((void *)v31 - 3) = 0;
          *((void *)v31 - 2) = 0;
          *(_OWORD *)(v30 - 24) = v33;
          uint64_t v34 = *(void *)&v17[v29 - 8];
          *((void *)v31 - 1) = 0;
          *((void *)v30 - 1) = v34;
          v29 -= 40;
        }
        while (&v17[v29] != (char *)v16);
        v16 = (void **)*((void *)self + 13);
        v35 = (void **)*((void *)self + 14);
        *((void *)self + 13) = &v27[v29];
        *((void *)self + 14) = v20;
        *((void *)self + 15) = v28;
        while (v35 != v16)
        {
          v35 -= 5;
          sub_10050A024(v35);
        }
      }
      if (v16) {
        operator delete(v16);
      }
    }
    else
    {
      *((void *)v17 + 4) = 0;
      *(_OWORD *)v17 = 0u;
      *((_OWORD *)v17 + 1) = 0u;
      v20 = v17 + 40;
    }
    *((void *)self + 14) = v20;
    objc_storeStrong((id *)v20 - 5, a3);
    *((bitset<16UL> *)v20 - 4) = a4;
    id v36 = [v14 copy];
    v37 = (void *)*((void *)v20 - 2);
    *((void *)v20 - 2) = v36;

    id v38 = [v13 copy];
    v39 = (void *)*((void *)v20 - 3);
    *((void *)v20 - 3) = v38;

    id v40 = [v15 copy];
    v41 = (void *)*((void *)v20 - 1);
    *((void *)v20 - 1) = v40;

    if ((a4.var0 & 0x20) != 0)
    {
      [*((id *)self + 1) setProtobufAction:"_handleIncomingResponse:service:account:fromID:context:" forIncomingResponsesOfType:4];
      [*((id *)self + 1) setProtobufAction:"_handleIncomingIndication:service:account:fromID:context:" forIncomingRequestsOfType:5];
    }
    if ((a4.var0 & 0x10) != 0) {
      [*((id *)self + 1) setProtobufAction:"_handleIncomingRequest:service:account:fromID:context:" forIncomingRequestsOfType:4];
    }
    if ((a4.var0 & 0x80) != 0)
    {
      [*((id *)self + 1) setProtobufAction:"_handleIncomingResponse:service:account:fromID:context:" forIncomingResponsesOfType:6];
      [*((id *)self + 1) setProtobufAction:"_handleIncomingIndication:service:account:fromID:context:" forIncomingRequestsOfType:7];
    }
    if ((a4.var0 & 0x40) != 0) {
      [*((id *)self + 1) setProtobufAction:"_handleIncomingRequest:service:account:fromID:context:" forIncomingRequestsOfType:6];
    }
    if ((a4.var0 & 0x200) != 0)
    {
      [*((id *)self + 1) setProtobufAction:"_handleIncomingResponse:service:account:fromID:context:" forIncomingResponsesOfType:8];
      [*((id *)self + 1) setProtobufAction:"_handleIncomingIndication:service:account:fromID:context:" forIncomingRequestsOfType:9];
    }
    if ((a4.var0 & 0x100) != 0) {
      [*((id *)self + 1) setProtobufAction:"_handleIncomingRequest:service:account:fromID:context:" forIncomingRequestsOfType:8];
    }
    if ((a4.var0 & 0x800) != 0)
    {
      [*((id *)self + 1) setProtobufAction:"_handleIncomingResponse:service:account:fromID:context:" forIncomingResponsesOfType:10];
      [*((id *)self + 1) setProtobufAction:"_handleIncomingIndication:service:account:fromID:context:" forIncomingRequestsOfType:11];
    }
    if ((a4.var0 & 0x400) != 0) {
      [*((id *)self + 1) setProtobufAction:"_handleIncomingRequest:service:account:fromID:context:" forIncomingRequestsOfType:10];
    }
    if ((a4.var0 & 0x1000) != 0)
    {
      [*((id *)self + 1) setProtobufAction:"_handleIncomingRequest:service:account:fromID:context:" forIncomingRequestsOfType:12];
      [*((id *)self + 1) setProtobufAction:"_handleIncomingResponse:service:account:fromID:context:" forIncomingResponsesOfType:12];
    }
    if ((a4.var0 & 0x2000) != 0)
    {
      [*((id *)self + 1) setProtobufAction:"_handleIncomingRequest:service:account:fromID:context:" forIncomingRequestsOfType:13];
      [*((id *)self + 1) setProtobufAction:"_handleIncomingResponse:service:account:fromID:context:" forIncomingResponsesOfType:13];
    }
    if ((a4.var0 & 0x4000) != 0) {
      [*((id *)self + 1) setProtobufAction:"_handleIncomingRequest:service:account:fromID:context:" forIncomingRequestsOfType:14];
    }
    if ((a4.var0 & 0x8000) != 0) {
      [*((id *)self + 1) setProtobufAction:"_handleIncomingRequest:service:account:fromID:context:" forIncomingRequestsOfType:15];
    }
    BOOL v26 = 1;
  }
  else
  {
    uint64_t v18 = *((void *)self + 13);
    while ((LOWORD(a4.var0) & *(void *)(v18 + 8)) == 0)
    {
      v18 += 40;
      if ((char *)v18 == v17) {
        goto LABEL_5;
      }
    }
    v25 = **((void **)self + 5);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      id v43 = [v45 UTF8String];
      id v44 = [*(id *)v18 UTF8String];
      *(_DWORD *)buf = 136315650;
      id v47 = v43;
      __int16 v48 = 2048;
      unint64_t var0 = a4.var0;
      __int16 v50 = 2080;
      id v51 = v44;
      _os_log_error_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "Attempt to register [%s] for message types [0x%02lx] - [%s] has been registered", buf, 0x20u);
    }
    BOOL v26 = 0;
  }

  return v26;
}

- (void)dealloc
{
  [*((id *)self + 1) removeDelegate:self];
  v3 = (void *)*((void *)self + 1);
  *((void *)self + 1) = 0;

  sub_10050A0C0(*((void **)self + 8));
  *((void *)self + 7) = (char *)self + 64;
  *((void *)self + 9) = 0;
  *((void *)self + 8) = 0;
  sub_10005CD2C((uint64_t)self + 80, *((char **)self + 11));
  *((void *)self + 10) = (char *)self + 88;
  *((void *)self + 12) = 0;
  *((void *)self + 11) = 0;
  v4.receiver = self;
  v4.super_class = (Class)CellularPlanIDSServiceDelegate;
  [(CellularPlanIDSServiceDelegate *)&v4 dealloc];
}

- (BOOL)sendMessage:(CellularPlanIDSMessage *)a3 responseHandler:
{
  id v37 = v3;
  id v38 = +[NSMutableSet set];
  id v36 = self;
  [(CellularPlanIDSServiceDelegate *)self _getDevicesForMessageType:LOWORD(a3[1].var0.__r_.__value_.var0.var1.__size_)];
  long long v62 = 0u;
  long long v63 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  id v7 = [v6 countByEnumeratingWithState:&v60 objects:v66 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v61;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v61 != v8) {
          objc_enumerationMutation(v6);
        }
        data = a3;
        if (*((char *)&a3->var0.__r_.__value_.var0.var1 + 23) < 0) {
          data = (CellularPlanIDSMessage *)a3->var0.__r_.__value_.var0.var1.__data_;
        }
        v11 = *(void **)(*((void *)&v60 + 1) + 8 * i);
        v12 = +[NSString stringWithUTF8String:data];
        id v13 = [v11 uniqueIDOverride];
        unsigned int v14 = [v12 isEqualToString:v13];

        if (v14)
        {
          id v15 = (void *)IDSCopyIDForDevice();
          [v38 addObject:v15];

          goto LABEL_13;
        }
      }
      id v7 = [v6 countByEnumeratingWithState:&v60 objects:v66 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_13:

  if ([v38 count])
  {
    if (*(void *)&a3[1].var0.__r_.var0) {
      v16 = sub_1000FCC20;
    }
    else {
      v16 = 0;
    }
    int v17 = *((char *)&a3->var0.__r_.__value_.var0.var1 + 23);
    if (v16)
    {
      if (v17 < 0)
      {
        sub_10004FC84(&__dst, a3->var0.__r_.__value_.var0.var1.__data_, a3->var0.__r_.__value_.var0.var1.__size_);
      }
      else
      {
        long long __dst = *(_OWORD *)a3->var0.__r_.__value_.var0.var0.__data_;
        uint64_t v53 = *((void *)&a3->var0.__r_.__value_.var0.var1 + 2);
      }
      if (a3[1].var0.__r_.__value_.var0.var0.__data_[7] < 0)
      {
        sub_10004FC84(&__p, *(void **)&a3->var0.__r_.var0, a3->var0.var0);
      }
      else
      {
        long long __p = *(_OWORD *)&a3->var0.__r_.var0;
        v55 = a3[1].var0.__r_.__value_.var0.var1.__data_;
      }
      __int16 size = a3[1].var0.__r_.__value_.var0.var1.__size_;
      sub_10002FD9C(&v57, (const void **)&a3[1].var0.__r_.__value_.var0.var1 + 2);
      sub_100119B5C(&v58, (const void **)&a3[1].var0.__r_.var0);
      v59[0] = a3[1].var0.var0;
      *(void *)((char *)v59 + 6) = *(int64_t *)((char *)&a3[1].var0.var0 + 6);
      v20 = [(CellularPlanIDSServiceDelegate *)v36 _sendResourceMessage:&__dst destinations:v38];
      sub_1000FE824(&v58);
      sub_100030068(&v57);
      if (SHIBYTE(v55) < 0) {
        operator delete((void *)__p);
      }
      if (SHIBYTE(v53) < 0)
      {
        p_dst = (void **)&__dst;
LABEL_42:
        operator delete(*p_dst);
      }
    }
    else
    {
      if (v17 < 0)
      {
        sub_10004FC84(&v44, a3->var0.__r_.__value_.var0.var1.__data_, a3->var0.__r_.__value_.var0.var1.__size_);
      }
      else
      {
        long long v44 = *(_OWORD *)a3->var0.__r_.__value_.var0.var0.__data_;
        uint64_t v45 = *((void *)&a3->var0.__r_.__value_.var0.var1 + 2);
      }
      if (a3[1].var0.__r_.__value_.var0.var0.__data_[7] < 0)
      {
        sub_10004FC84(&v46, *(void **)&a3->var0.__r_.var0, a3->var0.var0);
      }
      else
      {
        long long v46 = *(_OWORD *)&a3->var0.__r_.var0;
        id v47 = a3[1].var0.__r_.__value_.var0.var1.__data_;
      }
      __int16 v48 = a3[1].var0.__r_.__value_.var0.var1.__size_;
      sub_10002FD9C(&v49, (const void **)&a3[1].var0.__r_.__value_.var0.var1 + 2);
      sub_100119B5C(&v50, (const void **)&a3[1].var0.__r_.var0);
      v51[0] = a3[1].var0.var0;
      *(void *)((char *)v51 + 6) = *(int64_t *)((char *)&a3[1].var0.var0 + 6);
      v20 = [(CellularPlanIDSServiceDelegate *)v36 _sendProtobufMessage:&v44 destinations:v38];
      sub_1000FE824(&v50);
      sub_100030068(&v49);
      if (SHIBYTE(v47) < 0) {
        operator delete((void *)v46);
      }
      if (SHIBYTE(v45) < 0)
      {
        p_dst = (void **)&v44;
        goto LABEL_42;
      }
    }
    BOOL v19 = v20 != 0;
    if (!v37 || !v20)
    {
LABEL_65:

      goto LABEL_66;
    }
    uint64_t v43 = 0;
    if (*(_DWORD *)a3[2].var0.__r_.__value_.var0.var0.__data_ + HIDWORD(a3[1].var0.var0) >= 1)
    {
      sub_100058DB0(v41, (char *)[v20 UTF8String]);
      [(CellularPlanIDSServiceDelegate *)v36 _setTimeoutForMessageId:v41 responseTimer:&v43 timeout:(*(_DWORD *)a3[2].var0.__r_.__value_.var0.var0.__data_ + HIDWORD(a3[1].var0.var0))];
      if (v42 < 0) {
        operator delete(v41[0]);
      }
    }
    id v22 = [v37 copy];
    uint64_t v23 = v43;
    uint64_t v43 = 0;
    id v39 = v22;
    uint64_t v40 = v23;
    sub_100058DB0(buf, (char *)[v20 UTF8String]);
    v25 = (void **)((char *)v36 + 64);
    v24 = (void *)*((void *)v36 + 8);
    if (v24)
    {
      while (1)
      {
        while (1)
        {
          BOOL v26 = (void **)v24;
          v27 = v24 + 4;
          if ((sub_100046FE8(buf, (void **)v24 + 4) & 0x80) == 0) {
            break;
          }
          v24 = *v26;
          v25 = v26;
          if (!*v26) {
            goto LABEL_56;
          }
        }
        if ((sub_100046FE8(v27, (void **)buf) & 0x80) == 0) {
          break;
        }
        v25 = v26 + 1;
        v24 = v26[1];
        if (!v24) {
          goto LABEL_56;
        }
      }
      v28 = *v25;
      if (*v25) {
        goto LABEL_59;
      }
    }
    else
    {
      BOOL v26 = (void **)((char *)v36 + 64);
    }
LABEL_56:
    v28 = operator new(0x48uLL);
    v28[2] = *(_OWORD *)buf;
    uint64_t v29 = v65;
    uint64_t v65 = 0;
    memset(buf, 0, sizeof(buf));
    *((void *)v28 + 7) = 0;
    *((void *)v28 + 8) = 0;
    *((void *)v28 + 6) = v29;
    *(void *)v28 = 0;
    *((void *)v28 + 1) = 0;
    *((void *)v28 + 2) = v26;
    NSObject *v25 = v28;
    uint64_t v30 = **((void **)v36 + 7);
    v31 = (uint64_t *)v28;
    if (v30)
    {
      *((void *)v36 + 7) = v30;
      v31 = (uint64_t *)*v25;
    }
    sub_100046C90(*((uint64_t **)v36 + 8), v31);
    ++*((void *)v36 + 9);
LABEL_59:
    uint64_t v32 = (void *)*((void *)v28 + 7);
    *((void *)v28 + 7) = v39;

    uint64_t v33 = *((void *)v28 + 8);
    *((void *)v28 + 8) = v40;
    if (v33) {
      (*(void (**)(uint64_t))(*(void *)v33 + 8))(v33);
    }
    if (SHIBYTE(v65) < 0) {
      operator delete(*(void **)buf);
    }
    uint64_t v34 = v43;
    uint64_t v43 = 0;
    if (v34) {
      (*(void (**)(uint64_t))(*(void *)v34 + 8))(v34);
    }
    goto LABEL_65;
  }
  uint64_t v18 = **((void **)v36 + 5);
  BOOL v19 = 0;
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    if (*((char *)&a3->var0.__r_.__value_.var0.var1 + 23) < 0) {
      a3 = (CellularPlanIDSMessage *)a3->var0.__r_.__value_.var0.var1.__data_;
    }
    *(_DWORD *)buf = 136315138;
    *(void *)&uint8_t buf[4] = a3;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "#E Could not find [%s] in IDSService", buf, 0xCu);
    BOOL v19 = 0;
  }
LABEL_66:

  return v19;
}

- (void)handledResponse:()basic_string<char
{
  sub_10050A194((uint64_t **)self + 7, (void **)a3);

  sub_1000E9358((uint64_t **)self + 10, (void **)a3);
}

- (void)updateTimeoutForTransaction:()basic_string<char timeout:()std:(std::allocator<char>> *)a3 :char_traits<char>
{
  uint64_t v4 = v3;
  data = a3;
  id v7 = sub_100046F68((uint64_t)self + 56, (void **)a3);
  if ((void **)((char *)self + 64) == v7)
  {
    v12 = **((void **)self + 5);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      if (*((char *)&data->__r_.__value_.var0.var1 + 23) < 0) {
        data = (basic_string<char, std::char_traits<char>, std::allocator<char>> *)data->__r_.__value_.var0.var1.__data_;
      }
      *(_DWORD *)buf = 136315138;
      v16 = data;
      _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Missing response handler (%s) to update timeout", buf, 0xCu);
    }
  }
  else
  {
    uint64_t v8 = v7 + 8;
    uint64_t v9 = v7[8];
    if (v9)
    {
      uint64_t v10 = **((void **)self + 5);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "#I Cancelling existing timeout", buf, 2u);
        uint64_t v9 = *v8;
      }
      (*(void (**)(void *))(*(void *)v9 + 16))(v9);
      v11 = *v8;
      void *v8 = 0;
      if (v11) {
        (*(void (**)(void *))(*(void *)v11 + 8))(v11);
      }
    }
    if ((int)v4 >= 1)
    {
      if (*((char *)&data->__r_.__value_.var0.var1 + 23) < 0)
      {
        sub_10004FC84(__p, data->__r_.__value_.var0.var1.__data_, data->__r_.__value_.var0.var1.__size_);
      }
      else
      {
        *(_OWORD *)long long __p = *(_OWORD *)data->__r_.__value_.var0.var0.__data_;
        uint64_t v14 = *((void *)&data->__r_.__value_.var0.var1 + 2);
      }
      [(CellularPlanIDSServiceDelegate *)self _setTimeoutForMessageId:__p responseTimer:v8 timeout:v4];
      if (SHIBYTE(v14) < 0) {
        operator delete(__p[0]);
      }
    }
  }
}

- (id)_getDevicesForMessageType:(unsigned __int16)a3
{
  if (a3 >= 0x10u) {
    sub_1000C14F0("bitset test argument out of range");
  }
  uint64_t v3 = (void *)*((void *)self + 1);
  if (((1 << a3) & 0x5F00) != 0) {
    [v3 linkedDevicesWithRelationship:2];
  }
  else {
  uint64_t v4 = [v3 devices];
  }

  return v4;
}

- (optional<CellularPlanIDSDevice>)_lookupDevice:(SEL)a3 forMessageType:(id)a4
{
  unsigned int v5 = a5;
  id v13 = a4;
  if (v5 >= 0x10) {
    sub_1000C14F0("bitset test argument out of range");
  }
  uint64_t v8 = (void *)*((void *)self + 1);
  if (((1 << v5) & 0x5F00) != 0)
  {
    char v9 = 2;
    uint64_t v10 = [v8 linkedDeviceForFromID:v13 withRelationship:2];
  }
  else
  {
    uint64_t v10 = [v8 deviceForFromID:v13];
    char v9 = 1;
  }
  v11 = v10;
  sub_100506600((uint64_t)retstr, v10, v9);

  return result;
}

- (id)_sendProtobufMessage:(CellularPlanIDSMessage *)a3 destinations:
{
  id v6 = v3;
  uint64_t v8 = sub_1005069D4((uint64_t)a3);
  id v9 = objc_alloc((Class)IDSProtobuf);
  if (a3[1].var0.__r_.__value_.var0.var0.__data_[7] < 0) {
    int64_t var0 = a3->var0.var0;
  }
  else {
    int64_t var0 = a3[1].var0.__r_.__value_.var0.var0.__data_[7];
  }
  id v11 = [v9 initWithProtobufData:*((void *)&a3[1].var0.__r_.__value_.var0.var1 + 2) type:LOWORD(a3[1].var0.__r_.__value_.var0.var1.__size_) isResponse:var0 != 0];
  v12 = (void *)*((void *)self + 1);
  id v20 = 0;
  id v21 = 0;
  unsigned __int8 v13 = [v12 sendProtobuf:v11 toDestinations:v6 priority:300 options:v8 identifier:&v21 error:&v20];
  id v14 = v21;
  id v15 = v20;
  if (v15) {
    char v16 = v13;
  }
  else {
    char v16 = 1;
  }
  if ((v16 & 1) == 0)
  {
    int v17 = **((void **)self + 5);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      BOOL v19 = [v15 localizedDescription];
      *(_DWORD *)buf = 138412290;
      uint64_t v23 = v19;
      _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Failure to send: [%@]", buf, 0xCu);
    }
  }

  return v14;
}

- (id)_sendResourceMessage:(CellularPlanIDSMessage *)a3 destinations:
{
  id v6 = v3;
  uint64_t v8 = sub_1005069D4((uint64_t)a3);
  id v9 = +[NSMutableDictionary dictionary];
  uint64_t v10 = +[NSNumber numberWithInt:LOWORD(a3[1].var0.__r_.__value_.var0.var1.__size_)];
  [v9 setObject:v10 forKeyedSubscript:@"messageTypeKey"];

  if (*((void *)&a3[1].var0.__r_.__value_.var0.var1 + 2)) {
    id v11 = sub_10008324C;
  }
  else {
    id v11 = 0;
  }
  if (v11) {
    objc_msgSend(v9, "setObject:forKeyedSubscript:");
  }
  v12 = (void *)*((void *)self + 1);
  uint64_t v13 = *(void *)&a3[1].var0.__r_.var0;
  id v21 = 0;
  id v22 = 0;
  unsigned __int8 v14 = [v12 sendResourceAtURL:v13 metadata:v9 toDestinations:v6 priority:300 options:v8 identifier:&v22 error:&v21];
  id v15 = v22;
  id v16 = v21;
  if (v16) {
    char v17 = v14;
  }
  else {
    char v17 = 1;
  }
  if ((v17 & 1) == 0)
  {
    uint64_t v18 = **((void **)self + 5);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      id v20 = [v16 localizedDescription];
      *(_DWORD *)buf = 138412290;
      v24 = v20;
      _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "Failure to send: [%@]", buf, 0xCu);
    }
  }

  return v15;
}

- (void)_setTimeoutForMessageId:()basic_string<char responseTimer:()std:(std::allocator<char>> *)data :char_traits<char> timeout:
{
  int v5 = v4;
  id v6 = v3;
  id location = 0;
  objc_initWeak(&location, self);
  memset(v25, 0, 24);
  objc_copyWeak(&to, &location);
  if (*((char *)&data->__r_.__value_.var0.var1 + 23) < 0)
  {
    sub_10004FC84(&v20, data->__r_.__value_.var0.var1.__data_, data->__r_.__value_.var0.var1.__size_);
  }
  else
  {
    long long v20 = *(_OWORD *)data->__r_.__value_.var0.var0.__data_;
    id v21 = (void *)*((void *)&data->__r_.__value_.var0.var1 + 2);
  }
  id v9 = (id *)operator new(0x28uLL);
  *id v9 = off_1019DCA68;
  objc_moveWeak(v9 + 1, &to);
  *((_OWORD *)v9 + 1) = v20;
  v9[4] = v21;
  id v21 = 0;
  long long v20 = 0uLL;
  v25[3] = v9;
  objc_destroyWeak(&to);
  Registry::getTimerService(&v16, *((Registry **)self + 3));
  if (*((char *)&data->__r_.__value_.var0.var1 + 23) < 0) {
    data = (basic_string<char, std::char_traits<char>, std::allocator<char>> *)data->__r_.__value_.var0.var1.__data_;
  }
  uint64_t v10 = v16;
  sub_100058DB0(v14, data->__r_.__value_.var0.var0.__data_);
  *(_OWORD *)long long __p = *(_OWORD *)v14;
  uint64_t v24 = v15;
  v14[0] = 0;
  v14[1] = 0;
  uint64_t v15 = 0;
  sub_1000F0058((uint64_t)v26, (uint64_t)v25);
  (*(void (**)(uint64_t *__return_ptr, uint64_t, void **, uint64_t, uint64_t, void, void *))(*(void *)v10 + 40))(&v18, v10, __p, 1, 1000000 * v5, 0, v26);
  sub_10003B34C(v26);
  if (SHIBYTE(v24) < 0) {
    operator delete(__p[0]);
  }
  uint64_t v11 = v18;
  uint64_t v18 = 0;
  uint64_t v12 = *v6;
  *id v6 = v11;
  if (v12)
  {
    (*(void (**)(uint64_t))(*(void *)v12 + 8))(v12);
    uint64_t v13 = v18;
    uint64_t v18 = 0;
    if (v13) {
      (*(void (**)(uint64_t))(*(void *)v13 + 8))(v13);
    }
  }
  if (SHIBYTE(v15) < 0) {
    operator delete(v14[0]);
  }
  if (v17) {
    sub_10004D2C8(v17);
  }
  sub_10003B34C(v25);
  objc_destroyWeak(&location);
}

- (void)_service:(id)a3 devicesChanged:(id)a4 isQueried:(BOOL)a5
{
  BOOL v5 = a5;
  id v19 = a3;
  id v21 = a4;
  if (v5) {
    unsigned __int8 v8 = 1;
  }
  else {
    unsigned __int8 v8 = 2;
  }
  uint64_t v9 = *((void *)self + 13);
  uint64_t v10 = *((void *)self + 14);
  if (v9 != v10)
  {
    unsigned int v20 = v8;
    do
    {
      if ((*(_WORD *)(v9 + 8) & 0xA0F0) != 0)
      {
        int64x2_t v27 = 0uLL;
        uint64_t v28 = 0;
        long long v23 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        id v11 = v21;
        id v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v31, 16, v19);
        if (v12)
        {
          uint64_t v13 = *(void *)v24;
          do
          {
            for (i = 0; i != v12; i = (char *)i + 1)
            {
              if (*(void *)v24 != v13) {
                objc_enumerationMutation(v11);
              }
              uint64_t v15 = *(void **)(*((void *)&v23 + 1) + 8 * i);
              uint64_t v16 = [v15 uniqueIDOverride];
              BOOL v17 = v16 == 0;

              if (!v17)
              {
                uint64_t v30 = 0;
                memset(v29, 0, sizeof(v29));
                sub_100506600((uint64_t)v29, v15, 1);
                if (LOBYTE(v29[0]) && (*(unsigned int (**)(void))(*(void *)(v9 + 16) + 16))())
                {
                  if (!LOBYTE(v29[0])) {
                    __assert_rtn("get", "optional.hpp", 1212, "this->is_initialized()");
                  }
                  sub_100507410(&v27, (long long *)((char *)v29 + 8));
                }
                sub_10050A070((uint64_t)v29);
              }
            }
            id v12 = [v11 countByEnumeratingWithState:&v23 objects:v31 count:16];
          }
          while (v12);
        }

        uint64_t v18 = *(void *)(v9 + 24);
        memset(v22, 0, sizeof(v22));
        sub_1003C1BB8(v22, v27.i64[0], v27.i64[1], (v27.i64[1] - v27.i64[0]) >> 6);
        (*(void (**)(uint64_t, void *, void))(v18 + 16))(v18, v22, v20);
        *(void *)&v29[0] = v22;
        sub_1002B2AEC((void ***)v29);
        *(void *)&v29[0] = &v27;
        sub_1002B2AEC((void ***)v29);
      }
      v9 += 40;
    }
    while (v9 != v10);
  }
}

- (void)service:(id)a3 devicesChanged:(id)a4
{
}

- (void)service:(id)a3 linkedDevicesChanged:(id)a4
{
  id v16 = a3;
  id v17 = a4;
  uint64_t v6 = *((void *)self + 13);
  for (uint64_t i = *((void *)self + 14); v6 != i; v6 += 40)
  {
    if ((*(unsigned char *)(v6 + 9) & 0x5F) != 0)
    {
      int64x2_t v23 = 0uLL;
      uint64_t v24 = 0;
      long long v19 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      id v8 = v17;
      id v9 = [v8 countByEnumeratingWithState:&v19 objects:v27 count:16];
      if (v9)
      {
        uint64_t v10 = *(void *)v20;
        do
        {
          for (j = 0; j != v9; j = (char *)j + 1)
          {
            if (*(void *)v20 != v10) {
              objc_enumerationMutation(v8);
            }
            id v12 = *(void **)(*((void *)&v19 + 1) + 8 * (void)j);
            uint64_t v13 = [v12 uniqueIDOverride];
            BOOL v14 = v13 == 0;

            if (!v14)
            {
              uint64_t v26 = 0;
              memset(v25, 0, sizeof(v25));
              sub_100506600((uint64_t)v25, v12, 2);
              if (LOBYTE(v25[0]) && (*(unsigned int (**)(void))(*(void *)(v6 + 16) + 16))())
              {
                if (!LOBYTE(v25[0])) {
                  __assert_rtn("get", "optional.hpp", 1212, "this->is_initialized()");
                }
                sub_100507410(&v23, (long long *)((char *)v25 + 8));
              }
              sub_10050A070((uint64_t)v25);
            }
          }
          id v9 = [v8 countByEnumeratingWithState:&v19 objects:v27 count:16];
        }
        while (v9);
      }

      uint64_t v15 = *(void *)(v6 + 24);
      memset(v18, 0, sizeof(v18));
      sub_1003C1BB8(v18, v23.i64[0], v23.i64[1], (v23.i64[1] - v23.i64[0]) >> 6);
      (*(void (**)(uint64_t, void *, void))(v15 + 16))(v15, v18, 0);
      *(void *)&v25[0] = v18;
      sub_1002B2AEC((void ***)v25);
      *(void *)&v25[0] = &v23;
      sub_1002B2AEC((void ***)v25);
    }
  }
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7 context:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a7;
  id v18 = a8;
  v31[0] = 0;
  v31[1] = 0;
  uint64_t v32 = 0;
  id v19 = v16;
  sub_100058DB0(v31, (char *)[v19 UTF8String]);
  long long v20 = sub_100046F68((uint64_t)self + 56, v31);
  if ((void **)((char *)self + 64) == v20)
  {
    uint64_t v24 = **((void **)self + 5);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "#I Missing response handler", buf, 2u);
    }
  }
  else
  {
    long long v21 = v20;
    if (!a6)
    {
      long long v25 = **((void **)self + 5);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        uint64_t v28 = [v17 description];
        *(_DWORD *)buf = 138412546;
        id v34 = v19;
        __int16 v35 = 2114;
        id v36 = v28;
        _os_log_error_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "Message [%@] failed with error: %{public}@", buf, 0x16u);
      }
      uint64_t v26 = (void (**)(void *, unsigned char *))v21[7];
      char v27 = sub_1013B75C4(v17, v18);
      v30[0] = 0;
      int64x2_t v23 = v30;
      sub_1003C55AC((uint64_t)v30);
      v30[0] = 2;
      v30[8] = v27;
      v26[2](v26, v30);
      goto LABEL_11;
    }
    if (v18 && [v18 endpointState] == (id)3)
    {
      long long v22 = (void (**)(void *, unsigned char *))v21[7];
      v29[0] = 0;
      int64x2_t v23 = v29;
      sub_1003C55AC((uint64_t)v29);
      v29[0] = 2;
      v29[8] = 35;
      v22[2](v22, v29);
LABEL_11:
      sub_1003C55AC((uint64_t)v23);
      sub_10050A194((uint64_t **)self + 7, v31);
      sub_1000E9358((uint64_t **)self + 10, v31);
    }
  }
  if (SHIBYTE(v32) < 0) {
    operator delete(v31[0]);
  }
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 hasBeenDeliveredWithContext:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  __p[0] = 0;
  __p[1] = 0;
  uint64_t v18 = 0;
  id v14 = v12;
  sub_100058DB0(__p, (char *)[v14 UTF8String]);
  if ((void **)((char *)self + 64) == sub_100046F68((uint64_t)self + 56, __p))
  {
    id v15 = **((void **)self + 5);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v16 = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "#I Missing response handler", v16, 2u);
    }
  }
  else
  {
    sub_1000F29CC((uint64_t **)self + 10, __p, (uint64_t)__p);
  }
  if (SHIBYTE(v18) < 0) {
    operator delete(__p[0]);
  }
}

- (void)service:(id)a3 account:(id)a4 incomingUnhandledProtobuf:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v9 = a5;
  id v10 = a6;
  id v11 = **((void **)self + 5);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 136315394;
    id v13 = [v10 UTF8String];
    __int16 v14 = 1024;
    unsigned int v15 = [v9 type];
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "#E Received Unhandled Protobuf from [%s] type [%d]", (uint8_t *)&v12, 0x12u);
  }
}

- (void)service:(id)a3 account:(id)a4 incomingResourceAtURL:(id)a5 metadata:(id)a6 fromID:(id)a7 context:(id)a8
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v13 = a6;
  id v22 = a7;
  id v20 = a8;
  id v19 = [v13 objectForKeyedSubscript:@"messageTypeKey"];
  long long v21 = [v13 objectForKeyedSubscript:@"messageKey"];
  *(_OWORD *)cf = 0u;
  *(_OWORD *)char v27 = 0u;
  int v28 = 0;
  long long v25 = 0u;
  memset(v24, 0, sizeof(v24));
  v27[8] = 2;
  *(void *)&v27[12] = 0x50000003CLL;
  LOWORD(cf[0]) = (unsigned __int16)[v19 intValue];
  uint64_t v30 = 0;
  memset(v29, 0, sizeof(v29));
  [(CellularPlanIDSServiceDelegate *)self _lookupDevice:v22 forMessageType:LOWORD(cf[0])];
  __int16 v14 = **((void **)self + 5);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    id v15 = [v22 UTF8String];
    buf[0] = 136315138;
    *(void *)&buf[1] = v15;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "#E Could not find device for (%s)", (uint8_t *)buf, 0xCu);
  }
  sub_10050A070((uint64_t)v29);
  sub_1000FE824((const void **)v27);
  sub_100030068(&cf[1]);
  if (SHIBYTE(v25) < 0) {
    operator delete(v24[3]);
  }
  if (SHIBYTE(v24[2]) < 0) {
    operator delete(v24[0]);
  }
}

- (void)_handleIncomingRequest:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v12 = a3;
  id v18 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  *(_OWORD *)cf = 0u;
  *(_OWORD *)id v22 = 0u;
  int v23 = 0;
  long long v20 = 0u;
  memset(v19, 0, sizeof(v19));
  v22[8] = 2;
  *(void *)&v22[12] = 0x50000003CLL;
  uint64_t v16 = sub_100508ABC((uint64_t)[v12 type]);
  LOWORD(cf[0]) = v16;
  uint64_t v26 = 0;
  memset(v25, 0, sizeof(v25));
  [(CellularPlanIDSServiceDelegate *)self _lookupDevice:v14 forMessageType:v16];
  id v17 = **((void **)self + 5);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    buf[0] = 136315138;
    *(void *)&buf[1] = [v14 UTF8String];
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "#E Could not find device for (%s)", (uint8_t *)buf, 0xCu);
  }
  sub_10050A070((uint64_t)v25);
  sub_1000FE824((const void **)v22);
  sub_100030068(&cf[1]);
  if (SHIBYTE(v20) < 0) {
    operator delete(v19[3]);
  }
  if (SHIBYTE(v19[2]) < 0) {
    operator delete(v19[0]);
  }
}

- (void)_handleIncomingResponse:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = [v16 incomingResponseIdentifier];

  if (v17)
  {
    memset(&__str, 0, sizeof(__str));
    id v18 = [v16 incomingResponseIdentifier];
    sub_100058DB0(&__str, (char *)[v18 UTF8String]);

    id v19 = sub_100046F68((uint64_t)self + 56, (void **)&__str.__r_.__value_.__l.__data_);
    if ((void **)((char *)self + 64) == v19)
    {
      long long v25 = **((void **)self + 5);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        int v26 = SHIBYTE(__str.__r_.__value_.__r.__words[2]);
        std::string::size_type v27 = __str.__r_.__value_.__r.__words[0];
        id v28 = [v15 UTF8String];
        p_str = &__str;
        if (v26 < 0) {
          p_str = (std::string *)v27;
        }
        *(_DWORD *)id v39 = 136315394;
        *(void *)&v39[4] = p_str;
        *(_WORD *)&v39[12] = 2080;
        *(void *)&v39[14] = v28;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "#E No response handler for [%s] for device [%s]", v39, 0x16u);
      }
    }
    else
    {
      long long v20 = objc_retainBlock(v19[7]);
      if (v20)
      {
        long long v21 = [v12 data];
        BOOL v22 = [v21 length] == 0;

        if (v22)
        {
          v31 = **((void **)self + 5);
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)id v39 = 0;
            _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "#E Empty protobuf response", v39, 2u);
          }
          v34[0] = 0;
          sub_1003C55AC((uint64_t)v34);
          v34[0] = 2;
          v34[8] = 5;
          v20[2](v20, v34);
          sub_1003C55AC((uint64_t)v34);
        }
        else
        {
          long long v41 = 0u;
          *(_OWORD *)char v42 = 0u;
          int v43 = 0;
          long long v40 = 0u;
          memset(v39, 0, sizeof(v39));
          v42[8] = 2;
          *(void *)&v42[12] = 0x50000003CLL;
          uint64_t v23 = sub_100508ABC((uint64_t)[v12 type]);
          LOWORD(v41) = v23;
          memset(v38, 0, 72);
          [(CellularPlanIDSServiceDelegate *)self _lookupDevice:v15 forMessageType:v23];
          if (LOBYTE(v38[0]))
          {
            std::string::operator=((std::string *)v39, (const std::string *)&v38[1]);
            std::string::operator=((std::string *)&v39[24], &__str);
            *(void *)buf = [v12 data];
            sub_10015E5D4((const void **)&v41 + 1, (CFTypeRef *)buf);
            v35[0] = 0;
            sub_1003C5BA8((uint64_t)v35, (std::string *)v39);
            v20[2](v20, v35);
            sub_1003C55AC((uint64_t)v35);
          }
          else
          {
            uint64_t v32 = **((void **)self + 5);
            if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
            {
              id v33 = [v15 UTF8String];
              *(_DWORD *)buf = 136315138;
              *(void *)&uint8_t buf[4] = v33;
              _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "#E Could not find device for (%s)", buf, 0xCu);
            }
          }
          sub_10050A070((uint64_t)v38);
          sub_1000FE824((const void **)v42);
          sub_100030068((const void **)&v41 + 1);
          if (SHIBYTE(v40) < 0) {
            operator delete(*(void **)&v39[24]);
          }
          if ((v39[23] & 0x80000000) != 0) {
            operator delete(*(void **)v39);
          }
        }
      }
      else
      {
        uint64_t v30 = **((void **)self + 5);
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)id v39 = 0;
          _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "#E Missing callback - clear the callback", v39, 2u);
        }
        sub_10050A194((uint64_t **)self + 7, (void **)&__str.__r_.__value_.__l.__data_);
        sub_1000E9358((uint64_t **)self + 10, (void **)&__str.__r_.__value_.__l.__data_);
      }
    }
    if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__str.__r_.__value_.__l.__data_);
    }
  }
  else
  {
    uint64_t v24 = **((void **)self + 5);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v39 = 0;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "#E No response identifier", v39, 2u);
    }
  }
}

- (void)_handleIncomingIndication:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v12 = a3;
  id v18 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  *(_OWORD *)cf = 0u;
  *(_OWORD *)BOOL v22 = 0u;
  int v23 = 0;
  long long v20 = 0u;
  memset(v19, 0, sizeof(v19));
  v22[8] = 2;
  *(void *)&v22[12] = 0x50000003CLL;
  uint64_t v16 = sub_100508ABC((uint64_t)[v12 type]);
  LOWORD(cf[0]) = v16;
  uint64_t v26 = 0;
  memset(v25, 0, sizeof(v25));
  [(CellularPlanIDSServiceDelegate *)self _lookupDevice:v14 forMessageType:v16];
  id v17 = **((void **)self + 5);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    *(void *)&uint8_t buf[4] = [v14 UTF8String];
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "#E Could not find device for (%s)", buf, 0xCu);
  }
  sub_10050A070((uint64_t)v25);
  sub_1000FE824((const void **)v22);
  sub_100030068(&cf[1]);
  if (SHIBYTE(v20) < 0) {
    operator delete(v19[3]);
  }
  if (SHIBYTE(v19[2]) < 0) {
    operator delete(v19[0]);
  }
}

- (void).cxx_destruct
{
  uint64_t v3 = (void **)*((void *)self + 13);
  if (v3)
  {
    int v4 = (void **)*((void *)self + 14);
    BOOL v5 = (void *)*((void *)self + 13);
    if (v4 != v3)
    {
      do
      {
        v4 -= 5;
        sub_10050A024(v4);
      }
      while (v4 != v3);
      BOOL v5 = (void *)*((void *)self + 13);
    }
    *((void *)self + 14) = v3;
    operator delete(v5);
  }
  sub_10005CD2C((uint64_t)self + 80, *((char **)self + 11));
  sub_10050A0C0(*((void **)self + 8));
  sub_100119D1C((ctu::OsLogLogger **)self + 5, 0);
  uint64_t v6 = (std::__shared_weak_count *)*((void *)self + 4);
  if (v6) {
    sub_10004D2C8(v6);
  }
  id v7 = *((void *)self + 2);
  if (v7) {
    dispatch_release(v7);
  }

  objc_storeStrong((id *)self + 1, 0);
}

- (id).cxx_construct
{
  *((void *)self + 8) = 0;
  *((_OWORD *)self + 1) = 0u;
  *((_OWORD *)self + 2) = 0u;
  *((void *)self + 7) = (char *)self + 64;
  *((void *)self + 11) = 0;
  *((void *)self + 12) = 0;
  *((void *)self + 13) = 0;
  *((void *)self + 9) = 0;
  *((void *)self + 10) = (char *)self + 88;
  *((void *)self + 14) = 0;
  *((void *)self + 15) = 0;
  return self;
}

@end
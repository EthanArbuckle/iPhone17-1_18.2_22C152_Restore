@interface DataTelephonyCallObserverImpl
- (DataTelephonyCallObserverImpl)initWithCallback:(function<void)(BOOL queue:()BOOL;
- (id).cxx_construct;
- (void)callObserver:(id)a3 callChanged:(id)a4;
- (void)dealloc;
@end

@implementation DataTelephonyCallObserverImpl

- (DataTelephonyCallObserverImpl)initWithCallback:(function<void)(BOOL queue:()BOOL
{
  v10.receiver = self;
  v10.super_class = (Class)DataTelephonyCallObserverImpl;
  v5 = [(DataTelephonyCallObserverImpl *)&v10 init];
  if (v5)
  {
    sub_100DE1DCC((uint64_t)buf, (uint64_t)a3);
    p_callback = &v5->_callback;
    if (buf != (uint8_t *)&v5->_callback)
    {
      v7 = v12;
      f = (function<void (BOOL, BOOL, BOOL)> *)v5->_callback.__f_.__f_;
      if (v12 == buf)
      {
        if (f == p_callback)
        {
          memset(v13, 0, sizeof(v13));
          (*(void (**)(uint8_t *, void *))(*(void *)buf + 24))(buf, v13);
          (*(void (**)(uint8_t *))(*(void *)v12 + 32))(v12);
          v12 = 0;
          (*(void (**)(void *, uint8_t *))(*(void *)v5->_callback.__f_.__f_ + 24))(v5->_callback.__f_.__f_, buf);
          (*(void (**)(void *))(*(void *)v5->_callback.__f_.__f_ + 32))(v5->_callback.__f_.__f_);
          v5->_callback.__f_.__f_ = 0;
          v12 = buf;
          (*(void (**)(void *, function<void (BOOL, BOOL, BOOL)> *))(v13[0] + 24))(v13, &v5->_callback);
          (*(void (**)(void *))(v13[0] + 32))(v13);
        }
        else
        {
          (*(void (**)(uint8_t *, function<void (BOOL, BOOL, BOOL)> *))(*(void *)buf + 24))(buf, &v5->_callback);
          (*(void (**)(uint8_t *))(*(void *)v12 + 32))(v12);
          v12 = (uint8_t *)v5->_callback.__f_.__f_;
        }
        v5->_callback.__f_.__f_ = p_callback;
      }
      else if (f == p_callback)
      {
        (*(void (**)(function<void (BOOL, BOOL, BOOL)> *, uint8_t *))(*(void *)p_callback->__f_.__buf_.__lx
                                                                               + 24))(&v5->_callback, buf);
        (*(void (**)(void *))(*(void *)v5->_callback.__f_.__f_ + 32))(v5->_callback.__f_.__f_);
        v5->_callback.__f_.__f_ = v12;
        v12 = buf;
      }
      else
      {
        v12 = (uint8_t *)v5->_callback.__f_.__f_;
        v5->_callback.__f_.__f_ = v7;
      }
    }
    sub_100DE1D48(buf);
    operator new();
  }
  return 0;
}

- (void)dealloc
{
  callObserver = self->_callObserver;
  if (callObserver)
  {
    [(CXCallObserver *)callObserver setDelegate:0 queue:0];
    v4 = self->_callObserver;
    self->_callObserver = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)DataTelephonyCallObserverImpl;
  [(DataTelephonyCallObserverImpl *)&v5 dealloc];
}

- (void)callObserver:(id)a3 callChanged:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v7 providerIdentifier];
  memset(buf, 0, sizeof(buf));
  ctu::cf::assign();
  *(_OWORD *)__p = 0u;
  uint64_t v52 = 0;

  p_pair1 = &self->_sliceCallStatus.__tree_.__pair1_;
  left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, SliceCallStatus>, void *>>> *)self->_sliceCallStatus.__tree_.__pair1_.__value_.__left_;
  if (!left)
  {
    v11 = &self->_sliceCallStatus.__tree_.__pair1_;
LABEL_9:
    v13 = (char *)operator new(0x40uLL);
    v14 = v13 + 32;
    if (SHIBYTE(v52) < 0)
    {
      sub_10004FC84(v14, __p[0], (unint64_t)__p[1]);
    }
    else
    {
      *(_OWORD *)v14 = *(_OWORD *)__p;
      *((void *)v13 + 6) = v52;
    }
    *((_WORD *)v13 + 28) = 0;
    *(void *)v13 = 0;
    *((void *)v13 + 1) = 0;
    *((void *)v13 + 2) = v11;
    p_pair1->__value_.__left_ = v13;
    v15 = *(void **)self->_sliceCallStatus.__tree_.__begin_node_;
    v16 = (uint64_t *)v13;
    if (v15)
    {
      self->_sliceCallStatus.__tree_.__begin_node_ = v15;
      v16 = (uint64_t *)p_pair1->__value_.__left_;
    }
    sub_100046C90((uint64_t *)self->_sliceCallStatus.__tree_.__pair1_.__value_.__left_, v16);
    ++self->_sliceCallStatus.__tree_.__pair3_.__value_;
    goto LABEL_15;
  }
  while (1)
  {
    while (1)
    {
      v11 = left;
      v12 = left + 4;
      if ((sub_100046FE8(__p, &left[4].__value_.__left_) & 0x80) == 0) {
        break;
      }
      left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, SliceCallStatus>, void *>>> *)v11->__value_.__left_;
      p_pair1 = v11;
      if (!v11->__value_.__left_) {
        goto LABEL_9;
      }
    }
    if ((sub_100046FE8(v12, __p) & 0x80) == 0) {
      break;
    }
    p_pair1 = v11 + 1;
    left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, SliceCallStatus>, void *>>> *)v11[1].__value_.__left_;
    if (!left) {
      goto LABEL_9;
    }
  }
  v13 = (char *)p_pair1->__value_.__left_;
  if (!p_pair1->__value_.__left_) {
    goto LABEL_9;
  }
LABEL_15:
  __s1 = 0;
  size_t __n = 0;
  uint64_t v50 = 0;
  sub_100058DB0(&__s1, "com.apple.telephonyutilities.callservicesd.FaceTimeProvider");
  if (v50 >= 0) {
    size_t v17 = HIBYTE(v50);
  }
  else {
    size_t v17 = __n;
  }
  v18 = (void *)HIBYTE(v52);
  if (v52 < 0) {
    v18 = __p[1];
  }
  if ((void *)v17 == v18)
  {
    if (v52 >= 0) {
      v19 = __p;
    }
    else {
      v19 = (void **)__p[0];
    }
    if (v50 < 0)
    {
      BOOL v28 = memcmp(__s1, v19, __n) == 0;
    }
    else if (HIBYTE(v50))
    {
      uint64_t v20 = HIBYTE(v50) - 1;
      p_s1 = &__s1;
      do
      {
        int v23 = *(unsigned __int8 *)p_s1;
        p_s1 = (void **)((char *)p_s1 + 1);
        int v22 = v23;
        int v25 = *(unsigned __int8 *)v19;
        v19 = (void **)((char *)v19 + 1);
        int v24 = v25;
        BOOL v27 = v20-- != 0;
        BOOL v28 = v22 == v24;
      }
      while (v22 == v24 && v27);
    }
    else
    {
      BOOL v28 = 1;
    }
  }
  else
  {
    BOOL v28 = 0;
  }
  v29 = *(NSObject **)self->_logger.__ptr_.__value_;
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    v46 = self;
    id v47 = v6;
    uint64_t v30 = asStringBool((BOOL)[v7 isOutgoing]);
    unsigned int v31 = [v7 hasConnected];
    unsigned int v32 = [v7 hasEnded];
    int v33 = v13[56];
    int v34 = v13[57];
    v35 = [v7 providerIdentifier];
    *(_DWORD *)buf = 136316418;
    *(void *)&buf[4] = v30;
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = v31;
    *(_WORD *)&buf[18] = 1024;
    *(_DWORD *)&buf[20] = v32;
    __int16 v56 = 1024;
    int v57 = v33;
    __int16 v58 = 1024;
    int v59 = v34;
    __int16 v60 = 2112;
    v61 = v35;
    _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "#I (1) [outgoing=%s] call connected: %{BOOL}d, call ended: %{BOOL}d, _callStarting: %{BOOL}d, _callActive: %{BOOL}d, call provider: %@", buf, 0x2Eu);

    self = v46;
    id v6 = v47;
  }
  if (([v7 hasConnected] & 1) == 0
    && ([v7 hasEnded] & 1) == 0)
  {
    if (!v13[56])
    {
      char v36 = 1;
      goto LABEL_43;
    }
LABEL_45:
    int v37 = 0;
    goto LABEL_46;
  }
  char v36 = 0;
  if (!v13[56]) {
    goto LABEL_45;
  }
LABEL_43:
  v13[56] = v36;
  int v37 = 1;
LABEL_46:
  if ([v7 hasConnected] && (objc_msgSend(v7, "hasEnded") & 1) == 0)
  {
    if (!v13[57])
    {
      int v37 = 1;
      v13[57] = 1;
    }
  }
  else if (v13[57])
  {
    v13[57] = 0;
    int v37 = 1;
  }
  v38 = *(NSObject **)self->_logger.__ptr_.__value_;
  if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v39 = asStringBool((BOOL)[v7 isOutgoing]);
    unsigned int v40 = [v7 hasConnected];
    unsigned int v41 = [v7 hasEnded];
    int v42 = v13[56];
    int v43 = v13[57];
    *(_DWORD *)buf = 136316162;
    *(void *)&buf[4] = v39;
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = v40;
    *(_WORD *)&buf[18] = 1024;
    *(_DWORD *)&buf[20] = v41;
    __int16 v56 = 1024;
    int v57 = v42;
    __int16 v58 = 1024;
    int v59 = v43;
    _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "#I (2) [outgoing=%s] call connected: %{BOOL}d, call ended: %{BOOL}d, _callStarting: %{BOOL}d, _callActive: %{BOOL}d", buf, 0x24u);
  }
  if (v37)
  {
    char v44 = v13[57];
    f = self->_callback.__f_.__f_;
    buf[0] = v13[56];
    char v54 = v44;
    BOOL v53 = v28;
    if (!f) {
      sub_10007B600();
    }
    (*(void (**)(void *, uint8_t *, char *, BOOL *))(*(void *)f + 48))(f, buf, &v54, &v53);
  }
  if (SHIBYTE(v50) < 0) {
    operator delete(__s1);
  }
  if (SHIBYTE(v52) < 0) {
    operator delete(__p[0]);
  }
}

- (void).cxx_destruct
{
  sub_1000DA2E4((char *)self->_sliceCallStatus.__tree_.__pair1_.__value_.__left_);
  objc_storeStrong((id *)&self->_callObserver, 0);
  sub_100DE1D48(self->_callback.__f_.__buf_.__lx);

  sub_100119D1C((ctu::OsLogLogger **)&self->_logger, 0);
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 5) = 0;
  *((void *)self + 9) = 0;
  *((void *)self + 8) = 0;
  *((void *)self + 7) = (char *)self + 64;
  return self;
}

@end
@interface StewieIDSServerMessagingController
- (StewieIDSServerMessagingController)initWithQueue:(id)a3 service:(unsigned __int16)a4 delegate:(weak_ptr<StewieTransportDelegate>)a5;
- (id).cxx_construct;
- (void)ackReceivedMessageWithContext:(id)a3;
- (void)controller:(id)a3 receivedIncomingMessageData:(id)a4 context:(id)a5;
- (void)handleTXMessageStatus:(const void *)a3 didSendSucceed:(BOOL)a4 error:(id)a5;
- (void)receivedIncomingMessageData:(id)a3 context:(id)a4;
- (void)sendMessageWithId:(CFSharedRef<const __CFUUID>)a3 content:(const void *)a4;
@end

@implementation StewieIDSServerMessagingController

- (StewieIDSServerMessagingController)initWithQueue:(id)a3 service:(unsigned __int16)a4 delegate:(weak_ptr<StewieTransportDelegate>)a5
{
  ptr = a5.__ptr_;
  id v8 = a3;
  v15.receiver = self;
  v15.super_class = (Class)StewieIDSServerMessagingController;
  v9 = [(StewieIDSServerMessagingController *)&v15 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->fQueue, a3);
    v12 = *(StewieTransportDelegate **)ptr;
    uint64_t v11 = *((void *)ptr + 1);
    if (v11) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v11 + 16), 1uLL, memory_order_relaxed);
    }
    cntrl = (std::__shared_weak_count *)v10->fDelegate.__cntrl_;
    v10->fDelegate.__ptr_ = v12;
    v10->fDelegate.__cntrl_ = (__shared_weak_count *)v11;
    if (cntrl) {
      std::__shared_weak_count::__release_weak(cntrl);
    }
    ctu::OsLogContext::OsLogContext((ctu::OsLogContext *)buf, kCtLoggingSystemName, "stw.ids.ctr");
    operator new();
  }

  return 0;
}

- (void)receivedIncomingMessageData:(id)a3 context:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->fQueue);
  id v8 = [v7 certifiedDeliveryContext];
  v9 = v8;
  if (v8)
  {
    v10 = [v8 dataRepresentation];
    uint64_t v11 = v10;
    if (v10 && [v10 length])
    {
      v12 = [[CTStewieIDSDeliveryContext alloc] initWithService:self->fService deliveryContext:v9];
      p_super = &v12->super;
      if (v12)
      {
        __p = 0;
        v29 = 0;
        uint64_t v30 = 0;
        id v27 = 0;
        [(CTStewieIDSDeliveryContext *)v12 toVectorRepresentation:&v27];
        v14 = v27;
        if (v14 || __p == v29)
        {
          objc_super v15 = sub_100200FB4((id *)self->fLogger.__ptr_.__value_);
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            LODWORD(v33) = 138412290;
            *(void *)((char *)&v33 + 4) = v14;
            _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "(Raise a bug) Vector representation of stewie delivery context is empty. Error: %@", (uint8_t *)&v33, 0xCu);
          }
        }
        else
        {
          long long v33 = 0uLL;
          uint64_t v34 = 0;
          id v16 = v6;
          id v17 = [v16 bytes];
          id v18 = v16;
          id v19 = [v18 bytes];
          v20 = (char *)[v18 length];
          long long v33 = 0uLL;
          uint64_t v34 = 0;
          sub_1001E7940(&v33, v17, (uint64_t)&v20[(void)v19], &v20[(void)v19] - (char *)v17);
          v21 = sub_100200FB4((id *)self->fLogger.__ptr_.__value_);
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            v22 = [v7 identifier];
            *(_DWORD *)buf = 138412290;
            v32 = v22;
            _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "#I Received message with IDS messageId: %@", buf, 0xCu);
          }
          cntrl = self->fDelegate.__cntrl_;
          if (cntrl)
          {
            v24 = std::__shared_weak_count::lock((std::__shared_weak_count *)cntrl);
            if (v24)
            {
              v25 = v24;
              ptr = self->fDelegate.__ptr_;
              if (ptr) {
                (*(void (**)(StewieTransportDelegate *, uint64_t, long long *, void **))(*(void *)ptr + 24))(ptr, 2, &v33, &__p);
              }
              sub_10004D2C8(v25);
            }
          }
          if ((void)v33)
          {
            *((void *)&v33 + 1) = v33;
            operator delete((void *)v33);
          }
        }
        if (__p)
        {
          v29 = __p;
          operator delete(__p);
        }
      }
      else
      {
        v14 = sub_100200FB4((id *)self->fLogger.__ptr_.__value_);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          LOWORD(__p) = 0;
          _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "(Raise a bug) Failed to create Stewie delivery context", (uint8_t *)&__p, 2u);
        }
      }
    }
    else
    {
      p_super = sub_100200FB4((id *)self->fLogger.__ptr_.__value_);
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
      {
        LOWORD(__p) = 0;
        _os_log_error_impl((void *)&_mh_execute_header, p_super, OS_LOG_TYPE_ERROR, "(Raise a bug) Data representation of delivery context is empty", (uint8_t *)&__p, 2u);
      }
    }
  }
  else
  {
    uint64_t v11 = sub_100200FB4((id *)self->fLogger.__ptr_.__value_);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      LOWORD(__p) = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "(Raise a bug) Dropping message. It doesn't have certified delivery context", (uint8_t *)&__p, 2u);
    }
  }
}

- (void)controller:(id)a3 receivedIncomingMessageData:(id)a4 context:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id location = 0;
  objc_initWeak(&location, self);
  fQueue = self->fQueue;
  objc_copyWeak(v13, &location);
  v13[1] = v9;
  v13[2] = v10;
  v12 = fQueue;
  operator new();
}

- (void)sendMessageWithId:(CFSharedRef<const __CFUUID>)a3 content:(const void *)a4
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->fQueue);
  id v7 = +[NSData dataWithBytes:*(void *)a4 length:*((void *)a4 + 1) - *(void *)a4];
  id location = 0;
  objc_initWeak(&location, self);
  id v14 = 0;
  CFTypeRef cf = 0;
  v13 = self->fQueue;
  objc_copyWeak(&v14, &location);
  CFTypeRef cf = *(CFTypeRef *)a3.var0;
  *(void *)a3.var0 = 0;
  fController = self->fController;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3321888768;
  v9[2] = sub_100551BD4;
  v9[3] = &unk_1019E2FE8;
  id v10 = v13;
  objc_copyWeak(&v11, &v14);
  CFTypeRef v12 = cf;
  if (cf) {
    CFRetain(cf);
  }
  [(IDSServerMessagingController *)fController sendMessageData:v7 withOptions:0 identifier:0 completion:v9];
  sub_10012577C(&v12);
  objc_destroyWeak(&v11);

  sub_10012577C(&cf);
  objc_destroyWeak(&v14);

  objc_destroyWeak(&location);
}

- (void)ackReceivedMessageWithContext:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->fQueue);
  value = self->fLogger.__ptr_.__value_;
  if (v4)
  {
    id v6 = sub_100200FB4((id *)value);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "#I Certifying delivery receipt", v8, 2u);
    }

    [(IDSServerMessagingController *)self->fController sendCertifiedDeliveryReceipt:v4];
  }
  else
  {
    id v7 = sub_100200FB4((id *)value);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "(Raise a bug) Dropping message. It doesn't have certified delivery context", buf, 2u);
    }
  }
}

- (void)handleTXMessageStatus:(const void *)a3 didSendSucceed:(BOOL)a4 error:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->fQueue);
  if (!v8 || v5)
  {
LABEL_14:
    cntrl = self->fDelegate.__cntrl_;
    if (cntrl)
    {
      id v18 = std::__shared_weak_count::lock((std::__shared_weak_count *)cntrl);
      if (v18)
      {
        id v14 = v18;
        ptr = self->fDelegate.__ptr_;
        if (ptr) {
          (*(void (**)(StewieTransportDelegate *, uint64_t, const void *, BOOL))(*(void *)ptr + 16))(ptr, 2, a3, v5);
        }
LABEL_18:
        sub_10004D2C8(v14);
        goto LABEL_19;
      }
    }
    goto LABEL_19;
  }
  id v9 = sub_100200FB4((id *)self->fLogger.__ptr_.__value_);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    int v20 = 138412290;
    id v21 = v8;
    _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Send failed due to: %@", (uint8_t *)&v20, 0xCu);
  }

  id v10 = v8;
  id v11 = [v10 domain];
  if ([v11 isEqual:IDSServerMessagingErrorDomain])
  {
    if ([v10 code] == (id)2)
    {

      goto LABEL_14;
    }
    BOOL v16 = [v10 code] == (id)3;

    if (v16) {
      goto LABEL_14;
    }
  }
  else
  {
  }
  CFTypeRef v12 = self->fDelegate.__cntrl_;
  if (v12)
  {
    v13 = std::__shared_weak_count::lock((std::__shared_weak_count *)v12);
    if (v13)
    {
      id v14 = v13;
      objc_super v15 = self->fDelegate.__ptr_;
      if (v15) {
        (*(void (**)(StewieTransportDelegate *, uint64_t, uint64_t))(*(void *)v15 + 8))(v15, 2, 5);
      }
      goto LABEL_18;
    }
  }
LABEL_19:
}

- (void).cxx_destruct
{
  sub_100119D1C((ctu::OsLogLogger **)&self->fLogger, 0);
  objc_storeStrong((id *)&self->fController, 0);
  cntrl = self->fDelegate.__cntrl_;
  if (cntrl) {
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
  }

  objc_storeStrong((id *)&self->fQueue, 0);
}

- (id).cxx_construct
{
  *((void *)self + 2) = 0;
  *((void *)self + 3) = 0;
  *((void *)self + 5) = 0;
  return self;
}

@end
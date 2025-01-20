@interface StewieIDSSatSmsController
- (StewieIDSSatSmsController)initWithQueue:(id)a3 delegate:(weak_ptr<StewieTransportDelegate>)a4;
- (id).cxx_construct;
- (void)ackReceivedMessageWithContext:(id)a3;
- (void)cancelSatSmsShutDown:(id)a3 completion:(function<void)(BOOL;
- (void)cancelShutDownSatSmsStatus:(id)a3 success:(BOOL)a4 error:(id)a5 completion:(function<void)(BOOL;
- (void)controller:(id)a3 receivedIncomingMessageData:(id)a4 context:(id)a5;
- (void)handleShutDownSatSmsStatus:(id)a3 success:(BOOL)a4 error:(id)a5 completion:(function<void)(BOOL;
- (void)receivedIncomingMessageData:(id)a3 context:(id)a4;
- (void)shutDownSatSms:(id)a3 completion:(function<void)(BOOL;
@end

@implementation StewieIDSSatSmsController

- (StewieIDSSatSmsController)initWithQueue:(id)a3 delegate:(weak_ptr<StewieTransportDelegate>)a4
{
  ptr = a4.__ptr_;
  id v7 = a3;
  v15.receiver = self;
  v15.super_class = (Class)StewieIDSSatSmsController;
  v8 = [(StewieIDSSatSmsController *)&v15 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->fQueue, a3);
    v11 = *(StewieTransportDelegate **)ptr;
    uint64_t v10 = *((void *)ptr + 1);
    if (v10) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v10 + 16), 1uLL, memory_order_relaxed);
    }
    cntrl = (std::__shared_weak_count *)v9->fDelegate.__cntrl_;
    v9->fDelegate.__ptr_ = v11;
    v9->fDelegate.__cntrl_ = (__shared_weak_count *)v10;
    if (cntrl) {
      std::__shared_weak_count::__release_weak(cntrl);
    }
    ctu::OsLogContext::OsLogContext((ctu::OsLogContext *)&v14, kCtLoggingSystemName, "stw.ids.ctr");
    operator new();
  }

  return 0;
}

- (void)receivedIncomingMessageData:(id)a3 context:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->fQueue);
  v8 = [v7 certifiedDeliveryContext];
  v9 = v8;
  if (v8)
  {
    uint64_t v10 = [v8 dataRepresentation];
    v11 = v10;
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
        uint64_t v14 = v27;
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
        uint64_t v14 = sub_100200FB4((id *)self->fLogger.__ptr_.__value_);
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
    v11 = sub_100200FB4((id *)self->fLogger.__ptr_.__value_);
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

    [(IDSParakeetMessagingController *)self->fController sendCertifiedDeliveryReceipt:v4];
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

- (void)handleShutDownSatSmsStatus:(id)a3 success:(BOOL)a4 error:(id)a5 completion:(function<void)(BOOL
{
  BOOL v8 = a4;
  id v10 = a3;
  id v11 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->fQueue);
  v12 = sub_100200FB4((id *)self->fLogger.__ptr_.__value_);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v13 = [v10 UUIDString];
    uint64_t v14 = (void *)v13;
    objc_super v15 = "Failure";
    int v16 = 136315650;
    if (v8) {
      objc_super v15 = "Success";
    }
    id v17 = v15;
    __int16 v18 = 2112;
    uint64_t v19 = v13;
    __int16 v20 = 2112;
    id v21 = v11;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "#I [%s] ShutDownSatSms: %@ [Error: %@]", (uint8_t *)&v16, 0x20u);
  }
  sub_1000607A8((uint64_t)a6, v8);
}

- (void)shutDownSatSms:(id)a3 completion:(function<void)(BOOL
{
  id v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->fQueue);
  id v7 = sub_100200FB4((id *)self->fLogger.__ptr_.__value_);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v8 = [v6 UUIDString];
    LODWORD(buf[0]) = 138412290;
    *(id *)((char *)buf + 4) = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "#I [Attempting] ShutDownSatSms: %@", (uint8_t *)buf, 0xCu);
  }
  id v11 = 0;
  objc_initWeak(&v11, self);
  long long v19 = 0u;
  long long v18 = 0u;
  *(_OWORD *)&buf[1] = 0u;
  buf[0] = self->fQueue;
  objc_copyWeak(&buf[1], &v11);
  sub_100023950((uint64_t)&buf[2], (uint64_t)a4);
  id v9 = v6;
  *((void *)&v19 + 1) = v9;
  fController = self->fController;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3321888768;
  v12[2] = sub_100552D70;
  v12[3] = &unk_1019E3018;
  id v13 = buf[0];
  objc_copyWeak(&v14, &buf[1]);
  sub_1000DFC90((uint64_t)v15, (uint64_t)&buf[2]);
  id v16 = *((id *)&v19 + 1);
  [(IDSParakeetMessagingController *)fController stopParakeetSessionWithUUID:v9 completion:v12];

  sub_100060644(v15);
  objc_destroyWeak(&v14);

  sub_100060644(&buf[2]);
  objc_destroyWeak(&buf[1]);

  objc_destroyWeak(&v11);
}

- (void)cancelShutDownSatSmsStatus:(id)a3 success:(BOOL)a4 error:(id)a5 completion:(function<void)(BOOL
{
  BOOL v8 = a4;
  id v10 = a3;
  id v11 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->fQueue);
  v12 = sub_100200FB4((id *)self->fLogger.__ptr_.__value_);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v13 = [v10 UUIDString];
    id v14 = (void *)v13;
    objc_super v15 = "Failure";
    int v16 = 136315650;
    if (v8) {
      objc_super v15 = "Success";
    }
    id v17 = v15;
    __int16 v18 = 2112;
    uint64_t v19 = v13;
    __int16 v20 = 2112;
    id v21 = v11;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "#I [%s] CancelShutDownSatSms: %@ [Error: %@]", (uint8_t *)&v16, 0x20u);
  }
  sub_1000607A8((uint64_t)a6, v8);
}

- (void)cancelSatSmsShutDown:(id)a3 completion:(function<void)(BOOL
{
  id v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->fQueue);
  id v7 = sub_100200FB4((id *)self->fLogger.__ptr_.__value_);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v8 = [v6 UUIDString];
    LODWORD(buf[0]) = 138412290;
    *(id *)((char *)buf + 4) = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "#I [Attempting] CancelShutDownSatSms: %@", (uint8_t *)buf, 0xCu);
  }
  id v11 = 0;
  objc_initWeak(&v11, self);
  long long v19 = 0u;
  long long v18 = 0u;
  *(_OWORD *)&buf[1] = 0u;
  buf[0] = self->fQueue;
  objc_copyWeak(&buf[1], &v11);
  sub_100023950((uint64_t)&buf[2], (uint64_t)a4);
  id v9 = v6;
  *((void *)&v19 + 1) = v9;
  fController = self->fController;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3321888768;
  v12[2] = sub_100553414;
  v12[3] = &unk_1019E3048;
  id v13 = buf[0];
  objc_copyWeak(&v14, &buf[1]);
  sub_1000DFC90((uint64_t)v15, (uint64_t)&buf[2]);
  id v16 = *((id *)&v19 + 1);
  [(IDSParakeetMessagingController *)fController cancelParakeetSessionStopWithUUID:v9 completion:v12];

  sub_100060644(v15);
  objc_destroyWeak(&v14);

  sub_100060644(&buf[2]);
  objc_destroyWeak(&buf[1]);

  objc_destroyWeak(&v11);
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
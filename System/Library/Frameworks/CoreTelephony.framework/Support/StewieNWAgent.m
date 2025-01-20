@interface StewieNWAgent
- (BOOL)startWithDelegate:(weak_ptr<StewieAgentDelegate>)a3;
- (StewieNWAgent)initWithRegistry:(const void *)a3 queue:(id)a4;
- (id).cxx_construct;
- (id)stewieProtocolDefinition;
- (void)addStewieClient:(unsigned __int16)a3 stewieFramer:(const void *)a4;
- (void)addStewieFramer:(void *)a3;
- (void)dealloc;
- (void)deliverAckWithMsgId:(id)a3 toService:(unsigned __int16)a4 success:(BOOL)a5 clientMetaData:(id)a6 srcTransport:(unsigned __int8)a7;
- (void)deliverIncomingMessage:(id)a3 toService:(unsigned __int16)a4 ackContext:(void *)a5 srcTransport:(unsigned __int8)a6;
- (void)deliverNackWithMsgId:(id)a3 toFramer:(const void *)a4 error:(id)a5;
- (void)getDataIfRequired;
- (void)handleClientDisconnectedForService:(unsigned __int16)a3;
- (void)handleDataFromFramer:(id)a3 data:(id)a4 hasData:(BOOL)a5;
- (void)handleDataPathIdle;
- (void)handleDumpState;
- (void)handleFramerHasData:(id)a3;
- (void)monitorDataPath;
- (void)provideDataToDelegate:(id)a3 sourceFramer:(const void *)a4;
- (void)readyForNextProtocolMessage:(unsigned __int8)a3;
- (void)removeStewieClient:(unsigned __int16)a3 clientPid:(int)a4 framerType:(int)a5;
- (void)removeStewieFramer:(id)a3;
- (void)scheduleGetForFramer:(const void *)a3;
- (void)startFlowForClient:(id)a3 assign:(id)a4;
- (void)stopFlowForClient:(id)a3;
- (void)updateStewieState:(const StewieState *)a3;
@end

@implementation StewieNWAgent

- (StewieNWAgent)initWithRegistry:(const void *)a3 queue:(id)a4
{
  id v6 = a4;
  v13.receiver = self;
  v13.super_class = (Class)StewieNWAgent;
  v7 = [(StewieNWAgent *)&v13 init];
  v8 = v7;
  if (v7)
  {
    v7->fStarted = 0;
    objc_storeStrong((id *)&v7->fQueue, a4);
    uint64_t v9 = nw_agent_create();
    fAgent = v8->fAgent;
    v8->fAgent = (OS_nw_agent *)v9;

    nw_agent_set_flow_do_not_coalesce();
    ctu::OsLogContext::OsLogContext((ctu::OsLogContext *)&v12, kCtLoggingSystemName, "stw.agt");
    operator new();
  }

  return 0;
}

- (void)addStewieFramer:(void *)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->fQueue);
  v5 = sub_100200FB4((id *)self->fLogger.__ptr_.__value_);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(*(void *)a3 + 8);
    int v23 = 138412290;
    uint64_t v24 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#I Adding framer: %@", (uint8_t *)&v23, 0xCu);
  }

  end = (char *)self->fFramers.__end_;
  value = (char *)self->fFramers.__end_cap_.__value_;
  if (end >= value)
  {
    begin = (char *)self->fFramers.__begin_;
    uint64_t v12 = (end - begin) >> 4;
    unint64_t v13 = v12 + 1;
    if ((unint64_t)(v12 + 1) >> 60) {
      sub_10006A748();
    }
    uint64_t v14 = value - begin;
    if (v14 >> 3 > v13) {
      unint64_t v13 = v14 >> 3;
    }
    if ((unint64_t)v14 >= 0x7FFFFFFFFFFFFFF0) {
      unint64_t v15 = 0xFFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v15 = v13;
    }
    if (v15 >> 60) {
      sub_10006A7CC();
    }
    v16 = (char *)operator new(16 * v15);
    v17 = &v16[16 * v12];
    long long v18 = *(_OWORD *)a3;
    *(_OWORD *)v17 = *(_OWORD *)a3;
    if (*((void *)&v18 + 1))
    {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(*((void *)&v18 + 1) + 8), 1uLL, memory_order_relaxed);
      begin = (char *)self->fFramers.__begin_;
      end = (char *)self->fFramers.__end_;
    }
    if (end == begin)
    {
      v10 = v17 + 16;
      self->fFramers.__begin_ = v17;
      self->fFramers.__end_ = v17 + 16;
      self->fFramers.__end_cap_.__value_ = &v16[16 * v15];
    }
    else
    {
      v19 = &v16[16 * v12];
      do
      {
        long long v20 = *((_OWORD *)end - 1);
        end -= 16;
        *((_OWORD *)v19 - 1) = v20;
        v19 -= 16;
        *(void *)end = 0;
        *((void *)end + 1) = 0;
      }
      while (end != begin);
      begin = (char *)self->fFramers.__begin_;
      v21 = (char *)self->fFramers.__end_;
      v10 = v17 + 16;
      self->fFramers.__begin_ = v19;
      self->fFramers.__end_ = v17 + 16;
      self->fFramers.__end_cap_.__value_ = &v16[16 * v15];
      while (v21 != begin)
      {
        v22 = (std::__shared_weak_count *)*((void *)v21 - 1);
        if (v22) {
          sub_10004D2C8(v22);
        }
        v21 -= 16;
      }
    }
    if (begin) {
      operator delete(begin);
    }
  }
  else
  {
    *(void *)end = *(void *)a3;
    uint64_t v9 = *((void *)a3 + 1);
    *((void *)end + 1) = v9;
    if (v9) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v9 + 8), 1uLL, memory_order_relaxed);
    }
    v10 = end + 16;
  }
  self->fFramers.__end_ = v10;
}

- (void)removeStewieFramer:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->fQueue);
  v5 = sub_100200FB4((id *)self->fLogger.__ptr_.__value_);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138412290;
    id v14 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#I Removing framer: %@", (uint8_t *)&v13, 0xCu);
  }

  begin = self->fFramers.__begin_;
  end = self->fFramers.__end_;
  while (begin != end)
  {
    if (*(id *)(*begin + 8) == v4)
    {
      if (begin != end)
      {
        v8 = begin + 2;
        if (begin + 2 != end)
        {
          do
          {
            uint64_t v9 = *v8;
            if (*(id *)(*v8 + 8) != v4)
            {
              uint64_t v10 = v8[1];
              void *v8 = 0;
              v8[1] = 0;
              v11 = (std::__shared_weak_count *)begin[1];
              void *begin = v9;
              begin[1] = v10;
              if (v11) {
                sub_10004D2C8(v11);
              }
              begin += 2;
            }
            v8 += 2;
          }
          while (v8 != end);
          end = self->fFramers.__end_;
        }
      }
      if (begin != end)
      {
        while (end != begin)
        {
          uint64_t v12 = (std::__shared_weak_count *)*(end - 1);
          if (v12) {
            sub_10004D2C8(v12);
          }
          end -= 2;
        }
        self->fFramers.__end_ = begin;
      }
      break;
    }
    begin += 2;
  }
}

- (void)addStewieClient:(unsigned __int16)a3 stewieFramer:(const void *)a4
{
  unsigned int v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->fQueue);
  p_pair1 = &self->fServiceContext.__tree_.__pair1_;
  left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<StewieServiceType, std::shared_ptr<(anonymous namespace)::StewieServiceContext>>, void *>>> *)self->fServiceContext.__tree_.__pair1_.__value_.__left_;
  if (left)
  {
    uint64_t v9 = &self->fServiceContext.__tree_.__pair1_;
    do
    {
      unsigned int left_low = LOWORD(left[4].__value_.__left_);
      BOOL v11 = left_low >= v5;
      if (left_low >= v5) {
        uint64_t v12 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<StewieServiceType, std::shared_ptr<(anonymous namespace)::StewieServiceContext>>, void *>>> **)left;
      }
      else {
        uint64_t v12 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<StewieServiceType, std::shared_ptr<(anonymous namespace)::StewieServiceContext>>, void *>>> **)&left[1];
      }
      if (v11) {
        uint64_t v9 = left;
      }
      left = *v12;
    }
    while (*v12);
    if (v9 != p_pair1 && LOWORD(v9[4].__value_.__left_) <= v5)
    {
      v28 = (uint64_t *)v9[5].__value_.__left_;
      uint64_t v29 = *v28;
      uint64_t v30 = *v28;
      if (*v28 || (uint64_t v30 = v28[2]) != 0) {
        int v31 = *(_DWORD *)(v30 + 20);
      }
      else {
        int v31 = -1;
      }
      if (v31 != *(_DWORD *)(*(void *)a4 + 20))
      {
        v39 = sub_100200FB4((id *)self->fLogger.__ptr_.__value_);
        if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
        {
          v43 = (uint64_t *)v9[5].__value_.__left_;
          uint64_t v44 = *v43;
          if (*v43 || (uint64_t v44 = v43[2]) != 0) {
            int v45 = *(_DWORD *)(v44 + 20);
          }
          else {
            int v45 = -1;
          }
          uint64_t v46 = *(void *)a4;
          uint64_t v47 = *(int *)(*(void *)a4 + 16);
          if (v47 > 2) {
            v48 = "???";
          }
          else {
            v48 = off_101A04808[v47];
          }
          int v49 = *(_DWORD *)(v46 + 20);
          v50 = (void *)(v46 + 32);
          if (*(char *)(v46 + 55) < 0) {
            v50 = (void *)*v50;
          }
          int v56 = 67110146;
          int v57 = v45;
          __int16 v58 = 1024;
          *(_DWORD *)v59 = v49;
          *(_WORD *)&v59[4] = 2080;
          *(void *)&v59[6] = v48;
          *(_WORD *)&v59[14] = 2080;
          *(void *)&v59[16] = v50;
          *(_WORD *)&v59[24] = 2080;
          *(void *)&v59[26] = sub_100BC87FC(v5);
          _os_log_error_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_ERROR, "(Raise a bug) Client pid changed, replacing old client with pid: %d, with new client pid: %d, name: %s (%s, service: %s)", (uint8_t *)&v56, 0x2Cu);
        }

        v40 = (char *)operator new(0x38uLL);
        *((void *)v40 + 1) = 0;
        *((void *)v40 + 2) = 0;
        *(void *)v40 = off_101A045D0;
        *(_OWORD *)(v40 + 24) = 0u;
        v41 = v40 + 24;
        *(_OWORD *)(v40 + 40) = 0u;
        v42 = (std::__shared_weak_count *)v9[6].__value_.__left_;
        v9[5].__value_.__left_ = v40 + 24;
        v9[6].__value_.__left_ = v40;
        if (!v42) {
          goto LABEL_54;
        }
        sub_10004D2C8(v42);
LABEL_53:
        v41 = v9[5].__value_.__left_;
LABEL_54:
        sub_10076BA78(v41, *(void *)a4, *((void *)a4 + 1));
        return;
      }
      int v32 = *(_DWORD *)(*(void *)a4 + 16);
      if (v32 != 1)
      {
        if (v32 != 2) {
          goto LABEL_40;
        }
        uint64_t v29 = v28[2];
      }
      if (v29)
      {
        v33 = sub_100200FB4((id *)self->fLogger.__ptr_.__value_);
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
        {
          uint64_t v51 = *(void *)a4;
          v52 = (void *)(*(void *)a4 + 32);
          if (*(char *)(*(void *)a4 + 55) < 0) {
            v52 = (void *)*v52;
          }
          int v53 = *(_DWORD *)(v51 + 20);
          uint64_t v54 = *(int *)(v51 + 16);
          if (v54 > 2) {
            v55 = "???";
          }
          else {
            v55 = off_101A04808[v54];
          }
          int v56 = 67109890;
          int v57 = v53;
          __int16 v58 = 2080;
          *(void *)v59 = v52;
          *(_WORD *)&v59[8] = 2080;
          *(void *)&v59[10] = v55;
          *(_WORD *)&v59[18] = 2080;
          *(void *)&v59[20] = sub_100BC87FC(v5);
          _os_log_error_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_ERROR, "(Raise a bug) Client with pid: %d, name: %s, already has a framer of type: %s. Replacing anyway. (service: %s)", (uint8_t *)&v56, 0x26u);
        }
        goto LABEL_52;
      }
LABEL_40:
      v33 = sub_100200FB4((id *)self->fLogger.__ptr_.__value_);
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v34 = *(void *)a4;
        v35 = (void *)(*(void *)a4 + 32);
        if (*(char *)(*(void *)a4 + 55) < 0) {
          v35 = (void *)*v35;
        }
        int v36 = *(_DWORD *)(v34 + 20);
        uint64_t v37 = *(int *)(v34 + 16);
        if (v37 > 2) {
          v38 = "???";
        }
        else {
          v38 = off_101A04808[v37];
        }
        int v56 = 67109890;
        int v57 = v36;
        __int16 v58 = 2080;
        *(void *)v59 = v35;
        *(_WORD *)&v59[8] = 2080;
        *(void *)&v59[10] = v38;
        *(_WORD *)&v59[18] = 2080;
        *(void *)&v59[20] = sub_100BC87FC(v5);
        _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "#I Second connection from client, with pid: %d, name: %s (%s, service: %s)", (uint8_t *)&v56, 0x26u);
      }
LABEL_52:

      goto LABEL_53;
    }
  }
  int v13 = sub_100200FB4((id *)self->fLogger.__ptr_.__value_);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v14 = *(void *)a4;
    unint64_t v15 = (void *)(*(void *)a4 + 32);
    if (*(char *)(*(void *)a4 + 55) < 0) {
      unint64_t v15 = (void *)*v15;
    }
    uint64_t v16 = *(int *)(v14 + 16);
    if (v16 > 2) {
      v17 = "???";
    }
    else {
      v17 = off_101A04808[v16];
    }
    int v18 = *(_DWORD *)(v14 + 20);
    v19 = sub_100BC87FC(v5);
    unint64_t v20 = *(char *)(v14 + 24);
    if (v20 > 3) {
      v21 = "???";
    }
    else {
      v21 = off_101A04820[v20];
    }
    int v56 = 67110146;
    int v57 = v18;
    __int16 v58 = 2080;
    *(void *)v59 = v15;
    *(_WORD *)&v59[8] = 2080;
    *(void *)&v59[10] = v17;
    *(_WORD *)&v59[18] = 2080;
    *(void *)&v59[20] = v19;
    *(_WORD *)&v59[28] = 2080;
    *(void *)&v59[30] = v21;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "#I Adding new client, with pid: %d, name: %s (%s, service: %s, client priority: %s)", (uint8_t *)&v56, 0x30u);
  }

  v22 = (char *)operator new(0x38uLL);
  *((void *)v22 + 1) = 0;
  *((void *)v22 + 2) = 0;
  *(void *)v22 = off_101A045D0;
  *(_OWORD *)(v22 + 24) = 0u;
  *(_OWORD *)(v22 + 40) = 0u;
  sub_10076BA78((void *)v22 + 3, *(void *)a4, *((void *)a4 + 1));
  int v23 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<StewieServiceType, std::shared_ptr<(anonymous namespace)::StewieServiceContext>>, void *>>> *)p_pair1->__value_.__left_;
  uint64_t v24 = &self->fServiceContext.__tree_.__pair1_;
  if (p_pair1->__value_.__left_)
  {
    while (1)
    {
      while (1)
      {
        uint64_t v24 = v23;
        unsigned int v25 = LOWORD(v23[4].__value_.__left_);
        if (v25 <= v5) {
          break;
        }
        int v23 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<StewieServiceType, std::shared_ptr<(anonymous namespace)::StewieServiceContext>>, void *>>> *)v24->__value_.__left_;
        p_pair1 = v24;
        if (!v24->__value_.__left_) {
          goto LABEL_29;
        }
      }
      if (v25 >= v5) {
        break;
      }
      int v23 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<StewieServiceType, std::shared_ptr<(anonymous namespace)::StewieServiceContext>>, void *>>> *)v24[1].__value_.__left_;
      if (!v23)
      {
        p_pair1 = v24 + 1;
        goto LABEL_29;
      }
    }
    sub_10004D2C8((std::__shared_weak_count *)v22);
  }
  else
  {
LABEL_29:
    v26 = operator new(0x38uLL);
    v26[16] = v5;
    *((void *)v26 + 5) = v22 + 24;
    *((void *)v26 + 6) = v22;
    *(void *)v26 = 0;
    *((void *)v26 + 1) = 0;
    *((void *)v26 + 2) = v24;
    p_pair1->__value_.__left_ = v26;
    v27 = *(void **)self->fServiceContext.__tree_.__begin_node_;
    if (v27)
    {
      self->fServiceContext.__tree_.__begin_node_ = v27;
      v26 = p_pair1->__value_.__left_;
    }
    sub_100046C90((uint64_t *)self->fServiceContext.__tree_.__pair1_.__value_.__left_, (uint64_t *)v26);
    ++self->fServiceContext.__tree_.__pair3_.__value_;
  }
}

- (void)removeStewieClient:(unsigned __int16)a3 clientPid:(int)a4 framerType:(int)a5
{
  unsigned int v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->fQueue);
  left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<StewieServiceType, std::shared_ptr<(anonymous namespace)::StewieServiceContext>>, void *>>> *)self->fServiceContext.__tree_.__pair1_.__value_.__left_;
  if (left)
  {
    p_pair1 = &self->fServiceContext.__tree_.__pair1_;
    do
    {
      unsigned int left_low = LOWORD(left[4].__value_.__left_);
      BOOL v11 = left_low >= v6;
      if (left_low >= v6) {
        uint64_t v12 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<StewieServiceType, std::shared_ptr<(anonymous namespace)::StewieServiceContext>>, void *>>> **)left;
      }
      else {
        uint64_t v12 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<StewieServiceType, std::shared_ptr<(anonymous namespace)::StewieServiceContext>>, void *>>> **)&left[1];
      }
      if (v11) {
        p_pair1 = left;
      }
      left = *v12;
    }
    while (*v12);
    if (p_pair1 != &self->fServiceContext.__tree_.__pair1_ && LOWORD(p_pair1[4].__value_.__left_) <= v6)
    {
      int v13 = (uint64_t *)p_pair1[5].__value_.__left_;
      uint64_t v14 = *v13;
      if (*v13 || (uint64_t v14 = v13[2]) != 0) {
        int v15 = *(_DWORD *)(v14 + 20);
      }
      else {
        int v15 = -1;
      }
      uint64_t v16 = sub_100200FB4((id *)self->fLogger.__ptr_.__value_);
      v17 = v16;
      if (v15 == a4)
      {
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          int v24 = 67109378;
          int v25 = a4;
          __int16 v26 = 2080;
          v27 = sub_100BC87FC(v6);
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "#I Removing client pid: %d, for service: %s", (uint8_t *)&v24, 0x12u);
        }

        int v18 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<StewieServiceType, std::shared_ptr<(anonymous namespace)::StewieServiceContext>>, void *>>> *)p_pair1[1].__value_.__left_;
        if (v18)
        {
          do
          {
            v19 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<StewieServiceType, std::shared_ptr<(anonymous namespace)::StewieServiceContext>>, void *>>> **)v18;
            int v18 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<StewieServiceType, std::shared_ptr<(anonymous namespace)::StewieServiceContext>>, void *>>> *)v18->__value_.__left_;
          }
          while (v18);
        }
        else
        {
          unint64_t v20 = p_pair1;
          do
          {
            v19 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<StewieServiceType, std::shared_ptr<(anonymous namespace)::StewieServiceContext>>, void *>>> **)v20[2].__value_.__left_;
            BOOL v21 = *v19 == v20;
            unint64_t v20 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<StewieServiceType, std::shared_ptr<(anonymous namespace)::StewieServiceContext>>, void *>>> *)v19;
          }
          while (!v21);
        }
        if (self->fServiceContext.__tree_.__begin_node_ == p_pair1) {
          self->fServiceContext.__tree_.__begin_node_ = v19;
        }
        v22 = (uint64_t *)self->fServiceContext.__tree_.__pair1_.__value_.__left_;
        --self->fServiceContext.__tree_.__pair3_.__value_;
        sub_10005EE6C(v22, (uint64_t *)p_pair1);
        int v23 = (std::__shared_weak_count *)p_pair1[6].__value_.__left_;
        if (v23) {
          sub_10004D2C8(v23);
        }
        operator delete(p_pair1);
      }
      else
      {
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          int v24 = 67109634;
          int v25 = a4;
          __int16 v26 = 2080;
          v27 = sub_100BC87FC(v6);
          __int16 v28 = 1024;
          int v29 = v15;
          _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "(Remove) Client with pid %d is not the current client of service: %s. Current client of the service is pid: %d", (uint8_t *)&v24, 0x18u);
        }
      }
    }
  }
}

- (void)handleDataPathIdle
{
  v3 = sub_100200FB4((id *)self->fLogger.__ptr_.__value_);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v8 = 134217984;
    uint64_t v9 = 30;
    _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "Idle: No data client for last %lld seconds", (uint8_t *)&v8, 0xCu);
  }

  cntrl = self->fDelegate.__cntrl_;
  if (cntrl)
  {
    unsigned int v5 = std::__shared_weak_count::lock((std::__shared_weak_count *)cntrl);
    if (v5)
    {
      unsigned int v6 = v5;
      ptr = self->fDelegate.__ptr_;
      if (ptr) {
        (*(void (**)(StewieAgentDelegate *))(*(void *)ptr + 32))(ptr);
      }
      sub_10004D2C8(v6);
    }
  }
}

- (void)monitorDataPath
{
  if (self->fState.activeServices && !self->fAssignedServices.__tree_.__pair3_.__value_)
  {
    if (!self->fDataPathIdleTimer.__ptr_)
    {
      id location = 0;
      objc_initWeak(&location, self);
      sub_100058DB0(&__p, "StewieDataPathIdleTimer");
      uint64_t v10 = self->fQueue;
      Registry::getTimerService(&v8, self->fRegistry.__ptr_);
      objc_copyWeak(&to, &location);
      v17 = 0;
      int v15 = off_101A04620;
      objc_moveWeak(&v16, &to);
      v17 = &v15;
      objc_destroyWeak(&to);
      AutoStartTimer::create();
      shared_ptr<AutoStartTimer> v4 = v13;
      shared_ptr<AutoStartTimer> v13 = (shared_ptr<AutoStartTimer>)0;
      cntrl = self->fDataPathIdleTimer.__cntrl_;
      self->fDataPathIdleTimer = v4;
      if (cntrl)
      {
        sub_10004D2C8((std::__shared_weak_count *)cntrl);
        if (v13.__cntrl_) {
          sub_10004D2C8((std::__shared_weak_count *)v13.__cntrl_);
        }
      }
      sub_10003B34C(&v15);
      if (v9) {
        sub_10004D2C8(v9);
      }
      unsigned int v6 = v10;
      uint64_t v10 = 0;

      if (v12 < 0) {
        operator delete(__p);
      }
      objc_destroyWeak(&location);
    }
  }
  else
  {
    v3 = self->fDataPathIdleTimer.__cntrl_;
    self->fDataPathIdleTimer.__ptr_ = 0;
    self->fDataPathIdleTimer.__cntrl_ = 0;
    if (v3)
    {
      sub_10004D2C8((std::__shared_weak_count *)v3);
    }
  }
}

- (void)handleClientDisconnectedForService:(unsigned __int16)a3
{
  cntrl = self->fDelegate.__cntrl_;
  if (cntrl)
  {
    uint64_t v5 = a3;
    unsigned int v6 = std::__shared_weak_count::lock((std::__shared_weak_count *)cntrl);
    if (v6)
    {
      v7 = v6;
      ptr = self->fDelegate.__ptr_;
      if (ptr) {
        (*(void (**)(StewieAgentDelegate *, uint64_t))(*(void *)ptr + 40))(ptr, v5);
      }
      sub_10004D2C8(v7);
    }
  }
}

- (void)handleFramerHasData:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->fQueue);
  begin = (char *)self->fFramers.__begin_;
  end = (char *)self->fFramers.__end_;
  if (begin != end)
  {
    while (*(id *)(*(void *)begin + 8) != v4)
    {
      begin += 16;
      if (begin == end) {
        goto LABEL_4;
      }
    }
  }
  if (begin == end)
  {
LABEL_4:
    v7 = sub_100200FB4((id *)self->fLogger.__ptr_.__value_);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v8 = 138412290;
      id v9 = v4;
      _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Ignoring hasData from framer: %@", (uint8_t *)&v8, 0xCu);
    }
  }
  else
  {
    **(unsigned char **)begin = 1;
    [(StewieNWAgent *)self getDataIfRequired];
  }
}

- (void)deliverNackWithMsgId:(id)a3 toFramer:(const void *)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->fQueue);
  if (v8)
  {
    uint64_t v10 = [objc_alloc((Class)CTStewieMessageAck) initWithError:v9];
    id v26 = 0;
    BOOL v11 = +[NSKeyedArchiver archivedDataWithRootObject:v10 requiringSecureCoding:1 error:&v26];
    id v12 = v26;
    if (v12 || !v11)
    {
      shared_ptr<AutoStartTimer> v13 = sub_100200FB4((id *)self->fLogger.__ptr_.__value_);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        uint64_t v18 = *(void *)(*(void *)a4 + 8);
        int v19 = *(_DWORD *)(*(void *)a4 + 20);
        unint64_t v20 = (void *)(*(void *)a4 + 32);
        if (*(char *)(*(void *)a4 + 55) < 0) {
          unint64_t v20 = (void *)*v20;
        }
        *(_DWORD *)buf = 138413058;
        uint64_t v28 = v18;
        __int16 v29 = 1024;
        int v30 = v19;
        __int16 v31 = 2080;
        int v32 = v20;
        __int16 v33 = 2112;
        id v34 = v12;
        _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Unable to serialize ack for sending over framer: %@, client pid: %d, name: %s, error: %@", buf, 0x26u);
      }
    }
    else
    {
      shared_ptr<AutoStartTimer> v13 = [objc_alloc((Class)CTStewieTransportMessage) initWithMsgId:v8];
      [v13 setData:v11];
      id v25 = 0;
      uint64_t v14 = +[NSKeyedArchiver archivedDataWithRootObject:v13 requiringSecureCoding:1 error:&v25];
      id v12 = v25;
      if (v12 || !v14)
      {
        BOOL v21 = sub_100200FB4((id *)self->fLogger.__ptr_.__value_);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          uint64_t v22 = *(void *)(*(void *)a4 + 8);
          int v23 = *(_DWORD *)(*(void *)a4 + 20);
          int v24 = (void *)(*(void *)a4 + 32);
          if (*(char *)(*(void *)a4 + 55) < 0) {
            int v24 = (void *)*v24;
          }
          *(_DWORD *)buf = 138413058;
          uint64_t v28 = v22;
          __int16 v29 = 1024;
          int v30 = v23;
          __int16 v31 = 2080;
          int v32 = v24;
          __int16 v33 = 2112;
          id v34 = v12;
          _os_log_error_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "Cannot deliver message: Unable to prepare CTStewieTransportMessage for delivery to framer:%@, client pid: %d, name: %s, error: %@", buf, 0x26u);
        }
      }
      else
      {
        sub_10076C588(*(void **)(*(void *)a4 + 8), v14);
      }
    }
  }
  else
  {
    uint64_t v10 = sub_100200FB4((id *)self->fLogger.__ptr_.__value_);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      uint64_t v15 = *(void *)(*(void *)a4 + 8);
      int v16 = *(_DWORD *)(*(void *)a4 + 20);
      v17 = (void *)(*(void *)a4 + 32);
      if (*(char *)(*(void *)a4 + 55) < 0) {
        v17 = (void *)*v17;
      }
      *(_DWORD *)buf = 138412802;
      uint64_t v28 = v15;
      __int16 v29 = 1024;
      int v30 = v16;
      __int16 v31 = 2080;
      int v32 = v17;
      _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Cannot deliver ack for nil msgId over framer: %@, client pid: %d, name: %s", buf, 0x1Cu);
    }
  }
}

- (void)provideDataToDelegate:(id)a3 sourceFramer:(const void *)a4
{
  v83 = self;
  id v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->fQueue);
  id v81 = 0;
  id location = 0;
  id obj = 0;
  v7 = +[NSKeyedUnarchiver unarchivedObjectOfClass:objc_opt_class() fromData:v6 error:&obj];
  objc_storeStrong(&location, obj);
  id v81 = v7;
  if (v7) {
    BOOL v8 = location == 0;
  }
  else {
    BOOL v8 = 0;
  }
  if (!v8)
  {
    id v9 = sub_100200FB4((id *)v83->fLogger.__ptr_.__value_);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v44 = *(void *)a4;
      uint64_t v45 = *(int *)(*(void *)a4 + 16);
      if (v45 > 2) {
        uint64_t v46 = "???";
      }
      else {
        uint64_t v46 = off_101A04808[v45];
      }
      v50 = (void *)(v44 + 32);
      if (*(char *)(v44 + 55) < 0) {
        v50 = (void *)*v50;
      }
      int v51 = *(_DWORD *)(v44 + 20);
      if (v6) {
        id v52 = [v6 length];
      }
      else {
        id v52 = 0;
      }
      *(_DWORD *)buf = 136316162;
      *(void *)&uint8_t buf[4] = v46;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v51;
      *(_WORD *)&buf[18] = 2080;
      *(void *)&buf[20] = v50;
      *(_WORD *)&buf[28] = 2048;
      *(void *)&buf[30] = v52;
      *(_WORD *)&buf[38] = 2112;
      p_ptr = location;
      _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "(connection: %s, client pid: %d, name: %s) Failed to decode incoming data of length: %lu. Error: %@", buf, 0x30u);
    }
LABEL_6:

    goto LABEL_82;
  }
  uint64_t v10 = [v7 msgId];
  BOOL v11 = v10 == 0;

  if (v11)
  {
    id v9 = sub_100200FB4((id *)v83->fLogger.__ptr_.__value_);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v53 = *(void *)a4;
      uint64_t v54 = *(int *)(*(void *)a4 + 16);
      if (v54 > 2) {
        v55 = "???";
      }
      else {
        v55 = off_101A04808[v54];
      }
      int v64 = *(_DWORD *)(v53 + 20);
      v65 = (void *)(v53 + 32);
      if (*(char *)(v53 + 55) < 0) {
        v65 = (void *)*v65;
      }
      *(_DWORD *)buf = 136315906;
      *(void *)&uint8_t buf[4] = v55;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v64;
      *(_WORD *)&buf[18] = 2080;
      *(void *)&buf[20] = v65;
      *(_WORD *)&buf[28] = 2112;
      *(void *)&buf[30] = v81;
      _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "(connection: %s, client pid: %d, name: %s) Message ID is missing in transport message: %@", buf, 0x26u);
    }
    goto LABEL_6;
  }
  v79 = 0;
  id v12 = +[CTStewieTransportMessage allowedSetOfClasses];
  shared_ptr<AutoStartTimer> v13 = [v81 data];
  id v78 = location;
  uint64_t v14 = +[NSKeyedUnarchiver unarchivedObjectOfClasses:v12 fromData:v13 error:&v78];
  objc_storeStrong(&location, v78);
  v79 = v14;

  value = (id *)v83->fLogger.__ptr_.__value_;
  if (!v79 || location)
  {
    unint64_t v20 = sub_100200FB4(value);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      uint64_t v56 = *(void *)a4;
      uint64_t v57 = *(int *)(*(void *)a4 + 16);
      if (v57 > 2) {
        __int16 v58 = "???";
      }
      else {
        __int16 v58 = off_101A04808[v57];
      }
      int v66 = *(_DWORD *)(v56 + 20);
      v67 = (void *)(v56 + 32);
      if (*(char *)(v56 + 55) < 0) {
        v67 = (void *)*v67;
      }
      *(_DWORD *)buf = 136316162;
      *(void *)&uint8_t buf[4] = v58;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v66;
      *(_WORD *)&buf[18] = 2080;
      *(void *)&buf[20] = v67;
      *(_WORD *)&buf[28] = 2112;
      *(void *)&buf[30] = v81;
      *(_WORD *)&buf[38] = 2112;
      p_ptr = location;
      _os_log_error_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "(connection: %s, client pid: %d, name: %s) Failed to decode message: %@. Error: %@", buf, 0x30u);
    }

    BOOL v21 = v83;
    uint64_t v22 = [v81 msgId];
    NSErrorUserInfoKey v91 = NSLocalizedDescriptionKey;
    CFStringRef v92 = @"Unable to decode contents";
    int v23 = +[NSDictionary dictionaryWithObjects:&v92 forKeys:&v91 count:1];
    int v24 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:22 userInfo:v23];
    [(StewieNWAgent *)v21 deliverNackWithMsgId:v22 toFramer:a4 error:v24];
  }
  else
  {
    int v16 = sub_100200FB4(value);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v17 = *(void *)a4;
      uint64_t v18 = *(int *)(*(void *)a4 + 16);
      if (v18 > 2) {
        int v19 = "???";
      }
      else {
        int v19 = off_101A04808[v18];
      }
      int v25 = *(_DWORD *)(v17 + 20);
      id v26 = (void *)(v17 + 32);
      if (*(char *)(v17 + 55) < 0) {
        id v26 = (void *)*v26;
      }
      *(_DWORD *)buf = 136316162;
      *(void *)&uint8_t buf[4] = v19;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v25;
      *(_WORD *)&buf[18] = 2080;
      *(void *)&buf[20] = v26;
      *(_WORD *)&buf[28] = 2112;
      *(void *)&buf[30] = v81;
      *(_WORD *)&buf[38] = 2112;
      p_ptr = v79;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "#I (connection: %s, client pid: %d, name: %s) Got message: %@, with contents: %@", buf, 0x30u);
    }

    v27 = v83;
    ptr = 0;
    cntrl = (std::__shared_weak_count *)v83->fDelegate.__cntrl_;
    if (cntrl)
    {
      __int16 v29 = std::__shared_weak_count::lock(cntrl);
      v77 = v29;
      if (v29)
      {
        ptr = v27->fDelegate.__ptr_;
        if (ptr)
        {
          int v30 = [v81 msgId];
          CFUUIDRef v75 = CFUUIDCreateFromString(kCFAllocatorDefault, v30);

          if ([v79 isMemberOfClass:objc_opt_class()])
          {
            __int16 v31 = [v81 metadata];
            int v32 = [v31 valueForKey:kCTStewieTransportMessageAckContextKey];

            if (v32 && [v32 length])
            {
              __int16 v33 = [v81 metadata];
              id v34 = [v33 valueForKey:kCTStewieTransportMessageTransportTypeKey];

              [v34 integerValue];
              id v35 = v32;
              id v36 = [v35 bytes];
              id v37 = v35;
              id v38 = [v37 bytes];
              v39 = (char *)[v37 length];
              memset(buf, 0, 24);
              sub_1001E7940(buf, v36, (uint64_t)&v39[(void)v38], &v39[(void)v38] - (char *)v36);
              CFUUIDRef v74 = v75;
              (*(void (**)(StewieAgentDelegate *))(*(void *)ptr + 8))(ptr);
              sub_10012577C((const void **)&v74);
              if (*(void *)buf)
              {
                *(void *)&buf[8] = *(void *)buf;
                operator delete(*(void **)buf);
              }
            }
            else
            {
              id v34 = sub_100200FB4((id *)v83->fLogger.__ptr_.__value_);
              if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "#I Ignoring ack because context is empty", buf, 2u);
              }
            }
          }
          else if ([v79 isMemberOfClass:objc_opt_class()])
          {
            v40 = v79;
            v41 = v40;
            if (v40)
            {
              *(void *)buf = v75;
              id v42 = [v40 notifyOption];
              if (v42 == (id)3) {
                uint64_t v43 = 1;
              }
              else {
                uint64_t v43 = 2 * (v42 != (id)1);
              }
              (*(void (**)(StewieAgentDelegate *, unsigned char *, uint64_t))(*(void *)ptr + 16))(ptr, buf, v43);
              sub_10012577C((const void **)buf);
            }
            else
            {
              v59 = sub_100200FB4((id *)v83->fLogger.__ptr_.__value_);
              if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
              {
                *(_WORD *)buf = 0;
                _os_log_error_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_ERROR, "Unable to parse notify option message", buf, 2u);
              }

              v60 = v83;
              v61 = [v81 msgId];
              NSErrorUserInfoKey v89 = NSLocalizedDescriptionKey;
              CFStringRef v90 = @"Unable to parse notify option message";
              v62 = +[NSDictionary dictionaryWithObjects:&v90 forKeys:&v89 count:1];
              v63 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:22 userInfo:v62];
              [(StewieNWAgent *)v60 deliverNackWithMsgId:v61 toFramer:a4 error:v63];
            }
          }
          else if ([v79 isMemberOfClass:objc_opt_class()])
          {
            uint64_t v47 = v79;
            v48 = v47;
            if (v47)
            {
              int v49 = objc_msgSend(v47, "offGridModeKey", v75);
              sub_10076D49C(buf, v49);
              (*(void (**)(StewieAgentDelegate *, CFUUIDRef *, unsigned char *))(*(void *)ptr + 24))(ptr, &v74, buf);
              if (*(void *)buf)
              {
                *(void *)&buf[8] = *(void *)buf;
                operator delete(*(void **)buf);
              }

              sub_10012577C((const void **)&v74);
            }
            else
            {
              v68 = sub_100200FB4((id *)v83->fLogger.__ptr_.__value_);
              if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
              {
                *(_WORD *)buf = 0;
                _os_log_error_impl((void *)&_mh_execute_header, v68, OS_LOG_TYPE_ERROR, "Unable to parse notify option message", buf, 2u);
              }

              v69 = v83;
              v70 = [v81 msgId];
              NSErrorUserInfoKey v87 = NSLocalizedDescriptionKey;
              CFStringRef v88 = @"Unable to parse notify option message";
              v71 = +[NSDictionary dictionaryWithObjects:&v88 forKeys:&v87 count:1];
              v72 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:22 userInfo:v71];
              [(StewieNWAgent *)v69 deliverNackWithMsgId:v70 toFramer:a4 error:v72];
            }
          }
          else
          {
            *(void *)buf = &v79;
            *(void *)&buf[8] = &location;
            *(void *)&buf[16] = &v83;
            *(void *)&buf[24] = &v81;
            *(void *)&buf[32] = a4;
            p_ptr = &ptr;
            v86 = &v75;
            if ([v79 isMemberOfClass:objc_opt_class()])
            {
              sub_10076D558((uint64_t)buf);
            }
            else if ([v79 isMemberOfClass:objc_opt_class()])
            {
              sub_10076DAEC((uint64_t)buf);
            }
            else if ([v79 isMemberOfClass:objc_opt_class()])
            {
              sub_10076E094((uint64_t)buf);
            }
            else if ([v79 isMemberOfClass:objc_opt_class()])
            {
              sub_10076E620((uint64_t)buf);
            }
            else if ([v79 isMemberOfClass:objc_opt_class()])
            {
              sub_10076EC00((uint64_t)buf);
            }
            else if ([v79 isMemberOfClass:objc_opt_class()])
            {
              sub_10076F19C((uint64_t)buf);
            }
            else if ([v79 isMemberOfClass:objc_opt_class()])
            {
              sub_10076F750((uint64_t)buf);
            }
            else if ([v79 isMemberOfClass:objc_opt_class()])
            {
              sub_10076FD14((uint64_t)buf);
            }
            else
            {
              v73 = sub_100200FB4((id *)v83->fLogger.__ptr_.__value_);
              if (os_log_type_enabled(v73, OS_LOG_TYPE_ERROR))
              {
                LOWORD(v74) = 0;
                _os_log_error_impl((void *)&_mh_execute_header, v73, OS_LOG_TYPE_ERROR, "Unknown message type - ignoring", (uint8_t *)&v74, 2u);
              }
            }
          }
          __int16 v29 = v77;
        }
      }
      if (v29) {
        sub_10004D2C8(v29);
      }
    }
  }

LABEL_82:
}

- (void)handleDataFromFramer:(id)a3 data:(id)a4 hasData:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->fQueue);
  begin = (char *)self->fFramers.__begin_;
  end = (char *)self->fFramers.__end_;
  if (begin != end)
  {
    while (*(id *)(*(void *)begin + 8) != v8)
    {
      begin += 16;
      if (begin == end) {
        goto LABEL_4;
      }
    }
  }
  if (begin == end)
  {
LABEL_4:
    id v12 = sub_100200FB4((id *)self->fLogger.__ptr_.__value_);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      int v14 = 138412290;
      id v15 = v8;
      _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Ignoring data from framer: %@", (uint8_t *)&v14, 0xCu);
    }
  }
  else
  {
    shared_ptr<AutoStartTimer> v13 = *(BOOL **)begin;
    *shared_ptr<AutoStartTimer> v13 = a5;
    v13[1] = 0;
    if (v9) {
      -[StewieNWAgent provideDataToDelegate:sourceFramer:](self, "provideDataToDelegate:sourceFramer:", v9);
    }
    [(StewieNWAgent *)self getDataIfRequired];
  }
}

- (void)scheduleGetForFramer:(const void *)a3
{
  p_fQueue = &self->fQueue;
  dispatch_assert_queue_V2((dispatch_queue_t)self->fQueue);
  *(unsigned char *)(*(void *)a3 + 1) = 1;
  id location = 0;
  objc_initWeak(&location, self);
  id v6 = *(void **)(*(void *)a3 + 8);
  shared_ptr<AutoStartTimer> v13 = *p_fQueue;
  objc_copyWeak(&v14, &location);
  uint64_t v22 = 0;
  v20[0] = off_101A046A0;
  v20[1] = v13;
  objc_moveWeak(&v21, &v14);
  v7 = &v22;
  uint64_t v22 = (std::__shared_weak_count_vtbl *)v20;
  objc_destroyWeak(&v14);

  id v8 = v6;
  if (!v8) {
    goto LABEL_11;
  }
  id v9 = (std::__shared_weak_count *)operator new(0x38uLL);
  uint64_t v10 = v9;
  v9->__shared_owners_ = 0;
  v9->__shared_weak_owners_ = 0;
  v9->__vftable = (std::__shared_weak_count_vtbl *)off_101A04510;
  BOOL v11 = (std::__shared_weak_count_vtbl *)&v9[1];
  if (v22)
  {
    if (v22 == (std::__shared_weak_count_vtbl *)v20)
    {
      v9[2].__vftable = v11;
      (*(void (**)(void *, std::__shared_weak_count_vtbl *))(v20[0] + 24))(v20, v11);
      goto LABEL_8;
    }
    v9[2].__vftable = v22;
  }
  else
  {
    v7 = &v9[2].__vftable;
  }
  void *v7 = 0;
LABEL_8:
  async_block[0] = _NSConcreteStackBlock;
  async_block[1] = 3321888768;
  async_block[2] = sub_100775B4C;
  async_block[3] = &unk_101A044D0;
  id v12 = v8;
  uint64_t v17 = v12;
  uint64_t v18 = v11;
  int v19 = v10;
  atomic_fetch_add_explicit(&v10->__shared_owners_, 1uLL, memory_order_relaxed);
  nw_framer_async(v12, async_block);
  if (v19) {
    sub_10004D2C8(v19);
  }

  sub_10004D2C8(v10);
LABEL_11:

  sub_100776964(v20);
  objc_destroyWeak(&location);
}

- (void)getDataIfRequired
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->fQueue);
  char v16 = 0;
  __int16 v15 = 0;
  begin_node = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<StewieServiceType, std::shared_ptr<(anonymous namespace)::StewieServiceContext>>, void *>>> *)self->fServiceContext.__tree_.__begin_node_;
  if (begin_node != &self->fServiceContext.__tree_.__pair1_)
  {
    do
    {
      left = begin_node[5].__value_.__left_;
      uint64_t v5 = (unsigned char *)*left;
      if (*left)
      {
        unint64_t v6 = v5[24];
        if (v6 >= 3)
        {
          log = sub_100200FB4((id *)self->fLogger.__ptr_.__value_);
          if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
          {
            shared_ptr<AutoStartTimer> v13 = sub_100BC87FC(LOWORD(begin_node[4].__value_.__left_));
            *(_DWORD *)buf = 134218242;
            unint64_t v18 = v6;
            __int16 v19 = 2080;
            unint64_t v20 = v13;
            _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "[Ignoring] Invalid bucket index: %zu, for service: %s", buf, 0x16u);
          }

          goto LABEL_9;
        }
        if (!*((unsigned char *)&v15 + v6) && self->fReadyToConsumeDataFromkOne[v6] && *v5)
        {
          if (!v5[1])
          {
            -[StewieNWAgent scheduleGetForFramer:](self, "scheduleGetForFramer:");
            left = begin_node[5].__value_.__left_;
          }
          *((unsigned char *)&v15 + v6) = 1;
        }
      }
      id v9 = (unsigned char *)left[2];
      uint64_t v7 = (uint64_t)(left + 2);
      id v8 = v9;
      if (v9 && *v8 && !v8[1]) {
        [(StewieNWAgent *)self scheduleGetForFramer:v7];
      }
LABEL_9:
      isa = (StewieNWAgent *)begin_node[1].__value_.__left_;
      if (isa)
      {
        do
        {
          BOOL v11 = isa;
          isa = (StewieNWAgent *)isa->super.isa;
        }
        while (isa);
      }
      else
      {
        do
        {
          BOOL v11 = (StewieNWAgent *)begin_node[2].__value_.__left_;
          BOOL v12 = v11->super.isa == (Class)begin_node;
          begin_node = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<StewieServiceType, std::shared_ptr<(anonymous namespace)::StewieServiceContext>>, void *>>> *)v11;
        }
        while (!v12);
      }
      begin_node = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<StewieServiceType, std::shared_ptr<(anonymous namespace)::StewieServiceContext>>, void *>>> *)v11;
    }
    while (v11 != (StewieNWAgent *)&self->fServiceContext.__tree_.__pair1_);
  }
}

- (id)stewieProtocolDefinition
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->fQueue);
  fProtocolDefinition = self->fProtocolDefinition;
  if (fProtocolDefinition)
  {
    id v4 = fProtocolDefinition;
  }
  else
  {
    id location = 0;
    objc_initWeak(&location, self);
    uint64_t v28 = 0;
    long long to = 0u;
    long long v27 = 0u;
    objc_copyWeak((id *)&to, &location);
    *((void *)&to + 1) = self->fLogger.__ptr_.__value_;
    uint64_t v5 = self->fQueue;
    ptr = self->fRegistry.__ptr_;
    cntrl = self->fRegistry.__cntrl_;
    *(void *)&long long v27 = v5;
    *((void *)&v27 + 1) = ptr;
    uint64_t v28 = cntrl;
    if (cntrl) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
    }
    id v23 = 0;
    value = 0;
    int v25 = 0;
    objc_copyWeak(&v23, &location);
    value = self->fLogger.__ptr_.__value_;
    int v25 = self->fQueue;
    id from = 0;
    id v21 = 0;
    uint64_t v22 = 0;
    objc_copyWeak(&from, &location);
    id v21 = self->fLogger.__ptr_.__value_;
    uint64_t v22 = self->fQueue;
    start_handler[0] = _NSConcreteStackBlock;
    start_handler[1] = 3321888768;
    start_handler[2] = sub_100770B28;
    start_handler[3] = &unk_101A04270;
    objc_copyWeak(v12, (id *)&to);
    v12[1] = *((id *)&to + 1);
    id v13 = (id)v27;
    uint64_t v14 = *((void *)&v27 + 1);
    __int16 v15 = v28;
    if (v28) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)v28 + 1, 1uLL, memory_order_relaxed);
    }
    objc_copyWeak(v16, &from);
    v16[1] = v21;
    uint64_t v17 = v22;
    objc_copyWeak(v18, &v23);
    v18[1] = value;
    __int16 v19 = v25;
    definition = (OS_nw_protocol_definition *)nw_framer_create_definition("StewieAgent", 0, start_handler);
    id v9 = self->fProtocolDefinition;
    self->fProtocolDefinition = definition;

    id v4 = self->fProtocolDefinition;
    objc_destroyWeak(v18);

    objc_destroyWeak(v16);
    if (v15) {
      sub_10004D2C8((std::__shared_weak_count *)v15);
    }

    objc_destroyWeak(v12);
    objc_destroyWeak(&from);

    objc_destroyWeak(&v23);
    if (v28) {
      sub_10004D2C8((std::__shared_weak_count *)v28);
    }

    objc_destroyWeak((id *)&to);
    objc_destroyWeak(&location);
  }

  return v4;
}

- (void)startFlowForClient:(id)a3 assign:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(void, nw_endpoint_t, void *, nw_protocol_options_t))a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->fQueue);
  id v8 = nw_agent_client_copy_endpoint();
  id v9 = v8;
  if (v8)
  {
    int port = nw_endpoint_get_port(v8);
    if ((self->fState.dataPathAssertedServices & (unsigned __int16)port) != 0)
    {
      hostname = (char *)nw_endpoint_get_hostname(v9);
      if (hostname)
      {
        BOOL v12 = (void *)nw_agent_client_copy_parameters();
        v48 = v12;
        if (v12)
        {
          sub_10077224C(v12);
          sub_100058DB0(buf, hostname);
          int v13 = sub_100772300((const std::string *)buf);
          int v14 = v13;
          if ((buf[23] & 0x80000000) != 0)
          {
            operator delete(*(void **)buf);
            if (v14)
            {
LABEL_7:
              uint64_t v46 = v7;
              id v47 = v6;
              int pid = nw_parameters_get_pid();
              sub_100772354();
              char v16 = (unsigned __int16 *)qword_101B0D688;
              if (qword_101B0D688 == qword_101B0D690)
              {
LABEL_23:
                uint64_t v45 = hostname;
                sub_100772354();
                int v24 = (unsigned __int16 *)qword_101B0D688;
                uint64_t v25 = qword_101B0D690;
                if (qword_101B0D688 != qword_101B0D690)
                {
                  p_pair1 = &self->fAssignedServices.__tree_.__pair1_;
                  do
                  {
                    unsigned int v27 = *v24;
                    if ((v27 & port) != 0)
                    {
                      left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<StewieServiceType, int>, void *>>> *)p_pair1->__value_.__left_;
                      __int16 v29 = &self->fAssignedServices.__tree_.__pair1_;
                      int v30 = &self->fAssignedServices.__tree_.__pair1_;
                      if (p_pair1->__value_.__left_)
                      {
                        while (1)
                        {
                          while (1)
                          {
                            int v30 = left;
                            unsigned int v31 = WORD2(left[3].__value_.__left_);
                            if (v31 <= v27) {
                              break;
                            }
                            left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<StewieServiceType, int>, void *>>> *)v30->__value_.__left_;
                            __int16 v29 = v30;
                            if (!v30->__value_.__left_) {
                              goto LABEL_33;
                            }
                          }
                          if (v31 >= v27) {
                            break;
                          }
                          left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<StewieServiceType, int>, void *>>> *)v30[1].__value_.__left_;
                          if (!left)
                          {
                            __int16 v29 = v30 + 1;
                            goto LABEL_33;
                          }
                        }
                      }
                      else
                      {
LABEL_33:
                        int v32 = operator new(0x28uLL);
                        v32[14] = v27;
                        *((_DWORD *)v32 + 8) = pid;
                        *(void *)int v32 = 0;
                        *((void *)v32 + 1) = 0;
                        *((void *)v32 + 2) = v30;
                        v29->__value_.__left_ = v32;
                        __int16 v33 = *(void **)self->fAssignedServices.__tree_.__begin_node_;
                        if (v33)
                        {
                          self->fAssignedServices.__tree_.__begin_node_ = v33;
                          int v32 = v29->__value_.__left_;
                        }
                        sub_100046C90((uint64_t *)self->fAssignedServices.__tree_.__pair1_.__value_.__left_, (uint64_t *)v32);
                        ++self->fAssignedServices.__tree_.__pair3_.__value_;
                      }
                      [(StewieNWAgent *)self monitorDataPath];
                    }
                    ++v24;
                  }
                  while (v24 != (unsigned __int16 *)v25);
                }
                id v34 = sub_100200FB4((id *)self->fLogger.__ptr_.__value_);
                uint64_t v7 = v46;
                id v6 = v47;
                if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412546;
                  *(void *)&uint8_t buf[4] = v9;
                  *(_WORD *)&buf[12] = 2112;
                  *(void *)&buf[14] = v47;
                  _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "#I Accepted request for endpoint: %@ from client: %@", buf, 0x16u);
                }

                std::to_string((std::string *)buf, port);
                if (buf[23] >= 0) {
                  id v35 = buf;
                }
                else {
                  id v35 = *(const char **)buf;
                }
                nw_endpoint_t host = nw_endpoint_create_host(v45, v35);
                id v37 = (void *)nw_agent_client_copy_endpoint();
                id v38 = [(StewieNWAgent *)self stewieProtocolDefinition];
                nw_protocol_options_t options = nw_framer_create_options(v38);
                v46[2](v46, host, v37, options);

                if ((buf[23] & 0x80000000) != 0) {
                  operator delete(*(void **)buf);
                }
              }
              else
              {
                uint64_t v17 = &self->fAssignedServices.__tree_.__pair1_;
                while (1)
                {
                  unsigned int v18 = *v16;
                  if ((v18 & port) != 0)
                  {
                    __int16 v19 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<StewieServiceType, int>, void *>>> *)v17->__value_.__left_;
                    if (v17->__value_.__left_)
                    {
                      unint64_t v20 = &self->fAssignedServices.__tree_.__pair1_;
                      do
                      {
                        unsigned int v21 = WORD2(v19[3].__value_.__left_);
                        BOOL v22 = v21 >= v18;
                        if (v21 >= v18) {
                          p_left = &v19->__value_.__left_;
                        }
                        else {
                          p_left = &v19[1].__value_.__left_;
                        }
                        if (v22) {
                          unint64_t v20 = v19;
                        }
                        __int16 v19 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<StewieServiceType, int>, void *>>> *)*p_left;
                      }
                      while (*p_left);
                      if (v20 != v17
                        && v18 >= WORD2(v20[3].__value_.__left_)
                        && LODWORD(v20[4].__value_.__left_) != pid)
                      {
                        break;
                      }
                    }
                  }
                  if (++v16 == (unsigned __int16 *)qword_101B0D690) {
                    goto LABEL_23;
                  }
                }
                id v42 = sub_100200FB4((id *)self->fLogger.__ptr_.__value_);
                if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
                {
                  uint64_t v43 = sub_100BC87FC(v18);
                  int v44 = (int)v20[4].__value_.__left_;
                  *(_DWORD *)buf = 138413058;
                  *(void *)&uint8_t buf[4] = v47;
                  *(_WORD *)&buf[12] = 1024;
                  *(_DWORD *)&buf[14] = pid;
                  *(_WORD *)&buf[18] = 2080;
                  *(void *)&buf[20] = v43;
                  __int16 v50 = 1024;
                  int v51 = v44;
                  _os_log_error_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_ERROR, "Rejecting client: %@ with pid: %d. Client tried to request service: %s which already has another client with pid: %d", buf, 0x22u);
                }

                id v6 = v47;
                v7[2](v7, 0, 0, 0);
              }
              goto LABEL_61;
            }
          }
          else if (v13)
          {
            goto LABEL_7;
          }
          v41 = sub_100200FB4((id *)self->fLogger.__ptr_.__value_);
          if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            *(void *)&uint8_t buf[4] = hostname;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v6;
            _os_log_error_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_ERROR, "Invalid hostname: %s, requested by client: %@", buf, 0x16u);
          }
        }
        else
        {
          v41 = sub_100200FB4((id *)self->fLogger.__ptr_.__value_);
          if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            *(void *)&uint8_t buf[4] = v6;
            _os_log_error_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_ERROR, "No params found for client: %@", buf, 0xCu);
          }
        }

        v7[2](v7, 0, 0, 0);
LABEL_61:

        goto LABEL_62;
      }
      v40 = sub_100200FB4((id *)self->fLogger.__ptr_.__value_);
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v6;
        _os_log_error_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_ERROR, "No hostname found for client: %@", buf, 0xCu);
      }
    }
    else
    {
      v40 = sub_100200FB4((id *)self->fLogger.__ptr_.__value_);
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)&uint8_t buf[4] = port;
        *(_WORD *)&buf[8] = 2112;
        *(void *)&buf[10] = v6;
        _os_log_error_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_ERROR, "Requested services: %u, don't have data path asserted right now, client: %@", buf, 0x12u);
      }
    }
  }
  else
  {
    v40 = sub_100200FB4((id *)self->fLogger.__ptr_.__value_);
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v6;
      _os_log_error_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_ERROR, "No endpoint found for client: %@", buf, 0xCu);
    }
  }

  v7[2](v7, 0, 0, 0);
LABEL_62:
}

- (void)stopFlowForClient:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->fQueue);
  uint64_t v5 = (void *)nw_agent_client_copy_parameters();
  id v6 = v5;
  if (v5)
  {
    sub_10077224C(v5);
    uint64_t v7 = nw_agent_client_copy_endpoint();
    if (v7)
    {
      id v32 = v4;
      uint64_t pid = nw_parameters_get_pid();
      int port = nw_endpoint_get_port(v7);
      uint64_t v10 = sub_100200FB4((id *)self->fLogger.__ptr_.__value_);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        id v34 = v4;
        __int16 v35 = 1024;
        int v36 = pid;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "#I Client: %@, with pid: %d stopped flow", buf, 0x12u);
      }

      sub_100772354();
      BOOL v11 = (unsigned __int16 *)qword_101B0D688;
      uint64_t v12 = qword_101B0D690;
      if (qword_101B0D688 != qword_101B0D690)
      {
        p_pair1 = &self->fAssignedServices.__tree_.__pair1_;
        do
        {
          uint64_t v14 = *v11;
          if ((v14 & port) != 0)
          {
            left = (uint64_t *)p_pair1->__value_.__left_;
            if (!p_pair1->__value_.__left_) {
              goto LABEL_19;
            }
            char v16 = &self->fAssignedServices.__tree_.__pair1_;
            uint64_t v17 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<StewieServiceType, int>, void *>>> *)p_pair1->__value_.__left_;
            do
            {
              unsigned int v18 = WORD2(v17[3].__value_.__left_);
              BOOL v19 = v18 >= v14;
              if (v18 >= v14) {
                p_left = &v17->__value_.__left_;
              }
              else {
                p_left = &v17[1].__value_.__left_;
              }
              if (v19) {
                char v16 = v17;
              }
              uint64_t v17 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<StewieServiceType, int>, void *>>> *)*p_left;
            }
            while (*p_left);
            if (v16 == p_pair1 || v14 < WORD2(v16[3].__value_.__left_)) {
LABEL_19:
            }
              char v16 = &self->fAssignedServices.__tree_.__pair1_;
            if (!left) {
              goto LABEL_49;
            }
            unsigned int v21 = &self->fAssignedServices.__tree_.__pair1_;
            BOOL v22 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<StewieServiceType, int>, void *>>> *)p_pair1->__value_.__left_;
            do
            {
              unsigned int v23 = WORD2(v22[3].__value_.__left_);
              BOOL v24 = v23 >= v14;
              if (v23 >= v14) {
                uint64_t v25 = &v22->__value_.__left_;
              }
              else {
                uint64_t v25 = &v22[1].__value_.__left_;
              }
              if (v24) {
                unsigned int v21 = v22;
              }
              BOOL v22 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<StewieServiceType, int>, void *>>> *)*v25;
            }
            while (*v25);
            if (v21 == p_pair1
              || v14 < WORD2(v21[3].__value_.__left_)
              || LODWORD(v16[4].__value_.__left_) != pid)
            {
LABEL_49:
              id v4 = v32;
              goto LABEL_50;
            }
            id v26 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<StewieServiceType, int>, void *>>> *)v16[1].__value_.__left_;
            unsigned int v27 = v16;
            if (v26)
            {
              do
              {
                uint64_t v28 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<StewieServiceType, int>, void *>>> **)v26;
                id v26 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<StewieServiceType, int>, void *>>> *)v26->__value_.__left_;
              }
              while (v26);
            }
            else
            {
              do
              {
                uint64_t v28 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<StewieServiceType, int>, void *>>> **)v27[2].__value_.__left_;
                BOOL v29 = *v28 == v27;
                unsigned int v27 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<StewieServiceType, int>, void *>>> *)v28;
              }
              while (!v29);
            }
            if (self->fAssignedServices.__tree_.__begin_node_ == v16) {
              self->fAssignedServices.__tree_.__begin_node_ = v28;
            }
            --self->fAssignedServices.__tree_.__pair3_.__value_;
            sub_10005EE6C(left, (uint64_t *)v16);
            operator delete(v16);
            [(StewieNWAgent *)self monitorDataPath];
            [(StewieNWAgent *)self removeStewieClient:v14 clientPid:pid framerType:1];
            [(StewieNWAgent *)self removeStewieClient:v14 clientPid:pid framerType:2];
            [(StewieNWAgent *)self handleClientDisconnectedForService:v14];
          }
          ++v11;
        }
        while (v11 != (unsigned __int16 *)v12);
      }
      int v30 = sub_100200FB4((id *)self->fLogger.__ptr_.__value_);
      id v4 = v32;
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v34 = v32;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "#I Flow stopped for client: %@", buf, 0xCu);
      }

      [(StewieNWAgent *)self getDataIfRequired];
    }
    else
    {
      unsigned int v31 = sub_100200FB4((id *)self->fLogger.__ptr_.__value_);
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v34 = v4;
        _os_log_error_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "No endpoint found for client: %@", buf, 0xCu);
      }

      uint64_t v7 = 0;
    }
  }
  else
  {
    uint64_t v7 = sub_100200FB4((id *)self->fLogger.__ptr_.__value_);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v34 = v4;
      _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "No params found for client: %@", buf, 0xCu);
    }
  }
LABEL_50:
}

- (BOOL)startWithDelegate:(weak_ptr<StewieAgentDelegate>)a3
{
  ptr = a3.__ptr_;
  dispatch_assert_queue_V2((dispatch_queue_t)self->fQueue);
  if (self->fStarted)
  {
    uint64_t v5 = sub_100200FB4((id *)self->fLogger.__ptr_.__value_);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#E Already running", buf, 2u);
    }

    return 1;
  }
  else
  {
    id v8 = *(StewieAgentDelegate **)ptr;
    uint64_t v7 = *((void *)ptr + 1);
    if (v7) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v7 + 16), 1uLL, memory_order_relaxed);
    }
    cntrl = self->fDelegate.__cntrl_;
    self->fDelegate.__ptr_ = v8;
    self->fDelegate.__cntrl_ = (__shared_weak_count *)v7;
    if (cntrl) {
      std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
    }
    *(void *)buf = 0;
    uint64_t v30 = 0;
    nw_agent_get_uuid();
    if (uuid_is_null(buf))
    {
      uint64_t v10 = sub_100200FB4((id *)self->fLogger.__ptr_.__value_);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)unsigned int v27 = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "#E Fatal error: couldn't retreive uuid", v27, 2u);
      }
      unsigned __int8 v6 = 0;
    }
    else
    {
      uint64_t v10 = [objc_alloc((Class)NSUUID) initWithUUIDBytes:buf];
      id v11 = objc_alloc((Class)NEPolicy);
      uint64_t v12 = +[NEPolicyResult netAgentUUID:v10];
      int v13 = +[NEPolicyCondition allInterfaces];
      v28[0] = v13;
      id v14 = [objc_alloc((Class)NSString) initWithUTF8String:"CoreTelephony"];
      id v15 = [objc_alloc((Class)NSString) initWithUTF8String:"Stewie"];
      char v16 = +[NEPolicyCondition requiredAgentDomain:v14 agentType:v15];
      v28[1] = v16;
      uint64_t v17 = +[NEPolicyCondition customEntitlement:@"com.apple.CommCenter.StormBreaker"];
      v28[2] = v17;
      unsigned int v18 = +[NSArray arrayWithObjects:v28 count:3];
      id v19 = [v11 initWithOrder:1 result:v12 conditions:v18];

      id v20 = objc_alloc_init((Class)NEPolicySession);
      [v20 setPriority:100];
      [v20 addPolicy:v19];
      unsigned __int8 v6 = [v20 apply];
      if (v6)
      {
        objc_storeStrong((id *)&self->fPolicySession, v20);
        self->fStarted = 1;
        unsigned int v21 = sub_100200FB4((id *)self->fLogger.__ptr_.__value_);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)unsigned int v27 = 0;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "#I Starting agent", v27, 2u);
        }

        nw_agent_set_flow_sizes();
        *(void *)unsigned int v27 = 0;
        objc_initWeak((id *)v27, self);
        v25[1] = _NSConcreteStackBlock;
        v25[2] = (id)3221225472;
        v25[3] = sub_100772D9C;
        v25[4] = &unk_101A042A8;
        objc_copyWeak(&v26, (id *)v27);
        objc_copyWeak(v25, (id *)v27);
        nw_agent_set_flow_handlers();
        dispatch_data_t v22 = dispatch_data_create(&self->fState, 0x16uLL, 0, 0);
        nw_agent_change_state();

        objc_destroyWeak(v25);
        objc_destroyWeak(&v26);
        objc_destroyWeak((id *)v27);
      }
      else
      {
        unsigned int v23 = sub_100200FB4((id *)self->fLogger.__ptr_.__value_);
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)unsigned int v27 = 0;
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "#E Failed to apply policy", v27, 2u);
        }
      }
    }
  }
  return v6;
}

- (void)updateStewieState:(const StewieState *)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->fQueue);
  if (!self->fStarted)
  {
    id v37 = sub_100200FB4((id *)self->fLogger.__ptr_.__value_);
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_ERROR, "Agent has not started yet", buf, 2u);
    }
  }
  p_fState = &self->fState;
  if (!sub_1005025D0(&self->fState.allowedServices, a3))
  {
    long long v6 = *(_OWORD *)&a3->allowedServices;
    *(void *)&self->fState.int offGridCriteriaSatisfiedServices = *(void *)&a3->offGridCriteriaSatisfiedServices;
    *(_OWORD *)&p_fState->int allowedServices = v6;
    uint64_t v7 = sub_100200FB4((id *)self->fLogger.__ptr_.__value_);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t status = (char)self->fState.status;
      if (status > 4) {
        id v9 = "???";
      }
      else {
        id v9 = off_101A04770[status];
      }
      unint64_t baseReason = (char)self->fState.baseReason;
      if (baseReason > 7) {
        id v11 = "???";
      }
      else {
        id v11 = off_101A04798[baseReason];
      }
      unint64_t transportType = (char)self->fState.transportType;
      if (transportType > 2) {
        int v13 = "???";
      }
      else {
        int v13 = off_101A047D8[transportType];
      }
      int allowedServices = p_fState->allowedServices;
      log = v7;
      sub_100BC897C(p_fState->allowedServices, &v60);
      if ((v60.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        id v15 = &v60;
      }
      else {
        id v15 = (std::string *)v60.__r_.__value_.__r.__words[0];
      }
      int activeServices = self->fState.activeServices;
      sub_100BC897C(self->fState.activeServices, &v59);
      if ((v59.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        uint64_t v17 = &v59;
      }
      else {
        uint64_t v17 = (std::string *)v59.__r_.__value_.__r.__words[0];
      }
      int v49 = v17;
      int subscriptionDeterminedServices = self->fState.subscriptionDeterminedServices;
      sub_100BC897C(self->fState.subscriptionDeterminedServices, &v58);
      if ((v58.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        unsigned int v18 = &v58;
      }
      else {
        unsigned int v18 = (std::string *)v58.__r_.__value_.__r.__words[0];
      }
      id v47 = v18;
      int subscribedServices = self->fState.subscribedServices;
      sub_100BC897C(self->fState.subscribedServices, &v57);
      if ((v57.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        id v19 = &v57;
      }
      else {
        id v19 = (std::string *)v57.__r_.__value_.__r.__words[0];
      }
      uint64_t v45 = v19;
      int congestedServices = self->fState.congestedServices;
      sub_100BC897C(self->fState.congestedServices, &v56);
      int v44 = v15;
      if ((v56.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        id v20 = &v56;
      }
      else {
        id v20 = (std::string *)v56.__r_.__value_.__r.__words[0];
      }
      id v42 = v20;
      int dataPathAssertedServices = self->fState.dataPathAssertedServices;
      sub_100BC897C(self->fState.dataPathAssertedServices, &v55);
      int v40 = activeServices;
      int v41 = allowedServices;
      if ((v55.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        unsigned int v21 = &v55;
      }
      else {
        unsigned int v21 = (std::string *)v55.__r_.__value_.__r.__words[0];
      }
      v39 = v21;
      int demoAllowedServices = self->fState.demoAllowedServices;
      sub_100BC897C(self->fState.demoAllowedServices, &v54);
      unsigned int v23 = v13;
      BOOL v24 = v11;
      uint64_t v25 = v9;
      if ((v54.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        id v26 = &v54;
      }
      else {
        id v26 = (std::string *)v54.__r_.__value_.__r.__words[0];
      }
      id v38 = v26;
      int offGridCriteriaSatisfiedServices = self->fState.offGridCriteriaSatisfiedServices;
      sub_100BC897C(self->fState.offGridCriteriaSatisfiedServices, &v53);
      int v28 = SHIBYTE(v53.__r_.__value_.__r.__words[2]);
      std::string::size_type v29 = v53.__r_.__value_.__r.__words[0];
      int configuredForLocationServices = self->fState.configuredForLocationServices;
      sub_100BC897C(self->fState.configuredForLocationServices, &__p);
      unsigned int v31 = &v53;
      if (v28 < 0) {
        unsigned int v31 = (std::string *)v29;
      }
      p_p = &__p;
      if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
        p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
      }
      BOOL displaySatelliteIcon = self->fState.displaySatelliteIcon;
      id v34 = "true";
      *(_DWORD *)buf = 136320514;
      v62 = v25;
      __int16 v63 = 2080;
      if (!displaySatelliteIcon) {
        id v34 = "false";
      }
      int v64 = v24;
      __int16 v65 = 2080;
      int v66 = v23;
      __int16 v67 = 1024;
      int v68 = v41;
      __int16 v69 = 2080;
      v70 = v44;
      __int16 v71 = 1024;
      int v72 = v40;
      __int16 v73 = 2080;
      CFUUIDRef v74 = v49;
      __int16 v75 = 1024;
      int v76 = subscriptionDeterminedServices;
      __int16 v77 = 2080;
      id v78 = v47;
      __int16 v79 = 1024;
      int v80 = subscribedServices;
      __int16 v81 = 2080;
      v82 = v45;
      __int16 v83 = 1024;
      int v84 = congestedServices;
      __int16 v85 = 2080;
      v86 = v42;
      __int16 v87 = 1024;
      int v88 = dataPathAssertedServices;
      __int16 v89 = 2080;
      CFStringRef v90 = v39;
      __int16 v91 = 1024;
      int v92 = demoAllowedServices;
      __int16 v93 = 2080;
      v94 = v38;
      __int16 v95 = 1024;
      int v96 = offGridCriteriaSatisfiedServices;
      __int16 v97 = 2080;
      v98 = v31;
      __int16 v99 = 1024;
      int v100 = configuredForLocationServices;
      __int16 v101 = 2080;
      v102 = p_p;
      __int16 v103 = 2080;
      v104 = v34;
      uint64_t v7 = log;
      _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, "#I State changed to: %s, %s, %s, allowed services: { [Mask: %u] %s }, active services: { [Mask: %u] %s }, subscription determined for services: { [Mask: %u] %s }, subscribed services: { [Mask: %u] %s }, congested services: { [Mask: %u] %s }, data path asserted services: { [Mask: %u] %s }, Demo allowed services: { [Mask: %hu] %s }, off grid criteria satisfied services: { [Mask: %u] %s }, Configured for location services: { [Mask: %hu] %s }, display satellite icon: %s", buf, 0xBAu);
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(__p.__r_.__value_.__l.__data_);
      }
      if (SHIBYTE(v53.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v53.__r_.__value_.__l.__data_);
      }
      if (SHIBYTE(v54.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v54.__r_.__value_.__l.__data_);
      }
      if (SHIBYTE(v55.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v55.__r_.__value_.__l.__data_);
      }
      if (SHIBYTE(v56.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v56.__r_.__value_.__l.__data_);
      }
      if (SHIBYTE(v57.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v57.__r_.__value_.__l.__data_);
      }
      if (SHIBYTE(v58.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v58.__r_.__value_.__l.__data_);
      }
      if (SHIBYTE(v59.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v59.__r_.__value_.__l.__data_);
      }
      if (SHIBYTE(v60.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v60.__r_.__value_.__l.__data_);
      }
    }

    if (!self->fState.dataPathAssertedServices)
    {
      __int16 v35 = sub_100200FB4((id *)self->fLogger.__ptr_.__value_);
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "#I Clearing service context", buf, 2u);
      }

      sub_100119D90((void *)self->fServiceContext.__tree_.__pair1_.__value_.__left_);
      self->fServiceContext.__tree_.__begin_node_ = &self->fServiceContext.__tree_.__pair1_;
      self->fServiceContext.__tree_.__pair3_.__value_ = 0;
      self->fServiceContext.__tree_.__pair1_.__value_.__left_ = 0;
      sub_10019E028((uint64_t *)&self->fFramers);
      sub_10005D144((void *)self->fAssignedServices.__tree_.__pair1_.__value_.__left_);
      self->fAssignedServices.__tree_.__begin_node_ = &self->fAssignedServices.__tree_.__pair1_;
      self->fAssignedServices.__tree_.__pair1_.__value_.__left_ = 0;
      self->fAssignedServices.__tree_.__pair3_.__value_ = 0;
      *(_WORD *)self->fReadyToConsumeDataFromkOne = 0;
      self->fReadyToConsumeDataFromkOne[2] = 0;
    }
    dispatch_data_t v36 = dispatch_data_create(&self->fState, 0x16uLL, 0, 0);
    nw_agent_change_state();

    [(StewieNWAgent *)self monitorDataPath];
  }
}

- (void)deliverIncomingMessage:(id)a3 toService:(unsigned __int16)a4 ackContext:(void *)a5 srcTransport:(unsigned __int8)a6
{
  int v6 = a6;
  unsigned int v8 = a4;
  uint64_t v10 = (char *)a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->fQueue);
  if (v10)
  {
    left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<StewieServiceType, std::shared_ptr<(anonymous namespace)::StewieServiceContext>>, void *>>> *)self->fServiceContext.__tree_.__pair1_.__value_.__left_;
    if (!left) {
      goto LABEL_13;
    }
    p_pair1 = &self->fServiceContext.__tree_.__pair1_;
    do
    {
      unsigned int left_low = LOWORD(left[4].__value_.__left_);
      BOOL v14 = left_low >= v8;
      if (left_low >= v8) {
        id v15 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<StewieServiceType, std::shared_ptr<(anonymous namespace)::StewieServiceContext>>, void *>>> **)left;
      }
      else {
        id v15 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<StewieServiceType, std::shared_ptr<(anonymous namespace)::StewieServiceContext>>, void *>>> **)&left[1];
      }
      if (v14) {
        p_pair1 = left;
      }
      left = *v15;
    }
    while (*v15);
    if (p_pair1 != &self->fServiceContext.__tree_.__pair1_ && LOWORD(p_pair1[4].__value_.__left_) <= v8)
    {
      if (*(void *)p_pair1[5].__value_.__left_)
      {
        id v41 = 0;
        unsigned int v18 = +[NSKeyedArchiver archivedDataWithRootObject:v10 requiringSecureCoding:1 error:&v41];
        char v16 = v41;
        if (v16 || !v18)
        {
          id v19 = sub_100200FB4((id *)self->fLogger.__ptr_.__value_);
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          {
            id v37 = sub_100BC87FC(v8);
            *(_DWORD *)buf = 136315394;
            uint64_t v43 = v37;
            __int16 v44 = 2112;
            uint64_t v45 = (const char *)v16;
            _os_log_error_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "Cannot deliver message: Unable to prepare CTStewieMessageIncoming for delivery to service: %s, error: %@", buf, 0x16u);
          }
        }
        else
        {
          id v19 = objc_alloc_init((Class)CTStewieTransportMessage);
          [v19 setData:v18];
          unsigned int v20 = v6 - 1;
          if (v6 == 2) {
            uint64_t v21 = 2;
          }
          else {
            uint64_t v21 = v6 == 1;
          }
          if (v20 <= 1)
          {
            uint64_t v22 = *(void *)a5;
            uint64_t v23 = *((void *)a5 + 1);
            uint64_t v24 = v23 - *(void *)a5;
            if (v23 != *(void *)a5)
            {
              v50[0] = kCTStewieTransportMessageAckContextKey;
              uint64_t v25 = +[NSData dataWithBytes:v22 length:v24];
              v51[0] = v25;
              v50[1] = kCTStewieTransportMessageTransportTypeKey;
              id v26 = +[NSNumber numberWithInteger:v21];
              v51[1] = v26;
              unsigned int v27 = +[NSDictionary dictionaryWithObjects:v51 forKeys:v50 count:2];
              [v19 setMetadata:v27];
            }
          }
          id v40 = 0;
          int v28 = +[NSKeyedArchiver archivedDataWithRootObject:v19 requiringSecureCoding:1 error:&v40];
          char v16 = v40;
          value = self->fLogger.__ptr_.__value_;
          if (v16 || !v28)
          {
            id v38 = sub_100200FB4((id *)value);
            if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
            {
              v39 = sub_100BC87FC(v8);
              *(_DWORD *)buf = 136315394;
              uint64_t v43 = v39;
              __int16 v44 = 2112;
              uint64_t v45 = (const char *)v16;
              _os_log_error_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_ERROR, "Cannot deliver message: Unable to prepare CTStewieTransportMessage for delivery to service: %s, error: %@", buf, 0x16u);
            }
          }
          else
          {
            uint64_t v30 = sub_100200FB4((id *)value);
            if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
            {
              unsigned int v31 = (uint64_t *)p_pair1[5].__value_.__left_;
              uint64_t v32 = *v31;
              if (*v31 || (uint64_t v32 = v31[2]) != 0) {
                int v33 = *(_DWORD *)(v32 + 20);
              }
              else {
                int v33 = -1;
              }
              id v34 = sub_100BC87FC(v8);
              *(_DWORD *)buf = 138413058;
              uint64_t v43 = (const char *)v19;
              __int16 v44 = 2112;
              uint64_t v45 = v10;
              __int16 v46 = 1024;
              int v47 = v33;
              __int16 v48 = 2080;
              int v49 = v34;
              _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "#I Sending message: %@, with contents: %@, to client(%d) of service: %s", buf, 0x26u);
            }

            sub_10076C588(*(void **)(*(void *)p_pair1[5].__value_.__left_ + 8), v28);
          }
        }
      }
      else
      {
        char v16 = sub_100200FB4((id *)self->fLogger.__ptr_.__value_);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          uint64_t v43 = "kOne";
          __int16 v44 = 2080;
          uint64_t v45 = sub_100BC87FC(v8);
          uint64_t v17 = "Cannot deliver message: Framer: %s missing for service: %s";
          __int16 v35 = v16;
          uint32_t v36 = 22;
LABEL_40:
          _os_log_error_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_ERROR, v17, buf, v36);
        }
      }
    }
    else
    {
LABEL_13:
      char v16 = sub_100200FB4((id *)self->fLogger.__ptr_.__value_);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        uint64_t v43 = sub_100BC87FC(v8);
        uint64_t v17 = "Cannot deliver message: No client for service: %s";
LABEL_39:
        __int16 v35 = v16;
        uint32_t v36 = 12;
        goto LABEL_40;
      }
    }
  }
  else
  {
    char v16 = sub_100200FB4((id *)self->fLogger.__ptr_.__value_);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v43 = sub_100BC87FC(v8);
      uint64_t v17 = "Cannot deliver nil message to service: %s";
      goto LABEL_39;
    }
  }
}

- (void)deliverAckWithMsgId:(id)a3 toService:(unsigned __int16)a4 success:(BOOL)a5 clientMetaData:(id)a6 srcTransport:(unsigned __int8)a7
{
  int v7 = a7;
  BOOL v9 = a5;
  unsigned int v10 = a4;
  uint64_t v12 = (char *)a3;
  id v13 = a6;
  dispatch_assert_queue_V2((dispatch_queue_t)self->fQueue);
  if (v12)
  {
    left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<StewieServiceType, std::shared_ptr<(anonymous namespace)::StewieServiceContext>>, void *>>> *)self->fServiceContext.__tree_.__pair1_.__value_.__left_;
    if (!left) {
      goto LABEL_13;
    }
    p_pair1 = &self->fServiceContext.__tree_.__pair1_;
    do
    {
      unsigned int left_low = LOWORD(left[4].__value_.__left_);
      BOOL v17 = left_low >= v10;
      if (left_low >= v10) {
        unsigned int v18 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<StewieServiceType, std::shared_ptr<(anonymous namespace)::StewieServiceContext>>, void *>>> **)left;
      }
      else {
        unsigned int v18 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<StewieServiceType, std::shared_ptr<(anonymous namespace)::StewieServiceContext>>, void *>>> **)&left[1];
      }
      if (v17) {
        p_pair1 = left;
      }
      left = *v18;
    }
    while (*v18);
    if (p_pair1 != &self->fServiceContext.__tree_.__pair1_ && LOWORD(p_pair1[4].__value_.__left_) <= v10)
    {
      if (*(void *)p_pair1[5].__value_.__left_)
      {
        if (v9)
        {
          uint64_t v23 = objc_alloc_init((Class)CTStewieMessageAck);
          [v23 setError:0];
          id v19 = v23;
          [v23 setSuccess:1];
        }
        else
        {
          id v24 = objc_alloc((Class)CTStewieMessageAck);
          NSErrorUserInfoKey v53 = NSLocalizedDescriptionKey;
          CFStringRef v54 = @"Failed to send message. Please try again later";
          uint64_t v25 = +[NSDictionary dictionaryWithObjects:&v54 forKeys:&v53 count:1];
          id v26 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:35 userInfo:v25];
          id v19 = [v24 initWithError:v26];
        }
        if (v7 == 2) {
          uint64_t v27 = 2;
        }
        else {
          uint64_t v27 = v7 == 1;
        }
        [v19 setTransportType:v27];
        id v44 = 0;
        int v28 = +[NSKeyedArchiver archivedDataWithRootObject:v19 requiringSecureCoding:1 error:&v44];
        std::string::size_type v29 = (char *)v44;
        if (v29 || !v28)
        {
          uint64_t v30 = sub_100200FB4((id *)self->fLogger.__ptr_.__value_);
          if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
          {
            v39 = sub_100BC87FC(v10);
            *(_DWORD *)buf = 138412802;
            __int16 v46 = v12;
            __int16 v47 = 2080;
            __int16 v48 = v39;
            __int16 v49 = 2112;
            v50[0] = v29;
            _os_log_error_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "Cannot deliver ack for messageId: %@, Unable to prepare CTStewieMessageAck for delivery to service: %s, error: %@", buf, 0x20u);
          }
        }
        else
        {
          uint64_t v30 = [objc_alloc((Class)CTStewieTransportMessage) initWithMsgId:v12];
          [v30 setData:v28];
          if (v13)
          {
            uint64_t v51 = kCTStewieTransportMessageClientMetadataKey;
            id v52 = v13;
            unsigned int v31 = +[NSDictionary dictionaryWithObjects:&v52 forKeys:&v51 count:1];
            [v30 setMetadata:v31];
          }
          id v43 = 0;
          uint64_t v32 = +[NSKeyedArchiver archivedDataWithRootObject:v30 requiringSecureCoding:1 error:&v43];
          std::string::size_type v29 = (char *)v43;
          value = self->fLogger.__ptr_.__value_;
          if (v29 || !v32)
          {
            id v40 = sub_100200FB4((id *)value);
            if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
            {
              id v41 = sub_100BC87FC(v10);
              *(_DWORD *)buf = 136315394;
              __int16 v46 = v41;
              __int16 v47 = 2112;
              __int16 v48 = v29;
              _os_log_error_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_ERROR, "Cannot deliver message: Unable to prepare CTStewieTransportMessage for delivery to service: %s, error: %@", buf, 0x16u);
            }
          }
          else
          {
            id v34 = sub_100200FB4((id *)value);
            if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
            {
              __int16 v35 = (uint64_t *)p_pair1[5].__value_.__left_;
              uint64_t v36 = *v35;
              if (*v35 || (uint64_t v36 = v35[2]) != 0) {
                int v37 = *(_DWORD *)(v36 + 20);
              }
              else {
                int v37 = -1;
              }
              int v42 = v37;
              id v38 = sub_100BC87FC(v10);
              *(_DWORD *)buf = 138413058;
              __int16 v46 = (const char *)v30;
              __int16 v47 = 2112;
              __int16 v48 = (const char *)v19;
              __int16 v49 = 1024;
              LODWORD(v50[0]) = v42;
              WORD2(v50[0]) = 2080;
              *(void *)((char *)v50 + 6) = v38;
              _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "#I Sending message: %@, with contents: %@, to client(%d) of service: %s", buf, 0x26u);
            }

            sub_10076C588(*(void **)(*(void *)p_pair1[5].__value_.__left_ + 8), v32);
          }
        }
      }
      else
      {
        id v19 = sub_100200FB4((id *)self->fLogger.__ptr_.__value_);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412802;
          __int16 v46 = v12;
          __int16 v47 = 2080;
          __int16 v48 = "kOne";
          __int16 v49 = 2080;
          v50[0] = sub_100BC87FC(v10);
          unsigned int v20 = "Cannot deliver ack for messageId: %@, Framer: %s missing for service: %s";
          uint64_t v21 = v19;
          uint32_t v22 = 32;
          goto LABEL_41;
        }
      }
    }
    else
    {
LABEL_13:
      id v19 = sub_100200FB4((id *)self->fLogger.__ptr_.__value_);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        __int16 v46 = v12;
        __int16 v47 = 2080;
        __int16 v48 = sub_100BC87FC(v10);
        unsigned int v20 = "Cannot deliver ack for messageId: %@, No client for service: %s";
        uint64_t v21 = v19;
        uint32_t v22 = 22;
LABEL_41:
        _os_log_error_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, v20, buf, v22);
      }
    }
  }
  else
  {
    id v19 = sub_100200FB4((id *)self->fLogger.__ptr_.__value_);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      __int16 v46 = sub_100BC87FC(v10);
      unsigned int v20 = "Cannot deliver ack for nil msgId to service: %s";
      uint64_t v21 = v19;
      uint32_t v22 = 12;
      goto LABEL_41;
    }
  }
}

- (void)readyForNextProtocolMessage:(unsigned __int8)a3
{
  unsigned int v3 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->fQueue);
  if (v3 >= 3)
  {
    int v7 = sub_100200FB4((id *)self->fLogger.__ptr_.__value_);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      unsigned int v8 = "???";
      if (v3 == 3) {
        unsigned int v8 = "kUnknown";
      }
      int v9 = 136315138;
      unsigned int v10 = (void *)v8;
      _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "[Ignored] Invalid bucket index for client priority: %s", (uint8_t *)&v9, 0xCu);
    }
  }
  else if (!self->fReadyToConsumeDataFromkOne[v3])
  {
    uint64_t v5 = sub_100200FB4((id *)self->fLogger.__ptr_.__value_);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = off_101A047F0[(char)v3];
      int v9 = 136315138;
      unsigned int v10 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#I Agent was requested to fetch next message from kOne for client priority bucket: %s", (uint8_t *)&v9, 0xCu);
    }

    self->fReadyToConsumeDataFromkOne[v3] = 1;
    [(StewieNWAgent *)self getDataIfRequired];
  }
}

- (void)dealloc
{
  nw_agent_change_state();
  fAgent = self->fAgent;
  self->fAgent = 0;

  v4.receiver = self;
  v4.super_class = (Class)StewieNWAgent;
  [(StewieNWAgent *)&v4 dealloc];
}

- (void)handleDumpState
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->fQueue);
  unsigned int v3 = sub_100200FB4((id *)self->fLogger.__ptr_.__value_);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#I [d] *********************", buf, 2u);
  }

  objc_super v4 = sub_100200FB4((id *)self->fLogger.__ptr_.__value_);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "#I [d] * StewieAgent state *", buf, 2u);
  }

  uint64_t v5 = sub_100200FB4((id *)self->fLogger.__ptr_.__value_);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#I [d] *********************", buf, 2u);
  }

  int v6 = sub_100200FB4((id *)self->fLogger.__ptr_.__value_);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    if (self->fStarted) {
      int v7 = "true";
    }
    else {
      int v7 = "false";
    }
    *(_DWORD *)buf = 136315138;
    unint64_t v32 = (unint64_t)v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "#I [d] Started: %s", buf, 0xCu);
  }

  for (uint64_t i = 0; i != 3; ++i)
  {
    int v9 = sub_100200FB4((id *)self->fLogger.__ptr_.__value_);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v10 = "???";
      if ((i & 0xFC) == 0) {
        unsigned int v10 = off_101A04820[i];
      }
      if (self->fReadyToConsumeDataFromkOne[i]) {
        id v11 = "true";
      }
      else {
        id v11 = "false";
      }
      *(_DWORD *)buf = 136315394;
      unint64_t v32 = (unint64_t)v10;
      __int16 v33 = 2080;
      *(void *)id v34 = v11;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "#I [d] Ready to consume from kOne for client priority %s : %s", buf, 0x16u);
    }
  }
  begin = (char *)self->fFramers.__begin_;
  if (self->fFramers.__end_ != begin)
  {
    uint64_t v13 = 0;
    unint64_t v14 = 0;
    do
    {
      id v15 = sub_100200FB4((id *)self->fLogger.__ptr_.__value_);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v16 = *(void *)&begin[v13];
        uint64_t v17 = *(int *)(v16 + 16);
        unsigned int v18 = "???";
        if (v17 <= 2) {
          unsigned int v18 = off_101A04808[v17];
        }
        unint64_t v19 = *(char *)(v16 + 24);
        unsigned int v20 = "???";
        if (v19 <= 3) {
          unsigned int v20 = off_101A04820[v19];
        }
        int v21 = *(_DWORD *)(v16 + 20);
        if (*(unsigned char *)v16) {
          uint32_t v22 = "true";
        }
        else {
          uint32_t v22 = "false";
        }
        if (*(unsigned char *)(v16 + 1)) {
          uint64_t v23 = "true";
        }
        else {
          uint64_t v23 = "false";
        }
        *(_DWORD *)buf = 134219266;
        unint64_t v32 = v14;
        __int16 v33 = 1024;
        *(_DWORD *)id v34 = v21;
        *(_WORD *)&v34[4] = 2080;
        *(void *)&v34[6] = v18;
        __int16 v35 = 2080;
        uint64_t v36 = v20;
        __int16 v37 = 2080;
        id v38 = v22;
        __int16 v39 = 2080;
        id v40 = v23;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "#I [d] Framer[%zu] Client pid: %d; Type: %s; Priority: %s; HasData: %s, Get in progress: %s",
          buf,
          0x3Au);
      }

      ++v14;
      begin = (char *)self->fFramers.__begin_;
      v13 += 16;
    }
    while (v14 < ((char *)self->fFramers.__end_ - (char *)begin) >> 4);
  }
  begin_node = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<StewieServiceType, int>, void *>>> *)self->fAssignedServices.__tree_.__begin_node_;
  if (begin_node != &self->fAssignedServices.__tree_.__pair1_)
  {
    do
    {
      uint64_t v25 = sub_100200FB4((id *)self->fLogger.__ptr_.__value_);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        id v26 = sub_100BC87FC(WORD2(begin_node[3].__value_.__left_));
        int left = (int)begin_node[4].__value_.__left_;
        *(_DWORD *)buf = 136315394;
        unint64_t v32 = (unint64_t)v26;
        __int16 v33 = 1024;
        *(_DWORD *)id v34 = left;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "#I [d] Service: %s is assigned to pid: %d", buf, 0x12u);
      }

      isa = (StewieNWAgent *)begin_node[1].__value_.__left_;
      if (isa)
      {
        do
        {
          std::string::size_type v29 = isa;
          isa = (StewieNWAgent *)isa->super.isa;
        }
        while (isa);
      }
      else
      {
        do
        {
          std::string::size_type v29 = (StewieNWAgent *)begin_node[2].__value_.__left_;
          BOOL v30 = v29->super.isa == (Class)begin_node;
          begin_node = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<StewieServiceType, int>, void *>>> *)v29;
        }
        while (!v30);
      }
      begin_node = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<StewieServiceType, int>, void *>>> *)v29;
    }
    while (v29 != (StewieNWAgent *)&self->fAssignedServices.__tree_.__pair1_);
  }
}

- (void).cxx_destruct
{
  cntrl = self->fDataPathIdleTimer.__cntrl_;
  if (cntrl) {
    sub_10004D2C8((std::__shared_weak_count *)cntrl);
  }
  objc_super v4 = self->fRegistry.__cntrl_;
  if (v4) {
    sub_10004D2C8((std::__shared_weak_count *)v4);
  }
  uint64_t v5 = self->fDelegate.__cntrl_;
  if (v5) {
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v5);
  }
  sub_10005D144((void *)self->fAssignedServices.__tree_.__pair1_.__value_.__left_);
  if (self->fFramers.__begin_)
  {
    sub_10019E028((uint64_t *)&self->fFramers);
    operator delete(self->fFramers.__begin_);
  }
  sub_100119D90((void *)self->fServiceContext.__tree_.__pair1_.__value_.__left_);
  objc_storeStrong((id *)&self->fProtocolDefinition, 0);
  objc_storeStrong((id *)&self->fPolicySession, 0);
  sub_100119D1C((ctu::OsLogLogger **)&self->fLogger, 0);
  objc_storeStrong((id *)&self->fAgent, 0);

  objc_storeStrong((id *)&self->fQueue, 0);
}

- (id).cxx_construct
{
  *((void *)self + 12) = 0;
  *((void *)self + 5) = 0;
  *((void *)self + 6) = 0;
  *((void *)self + 4) = 0;
  *(void *)((char *)self + 54) = 0;
  *((void *)self + 11) = (char *)self + 96;
  *((void *)self + 13) = 0;
  *((void *)self + 14) = 0;
  *((void *)self + 15) = 0;
  *((void *)self + 16) = 0;
  *((void *)self + 19) = 0;
  *((void *)self + 18) = 0;
  *((void *)self + 17) = (char *)self + 144;
  *((_OWORD *)self + 10) = 0u;
  *((_OWORD *)self + 11) = 0u;
  *((_OWORD *)self + 12) = 0u;
  return self;
}

@end
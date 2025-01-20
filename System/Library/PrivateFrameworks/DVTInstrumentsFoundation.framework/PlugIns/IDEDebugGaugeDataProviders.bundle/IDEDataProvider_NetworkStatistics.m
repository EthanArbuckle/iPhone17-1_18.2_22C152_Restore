@interface IDEDataProvider_NetworkStatistics
+ (id)sharedDataProvider;
- (BOOL)captureAttributes:(id)a3 toDictionary:(id)a4 forPID:(id)a5;
- (IDEDataProvider_NetworkStatistics)init;
- (id).cxx_construct;
- (id)captureAttributes:(id)a3 forPIDs:(id)a4;
- (id)supportedAttributes;
- (void)dealloc;
@end

@implementation IDEDataProvider_NetworkStatistics

+ (id)sharedDataProvider
{
  if (qword_153B0 != -1) {
    dispatch_once(&qword_153B0, &stru_104E0);
  }
  v2 = (void *)qword_153A8;
  return v2;
}

- (IDEDataProvider_NetworkStatistics)init
{
  v8.receiver = self;
  v8.super_class = (Class)IDEDataProvider_NetworkStatistics;
  v2 = [(IDEDataProvider_NetworkStatistics *)&v8 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("Lock to protect multithread access during capturing", 0);
    capture_lock = v2->_capture_lock;
    v2->_capture_lock = (OS_dispatch_queue *)v3;

    dispatch_queue_t v5 = dispatch_queue_create("Lock to protect _lastResults", 0);
    results_lock = v2->_results_lock;
    v2->_results_lock = (OS_dispatch_queue *)v5;
  }
  return v2;
}

- (id)supportedAttributes
{
  if (qword_153C0 != -1) {
    dispatch_once(&qword_153C0, &stru_10500);
  }
  v2 = (void *)qword_153B8;
  return v2;
}

- (BOOL)captureAttributes:(id)a3 toDictionary:(id)a4 forPID:(id)a5
{
  id v63 = a3;
  id v9 = a4;
  id v10 = a5;
  signed int v11 = [v10 intValue];
  signed int v12 = v11;
  p_processInfoByPID = &self->_processInfoByPID;
  unint64_t v14 = v11;
  unint64_t value = self->_processInfoByPID.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
  if (value)
  {
    uint8x8_t v16 = (uint8x8_t)vcnt_s8((int8x8_t)value);
    v16.i16[0] = vaddlv_u8(v16);
    if (v16.u32[0] > 1uLL)
    {
      unint64_t v5 = v11;
      if (value <= v11) {
        unint64_t v5 = v11 % value;
      }
    }
    else
    {
      unint64_t v5 = (value - 1) & v11;
    }
    v17 = (void **)p_processInfoByPID->__table_.__bucket_list_.__ptr_.__value_[v5];
    if (v17)
    {
      for (i = *v17; i; i = (void *)*i)
      {
        unint64_t v19 = i[1];
        if (v19 == v11)
        {
          if (*((_DWORD *)i + 4) == v11) {
            goto LABEL_40;
          }
        }
        else
        {
          if (v16.u32[0] > 1uLL)
          {
            if (v19 >= value) {
              v19 %= value;
            }
          }
          else
          {
            v19 &= value - 1;
          }
          if (v19 != v5) {
            break;
          }
        }
      }
    }
  }
  i = operator new(0xE8uLL);
  void *i = 0;
  i[1] = v14;
  *((_DWORD *)i + 4) = v12;
  *(_OWORD *)(i + 5) = 0u;
  *(_OWORD *)(i + 7) = 0u;
  *(_OWORD *)(i + 9) = 0u;
  *(_OWORD *)(i + 11) = 0u;
  *(_OWORD *)(i + 13) = 0u;
  *(_OWORD *)(i + 15) = 0u;
  *(_OWORD *)(i + 17) = 0u;
  *(_OWORD *)(i + 19) = 0u;
  *(_OWORD *)(i + 21) = 0u;
  *(_OWORD *)(i + 23) = 0u;
  *(_OWORD *)(i + 25) = 0u;
  *(_OWORD *)(i + 27) = 0u;
  *(_OWORD *)(i + 3) = 0u;
  sub_7A5C(i + 3, 0);
  sub_7A5C(i + 16, 0);
  float v20 = (float)(self->_processInfoByPID.__table_.__p2_.__value_ + 1);
  float v21 = self->_processInfoByPID.__table_.__p3_.__value_;
  if (!value || (float)(v21 * (float)value) < v20)
  {
    BOOL v22 = 1;
    if (value >= 3) {
      BOOL v22 = (value & (value - 1)) != 0;
    }
    unint64_t v23 = v22 | (2 * value);
    unint64_t v24 = vcvtps_u32_f32(v20 / v21);
    if (v23 <= v24) {
      size_t v25 = v24;
    }
    else {
      size_t v25 = v23;
    }
    sub_7D10((uint64_t)p_processInfoByPID, v25);
    unint64_t value = self->_processInfoByPID.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
    if ((value & (value - 1)) != 0)
    {
      if (value <= v14) {
        unint64_t v5 = v14 % value;
      }
      else {
        unint64_t v5 = v14;
      }
    }
    else
    {
      unint64_t v5 = (value - 1) & v14;
    }
  }
  v26 = p_processInfoByPID->__table_.__bucket_list_.__ptr_.__value_;
  v27 = (void **)p_processInfoByPID->__table_.__bucket_list_.__ptr_.__value_[v5];
  if (v27)
  {
    void *i = *v27;
LABEL_38:
    *v27 = i;
    goto LABEL_39;
  }
  void *i = self->_processInfoByPID.__table_.__p1_.__value_.__next_;
  self->_processInfoByPID.__table_.__p1_.__value_.__next_ = i;
  v26[v5] = &self->_processInfoByPID.__table_.__p1_;
  if (*i)
  {
    unint64_t v28 = *(void *)(*i + 8);
    if ((value & (value - 1)) != 0)
    {
      if (v28 >= value) {
        v28 %= value;
      }
    }
    else
    {
      v28 &= value - 1;
    }
    v27 = &p_processInfoByPID->__table_.__bucket_list_.__ptr_.__value_[v28];
    goto LABEL_38;
  }
LABEL_39:
  ++self->_processInfoByPID.__table_.__p2_.__value_;
LABEL_40:
  v29 = +[NSNumber numberWithUnsignedLongLong:i[17]];
  [v9 setObject:v29 forKeyedSubscript:@"net.rx.bytes"];

  v30 = +[NSNumber numberWithUnsignedLongLong:i[17] - i[4]];
  [v9 setObject:v30 forKeyedSubscript:@"net.rx.bytes.delta"];

  v31 = +[NSNumber numberWithUnsignedLongLong:i[19]];
  [v9 setObject:v31 forKeyedSubscript:@"net.tx.bytes"];

  v32 = +[NSNumber numberWithUnsignedLongLong:i[19] - i[6]];
  [v9 setObject:v32 forKeyedSubscript:@"net.tx.bytes.delta"];

  v33 = +[NSNumber numberWithUnsignedLongLong:i[19] + i[17]];
  [v9 setObject:v33 forKeyedSubscript:@"net.bytes"];

  v34 = +[NSNumber numberWithUnsignedLongLong:i[19] + i[17] - (i[4] + i[6])];
  [v9 setObject:v34 forKeyedSubscript:@"net.bytes.delta"];

  v35 = +[NSNumber numberWithUnsignedLongLong:i[16]];
  [v9 setObject:v35 forKeyedSubscript:@"net.rx.packets"];

  v36 = +[NSNumber numberWithUnsignedLongLong:i[16] - i[3]];
  [v9 setObject:v36 forKeyedSubscript:@"net.rx.packets.delta"];

  v37 = +[NSNumber numberWithUnsignedLongLong:i[18]];
  [v9 setObject:v37 forKeyedSubscript:@"net.tx.packets"];

  v38 = +[NSNumber numberWithUnsignedLongLong:i[18] - i[5]];
  [v9 setObject:v38 forKeyedSubscript:@"net.tx.packets.delta"];

  v39 = +[NSNumber numberWithUnsignedLongLong:i[18] + i[16]];
  [v9 setObject:v39 forKeyedSubscript:@"net.packets"];

  v40 = +[NSNumber numberWithUnsignedLongLong:i[18] + i[16] - (i[3] + i[5])];
  [v9 setObject:v40 forKeyedSubscript:@"net.packets.delta"];

  if ([v63 containsObject:@"net.connections[]"])
  {
    v41 = objc_opt_new();
    for (id j = self->_sourceInfosBySrcRef.__table_.__p1_.__value_.__next_; j; id j = *(id *)j)
    {
      unsigned int v43 = [*((id *)j + 3) intValue];
      if (v43 == [v10 intValue])
      {
        v44 = objc_opt_new();
        v45 = v44;
        if (*((void *)j + 44)) {
          CFStringRef v46 = (const __CFString *)*((void *)j + 44);
        }
        else {
          CFStringRef v46 = &stru_10A20;
        }
        [v44 setObject:v46 forKeyedSubscript:@"interface"];
        if (*((void *)j + 45)) {
          CFStringRef v47 = (const __CFString *)*((void *)j + 45);
        }
        else {
          CFStringRef v47 = &stru_10A20;
        }
        [v45 setObject:v47 forKeyedSubscript:@"protocol"];
        if (*((void *)j + 46)) {
          CFStringRef v48 = (const __CFString *)*((void *)j + 46);
        }
        else {
          CFStringRef v48 = &stru_10A20;
        }
        [v45 setObject:v48 forKeyedSubscript:@"state"];
        if (*((void *)j + 8)) {
          CFStringRef v49 = (const __CFString *)*((void *)j + 8);
        }
        else {
          CFStringRef v49 = &stru_10A20;
        }
        [v45 setObject:v49 forKeyedSubscript:@"localAddr"];
        if (*((void *)j + 9)) {
          CFStringRef v50 = (const __CFString *)*((void *)j + 9);
        }
        else {
          CFStringRef v50 = &stru_10A20;
        }
        [v45 setObject:v50 forKeyedSubscript:@"localPort"];
        if (*((void *)j + 15)) {
          CFStringRef v51 = (const __CFString *)*((void *)j + 15);
        }
        else {
          CFStringRef v51 = &stru_10A20;
        }
        [v45 setObject:v51 forKeyedSubscript:@"remoteAddr"];
        if (*((void *)j + 16)) {
          CFStringRef v52 = (const __CFString *)*((void *)j + 16);
        }
        else {
          CFStringRef v52 = &stru_10A20;
        }
        [v45 setObject:v52 forKeyedSubscript:@"remotePort"];
        uint64_t v53 = *((void *)j + 48);
        if (v53) {
          [v45 setObject:v53 forKeyedSubscript:@"connectionDescription"];
        }
        v54 = +[NSNumber numberWithUnsignedLongLong:*((void *)j + 32)];
        [v45 setObject:v54 forKeyedSubscript:@"rxBytes"];

        v55 = +[NSNumber numberWithUnsignedLongLong:*((void *)j + 32) - *((void *)j + 19)];
        [v45 setObject:v55 forKeyedSubscript:@"rxBytesDelta"];

        v56 = +[NSNumber numberWithUnsignedLongLong:*((void *)j + 34)];
        [v45 setObject:v56 forKeyedSubscript:@"txBytes"];

        v57 = +[NSNumber numberWithUnsignedLongLong:*((void *)j + 34) - *((void *)j + 21)];
        [v45 setObject:v57 forKeyedSubscript:@"txBytesDelta"];

        v58 = +[NSNumber numberWithUnsignedLongLong:*((void *)j + 31)];
        [v45 setObject:v58 forKeyedSubscript:@"rxPackets"];

        v59 = +[NSNumber numberWithUnsignedLongLong:*((void *)j + 31) - *((void *)j + 18)];
        [v45 setObject:v59 forKeyedSubscript:@"rxPacketsDelta"];

        v60 = +[NSNumber numberWithUnsignedLongLong:*((void *)j + 33)];
        [v45 setObject:v60 forKeyedSubscript:@"txPackets"];

        v61 = +[NSNumber numberWithUnsignedLongLong:*((void *)j + 33) - *((void *)j + 20)];
        [v45 setObject:v61 forKeyedSubscript:@"txPacketsDelta"];

        [v41 addObject:v45];
      }
    }
    [v9 setObject:v41 forKeyedSubscript:@"net.connections[]"];
  }
  return 1;
}

- (void)dealloc
{
  if (self->_netstatManager)
  {
    NStatManagerDestroy();
    self->_netstatManager = 0;
  }
  netstatQueue = self->_netstatQueue;
  self->_netstatQueue = 0;

  capture_lock = self->_capture_lock;
  self->_capture_lock = 0;

  results_lock = self->_results_lock;
  self->_results_lock = 0;

  lastResults = self->_lastResults;
  self->_lastResults = 0;

  v7.receiver = self;
  v7.super_class = (Class)IDEDataProvider_NetworkStatistics;
  [(IDEDataProvider_NetworkStatistics *)&v7 dealloc];
}

- (id)captureAttributes:(id)a3 forPIDs:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  capture_lock = self->_capture_lock;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_5E80;
  block[3] = &unk_10470;
  block[4] = self;
  id v22 = v7;
  id v23 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_sync(capture_lock, block);
  uint64_t v15 = 0;
  uint8x8_t v16 = &v15;
  uint64_t v17 = 0x3032000000;
  v18 = sub_7660;
  unint64_t v19 = sub_7670;
  id v20 = 0;
  results_lock = self->_results_lock;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_7678;
  v14[3] = &unk_105C8;
  v14[4] = self;
  v14[5] = &v15;
  dispatch_sync(results_lock, v14);
  id v12 = (id)v16[5];
  _Block_object_dispose(&v15, 8);

  return v12;
}

- (void).cxx_destruct
{
  p_sourceInfosBySrcRef = &self->_sourceInfosBySrcRef;
  next = self->_sourceInfosBySrcRef.__table_.__p1_.__value_.__next_;
  if (next)
  {
    do
    {
      unint64_t v5 = (void *)*next;
      sub_7F88((uint64_t)(next + 2));
      operator delete(next);
      next = v5;
    }
    while (v5);
  }
  unint64_t value = p_sourceInfosBySrcRef->__table_.__bucket_list_.__ptr_.__value_;
  p_sourceInfosBySrcRef->__table_.__bucket_list_.__ptr_.__value_ = 0;
  if (value) {
    operator delete(value);
  }
  p_processInfoByPID = &self->_processInfoByPID;
  objc_super v8 = self->_processInfoByPID.__table_.__p1_.__value_.__next_;
  if (v8)
  {
    do
    {
      id v9 = (void *)*v8;
      operator delete(v8);
      objc_super v8 = v9;
    }
    while (v9);
  }
  id v10 = p_processInfoByPID->__table_.__bucket_list_.__ptr_.__value_;
  p_processInfoByPID->__table_.__bucket_list_.__ptr_.__value_ = 0;
  if (v10) {
    operator delete(v10);
  }
  objc_storeStrong((id *)&self->_netstatQueue, 0);
  objc_storeStrong((id *)&self->_lastResults, 0);
  objc_storeStrong((id *)&self->_results_lock, 0);
  objc_storeStrong((id *)&self->_capture_lock, 0);
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 56) = 0u;
  *(_OWORD *)((char *)self + 72) = 0u;
  *((_DWORD *)self + 22) = 1065353216;
  *((_OWORD *)self + 6) = 0u;
  *((_OWORD *)self + 7) = 0u;
  *((_DWORD *)self + 32) = 1065353216;
  return self;
}

@end
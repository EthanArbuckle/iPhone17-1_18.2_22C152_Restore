@interface CLNotifierServiceAdapter
- (CLNotifierBase)notifier;
- (CLNotifierServiceAdapter)init;
- (NSString)debugDescription;
- (id).cxx_construct;
- (int)notifierClientNumForCoparty:(id)a3;
- (void)forget:(id)a3;
- (void)invalidate;
- (void)register:(id)a3 forNotification:(int)a4 registrationInfo:(id)a5;
- (void)setAdaptedNotifier:(CLNotifierBase *)a3;
- (void)unregister:(id)a3 forNotification:(int)a4;
@end

@implementation CLNotifierServiceAdapter

- (CLNotifierServiceAdapter)init
{
  v3.receiver = self;
  v3.super_class = (Class)CLNotifierServiceAdapter;
  return [(CLIntersiloService *)&v3 initWithInboundProtocol:&unk_1EE00E718 outboundProtocol:&unk_1EE016F58];
}

- (void)setAdaptedNotifier:(CLNotifierBase *)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  v5 = objc_msgSend_universe(self, a2, (uint64_t)a3);
  v8 = objc_msgSend_silo(v5, v6, v7);
  objc_msgSend_assertInside(v8, v9, v10);
  if (self->_notifier)
  {
    if (qword_1E929D728 != -1) {
      dispatch_once(&qword_1E929D728, &unk_1EDFD2D40);
    }
    v13 = qword_1E929D720;
    if (os_log_type_enabled((os_log_t)qword_1E929D720, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289539;
      int v20 = 0;
      __int16 v21 = 2082;
      v22 = "";
      __int16 v23 = 2082;
      v24 = "assert";
      __int16 v25 = 2081;
      v26 = "nullptr == _notifier";
      _os_log_impl(&dword_1902AF000, v13, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Assertion failed\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1E929D728 != -1) {
        dispatch_once(&qword_1E929D728, &unk_1EDFD2D40);
      }
    }
    v14 = qword_1E929D720;
    if (os_signpost_enabled((os_log_t)qword_1E929D720))
    {
      *(_DWORD *)buf = 68289539;
      int v20 = 0;
      __int16 v21 = 2082;
      v22 = "";
      __int16 v23 = 2082;
      v24 = "assert";
      __int16 v25 = 2081;
      v26 = "nullptr == _notifier";
      _os_signpost_emit_with_name_impl(&dword_1902AF000, v14, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Assertion failed", "{\"msg%{public}.0s\":\"Assertion failed\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1E929D728 != -1) {
        dispatch_once(&qword_1E929D728, &unk_1EDFD2D40);
      }
    }
    v15 = qword_1E929D720;
    if (os_log_type_enabled((os_log_t)qword_1E929D720, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289539;
      int v20 = 0;
      __int16 v21 = 2082;
      v22 = "";
      __int16 v23 = 2082;
      v24 = "assert";
      __int16 v25 = 2081;
      v26 = "nullptr == _notifier";
      _os_log_impl(&dword_1902AF000, v15, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"Assertion failed\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }
LABEL_27:
    abort_report_np();
  }
  if (!a3) {
    return;
  }
  if ((objc_msgSend_valid(self, v11, v12) & 1) == 0)
  {
    if (qword_1E929D728 != -1) {
      dispatch_once(&qword_1E929D728, &unk_1EDFD2D40);
    }
    v16 = qword_1E929D720;
    if (os_log_type_enabled((os_log_t)qword_1E929D720, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289539;
      int v20 = 0;
      __int16 v21 = 2082;
      v22 = "";
      __int16 v23 = 2082;
      v24 = "assert";
      __int16 v25 = 2081;
      v26 = "[self valid]";
      _os_log_impl(&dword_1902AF000, v16, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Assertion failed\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1E929D728 != -1) {
        dispatch_once(&qword_1E929D728, &unk_1EDFD2D40);
      }
    }
    v17 = qword_1E929D720;
    if (os_signpost_enabled((os_log_t)qword_1E929D720))
    {
      *(_DWORD *)buf = 68289539;
      int v20 = 0;
      __int16 v21 = 2082;
      v22 = "";
      __int16 v23 = 2082;
      v24 = "assert";
      __int16 v25 = 2081;
      v26 = "[self valid]";
      _os_signpost_emit_with_name_impl(&dword_1902AF000, v17, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Assertion failed", "{\"msg%{public}.0s\":\"Assertion failed\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1E929D728 != -1) {
        dispatch_once(&qword_1E929D728, &unk_1EDFD2D40);
      }
    }
    v18 = qword_1E929D720;
    if (os_log_type_enabled((os_log_t)qword_1E929D720, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289539;
      int v20 = 0;
      __int16 v21 = 2082;
      v22 = "";
      __int16 v23 = 2082;
      v24 = "assert";
      __int16 v25 = 2081;
      v26 = "[self valid]";
      _os_log_impl(&dword_1902AF000, v18, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"Assertion failed\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }
    goto LABEL_27;
  }
  self->_notifier = a3;
}

- (void)invalidate
{
  v4 = objc_msgSend_universe(self, a2, v2);
  uint64_t v7 = objc_msgSend_silo(v4, v5, v6);
  objc_msgSend_assertInside(v7, v8, v9);
  objc_msgSend_setValid_(self, v10, 0);
  self->_notifier = 0;
}

- (void)register:(id)a3 forNotification:(int)a4 registrationInfo:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  uint64_t v9 = objc_msgSend_universe(self, a2, (uint64_t)a3);
  uint64_t v12 = objc_msgSend_silo(v9, v10, v11);
  objc_msgSend_assertInside(v12, v13, v14);
  notifier = self->_notifier;
  uint64_t v17 = objc_msgSend_notifierClientNumForCoparty_(self, v16, (uint64_t)a3);
  v18 = (void (*)(CLNotifierBase *, uint64_t, uint64_t, id))*((void *)notifier->var0 + 5);

  v18(notifier, v17, v6, a5);
}

- (void)unregister:(id)a3 forNotification:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v7 = objc_msgSend_universe(self, a2, (uint64_t)a3);
  uint64_t v10 = objc_msgSend_silo(v7, v8, v9);
  objc_msgSend_assertInside(v10, v11, v12);
  notifier = self->_notifier;
  uint64_t v15 = objc_msgSend_notifierClientNumForCoparty_(self, v14, (uint64_t)a3);
  v16 = (void (*)(CLNotifierBase *, uint64_t, uint64_t))*((void *)notifier->var0 + 7);

  v16(notifier, v15, v4);
}

- (void)forget:(id)a3
{
  v5 = objc_msgSend_universe(self, a2, (uint64_t)a3);
  v8 = objc_msgSend_silo(v5, v6, v7);
  objc_msgSend_assertInside(v8, v9, v10);
  p_clients = &self->_clients;
  left = (char *)self->_clients.__tree_.__pair1_.__value_.__left_;
  if (left)
  {
    p_pair1 = &self->_clients.__tree_.__pair1_;
    do
    {
      unint64_t v14 = *((void *)left + 4);
      BOOL v15 = v14 >= (unint64_t)a3;
      if (v14 >= (unint64_t)a3) {
        v16 = (char **)left;
      }
      else {
        v16 = (char **)(left + 8);
      }
      if (v15) {
        p_pair1 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, int>, void *>>> *)left;
      }
      left = *v16;
    }
    while (*v16);
    if (p_pair1 != &self->_clients.__tree_.__pair1_ && p_pair1[4].__value_.__left_ <= a3)
    {
      (*((void (**)(CLNotifierBase *, void))self->_notifier->var0 + 4))(self->_notifier, LODWORD(p_pair1[5].__value_.__left_));
      uint64_t v17 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, int>, void *>>> *)p_pair1[1].__value_.__left_;
      if (v17)
      {
        do
        {
          v18 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, int>, void *>>> **)v17;
          uint64_t v17 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, int>, void *>>> *)v17->__value_.__left_;
        }
        while (v17);
      }
      else
      {
        v19 = p_pair1;
        do
        {
          v18 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, int>, void *>>> **)v19[2].__value_.__left_;
          BOOL v20 = *v18 == v19;
          v19 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, int>, void *>>> *)v18;
        }
        while (!v20);
      }
      if (p_clients->__tree_.__begin_node_ == p_pair1) {
        p_clients->__tree_.__begin_node_ = v18;
      }
      __int16 v21 = (uint64_t *)self->_clients.__tree_.__pair1_.__value_.__left_;
      --self->_clients.__tree_.__pair3_.__value_;
      sub_1902CE250(v21, (uint64_t *)p_pair1);
      operator delete(p_pair1);
    }
  }
}

- (int)notifierClientNumForCoparty:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  v5 = objc_msgSend_universe(self, a2, (uint64_t)a3);
  v8 = objc_msgSend_silo(v5, v6, v7);
  objc_msgSend_assertInside(v8, v9, v10);
  notifier = self->_notifier;
  if (!notifier)
  {
    if (qword_1E929D728 != -1) {
      dispatch_once(&qword_1E929D728, &unk_1EDFD2D40);
    }
    uint64_t v27 = qword_1E929D720;
    if (os_log_type_enabled((os_log_t)qword_1E929D720, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289539;
      int v31 = 0;
      __int16 v32 = 2082;
      v33 = "";
      __int16 v34 = 2082;
      v35 = "assert";
      __int16 v36 = 2081;
      v37 = "_notifier";
      _os_log_impl(&dword_1902AF000, v27, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Assertion failed\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1E929D728 != -1) {
        dispatch_once(&qword_1E929D728, &unk_1EDFD2D40);
      }
    }
    v28 = qword_1E929D720;
    if (os_signpost_enabled((os_log_t)qword_1E929D720))
    {
      *(_DWORD *)buf = 68289539;
      int v31 = 0;
      __int16 v32 = 2082;
      v33 = "";
      __int16 v34 = 2082;
      v35 = "assert";
      __int16 v36 = 2081;
      v37 = "_notifier";
      _os_signpost_emit_with_name_impl(&dword_1902AF000, v28, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Assertion failed", "{\"msg%{public}.0s\":\"Assertion failed\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1E929D728 != -1) {
        dispatch_once(&qword_1E929D728, &unk_1EDFD2D40);
      }
    }
    v29 = qword_1E929D720;
    if (os_log_type_enabled((os_log_t)qword_1E929D720, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289539;
      int v31 = 0;
      __int16 v32 = 2082;
      v33 = "";
      __int16 v34 = 2082;
      v35 = "assert";
      __int16 v36 = 2081;
      v37 = "_notifier";
      _os_log_impl(&dword_1902AF000, v29, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"Assertion failed\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }
    abort_report_np();
    __break(1u);
  }
  p_clients = &self->_clients;
  p_pair1 = &self->_clients.__tree_.__pair1_;
  left = (char *)self->_clients.__tree_.__pair1_.__value_.__left_;
  if (!left) {
    goto LABEL_13;
  }
  BOOL v15 = &self->_clients.__tree_.__pair1_;
  do
  {
    unint64_t v16 = *((void *)left + 4);
    BOOL v17 = v16 >= (unint64_t)a3;
    if (v16 >= (unint64_t)a3) {
      v18 = (char **)left;
    }
    else {
      v18 = (char **)(left + 8);
    }
    if (v17) {
      BOOL v15 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, int>, void *>>> *)left;
    }
    left = *v18;
  }
  while (*v18);
  if (v15 != p_pair1 && v15[4].__value_.__left_ <= a3) {
    return (int)v15[5].__value_.__left_;
  }
LABEL_13:
  int v19 = (*((uint64_t (**)(CLNotifierBase *, id))notifier->var0 + 3))(notifier, a3);
  BOOL v20 = (unint64_t *)p_pair1->__value_.__left_;
  __int16 v21 = p_pair1;
  if (p_pair1->__value_.__left_)
  {
    while (1)
    {
      while (1)
      {
        __int16 v21 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, int>, void *>>> *)v20;
        unint64_t v22 = v20[4];
        if (v22 <= (unint64_t)a3) {
          break;
        }
        BOOL v20 = (unint64_t *)v21->__value_.__left_;
        p_pair1 = v21;
        if (!v21->__value_.__left_) {
          goto LABEL_20;
        }
      }
      if (v22 >= (unint64_t)a3) {
        break;
      }
      BOOL v20 = (unint64_t *)v21[1].__value_.__left_;
      if (!v20)
      {
        p_pair1 = v21 + 1;
        goto LABEL_20;
      }
    }
  }
  else
  {
LABEL_20:
    __int16 v23 = v21;
    __int16 v21 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, int>, void *>>> *)operator new(0x30uLL);
    v21[4].__value_.__left_ = a3;
    LODWORD(v21[5].__value_.__left_) = 0;
    v21->__value_.__left_ = 0;
    v21[1].__value_.__left_ = 0;
    v21[2].__value_.__left_ = v23;
    p_pair1->__value_.__left_ = v21;
    v24 = *(void **)p_clients->__tree_.__begin_node_;
    __int16 v25 = (uint64_t *)v21;
    if (v24)
    {
      p_clients->__tree_.__begin_node_ = v24;
      __int16 v25 = (uint64_t *)p_pair1->__value_.__left_;
    }
    sub_1902DD3B4((uint64_t *)p_clients->__tree_.__pair1_.__value_.__left_, v25);
    ++p_clients->__tree_.__pair3_.__value_;
  }
  LODWORD(v21[5].__value_.__left_) = v19;
  return v19;
}

- (NSString)debugDescription
{
  objc_super v3 = (void *)MEMORY[0x1E4F28E78];
  v14.receiver = self;
  v14.super_class = (Class)CLNotifierServiceAdapter;
  uint64_t v4 = [(CLIntersiloService *)&v14 debugDescription];
  uint64_t v7 = objc_msgSend_stringWithFormat_(v3, v5, @"%@\nClientIntegerMap: (\n"), v4;
  begin_node = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, int>, void *>>> *)self->_clients.__tree_.__begin_node_;
  if (begin_node != &self->_clients.__tree_.__pair1_)
  {
    char v9 = 0;
    do
    {
      if (v9) {
        objc_msgSend_appendString_(v7, v6, @",\n");
      }
      objc_msgSend_appendFormat_(v7, v6, @"%p = %d", begin_node[4].__value_.__left_, LODWORD(begin_node[5].__value_.__left_));
      left = (CLNotifierServiceAdapter *)begin_node[1].__value_.__left_;
      if (left)
      {
        do
        {
          uint64_t v11 = left;
          left = (CLNotifierServiceAdapter *)left->super.super.isa;
        }
        while (left);
      }
      else
      {
        do
        {
          uint64_t v11 = (CLNotifierServiceAdapter *)begin_node[2].__value_.__left_;
          BOOL v12 = v11->super.super.isa == (Class)begin_node;
          begin_node = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, int>, void *>>> *)v11;
        }
        while (!v12);
      }
      char v9 = 1;
      begin_node = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, int>, void *>>> *)v11;
    }
    while (v11 != (CLNotifierServiceAdapter *)&self->_clients.__tree_.__pair1_);
  }
  objc_msgSend_appendString_(v7, v6, @"\n\n"));
  return (NSString *)v7;
}

- (CLNotifierBase)notifier
{
  return self->_notifier;
}

- (void).cxx_destruct
{
}

- (id).cxx_construct
{
  *((void *)self + 6) = 0;
  *((void *)self + 5) = 0;
  *((void *)self + 4) = (char *)self + 40;
  return self;
}

@end
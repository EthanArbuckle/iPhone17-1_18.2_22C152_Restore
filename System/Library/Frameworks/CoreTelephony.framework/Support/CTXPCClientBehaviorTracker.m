@interface CTXPCClientBehaviorTracker
- (BOOL)_isClientAllowed:(const void *)a3;
- (BOOL)_isQuiescent:()time_point<std:(std:()std:(1000000>>>)a3 :ratio<1 :chrono::duration<long)long :chrono::system_clock;
- (BOOL)_isSelectorAllowed:(SEL)a3;
- (CTXPCClientBehaviorTracker)initWithQueue:(const queue *)a3;
- (CTXPCClientBehaviorTrackerDelegate)delegate;
- (id).cxx_construct;
- (unsigned)_getThreshold:(SEL)a3;
- (void)_getClientTrackerWithPid:(int)a3 name:(const void *)a4;
- (void)_getOrCreateClientTracker:(id)a3 withName:(const void *)a4;
- (void)_maybeCleanupClient:(id)a3 withName:(const void *)a4;
- (void)_triggerFaultWithMessage:(id)a3 forConnection:(id)a4;
- (void)bootstrap;
- (void)handleAppSuspendedForPid:(int)a3 name:(const void *)a4;
- (void)processRequest:(SEL)a3 forConnection:(id)a4 withName:(const void *)a5;
- (void)setDelegate:(id)a3;
@end

@implementation CTXPCClientBehaviorTracker

- (void)processRequest:(SEL)a3 forConnection:(id)a4 withName:(const void *)a5
{
  id v22 = a4;
  v8.__d_.__rep_ = std::chrono::system_clock::now().__d_.__rep_;
  if (![(CTXPCClientBehaviorTracker *)self _isClientAllowed:a5]
    && ![(CTXPCClientBehaviorTracker *)self _isSelectorAllowed:a3]
    && ![(CTXPCClientBehaviorTracker *)self _isQuiescent:v8.__d_.__rep_])
  {
    [(CTXPCClientBehaviorTracker *)self _maybeCleanupClient:v22 withName:a5];
    v9 = [(CTXPCClientBehaviorTracker *)self _getOrCreateClientTracker:v22 withName:a5];
    uint64_t v10 = v9[4];
    uint64_t v11 = v9[5];
    if (v10 != v11)
    {
      while (*(SEL *)v10 != a3)
      {
        v10 += 32;
        if (v10 == v11) {
          goto LABEL_10;
        }
      }
    }
    if (v10 == v11 || !*(unsigned char *)(v10 + 24))
    {
LABEL_10:
      unsigned int v12 = [(CTXPCClientBehaviorTracker *)self _getThreshold:a3];
      uint64_t v13 = sub_10004EA68((uint64_t)v9, (uint64_t)a3, v8.__d_.__rep_);
      if (v13 >= v12)
      {
        uint64_t v14 = v9[4];
        uint64_t v15 = v9[5];
        if (v14 != v15)
        {
          while (*(SEL *)v14 != a3)
          {
            v14 += 32;
            if (v14 == v15) {
              goto LABEL_17;
            }
          }
        }
        if (v14 != v15) {
          *(unsigned char *)(v14 + 24) = 1;
        }
LABEL_17:
        int v16 = *((char *)a5 + 23);
        v17 = *(const void **)a5;
        uint64_t v18 = NSStringFromSelector(a3);
        v19 = (void *)v18;
        if (v16 >= 0) {
          v20 = a5;
        }
        else {
          v20 = v17;
        }
        v21 = +[NSString stringWithFormat:@"Client [%s] has made excessive (%d) <%@> requests to CommCenter.", v20, v13, v18];

        [(CTXPCClientBehaviorTracker *)self _triggerFaultWithMessage:v21 forConnection:v22];
      }
    }
  }
}

- (BOOL)_isSelectorAllowed:(SEL)a3
{
  v3 = NSStringFromSelector(a3);
  uint64_t v4 = 0;
  while (1)
  {
    v5 = off_1019E4A90[v4];
    id v6 = v3;
    if (!strcmp((const char *)[v6 UTF8String], v5)) {
      break;
    }
    if (++v4 == 8)
    {
      goto LABEL_6;
    }
  }
  v7 = (uint64_t *)&off_1019E4A90[v4];
LABEL_6:

  return v8;
}

- (BOOL)_isClientAllowed:(const void *)a3
{
  return (char *)sub_10004DCA4((const char **)off_1019E4A70, (const char **)off_1019E4A90, (const void **)a3)
       - (char *)off_1019E4A70 != 32;
}

- (void)_maybeCleanupClient:(id)a3 withName:(const void *)a4
{
  id v6 = a3;
  p_clients = &self->_clients;
  begin = self->_clients.__begin_;
  end = self->_clients.__end_;
  uint64_t v10 = (uint64_t)end;
  if (begin != end)
  {
    while (1)
    {
      uint64_t v11 = *((unsigned __int8 *)begin + 31);
      if ((v11 & 0x80u) == 0) {
        uint64_t v12 = *((unsigned __int8 *)begin + 31);
      }
      else {
        uint64_t v12 = *((void *)begin + 2);
      }
      uint64_t v13 = *((unsigned __int8 *)a4 + 23);
      int v14 = (char)v13;
      if ((v13 & 0x80u) != 0) {
        uint64_t v13 = *((void *)a4 + 1);
      }
      if (v12 == v13)
      {
        if (v14 >= 0) {
          uint64_t v15 = (unsigned __int8 *)a4;
        }
        else {
          uint64_t v15 = *(unsigned __int8 **)a4;
        }
        if ((v11 & 0x80) != 0)
        {
          if (!memcmp(*((const void **)begin + 1), v15, *((void *)begin + 2)))
          {
LABEL_18:
            int v17 = *(_DWORD *)begin;
            if (v17 != [v6 processIdentifier]) {
              break;
            }
          }
        }
        else
        {
          if (!*((unsigned char *)begin + 31)) {
            goto LABEL_18;
          }
          uint64_t v16 = 0;
          while (*((unsigned __int8 *)begin + v16 + 8) == v15[v16])
          {
            if (v11 == ++v16) {
              goto LABEL_18;
            }
          }
        }
      }
      begin = (CTXPCClientTracker *)((char *)begin + 56);
      if (begin == end) {
        goto LABEL_47;
      }
    }
  }
  if (begin != end)
  {
    uint64_t v18 = (CTXPCClientTracker *)((char *)begin + 56);
    if ((CTXPCClientTracker *)((char *)begin + 56) != end)
    {
      uint64_t v10 = (uint64_t)begin;
      while (1)
      {
        v19 = (const void **)((char *)begin + 64);
        uint64_t v20 = *((unsigned __int8 *)begin + 87);
        if ((v20 & 0x80u) == 0) {
          uint64_t v21 = *((unsigned __int8 *)begin + 87);
        }
        else {
          uint64_t v21 = *((void *)begin + 9);
        }
        uint64_t v22 = *((unsigned __int8 *)a4 + 23);
        int v23 = (char)v22;
        if ((v22 & 0x80u) != 0) {
          uint64_t v22 = *((void *)a4 + 1);
        }
        if (v21 != v22) {
          goto LABEL_41;
        }
        if (v23 >= 0) {
          v24 = (unsigned __int8 *)a4;
        }
        else {
          v24 = *(unsigned __int8 **)a4;
        }
        if ((v20 & 0x80) != 0)
        {
          if (memcmp(*v19, v24, *((void *)begin + 9))) {
            goto LABEL_41;
          }
        }
        else if (*((unsigned char *)begin + 87))
        {
          uint64_t v25 = 0;
          while (*((unsigned __int8 *)begin + v25 + 64) == v24[v25])
          {
            if (v20 == ++v25) {
              goto LABEL_40;
            }
          }
LABEL_41:
          *(_DWORD *)uint64_t v10 = *(_DWORD *)v18;
          v27 = (void **)(v10 + 8);
          if (*(char *)(v10 + 31) < 0) {
            operator delete(*v27);
          }
          long long v28 = *(_OWORD *)v19;
          *(void *)(v10 + 24) = *((void *)begin + 10);
          *(_OWORD *)v27 = v28;
          *((unsigned char *)begin + 87) = 0;
          *((unsigned char *)begin + 64) = 0;
          sub_10005C9A4(v10 + 32, (__n128 *)((char *)begin + 88));
          v10 += 56;
          goto LABEL_44;
        }
LABEL_40:
        int v26 = *(_DWORD *)v18;
        if (v26 == [v6 processIdentifier]) {
          goto LABEL_41;
        }
LABEL_44:
        uint64_t v18 = (CTXPCClientTracker *)((char *)v18 + 56);
        begin = (CTXPCClientTracker *)((char *)begin + 56);
        if (v18 == end) {
          goto LABEL_47;
        }
      }
    }
    uint64_t v10 = (uint64_t)begin;
  }
LABEL_47:
  if ((CTXPCClientTracker *)v10 != self->_clients.__end_)
  {
    [(CTXPCClientBehaviorTracker *)self getLogContext];
    v29 = *(NSObject **)&v36[4];
    ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)&v35);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      if (*((char *)a4 + 23) >= 0) {
        v30 = (unsigned __int8 *)a4;
      }
      else {
        v30 = *(unsigned __int8 **)a4;
      }
      uint64_t v31 = 0x6DB6DB6DB6DB6DB7 * (((uint64_t)p_clients->__end_ - v10) >> 3);
      int v35 = 136315394;
      *(void *)v36 = v30;
      *(_WORD *)&v36[8] = 2048;
      *(void *)&v36[10] = v31;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, "PID changed for %s, removing %ld existing instance(s)", (uint8_t *)&v35, 0x16u);
    }
    uint64_t v32 = (uint64_t)p_clients->__end_;
    if (v10 != v32)
    {
      uint64_t v33 = sub_100060934(v32, (uint64_t)p_clients->__end_, v10);
      for (uint64_t i = (uint64_t)p_clients->__end_; i != v33; sub_10005F1F0(i))
        i -= 56;
      p_clients->__end_ = (CTXPCClientTracker *)v33;
    }
  }
}

- (BOOL)_isQuiescent:()time_point<std:(std:()std:(1000000>>>)a3 :ratio<1 :chrono::duration<long)long :chrono::system_clock
{
  BOOL wasBasebandOnline = self->_wasBasebandOnline;
  if (self->_basebandOnlineSink.fValue && !wasBasebandOnline)
  {
    self->_bbActivationTimeStamp = a3;
    BOOL v7 = 1;
    self->_BOOL wasBasebandOnline = 1;
  }
  else if (self->_wasBasebandOnline && !self->_basebandOnlineSink.fValue)
  {
    BOOL v7 = 0;
    self->_BOOL wasBasebandOnline = 0;
  }
  else
  {
    BOOL v6 = !self->_basebandOnlineSink.fValue || !wasBasebandOnline;
    return !v6 && (double)(a3.__d_.__rep_ - self->_bbActivationTimeStamp.__d_.__rep_) / 1000000.0 <= 10.0;
  }
  return v7;
}

- (void)_getOrCreateClientTracker:(id)a3 withName:(const void *)a4
{
  id v6 = a3;
  p_clients = &self->_clients;
  begin = self->_clients.__begin_;
  end = p_clients->__end_;
  if (begin == end) {
    goto LABEL_22;
  }
  do
  {
    uint64_t v10 = *((unsigned __int8 *)begin + 31);
    if ((v10 & 0x80u) == 0) {
      uint64_t v11 = *((unsigned __int8 *)begin + 31);
    }
    else {
      uint64_t v11 = *((void *)begin + 2);
    }
    uint64_t v12 = *((unsigned __int8 *)a4 + 23);
    int v13 = (char)v12;
    if ((v12 & 0x80u) != 0) {
      uint64_t v12 = *((void *)a4 + 1);
    }
    if (v11 != v12) {
      goto LABEL_19;
    }
    if (v13 >= 0) {
      int v14 = (unsigned __int8 *)a4;
    }
    else {
      int v14 = *(unsigned __int8 **)a4;
    }
    if ((v10 & 0x80) != 0)
    {
      if (memcmp(*((const void **)begin + 1), v14, *((void *)begin + 2))) {
        goto LABEL_19;
      }
    }
    else if (*((unsigned char *)begin + 31))
    {
      uint64_t v15 = 0;
      while (*((unsigned __int8 *)begin + v15 + 8) == v14[v15])
      {
        if (v10 == ++v15) {
          goto LABEL_18;
        }
      }
      goto LABEL_19;
    }
LABEL_18:
    int v16 = *(_DWORD *)begin;
    if (v16 == [v6 processIdentifier]) {
      goto LABEL_21;
    }
LABEL_19:
    begin = (CTXPCClientTracker *)((char *)begin + 56);
  }
  while (begin != end);
  begin = end;
LABEL_21:
  if (begin == p_clients->__end_)
  {
LABEL_22:
    unsigned int v17 = [v6 processIdentifier];
    unsigned int v18 = v17;
    uint64_t v20 = p_clients->__begin_;
    unint64_t v19 = (unint64_t)p_clients->__end_;
    uint64_t v21 = begin - p_clients->__begin_;
    uint64_t v22 = 0x6DB6DB6DB6DB6DB7 * (v21 >> 3);
    value = p_clients->__end_cap_.__value_;
    if (v19 >= (unint64_t)value)
    {
      unint64_t v24 = 0x6DB6DB6DB6DB6DB7 * ((uint64_t)(v19 - (void)v20) >> 3) + 1;
      if (v24 > 0x492492492492492) {
        sub_10006A748();
      }
      unint64_t v25 = 0x6DB6DB6DB6DB6DB7 * ((value - v20) >> 3);
      if (2 * v25 > v24) {
        unint64_t v24 = 2 * v25;
      }
      if (v25 >= 0x249249249249249) {
        unint64_t v26 = 0x492492492492492;
      }
      else {
        unint64_t v26 = v24;
      }
      p_end_cap = &p_clients->__end_cap_;
      if (v26) {
        unint64_t v26 = (unint64_t)sub_10057A920(v26);
      }
      else {
        uint64_t v27 = 0;
      }
      uint64_t v30 = v26 + 8 * (v21 >> 3);
      v78 = (char *)v26;
      v79 = (char *)v30;
      uint64_t v80 = v30;
      v81 = (CTXPCClientTracker *)(v26 + 56 * v27);
      if (v22 == v27)
      {
        if (v21 < 1)
        {
          if (v20 == begin) {
            unint64_t v49 = 1;
          }
          else {
            unint64_t v49 = 0xDB6DB6DB6DB6DB6ELL * (v21 >> 3);
          }
          *(void *)&long long v84 = &p_clients->__end_cap_;
          v50 = (char *)sub_10057A920(v49);
          v52 = v79;
          uint64_t v53 = v80;
          v54 = v79;
          uint64_t v55 = (uint64_t)&v50[56 * (v49 >> 2)];
          if ((char *)v80 != v79)
          {
            uint64_t v55 = (uint64_t)&v50[56 * (v49 >> 2) + v80 - (void)v79];
            v56 = &v50[56 * (v49 >> 2)];
            v57 = v79;
            do
            {
              *(_DWORD *)v56 = *(_DWORD *)v57;
              long long v58 = *(_OWORD *)(v57 + 8);
              *((void *)v56 + 3) = *((void *)v57 + 3);
              *(_OWORD *)(v56 + 8) = v58;
              *((void *)v57 + 2) = 0;
              *((void *)v57 + 3) = 0;
              *((void *)v57 + 1) = 0;
              *((void *)v56 + 4) = 0;
              *((void *)v56 + 5) = 0;
              *((void *)v56 + 6) = 0;
              *((_OWORD *)v56 + 2) = *((_OWORD *)v57 + 2);
              *((void *)v56 + 6) = *((void *)v57 + 6);
              *((void *)v57 + 4) = 0;
              *((void *)v57 + 5) = 0;
              *((void *)v57 + 6) = 0;
              v56 += 56;
              v57 += 56;
            }
            while (v56 != (char *)v55);
            v54 = (char *)v53;
          }
          v59 = v78;
          v60 = v81;
          v78 = v50;
          v79 = &v50[56 * (v49 >> 2)];
          *(void *)&v83[0] = v59;
          *((void *)&v83[0] + 1) = v52;
          uint64_t v80 = v55;
          v81 = (CTXPCClientTracker *)&v50[56 * v51];
          *(void *)&v83[1] = v54;
          *((void *)&v83[1] + 1) = v60;
          sub_1002C1ABC((uint64_t)v83);
          uint64_t v30 = v80;
        }
        else
        {
          uint64_t v31 = v22 + 2;
          if (v22 >= -1) {
            uint64_t v31 = v22 + 1;
          }
          uint64_t v32 = v30 - 56 * (v31 >> 1);
          uint64_t v30 = sub_100060934(v26 + 8 * (v21 >> 3), v30, v32);
          v79 = (char *)v32;
          uint64_t v80 = v30;
        }
      }
      *(_DWORD *)uint64_t v30 = v18;
      v61 = (unsigned char *)(v30 + 8);
      if (*((char *)a4 + 23) < 0)
      {
        sub_10004FC84(v61, *(void **)a4, *((void *)a4 + 1));
      }
      else
      {
        long long v62 = *(_OWORD *)a4;
        *(void *)(v30 + 24) = *((void *)a4 + 2);
        *(_OWORD *)v61 = v62;
      }
      *(void *)(v30 + 32) = 0;
      *(void *)(v30 + 40) = 0;
      *(void *)(v30 + 48) = 0;
      v63 = (CTXPCClientTracker *)v79;
      uint64_t v64 = v80 + 56;
      v80 += 56;
      v65 = p_clients->__begin_;
      if (p_clients->__begin_ == begin)
      {
        v70 = (CTXPCClientTracker *)v79;
      }
      else
      {
        uint64_t v66 = 0;
        do
        {
          v67 = (char *)v63 + v66;
          v68 = (char *)begin + v66;
          *((_DWORD *)v67 - 14) = *(_DWORD *)((char *)begin + v66 - 56);
          long long v69 = *(_OWORD *)((char *)begin + v66 - 48);
          *((void *)v67 - 4) = *(void *)((char *)begin + v66 - 32);
          *((_OWORD *)v67 - 3) = v69;
          *((void *)v68 - 5) = 0;
          *((void *)v68 - 4) = 0;
          *((void *)v68 - 6) = 0;
          *((void *)v67 - 3) = 0;
          *((void *)v67 - 2) = 0;
          *((void *)v67 - 1) = 0;
          *(_OWORD *)(v67 - 24) = *(_OWORD *)((char *)begin + v66 - 24);
          *((void *)v67 - 1) = *(void *)((char *)begin + v66 - 8);
          *((void *)v68 - 3) = 0;
          *((void *)v68 - 2) = 0;
          *((void *)v68 - 1) = 0;
          v66 -= 56;
        }
        while ((CTXPCClientTracker *)((char *)begin + v66) != v65);
        uint64_t v64 = v80;
        v70 = (CTXPCClientTracker *)((char *)v63 + v66);
      }
      v79 = (char *)v70;
      v71 = p_clients->__end_;
      if (v71 != begin)
      {
        do
        {
          *(_DWORD *)uint64_t v64 = *(_DWORD *)begin;
          long long v72 = *(_OWORD *)((char *)begin + 8);
          *(void *)(v64 + 24) = *((void *)begin + 3);
          *(_OWORD *)(v64 + 8) = v72;
          *((void *)begin + 2) = 0;
          *((void *)begin + 3) = 0;
          *((void *)begin + 1) = 0;
          *(void *)(v64 + 32) = 0;
          *(void *)(v64 + 40) = 0;
          *(void *)(v64 + 48) = 0;
          *(_OWORD *)(v64 + 32) = *((_OWORD *)begin + 2);
          *(void *)(v64 + 48) = *((void *)begin + 6);
          *((void *)begin + 4) = 0;
          *((void *)begin + 5) = 0;
          *((void *)begin + 6) = 0;
          v64 += 56;
          begin = (CTXPCClientTracker *)((char *)begin + 56);
        }
        while (begin != v71);
        v70 = (CTXPCClientTracker *)v79;
        begin = p_clients->__end_;
      }
      v73 = p_clients->__begin_;
      p_clients->__begin_ = v70;
      p_clients->__end_ = (CTXPCClientTracker *)v64;
      v74 = p_clients->__end_cap_.__value_;
      p_clients->__end_cap_.__value_ = v81;
      uint64_t v80 = (uint64_t)begin;
      v81 = v74;
      v78 = (char *)v73;
      v79 = (char *)v73;
      sub_1002C1ABC((uint64_t)&v78);
      begin = v63;
    }
    else if (begin == (CTXPCClientTracker *)v19)
    {
      *(_DWORD *)begin = v17;
      long long v28 = (char *)v20 + 8 * (v21 >> 3) + 8;
      if (*((char *)a4 + 23) < 0)
      {
        sub_10004FC84(v28, *(void **)a4, *((void *)a4 + 1));
      }
      else
      {
        long long v29 = *(_OWORD *)a4;
        *((void *)v20 + (v21 >> 3) + 3) = *((void *)a4 + 2);
        *(_OWORD *)long long v28 = v29;
      }
      v75 = (void *)((char *)v20 + 8 * (v21 >> 3));
      v75[4] = 0;
      v75[5] = 0;
      v75[6] = 0;
      p_clients->__end_ = (CTXPCClientTracker *)((char *)begin + 56);
    }
    else
    {
      long long v84 = 0u;
      memset(v83, 0, sizeof(v83));
      uint64_t v85 = 0;
      v86 = &p_clients->__end_cap_;
      LODWORD(v83[0]) = v17;
      uint64_t v77 = 0x6DB6DB6DB6DB6DB7 * (v21 >> 3);
      if (*((char *)a4 + 23) < 0)
      {
        sub_10004FC84((unsigned char *)v83 + 8, *(void **)a4, *((void *)a4 + 1));
        unint64_t v19 = (unint64_t)p_clients->__end_;
      }
      else
      {
        *(_OWORD *)((char *)v83 + 8) = *(_OWORD *)a4;
        *((void *)&v83[1] + 1) = *((void *)a4 + 2);
      }
      long long v84 = 0uLL;
      uint64_t v85 = 0;
      uint64_t v33 = (char *)begin + 56;
      unint64_t v34 = v19 - 56;
      unint64_t v35 = v19;
      if (v19 >= 0x38)
      {
        unint64_t v36 = v19 - 56;
        unint64_t v35 = v19;
        do
        {
          *(_DWORD *)unint64_t v35 = *(_DWORD *)v36;
          long long v37 = *(_OWORD *)(v36 + 8);
          *(void *)(v35 + 24) = *(void *)(v36 + 24);
          *(_OWORD *)(v35 + 8) = v37;
          *(void *)(v36 + 16) = 0;
          *(void *)(v36 + 24) = 0;
          *(void *)(v36 + 8) = 0;
          *(void *)(v35 + 32) = 0;
          *(void *)(v35 + 40) = 0;
          *(void *)(v35 + 48) = 0;
          *(_OWORD *)(v35 + 32) = *(_OWORD *)(v36 + 32);
          *(void *)(v35 + 48) = *(void *)(v36 + 48);
          *(void *)(v36 + 32) = 0;
          *(void *)(v36 + 40) = 0;
          *(void *)(v36 + 48) = 0;
          v35 += 56;
          v36 += 56;
        }
        while (v36 < v19);
      }
      p_clients->__end_ = (CTXPCClientTracker *)v35;
      if ((char *)v19 != v33)
      {
        uint64_t v38 = 0;
        uint64_t v39 = -8 * ((uint64_t)(v19 - (void)v33) >> 3);
        do
        {
          uint64_t v40 = v34 + v38;
          *(_DWORD *)(v19 + v38 - 56) = *(_DWORD *)(v34 + v38 - 56);
          v41 = (void **)(v19 + v38 - 48);
          if (*(char *)(v19 + v38 - 25) < 0) {
            operator delete(*v41);
          }
          long long v42 = *(_OWORD *)(v40 - 48);
          *(void *)(v19 + v38 - 32) = *(void *)(v40 - 32);
          *(_OWORD *)v41 = v42;
          *(unsigned char *)(v40 - 25) = 0;
          *(unsigned char *)(v40 - 48) = 0;
          sub_10005C9A4(v19 + v38 - 24, (__n128 *)(v40 - 24));
          v38 -= 56;
        }
        while (v39 != v38);
      }
      *(_DWORD *)begin = v83[0];
      v43 = (void **)((char *)v20 + 56 * v77 + 8);
      if (*((char *)begin + 31) < 0) {
        operator delete(*v43);
      }
      long long v44 = *(_OWORD *)((char *)v83 + 8);
      *((void *)v20 + 7 * v77 + 3) = *((void *)&v83[1] + 1);
      *(_OWORD *)v43 = v44;
      HIBYTE(v83[1]) = 0;
      BYTE8(v83[0]) = 0;
      v45 = (char *)v20 + 56 * v77;
      v48 = (void *)*((void *)v45 + 4);
      v47 = v45 + 32;
      v46 = v48;
      if (v48)
      {
        *((void *)v20 + 7 * v77 + 5) = v46;
        operator delete(v46);
        void *v47 = 0;
        v47[1] = 0;
        v47[2] = 0;
      }
      *(_OWORD *)v47 = v84;
      *((void *)v20 + 7 * v77 + 6) = v85;
      long long v84 = 0uLL;
      uint64_t v85 = 0;
      sub_10005F1F0((uint64_t)v83);
    }
  }

  return begin;
}

- (unsigned)_getThreshold:(SEL)a3
{
  if (!a3) {
    return 10;
  }
  if ("getPhoneNumberWithCompletion:completion:" == a3 || "getPreferredDataSubscriptionContext:" == a3) {
    return 15;
  }
  else {
    return 40;
  }
}

- (CTXPCClientBehaviorTracker)initWithQueue:(const queue *)a3
{
  fObj = a3->fObj.fObj;
  dispatch_object_t object = fObj;
  if (fObj) {
    dispatch_retain(fObj);
  }
  ctu::OsLogContext::OsLogContext((ctu::OsLogContext *)v8, kCtLoggingSystemName, "ct.tracker");
  v7.receiver = self;
  v7.super_class = (Class)CTXPCClientBehaviorTracker;
  v5 = [(CTXPCClientBehaviorTracker *)&v7 initWithQueue:&object logContext:v8];
  ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)v8);
  if (object) {
    dispatch_release(object);
  }
  if (v5)
  {
    [(CTXPCClientBehaviorTracker *)v5 getQueue];
    operator new();
  }
  return 0;
}

- (void)bootstrap
{
}

- (void)handleAppSuspendedForPid:(int)a3 name:(const void *)a4
{
  objc_super v7 = -[CTXPCClientBehaviorTracker _getClientTrackerWithPid:name:](self, "_getClientTrackerWithPid:name:");
  if (v7)
  {
    BOOL v8 = v7;
    [(CTXPCClientBehaviorTracker *)self getLogContext];
    v9 = *(NSObject **)&v12[4];
    ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)&v11);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      if (*((char *)a4 + 23) >= 0) {
        uint64_t v10 = a4;
      }
      else {
        uint64_t v10 = *(const void **)a4;
      }
      int v11 = 136315394;
      *(void *)uint64_t v12 = v10;
      *(_WORD *)&v12[8] = 1024;
      *(_DWORD *)&v12[10] = a3;
      _os_log_debug_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "Client [%s (%d)] is suspended. Informing tracker", (uint8_t *)&v11, 0x12u);
    }
    v8[5] = v8[4];
  }
}

- (void)_triggerFaultWithMessage:(id)a3 forConnection:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  objc_super v7 = [(CTXPCClientBehaviorTracker *)self delegate];
  [v7 connectionDidTriggerFault:v6 logString:v8];
}

- (void)_getClientTrackerWithPid:(int)a3 name:(const void *)a4
{
  p_clients = &self->_clients;
  begin = self->_clients.__begin_;
  end = self->_clients.__end_;
  p_p = &__p;
  if (*((char *)a4 + 23) < 0)
  {
    sub_10004FC84(&__p, *(void **)a4, *((void *)a4 + 1));
  }
  else
  {
    long long __p = *(_OWORD *)a4;
    uint64_t v16 = *((void *)a4 + 2);
  }
  if (begin == end)
  {
    if (v16 < 0) {
LABEL_25:
    }
      operator delete((void *)__p);
  }
  else
  {
    char v8 = HIBYTE(v16);
    if (v16 >= 0) {
      uint64_t v9 = HIBYTE(v16);
    }
    else {
      uint64_t v9 = *((void *)&__p + 1);
    }
    if (v16 < 0) {
      p_p = (long long *)__p;
    }
    do
    {
      if (*(_DWORD *)begin == a3)
      {
        uint64_t v10 = *((unsigned __int8 *)begin + 31);
        uint64_t v11 = (v10 & 0x80u) == 0 ? *((unsigned __int8 *)begin + 31) : *((void *)begin + 2);
        if (v11 == v9)
        {
          if ((v10 & 0x80) != 0)
          {
            if (!memcmp(*((const void **)begin + 1), p_p, *((void *)begin + 2))) {
              goto LABEL_24;
            }
          }
          else
          {
            if (!*((unsigned char *)begin + 31)) {
              goto LABEL_24;
            }
            uint64_t v12 = 0;
            while (*((unsigned __int8 *)begin + v12 + 8) == *((unsigned __int8 *)p_p + v12))
            {
              if (v10 == ++v12) {
                goto LABEL_24;
              }
            }
          }
        }
      }
      begin = (CTXPCClientTracker *)((char *)begin + 56);
    }
    while (begin != end);
    begin = end;
LABEL_24:
    if (v8 < 0) {
      goto LABEL_25;
    }
  }
  if (begin == p_clients->__end_) {
    return 0;
  }
  else {
    return begin;
  }
}

- (CTXPCClientBehaviorTrackerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CTXPCClientBehaviorTrackerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  value = self->_restModule.__ptr_.__value_;
  self->_restModule.__ptr_.__value_ = 0;
  if (value) {
    sub_1001F20B0((uint64_t)&self->_restModule, (uint64_t)value);
  }
  p_clients = &self->_clients;
  begin = self->_clients.__begin_;
  if (begin)
  {
    end = self->_clients.__end_;
    objc_super v7 = begin;
    if (end != begin)
    {
      do
      {
        end = (CTXPCClientTracker *)((char *)end - 56);
        sub_10005F1F0((uint64_t)end);
      }
      while (end != begin);
      objc_super v7 = p_clients->__begin_;
    }
    p_clients->__end_ = begin;
    operator delete(v7);
  }
}

- (id).cxx_construct
{
  *((void *)self + 2) = 0;
  *((void *)self + 3) = 0;
  *((void *)self + 1) = 0;
  *((void *)self + 4) = 0;
  *((unsigned char *)self + 40) = 0;
  *((void *)self + 6) = 0;
  return self;
}

@end
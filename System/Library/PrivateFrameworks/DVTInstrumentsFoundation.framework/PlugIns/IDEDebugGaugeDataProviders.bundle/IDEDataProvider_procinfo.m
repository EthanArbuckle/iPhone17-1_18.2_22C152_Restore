@interface IDEDataProvider_procinfo
+ (id)sharedDataProvider;
- (BOOL)captureAttributes:(id)a3 toDictionary:(id)a4 forPID:(id)a5;
- (IDEDataProvider_procinfo)init;
- (id).cxx_construct;
- (id)captureAttributes:(id)a3 forPIDs:(id)a4;
- (id)supportedAttributes;
@end

@implementation IDEDataProvider_procinfo

+ (id)sharedDataProvider
{
  if (qword_15420 != -1) {
    dispatch_once(&qword_15420, &stru_10688);
  }
  v2 = (void *)qword_15418;
  return v2;
}

- (IDEDataProvider_procinfo)init
{
  v6.receiver = self;
  v6.super_class = (Class)IDEDataProvider_procinfo;
  v2 = [(IDEDataProvider_procinfo *)&v6 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("Lock to protect multithread access during capturing", 0);
    capture_lock = v2->_capture_lock;
    v2->_capture_lock = (OS_dispatch_queue *)v3;
  }
  return v2;
}

- (id)supportedAttributes
{
  if (qword_15430 != -1) {
    dispatch_once(&qword_15430, &stru_106A8);
  }
  v2 = (void *)qword_15428;
  return v2;
}

- (BOOL)captureAttributes:(id)a3 toDictionary:(id)a4 forPID:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  signed int v12 = [v11 intValue];
  signed int v13 = v12;
  p_processInfoByPID = &self->_processInfoByPID;
  unint64_t v15 = v12;
  unint64_t value = self->_processInfoByPID.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
  if (value)
  {
    uint8x8_t v17 = (uint8x8_t)vcnt_s8((int8x8_t)value);
    v17.i16[0] = vaddlv_u8(v17);
    if (v17.u32[0] > 1uLL)
    {
      unint64_t v5 = v12;
      if (value <= v12) {
        unint64_t v5 = v12 % value;
      }
    }
    else
    {
      unint64_t v5 = (value - 1) & v12;
    }
    v18 = (void **)p_processInfoByPID->__table_.__bucket_list_.__ptr_.__value_[v5];
    if (v18)
    {
      v19 = (char *)*v18;
      if (*v18)
      {
        do
        {
          unint64_t v20 = *((void *)v19 + 1);
          if (v20 == v12)
          {
            if (*((_DWORD *)v19 + 4) == v12) {
              goto LABEL_74;
            }
          }
          else
          {
            if (v17.u32[0] > 1uLL)
            {
              if (v20 >= value) {
                v20 %= value;
              }
            }
            else
            {
              v20 &= value - 1;
            }
            if (v20 != v5) {
              break;
            }
          }
          v19 = *(char **)v19;
        }
        while (v19);
      }
    }
  }
  v19 = (char *)operator new(0x40uLL);
  *(void *)v19 = 0;
  *((void *)v19 + 1) = v15;
  *((_DWORD *)v19 + 4) = v13;
  *(_OWORD *)(v19 + 24) = 0u;
  *(_OWORD *)(v19 + 40) = 0u;
  *((void *)v19 + 7) = 0;
  float v21 = (float)(p_processInfoByPID->__table_.__p2_.__value_ + 1);
  float v22 = p_processInfoByPID->__table_.__p3_.__value_;
  if (!value || (float)(v22 * (float)value) < v21)
  {
    BOOL v23 = (value & (value - 1)) == 0;
    if (value < 3) {
      BOOL v23 = 0;
    }
    unint64_t v24 = (2 * value) | !v23;
    unint64_t v25 = vcvtps_u32_f32(v21 / v22);
    if (v24 <= v25) {
      int8x8_t prime = (int8x8_t)v25;
    }
    else {
      int8x8_t prime = (int8x8_t)v24;
    }
    if (*(void *)&prime == 1)
    {
      int8x8_t prime = (int8x8_t)2;
    }
    else if ((*(void *)&prime & (*(void *)&prime - 1)) != 0)
    {
      int8x8_t prime = (int8x8_t)std::__next_prime(*(void *)&prime);
      unint64_t value = p_processInfoByPID->__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
    }
    if (*(void *)&prime > value) {
      goto LABEL_30;
    }
    if (*(void *)&prime < value)
    {
      unint64_t v33 = vcvtps_u32_f32((float)p_processInfoByPID->__table_.__p2_.__value_ / p_processInfoByPID->__table_.__p3_.__value_);
      if (value < 3 || (uint8x8_t v34 = (uint8x8_t)vcnt_s8((int8x8_t)value), v34.i16[0] = vaddlv_u8(v34), v34.u32[0] > 1uLL))
      {
        unint64_t v33 = std::__next_prime(v33);
      }
      else
      {
        uint64_t v35 = 1 << -(char)__clz(v33 - 1);
        if (v33 >= 2) {
          unint64_t v33 = v35;
        }
      }
      if (*(void *)&prime <= v33) {
        int8x8_t prime = (int8x8_t)v33;
      }
      if (*(void *)&prime >= value)
      {
        unint64_t value = p_processInfoByPID->__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
      }
      else
      {
        if (prime)
        {
LABEL_30:
          if (*(void *)&prime >> 61) {
            sub_7F0C();
          }
          v27 = (void **)operator new(8 * *(void *)&prime);
          v28 = p_processInfoByPID->__table_.__bucket_list_.__ptr_.__value_;
          p_processInfoByPID->__table_.__bucket_list_.__ptr_.__value_ = v27;
          if (v28) {
            operator delete(v28);
          }
          uint64_t v29 = 0;
          p_processInfoByPID->__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_ = (unint64_t)prime;
          do
            p_processInfoByPID->__table_.__bucket_list_.__ptr_.__value_[v29++] = 0;
          while (*(void *)&prime != v29);
          next = p_processInfoByPID->__table_.__p1_.__value_.__next_;
          if (next)
          {
            unint64_t v31 = next[1];
            uint8x8_t v32 = (uint8x8_t)vcnt_s8(prime);
            v32.i16[0] = vaddlv_u8(v32);
            if (v32.u32[0] > 1uLL)
            {
              if (v31 >= *(void *)&prime) {
                v31 %= *(void *)&prime;
              }
            }
            else
            {
              v31 &= *(void *)&prime - 1;
            }
            p_processInfoByPID->__table_.__bucket_list_.__ptr_.__value_[v31] = &p_processInfoByPID->__table_.__p1_;
            v36 = (void *)*next;
            if (*next)
            {
              do
              {
                unint64_t v37 = v36[1];
                if (v32.u32[0] > 1uLL)
                {
                  if (v37 >= *(void *)&prime) {
                    v37 %= *(void *)&prime;
                  }
                }
                else
                {
                  v37 &= *(void *)&prime - 1;
                }
                if (v37 != v31)
                {
                  if (!p_processInfoByPID->__table_.__bucket_list_.__ptr_.__value_[v37])
                  {
                    p_processInfoByPID->__table_.__bucket_list_.__ptr_.__value_[v37] = next;
                    goto LABEL_55;
                  }
                  void *next = *v36;
                  void *v36 = *(void *)p_processInfoByPID->__table_.__bucket_list_.__ptr_.__value_[v37];
                  *(void *)p_processInfoByPID->__table_.__bucket_list_.__ptr_.__value_[v37] = v36;
                  v36 = next;
                }
                unint64_t v37 = v31;
LABEL_55:
                next = v36;
                v36 = (void *)*v36;
                unint64_t v31 = v37;
              }
              while (v36);
            }
          }
          unint64_t value = (unint64_t)prime;
          goto LABEL_59;
        }
        v90 = p_processInfoByPID->__table_.__bucket_list_.__ptr_.__value_;
        p_processInfoByPID->__table_.__bucket_list_.__ptr_.__value_ = 0;
        if (v90) {
          operator delete(v90);
        }
        unint64_t value = 0;
        p_processInfoByPID->__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_ = 0;
      }
    }
LABEL_59:
    if ((value & (value - 1)) != 0)
    {
      if (value <= v15) {
        unint64_t v5 = v15 % value;
      }
      else {
        unint64_t v5 = v15;
      }
    }
    else
    {
      unint64_t v5 = (value - 1) & v15;
    }
  }
  v38 = p_processInfoByPID->__table_.__bucket_list_.__ptr_.__value_;
  v39 = (void **)p_processInfoByPID->__table_.__bucket_list_.__ptr_.__value_[v5];
  if (v39)
  {
    *(void *)v19 = *v39;
  }
  else
  {
    *(void *)v19 = p_processInfoByPID->__table_.__p1_.__value_.__next_;
    p_processInfoByPID->__table_.__p1_.__value_.__next_ = v19;
    v38[v5] = &p_processInfoByPID->__table_.__p1_;
    if (!*(void *)v19) {
      goto LABEL_73;
    }
    unint64_t v40 = *(void *)(*(void *)v19 + 8);
    if ((value & (value - 1)) != 0)
    {
      if (v40 >= value) {
        v40 %= value;
      }
    }
    else
    {
      v40 &= value - 1;
    }
    v39 = &p_processInfoByPID->__table_.__bucket_list_.__ptr_.__value_[v40];
  }
  *v39 = v19;
LABEL_73:
  ++p_processInfoByPID->__table_.__p2_.__value_;
LABEL_74:
  long long v120 = 0u;
  long long v121 = 0u;
  long long v118 = 0u;
  long long v119 = 0u;
  long long v117 = 0u;
  memset(buffer, 0, sizeof(buffer));
  int v41 = proc_pid_rusage((int)[v11 intValue], 2, (rusage_info_t *)buffer);
  if (v41 != 3)
  {
    if (v41
      || proc_pidinfo((int)[v11 intValue], 20, 1uLL, v105, 40) <= 0
      || coalition_info_resource_usage())
    {
      id v42 = [v11 intValue];
      v43 = __error();
      v44 = +[NSString stringWithFormat:@"couldn't get info for process %i: %s", v42, strerror(*v43)];
      [v10 setObject:v44 forKeyedSubscript:@"error"];
    }
    else
    {
      uint64_t v57 = v111 + v110 + v113 - v112;
      uint64_t v58 = *((void *)v19 + 3);
      if (!v58)
      {
        *((void *)v19 + 3) = v57;
        uint64_t v58 = v57;
      }
      *((_OWORD *)v19 + 2) = *((_OWORD *)v19 + 3);
      *((void *)v19 + 6) = v121;
      *((void *)v19 + 7) = v57 - v58;
      v59 = +[NSNumber numberWithDouble:(double)(mach_absolute_time() - (unint64_t)v117) / 1000000000.0];
      [v10 setObject:v59 forKeyedSubscript:@"process.age"];

      v60 = +[NSNumber numberWithUnsignedLongLong:*((void *)v19 + 6)];
      [v10 setObject:v60 forKeyedSubscript:@"disk.rd.bytes"];

      v61 = +[NSNumber numberWithUnsignedLongLong:*((void *)v19 + 6) - *((void *)v19 + 4)];
      [v10 setObject:v61 forKeyedSubscript:@"disk.rd.bytes.delta"];

      v62 = +[NSNumber numberWithUnsignedLongLong:*((void *)v19 + 7)];
      [v10 setObject:v62 forKeyedSubscript:@"disk.wr.bytes"];

      v63 = +[NSNumber numberWithUnsignedLongLong:*((void *)v19 + 7) - *((void *)v19 + 5)];
      [v10 setObject:v63 forKeyedSubscript:@"disk.wr.bytes.delta"];

      v64 = +[NSNumber numberWithUnsignedLongLong:*((void *)v19 + 7) + *((void *)v19 + 6)];
      [v10 setObject:v64 forKeyedSubscript:@"disk.bytes"];

      v65 = +[NSNumber numberWithUnsignedLongLong:*((void *)v19 + 7) + *((void *)v19 + 6) - (*((void *)v19 + 4) + *((void *)v19 + 5))];
      [v10 setObject:v65 forKeyedSubscript:@"disk.bytes.delta"];

      if ([v9 containsObject:@"disk.openfiles[]"])
      {
        unsigned int v66 = proc_pidinfo((int)[v11 intValue], 1, 0, 0, 0);
        int v67 = v66;
        if ((v66 & 0x80000000) != 0)
        {
          id v92 = [v11 intValue];
          v93 = __error();
          v94 = +[NSString stringWithFormat:@"couldn't determine number of file descriptors of process %i: %s", v92, strerror(*v93)];
          [v10 setObject:v94 forKeyedSubscript:@"error"];
        }
        else
        {
          v103 = malloc_type_malloc(v66, 0x536AB479uLL);
          int v68 = proc_pidinfo((int)[v11 intValue], 1, 0, v103, v67);
          if (v68 < 0)
          {
            id v98 = [v11 intValue];
            v99 = __error();
            v89 = +[NSString stringWithFormat:@"couldn't get list of file descriptors of process %i: %s", v98, strerror(*v99)];
            [v10 setObject:v89 forKeyedSubscript:@"error"];
          }
          else
          {
            v104 = objc_opt_new();
            if (v68 >= 8)
            {
              if ((unint64_t)v68 >> 3 <= 1) {
                unint64_t v69 = 1;
              }
              else {
                unint64_t v69 = (unint64_t)v68 >> 3;
              }
              v70 = v103 + 1;
              do
              {
                if (*v70 == 1)
                {
                  uint64_t v71 = *(v70 - 1);
                  v72 = objc_opt_new();
                  v73 = +[NSNumber numberWithInt:v71];
                  [v72 setObject:v73 forKeyedSubscript:@"fd"];

                  if (proc_pidfdinfo((int)[v11 intValue], v71, 2, v106, 1200) < 0)
                  {
                    id v79 = [v11 intValue];
                    v80 = __error();
                    v78 = +[NSString stringWithFormat:@"couldn't get info for file descriptor %i of process %i: %s", v71, v79, strerror(*v80)];
                    [v72 setObject:v78 forKeyedSubscript:@"error"];
                  }
                  else
                  {
                    uint64_t v74 = (v106[0] & 3) - 1;
                    CFStringRef v75 = &stru_10A20;
                    if (v74 < 3) {
                      CFStringRef v75 = *(&off_106C8 + v74);
                    }
                    unsigned int v76 = v108 & 0xF000;
                    if (v76 - 4096 < 0xA000 && (unsigned int v77 = (v76 - 4096) >> 12, ((0x2ABu >> v77) & 1) != 0))
                    {
                      v78 = *(&off_106E0 + v77);
                    }
                    else
                    {
                      v78 = +[NSString stringWithFormat:@"%04o", v76 >> 12];
                    }
                    [v72 setObject:v78 forKeyedSubscript:@"type"];
                    v81 = +[NSNumber numberWithUnsignedInt:v106[0]];
                    [v72 setObject:v81 forKeyedSubscript:@"openflags"];

                    v82 = +[NSNumber numberWithUnsignedInt:v106[1]];
                    [v72 setObject:v82 forKeyedSubscript:@"status"];

                    v83 = +[NSNumber numberWithLongLong:v112];
                    [v72 setObject:v83 forKeyedSubscript:@"filesize"];

                    v84 = +[NSString stringWithFormat:@"%i%@", v71, v75];
                    [v72 setObject:v84 forKeyedSubscript:@"fddesc"];

                    v85 = +[NSNumber numberWithUnsignedInt:v114];
                    [v72 setObject:v85 forKeyedSubscript:@"device"];

                    v86 = +[NSNumber numberWithLongLong:v107];
                    [v72 setObject:v86 forKeyedSubscript:@"offset"];

                    v87 = +[NSNumber numberWithUnsignedLongLong:v109];
                    [v72 setObject:v87 forKeyedSubscript:@"inode"];

                    v88 = +[NSString stringWithUTF8String:&v115];
                    [v72 setObject:v88 forKeyedSubscript:@"path"];
                  }
                  [v104 addObject:v72];
                }
                v70 += 2;
                --v69;
              }
              while (v69);
            }
            v89 = v104;
            [v10 setObject:v104 forKeyedSubscript:@"disk.openfiles[]"];
          }

          free(v103);
        }
      }
    }
    BOOL v45 = 1;
    goto LABEL_162;
  }
  signed int v46 = [v11 intValue];
  unint64_t v47 = p_processInfoByPID->__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
  if (!v47) {
    goto LABEL_161;
  }
  signed int v48 = v46;
  unint64_t v49 = v46;
  uint8x8_t v50 = (uint8x8_t)vcnt_s8((int8x8_t)v47);
  v50.i16[0] = vaddlv_u8(v50);
  if (v50.u32[0] > 1uLL)
  {
    unint64_t v51 = v46;
    if (v47 <= v46) {
      unint64_t v51 = v46 % v47;
    }
  }
  else
  {
    unint64_t v51 = (v47 - 1) & v46;
  }
  v52 = p_processInfoByPID->__table_.__bucket_list_.__ptr_.__value_;
  v53 = (void **)p_processInfoByPID->__table_.__bucket_list_.__ptr_.__value_[v51];
  if (!v53) {
    goto LABEL_161;
  }
  v54 = (__compressed_pair<std::__hash_node_base<std::__hash_node<std::__hash_value_type<int, (anonymous namespace)::ProcessInfo>, void *> *>, std::allocator<std::__hash_node<std::__hash_value_type<int, (anonymous namespace)::ProcessInfo>, void *>>> *)*v53;
  if (!*v53) {
    goto LABEL_161;
  }
  unint64_t v55 = v47 - 1;
  while (1)
  {
    unint64_t v56 = (unint64_t)v54[1].__value_.__next_;
    if (v56 == v49) {
      break;
    }
    if (v50.u32[0] > 1uLL)
    {
      if (v56 >= v47) {
        v56 %= v47;
      }
    }
    else
    {
      v56 &= v55;
    }
    if (v56 != v51) {
      goto LABEL_161;
    }
LABEL_96:
    v54 = (__compressed_pair<std::__hash_node_base<std::__hash_node<std::__hash_value_type<int, (anonymous namespace)::ProcessInfo>, void *> *>, std::allocator<std::__hash_node<std::__hash_value_type<int, (anonymous namespace)::ProcessInfo>, void *>>> *)v54->__value_.__next_;
    if (!v54) {
      goto LABEL_161;
    }
  }
  if (LODWORD(v54[2].__value_.__next_) != v48) {
    goto LABEL_96;
  }
  v91 = (unint64_t *)v54->__value_.__next_;
  if (v50.u32[0] > 1uLL)
  {
    if (v47 <= v49) {
      v49 %= v47;
    }
  }
  else
  {
    v49 &= v55;
  }
  v95 = (__compressed_pair<std::__hash_node_base<std::__hash_node<std::__hash_value_type<int, (anonymous namespace)::ProcessInfo>, void *> *>, std::allocator<std::__hash_node<std::__hash_value_type<int, (anonymous namespace)::ProcessInfo>, void *>>> *)v52[v49];
  do
  {
    v96 = v95;
    v95 = (__compressed_pair<std::__hash_node_base<std::__hash_node<std::__hash_value_type<int, (anonymous namespace)::ProcessInfo>, void *> *>, std::allocator<std::__hash_node<std::__hash_value_type<int, (anonymous namespace)::ProcessInfo>, void *>>> *)v95->__value_.__next_;
  }
  while (v95 != v54);
  if (v96 == &p_processInfoByPID->__table_.__p1_) {
    goto LABEL_150;
  }
  unint64_t v97 = (unint64_t)v96[1].__value_.__next_;
  if (v50.u32[0] > 1uLL)
  {
    if (v97 >= v47) {
      v97 %= v47;
    }
  }
  else
  {
    v97 &= v55;
  }
  if (v97 == v49)
  {
LABEL_152:
    if (v91)
    {
      unint64_t v100 = v91[1];
      goto LABEL_154;
    }
  }
  else
  {
LABEL_150:
    if (!v91) {
      goto LABEL_151;
    }
    unint64_t v100 = v91[1];
    if (v50.u32[0] > 1uLL)
    {
      unint64_t v101 = v91[1];
      if (v100 >= v47) {
        unint64_t v101 = v100 % v47;
      }
    }
    else
    {
      unint64_t v101 = v100 & v55;
    }
    if (v101 != v49)
    {
LABEL_151:
      v52[v49] = 0;
      v91 = (unint64_t *)v54->__value_.__next_;
      goto LABEL_152;
    }
LABEL_154:
    if (v50.u32[0] > 1uLL)
    {
      if (v100 >= v47) {
        v100 %= v47;
      }
    }
    else
    {
      v100 &= v55;
    }
    if (v100 != v49)
    {
      p_processInfoByPID->__table_.__bucket_list_.__ptr_.__value_[v100] = v96;
      v91 = (unint64_t *)v54->__value_.__next_;
    }
  }
  v96->__value_.__next_ = v91;
  v54->__value_.__next_ = 0;
  --p_processInfoByPID->__table_.__p2_.__value_;
  operator delete(v54);
LABEL_161:
  BOOL v45 = 0;
LABEL_162:

  return v45;
}

- (id)captureAttributes:(id)a3 forPIDs:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = objc_opt_new();
  capture_lock = self->_capture_lock;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_B630;
  v16[3] = &unk_104C0;
  id v17 = v7;
  v18 = self;
  id v19 = v6;
  id v10 = v8;
  id v20 = v10;
  id v11 = v6;
  id v12 = v7;
  dispatch_sync(capture_lock, v16);
  signed int v13 = v20;
  id v14 = v10;

  return v14;
}

- (void).cxx_destruct
{
  p_processInfoByPID = &self->_processInfoByPID;
  next = self->_processInfoByPID.__table_.__p1_.__value_.__next_;
  if (next)
  {
    do
    {
      unint64_t v5 = (void *)*next;
      operator delete(next);
      next = v5;
    }
    while (v5);
  }
  unint64_t value = p_processInfoByPID->__table_.__bucket_list_.__ptr_.__value_;
  p_processInfoByPID->__table_.__bucket_list_.__ptr_.__value_ = 0;
  if (value) {
    operator delete(value);
  }
  objc_storeStrong((id *)&self->_capture_lock, 0);
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 40) = 0u;
  *((_DWORD *)self + 14) = 1065353216;
  return self;
}

@end
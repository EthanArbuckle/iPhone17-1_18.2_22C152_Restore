_UNKNOWN **GPUTools::Diag::SwizzleMTLTracker::GetCallstackFromStore(GPUTools::Diag::SwizzleMTLTracker *this, unint64_t a2, GPUTools::Diag::BacktraceStore *a3)
{
  void *v3;
  void *v4;
  uint64_t v5;
  _UNKNOWN **result;
  unsigned char v7[4096];
  unsigned int v8;

  v3 = (void *)__chkstk_darwin(this);
  v4 = objc_opt_new();
  GPUTools::Diag::BacktraceStore::RemoveBacktrace((GPUTools::Diag::BacktraceStore *)v7);
  if (v8)
  {
    v5 = +[NSData dataWithBytes:v7 length:512];

    result = +[NSNumber numberWithInt:v8];
    v4 = (void *)v5;
  }
  else
  {
    result = &off_26960;
  }
  *v3 = v4;
  v3[1] = result;
  return result;
}

void sub_1344(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void *std::__hash_table<std::__hash_value_type<unsigned long,std::vector<unsigned long>>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,std::vector<unsigned long>>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,std::vector<unsigned long>>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,std::vector<unsigned long>>>>::find<unsigned long>(void *a1, unint64_t a2)
{
  int8x8_t v2 = (int8x8_t)a1[1];
  if (!*(void *)&v2) {
    return 0;
  }
  uint8x8_t v3 = (uint8x8_t)vcnt_s8(v2);
  v3.i16[0] = vaddlv_u8(v3);
  if (v3.u32[0] > 1uLL)
  {
    unint64_t v4 = a2;
    if (*(void *)&v2 <= a2) {
      unint64_t v4 = a2 % *(void *)&v2;
    }
  }
  else
  {
    unint64_t v4 = (*(void *)&v2 - 1) & a2;
  }
  v5 = *(void **)(*a1 + 8 * v4);
  if (!v5) {
    return 0;
  }
  result = (void *)*v5;
  if (*v5)
  {
    do
    {
      unint64_t v7 = result[1];
      if (v7 == a2)
      {
        if (result[2] == a2) {
          return result;
        }
      }
      else
      {
        if (v3.u32[0] > 1uLL)
        {
          if (v7 >= *(void *)&v2) {
            v7 %= *(void *)&v2;
          }
        }
        else
        {
          v7 &= *(void *)&v2 - 1;
        }
        if (v7 != v4) {
          return 0;
        }
      }
      result = (void *)*result;
    }
    while (result);
  }
  return result;
}

void std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<unsigned long,std::vector<unsigned long>>,void *>>>::operator()[abi:nn180100](char a1, void *__p)
{
  if (a1)
  {
    uint8x8_t v3 = (void *)__p[3];
    if (v3)
    {
      __p[4] = v3;
      operator delete(v3);
    }
  }
  else if (!__p)
  {
    return;
  }

  operator delete(__p);
}

void std::__throw_bad_array_new_length[abi:nn180100]()
{
}

void GPUTools::Diag::SwizzleMTLTracker::CompletionHandler(uint64_t a1)
{
  id v150 = (id)__chkstk_darwin(a1);
  id v2 = [v150 globalTraceObjectID];
  v146 = (void *)GPUTools::Diag::SwizzleMTLTracker::Tracker;
  GPUTools::Diag::SwizzleMTLTracker::GetCallstackFromStore((GPUTools::Diag::SwizzleMTLTracker *)&v192, (unint64_t)v2, (GPUTools::Diag::BacktraceStore *)(GPUTools::Diag::SwizzleMTLTracker::Tracker + 240));
  unint64_t v145 = (unint64_t)v2;
  if (objc_opt_respondsToSelector())
  {
    long long v190 = 0u;
    long long v191 = 0u;
    long long v188 = 0u;
    long long v189 = 0u;
    id obj = [v150 logs];
    id v160 = [obj countByEnumeratingWithState:&v188 objects:v206 count:16];
    if (v160)
    {
      uint64_t v158 = *(void *)v189;
      id v147 = v193;
      id v148 = v192;
      do
      {
        v176 = 0;
        do
        {
          if (*(void *)v189 != v158) {
            objc_enumerationMutation(obj);
          }
          uint8x8_t v3 = *(void **)(*((void *)&v188 + 1) + 8 * (void)v176);
          if ([v3 conformsToProtocol:&OBJC_PROTOCOL___MTLFunctionLog])
          {
            id v178 = v3;
            id v156 = v150;
            id v170 = v148;
            id v172 = v147;
            id v184 = objc_alloc_init((Class)NSMutableArray);
            id v186 = objc_alloc_init((Class)NSMutableArray);
            id v182 = objc_alloc_init((Class)NSMutableArray);
            id v4 = objc_alloc_init((Class)NSMutableArray);
            id v5 = v178;
            long long v202 = 0u;
            long long v203 = 0u;
            long long v204 = 0u;
            long long v205 = 0u;
            id v179 = v5;
            v6 = [v5 errorStackTrace];
            id v7 = [v6 countByEnumeratingWithState:&v202 objects:v216 count:16];
            if (v7)
            {
              uint64_t v8 = *(void *)v203;
              do
              {
                for (i = 0; i != v7; i = (char *)i + 1)
                {
                  if (*(void *)v203 != v8) {
                    objc_enumerationMutation(v6);
                  }
                  v10 = *(void **)(*((void *)&v202 + 1) + 8 * i);
                  v11 = [v10 URL];
                  uint64_t v1 = [v11 path];
                  [v184 addObject:v1];

                  v12 = [v10 functionName];
                  [v186 addObject:v12];

                  v13 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v10 line]);
                  [v182 addObject:v13];

                  v14 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v10 column]);
                  [v4 addObject:v14];
                }
                id v7 = [v6 countByEnumeratingWithState:&v202 objects:v216 count:16];
              }
              while (v7);
            }

            uint64_t v15 = GPUTools::Diag::SwizzleMTLTracker::Tracker;
            id v174 = objc_alloc_init((Class)NSData);
            v16 = [v179 function];
            NSClassFromString(@"MTLGPUDebugFunction");
            Class v17 = NSClassFromString(@"MTLLegacySVFunction");
            while ((objc_opt_respondsToSelector() & 1) != 0
                 && (objc_opt_isKindOfClass() & 1) == 0
                 && (!v17 || (objc_opt_isKindOfClass() & 1) == 0))
            {
              uint64_t v18 = [v16 performSelector:"baseObject"];

              v16 = (void *)v18;
            }
            v19 = objc_getAssociatedObject(v16, &GPUTools::Diag::AssociatedObjectKey);
            v152 = v19;
            if (v19)
            {
              unint64_t v20 = (unint64_t)[v19 hash];
              v168 = +[NSNumber numberWithUnsignedLong:v20];
              unint64_t v21 = *(void *)(v15 + 48);
              if (v21)
              {
                uint8x8_t v22 = (uint8x8_t)vcnt_s8((int8x8_t)v21);
                v22.i16[0] = vaddlv_u8(v22);
                if (v22.u32[0] > 1uLL)
                {
                  unint64_t v23 = v20;
                  if (v20 >= v21) {
                    unint64_t v23 = v20 % v21;
                  }
                }
                else
                {
                  unint64_t v23 = (v21 - 1) & v20;
                }
                v24 = *(void **)(*(void *)(v15 + 40) + 8 * v23);
                if (v24)
                {
                  for (j = (void *)*v24; j; j = (void *)*j)
                  {
                    unint64_t v26 = j[1];
                    if (v26 == v20)
                    {
                      if (j[2] == v20)
                      {
                        v81 = std::__hash_table<std::__hash_value_type<unsigned long,std::vector<unsigned long>>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,std::vector<unsigned long>>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,std::vector<unsigned long>>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,std::vector<unsigned long>>>>::find<unsigned long>((void *)v15, v20);
                        int v53 = *((unsigned __int8 *)v81 + 64);
                        CFStringRef v82 = &stru_24DC8;
                        if (v81[5]) {
                          CFStringRef v82 = @" ";
                        }
LABEL_158:
                        v166 = (__CFString *)v82;
                        goto LABEL_117;
                      }
                    }
                    else
                    {
                      if (v22.u32[0] > 1uLL)
                      {
                        if (v26 >= v21) {
                          v26 %= v21;
                        }
                      }
                      else
                      {
                        v26 &= v21 - 1;
                      }
                      if (v26 != v23) {
                        break;
                      }
                    }
                  }
                }
                if (v22.u32[0] > 1uLL)
                {
                  uint64_t v1 = v20;
                  if (v20 >= v21) {
                    uint64_t v1 = v20 % v21;
                  }
                }
                else
                {
                  uint64_t v1 = (v21 - 1) & v20;
                }
                v27 = *(void **)(*(void *)(v15 + 40) + 8 * v1);
                if (v27)
                {
                  for (k = (void *)*v27; k; k = (void *)*k)
                  {
                    unint64_t v29 = k[1];
                    if (v29 == v20)
                    {
                      if (k[2] == v20) {
                        goto LABEL_110;
                      }
                    }
                    else
                    {
                      if (v22.u32[0] > 1uLL)
                      {
                        if (v29 >= v21) {
                          v29 %= v21;
                        }
                      }
                      else
                      {
                        v29 &= v21 - 1;
                      }
                      if (v29 != v1) {
                        break;
                      }
                    }
                  }
                }
              }
              v30 = operator new(0x18uLL);
              void *v30 = 0;
              v30[1] = v20;
              v30[2] = v20;
              float v31 = (float)(unint64_t)(*(void *)(v15 + 64) + 1);
              float v32 = *(float *)(v15 + 72);
              if (!v21 || (float)(v32 * (float)v21) < v31)
              {
                BOOL v33 = (v21 & (v21 - 1)) != 0;
                if (v21 < 3) {
                  BOOL v33 = 1;
                }
                unint64_t v34 = v33 | (2 * v21);
                unint64_t v35 = vcvtps_u32_f32(v31 / v32);
                if (v34 <= v35) {
                  int8x8_t prime = (int8x8_t)v35;
                }
                else {
                  int8x8_t prime = (int8x8_t)v34;
                }
                if (*(void *)&prime == 1)
                {
                  int8x8_t prime = (int8x8_t)2;
                }
                else if ((*(void *)&prime & (*(void *)&prime - 1)) != 0)
                {
                  int8x8_t prime = (int8x8_t)std::__next_prime(*(void *)&prime);
                }
                unint64_t v21 = *(void *)(v15 + 48);
                if (*(void *)&prime <= v21)
                {
                  if (*(void *)&prime < v21)
                  {
                    unint64_t v43 = vcvtps_u32_f32((float)*(unint64_t *)(v15 + 64) / *(float *)(v15 + 72));
                    if (v21 < 3
                      || (uint8x8_t v44 = (uint8x8_t)vcnt_s8((int8x8_t)v21), v44.i16[0] = vaddlv_u8(v44), v44.u32[0] > 1uLL))
                    {
                      unint64_t v43 = std::__next_prime(v43);
                    }
                    else
                    {
                      uint64_t v45 = 1 << -(char)__clz(v43 - 1);
                      if (v43 >= 2) {
                        unint64_t v43 = v45;
                      }
                    }
                    if (*(void *)&prime <= v43) {
                      int8x8_t prime = (int8x8_t)v43;
                    }
                    if (*(void *)&prime >= v21)
                    {
                      unint64_t v21 = *(void *)(v15 + 48);
                    }
                    else
                    {
                      if (prime) {
                        goto LABEL_66;
                      }
                      v83 = *(void **)(v15 + 40);
                      *(void *)(v15 + 40) = 0;
                      if (v83) {
                        operator delete(v83);
                      }
                      unint64_t v21 = 0;
                      *(void *)(v15 + 48) = 0;
                    }
                  }
                }
                else
                {
LABEL_66:
                  if (*(void *)&prime >> 61) {
                    std::__throw_bad_array_new_length[abi:nn180100]();
                  }
                  v37 = operator new(8 * *(void *)&prime);
                  v38 = *(void **)(v15 + 40);
                  *(void *)(v15 + 40) = v37;
                  if (v38) {
                    operator delete(v38);
                  }
                  uint64_t v39 = 0;
                  *(int8x8_t *)(v15 + 48) = prime;
                  do
                    *(void *)(*(void *)(v15 + 40) + 8 * v39++) = 0;
                  while (*(void *)&prime != v39);
                  v40 = *(void **)(v15 + 56);
                  if (v40)
                  {
                    unint64_t v41 = v40[1];
                    uint8x8_t v42 = (uint8x8_t)vcnt_s8(prime);
                    v42.i16[0] = vaddlv_u8(v42);
                    if (v42.u32[0] > 1uLL)
                    {
                      if (v41 >= *(void *)&prime) {
                        v41 %= *(void *)&prime;
                      }
                    }
                    else
                    {
                      v41 &= *(void *)&prime - 1;
                    }
                    *(void *)(*(void *)(v15 + 40) + 8 * v41) = v15 + 56;
                    v46 = (void *)*v40;
                    if (*v40)
                    {
                      do
                      {
                        unint64_t v47 = v46[1];
                        if (v42.u32[0] > 1uLL)
                        {
                          if (v47 >= *(void *)&prime) {
                            v47 %= *(void *)&prime;
                          }
                        }
                        else
                        {
                          v47 &= *(void *)&prime - 1;
                        }
                        if (v47 != v41)
                        {
                          uint64_t v48 = *(void *)(v15 + 40);
                          if (!*(void *)(v48 + 8 * v47))
                          {
                            *(void *)(v48 + 8 * v47) = v40;
                            goto LABEL_91;
                          }
                          void *v40 = *v46;
                          void *v46 = **(void **)(*(void *)(v15 + 40) + 8 * v47);
                          **(void **)(*(void *)(v15 + 40) + 8 * v47) = v46;
                          v46 = v40;
                        }
                        unint64_t v47 = v41;
LABEL_91:
                        v40 = v46;
                        v46 = (void *)*v46;
                        unint64_t v41 = v47;
                      }
                      while (v46);
                    }
                  }
                  unint64_t v21 = (unint64_t)prime;
                }
                if ((v21 & (v21 - 1)) != 0)
                {
                  if (v20 >= v21) {
                    uint64_t v1 = v20 % v21;
                  }
                  else {
                    uint64_t v1 = v20;
                  }
                }
                else
                {
                  uint64_t v1 = (v21 - 1) & v20;
                }
              }
              uint64_t v49 = *(void *)(v15 + 40);
              v50 = *(void **)(v49 + 8 * v1);
              if (v50)
              {
                void *v30 = *v50;
                goto LABEL_108;
              }
              void *v30 = *(void *)(v15 + 56);
              *(void *)(v15 + 56) = v30;
              *(void *)(v49 + 8 * v1) = v15 + 56;
              if (*v30)
              {
                unint64_t v51 = *(void *)(*v30 + 8);
                if ((v21 & (v21 - 1)) != 0)
                {
                  if (v51 >= v21) {
                    v51 %= v21;
                  }
                }
                else
                {
                  v51 &= v21 - 1;
                }
                v50 = (void *)(*(void *)(v15 + 40) + 8 * v51);
LABEL_108:
                void *v50 = v30;
              }
              ++*(void *)(v15 + 64);
LABEL_110:
              v52 = std::__hash_table<std::__hash_value_type<unsigned long,std::vector<unsigned long>>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,std::vector<unsigned long>>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,std::vector<unsigned long>>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,std::vector<unsigned long>>>>::find<unsigned long>((void *)v15, v20);
              int v53 = *((unsigned __int8 *)v52 + 64);
              if (v52[3])
              {
                +[NSData dataWithContentsOfFile:](NSData, "dataWithContentsOfFile:");
                id v54 = (id)objc_claimAutoreleasedReturnValue();
                v166 = &stru_24DC8;
              }
              else
              {
                v55 = (void *)v52[4];
                if (v55)
                {
                  id v54 = v55;
                  v166 = &stru_24DC8;
                }
                else
                {
                  v56 = (void *)v52[5];
                  if (!v56)
                  {
                    CFStringRef v82 = &stru_24DC8;
                    goto LABEL_158;
                  }
                  v57 = v56;
                  id v54 = objc_alloc_init((Class)NSData);
                  v166 = v57;
                }
              }

              id v174 = v54;
LABEL_117:
              BOOL v154 = v53 != 0;
            }
            else
            {
              BOOL v154 = 0;
              v166 = &stru_24DC8;
              v168 = &off_26960;
            }
            v58 = [v179 debugDescription];
            v151 = v58;
            id v59 = [(__CFString *)v58 length];
            v60 = @"Invalid OOB access detected";
            if (v59) {
              v60 = v58;
            }
            v162 = v60;
            v61 = [v179 function];
            v62 = [v61 unpackedFilePath];
            BOOL v63 = v62 == 0;

            if (v63)
            {
              v164 = &stru_24DC8;
            }
            else
            {
              v64 = [v61 filePath];
              if (v64) {
                [v61 filePath];
              }
              else {
              v164 = [v61 unpackedFilePath];
              }
            }
            id v65 = (id)GPUTools::Diag::SwizzleMTLTracker::Transport;
            if (v65)
            {
              v214[0] = @"path";
              v214[1] = @"line";
              v215[0] = v184;
              v215[1] = v182;
              v214[2] = @"column";
              v214[3] = @"functionName";
              v215[2] = v4;
              v215[3] = v186;
              v214[4] = @"source";
              v214[5] = @"metallib";
              v215[4] = v166;
              v215[5] = v174;
              v215[6] = v168;
              v214[6] = @"metallibHash";
              v214[7] = @"isDefaultMetallib";
              v66 = +[NSNumber numberWithBool:v154];
              v215[7] = v66;
              v214[8] = @"MTLName";
              v67 = [v61 name];
              if (v67)
              {
                v68 = [v61 name];
              }
              else
              {
                v68 = &stru_24DC8;
              }
              v215[8] = v68;
              v215[9] = v164;
              v214[9] = @"MTLURL";
              v214[10] = @"message";
              v215[10] = v162;
              v215[11] = v170;
              v214[11] = @"CPUBacktrace";
              v214[12] = @"ptrsNum";
              v215[12] = v172;
              uint64_t v1 = +[NSDictionary dictionaryWithObjects:v215 forKeys:v214 count:13];
              if (v67) {

              }
              v76 = +[GTTransportMessage_tools_diagnostics messageWithKind:4352 plistPayload:v1];
              [v65 send:v76 error:0];
            }
            else
            {
              uint64_t v1 = objc_opt_new();
              for (unint64_t m = 0; m < (unint64_t)[v186 count]; ++m)
              {
                v70 = objc_opt_new();
                v71 = [v184 objectAtIndexedSubscript:m];
                v72 = +[NSURL fileURLWithPath:v71];
                [v70 setFile:v72];

                v73 = [v182 objectAtIndexedSubscript:m];
                objc_msgSend(v70, "setLine:", objc_msgSend(v73, "unsignedLongValue"));

                v74 = [v4 objectAtIndexedSubscript:m];
                objc_msgSend(v70, "setColumn:", objc_msgSend(v74, "unsignedLongValue"));

                v75 = [v186 objectAtIndexedSubscript:m];
                [v70 setFunctionName:v75];

                [(id)v1 addObject:v70];
              }
              v76 = objc_opt_new();
              [v76 setCallstack:v1];
              [v76 setCpuCallstackData:v170];
              objc_msgSend(v76, "setCpuCallstackFramesNum:", objc_msgSend(v172, "unsignedLongValue"));
              [v76 setLibraryOnlineSource:v166];
              [v76 setLibraryOfflineSource:v174];
              v77 = [v168 stringValue];
              [v76 setLibraryHash:v77];

              [v76 setIsDefaultLibrary:v154];
              v78 = [v61 name];
              if (v78)
              {
                v79 = [v61 name];
              }
              else
              {
                v79 = &stru_24DC8;
              }
              [v76 setMetalFunctionName:v79];
              if (v78) {

              }
              v80 = +[NSURL fileURLWithPath:v164];
              [v76 setMetalFunctionFile:v80];

              [v76 setMetalLogMessage:v162];
              [(id)GPUTools::Diag::SwizzleMTLTracker::FacilityImpl notifyDiagnosticsIssue:v76];
            }
          }
          v176 = (char *)v176 + 1;
        }
        while (v176 != v160);
        id v84 = [obj countByEnumeratingWithState:&v188 objects:v206 count:16];
        id v160 = v84;
      }
      while (v84);
    }
  }
  v85 = [v150 error];
  BOOL v86 = v85 == 0;

  if (!v86)
  {
    id v87 = v192;
    id v88 = v193;
    id v89 = v150;
    id v159 = v87;
    id v161 = v88;
    v163 = v89;
    v90 = [v89 error];
    v91 = [v90 userInfo];
    v157 = [v91 valueForKey:MTLCommandBufferEncoderInfoErrorKey];

    v92 = objc_opt_new();
    id v169 = objc_alloc_init((Class)NSMutableArray);
    id v167 = objc_alloc_init((Class)NSMutableArray);
    long long v204 = 0u;
    long long v205 = 0u;
    long long v202 = 0u;
    long long v203 = 0u;
    id v171 = v157;
    id v93 = [v171 countByEnumeratingWithState:&v202 objects:v216 count:16];
    if (v93)
    {
      uint64_t v94 = *(void *)v203;
      do
      {
        for (n = 0; n != v93; n = (char *)n + 1)
        {
          if (*(void *)v203 != v94) {
            objc_enumerationMutation(v171);
          }
          v96 = *(void **)(*((void *)&v202 + 1) + 8 * (void)n);
          if ([v96 errorState] == &dword_4) {
            [v169 addObject:v96];
          }
          if ([v96 errorState] == (char *)&dword_0 + 2) {
            [v167 addObject:v96];
          }
        }
        id v93 = [v171 countByEnumeratingWithState:&v202 objects:v216 count:16];
      }
      while (v93);
    }

    id v97 = [v169 count];
    v98 = v167;
    if (v97) {
      v98 = v169;
    }
    id v165 = v98;
    if ([v169 count])
    {
      CFStringRef v153 = @"The commands associated with an encoder caused an error";
      v99 = v169;
    }
    else
    {
      if (![v167 count])
      {
        v187 = @"[MTLCommandEncoder endEncoding]";
        v101 = &off_26960;
LABEL_214:

        goto LABEL_215;
      }
      CFStringRef v153 = @"The commands associated with the encoder were affected by an error, which may or may not have been caused by the commands themselves, and failed to execute in full";
      v99 = v167;
    }
    id v155 = v99;

    id v175 = objc_alloc_init((Class)NSMutableArray);
    id v177 = objc_alloc_init((Class)NSMutableArray);
    id v181 = objc_alloc_init((Class)NSMutableArray);
    long long v200 = 0u;
    long long v201 = 0u;
    long long v198 = 0u;
    long long v199 = 0u;
    id v165 = v155;
    id v100 = [v165 countByEnumeratingWithState:&v198 objects:v215 count:16];
    if (v100)
    {
      v187 = @"[MTLCommandEncoder endEncoding]";
      v101 = &off_26960;
      uint64_t v173 = *(void *)v199;
      do
      {
        id v180 = v100;
        v102 = 0;
        v103 = v92;
        v185 = v101;
        do
        {
          if (*(void *)v199 != v173) {
            objc_enumerationMutation(v165);
          }
          v104 = *(void **)(*((void *)&v198 + 1) + 8 * (void)v102);
          long long v194 = 0u;
          long long v195 = 0u;
          long long v196 = 0u;
          long long v197 = 0u;
          v105 = [v104 debugSignposts];
          v183 = v103;
          id v106 = [v105 countByEnumeratingWithState:&v194 objects:v214 count:16];
          if (v106)
          {
            uint64_t v107 = *(void *)v195;
            while (2)
            {
              for (ii = 0; ii != v106; ii = (char *)ii + 1)
              {
                if (*(void *)v195 != v107) {
                  objc_enumerationMutation(v105);
                }
                v109 = *(void **)(*((void *)&v194 + 1) + 8 * (void)ii);
                if ([v109 hasPrefix:@"GPUToolsDebugInfo"])
                {
                  v111 = [v109 componentsSeparatedByString:@"_"];
                  v112 = [v111 objectAtIndexedSubscript:1];
                  id v110 = [v112 integerValue];
                  v113 = [v104 label];
                  if ([v113 length])
                  {
                    v114 = [v104 label];
                    v115 = +[NSString stringWithFormat:@" \"%@\"", v114];
                  }
                  else
                  {
                    v115 = &stru_24DC8;
                  }

                  v116 = [v111 objectAtIndexedSubscript:2];
                  uint64_t v117 = [v116 stringByAppendingString:v115];

                  v187 = (__CFString *)v117;
                  goto LABEL_197;
                }
              }
              id v106 = [v105 countByEnumeratingWithState:&v194 objects:v214 count:16];
              if (v106) {
                continue;
              }
              break;
            }
          }
          id v110 = 0;
LABEL_197:

          GPUTools::Diag::SwizzleMTLTracker::GetCallstackFromStore((GPUTools::Diag::SwizzleMTLTracker *)&v208, (unint64_t)v110, (GPUTools::Diag::BacktraceStore *)(GPUTools::Diag::SwizzleMTLTracker::Tracker + 120));
          v92 = v208;
          v208 = 0;

          v101 = v209;
          v209 = 0;

          [v175 addObject:v92];
          [v177 addObject:v101];
          if (v187) {
            CFStringRef v118 = v187;
          }
          else {
            CFStringRef v118 = &stru_24DC8;
          }
          [v181 addObject:v118];
          v102 = (char *)v102 + 1;
          v103 = v92;
          v185 = v101;
        }
        while (v102 != v180);
        id v100 = [v165 countByEnumeratingWithState:&v198 objects:v215 count:16];
      }
      while (v100);
    }
    else
    {
      v187 = @"[MTLCommandEncoder endEncoding]";
      v101 = &off_26960;
    }

    v119 = [v163 label];
    if ([v119 length])
    {
      v120 = [v163 label];
      v121 = +[NSString stringWithFormat:@" \"%@\"", v120];
    }
    else
    {
      v121 = &stru_24DC8;
    }

    v122 = +[NSString stringWithFormat:@"MTLCommandBuffer%@ execution failed: %@", v121, v153];
    id v123 = (id)GPUTools::Diag::SwizzleMTLTracker::Transport;
    if (v123)
    {
      v207[0] = @"message";
      v207[1] = @"CPUBacktrace";
      v208 = v122;
      v209 = (_UNKNOWN **)v159;
      v207[2] = @"ptrsNum";
      v207[3] = @"encoderCallstackDataArray";
      id v210 = v161;
      id v211 = v175;
      v207[4] = @"encoderCallstackCountArray";
      v207[5] = @"encoderMessageArray";
      id v212 = v177;
      id v213 = v181;
      v124 = +[NSDictionary dictionaryWithObjects:&v208 forKeys:v207 count:6];
      v125 = +[GTTransportMessage_tools_diagnostics messageWithKind:4356 plistPayload:v124];
      [v123 send:v125 error:0];
    }
    else
    {
      v124 = objc_opt_new();
      for (unint64_t jj = 0; jj < (unint64_t)[v181 count]; ++jj)
      {
        v127 = objc_opt_new();
        v128 = [v175 objectAtIndexedSubscript:jj];
        [v127 setCpuCallstackData:v128];

        v129 = [v177 objectAtIndexedSubscript:jj];
        objc_msgSend(v127, "setCpuCallstackFramesNum:", objc_msgSend(v129, "integerValue"));

        v130 = [v181 objectAtIndexedSubscript:jj];
        [v127 setMetalLogMessage:v130];

        [v124 addObject:v127];
      }
      v125 = objc_opt_new();
      [v125 setMetalLogMessage:v122];
      [v125 setCommandBufferCommitCallstackData:v159];
      objc_msgSend(v125, "setCommandBufferCommitCallstackFramesNum:", objc_msgSend(v161, "integerValue"));
      [v125 setFaultingEncoders:v124];
      [(id)GPUTools::Diag::SwizzleMTLTracker::FacilityImpl notifyCommandBufferIssue:v125];
    }

    goto LABEL_214;
  }
LABEL_215:
  v131 = v146 + 10;
  v132 = std::__hash_table<std::__hash_value_type<unsigned long,std::vector<unsigned long>>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,std::vector<unsigned long>>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,std::vector<unsigned long>>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,std::vector<unsigned long>>>>::find<unsigned long>(v146 + 10, v145);
  if (v132)
  {
    v133 = v132;
    uint64_t v134 = v132[3];
    uint64_t v135 = v132[4];
    while (v134 != v135)
    {
      v134 += 8;
      GPUTools::Diag::BacktraceStore::RemoveBacktrace((GPUTools::Diag::BacktraceStore *)v216);
    }
    int8x8_t v136 = (int8x8_t)v146[11];
    unint64_t v137 = v133[1];
    uint8x8_t v138 = (uint8x8_t)vcnt_s8(v136);
    v138.i16[0] = vaddlv_u8(v138);
    if (v138.u32[0] > 1uLL)
    {
      if (v137 >= *(void *)&v136) {
        v137 %= *(void *)&v136;
      }
    }
    else
    {
      v137 &= *(void *)&v136 - 1;
    }
    v139 = *(void **)(*v131 + 8 * v137);
    do
    {
      v140 = v139;
      v139 = (void *)*v139;
    }
    while (v139 != v133);
    if (v140 == v146 + 12) {
      goto LABEL_235;
    }
    unint64_t v141 = v140[1];
    if (v138.u32[0] > 1uLL)
    {
      if (v141 >= *(void *)&v136) {
        v141 %= *(void *)&v136;
      }
    }
    else
    {
      v141 &= *(void *)&v136 - 1;
    }
    if (v141 != v137)
    {
LABEL_235:
      if (!*v133) {
        goto LABEL_236;
      }
      unint64_t v142 = *(void *)(*v133 + 8);
      if (v138.u32[0] > 1uLL)
      {
        if (v142 >= *(void *)&v136) {
          v142 %= *(void *)&v136;
        }
      }
      else
      {
        v142 &= *(void *)&v136 - 1;
      }
      if (v142 != v137) {
LABEL_236:
      }
        *(void *)(*v131 + 8 * v137) = 0;
    }
    uint64_t v143 = *v133;
    if (*v133)
    {
      unint64_t v144 = *(void *)(v143 + 8);
      if (v138.u32[0] > 1uLL)
      {
        if (v144 >= *(void *)&v136) {
          v144 %= *(void *)&v136;
        }
      }
      else
      {
        v144 &= *(void *)&v136 - 1;
      }
      if (v144 != v137)
      {
        *(void *)(*v131 + 8 * v144) = v140;
        uint64_t v143 = *v133;
      }
    }
    void *v140 = v143;
    void *v133 = 0;
    --v146[13];
    std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<unsigned long,std::vector<unsigned long>>,void *>>>::operator()[abi:nn180100](1, v133);
  }
}

void sub_2BE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *a17, uint64_t a18, uint64_t a19, void *a20,void *a21,void *a22,void *a23,void *a24,uint64_t a25,void *a26,void *a27,uint64_t a28,uint64_t a29,void *a30,void *a31,uint64_t a32,void *a33,uint64_t a34,uint64_t a35,void *a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,void *a45,void *a46)
{
  _Unwind_Resume(a1);
}

id GPUTools::Diag::SwizzleMTLTracker::MTLGPUDebugDevice_newDefaultLibrary(GPUTools::Diag::SwizzleMTLTracker *this, objc_object *a2, objc_selector *a3)
{
  uint64_t v5 = GPUTools::Diag::SwizzleMTLTracker::Tracker;
  v6 = *(unsigned int (**)(const char *, void, objc_selector *))(GPUTools::Diag::SwizzleMTLTracker::Tracker
                                                                            + 384);
  if (!v6 || (id v7 = 0, v6("MTLGPUDebugDevice_newDefaultLibrary", 0, a3)))
  {
    uint64_t v8 = (*(void (**)(GPUTools::Diag::SwizzleMTLTracker *, objc_object *, objc_selector *))(v5 + 392))(this, a2, a3);
    id v7 = v8;
    if (v8)
    {
      v9 = *(NSObject **)(v5 + 368);
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = ___ZN8GPUTools4Diag17SwizzleMTLTracker35MTLGPUDebugDevice_newDefaultLibraryEP11objc_objectP13objc_selector_block_invoke;
      v13[3] = &unk_24A88;
      uint64_t v15 = v5;
      id v10 = v8;
      id v14 = v10;
      dispatch_sync(v9, v13);
      id v11 = v10;
    }
  }

  return v7;
}

void ___ZN8GPUTools4Diag17SwizzleMTLTracker35MTLGPUDebugDevice_newDefaultLibraryEP11objc_objectP13objc_selector_block_invoke(uint64_t a1)
{
  id v2 = +[NSBundle mainBundle];
  uint8x8_t v3 = [v2 pathForResource:@"default" ofType:@"metallib"];

  uint64_t v4 = *(void *)(a1 + 40);
  id v5 = [*(id *)(a1 + 32) hash];
  id v7 = v3;
  id v6 = *(id *)(a1 + 32);
  id v8 = v5;
  id v9 = v7;
  long long v10 = 0u;
  id v11 = v6;
  id v12 = 0;
  uint64_t v13 = 1;
  std::__hash_table<std::__hash_value_type<unsigned long,GPUTools::Diag::Library>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,GPUTools::Diag::Library>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,GPUTools::Diag::Library>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,GPUTools::Diag::Library>>>::__emplace_unique_key_args<unsigned long,std::pair<unsigned long const,GPUTools::Diag::Library>>(v4, (unint64_t)v5, (uint64_t *)&v8);
}

void sub_33F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va1, a3);
  va_start(va, a3);
  id v5 = va_arg(va1, id);
  uint64_t v7 = va_arg(va1, void);
  uint64_t v8 = va_arg(va1, void);
  uint64_t v9 = va_arg(va1, void);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  std::pair<unsigned long const,GPUTools::Diag::Library>::~pair((id *)va1);
  GPUTools::Diag::Library::~Library((id *)va);

  _Unwind_Resume(a1);
}

void std::__hash_table<std::__hash_value_type<unsigned long,GPUTools::Diag::Library>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,GPUTools::Diag::Library>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,GPUTools::Diag::Library>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,GPUTools::Diag::Library>>>::__emplace_unique_key_args<unsigned long,std::pair<unsigned long const,GPUTools::Diag::Library>>(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  unint64_t v7 = *(void *)(a1 + 8);
  if (v7)
  {
    uint8x8_t v8 = (uint8x8_t)vcnt_s8((int8x8_t)v7);
    v8.i16[0] = vaddlv_u8(v8);
    if (v8.u32[0] > 1uLL)
    {
      unint64_t v3 = a2;
      if (v7 <= a2) {
        unint64_t v3 = a2 % v7;
      }
    }
    else
    {
      unint64_t v3 = (v7 - 1) & a2;
    }
    uint64_t v9 = *(void **)(*(void *)a1 + 8 * v3);
    if (v9)
    {
      for (i = (void *)*v9; i; i = (void *)*i)
      {
        unint64_t v11 = i[1];
        if (v11 == a2)
        {
          if (i[2] == a2) {
            return;
          }
        }
        else
        {
          if (v8.u32[0] > 1uLL)
          {
            if (v11 >= v7) {
              v11 %= v7;
            }
          }
          else
          {
            v11 &= v7 - 1;
          }
          if (v11 != v3) {
            break;
          }
        }
      }
    }
  }
  uint64_t v12 = (void *)(a1 + 16);
  uint64_t v13 = (char *)operator new(0x48uLL);
  long long v14 = *(_OWORD *)(a3 + 1);
  *(_OWORD *)(a3 + 1) = 0u;
  long long v15 = *(_OWORD *)(a3 + 3);
  *(_OWORD *)(a3 + 3) = 0u;
  uint64_t v16 = *a3;
  *((void *)v13 + 1) = a2;
  *((void *)v13 + 2) = v16;
  uint64_t v17 = a3[5];
  uint64_t v18 = a3[6];
  a3[5] = 0;
  v40[0] = v13;
  v40[1] = a1 + 16;
  *(void *)uint64_t v13 = 0;
  *(_OWORD *)(v13 + 24) = v14;
  *(_OWORD *)(v13 + 40) = v15;
  *((void *)v13 + 7) = v17;
  *((void *)v13 + 8) = v18;
  char v41 = 1;
  float v19 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v20 = *(float *)(a1 + 32);
  if (!v7 || (float)(v20 * (float)v7) < v19)
  {
    BOOL v21 = 1;
    if (v7 >= 3) {
      BOOL v21 = (v7 & (v7 - 1)) != 0;
    }
    unint64_t v22 = v21 | (2 * v7);
    unint64_t v23 = vcvtps_u32_f32(v19 / v20);
    if (v22 <= v23) {
      int8x8_t prime = (int8x8_t)v23;
    }
    else {
      int8x8_t prime = (int8x8_t)v22;
    }
    if (*(void *)&prime == 1)
    {
      int8x8_t prime = (int8x8_t)2;
    }
    else if ((*(void *)&prime & (*(void *)&prime - 1)) != 0)
    {
      int8x8_t prime = (int8x8_t)std::__next_prime(*(void *)&prime);
    }
    unint64_t v7 = *(void *)(a1 + 8);
    if (*(void *)&prime > v7) {
      goto LABEL_30;
    }
    if (*(void *)&prime < v7)
    {
      unint64_t v31 = vcvtps_u32_f32((float)*(unint64_t *)(a1 + 24) / *(float *)(a1 + 32));
      if (v7 < 3 || (uint8x8_t v32 = (uint8x8_t)vcnt_s8((int8x8_t)v7), v32.i16[0] = vaddlv_u8(v32), v32.u32[0] > 1uLL))
      {
        unint64_t v31 = std::__next_prime(v31);
      }
      else
      {
        uint64_t v33 = 1 << -(char)__clz(v31 - 1);
        if (v31 >= 2) {
          unint64_t v31 = v33;
        }
      }
      if (*(void *)&prime <= v31) {
        int8x8_t prime = (int8x8_t)v31;
      }
      if (*(void *)&prime >= v7)
      {
        unint64_t v7 = *(void *)(a1 + 8);
      }
      else
      {
        if (prime)
        {
LABEL_30:
          if (*(void *)&prime >> 61) {
            std::__throw_bad_array_new_length[abi:nn180100]();
          }
          v25 = operator new(8 * *(void *)&prime);
          unint64_t v26 = *(void **)a1;
          *(void *)a1 = v25;
          if (v26) {
            operator delete(v26);
          }
          uint64_t v27 = 0;
          *(int8x8_t *)(a1 + 8) = prime;
          do
            *(void *)(*(void *)a1 + 8 * v27++) = 0;
          while (*(void *)&prime != v27);
          v28 = (void *)*v12;
          if (*v12)
          {
            unint64_t v29 = v28[1];
            uint8x8_t v30 = (uint8x8_t)vcnt_s8(prime);
            v30.i16[0] = vaddlv_u8(v30);
            if (v30.u32[0] > 1uLL)
            {
              if (v29 >= *(void *)&prime) {
                v29 %= *(void *)&prime;
              }
            }
            else
            {
              v29 &= *(void *)&prime - 1;
            }
            *(void *)(*(void *)a1 + 8 * v29) = v12;
            unint64_t v34 = (void *)*v28;
            if (*v28)
            {
              do
              {
                unint64_t v35 = v34[1];
                if (v30.u32[0] > 1uLL)
                {
                  if (v35 >= *(void *)&prime) {
                    v35 %= *(void *)&prime;
                  }
                }
                else
                {
                  v35 &= *(void *)&prime - 1;
                }
                if (v35 != v29)
                {
                  if (!*(void *)(*(void *)a1 + 8 * v35))
                  {
                    *(void *)(*(void *)a1 + 8 * v35) = v28;
                    goto LABEL_55;
                  }
                  void *v28 = *v34;
                  *unint64_t v34 = **(void **)(*(void *)a1 + 8 * v35);
                  **(void **)(*(void *)a1 + 8 * v35) = v34;
                  unint64_t v34 = v28;
                }
                unint64_t v35 = v29;
LABEL_55:
                v28 = v34;
                unint64_t v34 = (void *)*v34;
                unint64_t v29 = v35;
              }
              while (v34);
            }
          }
          unint64_t v7 = (unint64_t)prime;
          goto LABEL_59;
        }
        uint64_t v39 = *(void **)a1;
        *(void *)a1 = 0;
        if (v39) {
          operator delete(v39);
        }
        unint64_t v7 = 0;
        *(void *)(a1 + 8) = 0;
      }
    }
LABEL_59:
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v7 <= a2) {
        unint64_t v3 = a2 % v7;
      }
      else {
        unint64_t v3 = a2;
      }
    }
    else
    {
      unint64_t v3 = (v7 - 1) & a2;
    }
  }
  v36 = *(void **)(*(void *)a1 + 8 * v3);
  uint64_t v37 = v40[0];
  if (v36)
  {
    *(void *)v40[0] = *v36;
LABEL_72:
    void *v36 = v37;
    goto LABEL_73;
  }
  *(void *)v40[0] = *(void *)(a1 + 16);
  *(void *)(a1 + 16) = v37;
  *(void *)(*(void *)a1 + 8 * v3) = v12;
  if (*(void *)v37)
  {
    unint64_t v38 = *(void *)(*(void *)v37 + 8);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v38 >= v7) {
        v38 %= v7;
      }
    }
    else
    {
      v38 &= v7 - 1;
    }
    v36 = (void *)(*(void *)a1 + 8 * v38);
    goto LABEL_72;
  }
LABEL_73:
  v40[0] = 0;
  ++*(void *)(a1 + 24);
  std::unique_ptr<std::__hash_node<std::__hash_value_type<unsigned long,GPUTools::Diag::Library>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<unsigned long,GPUTools::Diag::Library>,void *>>>>::reset[abi:nn180100]((uint64_t)v40);
}

void sub_3848(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::unique_ptr<std::__hash_node<std::__hash_value_type<unsigned long,GPUTools::Diag::Library>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<unsigned long,GPUTools::Diag::Library>,void *>>>>::reset[abi:nn180100]((uint64_t)va);
  _Unwind_Resume(a1);
}

id *std::pair<unsigned long const,GPUTools::Diag::Library>::~pair(id *a1)
{
  return a1;
}

void GPUTools::Diag::Library::~Library(id *this)
{
}

void std::unique_ptr<std::__hash_node<std::__hash_value_type<unsigned long,GPUTools::Diag::Library>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<unsigned long,GPUTools::Diag::Library>,void *>>>>::reset[abi:nn180100](uint64_t a1)
{
  uint64_t v1 = *(void **)a1;
  *(void *)a1 = 0;
  if (v1)
  {
    if (*(unsigned char *)(a1 + 16)) {
      std::__destroy_at[abi:nn180100]<std::pair<unsigned long const,GPUTools::Diag::Library>,0>((uint64_t)v1 + 16);
    }
    operator delete(v1);
  }
}

void std::__destroy_at[abi:nn180100]<std::pair<unsigned long const,GPUTools::Diag::Library>,0>(uint64_t a1)
{
  id v2 = *(void **)(a1 + 8);
}

id GPUTools::Diag::SwizzleMTLTracker::MTLGPUDebugDevice_newDefaultLibraryWithBundle(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  id v7 = a3;
  uint64_t v8 = GPUTools::Diag::SwizzleMTLTracker::Tracker;
  uint64_t v9 = *(uint64_t (**)(const char *, id))(GPUTools::Diag::SwizzleMTLTracker::Tracker + 384);
  if (v9 && (v9("MTLGPUDebugDevice_newDefaultLibraryWithBundle", v7) & 1) == 0)
  {
    uint64_t v10 = 0;
  }
  else
  {
    uint64_t v10 = (*(void (**)(uint64_t, uint64_t, id, uint64_t))(v8 + 400))(a1, a2, v7, a4);
    if (v10)
    {
      unint64_t v11 = *(NSObject **)(v8 + 368);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = ___ZN8GPUTools4Diag17SwizzleMTLTracker45MTLGPUDebugDevice_newDefaultLibraryWithBundleEP11objc_objectP13objc_selectorP8NSBundlePU15__autoreleasingP7NSError_block_invoke;
      block[3] = &unk_24720;
      id v16 = v7;
      id v12 = v10;
      id v17 = v12;
      uint64_t v18 = v8;
      dispatch_sync(v11, block);
      id v13 = v12;
    }
  }

  return v10;
}

void sub_3AD0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void ___ZN8GPUTools4Diag17SwizzleMTLTracker45MTLGPUDebugDevice_newDefaultLibraryWithBundleEP11objc_objectP13objc_selectorP8NSBundlePU15__autoreleasingP7NSError_block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) pathForResource:@"default" ofType:@"metallib"];
  id v3 = [*(id *)(a1 + 40) hash];
  uint64_t v4 = *(void *)(a1 + 48);
  id v6 = v2;
  id v5 = *(id *)(a1 + 40);
  id v7 = v3;
  id v8 = v6;
  long long v9 = 0u;
  id v10 = v5;
  id v11 = 0;
  uint64_t v12 = 1;
  std::__hash_table<std::__hash_value_type<unsigned long,GPUTools::Diag::Library>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,GPUTools::Diag::Library>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,GPUTools::Diag::Library>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,GPUTools::Diag::Library>>>::__emplace_unique_key_args<unsigned long,std::pair<unsigned long const,GPUTools::Diag::Library>>(v4, (unint64_t)v3, (uint64_t *)&v7);
}

void sub_3BD4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va1, a3);
  va_start(va, a3);
  id v5 = va_arg(va1, id);
  uint64_t v7 = va_arg(va1, void);
  uint64_t v8 = va_arg(va1, void);
  uint64_t v9 = va_arg(va1, void);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  std::pair<unsigned long const,GPUTools::Diag::Library>::~pair((id *)va1);
  GPUTools::Diag::Library::~Library((id *)va);

  _Unwind_Resume(a1);
}

id GPUTools::Diag::SwizzleMTLTracker::MTLGPUDebugDevice_newLibraryWithData(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  id v7 = a3;
  uint64_t v8 = GPUTools::Diag::SwizzleMTLTracker::Tracker;
  uint64_t v9 = *(uint64_t (**)(const char *, void))(GPUTools::Diag::SwizzleMTLTracker::Tracker + 384);
  if (v9 && (v9("MTLGPUDebugDevice_newLibraryWithData", 0) & 1) == 0)
  {
    uint64_t v10 = 0;
  }
  else
  {
    uint64_t v10 = (*(void (**)(uint64_t, uint64_t, id, uint64_t))(v8 + 408))(a1, a2, v7, a4);
    if (v10)
    {
      uint64_t v11 = *(NSObject **)(v8 + 368);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = ___ZN8GPUTools4Diag17SwizzleMTLTracker36MTLGPUDebugDevice_newLibraryWithDataEP11objc_objectP13objc_selectorPU27objcproto16OS_dispatch_data8NSObjectPU15__autoreleasingP7NSError_block_invoke;
      block[3] = &unk_24720;
      id v16 = v7;
      id v12 = v10;
      id v17 = v12;
      uint64_t v18 = v8;
      dispatch_sync(v11, block);
      id v13 = v12;
    }
  }

  return v10;
}

void sub_3D2C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void ___ZN8GPUTools4Diag17SwizzleMTLTracker36MTLGPUDebugDevice_newLibraryWithDataEP11objc_objectP13objc_selectorPU27objcproto16OS_dispatch_data8NSObjectPU15__autoreleasingP7NSError_block_invoke(uint64_t a1)
{
  buffer_ptr = 0;
  size_t size_ptr = 0;
  dispatch_data_t v2 = dispatch_data_create_map(*(dispatch_data_t *)(a1 + 32), (const void **)&buffer_ptr, &size_ptr);
  id v3 = +[NSData dataWithBytes:buffer_ptr length:size_ptr];
  uint64_t v4 = NSTemporaryDirectory();
  id v5 = +[NSURL fileURLWithPath:v4 isDirectory:1];

  id v6 = +[NSProcessInfo processInfo];
  id v7 = [v6 globallyUniqueString];

  uint64_t v8 = [v5 URLByAppendingPathComponent:v7];
  [v3 writeToURL:v8 atomically:1];
  id v9 = [*(id *)(a1 + 40) hash];
  uint64_t v10 = *(void *)(a1 + 48);
  uint64_t v11 = [v8 absoluteString];
  id v12 = [v11 stringByReplacingOccurrencesOfString:@"file://" withString:&stru_24DC8];
  id v13 = *(id *)(a1 + 40);
  id v14 = v9;
  id v15 = v12;
  long long v16 = 0u;
  id v17 = v13;
  long long v18 = 0u;
  std::__hash_table<std::__hash_value_type<unsigned long,GPUTools::Diag::Library>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,GPUTools::Diag::Library>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,GPUTools::Diag::Library>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,GPUTools::Diag::Library>>>::__emplace_unique_key_args<unsigned long,std::pair<unsigned long const,GPUTools::Diag::Library>>(v10, (unint64_t)v9, (uint64_t *)&v14);
}

void sub_3EE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, id a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id a16)
{
  std::pair<unsigned long const,GPUTools::Diag::Library>::~pair(&a16);
  GPUTools::Diag::Library::~Library(&a9);

  _Unwind_Resume(a1);
}

void sub_3F2C()
{
}

void sub_3F34()
{
  JUMPOUT(0x3F18);
}

void sub_3F40()
{
}

void sub_3F48()
{
  JUMPOUT(0x3F1CLL);
}

void sub_3F54()
{
}

void sub_3F5C()
{
}

void GPUTools::Diag::SwizzleMTLTracker::MTLGPUDebugDevice_newLibraryWithSourceOptionsHandler(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v10) {
    id v10 = objc_alloc_init((Class)MTLCompileOptions);
  }
  [v10 setDebuggingEnabled:1];
  uint64_t v12 = GPUTools::Diag::SwizzleMTLTracker::Tracker;
  id v13 = *(uint64_t (**)(const char *, id))(GPUTools::Diag::SwizzleMTLTracker::Tracker + 384);
  if (!v13 || (v13("MTLGPUDebugDevice_newLibraryWithSourceOptionsHandler", v9) & 1) != 0)
  {
    id v14 = *(void (**)(uint64_t, uint64_t, id, id, void *))(v12 + 416);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = ___ZN8GPUTools4Diag17SwizzleMTLTracker52MTLGPUDebugDevice_newLibraryWithSourceOptionsHandlerEP11objc_objectP13objc_selectorP8NSStringP17MTLCompileOptionsU13block_pointerFvPU21objcproto10MTLLibrary11objc_objectP7NSErrorE_block_invoke;
    v15[3] = &unk_24748;
    uint64_t v18 = v12;
    id v16 = v9;
    id v17 = v11;
    v14(a1, a2, v16, v10, v15);
  }
}

void sub_40AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15)
{
  _Unwind_Resume(a1);
}

void ___ZN8GPUTools4Diag17SwizzleMTLTracker52MTLGPUDebugDevice_newLibraryWithSourceOptionsHandlerEP11objc_objectP13objc_selectorP8NSStringP17MTLCompileOptionsU13block_pointerFvPU21objcproto10MTLLibrary11objc_objectP7NSErrorE_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id v7 = *(NSObject **)(*(void *)(a1 + 48) + 368);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = ___ZN8GPUTools4Diag17SwizzleMTLTracker52MTLGPUDebugDevice_newLibraryWithSourceOptionsHandlerEP11objc_objectP13objc_selectorP8NSStringP17MTLCompileOptionsU13block_pointerFvPU21objcproto10MTLLibrary11objc_objectP7NSErrorE_block_invoke_2;
    block[3] = &unk_24720;
    id v8 = v5;
    uint64_t v9 = *(void *)(a1 + 48);
    id v11 = v8;
    uint64_t v13 = v9;
    id v12 = *(id *)(a1 + 32);
    dispatch_sync(v7, block);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_41CC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void ___ZN8GPUTools4Diag17SwizzleMTLTracker52MTLGPUDebugDevice_newLibraryWithSourceOptionsHandlerEP11objc_objectP13objc_selectorP8NSStringP17MTLCompileOptionsU13block_pointerFvPU21objcproto10MTLLibrary11objc_objectP7NSErrorE_block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) hash];
  uint64_t v3 = *(void *)(a1 + 48);
  id v4 = [*(id *)(a1 + 40) copy];
  id v5 = *(id *)(a1 + 32);
  id v7 = v2;
  *(_OWORD *)id v8 = 0u;
  id v9 = v4;
  id v10 = v5;
  long long v11 = 0u;
  std::__hash_table<std::__hash_value_type<unsigned long,GPUTools::Diag::Library>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,GPUTools::Diag::Library>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,GPUTools::Diag::Library>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,GPUTools::Diag::Library>>>::__emplace_unique_key_args<unsigned long,std::pair<unsigned long const,GPUTools::Diag::Library>>(v3, (unint64_t)v2, (uint64_t *)&v7);

  id v6 = v8[0];
}

void sub_4290(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, id a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id a16)
{
}

id GPUTools::Diag::SwizzleMTLTracker::MTLGPUDebugDevice_newLibraryWithSourceOptionsError(uint64_t a1, uint64_t a2, void *a3, void *a4, uint64_t a5)
{
  id v9 = a3;
  id v10 = a4;
  id v11 = v10;
  if (v10)
  {
    [v10 setDebuggingEnabled:1];
  }
  else
  {
    id v11 = objc_alloc_init((Class)MTLCompileOptions);
    [v11 setDebuggingEnabled:1];
  }
  uint64_t v12 = GPUTools::Diag::SwizzleMTLTracker::Tracker;
  uint64_t v13 = *(uint64_t (**)(const char *, id))(GPUTools::Diag::SwizzleMTLTracker::Tracker + 384);
  if (v13 && (v13("MTLGPUDebugDevice_newLibraryWithSourceOptionsError", v9) & 1) == 0)
  {
    id v15 = 0;
  }
  else
  {
    id v14 = (*(void (**)(uint64_t, uint64_t, id, id, uint64_t))(v12 + 424))(a1, a2, v9, v11, a5);
    id v15 = v14;
    if (v14)
    {
      id v16 = *(NSObject **)(v12 + 368);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = ___ZN8GPUTools4Diag17SwizzleMTLTracker50MTLGPUDebugDevice_newLibraryWithSourceOptionsErrorEP11objc_objectP13objc_selectorP8NSStringP17MTLCompileOptionsPU15__autoreleasingP7NSError_block_invoke;
      block[3] = &unk_24720;
      id v17 = v14;
      id v21 = v17;
      uint64_t v23 = v12;
      id v22 = v9;
      dispatch_sync(v16, block);
      id v18 = v17;
    }
  }

  return v15;
}

void sub_4420(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void ___ZN8GPUTools4Diag17SwizzleMTLTracker50MTLGPUDebugDevice_newLibraryWithSourceOptionsErrorEP11objc_objectP13objc_selectorP8NSStringP17MTLCompileOptionsPU15__autoreleasingP7NSError_block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) hash];
  uint64_t v3 = *(void *)(a1 + 48);
  id v4 = [*(id *)(a1 + 40) copy];
  id v5 = *(id *)(a1 + 32);
  id v7 = v2;
  *(_OWORD *)id v8 = 0u;
  id v9 = v4;
  id v10 = v5;
  long long v11 = 0u;
  std::__hash_table<std::__hash_value_type<unsigned long,GPUTools::Diag::Library>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,GPUTools::Diag::Library>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,GPUTools::Diag::Library>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,GPUTools::Diag::Library>>>::__emplace_unique_key_args<unsigned long,std::pair<unsigned long const,GPUTools::Diag::Library>>(v3, (unint64_t)v2, (uint64_t *)&v7);

  id v6 = v8[0];
}

void sub_44EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, id a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id a16)
{
}

id GPUTools::Diag::SwizzleMTLTracker::MTLGPUDebugDevice_newLibraryWithFile(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  id v7 = a3;
  uint64_t v8 = GPUTools::Diag::SwizzleMTLTracker::Tracker;
  id v9 = *(uint64_t (**)(const char *, id))(GPUTools::Diag::SwizzleMTLTracker::Tracker + 384);
  if (v9 && (v9("MTLGPUDebugDevice_newLibraryWithFile", v7) & 1) == 0)
  {
    long long v11 = 0;
  }
  else
  {
    id v10 = (*(void (**)(uint64_t, uint64_t, id, uint64_t))(v8 + 432))(a1, a2, v7, a4);
    long long v11 = v10;
    if (v10)
    {
      uint64_t v12 = *(NSObject **)(v8 + 368);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = ___ZN8GPUTools4Diag17SwizzleMTLTracker36MTLGPUDebugDevice_newLibraryWithFileEP11objc_objectP13objc_selectorP8NSStringPU15__autoreleasingP7NSError_block_invoke;
      block[3] = &unk_24720;
      uint64_t v19 = v8;
      id v13 = v10;
      id v17 = v13;
      id v18 = v7;
      dispatch_sync(v12, block);
      id v14 = v13;
    }
  }

  return v11;
}

void sub_463C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void ___ZN8GPUTools4Diag17SwizzleMTLTracker36MTLGPUDebugDevice_newLibraryWithFileEP11objc_objectP13objc_selectorP8NSStringPU15__autoreleasingP7NSError_block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  id v3 = [*(id *)(a1 + 32) hash];
  id v4 = *(id *)(a1 + 40);
  id v5 = *(id *)(a1 + 32);
  id v7 = v3;
  id v8 = v4;
  long long v9 = 0u;
  id v10 = v5;
  long long v11 = 0u;
  std::__hash_table<std::__hash_value_type<unsigned long,GPUTools::Diag::Library>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,GPUTools::Diag::Library>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,GPUTools::Diag::Library>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,GPUTools::Diag::Library>>>::__emplace_unique_key_args<unsigned long,std::pair<unsigned long const,GPUTools::Diag::Library>>(v2, (unint64_t)v3, (uint64_t *)&v7);

  id v6 = v8;
}

void sub_4704(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, id a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id a16)
{
}

id GPUTools::Diag::SwizzleMTLTracker::MTLGPUDebugDevice_newLibraryWithURL(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  id v7 = a3;
  uint64_t v8 = GPUTools::Diag::SwizzleMTLTracker::Tracker;
  long long v9 = *(uint64_t (**)(const char *, id))(GPUTools::Diag::SwizzleMTLTracker::Tracker + 384);
  if (v9 && (v9("MTLGPUDebugDevice_newLibraryWithURL", v7) & 1) == 0)
  {
    id v10 = 0;
  }
  else
  {
    id v10 = (*(void (**)(uint64_t, uint64_t, id, uint64_t))(v8 + 440))(a1, a2, v7, a4);
    if (v10)
    {
      long long v11 = *(NSObject **)(v8 + 368);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = ___ZN8GPUTools4Diag17SwizzleMTLTracker35MTLGPUDebugDevice_newLibraryWithURLEP11objc_objectP13objc_selectorP5NSURLPU15__autoreleasingP7NSError_block_invoke;
      block[3] = &unk_24720;
      id v16 = v7;
      uint64_t v18 = v8;
      id v12 = v10;
      id v17 = v12;
      dispatch_sync(v11, block);
      id v13 = v12;
    }
  }

  return v10;
}

void sub_4854(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void ___ZN8GPUTools4Diag17SwizzleMTLTracker35MTLGPUDebugDevice_newLibraryWithURLEP11objc_objectP13objc_selectorP5NSURLPU15__autoreleasingP7NSError_block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) absoluteString];
  id v3 = [v2 stringByReplacingOccurrencesOfString:@"file://" withString:&stru_24DC8];

  uint64_t v4 = *(void *)(a1 + 48);
  id v5 = [*(id *)(a1 + 40) hash];
  id v7 = v3;
  id v6 = *(id *)(a1 + 40);
  id v8 = v5;
  id v9 = v7;
  long long v10 = 0u;
  id v11 = v6;
  long long v12 = 0u;
  std::__hash_table<std::__hash_value_type<unsigned long,GPUTools::Diag::Library>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,GPUTools::Diag::Library>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,GPUTools::Diag::Library>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,GPUTools::Diag::Library>>>::__emplace_unique_key_args<unsigned long,std::pair<unsigned long const,GPUTools::Diag::Library>>(v4, (unint64_t)v5, (uint64_t *)&v8);
}

void sub_4950(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va1, a3);
  va_start(va, a3);
  id v5 = va_arg(va1, id);
  uint64_t v7 = va_arg(va1, void);
  uint64_t v8 = va_arg(va1, void);
  uint64_t v9 = va_arg(va1, void);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  std::pair<unsigned long const,GPUTools::Diag::Library>::~pair((id *)va1);
  GPUTools::Diag::Library::~Library((id *)va);

  _Unwind_Resume(a1);
}

id GPUTools::Diag::SwizzleMTLTracker::MTLGPUDebugDevice_newLibraryWithDAG(uint64_t a1, uint64_t a2, void *a3, void *a4, uint64_t a5)
{
  id v9 = a3;
  id v10 = a4;
  if (GPUTools::Diag::SwizzleMTLTracker::MTLGPUDebugDevice_newLibraryWithDAG(objc_object *,objc_selector *,NSString *,NSArray *,NSError * {__autoreleasing}*)::onceToken != -1) {
    dispatch_once(&GPUTools::Diag::SwizzleMTLTracker::MTLGPUDebugDevice_newLibraryWithDAG(objc_object *,objc_selector *,NSString *,NSArray *,NSError * {__autoreleasing}*)::onceToken, &__block_literal_global);
  }
  uint64_t v11 = (*(void (**)(uint64_t, uint64_t, id, id, uint64_t))(GPUTools::Diag::SwizzleMTLTracker::Tracker + 448))(a1, a2, v9, v10, a5);

  return v11;
}

void sub_4A40(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void ___ZN8GPUTools4Diag17SwizzleMTLTracker35MTLGPUDebugDevice_newLibraryWithDAGEP11objc_objectP13objc_selectorP8NSStringP7NSArrayPU15__autoreleasingP7NSError_block_invoke(id a1)
{
  GPUTools::Diag::SendUnsupportedSelectorMessage((GPUTools::Diag *)"[MTLDevice newLibraryWithDAG:functionDag:functions:error:]", v1);
}

void GPUTools::Diag::SendUnsupportedSelectorMessage(GPUTools::Diag *this, const char *a2)
{
  {
    GPUTools::Diag::SendUnsupportedSelectorMessage(char const*)::logger = (uint64_t)os_log_create("com.apple.runtime-issues", "Metal Diagnostics Warning");
  }
  id v3 = GPUTools::Diag::SendUnsupportedSelectorMessage(char const*)::logger;
  if (os_log_type_enabled((os_log_t)GPUTools::Diag::SendUnsupportedSelectorMessage(char const*)::logger, OS_LOG_TYPE_FAULT))
  {
    int v4 = 136315138;
    id v5 = this;
    _os_log_fault_impl(&dword_0, v3, OS_LOG_TYPE_FAULT, "Using selector %s is not supported with Metal Diagnostics. Validation issues may not trigger.", (uint8_t *)&v4, 0xCu);
  }
}

id GPUTools::Diag::SwizzleMTLTracker::MTLGPUDebugDevice_newLibraryWithStitchedDescriptor(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  id v7 = a3;
  if (GPUTools::Diag::SwizzleMTLTracker::MTLGPUDebugDevice_newLibraryWithStitchedDescriptor(objc_object *,objc_selector *,MTLStitchedLibraryDescriptor *,NSError * {__autoreleasing}*)::onceToken != -1) {
    dispatch_once(&GPUTools::Diag::SwizzleMTLTracker::MTLGPUDebugDevice_newLibraryWithStitchedDescriptor(objc_object *,objc_selector *,MTLStitchedLibraryDescriptor *,NSError * {__autoreleasing}*)::onceToken, &__block_literal_global_190);
  }
  uint64_t v8 = (*(void (**)(uint64_t, uint64_t, id, uint64_t))(GPUTools::Diag::SwizzleMTLTracker::Tracker + 488))(a1, a2, v7, a4);

  return v8;
}

void sub_4BEC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void ___ZN8GPUTools4Diag17SwizzleMTLTracker50MTLGPUDebugDevice_newLibraryWithStitchedDescriptorEP11objc_objectP13objc_selectorP28MTLStitchedLibraryDescriptorPU15__autoreleasingP7NSError_block_invoke(id a1)
{
  GPUTools::Diag::SendUnsupportedSelectorMessage((GPUTools::Diag *)"[MTLDevice newLibraryWithStitchedDescriptor:descriptor:error:]", v1);
}

void GPUTools::Diag::SwizzleMTLTracker::MTLGPUDebugDevice_newLibraryWithStitchedDescriptorHandler(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v8 = a3;
  id v7 = a4;
  if (GPUTools::Diag::SwizzleMTLTracker::MTLGPUDebugDevice_newLibraryWithStitchedDescriptorHandler(objc_object *,objc_selector *,MTLStitchedLibraryDescriptor *,void({block_pointer})(objc_object  {objcproto10MTLLibrary}*,NSError *))::onceToken != -1) {
    dispatch_once(&GPUTools::Diag::SwizzleMTLTracker::MTLGPUDebugDevice_newLibraryWithStitchedDescriptorHandler(objc_object *,objc_selector *,MTLStitchedLibraryDescriptor *,void({block_pointer})(objc_object  {objcproto10MTLLibrary}*,NSError *))::onceToken, &__block_literal_global_193);
  }
  (*(void (**)(uint64_t, uint64_t, id, id))(GPUTools::Diag::SwizzleMTLTracker::Tracker + 496))(a1, a2, v8, v7);
}

void sub_4CB0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void ___ZN8GPUTools4Diag17SwizzleMTLTracker57MTLGPUDebugDevice_newLibraryWithStitchedDescriptorHandlerEP11objc_objectP13objc_selectorP28MTLStitchedLibraryDescriptorU13block_pointerFvPU21objcproto10MTLLibrary11objc_objectP7NSErrorE_block_invoke(id a1)
{
  GPUTools::Diag::SendUnsupportedSelectorMessage((GPUTools::Diag *)"[MTLDevice newLibraryWithStitchedDescriptor:descriptor:completionHandler:]", v1);
}

id GPUTools::Diag::SwizzleMTLTracker::MTLGPUDebugDevice_newDynamicLibrary(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  id v7 = a3;
  uint64_t v8 = GPUTools::Diag::SwizzleMTLTracker::Tracker;
  id v9 = *(uint64_t (**)(const char *, void))(GPUTools::Diag::SwizzleMTLTracker::Tracker + 384);
  if (v9 && (v9("MTLGPUDebugDevice_newDynamicLibrary", 0) & 1) == 0)
  {
    id v10 = 0;
  }
  else
  {
    id v10 = (*(void (**)(uint64_t, uint64_t, id, uint64_t))(v8 + 504))(a1, a2, v7, a4);
    if (v10)
    {
      uint64_t v11 = *(NSObject **)(v8 + 368);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = ___ZN8GPUTools4Diag17SwizzleMTLTracker35MTLGPUDebugDevice_newDynamicLibraryEP11objc_objectP13objc_selectorPU21objcproto10MTLLibrary11objc_objectPU15__autoreleasingP7NSError_block_invoke;
      block[3] = &unk_24720;
      uint64_t v18 = v8;
      id v16 = v7;
      id v12 = v10;
      id v17 = v12;
      dispatch_sync(v11, block);
      id v13 = v12;
    }
  }

  return v10;
}

void sub_4E08(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void ___ZN8GPUTools4Diag17SwizzleMTLTracker35MTLGPUDebugDevice_newDynamicLibraryEP11objc_objectP13objc_selectorPU21objcproto10MTLLibrary11objc_objectPU15__autoreleasingP7NSError_block_invoke(uint64_t a1)
{
  uint64_t v2 = std::__hash_table<std::__hash_value_type<unsigned long,std::vector<unsigned long>>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,std::vector<unsigned long>>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,std::vector<unsigned long>>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,std::vector<unsigned long>>>>::find<unsigned long>(*(void **)(a1 + 48), (unint64_t)[*(id *)(a1 + 32) hash]);
  if (v2)
  {
    id v3 = v2;
    id v18 = (id)v2[3];
    id v19 = (id)v3[4];
    id v20 = (id)v3[5];
    id v21 = (id)v3[6];
    id v4 = (id)v3[7];
    uint64_t v23 = v3[8];
    id v22 = *(id *)(a1 + 40);

    uint64_t v5 = *(void *)(a1 + 48);
    id v11 = [*(id *)(a1 + 40) hash];
    id v6 = v18;
    id v12 = v6;
    id v7 = v19;
    id v13 = v7;
    id v8 = v20;
    id v14 = v8;
    id v9 = v21;
    id v15 = v9;
    id v10 = v22;
    id v16 = v10;
    uint64_t v17 = v23;
    std::__hash_table<std::__hash_value_type<unsigned long,GPUTools::Diag::Library>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,GPUTools::Diag::Library>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,GPUTools::Diag::Library>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,GPUTools::Diag::Library>>>::__emplace_unique_key_args<unsigned long,std::pair<unsigned long const,GPUTools::Diag::Library>>(v5, (unint64_t)v11, (uint64_t *)&v11);
  }
}

void sub_4F84(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va1, a2);
  va_start(va, a2);
  id v3 = va_arg(va1, id);
  uint64_t v5 = va_arg(va1, void);
  uint64_t v6 = va_arg(va1, void);
  uint64_t v7 = va_arg(va1, void);
  uint64_t v8 = va_arg(va1, void);
  uint64_t v9 = va_arg(va1, void);
  uint64_t v10 = va_arg(va1, void);
  std::pair<unsigned long const,GPUTools::Diag::Library>::~pair((id *)va);
  GPUTools::Diag::Library::~Library((id *)va1);
  _Unwind_Resume(a1);
}

id GPUTools::Diag::SwizzleMTLTracker::MTLGPUDebugDevice_newDynamicLibraryWithURL(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  id v7 = a3;
  uint64_t v8 = GPUTools::Diag::SwizzleMTLTracker::Tracker;
  uint64_t v9 = *(uint64_t (**)(const char *, void))(GPUTools::Diag::SwizzleMTLTracker::Tracker + 384);
  if (v9 && (v9("MTLGPUDebugDevice_newDynamicLibraryWithURL", 0) & 1) == 0)
  {
    uint64_t v10 = 0;
  }
  else
  {
    uint64_t v10 = (*(void (**)(uint64_t, uint64_t, id, uint64_t))(v8 + 512))(a1, a2, v7, a4);
    if (v10)
    {
      id v11 = *(NSObject **)(v8 + 368);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = ___ZN8GPUTools4Diag17SwizzleMTLTracker42MTLGPUDebugDevice_newDynamicLibraryWithURLEP11objc_objectP13objc_selectorP5NSURLPU15__autoreleasingP7NSError_block_invoke;
      block[3] = &unk_24720;
      id v16 = v7;
      uint64_t v18 = v8;
      id v12 = v10;
      id v17 = v12;
      dispatch_sync(v11, block);
      id v13 = v12;
    }
  }

  return v10;
}

void sub_50DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void ___ZN8GPUTools4Diag17SwizzleMTLTracker42MTLGPUDebugDevice_newDynamicLibraryWithURLEP11objc_objectP13objc_selectorP5NSURLPU15__autoreleasingP7NSError_block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) absoluteString];
  id v3 = [v2 stringByReplacingOccurrencesOfString:@"file://" withString:&stru_24DC8];

  uint64_t v4 = *(void *)(a1 + 48);
  id v5 = [*(id *)(a1 + 40) hash];
  id v7 = v3;
  id v6 = *(id *)(a1 + 40);
  id v8 = v5;
  id v9 = v7;
  long long v10 = 0u;
  id v11 = 0;
  id v12 = v6;
  uint64_t v13 = 0;
  std::__hash_table<std::__hash_value_type<unsigned long,GPUTools::Diag::Library>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,GPUTools::Diag::Library>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,GPUTools::Diag::Library>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,GPUTools::Diag::Library>>>::__emplace_unique_key_args<unsigned long,std::pair<unsigned long const,GPUTools::Diag::Library>>(v4, (unint64_t)v5, (uint64_t *)&v8);
}

void sub_51D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va1, a3);
  va_start(va, a3);
  id v5 = va_arg(va1, id);
  uint64_t v7 = va_arg(va1, void);
  uint64_t v8 = va_arg(va1, void);
  uint64_t v9 = va_arg(va1, void);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  std::pair<unsigned long const,GPUTools::Diag::Library>::~pair((id *)va1);
  GPUTools::Diag::Library::~Library((id *)va);

  _Unwind_Resume(a1);
}

id GPUTools::Diag::SwizzleMTLTracker::MTLGPUDebugLibrary_newFunctionWithName(GPUTools::Diag::SwizzleMTLTracker *this, objc_object *a2, objc_selector *a3, NSString *a4)
{
  id v6 = a3;
  uint64_t v7 = GPUTools::Diag::SwizzleMTLTracker::Tracker;
  uint64_t v8 = *(uint64_t (**)(const char *, objc_selector *))(GPUTools::Diag::SwizzleMTLTracker::Tracker + 384);
  if (v8 && (v8("MTLGPUDebugLibrary_newFunctionWithName", v6) & 1) == 0)
  {
    uint64_t v10 = 0;
  }
  else
  {
    uint64_t v9 = (*(void (**)(GPUTools::Diag::SwizzleMTLTracker *, objc_object *, objc_selector *))(v7 + 520))(this, a2, v6);
    uint64_t v10 = v9;
    if (v9)
    {
      id v11 = v9;
      id v12 = [(GPUTools::Diag::SwizzleMTLTracker *)this hash];
      uint64_t v13 = [v11 unpackedFilePath];
      id v14 = [v13 length];

      if (v14
        || std::__hash_table<std::__hash_value_type<unsigned long,std::vector<unsigned long>>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,std::vector<unsigned long>>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,std::vector<unsigned long>>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,std::vector<unsigned long>>>>::find<unsigned long>((void *)v7, (unint64_t)v12))
      {
        objc_setAssociatedObject(v11, &GPUTools::Diag::AssociatedObjectKey, this, 0);
      }
    }
  }

  return v10;
}

void sub_5314(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void GPUTools::Diag::SwizzleMTLTracker::MTLGPUDebugLibrary_newFunctionWithNameConstantValuesHandler(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  uint64_t v12 = GPUTools::Diag::SwizzleMTLTracker::Tracker;
  uint64_t v13 = *(uint64_t (**)(const char *, id))(GPUTools::Diag::SwizzleMTLTracker::Tracker + 384);
  if (!v13 || (v13("MTLGPUDebugLibrary_newFunctionWithNameConstantValuesHandler", v9) & 1) != 0)
  {
    id v14 = *(void (**)(uint64_t, uint64_t, id, id, void *))(v12 + 528);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = ___ZN8GPUTools4Diag17SwizzleMTLTracker59MTLGPUDebugLibrary_newFunctionWithNameConstantValuesHandlerEP11objc_objectP13objc_selectorP8NSStringP25MTLFunctionConstantValuesU13block_pointerFvPU22objcproto11MTLFunction11objc_objectP7NSErrorE_block_invoke;
    v15[3] = &unk_247D0;
    uint64_t v17 = a1;
    uint64_t v18 = v12;
    id v16 = v11;
    v14(a1, a2, v9, v10, v15);
  }
}

void sub_544C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void ___ZN8GPUTools4Diag17SwizzleMTLTracker59MTLGPUDebugLibrary_newFunctionWithNameConstantValuesHandlerEP11objc_objectP13objc_selectorP8NSStringP25MTLFunctionConstantValuesU13block_pointerFvPU22objcproto11MTLFunction11objc_objectP7NSErrorE_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  if (!v10) {
    goto LABEL_5;
  }
  id v6 = v10;
  id v7 = [*(id *)(a1 + 40) hash];
  uint64_t v8 = [v6 unpackedFilePath];
  id v9 = [v8 length];

  if (v9
    || std::__hash_table<std::__hash_value_type<unsigned long,std::vector<unsigned long>>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,std::vector<unsigned long>>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,std::vector<unsigned long>>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,std::vector<unsigned long>>>>::find<unsigned long>(*(void **)(a1 + 48), (unint64_t)v7))
  {
    objc_setAssociatedObject(v6, &GPUTools::Diag::AssociatedObjectKey, *(id *)(a1 + 40), 0);

LABEL_5:
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    goto LABEL_6;
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();

LABEL_6:
}

void sub_5578(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

id GPUTools::Diag::SwizzleMTLTracker::MTLGPUDebugLibrary_newFunctionWithNameConstantValuesError(void *a1, uint64_t a2, void *a3, void *a4, uint64_t a5)
{
  id v9 = a3;
  id v10 = a4;
  uint64_t v11 = GPUTools::Diag::SwizzleMTLTracker::Tracker;
  uint64_t v12 = *(uint64_t (**)(const char *, id))(GPUTools::Diag::SwizzleMTLTracker::Tracker + 384);
  if (v12 && (v12("MTLGPUDebugLibrary_newFunctionWithNameConstantValuesError", v9) & 1) == 0)
  {
    id v14 = 0;
  }
  else
  {
    uint64_t v13 = (*(void (**)(void *, uint64_t, id, id, uint64_t))(v11 + 536))(a1, a2, v9, v10, a5);
    id v14 = v13;
    if (v13)
    {
      id v15 = v13;
      id v16 = [a1 hash];
      uint64_t v17 = [v15 unpackedFilePath];
      id v18 = [v17 length];

      if (v18
        || std::__hash_table<std::__hash_value_type<unsigned long,std::vector<unsigned long>>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,std::vector<unsigned long>>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,std::vector<unsigned long>>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,std::vector<unsigned long>>>>::find<unsigned long>((void *)v11, (unint64_t)v16))
      {
        objc_setAssociatedObject(v15, &GPUTools::Diag::AssociatedObjectKey, a1, 0);
      }
    }
  }

  return v14;
}

void sub_56D8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void GPUTools::Diag::SwizzleMTLTracker::MTLGPUDebugLibrary_newFunctionWithDescriptorCompletionHandler(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = GPUTools::Diag::SwizzleMTLTracker::Tracker;
  id v10 = *(uint64_t (**)(const char *, void *))(GPUTools::Diag::SwizzleMTLTracker::Tracker + 384);
  if (!v10
    || ([v7 name],
        uint64_t v11 = objc_claimAutoreleasedReturnValue(),
        char v12 = v10("MTLGPUDebugLibrary_newFunctionWithDescriptorCompletionHandler", v11),
        v11,
        (v12 & 1) != 0))
  {
    uint64_t v13 = *(void (**)(uint64_t, uint64_t, id, void *))(v9 + 544);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = ___ZN8GPUTools4Diag17SwizzleMTLTracker61MTLGPUDebugLibrary_newFunctionWithDescriptorCompletionHandlerEP11objc_objectP13objc_selectorP21MTLFunctionDescriptorU13block_pointerFvPU22objcproto11MTLFunction11objc_objectP7NSErrorE_block_invoke;
    v14[3] = &unk_247D0;
    uint64_t v16 = a1;
    uint64_t v17 = v9;
    id v15 = v8;
    v13(a1, a2, v7, v14);
  }
}

void sub_5818(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void ___ZN8GPUTools4Diag17SwizzleMTLTracker61MTLGPUDebugLibrary_newFunctionWithDescriptorCompletionHandlerEP11objc_objectP13objc_selectorP21MTLFunctionDescriptorU13block_pointerFvPU22objcproto11MTLFunction11objc_objectP7NSErrorE_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  if (!v10) {
    goto LABEL_5;
  }
  id v6 = v10;
  id v7 = [*(id *)(a1 + 40) hash];
  id v8 = [v6 unpackedFilePath];
  id v9 = [v8 length];

  if (v9
    || std::__hash_table<std::__hash_value_type<unsigned long,std::vector<unsigned long>>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,std::vector<unsigned long>>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,std::vector<unsigned long>>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,std::vector<unsigned long>>>>::find<unsigned long>(*(void **)(a1 + 48), (unint64_t)v7))
  {
    objc_setAssociatedObject(v6, &GPUTools::Diag::AssociatedObjectKey, *(id *)(a1 + 40), 0);

LABEL_5:
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    goto LABEL_6;
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();

LABEL_6:
}

void sub_594C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

id GPUTools::Diag::SwizzleMTLTracker::MTLGPUDebugLibrary_newFunctionWithDescriptorError(void *a1, uint64_t a2, void *a3, uint64_t a4)
{
  id v7 = a3;
  id v8 = v7;
  uint64_t v9 = GPUTools::Diag::SwizzleMTLTracker::Tracker;
  id v10 = *(uint64_t (**)(const char *, void *))(GPUTools::Diag::SwizzleMTLTracker::Tracker + 384);
  if (v10
    && ([v7 name],
        uint64_t v11 = objc_claimAutoreleasedReturnValue(),
        char v12 = v10("MTLGPUDebugLibrary_newFunctionWithDescriptorError", v11),
        v11,
        (v12 & 1) == 0))
  {
    id v14 = 0;
  }
  else
  {
    uint64_t v13 = (*(void (**)(void *, uint64_t, void *, uint64_t))(v9 + 552))(a1, a2, v8, a4);
    id v14 = v13;
    if (v13)
    {
      id v15 = v13;
      id v16 = [a1 hash];
      uint64_t v17 = [v15 unpackedFilePath];
      id v18 = [v17 length];

      if (v18
        || std::__hash_table<std::__hash_value_type<unsigned long,std::vector<unsigned long>>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,std::vector<unsigned long>>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,std::vector<unsigned long>>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,std::vector<unsigned long>>>>::find<unsigned long>((void *)v9, (unint64_t)v16))
      {
        objc_setAssociatedObject(v15, &GPUTools::Diag::AssociatedObjectKey, a1, 0);
      }
    }
  }

  return v14;
}

void sub_5AA8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void GPUTools::Diag::SwizzleMTLTracker::MTLGPUDebugLibrary_newIntersectionFunctionWithDescriptorCompletionHandler(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v7 = a4;
  id v8 = *(void (**)(uint64_t, uint64_t, uint64_t, void *))(GPUTools::Diag::SwizzleMTLTracker::Tracker + 560);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = ___ZN8GPUTools4Diag17SwizzleMTLTracker73MTLGPUDebugLibrary_newIntersectionFunctionWithDescriptorCompletionHandlerEP11objc_objectP13objc_selectorP33MTLIntersectionFunctionDescriptorU13block_pointerFvPU22objcproto11MTLFunction11objc_objectP7NSErrorE_block_invoke;
  v10[3] = &unk_247D0;
  uint64_t v12 = a1;
  uint64_t v13 = GPUTools::Diag::SwizzleMTLTracker::Tracker;
  id v11 = v7;
  id v9 = v7;
  v8(a1, a2, a3, v10);
}

void sub_5BA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void ___ZN8GPUTools4Diag17SwizzleMTLTracker73MTLGPUDebugLibrary_newIntersectionFunctionWithDescriptorCompletionHandlerEP11objc_objectP13objc_selectorP33MTLIntersectionFunctionDescriptorU13block_pointerFvPU22objcproto11MTLFunction11objc_objectP7NSErrorE_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  if (!v10) {
    goto LABEL_5;
  }
  id v6 = v10;
  id v7 = [*(id *)(a1 + 40) hash];
  id v8 = [v6 unpackedFilePath];
  id v9 = [v8 length];

  if (v9
    || std::__hash_table<std::__hash_value_type<unsigned long,std::vector<unsigned long>>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,std::vector<unsigned long>>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,std::vector<unsigned long>>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,std::vector<unsigned long>>>>::find<unsigned long>(*(void **)(a1 + 48), (unint64_t)v7))
  {
    objc_setAssociatedObject(v6, &GPUTools::Diag::AssociatedObjectKey, *(id *)(a1 + 40), 0);

LABEL_5:
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    goto LABEL_6;
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();

LABEL_6:
}

void sub_5CC4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

id GPUTools::Diag::SwizzleMTLTracker::MTLGPUDebugLibrary_newIntersectionFunctionWithDescriptorError(void *a1)
{
  uint64_t v2 = (void *)GPUTools::Diag::SwizzleMTLTracker::Tracker;
  id v3 = (*(void (**)(void))(GPUTools::Diag::SwizzleMTLTracker::Tracker + 568))();
  uint64_t v4 = v3;
  if (v3)
  {
    id v5 = v3;
    id v6 = [a1 hash];
    id v7 = [v5 unpackedFilePath];
    id v8 = [v7 length];

    if (v8
      || std::__hash_table<std::__hash_value_type<unsigned long,std::vector<unsigned long>>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,std::vector<unsigned long>>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,std::vector<unsigned long>>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,std::vector<unsigned long>>>>::find<unsigned long>(v2, (unint64_t)v6))
    {
      objc_setAssociatedObject(v5, &GPUTools::Diag::AssociatedObjectKey, a1, 0);
    }
  }

  return v4;
}

void sub_5DC0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void GPUTools::Diag::SwizzleMTLTracker::_MTLCommandBuffer_commit(GPUTools::Diag::SwizzleMTLTracker *this, objc_object *a2, objc_selector *a3)
{
  uint64_t v3 = __chkstk_darwin(this);
  uint64_t v5 = v4;
  id v6 = (void *)v3;
  uint64_t v7 = GPUTools::Diag::SwizzleMTLTracker::Tracker;
  id v8 = *(unsigned int (**)(const char *, void))(GPUTools::Diag::SwizzleMTLTracker::Tracker + 384);
  if (!v8 || v8("_MTLCommandBuffer_commit", 0))
  {
    id v9 = v6;
    bzero(__src, 0x1008uLL);
    LODWORD(__src[512]) = backtrace(__src, 512);
    id v10 = [v9 globalTraceObjectID];
    id v11 = *(NSObject **)(v7 + 352);
    id v15 = _NSConcreteStackBlock;
    uint64_t v16 = 3221225472;
    uint64_t v17 = (uint64_t)___ZN8GPUTools4Diag14BacktraceStore15InsertBacktraceENS0_9CallstackEm_block_invoke;
    id v18 = (uint64_t (*)(uint64_t, uint64_t))&__block_descriptor_4152_e5_v8__0l;
    id v19 = (void (*)(uint64_t))(v7 + 240);
    memcpy(v20, __src, 0x1008uLL);
    v20[513] = v10;
    dispatch_async(v11, &v15);
    id v15 = 0;
    uint64_t v16 = (uint64_t)&v15;
    uint64_t v17 = 0x3032000000;
    id v18 = __Block_byref_object_copy_;
    id v19 = __Block_byref_object_dispose_;
    v20[0] = *(id *)(v7 + 360);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = ___ZN8GPUTools4Diag17SwizzleMTLTracker24_MTLCommandBuffer_commitEP11objc_objectP13objc_selector_block_invoke;
    v13[3] = &unk_247F8;
    void v13[4] = &v15;
    uint64_t v12 = objc_retainBlock(v13);
    [v9 addCompletedHandler:v12];
    (*(void (**)(id, uint64_t))(v7 + 576))(v9, v5);

    _Block_object_dispose(&v15, 8);
  }
}

void sub_5FE8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

void ___ZN8GPUTools4Diag17SwizzleMTLTracker24_MTLCommandBuffer_commitEP11objc_objectP13objc_selector_block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(NSObject **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = ___ZN8GPUTools4Diag17SwizzleMTLTracker24_MTLCommandBuffer_commitEP11objc_objectP13objc_selector_block_invoke_2;
  block[3] = &unk_249C0;
  id v7 = v3;
  id v5 = v3;
  dispatch_async(v4, block);
}

void ___ZN8GPUTools4Diag17SwizzleMTLTracker24_MTLCommandBuffer_commitEP11objc_objectP13objc_selector_block_invoke_2(uint64_t a1)
{
}

id GPUTools::Diag::SwizzleMTLTracker::_MTLCommandQueue_commandBufferWithDescriptor(GPUTools::Diag::SwizzleMTLTracker *this, objc_object *a2, objc_selector *a3, MTLCommandBufferDescriptor *a4)
{
  id v6 = a3;
  if (!v6) {
    id v6 = (objc_selector *)objc_opt_new();
  }
  [(objc_selector *)v6 setErrorOptions:1];
  uint64_t v7 = GPUTools::Diag::SwizzleMTLTracker::Tracker;
  id v8 = *(uint64_t (**)(const char *, void))(GPUTools::Diag::SwizzleMTLTracker::Tracker + 384);
  if (v8 && (v8("_MTLCommandQueue_commandBufferWithDescriptor", 0) & 1) == 0)
  {
    id v9 = 0;
  }
  else
  {
    id v9 = (*(void (**)(GPUTools::Diag::SwizzleMTLTracker *, objc_object *, objc_selector *))(v7 + 584))(this, a2, v6);
  }

  return v9;
}

void sub_6194(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void GPUTools::Diag::SwizzleMTLTracker::_MTLCommandEncoder_endEncoding(GPUTools::Diag::SwizzleMTLTracker *this, objc_object *a2, objc_selector *a3)
{
  uint64_t v4 = __chkstk_darwin(this);
  uint64_t v6 = v5;
  uint64_t v7 = (void *)v4;
  uint64_t v8 = GPUTools::Diag::SwizzleMTLTracker::Tracker;
  id v9 = *(unsigned int (**)(const char *, void))(GPUTools::Diag::SwizzleMTLTracker::Tracker + 384);
  if (v9 && !v9("_MTLCommandEncoder_endEncoding", 0)) {
    return;
  }
  bzero(__src, 0x1008uLL);
  LODWORD(__src[512]) = backtrace(__src, 512);
  id v10 = v7;
  id v11 = [v10 globalTraceObjectID];
  uint64_t v12 = *(NSObject **)(v8 + 232);
  *(void *)&long long v67 = _NSConcreteStackBlock;
  *((void *)&v67 + 1) = 3221225472;
  *(void *)&long long v68 = ___ZN8GPUTools4Diag14BacktraceStore15InsertBacktraceENS0_9CallstackEm_block_invoke;
  *((void *)&v68 + 1) = &__block_descriptor_4152_e5_v8__0l;
  v69[0] = v8 + 120;
  memcpy(&v69[1], __src, 0x1008uLL);
  v69[514] = v11;
  dispatch_async(v12, &v67);
  uint64_t v13 = [v10 commandBuffer];
  unint64_t v14 = (unint64_t)[v13 globalTraceObjectID];

  id v15 = (void *)(v8 + 80);
  uint64_t v16 = std::__hash_table<std::__hash_value_type<unsigned long,std::vector<unsigned long>>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,std::vector<unsigned long>>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,std::vector<unsigned long>>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,std::vector<unsigned long>>>>::find<unsigned long>((void *)(v8 + 80), v14);
  if (v16)
  {
    uint64_t v17 = v16;
    id v19 = (char *)v16[4];
    unint64_t v18 = v16[5];
    if ((unint64_t)v19 >= v18)
    {
      unint64_t v26 = (char *)v16[3];
      uint64_t v27 = (v19 - v26) >> 3;
      unint64_t v28 = v27 + 1;
      if ((unint64_t)(v27 + 1) >> 61) {
        abort();
      }
      uint64_t v29 = v18 - (void)v26;
      if (v29 >> 2 > v28) {
        unint64_t v28 = v29 >> 2;
      }
      if ((unint64_t)v29 >= 0x7FFFFFFFFFFFFFF8) {
        unint64_t v30 = 0x1FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v30 = v28;
      }
      if (v30)
      {
        if (v30 >> 61) {
          std::__throw_bad_array_new_length[abi:nn180100]();
        }
        unint64_t v31 = (char *)operator new(8 * v30);
        unint64_t v26 = (char *)v17[3];
        id v19 = (char *)v17[4];
      }
      else
      {
        unint64_t v31 = 0;
      }
      uint8x8_t v42 = &v31[8 * v27];
      unint64_t v43 = &v31[8 * v30];
      *(void *)uint8x8_t v42 = v11;
      id v20 = v42 + 8;
      while (v19 != v26)
      {
        uint64_t v44 = *((void *)v19 - 1);
        v19 -= 8;
        *((void *)v42 - 1) = v44;
        v42 -= 8;
      }
      v17[3] = v42;
      v17[4] = v20;
      v17[5] = v43;
      if (v26) {
        operator delete(v26);
      }
    }
    else
    {
      *(void *)id v19 = v11;
      id v20 = v19 + 8;
    }
    v17[4] = v20;
    goto LABEL_97;
  }
  id v21 = operator new(8uLL);
  *id v21 = v11;
  id v22 = v21 + 1;
  *(void *)&long long v23 = v21;
  *((void *)&v23 + 1) = v21 + 1;
  long long v65 = v23;
  unint64_t v24 = *(void *)(v8 + 88);
  if (!v24) {
    goto LABEL_32;
  }
  uint8x8_t v25 = (uint8x8_t)vcnt_s8((int8x8_t)v24);
  v25.i16[0] = vaddlv_u8(v25);
  if (v25.u32[0] > 1uLL)
  {
    unint64_t v3 = v14;
    if (v14 >= v24) {
      unint64_t v3 = v14 % v24;
    }
  }
  else
  {
    unint64_t v3 = (v24 - 1) & v14;
  }
  uint8x8_t v32 = *(void **)(*v15 + 8 * v3);
  if (!v32 || (uint64_t v33 = (void *)*v32) == 0)
  {
LABEL_32:
    unint64_t v35 = (char *)operator new(0x30uLL);
    v64 = (void *)(v8 + 96);
    *(void *)unint64_t v35 = 0;
    *((void *)v35 + 1) = v14;
    *((void *)v35 + 2) = v14;
    *(_OWORD *)(v35 + 24) = v65;
    *((void *)v35 + 5) = v22;
    float v36 = (float)(unint64_t)(*(void *)(v8 + 104) + 1);
    float v37 = *(float *)(v8 + 112);
    if (v24 && (float)(v37 * (float)v24) >= v36)
    {
LABEL_85:
      v56 = (void *)*v15;
      v57 = *(void **)(*v15 + 8 * v3);
      if (v57)
      {
        *(void *)unint64_t v35 = *v57;
      }
      else
      {
        *(void *)unint64_t v35 = *v64;
        void *v64 = v35;
        v56[v3] = v64;
        if (!*(void *)v35)
        {
LABEL_94:
          ++*(void *)(v8 + 104);
          v62 = 0;
          goto LABEL_95;
        }
        unint64_t v58 = *(void *)(*(void *)v35 + 8);
        if ((v24 & (v24 - 1)) != 0)
        {
          if (v58 >= v24) {
            v58 %= v24;
          }
        }
        else
        {
          v58 &= v24 - 1;
        }
        v57 = (void *)(*v15 + 8 * v58);
      }
      void *v57 = v35;
      goto LABEL_94;
    }
    BOOL v38 = 1;
    if (v24 >= 3) {
      BOOL v38 = (v24 & (v24 - 1)) != 0;
    }
    unint64_t v39 = v38 | (2 * v24);
    unint64_t v40 = vcvtps_u32_f32(v36 / v37);
    if (v39 <= v40) {
      int8x8_t prime = (int8x8_t)v40;
    }
    else {
      int8x8_t prime = (int8x8_t)v39;
    }
    if (*(void *)&prime == 1)
    {
      int8x8_t prime = (int8x8_t)2;
    }
    else if ((*(void *)&prime & (*(void *)&prime - 1)) != 0)
    {
      int8x8_t prime = (int8x8_t)std::__next_prime(*(void *)&prime);
      unint64_t v24 = *(void *)(v8 + 88);
    }
    if (*(void *)&prime > v24) {
      goto LABEL_51;
    }
    if (*(void *)&prime < v24)
    {
      unint64_t v51 = vcvtps_u32_f32((float)*(unint64_t *)(v8 + 104) / *(float *)(v8 + 112));
      if (v24 < 3 || (uint8x8_t v52 = (uint8x8_t)vcnt_s8((int8x8_t)v24), v52.i16[0] = vaddlv_u8(v52), v52.u32[0] > 1uLL))
      {
        unint64_t v51 = std::__next_prime(v51);
      }
      else
      {
        uint64_t v53 = 1 << -(char)__clz(v51 - 1);
        if (v51 >= 2) {
          unint64_t v51 = v53;
        }
      }
      if (*(void *)&prime <= v51) {
        int8x8_t prime = (int8x8_t)v51;
      }
      if (*(void *)&prime >= v24)
      {
        unint64_t v24 = *(void *)(v8 + 88);
      }
      else
      {
        if (prime)
        {
LABEL_51:
          if (*(void *)&prime >> 61) {
            std::__throw_bad_array_new_length[abi:nn180100]();
          }
          uint64_t v45 = operator new(8 * *(void *)&prime);
          v46 = (void *)*v15;
          *id v15 = v45;
          if (v46) {
            operator delete(v46);
          }
          uint64_t v47 = 0;
          *(int8x8_t *)(v8 + 88) = prime;
          do
            *(void *)(*v15 + 8 * v47++) = 0;
          while (*(void *)&prime != v47);
          uint64_t v48 = (void *)*v64;
          if (*v64)
          {
            unint64_t v49 = v48[1];
            uint8x8_t v50 = (uint8x8_t)vcnt_s8(prime);
            v50.i16[0] = vaddlv_u8(v50);
            if (v50.u32[0] > 1uLL)
            {
              if (v49 >= *(void *)&prime) {
                v49 %= *(void *)&prime;
              }
            }
            else
            {
              v49 &= *(void *)&prime - 1;
            }
            *(void *)(*v15 + 8 * v49) = v64;
            id v54 = (void *)*v48;
            if (*v48)
            {
              do
              {
                unint64_t v55 = v54[1];
                if (v50.u32[0] > 1uLL)
                {
                  if (v55 >= *(void *)&prime) {
                    v55 %= *(void *)&prime;
                  }
                }
                else
                {
                  v55 &= *(void *)&prime - 1;
                }
                if (v55 != v49)
                {
                  if (!*(void *)(*v15 + 8 * v55))
                  {
                    *(void *)(*v15 + 8 * v55) = v48;
                    goto LABEL_76;
                  }
                  *uint64_t v48 = *v54;
                  *id v54 = **(void **)(*v15 + 8 * v55);
                  **(void **)(*v15 + 8 * v55) = v54;
                  id v54 = v48;
                }
                unint64_t v55 = v49;
LABEL_76:
                uint64_t v48 = v54;
                id v54 = (void *)*v54;
                unint64_t v49 = v55;
              }
              while (v54);
            }
          }
          unint64_t v24 = (unint64_t)prime;
          goto LABEL_80;
        }
        BOOL v63 = (void *)*v15;
        *id v15 = 0;
        if (v63) {
          operator delete(v63);
        }
        unint64_t v24 = 0;
        *(void *)(v8 + 88) = 0;
      }
    }
LABEL_80:
    if ((v24 & (v24 - 1)) != 0)
    {
      if (v14 >= v24) {
        unint64_t v3 = v14 % v24;
      }
      else {
        unint64_t v3 = v14;
      }
    }
    else
    {
      unint64_t v3 = (v24 - 1) & v14;
    }
    goto LABEL_85;
  }
  while (1)
  {
    unint64_t v34 = v33[1];
    if (v34 == v14) {
      break;
    }
    if (v25.u32[0] > 1uLL)
    {
      if (v34 >= v24) {
        v34 %= v24;
      }
    }
    else
    {
      v34 &= v24 - 1;
    }
    if (v34 != v3) {
      goto LABEL_32;
    }
LABEL_31:
    uint64_t v33 = (void *)*v33;
    if (!v33) {
      goto LABEL_32;
    }
  }
  if (v33[2] != v14) {
    goto LABEL_31;
  }
  v62 = (void *)v65;
LABEL_95:
  if (v62) {
    operator delete(v62);
  }
LABEL_97:
  unint64_t v59 = (unint64_t)[v10 getType];
  if (v59 >= 7) {
    v60 = "_MTLCommandEncoder";
  }
  else {
    v60 = (&off_24880)[v59];
  }
  memset(v69, 0, 224);
  long long v67 = 0u;
  long long v68 = 0u;
  snprintf((char *)&v67, 0x100uLL, "%s_%lu%s", "GPUToolsDebugInfo", v11, v60);
  v61 = +[NSString stringWithUTF8String:&v67];
  [v10 insertDebugSignpost:v61];

  (*(void (**)(id, uint64_t))(v8 + 592))(v10, v6);
}

void sub_689C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, long long a13)
{
  std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<unsigned long,std::vector<unsigned long>>,void *>>>::operator()[abi:nn180100](1, v14);

  _Unwind_Resume(a1);
}

void ___ZN8GPUTools4Diag17SwizzleMTLTrackerC2EP11GTTransportPFbPKcP11objc_objectE_block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained) {
    [*(id *)(a1 + 32) dispatchMessage:v4 replyConnection:WeakRetained];
  }
}

void sub_697C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

uint64_t std::__hash_table<std::__hash_value_type<unsigned long,std::vector<unsigned long>>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,std::vector<unsigned long>>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,std::vector<unsigned long>>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,std::vector<unsigned long>>>>::~__hash_table(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 16);
  if (v2)
  {
    do
    {
      unint64_t v3 = (void *)*v2;
      id v4 = (void *)v2[3];
      if (v4)
      {
        v2[4] = v4;
        operator delete(v4);
      }
      operator delete(v2);
      uint64_t v2 = v3;
    }
    while (v3);
  }
  uint64_t v5 = *(void **)a1;
  *(void *)a1 = 0;
  if (v5) {
    operator delete(v5);
  }
  return a1;
}

uint64_t std::__hash_table<unsigned long,std::hash<unsigned long>,std::equal_to<unsigned long>,std::allocator<unsigned long>>::~__hash_table(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 16);
  if (v2)
  {
    do
    {
      unint64_t v3 = (void *)*v2;
      operator delete(v2);
      uint64_t v2 = v3;
    }
    while (v3);
  }
  id v4 = *(void **)a1;
  *(void *)a1 = 0;
  if (v4) {
    operator delete(v4);
  }
  return a1;
}

uint64_t std::__hash_table<std::__hash_value_type<unsigned long,GPUTools::Diag::Library>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,GPUTools::Diag::Library>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,GPUTools::Diag::Library>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,GPUTools::Diag::Library>>>::~__hash_table(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 16);
  if (v2)
  {
    do
    {
      unint64_t v3 = (void *)*v2;
      std::__destroy_at[abi:nn180100]<std::pair<unsigned long const,GPUTools::Diag::Library>,0>((uint64_t)(v2 + 2));
      operator delete(v2);
      uint64_t v2 = v3;
    }
    while (v3);
  }
  id v4 = *(void **)a1;
  *(void *)a1 = 0;
  if (v4) {
    operator delete(v4);
  }
  return a1;
}

void GTToolsDiagnostics_DylibMain(void)
{
  v0 = +[NSBundle mainBundle];
  uint64_t v1 = [v0 infoDictionary];

  unint64_t v31 = (void *)v1;
  if (v1)
  {
    long long v36 = 0uLL;
    float v37 = 0;
    uint64_t v2 = +[NSProcessInfo processInfo];
    unint64_t v3 = v2;
    if (v2)
    {
      [v2 operatingSystemVersion];
    }
    else
    {
      long long v36 = 0uLL;
      float v37 = 0;
    }

    id v4 = +[NSString stringWithFormat:@"%lu.%lu", v36];
    uint64_t v5 = [v31 objectForKeyedSubscript:@"LSMinimumSystemVersion"];
    if (v5) {
      [v31 objectForKeyedSubscript:@"LSMinimumSystemVersion"];
    }
    else {
    uint64_t v6 = [v31 objectForKeyedSubscript:@"MinimumOSVersion"];
    }

    if (v6 && ([v4 isEqualToString:v6] & 1) == 0)
    {
      uint64_t v7 = os_log_create("com.apple.runtime-issues", "Metal Diagnostics Warning");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        id v33 = [v6 UTF8String];
        __int16 v34 = 2080;
        id v35 = [v4 UTF8String];
        _os_log_fault_impl(&dword_0, v7, OS_LOG_TYPE_FAULT, "Application Deployment Target Version (%s) does not match OS Version (%s) - diagnostics may be missing debug information", buf, 0x16u);
      }
    }
  }
  uint64_t v8 = getenv("GT_HOST_URL_MTL_DIAGNOSTICS");
  if (!v8)
  {

    goto LABEL_39;
  }
  id v9 = v8;
  id v10 = +[NSString stringWithCString:v8 encoding:4];
  if (!v10) {
    __assert_rtn("GTTransport *DYCreateTransportC(const char *)", "", 0, "url_str");
  }
  id v11 = +[NSURL URLWithString:v10];
  uint64_t v12 = v11;
  if (!v11)
  {
    if (s_logUsingOsLog)
    {
      uint64_t v27 = gt_default_log();
      if (!os_log_type_enabled(v27, OS_LOG_TYPE_FAULT)) {
        goto LABEL_48;
      }
      LODWORD(v36) = 136315138;
      *(void *)((char *)&v36 + 4) = v9;
      unint64_t v28 = "fail: [create_transport] failed to parse GT_HOST_URL: %s";
LABEL_47:
      _os_log_fault_impl(&dword_0, v27, OS_LOG_TYPE_FAULT, v28, (uint8_t *)&v36, 0xCu);
      goto LABEL_48;
    }
    uint64_t v29 = __stderrp;
    unint64_t v30 = [+[NSString stringWithFormat:@"fail: [create_transport] failed to parse GT_HOST_URL: %s", v9] UTF8String];
LABEL_52:
    fprintf(v29, "%s\n", v30);
LABEL_48:
    abort();
  }
  uint64_t v13 = [(NSURL *)v11 scheme];
  if ([(NSString *)v13 isEqualToString:@"null"])
  {
    id v14 = 0;
    goto LABEL_26;
  }
  if ([(NSString *)v13 isEqualToString:@"file"])
  {
    uint64_t v17 = off_245B8;
  }
  else
  {
    if (![(NSString *)v13 isEqualToString:@"dysmt"]
      && ![(NSString *)v13 isEqualToString:@"dysmtdeferred"])
    {
      goto LABEL_44;
    }
    uint64_t v17 = off_245B0;
  }
  id v14 = [objc_alloc(*v17) initWithMode:1];
  [v14 setUrl:v12];
  if (!v14)
  {
LABEL_44:
    if (s_logUsingOsLog)
    {
      uint64_t v27 = gt_default_log();
      if (!os_log_type_enabled(v27, OS_LOG_TYPE_FAULT)) {
        goto LABEL_48;
      }
      LODWORD(v36) = 136315138;
      *(void *)((char *)&v36 + 4) = v9;
      unint64_t v28 = "fail: [create_transport] failed to create transport; GT_HOST_URL: %s";
      goto LABEL_47;
    }
    uint64_t v29 = __stderrp;
    unint64_t v30 = -[NSString UTF8String](+[NSString stringWithFormat:](NSString, "stringWithFormat:", @"fail: [create_transport] failed to create transport; GT_HOST_URL: %s",
              v9),
            "UTF8String");
    goto LABEL_52;
  }
LABEL_26:

  {
    id v19 = dispatch_queue_create("gputools.diagnostics_sync", 0);
    [v20 setMessageHandler:&__block_literal_global_6];
    dispatch_semaphore_t v21 = dispatch_semaphore_create(0);
    *(void *)&long long v36 = _NSConcreteStackBlock;
    *((void *)&v36 + 1) = 3221225472;
    float v37 = ___ZL24InitTransportWithHostURLPKc_block_invoke_54;
    BOOL v38 = &unk_249C0;
    id v22 = v21;
    unint64_t v39 = v22;
    [v20 setRegistrationHandler:&v36];
    [v20 resume];
    long long v23 = dispatch_semaphore_wait(v22, 0xFFFFFFFFFFFFFFFFLL);
    if (([v23 BOOLResult] & 1) == 0)
    {
      if (s_logUsingOsLog)
      {
        unint64_t v24 = gt_default_log();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_fault_impl(&dword_0, v24, OS_LOG_TYPE_FAULT, "fail: Failed to connect to transport in tools diagnostics dylib", buf, 2u);
        }
      }
      else
      {
        unint64_t v26 = __stderrp;
        unint64_t v24 = +[NSString stringWithFormat:@"fail: Failed to connect to transport in tools diagnostics dylib"];
        fprintf(v26, "%s\n", (const char *)[v24 UTF8String]);
      }
    }
  }
  else if (s_logUsingOsLog)
  {
    id v19 = gt_default_log();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
    {
      LOWORD(v36) = 0;
      _os_log_fault_impl(&dword_0, v19, OS_LOG_TYPE_FAULT, "fail: Failed to init transport in tools diagnostics dylib", (uint8_t *)&v36, 2u);
    }
  }
  else
  {
    uint8x8_t v25 = __stderrp;
    id v19 = +[NSString stringWithFormat:@"fail: Failed to init transport in tools diagnostics dylib"];
    fprintf(v25, "%s\n", (const char *)[v19 UTF8String]);
  }

  {
LABEL_39:
    v16;
    operator new();
  }
}

void sub_82E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,void *a26,id location)
{
  _Unwind_Resume(a1);
}

void GTToolsDiagnostics_DylibExit(void)
{
  {
    uint64_t v1 = (void *)GPUTools::Diag::SwizzleMTLTracker::Transport;
    GPUTools::Diag::SwizzleMTLTracker::Transport = 0;

    GPUTools::Diag::SwizzleMTLTracker::Tracker = 0;
    id v2 = v0[46];
    v0[46] = 0;

    id v3 = v0[45];
    v0[45] = 0;

    GPUTools::Diag::BacktraceStore::~BacktraceStore((GPUTools::Diag::BacktraceStore *)(v0 + 30));
    GPUTools::Diag::BacktraceStore::~BacktraceStore((GPUTools::Diag::BacktraceStore *)(v0 + 15));
    std::__hash_table<std::__hash_value_type<unsigned long,std::vector<unsigned long>>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,std::vector<unsigned long>>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,std::vector<unsigned long>>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,std::vector<unsigned long>>>>::~__hash_table((uint64_t)(v0 + 10));
    std::__hash_table<unsigned long,std::hash<unsigned long>,std::equal_to<unsigned long>,std::allocator<unsigned long>>::~__hash_table((uint64_t)(v0 + 5));
    std::__hash_table<std::__hash_value_type<unsigned long,GPUTools::Diag::Library>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,GPUTools::Diag::Library>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,GPUTools::Diag::Library>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,GPUTools::Diag::Library>>>::~__hash_table((uint64_t)v0);
    operator delete();
  }
}

intptr_t ___ZL24InitTransportWithHostURLPKc_block_invoke_54(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void ___ZL24InitTransportWithHostURLPKc_block_invoke(id a1, GTTransportMessage_tools_diagnostics *a2)
{
  id v2 = a2;
  if ([(GTTransportMessage_tools_diagnostics *)v2 kind] == 4353)
  {
    id v3 = [(GTTransportMessage_tools_diagnostics *)v2 plistPayload];
    id v4 = [v3 objectForKeyedSubscript:@"message"];
    id v5 = [v4 cStringUsingEncoding:4];
    uint64_t v6 = os_log_create("com.apple.runtime-issues", "Metal Diagnostics");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
      int v7 = 136315138;
      id v8 = v5;
      _os_log_fault_impl(&dword_0, v6, OS_LOG_TYPE_FAULT, "%s", (uint8_t *)&v7, 0xCu);
    }
  }
}

void sub_8808(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

CFStringRef _StringForError(uint64_t a1)
{
  if (a1 <= 511)
  {
    switch(a1)
    {
      case 1:
        return (const __CFString *)+[NSString stringWithFormat:@"invalid filename (%ld)", 1];
      case 2:
        return (const __CFString *)+[NSString stringWithFormat:@"data is too large (%ld)", 2];
      case 3:
        return (const __CFString *)+[NSString stringWithFormat:@"IO failure (%ld)", 3];
      case 4:
        return (const __CFString *)+[NSString stringWithFormat:@"out of memory (%ld)", 4];
      case 5:
        uint64_t v3 = 5;
        goto LABEL_64;
      case 6:
        uint64_t v3 = 6;
LABEL_64:
        CFStringRef result = +[NSString stringWithFormat:@"Unable to connect to the device. (%ld)", v3];
        break;
      case 7:
        CFStringRef result = +[NSString stringWithFormat:@"read-only capture archive (%ld)", 7];
        break;
      case 8:
        CFStringRef result = +[NSString stringWithFormat:@"truncated capture archive store (%ld)", 8];
        break;
      case 9:
        CFStringRef result = +[NSString stringWithFormat:@"truncated capture archive index (%ld)", 9];
        break;
      case 10:
        CFStringRef result = +[NSString stringWithFormat:@"invalid capture archive index (%ld)", 10];
        break;
      case 11:
        CFStringRef result = +[NSString stringWithFormat:@"unknown capture archive index version (%ld)", 11];
        break;
      case 12:
        CFStringRef result = +[NSString stringWithFormat:@"file exists in capture archive (%ld)", 12];
        break;
      case 13:
        CFStringRef result = +[NSString stringWithFormat:@"file does not exists in capture archive (%ld)", 13];
        break;
      case 14:
        CFStringRef result = +[NSString stringWithFormat:@"capture archive does not exist (%ld)", 14];
        break;
      case 15:
        CFStringRef result = +[NSString stringWithFormat:@"missing capture archive index (%ld)", 15];
        break;
      case 16:
        CFStringRef result = +[NSString stringWithFormat:@"invalid capture archive metadata (%ld)", 16];
        break;
      case 17:
      case 27:
        return 0;
      case 18:
        CFStringRef result = +[NSString stringWithFormat:@"corrupted capture archive store (%ld)", 18];
        break;
      case 19:
        CFStringRef result = +[NSString stringWithFormat:@"could not write capture archive metadata (%ld)", 19];
        break;
      case 20:
        CFStringRef result = +[NSString stringWithFormat:@"capture archive has been closed (%ld)", 20];
        break;
      case 21:
        CFStringRef result = +[NSString stringWithFormat:@"already tried to launch guest app (%ld)", 21];
        break;
      case 22:
        CFStringRef result = +[NSString stringWithFormat:@"invalid launch dictionary (%ld)", 22];
        break;
      case 23:
        CFStringRef result = +[NSString stringWithFormat:@"guest app not found (%ld)", 23];
        break;
      case 24:
        CFStringRef result = +[NSString stringWithFormat:@"guest app launch timed out (%ld)", 24];
        break;
      case 25:
        CFStringRef result = +[NSString stringWithFormat:@"invalid guest app session (%ld)", 25];
        break;
      case 26:
        CFStringRef result = +[NSString stringWithFormat:@"guest app has not been launched yet (%ld)", 26];
        break;
      case 28:
        CFStringRef result = +[NSString stringWithFormat:@"did not find interpose dylib (%ld)", 28];
        break;
      case 29:
        CFStringRef result = +[NSString stringWithFormat:@"failed to launch guest app (%ld)", 29];
        break;
      case 30:
        CFStringRef result = +[NSString stringWithFormat:@"guest app terminated (%ld)", 30];
        break;
      case 31:
        CFStringRef result = +[NSString stringWithFormat:@"lost transport connection (%ld)", 31];
        break;
      case 32:
        CFStringRef result = +[NSString stringWithFormat:@"invalid transport (%ld)", 32];
        break;
      case 33:
        CFStringRef result = +[NSString stringWithFormat:@"transport is not connected (%ld)", 33];
        break;
      case 34:
        CFStringRef result = +[NSString stringWithFormat:@"message has already been sent (%ld)", 34];
        break;
      case 35:
        CFStringRef result = +[NSString stringWithFormat:@"in-reply-to message has not been sent (%ld)", 35];
        break;
      case 36:
        CFStringRef result = +[NSString stringWithFormat:@"failed to encode message attributes (%ld)", 36];
        break;
      case 37:
        CFStringRef result = +[NSString stringWithFormat:@"connect timed out (%ld)", 37];
        break;
      case 38:
        CFStringRef result = +[NSString stringWithFormat:@"undefined socket path (%ld)", 38];
        break;
      case 39:
        CFStringRef result = +[NSString stringWithFormat:@"socket path is too long (%ld)", 39];
        break;
      case 40:
        CFStringRef result = +[NSString stringWithFormat:@"message originated from this transport (%ld)", 40];
        break;
      case 41:
        CFStringRef result = +[NSString stringWithFormat:@"initialized function stream with immutable data but swapping is required (%ld)", 41];
        break;
      case 42:
        CFStringRef result = +[NSString stringWithFormat:@"transfer refused (%ld)", 42];
        break;
      case 43:
        CFStringRef result = +[NSString stringWithFormat:@"protocol error (%ld)", 43];
        break;
      case 44:
        CFStringRef result = +[NSString stringWithFormat:@"path outside destination root (%ld)", 44];
        break;
      case 45:
        CFStringRef result = +[NSString stringWithFormat:@"transfer aborted (%ld)", 45];
        break;
      case 46:
        CFStringRef result = +[NSString stringWithFormat:@"unknown item type (%ld)", 46];
        break;
      default:
        switch(a1)
        {
          case 256:
            CFStringRef result = +[NSString stringWithFormat:@"invalid socket descriptor (%ld)", 256];
            break;
          case 257:
            CFStringRef result = +[NSString stringWithFormat:@"invalid socket url (%ld)", 257];
            break;
          case 258:
            CFStringRef result = +[NSString stringWithFormat:@"transport source cancelled (%ld)", 258];
            break;
          case 259:
            CFStringRef result = +[NSString stringWithFormat:@"corrupt transport message header (%ld)", 259];
            break;
          case 260:
            CFStringRef result = +[NSString stringWithFormat:@"corrupt transport message attributes (%ld)", 260];
            break;
          case 261:
            CFStringRef result = +[NSString stringWithFormat:@"message too large (%ld)", 261];
            break;
          default:
            return 0;
        }
        break;
    }
    return result;
  }
  if (a1 <= 2047)
  {
    if (a1 <= 1023)
    {
      uint64_t v2 = a1 - 512;
      CFStringRef result = @"Device connection lost.";
      switch(v2)
      {
        case 0:
          CFStringRef result = +[NSString stringWithFormat:@"guest app crashed (%ld)", 512];
          break;
        case 1:
          CFStringRef result = +[NSString stringWithFormat:@"another capture session is active (%ld)", 513];
          break;
        case 2:
          CFStringRef result = +[NSString stringWithFormat:@"capture session is already active (%ld)", 514];
          break;
        case 3:
          CFStringRef result = +[NSString stringWithFormat:@"capture session activation failed (%ld)", 515];
          break;
        case 4:
          CFStringRef result = +[NSString stringWithFormat:@"inferior already running (%ld)", 516];
          break;
        case 5:
          CFStringRef result = +[NSString stringWithFormat:@"GL dispatch table mismatch (%ld)", 517];
          break;
        case 6:
          CFStringRef result = +[NSString stringWithFormat:@"inferior and host session ids mismatch (%ld)", 518];
          break;
        case 7:
          return result;
        default:
          return 0;
      }
      return result;
    }
    if (a1 <= 1279)
    {
      switch(a1)
      {
        case 1024:
          return (const __CFString *)+[NSString stringWithFormat:@"truncated data (%ld)", 1024];
        case 1025:
          return (const __CFString *)+[NSString stringWithFormat:@"invalid transport message payload (%ld)", 1025];
        case 1026:
          return (const __CFString *)+[NSString stringWithFormat:@"unexpected transport message (%ld)", 1026];
      }
    }
    else if (a1 > 1791)
    {
      if (a1 == 1792) {
        return (const __CFString *)+[NSString stringWithFormat:@"no data (%ld)", 1792];
      }
      if (a1 == 1793) {
        return (const __CFString *)+[NSString stringWithFormat:@"guest app session error (%ld)", 1793];
      }
    }
    else
    {
      if (a1 == 1280) {
        return (const __CFString *)+[NSString stringWithFormat:@"invalid function stream header (%ld)", 1280];
      }
      if (a1 == 1536) {
        return (const __CFString *)+[NSString stringWithFormat:@"position does not exist in archive (%ld)", 1536];
      }
    }
    return 0;
  }
  if (a1 <= 4351)
  {
    if (a1 > 2304)
    {
      switch(a1)
      {
        case 2305:
          return (const __CFString *)+[NSString stringWithFormat:@"no archive data (%ld)", 2305];
        case 2306:
          return (const __CFString *)+[NSString stringWithFormat:@"no thumbnail support (%ld)", 2306];
        case 4096:
          return (const __CFString *)+[NSString stringWithFormat:@"failed to create core symbolicator (%ld)", 4096];
      }
    }
    else
    {
      switch(a1)
      {
        case 2048:
          return (const __CFString *)+[NSString stringWithFormat:@"already replaying (%ld)", 2048];
        case 2049:
          return (const __CFString *)+[NSString stringWithFormat:@"no loaded archives (%ld)", 2049];
        case 2304:
          return (const __CFString *)+[NSString stringWithFormat:@"no resource streamer (%ld)", 2304];
      }
    }
    return 0;
  }
  switch(a1)
  {
    case 4608:
      CFStringRef result = +[NSString stringWithFormat:@"Cannot find the specified username and host (%ld)", 4608];
      break;
    case 4609:
      CFStringRef result = +[NSString stringWithFormat:@"Specified remote machine is not available. Please make sure to login with specified user (%ld)", 4609];
      break;
    case 4610:
      CFStringRef result = +[NSString stringWithFormat:@"Cannot find the target path provided (%ld)", 4610];
      break;
    case 4611:
      CFStringRef result = +[NSString stringWithFormat:@"Cannot authenticate SSH, make sure the authentication is done right (%ld)", 4611];
      break;
    case 4612:
      CFStringRef result = +[NSString stringWithFormat:@"Cannot find Xcode.app on the remote machine. Please make sure that Xcode.app is in the Applications folder (%ld)", 4612];
      break;
    case 4613:
      CFStringRef result = +[NSString stringWithFormat:@"Metal.framework is not available on the remote machine (%ld)", 4613];
      break;
    case 4614:
      CFStringRef result = +[NSString stringWithFormat:@"Missing environment variables, please make sure all the required environment variables are enabled (%ld)", 4614];
      break;
    default:
      if (a1 == 4352)
      {
        CFStringRef result = +[NSString stringWithFormat:@"Shader profiler failed due to an internal error (%ld)", 4352];
      }
      else
      {
        if (a1 != 4353) {
          return 0;
        }
        CFStringRef result = +[NSString stringWithFormat:@"Shader profiler does not support multi-context captures (%ld)", 4353];
      }
      break;
  }
  return result;
}

void sub_9A1C(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void std::__hash_table<std::__hash_value_type<long long,objc_object  {objcproto8NSObject}*>,std::__unordered_map_hasher<long long,objc_object  {objcproto8NSObject}*,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,objc_object  {objcproto8NSObject}*,std::equal_to,std::hash,true>,std::allocator<objc_object  {objcproto8NSObject}*>>::__rehash<true>(uint64_t a1, size_t __n)
{
  if (__n == 1)
  {
    size_t prime = 2;
  }
  else
  {
    size_t prime = __n;
    if ((__n & (__n - 1)) != 0) {
      size_t prime = std::__next_prime(__n);
    }
  }
  int8x8_t v4 = *(int8x8_t *)(a1 + 8);
  if (prime <= *(void *)&v4)
  {
    if (prime >= *(void *)&v4) {
      return;
    }
    unint64_t v11 = vcvtps_u32_f32((float)*(unint64_t *)(a1 + 24) / *(float *)(a1 + 32));
    if (*(void *)&v4 < 3uLL || (uint8x8_t v12 = (uint8x8_t)vcnt_s8(v4), v12.i16[0] = vaddlv_u8(v12), v12.u32[0] > 1uLL))
    {
      unint64_t v11 = std::__next_prime(v11);
    }
    else
    {
      uint64_t v13 = 1 << -(char)__clz(v11 - 1);
      if (v11 >= 2) {
        unint64_t v11 = v13;
      }
    }
    if (prime <= v11) {
      size_t prime = v11;
    }
    if (prime >= *(void *)&v4) {
      return;
    }
    if (!prime)
    {
      uint64_t v16 = *(void **)a1;
      *(void *)a1 = 0;
      if (v16) {
        operator delete(v16);
      }
      *(void *)(a1 + 8) = 0;
      return;
    }
  }
  if (prime >> 61) {
    std::__throw_bad_array_new_length[abi:nn180100]();
  }
  id v5 = operator new(8 * prime);
  uint64_t v6 = *(void **)a1;
  *(void *)a1 = v5;
  if (v6) {
    operator delete(v6);
  }
  uint64_t v7 = 0;
  *(void *)(a1 + 8) = prime;
  do
    *(void *)(*(void *)a1 + 8 * v7++) = 0;
  while (prime != v7);
  id v8 = *(void **)(a1 + 16);
  if (v8)
  {
    size_t v9 = v8[1];
    uint8x8_t v10 = (uint8x8_t)vcnt_s8((int8x8_t)prime);
    v10.i16[0] = vaddlv_u8(v10);
    if (v10.u32[0] > 1uLL)
    {
      if (v9 >= prime) {
        v9 %= prime;
      }
    }
    else
    {
      v9 &= prime - 1;
    }
    *(void *)(*(void *)a1 + 8 * v9) = a1 + 16;
    id v14 = (void *)*v8;
    if (*v8)
    {
      do
      {
        size_t v15 = v14[1];
        if (v10.u32[0] > 1uLL)
        {
          if (v15 >= prime) {
            v15 %= prime;
          }
        }
        else
        {
          v15 &= prime - 1;
        }
        if (v15 != v9)
        {
          if (!*(void *)(*(void *)a1 + 8 * v15))
          {
            *(void *)(*(void *)a1 + 8 * v15) = v8;
            goto LABEL_31;
          }
          *id v8 = *v14;
          void *v14 = **(void **)(*(void *)a1 + 8 * v15);
          **(void **)(*(void *)a1 + 8 * v15) = v14;
          id v14 = v8;
        }
        size_t v15 = v9;
LABEL_31:
        id v8 = v14;
        id v14 = (void *)*v14;
        size_t v9 = v15;
      }
      while (v14);
    }
  }
}

void sub_9D40(_Unwind_Exception *a1)
{
  std::__hash_table<unsigned long,std::hash<unsigned long>,std::equal_to<unsigned long>,std::allocator<unsigned long>>::~__hash_table(v1);
  _Unwind_Resume(a1);
}

void sub_A1B4()
{
  std::__hash_table<unsigned long,std::hash<unsigned long>,std::equal_to<unsigned long>,std::allocator<unsigned long>>::~__hash_table(v0);
  operator delete();
}

void sub_BF68(_Unwind_Exception *exception_object)
{
}

void sub_BFA0(void *exc_buf, int a2)
{
  if (a2)
  {
    objc_begin_catch(exc_buf);
    if (a2 == 2)
    {
      *(void *)(v2 + 40) = 0;
      objc_end_catch();
    }
    JUMPOUT(0xBEFCLL);
  }
  JUMPOUT(0xBF90);
}

void __clang_call_terminate(void *a1)
{
}

void __Block_byref_object_copy__80(uint64_t a1, uint64_t a2)
{
}

void __Block_byref_object_dispose__81(uint64_t a1)
{
}

void sub_E960(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t GPUTools::VMBuffer::_alloc(GPUTools::VMBuffer *this, vm_size_t a2, uint64_t a3)
{
  int v3 = 0;
  vm_address_t address = 0;
  if (3 * vm_page_size <= a2) {
    vm_size_t v4 = (a2 + vm_page_size - 1) & -(uint64_t)vm_page_size;
  }
  else {
    vm_size_t v4 = 3 * vm_page_size;
  }
  vm_size_t v5 = v4 + v4 * a3;
  while (1)
  {
    vm_map_t v6 = mach_task_self_;
    vm_size_t v7 = vm_page_size + v5;
    if (!vm_allocate(mach_task_self_, &address, vm_page_size + v5, 1))
    {
      vm_address_t v8 = address;
      vm_address_t v9 = address + v4;
      target_vm_address_t address = address + v4;
      uint64_t v10 = a3;
      if (a3)
      {
        while (!vm_deallocate(v6, v9, v4))
        {
          uint64_t cur_protection = 0;
          if (vm_remap(v6, &target_address, v4, 0, 0, v6, address, 0, (vm_prot_t *)&cur_protection + 1, (vm_prot_t *)&cur_protection, 2u))
          {
            break;
          }
          vm_address_t v9 = target_address + v4;
          target_address += v4;
          if (!--v10)
          {
            vm_address_t v8 = address;
            goto LABEL_11;
          }
        }
        goto LABEL_12;
      }
LABEL_11:
      if (!vm_protect(v6, v8 + v7 - vm_page_size, vm_page_size, 0, 0)) {
        break;
      }
    }
LABEL_12:
    vm_deallocate(mach_task_self_, address, vm_page_size + v5);
    if (++v3 == 5) {
      return 0;
    }
  }
  *(void *)this = address;
  *((void *)this + 1) = v4;
  *((void *)this + 2) = a3;
  return 1;
}

vm_address_t *GPUTools::VMBuffer::_dealloc(vm_address_t *this)
{
  if (*this)
  {
    uint64_t v1 = this;
    this = (vm_address_t *)vm_deallocate(mach_task_self_, *this, vm_page_size + this[1] + this[1] * this[2]);
    v1[1] = 0;
    v1[2] = 0;
    vm_address_t *v1 = 0;
  }
  return this;
}

void sub_F3E8()
{
}

void sub_F4A8()
{
}

void sub_1183C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t smt_poll_thread_entry(void *a1)
{
  uint64_t v2 = a1[1];
  int v3 = (void *)a1[2];
  snprintf(__str, 0x40uLL, "gputools.smt_poll.%p", a1);
  pthread_setname_np(__str);
  while (!*((unsigned char *)a1 + 24))
  {
    dispatch_sync(v2, v3);
    usleep(0x1F40u);
  }

  return 0;
}

void sub_1294C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void GPUTools::Diag::BacktraceStore::~BacktraceStore(GPUTools::Diag::BacktraceStore *this)
{
  uint64_t v2 = (void *)*((void *)this + 14);
  *((void *)this + 14) = 0;

  int v3 = (void *)*((void *)this + 11);
  if (v3)
  {
    do
    {
      vm_size_t v4 = (void *)*v3;
      operator delete(v3);
      int v3 = v4;
    }
    while (v4);
  }
  vm_size_t v5 = (void *)*((void *)this + 9);
  *((void *)this + 9) = 0;
  if (v5) {
    operator delete(v5);
  }
  vm_map_t v6 = (void **)*((void *)this + 4);
  vm_size_t v7 = (void **)*((void *)this + 5);
  *((void *)this + 8) = 0;
  unint64_t v8 = (char *)v7 - (char *)v6;
  if ((unint64_t)((char *)v7 - (char *)v6) >= 0x11)
  {
    do
    {
      operator delete(*v6);
      vm_size_t v7 = (void **)*((void *)this + 5);
      vm_map_t v6 = (void **)(*((void *)this + 4) + 8);
      *((void *)this + 4) = v6;
      unint64_t v8 = (char *)v7 - (char *)v6;
    }
    while ((unint64_t)((char *)v7 - (char *)v6) > 0x10);
  }
  unint64_t v9 = v8 >> 3;
  if (v9 == 1)
  {
    uint64_t v10 = 512;
    goto LABEL_11;
  }
  if (v9 == 2)
  {
    uint64_t v10 = 1024;
LABEL_11:
    *((void *)this + 7) = v10;
  }
  if (v6 != v7)
  {
    do
    {
      unint64_t v11 = *v6++;
      operator delete(v11);
    }
    while (v6 != v7);
    uint64_t v13 = *((void *)this + 4);
    uint64_t v12 = *((void *)this + 5);
    if (v12 != v13) {
      *((void *)this + 5) = v12 + ((v13 - v12 + 7) & 0xFFFFFFFFFFFFFFF8);
    }
  }
  id v14 = (void *)*((void *)this + 3);
  if (v14) {
    operator delete(v14);
  }
  size_t v15 = *(void **)this;
  if (*(void *)this)
  {
    *((void *)this + 1) = v15;
    operator delete(v15);
  }
}

void ___ZN8GPUTools4Diag14BacktraceStore15InsertBacktraceENS0_9CallstackEm_block_invoke(void *a1)
{
  uint64_t v2 = (char **)a1[4];
  int v3 = *v2;
  vm_size_t v4 = v2[8];
  if (v4)
  {
    vm_size_t v5 = (void **)v2[4];
    int64_t v6 = (*(int **)((char *)v5 + (((unint64_t)v2[7] >> 7) & 0x1FFFFFFFFFFFFF8)))[(unint64_t)v2[7] & 0x3FF];
    unint64_t v7 = (unint64_t)(v2[7] + 1);
    v2[7] = (char *)v7;
    v2[8] = v4 - 1;
    if (v7 >= 0x800)
    {
      operator delete(*v5);
      v2[4] += 8;
      v2[7] -= 1024;
      int v3 = *(char **)a1[4];
    }
    memcpy(&v3[4104 * (int)v6], a1 + 5, 0x1008uLL);
  }
  else
  {
    int64_t v6 = (int64_t)v2[1];
    unint64_t v8 = (unint64_t)v2[2];
    if (v6 >= v8)
    {
      unint64_t v10 = 0x803FE00FF803FE01 * ((v6 - (uint64_t)v3) >> 3) + 1;
      if (v10 > 0xFF803FE00FF80) {
        abort();
      }
      unint64_t v11 = 0x803FE00FF803FE01 * ((uint64_t)(v8 - (void)v3) >> 3);
      if (2 * v11 > v10) {
        unint64_t v10 = 2 * v11;
      }
      if (v11 >= 0x7FC01FF007FC0) {
        unint64_t v12 = 0xFF803FE00FF80;
      }
      else {
        unint64_t v12 = v10;
      }
      if (v12)
      {
        if (v12 > 0xFF803FE00FF80) {
          std::__throw_bad_array_new_length[abi:nn180100]();
        }
        uint64_t v13 = (char *)operator new(4104 * v12);
      }
      else
      {
        uint64_t v13 = 0;
      }
      id v14 = &v13[8 * ((v6 - (uint64_t)v3) >> 3)];
      size_t v15 = &v13[4104 * v12];
      memcpy(v14, a1 + 5, 0x1008uLL);
      unint64_t v9 = v14 + 4104;
      if ((char *)v6 != v3)
      {
        do
        {
          v6 -= 4104;
          v14 -= 4104;
          memcpy(v14, (const void *)v6, 0x1008uLL);
        }
        while ((char *)v6 != v3);
        int64_t v6 = (int64_t)*v2;
      }
      *uint64_t v2 = v14;
      v2[1] = v9;
      v2[2] = v15;
      if (v6) {
        operator delete((void *)v6);
      }
    }
    else
    {
      memcpy(v2[1], a1 + 5, 0x1008uLL);
      unint64_t v9 = (char *)(v6 + 4104);
    }
    v2[1] = v9;
  }
  uint64_t v16 = a1[4];
  unint64_t v17 = a1[518];
  unint64_t v18 = *(void *)(v16 + 80);
  if (v18)
  {
    uint8x8_t v19 = (uint8x8_t)vcnt_s8((int8x8_t)v18);
    v19.i16[0] = vaddlv_u8(v19);
    if (v19.u32[0] > 1uLL)
    {
      int64_t v6 = a1[518];
      if (v17 >= v18) {
        int64_t v6 = v17 % v18;
      }
    }
    else
    {
      int64_t v6 = (v18 - 1) & v17;
    }
    id v20 = *(void **)(*(void *)(v16 + 72) + 8 * v6);
    if (v20)
    {
      for (i = (void *)*v20; i; i = (void *)*i)
      {
        unint64_t v22 = i[1];
        if (v22 == v17)
        {
          if (i[2] == v17) {
            return;
          }
        }
        else
        {
          if (v19.u32[0] > 1uLL)
          {
            if (v22 >= v18) {
              v22 %= v18;
            }
          }
          else
          {
            v22 &= v18 - 1;
          }
          if (v22 != v6) {
            break;
          }
        }
      }
    }
  }
  int v23 = -133956095 * ((*(void *)(v16 + 8) - *(void *)v16) >> 3) - 1;
  unint64_t v24 = operator new(0x20uLL);
  void *v24 = 0;
  v24[1] = v17;
  v24[2] = v17;
  *((_DWORD *)v24 + 6) = v23;
  float v25 = (float)(unint64_t)(*(void *)(v16 + 96) + 1);
  float v26 = *(float *)(v16 + 104);
  if (!v18 || (float)(v26 * (float)v18) < v25)
  {
    BOOL v27 = 1;
    if (v18 >= 3) {
      BOOL v27 = (v18 & (v18 - 1)) != 0;
    }
    unint64_t v28 = v27 | (2 * v18);
    unint64_t v29 = vcvtps_u32_f32(v25 / v26);
    if (v28 <= v29) {
      int8x8_t prime = (int8x8_t)v29;
    }
    else {
      int8x8_t prime = (int8x8_t)v28;
    }
    if (*(void *)&prime == 1)
    {
      int8x8_t prime = (int8x8_t)2;
    }
    else if ((*(void *)&prime & (*(void *)&prime - 1)) != 0)
    {
      int8x8_t prime = (int8x8_t)std::__next_prime(*(void *)&prime);
    }
    unint64_t v18 = *(void *)(v16 + 80);
    if (*(void *)&prime > v18) {
      goto LABEL_52;
    }
    if (*(void *)&prime < v18)
    {
      unint64_t v37 = vcvtps_u32_f32((float)*(unint64_t *)(v16 + 96) / *(float *)(v16 + 104));
      if (v18 < 3 || (uint8x8_t v38 = (uint8x8_t)vcnt_s8((int8x8_t)v18), v38.i16[0] = vaddlv_u8(v38), v38.u32[0] > 1uLL))
      {
        unint64_t v37 = std::__next_prime(v37);
      }
      else
      {
        uint64_t v39 = 1 << -(char)__clz(v37 - 1);
        if (v37 >= 2) {
          unint64_t v37 = v39;
        }
      }
      if (*(void *)&prime <= v37) {
        int8x8_t prime = (int8x8_t)v37;
      }
      if (*(void *)&prime >= v18)
      {
        unint64_t v18 = *(void *)(v16 + 80);
      }
      else
      {
        if (prime)
        {
LABEL_52:
          if (*(void *)&prime >> 61) {
            std::__throw_bad_array_new_length[abi:nn180100]();
          }
          unint64_t v31 = operator new(8 * *(void *)&prime);
          uint64_t v32 = *(void **)(v16 + 72);
          *(void *)(v16 + 72) = v31;
          if (v32) {
            operator delete(v32);
          }
          uint64_t v33 = 0;
          *(int8x8_t *)(v16 + 80) = prime;
          do
            *(void *)(*(void *)(v16 + 72) + 8 * v33++) = 0;
          while (*(void *)&prime != v33);
          __int16 v34 = *(void **)(v16 + 88);
          if (v34)
          {
            unint64_t v35 = v34[1];
            uint8x8_t v36 = (uint8x8_t)vcnt_s8(prime);
            v36.i16[0] = vaddlv_u8(v36);
            if (v36.u32[0] > 1uLL)
            {
              if (v35 >= *(void *)&prime) {
                v35 %= *(void *)&prime;
              }
            }
            else
            {
              v35 &= *(void *)&prime - 1;
            }
            *(void *)(*(void *)(v16 + 72) + 8 * v35) = v16 + 88;
            unint64_t v40 = (void *)*v34;
            if (*v34)
            {
              do
              {
                unint64_t v41 = v40[1];
                if (v36.u32[0] > 1uLL)
                {
                  if (v41 >= *(void *)&prime) {
                    v41 %= *(void *)&prime;
                  }
                }
                else
                {
                  v41 &= *(void *)&prime - 1;
                }
                if (v41 != v35)
                {
                  uint64_t v42 = *(void *)(v16 + 72);
                  if (!*(void *)(v42 + 8 * v41))
                  {
                    *(void *)(v42 + 8 * v41) = v34;
                    goto LABEL_77;
                  }
                  *__int16 v34 = *v40;
                  void *v40 = **(void **)(*(void *)(v16 + 72) + 8 * v41);
                  **(void **)(*(void *)(v16 + 72) + 8 * v41) = v40;
                  unint64_t v40 = v34;
                }
                unint64_t v41 = v35;
LABEL_77:
                __int16 v34 = v40;
                unint64_t v40 = (void *)*v40;
                unint64_t v35 = v41;
              }
              while (v40);
            }
          }
          unint64_t v18 = (unint64_t)prime;
          goto LABEL_81;
        }
        v46 = *(void **)(v16 + 72);
        *(void *)(v16 + 72) = 0;
        if (v46) {
          operator delete(v46);
        }
        unint64_t v18 = 0;
        *(void *)(v16 + 80) = 0;
      }
    }
LABEL_81:
    if ((v18 & (v18 - 1)) != 0)
    {
      if (v17 >= v18) {
        int64_t v6 = v17 % v18;
      }
      else {
        int64_t v6 = v17;
      }
    }
    else
    {
      int64_t v6 = (v18 - 1) & v17;
    }
  }
  uint64_t v43 = *(void *)(v16 + 72);
  uint64_t v44 = *(void **)(v43 + 8 * v6);
  if (v44)
  {
    void *v24 = *v44;
LABEL_94:
    *uint64_t v44 = v24;
    goto LABEL_95;
  }
  void *v24 = *(void *)(v16 + 88);
  *(void *)(v16 + 88) = v24;
  *(void *)(v43 + 8 * v6) = v16 + 88;
  if (*v24)
  {
    unint64_t v45 = *(void *)(*v24 + 8);
    if ((v18 & (v18 - 1)) != 0)
    {
      if (v45 >= v18) {
        v45 %= v18;
      }
    }
    else
    {
      v45 &= v18 - 1;
    }
    uint64_t v44 = (void *)(*(void *)(v16 + 72) + 8 * v45);
    goto LABEL_94;
  }
LABEL_95:
  ++*(void *)(v16 + 96);
}

void sub_144F4(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void GPUTools::Diag::BacktraceStore::RemoveBacktrace(GPUTools::Diag::BacktraceStore *this)
{
  uint64_t v1 = __chkstk_darwin(this);
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  int64_t v6 = (void *)v1;
  uint64_t v9 = 0;
  unint64_t v10 = &v9;
  uint64_t v11 = 0x103812000000;
  unint64_t v12 = __Block_byref_object_copy__105;
  uint64_t v13 = __Block_byref_object_dispose__106;
  id v14 = "";
  bzero(&v15, 0x1008uLL);
  unint64_t v7 = *(NSObject **)(v5 + 112);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  id v8[2] = ___ZN8GPUTools4Diag14BacktraceStore15RemoveBacktraceEm_block_invoke;
  v8[3] = &unk_24C88;
  v8[5] = v5;
  v8[6] = v3;
  v8[4] = &v9;
  dispatch_sync(v7, v8);
  memcpy(v6, v10 + 6, 0x1008uLL);
  _Block_object_dispose(&v9, 8);
}

void *__Block_byref_object_copy__105(uint64_t a1, uint64_t a2)
{
  return memcpy((void *)(a1 + 48), (const void *)(a2 + 48), 0x1008uLL);
}

void ___ZN8GPUTools4Diag14BacktraceStore15RemoveBacktraceEm_block_invoke(void *a1)
{
  uint64_t v1 = (void *)a1[5];
  int8x8_t v2 = (int8x8_t)v1[10];
  if (!*(void *)&v2) {
    return;
  }
  unint64_t v4 = a1[6];
  uint8x8_t v5 = (uint8x8_t)vcnt_s8(v2);
  v5.i16[0] = vaddlv_u8(v5);
  if (v5.u32[0] > 1uLL)
  {
    unint64_t v6 = a1[6];
    if (v4 >= *(void *)&v2) {
      unint64_t v6 = v4 % *(void *)&v2;
    }
  }
  else
  {
    unint64_t v6 = (*(void *)&v2 - 1) & v4;
  }
  unint64_t v7 = *(void ***)(v1[9] + 8 * v6);
  if (!v7) {
    return;
  }
  unint64_t v8 = *v7;
  if (!*v7) {
    return;
  }
  while (1)
  {
    unint64_t v9 = v8[1];
    if (v9 == v4) {
      break;
    }
    if (v5.u32[0] > 1uLL)
    {
      if (v9 >= *(void *)&v2) {
        v9 %= *(void *)&v2;
      }
    }
    else
    {
      v9 &= *(void *)&v2 - 1;
    }
    if (v9 != v6) {
      return;
    }
LABEL_16:
    unint64_t v8 = (void *)*v8;
    if (!v8) {
      return;
    }
  }
  if (v8[2] != v4) {
    goto LABEL_16;
  }
  memcpy((void *)(*(void *)(a1[4] + 8) + 48), (const void *)(*v1 + 4104 * *((int *)v8 + 6)), 0x1008uLL);
  unint64_t v10 = (void *)a1[5];
  uint64_t v11 = (char *)v10[5];
  unint64_t v12 = (char *)v10[4];
  uint64_t v13 = v11 - v12;
  if (v11 == v12) {
    uint64_t v14 = 0;
  }
  else {
    uint64_t v14 = ((v11 - v12) << 7) - 1;
  }
  unint64_t v15 = v10[7];
  uint64_t v16 = v10[8];
  unint64_t v17 = v16 + v15;
  if (v14 == v16 + v15)
  {
    BOOL v18 = v15 >= 0x400;
    unint64_t v19 = v15 - 1024;
    if (v18)
    {
      v10[7] = v19;
      uint64_t v22 = *(void *)v12;
      id v20 = v12 + 8;
      uint64_t v21 = v22;
      void v10[4] = v20;
      if ((char *)v10[6] == v11)
      {
        unint64_t v23 = v10[3];
        uint64_t v24 = (uint64_t)&v20[-v23];
        if ((unint64_t)v20 <= v23)
        {
          uint64_t v53 = (uint64_t)&v11[-v23];
          BOOL v52 = v53 == 0;
          uint64_t v54 = v53 >> 2;
          if (v52) {
            unint64_t v55 = 1;
          }
          else {
            unint64_t v55 = v54;
          }
          v56 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<int *>>(v55);
          unint64_t v58 = &v56[8 * (v55 >> 2)];
          unint64_t v59 = (uint64_t *)v10[4];
          uint64_t v11 = v58;
          uint64_t v60 = v10[5] - (void)v59;
          if (v60)
          {
            uint64_t v11 = &v58[v60 & 0xFFFFFFFFFFFFFFF8];
            uint64_t v61 = 8 * (v60 >> 3);
            v62 = &v56[8 * (v55 >> 2)];
            do
            {
              uint64_t v63 = *v59++;
              *(void *)v62 = v63;
              v62 += 8;
              v61 -= 8;
            }
            while (v61);
          }
          v64 = (void *)v10[3];
          v10[3] = v56;
          void v10[4] = v58;
          v10[5] = v11;
          v10[6] = &v56[8 * v57];
          if (v64)
          {
            operator delete(v64);
            uint64_t v11 = (char *)v10[5];
          }
        }
        else
        {
          uint64_t v25 = v24 >> 3;
          BOOL v26 = v24 >> 3 < -1;
          uint64_t v27 = (v24 >> 3) + 2;
          if (v26) {
            uint64_t v28 = v27;
          }
          else {
            uint64_t v28 = v25 + 1;
          }
          uint64_t v29 = -(v28 >> 1);
          uint64_t v30 = v28 >> 1;
          unint64_t v31 = &v20[-8 * v30];
          int64_t v32 = v11 - v20;
          if (v11 == v20)
          {
            uint64_t v33 = v11;
          }
          else
          {
            memmove(&v20[-8 * v30], v20, v11 - v20);
            uint64_t v33 = (char *)v10[4];
          }
          uint64_t v11 = &v31[v32];
          void v10[4] = &v33[8 * v29];
          v10[5] = &v31[v32];
        }
      }
      *(void *)uint64_t v11 = v21;
LABEL_87:
      v10[5] += 8;
    }
    else
    {
      uint64_t v35 = v13 >> 3;
      uint8x8_t v36 = (char *)v10[6];
      unint64_t v37 = (char *)v10[3];
      if (v13 >> 3 < (unint64_t)((v36 - v37) >> 3))
      {
        uint8x8_t v38 = operator new(0x1000uLL);
        uint64_t v39 = v38;
        if (v36 == v11)
        {
          long long v65 = (char *)v10[4];
          if (v65 == (char *)v10[3])
          {
            v101 = (unsigned char *)v10[5];
            v102 = (unsigned char *)v10[6];
            if (v101 >= v102)
            {
              if (v102 == v65) {
                unint64_t v106 = 1;
              }
              else {
                unint64_t v106 = (v102 - v65) >> 2;
              }
              uint64_t v107 = 2 * v106;
              v108 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<int *>>(v106);
              v66 = &v108[(v107 + 6) & 0xFFFFFFFFFFFFFFF8];
              id v110 = (uint64_t *)v10[4];
              v111 = v66;
              uint64_t v112 = v10[5] - (void)v110;
              if (v112)
              {
                v111 = &v66[v112 & 0xFFFFFFFFFFFFFFF8];
                uint64_t v113 = 8 * (v112 >> 3);
                v114 = v66;
                do
                {
                  uint64_t v115 = *v110++;
                  *(void *)v114 = v115;
                  v114 += 8;
                  v113 -= 8;
                }
                while (v113);
              }
              v116 = (void *)v10[3];
              v10[3] = v108;
              void v10[4] = v66;
              v10[5] = v111;
              v10[6] = &v108[8 * v109];
              if (v116)
              {
                operator delete(v116);
                v66 = (char *)v10[4];
              }
            }
            else
            {
              uint64_t v103 = (v102 - v101) >> 3;
              if (v103 >= -1) {
                uint64_t v104 = v103 + 1;
              }
              else {
                uint64_t v104 = v103 + 2;
              }
              uint64_t v105 = v104 >> 1;
              v66 = &v65[8 * (v104 >> 1)];
              if (v101 != v65)
              {
                memmove(&v65[8 * (v104 >> 1)], v65, v101 - v65);
                long long v65 = (char *)v10[5];
              }
              void v10[4] = v66;
              v10[5] = &v65[8 * v105];
            }
          }
          else
          {
            v66 = (char *)v10[4];
          }
          *((void *)v66 - 1) = v39;
          uint64_t v117 = (char *)v10[4];
          CFStringRef v118 = (char *)v10[5];
          void v10[4] = v117 - 8;
          uint64_t v119 = *((void *)v117 - 1);
          void v10[4] = v117;
          if (v118 == (char *)v10[6])
          {
            unint64_t v120 = v10[3];
            uint64_t v121 = (uint64_t)&v117[-v120];
            if ((unint64_t)v117 <= v120)
            {
              uint64_t v129 = (uint64_t)&v118[-v120];
              BOOL v52 = v129 == 0;
              uint64_t v130 = v129 >> 2;
              if (v52) {
                unint64_t v131 = 1;
              }
              else {
                unint64_t v131 = v130;
              }
              v132 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<int *>>(v131);
              uint64_t v134 = &v132[8 * (v131 >> 2)];
              uint64_t v135 = (uint64_t *)v10[4];
              CFStringRef v118 = v134;
              uint64_t v136 = v10[5] - (void)v135;
              if (v136)
              {
                CFStringRef v118 = &v134[v136 & 0xFFFFFFFFFFFFFFF8];
                uint64_t v137 = 8 * (v136 >> 3);
                uint8x8_t v138 = &v132[8 * (v131 >> 2)];
                do
                {
                  uint64_t v139 = *v135++;
                  *(void *)uint8x8_t v138 = v139;
                  v138 += 8;
                  v137 -= 8;
                }
                while (v137);
              }
              v140 = (void *)v10[3];
              v10[3] = v132;
              void v10[4] = v134;
              v10[5] = v118;
              v10[6] = &v132[8 * v133];
              if (v140)
              {
                operator delete(v140);
                CFStringRef v118 = (char *)v10[5];
              }
            }
            else
            {
              uint64_t v122 = v121 >> 3;
              BOOL v26 = v121 >> 3 < -1;
              uint64_t v123 = (v121 >> 3) + 2;
              if (v26) {
                uint64_t v124 = v123;
              }
              else {
                uint64_t v124 = v122 + 1;
              }
              uint64_t v125 = -(v124 >> 1);
              uint64_t v126 = v124 >> 1;
              v127 = &v117[-8 * v126];
              int64_t v128 = v118 - v117;
              if (v118 != v117)
              {
                memmove(&v117[-8 * v126], v117, v118 - v117);
                uint64_t v117 = (char *)v10[4];
              }
              CFStringRef v118 = &v127[v128];
              void v10[4] = &v117[8 * v125];
              v10[5] = &v127[v128];
            }
          }
          *(void *)CFStringRef v118 = v119;
        }
        else
        {
          *(void *)uint64_t v11 = v38;
        }
        goto LABEL_87;
      }
      if (v36 == v37) {
        unint64_t v40 = 1;
      }
      else {
        unint64_t v40 = (v36 - v37) >> 2;
      }
      unint64_t v41 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<int *>>(v40);
      uint64_t v43 = v42;
      uint64_t v44 = &v41[8 * v35];
      *(void *)&long long v45 = v41;
      *((void *)&v45 + 1) = v44;
      long long v144 = v45;
      v46 = operator new(0x1000uLL);
      *(void *)&long long v47 = v44;
      *((void *)&v47 + 1) = &v41[8 * v43];
      if (v35 == v43)
      {
        uint64_t v48 = 8 * v35;
        *(void *)&long long v49 = v144;
        if (v13 < 1)
        {
          long long v67 = v46;
          uint64_t v68 = v48 >> 2;
          if (v11 == v12) {
            unint64_t v69 = 1;
          }
          else {
            unint64_t v69 = v68;
          }
          v70 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<int *>>(v69);
          uint64_t v44 = &v70[8 * (v69 >> 2)];
          *(void *)&long long v49 = v70;
          *((void *)&v49 + 1) = v44;
          *(void *)&long long v47 = v44;
          *((void *)&v47 + 1) = &v70[8 * v71];
          if (v41)
          {
            long long v141 = v47;
            long long v145 = v49;
            operator delete(v41);
            long long v47 = v141;
            long long v49 = v145;
          }
          v46 = v67;
        }
        else
        {
          uint64_t v50 = v48 >> 3;
          if (v50 >= -1) {
            unint64_t v51 = v50 + 1;
          }
          else {
            unint64_t v51 = v50 + 2;
          }
          v44 -= 8 * (v51 >> 1);
          *(void *)&long long v47 = v44;
          *((void *)&v49 + 1) = v44;
        }
      }
      else
      {
        long long v49 = v144;
      }
      *(void *)uint64_t v44 = v46;
      *(void *)&long long v47 = v47 + 8;
      for (uint64_t i = v10[5]; i != v10[4]; i -= 8)
      {
        v73 = (void *)*((void *)&v49 + 1);
        if (*((void *)&v49 + 1) == (void)v49)
        {
          v75 = (unsigned char *)v47;
          if ((unint64_t)v47 >= *((void *)&v47 + 1))
          {
            if (*((void *)&v47 + 1) == *((void *)&v49 + 1)) {
              unint64_t v80 = 1;
            }
            else {
              unint64_t v80 = (uint64_t)(*((void *)&v47 + 1) - *((void *)&v49 + 1)) >> 2;
            }
            v81 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<int *>>(v80);
            v74 = &v81[(2 * v80 + 6) & 0xFFFFFFFFFFFFFFF8];
            v83 = v74;
            uint64_t v84 = v75 - (unsigned char *)v73;
            if (v75 != (unsigned char *)v73)
            {
              v83 = &v74[v84 & 0xFFFFFFFFFFFFFFF8];
              uint64_t v85 = 8 * (v84 >> 3);
              BOOL v86 = v74;
              id v87 = v73;
              do
              {
                uint64_t v88 = *v87++;
                *(void *)BOOL v86 = v88;
                v86 += 8;
                v85 -= 8;
              }
              while (v85);
            }
            *(void *)&long long v49 = v81;
            *((void *)&v49 + 1) = v74;
            *(void *)&long long v47 = v83;
            *((void *)&v47 + 1) = &v81[8 * v82];
            if (v73)
            {
              long long v142 = v47;
              long long v147 = v49;
              operator delete(v73);
              long long v47 = v142;
              long long v49 = v147;
            }
          }
          else
          {
            uint64_t v76 = (uint64_t)(*((void *)&v47 + 1) - v47) >> 3;
            if (v76 >= -1) {
              uint64_t v77 = v76 + 1;
            }
            else {
              uint64_t v77 = v76 + 2;
            }
            uint64_t v78 = v77 >> 1;
            uint64_t v79 = v47 + 8 * (v77 >> 1);
            v74 = (char *)(v79 - (v47 - *((void *)&v49 + 1)));
            if ((void)v47 == *((void *)&v49 + 1))
            {
              v75 = (unsigned char *)*((void *)&v49 + 1);
            }
            else
            {
              uint64_t v143 = *((void *)&v47 + 1);
              uint64_t v146 = v49;
              memmove((void *)(v79 - (v47 - *((void *)&v49 + 1))), *((const void **)&v49 + 1), v47 - *((void *)&v49 + 1));
              *((void *)&v47 + 1) = v143;
              *(void *)&long long v49 = v146;
            }
            *((void *)&v49 + 1) = v74;
            *(void *)&long long v47 = &v75[8 * v78];
          }
        }
        else
        {
          v74 = (char *)*((void *)&v49 + 1);
        }
        uint64_t v89 = *(void *)(i - 8);
        *((void *)v74 - 1) = v89;
        *((void *)&v49 + 1) -= 8;
      }
      v90 = (void *)v10[3];
      *(_OWORD *)(v10 + 3) = v49;
      *(_OWORD *)(v10 + 5) = v47;
      if (v90) {
        operator delete(v90);
      }
    }
    unint64_t v12 = (char *)v10[4];
    uint64_t v16 = v10[8];
    unint64_t v17 = v10[7] + v16;
    __int16 v34 = (void *)a1[5];
  }
  else
  {
    __int16 v34 = (void *)a1[5];
  }
  *(_DWORD *)(*(void *)&v12[(v17 >> 7) & 0x1FFFFFFFFFFFFF8] + 4 * (v17 & 0x3FF)) = *((_DWORD *)v8 + 6);
  v10[8] = v16 + 1;
  int8x8_t v91 = (int8x8_t)v34[10];
  unint64_t v92 = v8[1];
  uint8x8_t v93 = (uint8x8_t)vcnt_s8(v91);
  v93.i16[0] = vaddlv_u8(v93);
  if (v93.u32[0] > 1uLL)
  {
    if (v92 >= *(void *)&v91) {
      v92 %= *(void *)&v91;
    }
  }
  else
  {
    v92 &= *(void *)&v91 - 1;
  }
  uint64_t v94 = v34[9];
  v95 = *(void **)(v94 + 8 * v92);
  do
  {
    v96 = v95;
    v95 = (void *)*v95;
  }
  while (v95 != v8);
  if (v96 == v34 + 11) {
    goto LABEL_106;
  }
  unint64_t v97 = v96[1];
  if (v93.u32[0] > 1uLL)
  {
    if (v97 >= *(void *)&v91) {
      v97 %= *(void *)&v91;
    }
  }
  else
  {
    v97 &= *(void *)&v91 - 1;
  }
  if (v97 != v92)
  {
LABEL_106:
    if (!*v8) {
      goto LABEL_107;
    }
    unint64_t v98 = *(void *)(*v8 + 8);
    if (v93.u32[0] > 1uLL)
    {
      if (v98 >= *(void *)&v91) {
        v98 %= *(void *)&v91;
      }
    }
    else
    {
      v98 &= *(void *)&v91 - 1;
    }
    if (v98 != v92) {
LABEL_107:
    }
      *(void *)(v94 + 8 * v92) = 0;
  }
  uint64_t v99 = *v8;
  if (*v8)
  {
    unint64_t v100 = *(void *)(v99 + 8);
    if (v93.u32[0] > 1uLL)
    {
      if (v100 >= *(void *)&v91) {
        v100 %= *(void *)&v91;
      }
    }
    else
    {
      v100 &= *(void *)&v91 - 1;
    }
    if (v100 != v92)
    {
      *(void *)(v34[9] + 8 * v100) = v96;
      uint64_t v99 = *v8;
    }
  }
  void *v96 = v99;
  *unint64_t v8 = 0;
  --v34[12];

  operator delete(v8);
}

void sub_14E30(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, long long a11)
{
  operator delete(v11);
  if ((void)a11) {
    operator delete((void *)a11);
  }
  _Unwind_Resume(a1);
}

void *std::__allocate_at_least[abi:nn180100]<std::allocator<int *>>(unint64_t a1)
{
  if (a1 >> 61) {
    std::__throw_bad_array_new_length[abi:nn180100]();
  }
  return operator new(8 * a1);
}

uint64_t GTCoreAllocatorInit(uint64_t result)
{
  hideMemory = result & 1;
  return result;
}

uint64_t GTCoreAllocatorIsHiddingMemory()
{
  return hideMemory;
}

vm_address_t GTCoreAlloc(uint64_t a1, memory_object_size_t a2)
{
  kern_return_t v12;
  FILE *v14;
  void block[4];
  kern_return_t v16;
  memory_object_size_t size;
  mach_port_t object_handle;
  vm_address_t address;
  uint8_t buf[4];
  mach_error_t v21;
  __int16 v22;
  char *v23;

  vm_address_t address = 0;
  object_handle = 0;
  size = a2;
  mach_error_t memory_entry_64 = mach_make_memory_entry_64(mach_task_self_, &size, 0, 139267, &object_handle, 0);
  if (memory_entry_64)
  {
    mach_error_t v4 = memory_entry_64;
    if (!s_logUsingOsLog)
    {
      uint64_t v11 = __stderrp;
      mach_error_string(memory_entry_64);
      fprintf(v11, "warning: failed to create memory entry error 0x%x (%s)\n");
      return 0;
    }
    uint8x8_t v5 = gt_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      unint64_t v6 = mach_error_string(v4);
      *(_DWORD *)buf = 67109378;
      uint64_t v21 = v4;
      uint64_t v22 = 2080;
      unint64_t v23 = v6;
      unint64_t v7 = "warning: failed to create memory entry error 0x%x (%s)";
LABEL_9:
      _os_log_error_impl(&dword_0, v5, OS_LOG_TYPE_ERROR, v7, buf, 0x12u);
      return 0;
    }
    return 0;
  }
  mach_error_t v8 = vm_map(mach_task_self_, &address, a2, 0, 1, object_handle, 0, 0, 3, 3, 1u);
  if (v8)
  {
    mach_error_t v9 = v8;
    if (!s_logUsingOsLog)
    {
      uint64_t v14 = __stderrp;
      mach_error_string(v8);
      fprintf(v14, "warning: failed to map memory error 0x%x (%s)\n");
      return 0;
    }
    uint8x8_t v5 = gt_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      unint64_t v10 = mach_error_string(v9);
      *(_DWORD *)buf = 67109378;
      uint64_t v21 = v9;
      uint64_t v22 = 2080;
      unint64_t v23 = v10;
      unint64_t v7 = "warning: failed to map memory error 0x%x (%s)";
      goto LABEL_9;
    }
    return 0;
  }
  if (hideMemory)
  {
    unint64_t v12 = mach_memory_entry_ownership(object_handle, mach_task_self_, 4, 1);
    if (v12)
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 0x40000000;
      block[2] = __GTCoreAlloc_block_invoke;
      block[3] = &__block_descriptor_tmp;
      uint64_t v16 = v12;
      if (GTCoreAlloc_onceToken != -1) {
        dispatch_once(&GTCoreAlloc_onceToken, block);
      }
    }
  }
  mach_port_deallocate(mach_task_self_, object_handle);
  return address;
}

void __GTCoreAlloc_block_invoke(uint64_t a1)
{
  if (s_logUsingOsLog)
  {
    int8x8_t v2 = gt_default_log();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      mach_error_t v3 = *(_DWORD *)(a1 + 32);
      *(_DWORD *)buf = 67109378;
      mach_error_t v8 = v3;
      __int16 v9 = 2080;
      unint64_t v10 = mach_error_string(v3);
      _os_log_error_impl(&dword_0, v2, OS_LOG_TYPE_ERROR, "warning: failed to mark memory(GRAPHICS) error 0x%x (%s)", buf, 0x12u);
    }
  }
  else
  {
    mach_error_t v4 = __stderrp;
    mach_error_t v5 = *(_DWORD *)(a1 + 32);
    unint64_t v6 = mach_error_string(v5);
    fprintf(v4, "warning: failed to mark memory(GRAPHICS) error 0x%x (%s)\n", v5, v6);
  }
}

vm_address_t *GTCoreFree(vm_address_t *result, vm_size_t size)
{
  if (result)
  {
    int8x8_t v2 = result;
    CFStringRef result = (vm_address_t *)vm_deallocate(mach_task_self_, *result, size);
    *int8x8_t v2 = 0;
  }
  return result;
}

id gt_default_log()
{
  uint64_t v0 = s_defaultLog;
  if (s_defaultLog == &_os_log_default)
  {
    if (gt_default_log_onceToken != -1) {
      dispatch_once(&gt_default_log_onceToken, &__block_literal_global_123);
    }
    uint64_t v0 = s_defaultLog;
  }

  return v0;
}

void __gt_default_log_block_invoke(id a1)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v1 = 0;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "GPUTOOLS(warning): Log uninitialized, please call GTCoreLogInit(), logging to OS_LOG_DEFAULT instead", v1, 2u);
  }
}

id gt_tagged_log(unint64_t a1)
{
  if (s_logCount <= a1)
  {
    if (s_logUsingOsLog)
    {
      mach_error_t v5 = gt_default_log();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 134217984;
        *(void *)&uint8_t buf[4] = a1;
        _os_log_fault_impl(&dword_0, v5, OS_LOG_TYPE_FAULT, "fail: Invalid log tag: %llu", buf, 0xCu);
      }
    }
    else
    {
      unint64_t v6 = __stderrp;
      id v7 = +[NSString stringWithFormat:@"fail: Invalid log tag: %llu", a1];
      fprintf(v6, "%s\n", (const char *)[v7 UTF8String]);
    }
    id v4 = &_os_log_default;
    id v8 = &_os_log_default;
  }
  else
  {
    *(_OWORD *)buf = 0u;
    long long v11 = 0u;
    __copy_constructor_8_8_s0_s8_s16_s24(buf, (id *)(s_logs + 32 * a1));
    int v2 = GTCoreLog_enabled((uint64_t)buf);
    mach_error_t v3 = (void *)*((void *)&v11 + 1);
    if (!v2) {
      mach_error_t v3 = &_os_log_disabled;
    }
    id v4 = v3;
    __destructor_8_s0_s8_s16_s24((uint64_t)buf);
  }

  return v4;
}

id __copy_constructor_8_8_s0_s8_s16_s24(void *a1, id *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  a1[2] = a2[2];
  id result = a2[3];
  a1[3] = result;
  return result;
}

uint64_t GTCoreLog_enabled(uint64_t a1)
{
  if (!*(void *)(a1 + 16)) {
    return 1;
  }
  int v2 = +[NSUserDefaults standardUserDefaults];
  id v3 = [v2 BOOLForKey:*(void *)(a1 + 16)];

  return (uint64_t)v3;
}

void __destructor_8_s0_s8_s16_s24(uint64_t a1)
{
  int v2 = *(void **)(a1 + 24);
}

uint64_t GTCoreLogUseOsLog()
{
  return s_logUsingOsLog;
}

void GTCoreLogInit(const char *a1, uint64_t a2, int a3)
{
  if (s_defaultLog == &_os_log_default)
  {
    unint64_t v6 = a1;
    os_log_t v7 = os_log_create(a1, "");
    id v8 = s_defaultLog;
    s_defaultLog = v7;

    p_vtable = GTUNIXDomainSocketTransport_tools_diagnostics.vtable;
    s_logs = (uint64_t)malloc_type_calloc(a3, 0x20uLL, 0x8004018A671A6uLL);
    s_logCount = a3;
    if (a3 >= 1)
    {
      unint64_t v10 = 0;
      unint64_t v11 = a3;
      uint64_t v12 = a2 + 8;
      uint64_t v13 = 16;
      uint64_t v14 = &CFHash_ptr;
      id v36 = (id)v11;
      do
      {
        unint64_t v15 = *(const char **)v12;
        if (v10 == *(char **)(v12 - 8))
        {
          uint64_t v16 = v6;
          uint64_t v17 = *(unsigned __int8 *)(v12 + 8);
          BOOL v18 = (char *)p_vtable[126];
          unint64_t v19 = &v18[v13];
          id v20 = v16;
          uint64_t v21 = objc_msgSend(v14[208], "stringWithUTF8String:");
          uint64_t v22 = *(void **)&v18[v13 - 16];
          *((void *)v19 - 2) = v21;

          uint64_t v23 = [v14[208] stringWithUTF8String:v15];
          uint64_t v24 = *(void **)&v18[v13 - 8];
          *((void *)v19 - 1) = v23;

          if (v17)
          {
            uint64_t v25 = [v14[208] stringWithFormat:@"%@.%@.enableLog", *((void *)v19 - 2), *((void *)v19 - 1)];
            BOOL v26 = *(void **)&v18[v13];
            *(void *)&v18[v13] = v25;
          }
          else
          {
            BOOL v26 = *(void **)&v18[v13];
            *(void *)&v18[v13] = 0;
          }

          unint64_t v6 = v20;
          os_log_t v28 = os_log_create(v20, v15);
          uint64_t v29 = *(void **)&v18[v13 + 8];
          *(void *)&v18[v13 + 8] = v28;

          GTCoreLog_enabled((uint64_t)(v19 - 16));
          p_vtable = (void **)(GTUNIXDomainSocketTransport_tools_diagnostics + 24);
          unint64_t v11 = (unint64_t)v36;
          uint64_t v14 = &CFHash_ptr;
        }
        else
        {
          if (s_logUsingOsLog)
          {
            uint64_t v27 = gt_default_log();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315394;
              uint64_t v39 = v15;
              __int16 v40 = 1024;
              int v41 = (int)v10;
              _os_log_error_impl(&dword_0, v27, OS_LOG_TYPE_ERROR, "warning: Invalid tag ID for %s, %d expected. Falling back to OS_LOG_DEFAULT", buf, 0x12u);
            }
          }
          else
          {
            uint64_t v30 = __stderrp;
            uint64_t v27 = [v14[208] stringWithFormat:@"warning: Invalid tag ID for %s, %d expected. Falling back to OS_LOG_DEFAULT", v15, v10];
            fprintf(v30, "%s\n", (const char *)[v27 UTF8String]);
          }

          objc_storeStrong((id *)((char *)p_vtable[126] + v13 + 8), &_os_log_default);
        }
        ++v10;
        v13 += 32;
        v12 += 24;
      }
      while ((char *)v11 != v10);
    }
    unint64_t v31 = +[NSUserDefaults standardUserDefaults];
    unsigned __int8 v32 = [v31 BOOLForKey:@"GPUToolsPerfLogging"];

    if (v32)
    {
      os_log_t v33 = os_log_create(v6, "");
      __int16 v34 = g_signpostLog;
      g_signpostLog = v33;
    }
  }
  else if (s_logUsingOsLog)
  {
    id v3 = gt_default_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v39 = "Log already initialized, did you call GTCoreLogInit twice?";
      _os_log_error_impl(&dword_0, v3, OS_LOG_TYPE_ERROR, "warning: %s", buf, 0xCu);
    }
  }
  else
  {
    uint64_t v35 = __stderrp;
    id v37 = +[NSString stringWithFormat:@"warning: %s", "Log already initialized, did you call GTCoreLogInit twice?"];
    fprintf(v35, "%s\n", (const char *)[v37 UTF8String]);
  }
}

uint64_t GTCoreLogTagEnabled(unint64_t a1)
{
  if (s_logCount <= a1) {
    return 0;
  }
  memset(v3, 0, sizeof(v3));
  __copy_constructor_8_8_s0_s8_s16_s24(v3, (id *)(s_logs + 32 * a1));
  uint64_t v1 = GTCoreLog_enabled((uint64_t)v3);
  __destructor_8_s0_s8_s16_s24((uint64_t)v3);
  return v1;
}

uint64_t GTCoreLogUseStandardOutputStreams(uint64_t result)
{
  s_logUsingOsLog = result ^ 1;
  return result;
}

uint64_t __GLOBAL_init_65535()
{
  return __cxa_atexit((void (*)(void *))GTToolsDiagnostics_DylibExit, 0, &dword_0);
}

CFHashCode CFHash(CFTypeRef cf)
{
  return _CFHash(cf);
}

CFDataRef CFPropertyListCreateData(CFAllocatorRef allocator, CFPropertyListRef propertyList, CFPropertyListFormat format, CFOptionFlags options, CFErrorRef *error)
{
  return _CFPropertyListCreateData(allocator, propertyList, format, options, error);
}

CFPropertyListRef CFPropertyListCreateWithData(CFAllocatorRef allocator, CFDataRef data, CFOptionFlags options, CFPropertyListFormat *format, CFErrorRef *error)
{
  return _CFPropertyListCreateWithData(allocator, data, options, format, error);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return _CFRetain(cf);
}

CFDataRef CFStringCreateExternalRepresentation(CFAllocatorRef alloc, CFStringRef theString, CFStringEncoding encoding, UInt8 lossByte)
{
  return _CFStringCreateExternalRepresentation(alloc, theString, encoding, lossByte);
}

CFStringRef CFStringCreateFromExternalRepresentation(CFAllocatorRef alloc, CFDataRef data, CFStringEncoding encoding)
{
  return _CFStringCreateFromExternalRepresentation(alloc, data, encoding);
}

CFStringRef CFStringCreateWithFileSystemRepresentation(CFAllocatorRef alloc, const char *buffer)
{
  return _CFStringCreateWithFileSystemRepresentation(alloc, buffer);
}

Boolean CFStringGetFileSystemRepresentation(CFStringRef string, char *buffer, CFIndex maxBufLen)
{
  return _CFStringGetFileSystemRepresentation(string, buffer, maxBufLen);
}

CFUUIDRef CFUUIDCreate(CFAllocatorRef alloc)
{
  return _CFUUIDCreate(alloc);
}

uint64_t GTTransportServiceDaemonConnectionNew()
{
  return _GTTransportServiceDaemonConnectionNew();
}

Class NSClassFromString(NSString *aClassName)
{
  return _NSClassFromString(aClassName);
}

NSString *NSTemporaryDirectory(void)
{
  return _NSTemporaryDirectory();
}

void _Block_object_assign(void *a1, const void *a2, const int a3)
{
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

size_t std::__next_prime(size_t __n)
{
  return std::__next_prime(__n);
}

void std::terminate(void)
{
}

void operator delete(void *__p)
{
  while (1)
    ;
}

void operator delete()
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
}

void operator new()
{
  while (1)
    ;
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

int __cxa_atexit(void (*lpfunc)(void *), void *obj, void *lpdso_handle)
{
  return ___cxa_atexit(lpfunc, obj, lpdso_handle);
}

void *__cxa_begin_catch(void *a1)
{
  return ___cxa_begin_catch(a1);
}

int __cxa_guard_acquire(__guard *a1)
{
  return ___cxa_guard_acquire((uint64_t *)a1);
}

void __cxa_guard_release(__guard *a1)
{
}

int *__error(void)
{
  return ___error();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void abort(void)
{
}

int accept(int a1, sockaddr *a2, socklen_t *a3)
{
  return _accept(a1, a2, a3);
}

int backtrace(void **a1, int a2)
{
  return _backtrace(a1, a2);
}

int bind(int a1, const sockaddr *a2, socklen_t a3)
{
  return _bind(a1, a2, a3);
}

void bzero(void *a1, size_t a2)
{
}

Method class_getInstanceMethod(Class cls, SEL name)
{
  return _class_getInstanceMethod(cls, name);
}

int close(int a1)
{
  return _close(a1);
}

int connect(int a1, const sockaddr *a2, socklen_t a3)
{
  return _connect(a1, a2, a3);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_barrier_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_barrier_sync_f(dispatch_queue_t queue, void *context, dispatch_function_t work)
{
}

dispatch_data_t dispatch_data_create_map(dispatch_data_t data, const void **buffer_ptr, size_t *size_ptr)
{
  return _dispatch_data_create_map(data, buffer_ptr, size_ptr);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

uint64_t dispatch_queue_attr_make_with_overcommit()
{
  return _dispatch_queue_attr_make_with_overcommit();
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

dispatch_queue_t dispatch_queue_create_with_target_V2(const char *label, dispatch_queue_attr_t attr, dispatch_queue_t target)
{
  return _dispatch_queue_create_with_target_V2(label, attr, target);
}

void dispatch_release(dispatch_object_t object)
{
}

void dispatch_resume(dispatch_object_t object)
{
}

void dispatch_retain(dispatch_object_t object)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return _dispatch_semaphore_create(value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return _dispatch_semaphore_signal(dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return _dispatch_semaphore_wait(dsema, timeout);
}

void dispatch_set_target_queue(dispatch_object_t object, dispatch_queue_t queue)
{
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return _dispatch_source_create(type, handle, mask, queue);
}

uintptr_t dispatch_source_get_handle(dispatch_source_t source)
{
  return _dispatch_source_get_handle(source);
}

void dispatch_source_set_cancel_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

intptr_t dispatch_source_testcancel(dispatch_source_t source)
{
  return _dispatch_source_testcancel(source);
}

void dispatch_suspend(dispatch_object_t object)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

int fcntl(int a1, int a2, ...)
{
  return _fcntl(a1, a2);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return _fprintf(a1, a2);
}

int ftruncate(int a1, off_t a2)
{
  return _ftruncate(a1, a2);
}

char *__cdecl getenv(const char *a1)
{
  return _getenv(a1);
}

pid_t getpid(void)
{
  return _getpid();
}

int listen(int a1, int a2)
{
  return _listen(a1, a2);
}

char *__cdecl mach_error_string(mach_error_t error_value)
{
  return _mach_error_string(error_value);
}

kern_return_t mach_make_memory_entry_64(vm_map_t target_task, memory_object_size_t *size, memory_object_offset_t offset, vm_prot_t permission, mach_port_t *object_handle, mem_entry_name_port_t parent_entry)
{
  return _mach_make_memory_entry_64(target_task, size, offset, permission, object_handle, parent_entry);
}

kern_return_t mach_memory_entry_ownership(mem_entry_name_port_t mem_entry, task_t owner, int ledger_tag, int ledger_flags)
{
  return _mach_memory_entry_ownership(mem_entry, owner, ledger_tag, ledger_flags);
}

kern_return_t mach_port_deallocate(ipc_space_t task, mach_port_name_t name)
{
  return _mach_port_deallocate(task, name);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_calloc(count, size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return _memmove(__dst, __src, __len);
}

void memset_pattern16(void *__b, const void *__pattern16, size_t __len)
{
}

IMP method_setImplementation(Method m, IMP imp)
{
  return _method_setImplementation(m, imp);
}

int mkstemp(char *a1)
{
  return _mkstemp(a1);
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return _mmap(a1, a2, a3, a4, a5, a6);
}

int munmap(void *a1, size_t a2)
{
  return _munmap(a1, a2);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autorelease(id a1)
{
  return _objc_autorelease(a1);
}

{
}

{
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

id objc_begin_catch(void *exc_buf)
{
  return _objc_begin_catch(exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

void objc_exception_rethrow(void)
{
}

id objc_getAssociatedObject(id object, const void *key)
{
  return _objc_getAssociatedObject(object, key);
}

id objc_initWeak(id *location, id val)
{
  return _objc_initWeak(location, val);
}

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

uint64_t objc_opt_respondsToSelector()
{
  return _objc_opt_respondsToSelector();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutorelease(id a1)
{
  return _a1;
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
}

void objc_setProperty_nonatomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

const char *__cdecl object_getClassName(id a1)
{
  return _object_getClassName(a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

int poll(pollfd *a1, nfds_t a2, int a3)
{
  return _poll(a1, a2, a3);
}

int pthread_attr_destroy(pthread_attr_t *a1)
{
  return _pthread_attr_destroy(a1);
}

int pthread_attr_init(pthread_attr_t *a1)
{
  return _pthread_attr_init(a1);
}

int pthread_attr_setdetachstate(pthread_attr_t *a1, int a2)
{
  return _pthread_attr_setdetachstate(a1, a2);
}

int pthread_create(pthread_t *a1, const pthread_attr_t *a2, void *(__cdecl *a3)(void *), void *a4)
{
  return _pthread_create(a1, a2, a3, a4);
}

int pthread_setname_np(const char *a1)
{
  return _pthread_setname_np(a1);
}

ssize_t recv(int a1, void *a2, size_t a3, int a4)
{
  return _recv(a1, a2, a3, a4);
}

uint64_t registerService()
{
  return _registerService();
}

ssize_t send(int a1, const void *a2, size_t a3, int a4)
{
  return _send(a1, a2, a3, a4);
}

int shm_open(const char *a1, int a2, ...)
{
  return _shm_open(a1, a2);
}

int shm_unlink(const char *a1)
{
  return _shm_unlink(a1);
}

unsigned int sleep(unsigned int a1)
{
  return _sleep(a1);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return _snprintf(__str, __size, __format);
}

int socket(int a1, int a2, int a3)
{
  return _socket(a1, a2, a3);
}

size_t strlcpy(char *__dst, const char *__source, size_t __size)
{
  return _strlcpy(__dst, __source, __size);
}

size_t strlen(const char *__s)
{
  return _strlen(__s);
}

int unlink(const char *a1)
{
  return _unlink(a1);
}

int usleep(useconds_t a1)
{
  return _usleep(a1);
}

kern_return_t vm_allocate(vm_map_t target_task, vm_address_t *address, vm_size_t size, int flags)
{
  return _vm_allocate(target_task, address, size, flags);
}

kern_return_t vm_copy(vm_map_t target_task, vm_address_t source_address, vm_size_t size, vm_address_t dest_address)
{
  return _vm_copy(target_task, source_address, size, dest_address);
}

kern_return_t vm_deallocate(vm_map_t target_task, vm_address_t address, vm_size_t size)
{
  return _vm_deallocate(target_task, address, size);
}

kern_return_t vm_map(vm_map_t target_task, vm_address_t *address, vm_size_t size, vm_address_t mask, int flags, mem_entry_name_port_t object, vm_offset_t offset, BOOLean_t copy, vm_prot_t cur_protection, vm_prot_t max_protection, vm_inherit_t inheritance)
{
  return _vm_map(target_task, address, size, mask, flags, object, offset, copy, cur_protection, max_protection, inheritance);
}

kern_return_t vm_protect(vm_map_t target_task, vm_address_t address, vm_size_t size, BOOLean_t set_maximum, vm_prot_t new_protection)
{
  return _vm_protect(target_task, address, size, set_maximum, new_protection);
}

kern_return_t vm_remap(vm_map_t target_task, vm_address_t *target_address, vm_size_t size, vm_address_t mask, int flags, vm_map_t src_task, vm_address_t src_address, BOOLean_t copy, vm_prot_t *cur_protection, vm_prot_t *max_protection, vm_inherit_t inheritance)
{
  return _vm_remap(target_task, target_address, size, mask, flags, src_task, src_address, copy, cur_protection, max_protection, inheritance);
}

id objc_msgSend_GTGPUToolsData(void *a1, const char *a2, ...)
{
  return [a1 GTGPUToolsData];
}

id objc_msgSend_URL(void *a1, const char *a2, ...)
{
  return [a1 URL];
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend__allocateMessageBuffer(void *a1, const char *a2, ...)
{
  return [a1 _allocateMessageBuffer];
}

id objc_msgSend__callCancellationHandler(void *a1, const char *a2, ...)
{
  return [a1 _callCancellationHandler];
}

id objc_msgSend__callRegistrationHandler(void *a1, const char *a2, ...)
{
  return [a1 _callRegistrationHandler];
}

id objc_msgSend__cancel(void *a1, const char *a2, ...)
{
  return [a1 _cancel];
}

id objc_msgSend__clearBuffers(void *a1, const char *a2, ...)
{
  return [a1 _clearBuffers];
}

id objc_msgSend__computeBytesAvailableToRead(void *a1, const char *a2, ...)
{
  return [a1 _computeBytesAvailableToRead];
}

id objc_msgSend__computeBytesAvailableToWrite(void *a1, const char *a2, ...)
{
  return [a1 _computeBytesAvailableToWrite];
}

id objc_msgSend__dequeueIncomingMessages(void *a1, const char *a2, ...)
{
  return [a1 _dequeueIncomingMessages];
}

id objc_msgSend__dequeuePacket(void *a1, const char *a2, ...)
{
  return [a1 _dequeuePacket];
}

id objc_msgSend__destroySharedMemoryTransport(void *a1, const char *a2, ...)
{
  return [a1 _destroySharedMemoryTransport];
}

id objc_msgSend__invalidate(void *a1, const char *a2, ...)
{
  return [a1 _invalidate];
}

id objc_msgSend__nextMessageSerial(void *a1, const char *a2, ...)
{
  return [a1 _nextMessageSerial];
}

id objc_msgSend__readAndAccumulate(void *a1, const char *a2, ...)
{
  return [a1 _readAndAccumulate];
}

id objc_msgSend__readAndAccumulateLoop(void *a1, const char *a2, ...)
{
  return [a1 _readAndAccumulateLoop];
}

id objc_msgSend__register(void *a1, const char *a2, ...)
{
  return [a1 _register];
}

id objc_msgSend__setupIOBuffers(void *a1, const char *a2, ...)
{
  return [a1 _setupIOBuffers];
}

id objc_msgSend__tearDownSharedMemory(void *a1, const char *a2, ...)
{
  return [a1 _tearDownSharedMemory];
}

id objc_msgSend__unpackAndDispatchMessage(void *a1, const char *a2, ...)
{
  return [a1 _unpackAndDispatchMessage];
}

id objc_msgSend__waitEAGAIN(void *a1, const char *a2, ...)
{
  return [a1 _waitEAGAIN];
}

id objc_msgSend_absoluteString(void *a1, const char *a2, ...)
{
  return [a1 absoluteString];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return [a1 allKeys];
}

id objc_msgSend_allowsKeyedCoding(void *a1, const char *a2, ...)
{
  return [a1 allowsKeyedCoding];
}

id objc_msgSend_attributes(void *a1, const char *a2, ...)
{
  return [a1 attributes];
}

id objc_msgSend_BOOLResult(void *a1, const char *a2, ...)
{
  return [a1 BOOLResult];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_broadcast(void *a1, const char *a2, ...)
{
  return [a1 broadcast];
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return [a1 bytes];
}

id objc_msgSend_callStackSymbols(void *a1, const char *a2, ...)
{
  return [a1 callStackSymbols];
}

id objc_msgSend_cancel(void *a1, const char *a2, ...)
{
  return [a1 cancel];
}

id objc_msgSend_closeFile(void *a1, const char *a2, ...)
{
  return [a1 closeFile];
}

id objc_msgSend_closeSocketDescriptor(void *a1, const char *a2, ...)
{
  return [a1 closeSocketDescriptor];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_column(void *a1, const char *a2, ...)
{
  return [a1 column];
}

id objc_msgSend_commandBuffer(void *a1, const char *a2, ...)
{
  return [a1 commandBuffer];
}

id objc_msgSend_connect(void *a1, const char *a2, ...)
{
  return [a1 connect];
}

id objc_msgSend_connected(void *a1, const char *a2, ...)
{
  return [a1 connected];
}

id objc_msgSend_connection(void *a1, const char *a2, ...)
{
  return [a1 connection];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currentThread(void *a1, const char *a2, ...)
{
  return [a1 currentThread];
}

id objc_msgSend_data(void *a1, const char *a2, ...)
{
  return [a1 data];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_debugDescription(void *a1, const char *a2, ...)
{
  return [a1 debugDescription];
}

id objc_msgSend_debugSignposts(void *a1, const char *a2, ...)
{
  return [a1 debugSignposts];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return [a1 description];
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return [a1 domain];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return [a1 doubleValue];
}

id objc_msgSend_encodedAttributes(void *a1, const char *a2, ...)
{
  return [a1 encodedAttributes];
}

id objc_msgSend_encodedData(void *a1, const char *a2, ...)
{
  return [a1 encodedData];
}

id objc_msgSend_error(void *a1, const char *a2, ...)
{
  return [a1 error];
}

id objc_msgSend_errorStackTrace(void *a1, const char *a2, ...)
{
  return [a1 errorStackTrace];
}

id objc_msgSend_errorState(void *a1, const char *a2, ...)
{
  return [a1 errorState];
}

id objc_msgSend_filePath(void *a1, const char *a2, ...)
{
  return [a1 filePath];
}

id objc_msgSend_filePathURL(void *a1, const char *a2, ...)
{
  return [a1 filePathURL];
}

id objc_msgSend_finishDecoding(void *a1, const char *a2, ...)
{
  return [a1 finishDecoding];
}

id objc_msgSend_function(void *a1, const char *a2, ...)
{
  return [a1 function];
}

id objc_msgSend_functionName(void *a1, const char *a2, ...)
{
  return [a1 functionName];
}

id objc_msgSend_future(void *a1, const char *a2, ...)
{
  return [a1 future];
}

id objc_msgSend_getType(void *a1, const char *a2, ...)
{
  return [a1 getType];
}

id objc_msgSend_globalTraceObjectID(void *a1, const char *a2, ...)
{
  return [a1 globalTraceObjectID];
}

id objc_msgSend_globallyUniqueString(void *a1, const char *a2, ...)
{
  return [a1 globallyUniqueString];
}

id objc_msgSend_hasBeenSent(void *a1, const char *a2, ...)
{
  return [a1 hasBeenSent];
}

id objc_msgSend_hash(void *a1, const char *a2, ...)
{
  return [a1 hash];
}

id objc_msgSend_infoDictionary(void *a1, const char *a2, ...)
{
  return [a1 infoDictionary];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_invalid(void *a1, const char *a2, ...)
{
  return [a1 invalid];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_isFinished(void *a1, const char *a2, ...)
{
  return [a1 isFinished];
}

id objc_msgSend_isMainThread(void *a1, const char *a2, ...)
{
  return [a1 isMainThread];
}

id objc_msgSend_isiOSAppOnMac(void *a1, const char *a2, ...)
{
  return [a1 isiOSAppOnMac];
}

id objc_msgSend_kind(void *a1, const char *a2, ...)
{
  return [a1 kind];
}

id objc_msgSend_label(void *a1, const char *a2, ...)
{
  return [a1 label];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_line(void *a1, const char *a2, ...)
{
  return [a1 line];
}

id objc_msgSend_lock(void *a1, const char *a2, ...)
{
  return [a1 lock];
}

id objc_msgSend_logPerformance(void *a1, const char *a2, ...)
{
  return [a1 logPerformance];
}

id objc_msgSend_logs(void *a1, const char *a2, ...)
{
  return [a1 logs];
}

id objc_msgSend_longLongValue(void *a1, const char *a2, ...)
{
  return [a1 longLongValue];
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return [a1 mainBundle];
}

id objc_msgSend_message(void *a1, const char *a2, ...)
{
  return [a1 message];
}

id objc_msgSend_mutableBytes(void *a1, const char *a2, ...)
{
  return [a1 mutableBytes];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_objectPayload(void *a1, const char *a2, ...)
{
  return [a1 objectPayload];
}

id objc_msgSend_operatingSystemVersion(void *a1, const char *a2, ...)
{
  return [a1 operatingSystemVersion];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return [a1 path];
}

id objc_msgSend_payload(void *a1, const char *a2, ...)
{
  return [a1 payload];
}

id objc_msgSend_plistPayload(void *a1, const char *a2, ...)
{
  return [a1 plistPayload];
}

id objc_msgSend_processInfo(void *a1, const char *a2, ...)
{
  return [a1 processInfo];
}

id objc_msgSend_queue(void *a1, const char *a2, ...)
{
  return [a1 queue];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return [a1 removeAllObjects];
}

id objc_msgSend_replyBlock(void *a1, const char *a2, ...)
{
  return [a1 replyBlock];
}

id objc_msgSend_replySerial(void *a1, const char *a2, ...)
{
  return [a1 replySerial];
}

id objc_msgSend_replyTo(void *a1, const char *a2, ...)
{
  return [a1 replyTo];
}

id objc_msgSend_result(void *a1, const char *a2, ...)
{
  return [a1 result];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_scheme(void *a1, const char *a2, ...)
{
  return [a1 scheme];
}

id objc_msgSend_seekToEndOfFile(void *a1, const char *a2, ...)
{
  return [a1 seekToEndOfFile];
}

id objc_msgSend_serial(void *a1, const char *a2, ...)
{
  return [a1 serial];
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return [a1 set];
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return [a1 standardUserDefaults];
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return [a1 start];
}

id objc_msgSend_stringValue(void *a1, const char *a2, ...)
{
  return [a1 stringValue];
}

id objc_msgSend_timeIntervalSinceNow(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSinceNow];
}

id objc_msgSend_timeIntervalSinceReferenceDate(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSinceReferenceDate];
}

id objc_msgSend_timeout(void *a1, const char *a2, ...)
{
  return [a1 timeout];
}

id objc_msgSend_transport(void *a1, const char *a2, ...)
{
  return [a1 transport];
}

id objc_msgSend_unlock(void *a1, const char *a2, ...)
{
  return [a1 unlock];
}

id objc_msgSend_unpackedFilePath(void *a1, const char *a2, ...)
{
  return [a1 unpackedFilePath];
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntValue];
}

id objc_msgSend_unsignedLongLongValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedLongLongValue];
}

id objc_msgSend_unsignedLongValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedLongValue];
}

id objc_msgSend_url(void *a1, const char *a2, ...)
{
  return [a1 url];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}

id objc_msgSend_vmBuffer(void *a1, const char *a2, ...)
{
  return [a1 vmBuffer];
}

id objc_msgSend_wait(void *a1, const char *a2, ...)
{
  return [a1 wait];
}

id objc_msgSend_waitUntilFinished(void *a1, const char *a2, ...)
{
  return [a1 waitUntilFinished];
}

id objc_msgSend_waitUntilResolved(void *a1, const char *a2, ...)
{
  return [a1 waitUntilResolved];
}

id objc_msgSend_writeToURL_atomically_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeToURL:atomically:");
}
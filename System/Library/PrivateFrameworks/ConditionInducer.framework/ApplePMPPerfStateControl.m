@interface ApplePMPPerfStateControl
- (BOOL)_disableConsistentPerfState;
- (BOOL)_enableConsistentPerfState:(unsigned int)a3;
- (BOOL)_open:(unsigned int)a3;
- (BOOL)setupConnectionForPowerState:(unsigned int)a3;
- (void)_copySelectorsForService;
- (void)tearDown;
@end

@implementation ApplePMPPerfStateControl

- (void)tearDown
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  if (self->_connection)
  {
    [(ApplePMPPerfStateControl *)self _disableConsistentPerfState];
    IOServiceClose(self->_connection);
    self->_connection = 0;
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
    {
      int v3 = *MEMORY[0x263EF8960];
      v4[0] = 67109120;
      v4[1] = v3;
      _os_log_impl(&dword_22CE75000, &_os_log_internal, OS_LOG_TYPE_INFO, "PMP %u Connection Closed", (uint8_t *)v4, 8u);
    }
  }
}

- (BOOL)_enableConsistentPerfState:(unsigned int)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  if (a3 > 2) {
    return 0;
  }
  self->_powerState = a3;
  *(_OWORD *)input = 0u;
  long long v26 = 0u;
  uint64_t v27 = 0xFFFFFFFFLL;
  if (LODWORD(self->_nDomains))
  {
    char v5 = 0;
    unint64_t v6 = 0;
    stateValues = self->_domainInfos[0].stateValues;
    uint64_t v8 = a3;
    do
    {
      unint64_t v9 = stateValues[2];
      v10 = &stateValues[v8];
      BOOL v11 = v9 == 0;
      if (v9) {
        v12 = &stateValues[v8];
      }
      else {
        v12 = stateValues + 4;
      }
      unint64_t v13 = *v12;
      if (v11) {
        v10 = stateValues + 5;
      }
      unint64_t v14 = *v10;
      uint64_t v15 = v13 << (v5 & 0x3C);
      input[v6 >> 4] |= v15;
      unint64_t v16 = v14 << (v5 & 0x3C);
      input[(v6 >> 4) + 2] |= v16;
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
      {
        uint64_t v17 = *(stateValues - 1);
        *(_DWORD *)buf = 138413314;
        uint64_t v19 = v17;
        __int16 v20 = 2048;
        uint64_t v21 = v15;
        __int16 v22 = 1024;
        *(_DWORD *)v23 = v6 >> 4;
        *(_WORD *)&v23[4] = 2048;
        *(void *)&v23[6] = v16;
        *(_WORD *)&v23[14] = 1024;
        *(_DWORD *)&v23[16] = (v6 >> 4) + 2;
        _os_log_impl(&dword_22CE75000, &_os_log_internal, OS_LOG_TYPE_INFO, "Setting Domain %@ 0x%llx at %u, 0x%llx at %u", buf, 0x2Cu);
      }
      ++v6;
      v5 += 4;
      stateValues += 7;
    }
    while (v6 < LODWORD(self->_nDomains));
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134219008;
    uint64_t v19 = input[0];
    __int16 v20 = 2048;
    uint64_t v21 = input[1];
    __int16 v22 = 2048;
    *(void *)v23 = v26;
    *(_WORD *)&v23[8] = 2048;
    *(void *)&v23[10] = *((void *)&v26 + 1);
    *(_WORD *)&v23[18] = 2048;
    uint64_t v24 = v27;
    _os_log_impl(&dword_22CE75000, &_os_log_internal, OS_LOG_TYPE_INFO, "PMP Enable {0x%llx, 0x%llx, 0x%llx, 0x%llx, 0x%llx}", buf, 0x34u);
  }
  return SetDVFSStates(self->_connection, input) == 0;
}

- (BOOL)_disableConsistentPerfState
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  uint64_t v21 = 0;
  *(_OWORD *)input = 0u;
  long long v20 = 0u;
  if (LODWORD(self->_nDomains))
  {
    char v3 = 0;
    unint64_t v4 = 0;
    p_currentMaxState = &self->_domainInfos[0].currentMaxState;
    unint64_t v6 = &_os_log_internal;
    do
    {
      char v7 = v3 & 0x3C;
      input[v4 >> 4] |= *(p_currentMaxState - 1) << (v3 & 0x3C);
      input[(v4 >> 4) + 2] |= *p_currentMaxState << (v3 & 0x3C);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        uint64_t v8 = *(p_currentMaxState - 6);
        uint64_t v9 = *(p_currentMaxState - 1) << v7;
        unint64_t v10 = *p_currentMaxState << v7;
        *(_DWORD *)buf = 138413314;
        uint64_t v13 = v8;
        __int16 v14 = 2048;
        uint64_t v15 = v9;
        __int16 v16 = 1024;
        *(_DWORD *)uint64_t v17 = v4 >> 4;
        *(_WORD *)&v17[4] = 2048;
        *(void *)&v17[6] = v10;
        *(_WORD *)&v17[14] = 1024;
        *(_DWORD *)&v17[16] = (v4 >> 4) + 2;
        _os_log_impl(&dword_22CE75000, v6, OS_LOG_TYPE_INFO, "Setting Domain %@ 0x%llx at %u, 0x%llx at %u", buf, 0x2Cu);
      }
      ++v4;
      v3 += 4;
      p_currentMaxState += 7;
    }
    while (v4 < LODWORD(self->_nDomains));
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134219008;
    uint64_t v13 = input[0];
    __int16 v14 = 2048;
    uint64_t v15 = input[1];
    __int16 v16 = 2048;
    *(void *)uint64_t v17 = v20;
    *(_WORD *)&v17[8] = 2048;
    *(void *)&v17[10] = *((void *)&v20 + 1);
    *(_WORD *)&v17[18] = 2048;
    uint64_t v18 = v21;
    _os_log_impl(&dword_22CE75000, &_os_log_internal, OS_LOG_TYPE_INFO, "PMP Disable {0x%llx, 0x%llx, 0x%llx, 0x%llx, 0x%llx}", buf, 0x34u);
  }
  self->_powerState = 3;
  return SetDVFSStates(self->_connection, input) == 0;
}

- (BOOL)_open:(unsigned int)a3
{
  mach_error_t v3 = IOServiceOpen(a3, *MEMORY[0x263EF8960], 0, &self->_connection);
  if (v3 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT)) {
    -[ApplePMPPerfStateControl _open:](v3);
  }
  return v3 == 0;
}

- (void)_copySelectorsForService
{
  uint64_t v2 = 0;
  int v3 = 2;
  if (!self->_currentPMPVersion) {
    int v3 = 13;
  }
  do
  {
    gClientMethodSelectors[v2] = v3 + v2;
    ++v2;
  }
  while (v2 != 5);
}

- (BOOL)setupConnectionForPowerState:(unsigned int)a3
{
  kern_return_t v12;
  mach_error_t v13;
  uint64_t v14;
  unint64_t nDomains;
  uint64_t v16;
  unsigned int v17;
  BOOL v18;
  size_t v19;
  kern_return_t v20;
  mach_error_t v21;
  __CFString *v22;
  uint64_t v23;
  void **p_name;
  _OWORD *v25;
  void *v26;
  uint64_t *v27;
  mach_port_t connection;
  kern_return_t v29;
  mach_error_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  unint64_t v36;
  $8C24219F9D2EBCE5C72C8FC7CFBBB360 *v37;
  void *v38;
  void *v39;
  unsigned int v41;
  size_t outputStructCnt;
  uint8_t outputStruct[8];
  void v44[3];
  uint32_t outputCnt[8];
  long long v46;
  long long v47;
  long long v48;
  long long v49;
  long long v50;
  long long v51;
  uint8_t buf[32];
  long long v53;
  long long v54;
  long long v55;
  long long v56;
  long long v57;
  long long v58;
  uint64_t v59;

  v59 = *MEMORY[0x263EF8340];
  self->_unsigned int currentPMPVersion = 0;
  mach_port_t v5 = *MEMORY[0x263F0EC90];
  CFDictionaryRef v6 = IOServiceMatching("ApplePMP");
  uint64_t MatchingService = IOServiceGetMatchingService(v5, v6);
  if (!MatchingService)
  {
    CFDictionaryRef v8 = IOServiceMatching("ApplePMPv2");
    uint64_t v9 = IOServiceGetMatchingService(v5, v8);
    if (!v9) {
      return v9;
    }
    uint64_t MatchingService = v9;
    self->_unsigned int currentPMPVersion = 1;
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    unsigned int currentPMPVersion = self->_currentPMPVersion;
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&uint8_t buf[4] = currentPMPVersion;
    _os_log_impl(&dword_22CE75000, &_os_log_internal, OS_LOG_TYPE_INFO, "Setting PMP Version %u", buf, 8u);
  }
  [(ApplePMPPerfStateControl *)self _copySelectorsForService];
  domainInfos = self->_domainInfos;
  bzero(self->_domainInfos, 0x700uLL);
  LODWORD(v9) = [(ApplePMPPerfStateControl *)self _open:MatchingService];
  if (v9)
  {
    LODWORD(v9) = self->_connection;
    if (!v9)
    {
LABEL_12:
      self->_nDomains = 0;
      return v9;
    }
    v57 = 0u;
    v58 = 0u;
    v55 = 0u;
    v56 = 0u;
    v53 = 0u;
    v54 = 0u;
    memset(buf, 0, sizeof(buf));
    outputCnt[0] = 1;
    v12 = IOConnectCallMethod(v9, gClientMethodSelectors[0], 0, 0, 0, 0, (uint64_t *)buf, outputCnt, 0, 0);
    if (v12)
    {
      uint64_t v13 = v12;
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT)) {
        -[ApplePMPPerfStateControl setupConnectionForPowerState:](v13);
      }
      LOBYTE(v9) = 0;
      goto LABEL_12;
    }
    __int16 v14 = *(void *)buf;
    self->_nDomains = *(void *)buf;
    if (v14)
    {
      v41 = a3;
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
      {
        nDomains = self->_nDomains;
        *(_DWORD *)buf = 134217984;
        *(void *)&uint8_t buf[4] = nDomains;
        _os_log_impl(&dword_22CE75000, &_os_log_internal, OS_LOG_TYPE_INFO, "Number of Domains %llu", buf, 0xCu);
      }
      if (self->_nDomains)
      {
        __int16 v16 = 0;
        while (1)
        {
          LODWORD(v9) = self->_connection;
          if (!v9) {
            break;
          }
          uint64_t v17 = self->_currentPMPVersion;
          *(void *)buf = v16;
          *(void *)outputStruct = 0;
          v44[0] = 0;
          uint64_t v18 = v17 == 0;
          uint64_t v19 = 16;
          if (v18) {
            uint64_t v19 = 10;
          }
          outputStructCnt = v19;
          long long v20 = IOConnectCallMethod(v9, dword_268520B10, (const uint64_t *)buf, 1u, 0, 0, 0, 0, outputStruct, &outputStructCnt);
          if (v20)
          {
            uint64_t v21 = v20;
            if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT))
            {
              v38 = [NSString stringWithUTF8String:mach_error_string(v21)];
              outputCnt[0] = 67109378;
              outputCnt[1] = v21;
              LOWORD(outputCnt[2]) = 2112;
              *(void *)((char *)&outputCnt[2] + 2) = v38;
              _os_log_fault_impl(&dword_22CE75000, &_os_log_internal, OS_LOG_TYPE_FAULT, "_getDVFSDomainName (0x%x - %@)", (uint8_t *)outputCnt, 0x12u);
            }
          }
          if (outputStructCnt)
          {
            uint64_t v22 = [NSString stringWithUTF8String:outputStruct];
            if (!v22) {
              goto LABEL_49;
            }
          }
          else
          {
            uint64_t v22 = &stru_26E04D128;
          }
          if (![(__CFString *)v22 length]) {
            goto LABEL_49;
          }
          v23 = [(__CFString *)v22 copy];
          p_name = (void **)&domainInfos[v16].name;
          long long v26 = *p_name;
          v25 = p_name + 5;
          *p_name = (void *)v23;
          uint64_t v27 = (uint64_t *)(p_name + 6);

          connection = self->_connection;
          if (connection)
          {
            v50 = 0u;
            v51 = 0u;
            v48 = 0u;
            v49 = 0u;
            v46 = 0u;
            v47 = 0u;
            memset(outputCnt, 0, sizeof(outputCnt));
            *(void *)buf = v16;
            LODWORD(outputStructCnt) = 3;
            v29 = IOConnectCallMethod(connection, dword_268520B0C, (const uint64_t *)buf, 1u, 0, 0, (uint64_t *)outputCnt, (uint32_t *)&outputStructCnt, 0, 0);
            if (v29)
            {
              v30 = v29;
              if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT))
              {
                v39 = [NSString stringWithUTF8String:mach_error_string(v30)];
                *(_DWORD *)outputStruct = 67109378;
                *(_DWORD *)&outputStruct[4] = v30;
                LOWORD(v44[0]) = 2112;
                *(void *)((char *)v44 + 2) = v39;
                _os_log_fault_impl(&dword_22CE75000, &_os_log_internal, OS_LOG_TYPE_FAULT, "_getNumDVFSStates (0x%x - %@)", outputStruct, 0x12u);
              }
            }
            v31 = *(void *)outputCnt;
            if (*(void *)outputCnt) {
              *v25 = *(_OWORD *)&outputCnt[2];
            }
          }
          else
          {
            v31 = 0;
          }
          if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
          {
            v32 = *(void *)v25;
            v33 = *v27;
            *(_DWORD *)buf = 134218754;
            *(void *)&uint8_t buf[4] = v31;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v22;
            *(_WORD *)&buf[22] = 2048;
            *(void *)&buf[24] = v32;
            LOWORD(v53) = 2048;
            *(void *)((char *)&v53 + 2) = v33;
            _os_log_impl(&dword_22CE75000, &_os_log_internal, OS_LOG_TYPE_INFO, "%llu states in Domains %@, Current Range: [%llu -> %llu]", buf, 0x2Au);
          }
          if (!v31)
          {
LABEL_49:

            goto LABEL_50;
          }
          if ([&unk_26E0512D8 count])
          {
            v34 = 0;
            while (1)
            {
              v35 = [&unk_26E0512D8 objectAtIndexedSubscript:v34];
              if ([(__CFString *)v22 hasPrefix:v35])
              {
                v36 = [v35 length] + 1;
                if (v36 >= [(__CFString *)v22 length]) {
                  break;
                }
              }

              if (++v34 >= (unint64_t)[&unk_26E0512D8 count]) {
                goto LABEL_47;
              }
            }
            v37 = &domainInfos[v16];
            v37->stateValues[2] = v31 - 1;
            v37->stateValues[0] = 0;
            v37->stateValues[1] = (unint64_t)(v31 - 1) >> 1;
          }
LABEL_47:

          if (++v16 >= self->_nDomains) {
            goto LABEL_48;
          }
        }
      }
      else
      {
LABEL_48:
        LOBYTE(v9) = [(ApplePMPPerfStateControl *)self _enableConsistentPerfState:v41];
      }
    }
    else
    {
LABEL_50:
      LOBYTE(v9) = 0;
    }
  }
  return v9;
}

- (void).cxx_destruct
{
  for (uint64_t i = 1768; i != -24; i -= 56)
}

- (void)_open:(mach_error_t)a1 .cold.1(mach_error_t a1)
{
  v1 = [NSString stringWithUTF8String:mach_error_string(a1)];
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_3(&dword_22CE75000, &_os_log_internal, v2, "IOServiceOpen (0x%x - %@)", v3, v4, v5, v6, v7);
}

- (void)setupConnectionForPowerState:(mach_error_t)a1 .cold.1(mach_error_t a1)
{
  v1 = [NSString stringWithUTF8String:mach_error_string(a1)];
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_3(&dword_22CE75000, &_os_log_internal, v2, "_getNumDVFSDomains (0x%x - %@)", v3, v4, v5, v6, v7);
}

@end
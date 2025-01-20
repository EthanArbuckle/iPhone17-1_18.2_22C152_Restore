@interface DSAppleSMCDevice
- (BOOL)closeAppleSMC;
- (BOOL)isConnectionOpen;
- (BOOL)openAppleSMC:(int)a3;
- (BOOL)writeDataFor:(id)a3 value:(void *)a4 size:(unint64_t)a5;
- (BOOL)writeValueFor:(id)a3 andValue:(id)a4;
- (DSAppleSMCDevice)init;
- (double)readValueFor:(id)a3;
- (int)readDataFor:(id)a3 value:(void *)a4 size:(unint64_t)a5;
- (unsigned)dataPort;
- (void)closeAppleSMC;
- (void)setDataPort:(unsigned int)a3;
- (void)setIsConnectionOpen:(BOOL)a3;
@end

@implementation DSAppleSMCDevice

- (DSAppleSMCDevice)init
{
  v3.receiver = self;
  v3.super_class = (Class)DSAppleSMCDevice;
  result = [(DSAppleSMCDevice *)&v3 init];
  if (result)
  {
    result->_dataPort = 0;
    result->_isConnectionOpen = 0;
  }
  return result;
}

- (BOOL)openAppleSMC:(int)a3
{
  *(void *)existing = 0;
  io_connect_t connect = 0;
  if (self->_isConnectionOpen)
  {
    BOOL v5 = [(DSAppleSMCDevice *)self closeAppleSMC];
    v6 = DiagnosticLogHandleForCategory(6);
    v7 = v6;
    if (v5)
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        -[DSAppleSMCDevice openAppleSMC:].cold.5();
      }

      return 0;
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v16 = 0;
      _os_log_impl(&dword_22CA94000, v7, OS_LOG_TYPE_DEFAULT, "Closed an existing SMC connection.", v16, 2u);
    }
  }
  if (MEMORY[0x230F726F0](0, &existing[1]))
  {
    v9 = DiagnosticLogHandleForCategory(6);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[DSAppleSMCDevice openAppleSMC:].cold.4();
    }
LABEL_16:

    BOOL result = 0;
    self->_dataPort = 0;
    return result;
  }
  mach_port_t v10 = existing[1];
  CFDictionaryRef v11 = IOServiceMatching("AppleSMC");
  if (IOServiceGetMatchingServices(v10, v11, existing))
  {
    v9 = DiagnosticLogHandleForCategory(6);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[DSAppleSMCDevice openAppleSMC:]();
    }
    goto LABEL_16;
  }
  io_service_t v12 = IOIteratorNext(existing[0]);
  IOObjectRelease(existing[0]);
  if (v12)
  {
    if (IOServiceOpen(v12, *MEMORY[0x263EF8960], a3, &connect))
    {
      v13 = DiagnosticLogHandleForCategory(6);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        -[DSAppleSMCDevice openAppleSMC:]();
      }

      return 0;
    }
    io_connect_t v15 = connect;
  }
  else
  {
    v14 = DiagnosticLogHandleForCategory(6);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[DSAppleSMCDevice openAppleSMC:](v14);
    }

    io_connect_t v15 = 0;
  }
  self->_dataPort = v15;
  BOOL result = 1;
  self->_isConnectionOpen = 1;
  return result;
}

- (BOOL)closeAppleSMC
{
  if (IOConnectCallScalarMethod(self->_dataPort, 1u, 0, 0, 0, 0))
  {
    objc_super v3 = DiagnosticLogHandleForCategory(6);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      -[DSAppleSMCDevice closeAppleSMC]();
    }
LABEL_7:

    return 0;
  }
  if (IOServiceClose(self->_dataPort))
  {
    objc_super v3 = DiagnosticLogHandleForCategory(6);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      -[DSAppleSMCDevice closeAppleSMC]();
    }
    goto LABEL_7;
  }
  self->_dataPort = 0;
  self->_isConnectionOpen = 0;
  return 1;
}

- (double)readValueFor:(id)a3
{
  uint64_t v61 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  int v60 = 0;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  int v48 = 0;
  uint64_t v36 = 0;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  memset(v22, 0, sizeof(v22));
  long long v23 = 0u;
  memset(v24, 0, sizeof(v24));
  uint64_t v25 = 0;
  if (![(DSAppleSMCDevice *)self isConnectionOpen])
  {
    BOOL v5 = DiagnosticLogHandleForCategory(6);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[DSAppleSMCDevice readValueFor:]();
    }
  }
  id v6 = v4;
  v7 = (const char *)[v6 cStringUsingEncoding:4];
  int v49 = smckSMCMakeUInt32Key(v7);
  BYTE6(v52) = 9;
  int v8 = callIOFunction(2, [(DSAppleSMCDevice *)self dataPort], &v49, &v26);
  if (v8 || BYTE8(v28))
  {
    v13 = DiagnosticLogHandleForCategory(6);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      int v16 = 136315650;
      v17 = v7;
      __int16 v18 = 1024;
      int v19 = v8;
      __int16 v20 = 1024;
      int v21 = BYTE8(v28);
      io_connect_t v15 = "Could not retrieve Key info from AppleSMC for key: %s (0x%X, 0x%X)";
      goto LABEL_18;
    }
LABEL_12:

    goto LABEL_13;
  }
  if (HIDWORD(v27) > 0x78)
  {
LABEL_13:
    double v12 = NAN;
    goto LABEL_14;
  }
  BYTE4(v40) = 0;
  int v37 = smckSMCMakeUInt32Key(v7);
  DWORD2(v39) = HIDWORD(v27);
  BYTE6(v40) = 5;
  int v9 = callIOFunction(2, [(DSAppleSMCDevice *)self dataPort], &v37, v22);
  if (v9 || BYTE8(v23))
  {
    v13 = DiagnosticLogHandleForCategory(6);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      int v16 = 136315650;
      v17 = v7;
      __int16 v18 = 1024;
      int v19 = v9;
      __int16 v20 = 1024;
      int v21 = BYTE8(v23);
      io_connect_t v15 = "Could not read data value from AppleSMC for key: %s (0x%X, 0x%X)";
LABEL_18:
      _os_log_error_impl(&dword_22CA94000, v13, OS_LOG_TYPE_ERROR, v15, (uint8_t *)&v16, 0x18u);
      goto LABEL_12;
    }
    goto LABEL_12;
  }
  int v10 = returnEnumForDataTypeStr(v28);
  double v12 = convertKeyToValueMiniT(v10, DWORD2(v39), v24, v11);
LABEL_14:

  return v12;
}

- (int)readDataFor:(id)a3 value:(void *)a4 size:(unint64_t)a5
{
  uint64_t v63 = *MEMORY[0x263EF8340];
  id v8 = a3;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  int v62 = 0;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  int v50 = 0;
  uint64_t v38 = 0;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  *(_OWORD *)__n = 0u;
  memset(v24, 0, sizeof(v24));
  long long v25 = 0u;
  memset(v26, 0, sizeof(v26));
  uint64_t v27 = 0;
  if (![(DSAppleSMCDevice *)self isConnectionOpen])
  {
    int v9 = DiagnosticLogHandleForCategory(6);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[DSAppleSMCDevice readValueFor:]();
    }
  }
  id v10 = v8;
  double v11 = (const char *)[v10 cStringUsingEncoding:4];
  int v51 = smckSMCMakeUInt32Key(v11);
  BYTE6(v54) = 9;
  int v12 = callIOFunction(2, [(DSAppleSMCDevice *)self dataPort], &v51, &v28);
  if (v12 || BYTE8(v30))
  {
    io_connect_t v15 = DiagnosticLogHandleForCategory(6);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      int v18 = 136315650;
      int v19 = v11;
      __int16 v20 = 1024;
      int v21 = v12;
      __int16 v22 = 1024;
      int v23 = BYTE8(v30);
      v17 = "Could not retrieve Key info from AppleSMC for key: %s (0x%X, 0x%X)";
      goto LABEL_18;
    }
LABEL_13:

    int v13 = 0;
    goto LABEL_14;
  }
  int v13 = 0;
  if (HIDWORD(__n[1]) <= 0x78 && HIDWORD(__n[1]) <= a5)
  {
    BYTE4(v42) = 0;
    int v39 = smckSMCMakeUInt32Key(v11);
    DWORD2(v41) = HIDWORD(__n[1]);
    BYTE6(v42) = 5;
    int v14 = callIOFunction(2, [(DSAppleSMCDevice *)self dataPort], &v39, v24);
    if (!v14 && !BYTE8(v25))
    {
      memcpy(a4, v26, HIDWORD(__n[1]));
      int v13 = 1;
      goto LABEL_14;
    }
    io_connect_t v15 = DiagnosticLogHandleForCategory(6);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      int v18 = 136315650;
      int v19 = v11;
      __int16 v20 = 1024;
      int v21 = v14;
      __int16 v22 = 1024;
      int v23 = BYTE8(v25);
      v17 = "Could not read data value from AppleSMC for key: %s (0x%X, 0x%X)";
LABEL_18:
      _os_log_error_impl(&dword_22CA94000, v15, OS_LOG_TYPE_ERROR, v17, (uint8_t *)&v18, 0x18u);
      goto LABEL_13;
    }
    goto LABEL_13;
  }
LABEL_14:

  return v13;
}

- (BOOL)writeValueFor:(id)a3 andValue:(id)a4
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  int v53 = 0;
  long long v38 = 0u;
  long long v39 = 0u;
  memset(v40, 0, sizeof(v40));
  int v41 = 0;
  uint64_t v36 = 0;
  memset(v35, 0, sizeof(v35));
  memset(v25, 0, sizeof(v25));
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  uint64_t v34 = 0;
  if (![(DSAppleSMCDevice *)self isConnectionOpen])
  {
    id v8 = DiagnosticLogHandleForCategory(6);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[DSAppleSMCDevice writeValueFor:andValue:]();
    }
  }
  id v9 = v6;
  id v10 = (const char *)[v9 cStringUsingEncoding:4];
  int v42 = smckSMCMakeUInt32Key(v10);
  BYTE6(v45) = 9;
  int v11 = callIOFunction(2, [(DSAppleSMCDevice *)self dataPort], &v42, v35);
  if (v11 || BYTE8(v35[2]))
  {
    int v16 = DiagnosticLogHandleForCategory(6);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      int v19 = 136315650;
      __int16 v20 = v10;
      __int16 v21 = 1024;
      int v22 = v11;
      __int16 v23 = 1024;
      int v24 = BYTE8(v35[2]);
      int v18 = "Could not retrieve Key info from AppleSMC for key: %s (0x%X, 0x%X)";
      goto LABEL_20;
    }
LABEL_13:

    BOOL v12 = 0;
    goto LABEL_14;
  }
  v40[4] = 0;
  BOOL v12 = 0;
  int v37 = smckSMCMakeUInt32Key(v10);
  *((void *)&v39 + 1) = *(void *)((char *)&v35[1] + 12);
  v40[6] = 6;
  if (BYTE12(v35[1]) <= 0x78u)
  {
    uint64_t v13 = returnEnumForDataTypeStr(v35[2]);
    [v7 floatValue];
    if (translateFloatToFixed(v13, &v40[12], HIDWORD(v35[1]), v14) != 1)
    {
      int v16 = DiagnosticLogHandleForCategory(6);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        -[DSAppleSMCDevice writeValueFor:andValue:]();
      }
      goto LABEL_13;
    }
    int v15 = callIOFunction(2, [(DSAppleSMCDevice *)self dataPort], &v37, v25);
    if (!v15 && !BYTE8(v26))
    {
      BOOL v12 = 1;
      goto LABEL_14;
    }
    int v16 = DiagnosticLogHandleForCategory(6);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      int v19 = 136315650;
      __int16 v20 = v10;
      __int16 v21 = 1024;
      int v22 = v15;
      __int16 v23 = 1024;
      int v24 = BYTE8(v26);
      int v18 = "Could not write data value from AppleSMC for key: %s (0x%X, 0x%X)";
LABEL_20:
      _os_log_error_impl(&dword_22CA94000, v16, OS_LOG_TYPE_ERROR, v18, (uint8_t *)&v19, 0x18u);
      goto LABEL_13;
    }
    goto LABEL_13;
  }
LABEL_14:

  return v12;
}

- (BOOL)writeDataFor:(id)a3 value:(void *)a4 size:(unint64_t)a5
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v8 = a3;
  long long v36 = 0u;
  long long v37 = 0u;
  memset(v38, 0, sizeof(v38));
  int v39 = 0;
  memset(v25, 0, sizeof(v25));
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  uint64_t v34 = 0;
  if (![(DSAppleSMCDevice *)self isConnectionOpen])
  {
    id v9 = DiagnosticLogHandleForCategory(6);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[DSAppleSMCDevice writeValueFor:andValue:]();
    }
  }
  id v10 = v8;
  int v11 = (const char *)[v10 cStringUsingEncoding:4];
  v38[6] = 6;
  int v35 = smckSMCMakeUInt32Key(v11);
  DWORD2(v37) = a5;
  if (a5)
  {
    unint64_t v12 = a5 - 1;
    if (a5 - 1 >= 0x1F) {
      unint64_t v12 = 31;
    }
    memcpy(&v38[12], a4, v12 + 1);
  }
  int v13 = callIOFunction(2, [(DSAppleSMCDevice *)self dataPort], &v35, v25);
  int v14 = v13 | BYTE8(v26);
  BOOL v15 = v14 == 0;
  if (v14)
  {
    int v16 = v13;
    v17 = DiagnosticLogHandleForCategory(6);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      int v19 = 136315650;
      __int16 v20 = v11;
      __int16 v21 = 1024;
      int v22 = v16;
      __int16 v23 = 1024;
      int v24 = BYTE8(v26);
      _os_log_error_impl(&dword_22CA94000, v17, OS_LOG_TYPE_ERROR, "Failed to write AppleSMC data for key: %s (0x%X, 0x%X)", (uint8_t *)&v19, 0x18u);
    }
  }
  return v15;
}

- (unsigned)dataPort
{
  return self->_dataPort;
}

- (void)setDataPort:(unsigned int)a3
{
  self->_dataPort = a3;
}

- (BOOL)isConnectionOpen
{
  return self->_isConnectionOpen;
}

- (void)setIsConnectionOpen:(BOOL)a3
{
  self->_isConnectionOpen = a3;
}

- (void)openAppleSMC:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_22CA94000, log, OS_LOG_TYPE_ERROR, "ServiceObject for AppleSMC service is NULL", v1, 2u);
}

- (void)openAppleSMC:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_22CA94000, v0, v1, "Error opening AppleSMC service: %d", v2, v3, v4, v5, v6);
}

- (void)openAppleSMC:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_22CA94000, v0, v1, "Error finding AppleSMC service: %d", v2, v3, v4, v5, v6);
}

- (void)openAppleSMC:.cold.4()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_22CA94000, v0, v1, "Error obtaining main IO port error: %d", v2, v3, v4, v5, v6);
}

- (void)openAppleSMC:.cold.5()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_22CA94000, v0, v1, "Failed to closed an existing SMC connection. Aborting Open. %d", v2, v3, v4, v5, v6);
}

- (void)closeAppleSMC
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_22CA94000, v0, v1, "Could not close AppleSMC dataPort: %d", v2, v3, v4, v5, v6);
}

- (void)readValueFor:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0(&dword_22CA94000, v0, v1, "Could not read value for key: %@. AppleSMC Connection is not active.", v2, v3, v4, v5, v6);
}

- (void)writeValueFor:andValue:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0(&dword_22CA94000, v0, v1, "Could not translate write value into proper write format for key: %s", v2, v3, v4, v5, v6);
}

- (void)writeValueFor:andValue:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0(&dword_22CA94000, v0, v1, "Could not write value for key: %@. AppleSMC Connection is not active.", v2, v3, v4, v5, v6);
}

@end
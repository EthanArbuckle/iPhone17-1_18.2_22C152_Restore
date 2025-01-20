@interface GpsDevice
- (BOOL)getGpsConfiguration:(id *)a3 error:(id *)a4;
- (BOOL)testApSignalGpio:(id *)a3;
- (BOOL)testCommPing:(id *)a3 id:(id *)a4 error:(id *)a5;
- (BOOL)testCommPing:(id)a3 error:(id *)a4;
- (BOOL)testExternalFreqAssistance:(id *)a3;
- (BOOL)testGpsCw:(id)a3 error:(id *)a4;
- (BOOL)testGpsModulated:(id)a3 gpsPrn:(int)a4 error:(id *)a5;
- (BOOL)testPeriodic:(id)a3 error:(id *)a4;
- (BOOL)testPowerMode:(unsigned __int8)a3 error:(id *)a4;
- (BOOL)testTimeMarkGpio:(id *)a3;
- (Options)fTestOptions;
- (id).cxx_construct;
- (id)init:(id *)a3;
- (void)dealloc;
- (void)fTestDevice;
- (void)flushLogs;
- (void)setFTestDevice:(void *)a3;
- (void)setFTestOptions:(Options *)a3;
@end

@implementation GpsDevice

- (id)init:(id *)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v7.receiver = self;
  v7.super_class = (Class)GpsDevice;
  [(GpsDevice *)&v7 init];
  if (!GpsdLogObjectGeneral) {
    GpsdLogObjectGeneral = (uint64_t)os_log_create("com.apple.gpstest", "general");
  }
  if (!GpsdLogObjectWarning) {
    GpsdLogObjectWarning = (uint64_t)os_log_create("com.apple.gpstest", "Warning");
  }
  if (!GpsdLogObjectDevice) {
    GpsdLogObjectDevice = (uint64_t)os_log_create("com.apple.gpstest", "device");
  }
  if (!GpsdLogObjectNmea) {
    GpsdLogObjectNmea = (uint64_t)os_log_create("com.apple.gpstest", "NMEA");
  }
  if (!GpsdLogObjectGem) {
    GpsdLogObjectGem = (uint64_t)os_log_create("com.apple.gpstest", "gem");
  }
  v3 = GpsdLogObjectGeneral;
  if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_237AFF000, v3, OS_LOG_TYPE_DEBUG, "Logging init, check if the level is enabled", buf, 2u);
    v3 = GpsdLogObjectGeneral;
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_237AFF000, v3, OS_LOG_TYPE_INFO, "Logging init, check if the level is enabled", buf, 2u);
    v3 = GpsdLogObjectGeneral;
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_237AFF000, v3, OS_LOG_TYPE_DEFAULT, "Logging init, check if the level is enabled", buf, 2u);
    v3 = GpsdLogObjectGeneral;
  }
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    double ProcessUptimeSec = gpsd::util::getProcessUptimeSec((gpsd::util *)v4);
    *(_DWORD *)buf = 134217984;
    *(double *)&buf[4] = ProcessUptimeSec;
    _os_log_impl(&dword_237AFF000, v3, OS_LOG_TYPE_DEFAULT, "Record process start time, %.1f", buf, 0xCu);
  }
  GpsdPreferences::instance(4);
  CoreGPSTestPreflight();
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)GpsDevice;
  [(GpsDevice *)&v2 dealloc];
}

- (BOOL)getGpsConfiguration:(id *)a3 error:(id *)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  fTestDevice = (uint64_t (****)(void, SEL))self->_fTestDevice;
  if (fTestDevice) {
    int v7 = (**fTestDevice[66])(fTestDevice[66], a2);
  }
  else {
    int v7 = -1;
  }
  a3->int var2 = v7;
  v8 = (unsigned int *)GpsdPlatformInfo::instance(0);
  unsigned int v9 = *v8;
  a3->unsigned int var0 = *v8;
  if (!v9)
  {
    +[GpsError setError:a4 withCode:4 format:@"Unrecognized hardware"];
    v15 = GpsdLogObjectGeneral;
    BOOL v14 = os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR);
    if (!v14) {
      return v14;
    }
    LOWORD(v18[0]) = 0;
    v16 = "Unknown hardware platform";
    goto LABEL_14;
  }
  unsigned int v10 = *(_DWORD *)(GpsdPlatformInfo::instance(0) + 8);
  a3->var1 = v10;
  if (!v10)
  {
    +[GpsError setError:a4 withCode:4 format:@"Unrecognized gnss chip"];
    v15 = GpsdLogObjectGeneral;
    BOOL v14 = os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR);
    if (!v14) {
      return v14;
    }
    LOWORD(v18[0]) = 0;
    v16 = "Unknown gnss chip";
LABEL_14:
    _os_log_error_impl(&dword_237AFF000, v15, OS_LOG_TYPE_ERROR, v16, (uint8_t *)v18, 2u);
    LOBYTE(v14) = 0;
    return v14;
  }
  v11 = GpsdLogObjectGeneral;
  if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int var0 = a3->var0;
    int var2 = a3->var2;
    v18[0] = 67109632;
    v18[1] = var0;
    __int16 v19 = 1024;
    unsigned int v20 = v10;
    __int16 v21 = 1024;
    int v22 = var2;
    _os_log_impl(&dword_237AFF000, v11, OS_LOG_TYPE_DEFAULT, "deviceConfig,%d,hwConfig,%d,dylibIfc,%d", (uint8_t *)v18, 0x14u);
  }
  LOBYTE(v14) = 1;
  return v14;
}

- (BOOL)testTimeMarkGpio:(id *)a3
{
  std::string::basic_string[abi:ne180100]<0>(__p, "");
  fTestDevice = (GpsFactoryTest *)self->_fTestDevice;
  if (fTestDevice) {
    unsigned int v6 = GpsFactoryTest::testTimeMark(fTestDevice);
  }
  else {
    unsigned int v6 = forkProcessGpsTest((uint64_t)__p, objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:", @"--time-mark", @"10000", 0));
  }
  unsigned int v7 = v6;
  if (v6 == 1)
  {
    if (a3) {
      *a3 = 0;
    }
  }
  else
  {
    if (v6 > 8)
    {
      uint64_t v8 = 0;
      unsigned int v9 = @"Success";
    }
    else
    {
      uint64_t v8 = dword_237B310BC[v6];
      unsigned int v9 = off_264CF00D0[v6];
    }
    +[GpsError setError:a3, v8, @"%@", v9 withCode format];
  }
  if (v12 < 0) {
    operator delete(__p[0]);
  }
  return v7 == 1;
}

- (BOOL)testApSignalGpio:(id *)a3
{
  __p[0] = 0;
  __p[1] = 0;
  uint64_t v11 = 0;
  fTestDevice = (GpsFactoryTest *)self->_fTestDevice;
  if (fTestDevice) {
    unsigned int v5 = GpsFactoryTest::testApSignal(fTestDevice);
  }
  else {
    unsigned int v5 = forkProcessGpsTest((uint64_t)__p, objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:", @"--host-wake", @"1000", 0));
  }
  unsigned int v6 = v5;
  if (v5 == 1)
  {
    if (a3) {
      *a3 = 0;
    }
  }
  else
  {
    if (v5 > 8)
    {
      uint64_t v7 = 0;
      uint64_t v8 = @"Success";
    }
    else
    {
      uint64_t v7 = dword_237B310BC[v5];
      uint64_t v8 = off_264CF00D0[v5];
    }
    +[GpsError setError:a3, v7, @"%@", v8 withCode format];
  }
  if (SHIBYTE(v11) < 0) {
    operator delete(__p[0]);
  }
  return v6 == 1;
}

- (BOOL)testCommPing:(id)a3 error:(id *)a4
{
  return [(GpsDevice *)self testCommPing:0 id:0 error:a4];
}

- (BOOL)testCommPing:(id *)a3 id:(id *)a4 error:(id *)a5
{
  std::string::basic_string[abi:ne180100]<0>(&__str, "");
  fTestDevice = self->_fTestDevice;
  if (fTestDevice)
  {
    unsigned int v10 = GpsFactoryTest::testCommPing((uint64_t)fTestDevice);
  }
  else
  {
    unsigned int v10 = forkProcessGpsTest((uint64_t)&__str, objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:", @"--ping", @"1000", 0));
    std::string::basic_string[abi:ne180100]<0>(&__p, "commPing result: ");
    int64_t v11 = HIBYTE(__str.__r_.__value_.__r.__words[2]);
    if ((__str.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      p_str = &__str;
    }
    else {
      p_str = (std::string *)__str.__r_.__value_.__r.__words[0];
    }
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      p_p = &__p;
    }
    else {
      p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
    }
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      int64_t size = HIBYTE(__p.__r_.__value_.__r.__words[2]);
    }
    else {
      int64_t size = __p.__r_.__value_.__l.__size_;
    }
    if (size)
    {
      if ((__str.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
        int64_t v11 = __str.__r_.__value_.__l.__size_;
      }
      if (v11 >= size)
      {
        int v22 = (char *)p_str + v11;
        int v23 = p_p->__r_.__value_.__s.__data_[0];
        v24 = p_str;
        do
        {
          int64_t v25 = v11 - size;
          if (v25 == -1) {
            break;
          }
          v26 = (char *)memchr(v24, v23, v25 + 1);
          if (!v26) {
            break;
          }
          v27 = v26;
          if (!memcmp(v26, p_p, size))
          {
            if (v27 != v22)
            {
              int64_t v15 = v27 - (char *)p_str;
              if (v27 - (char *)p_str != -1) {
                goto LABEL_18;
              }
            }
            break;
          }
          v24 = (std::string *)(v27 + 1);
          int64_t v11 = v22 - (v27 + 1);
        }
        while (v11 >= size);
      }
      MEMORY[0x237E295A0](&__str, "");
    }
    else
    {
      int64_t v15 = 0;
LABEL_18:
      std::string::basic_string(&v49, &__str, v15 + size, 0xFFFFFFFFFFFFFFFFLL, (std::allocator<char> *)&v46);
      if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(__str.__r_.__value_.__l.__data_);
      }
      std::string __str = v49;
      std::string::size_type v16 = std::string::find(&__str, 10, 0);
      std::string::basic_string(&v49, &__str, 0, v16, (std::allocator<char> *)&v46);
      if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(__str.__r_.__value_.__l.__data_);
      }
      std::string __str = v49;
    }
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p.__r_.__value_.__l.__data_);
    }
  }
  std::string::basic_string[abi:ne180100]<0>(&__p, "");
  std::string::basic_string[abi:ne180100]<0>(&v49, "");
  if (v10 == 1)
  {
    std::string::size_type v17 = HIBYTE(__str.__r_.__value_.__r.__words[2]);
    if ((__str.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
      std::string::size_type v17 = __str.__r_.__value_.__l.__size_;
    }
    if (v17)
    {
      v18 = (char *)&v46;
      std::string::basic_string[abi:ne180100]<0>(&v46, " ID:");
      int64_t v19 = HIBYTE(__str.__r_.__value_.__r.__words[2]);
      if ((__str.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        unsigned int v20 = &__str;
      }
      else {
        unsigned int v20 = (std::string *)__str.__r_.__value_.__r.__words[0];
      }
      if ((v48 & 0x80u) == 0)
      {
        int64_t v21 = v48;
      }
      else
      {
        v18 = (char *)v46;
        int64_t v21 = v47;
      }
      if (v21)
      {
        if ((__str.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
          int64_t v19 = __str.__r_.__value_.__l.__size_;
        }
        if (v19 >= v21)
        {
          v39 = (char *)v20 + v19;
          int v40 = *v18;
          v41 = v20;
          do
          {
            int64_t v42 = v19 - v21;
            if (v42 == -1) {
              break;
            }
            v43 = (char *)memchr(v41, v40, v42 + 1);
            if (!v43) {
              break;
            }
            v44 = v43;
            if (!memcmp(v43, v18, v21))
            {
              if (v44 != v39)
              {
                std::string::size_type v28 = v44 - (char *)v20;
                if (v44 - (char *)v20 != -1) {
                  goto LABEL_47;
                }
              }
              break;
            }
            v41 = (std::string *)(v44 + 1);
            int64_t v19 = v39 - (v44 + 1);
          }
          while (v19 >= v21);
        }
        std::string::operator=(&__p, &__str);
      }
      else
      {
        std::string::size_type v28 = 0;
LABEL_47:
        std::string::basic_string(&v45, &__str, 0, v28, (std::allocator<char> *)v52);
        if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(__p.__r_.__value_.__l.__data_);
        }
        std::string __p = v45;
        int64_t v29 = v48;
        if ((v48 & 0x80u) != 0) {
          int64_t v29 = v47;
        }
        std::string::basic_string(&v45, &__str, v29 + v28, 0xFFFFFFFFFFFFFFFFLL, (std::allocator<char> *)v52);
        if (SHIBYTE(v49.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(v49.__r_.__value_.__l.__data_);
        }
        std::string v49 = v45;
      }
      if ((char)v48 < 0) {
        operator delete(v46);
      }
    }
  }
  v30 = &__p;
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
    v30 = (std::string *)__p.__r_.__value_.__r.__words[0];
  }
  v31 = &v49;
  if ((v49.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
    v31 = (std::string *)v49.__r_.__value_.__r.__words[0];
  }
  NSLog(&cfstr_LocalresultsSI.isa, v30, v31);
  if (v10 == 1)
  {
    if (a5) {
      *a5 = 0;
    }
    if (!a3)
    {
LABEL_79:
      if (!a4) {
        goto LABEL_87;
      }
      if (SHIBYTE(v49.__r_.__value_.__r.__words[2]) < 0)
      {
        if (v49.__r_.__value_.__l.__size_)
        {
          v37 = (std::string *)v49.__r_.__value_.__r.__words[0];
          goto LABEL_85;
        }
      }
      else if (*((unsigned char *)&v49.__r_.__value_.__s + 23))
      {
        v37 = &v49;
LABEL_85:
        v35 = (void *)[NSString stringWithUTF8String:v37];
        goto LABEL_86;
      }
LABEL_73:
      v35 = 0;
LABEL_86:
      *a4 = v35;
      goto LABEL_87;
    }
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    {
      if (__p.__r_.__value_.__l.__size_)
      {
        v32 = (std::string *)__p.__r_.__value_.__r.__words[0];
        goto LABEL_76;
      }
    }
    else if (*((unsigned char *)&__p.__r_.__value_.__s + 23))
    {
      v32 = &__p;
LABEL_76:
      v36 = (void *)[NSString stringWithUTF8String:v32];
LABEL_78:
      *a3 = v36;
      goto LABEL_79;
    }
    v36 = 0;
    goto LABEL_78;
  }
  if (v10 > 8)
  {
    uint64_t v33 = 0;
    v34 = @"Success";
  }
  else
  {
    uint64_t v33 = dword_237B310BC[v10];
    v34 = off_264CF00D0[v10];
  }
  +[GpsError setError:a5, v33, @"%@", v34 withCode format];
  if (a3) {
    *a3 = 0;
  }
  if (a4) {
    goto LABEL_73;
  }
LABEL_87:
  if (SHIBYTE(v49.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v49.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__str.__r_.__value_.__l.__data_);
  }
  return v10 == 1;
}

- (BOOL)testGpsCw:(id)a3 error:(id *)a4
{
  std::string::basic_string[abi:ne180100]<0>(__p, "");
  fTestDevice = self->_fTestDevice;
  if (fTestDevice)
  {
    unsigned int v7 = GpsFactoryTest::testCw((uint64_t)fTestDevice, 10000.0, (uint64_t)__p, 10, 2, 0, 0xFFFFFFFFLL);
  }
  else
  {
    uint64_t v8 = (void *)MEMORY[0x263EFF8C0];
    uint64_t v9 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 10);
    uint64_t v10 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 10000);
    uint64_t v11 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 10000);
    unsigned int v7 = forkProcessGpsTest((uint64_t)__p, (void *)[v8 arrayWithObjects:@"--cw", v9, @"--bandwidth", v10, @"--band", v11, @"--subband", objc_msgSend(NSString, "stringWithFormat:", @"%d", 10000), 0]);
  }
  unsigned int v12 = v7;
  if (v7 == 1)
  {
    if (a4) {
      *a4 = 0;
    }
  }
  else
  {
    if (v7 > 8)
    {
      uint64_t v13 = 0;
      BOOL v14 = @"Success";
    }
    else
    {
      uint64_t v13 = dword_237B310BC[v7];
      BOOL v14 = off_264CF00D0[v7];
    }
    +[GpsError setError:a4, v13, @"%@", v14 withCode format];
  }
  if (v17 < 0) {
    operator delete(__p[0]);
  }
  return v12 == 1;
}

- (BOOL)testGpsModulated:(id)a3 gpsPrn:(int)a4 error:(id *)a5
{
  std::string::basic_string[abi:ne180100]<0>(__p, "");
  fTestDevice = self->_fTestDevice;
  if (fTestDevice)
  {
    unsigned int v9 = GpsFactoryTest::testModulated((uint64_t)fTestDevice, (uint64_t)__p, 10, 2, a4);
  }
  else
  {
    uint64_t v10 = (void *)MEMORY[0x263EFF8C0];
    uint64_t v11 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 10);
    uint64_t v12 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 10000);
    unsigned int v9 = forkProcessGpsTest((uint64_t)__p, (void *)[v10 arrayWithObjects:@"--modulated", v11, @"--band", v12, @"--subband", objc_msgSend(NSString, "stringWithFormat:", @"%d", 10000), 0]);
  }
  unsigned int v13 = v9;
  if (v9 == 1)
  {
    if (a5) {
      *a5 = 0;
    }
  }
  else
  {
    if (v9 > 8)
    {
      uint64_t v14 = 0;
      int64_t v15 = @"Success";
    }
    else
    {
      uint64_t v14 = dword_237B310BC[v9];
      int64_t v15 = off_264CF00D0[v9];
    }
    +[GpsError setError:a5, v14, @"%@", v15 withCode format];
  }
  if (v18 < 0) {
    operator delete(__p[0]);
  }
  return v13 == 1;
}

- (BOOL)testPeriodic:(id)a3 error:(id *)a4
{
  std::string::basic_string[abi:ne180100]<0>(__p, "");
  fTestDevice = self->_fTestDevice;
  if (fTestDevice) {
    unsigned int v7 = GpsFactoryTest::testPeriodicFix((uint64_t)fTestDevice, (uint64_t)__p, 10);
  }
  else {
    unsigned int v7 = forkProcessGpsTest((uint64_t)__p, (void *)[MEMORY[0x263EFF8C0] arrayWithObjects:@"--periodic", objc_msgSend(NSString, "stringWithFormat:", @"%d", 10), 0]);
  }
  unsigned int v8 = v7;
  if (v7 == 1)
  {
    unsigned int v9 = NSString;
    int v10 = v18;
    uint64_t v11 = (void **)__p[0];
    uint64_t v12 = [NSString defaultCStringEncoding];
    if (v10 >= 0) {
      unsigned int v13 = __p;
    }
    else {
      unsigned int v13 = v11;
    }
    [v9 stringWithCString:v13 encoding:v12];
    *a4 = 0;
  }
  else
  {
    if (v7 > 8)
    {
      uint64_t v14 = 0;
      int64_t v15 = @"Success";
    }
    else
    {
      uint64_t v14 = dword_237B310BC[v7];
      int64_t v15 = off_264CF00D0[v7];
    }
    +[GpsError setError:a4, v14, @"%@", v15 withCode format];
  }
  if (v18 < 0) {
    operator delete(__p[0]);
  }
  return v8 == 1;
}

- (BOOL)testPowerMode:(unsigned __int8)a3 error:(id *)a4
{
  fTestDevice = self->_fTestDevice;
  if (fTestDevice)
  {
    unsigned int v6 = GpsFactoryTest::testPowerMode((uint64_t)fTestDevice, 4 * (a3 != 0));
  }
  else
  {
    __p[0] = 0;
    __p[1] = 0;
    uint64_t v11 = 0;
    unsigned int v6 = forkProcessGpsTest((uint64_t)__p, (void *)[MEMORY[0x263EFF8C0] arrayWithObjects:@"--power-mode", objc_msgSend(NSString, "stringWithFormat:", @"%d", 4 * (a3 != 0)), 0]);
    if (SHIBYTE(v11) < 0) {
      operator delete(__p[0]);
    }
  }
  if (v6 == 1)
  {
    if (a4) {
      *a4 = 0;
    }
  }
  else
  {
    if (v6 > 8)
    {
      uint64_t v7 = 0;
      unsigned int v8 = @"Success";
    }
    else
    {
      uint64_t v7 = dword_237B310BC[v6];
      unsigned int v8 = off_264CF00D0[v6];
    }
    +[GpsError setError:a4, v7, @"%@", v8 withCode format];
  }
  return v6 == 1;
}

- (BOOL)testExternalFreqAssistance:(id *)a3
{
  __p[0] = 0;
  __p[1] = 0;
  uint64_t v11 = 0;
  fTestDevice = self->_fTestDevice;
  if (fTestDevice) {
    unsigned int v5 = GpsFactoryTest::testPeriodicFix((uint64_t)fTestDevice, (uint64_t)__p, 10);
  }
  else {
    unsigned int v5 = forkProcessGpsTest((uint64_t)__p, (void *)[MEMORY[0x263EFF8C0] arrayWithObjects:@"--periodic", objc_msgSend(NSString, "stringWithFormat:", @"%d", 10), 0]);
  }
  unsigned int v6 = v5;
  if (v5 == 1)
  {
    if (a3) {
      *a3 = 0;
    }
  }
  else
  {
    if (v5 > 8)
    {
      uint64_t v7 = 0;
      unsigned int v8 = @"Success";
    }
    else
    {
      uint64_t v7 = dword_237B310BC[v5];
      unsigned int v8 = off_264CF00D0[v5];
    }
    +[GpsError setError:a3, v7, @"%@", v8 withCode format];
  }
  if (SHIBYTE(v11) < 0) {
    operator delete(__p[0]);
  }
  return v6 == 1;
}

- (void)flushLogs
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v3 = GpsdLogObjectGeneral;
  if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_INFO))
  {
    int v6 = 136315138;
    uint64_t v7 = "-[GpsDevice flushLogs]";
    _os_log_impl(&dword_237AFF000, v3, OS_LOG_TYPE_INFO, "%s", (uint8_t *)&v6, 0xCu);
  }
  fTestDevice = self->_fTestDevice;
  if (fTestDevice)
  {
    unsigned int v5 = (VendorLogger *)*((void *)fTestDevice + 67);
    if (v5) {
      VendorLogger::flush(v5);
    }
  }
}

- (void)fTestDevice
{
  return self->_fTestDevice;
}

- (void)setFTestDevice:(void *)a3
{
  self->_fTestDevice = a3;
}

- (Options)fTestOptions
{
  objc_copyCppObjectAtomic(retstr, (const void *)(v1 + 16), (void (__cdecl *)(void *, const void *))__copy_helper_atomic_property_);
  return result;
}

- (void)setFTestOptions:(Options *)a3
{
}

- (void).cxx_destruct
{
  if (SHIBYTE(self[4]._fTestDevice) < 0) {
    operator delete((void *)self[3]._fTestOptions.uartPortName.var0);
  }
  if (*((char *)&self[3]._fTestOptions.uartPortName.__r_.var1 + 3) < 0) {
    operator delete((void *)self[3]._fTestOptions.uartPortName.__r_.__value_.var0.var1.__size_);
  }
  if (SHIBYTE(self[3]._fTestDevice) < 0) {
    operator delete((void *)self[2]._fTestOptions.uartPortName.var0);
  }
  if (SHIBYTE(self[1].super.isa) < 0) {
    operator delete(*(void **)&self->_fTestOptions.uartPortName.__r_.var0);
  }
  if (*((char *)&self->_fTestOptions.uartPortName.__r_.__value_.var0.var1 + 23) < 0)
  {
    data = self->_fTestOptions.uartPortName.__r_.__value_.var0.var1.__data_;
    operator delete(data);
  }
}

- (id).cxx_construct
{
  *((_OWORD *)self + 2) = 0u;
  *((_OWORD *)self + 3) = 0u;
  *((_OWORD *)self + 1) = 0u;
  *((void *)self + 8) = 6;
  *((void *)self + 9) = 0;
  *((unsigned char *)self + 80) = 1;
  *((unsigned char *)self + 96) = 0;
  *(void *)((char *)self + 81) = 0;
  *(_DWORD *)((char *)self + 89) = 0;
  *(void *)((char *)self + 108) = 0;
  *(void *)((char *)self + 100) = 0;
  *((_DWORD *)self + 29) = -1;
  *((unsigned char *)self + 120) = 0;
  *((void *)self + 21) = 0;
  *((void *)self + 22) = 0;
  *((void *)self + 20) = 0;
  *(_OWORD *)((char *)self + 124) = 0u;
  *(_OWORD *)((char *)self + 140) = 0u;
  *((_DWORD *)self + 46) = 115200;
  *((_OWORD *)self + 12) = 0u;
  *((_OWORD *)self + 13) = 0u;
  *((_OWORD *)self + 14) = 0u;
  return self;
}

@end
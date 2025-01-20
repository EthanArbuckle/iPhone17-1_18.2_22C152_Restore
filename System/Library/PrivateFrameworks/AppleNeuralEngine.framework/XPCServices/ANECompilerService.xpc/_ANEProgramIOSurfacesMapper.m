@interface _ANEProgramIOSurfacesMapper
+ (id)mapperWithController:(id)a3;
+ (id)mapperWithProgramHandle:(unint64_t)a3;
+ (id)new;
+ (void)initialize;
- (BOOL)mapIOSurfacesWithModel:(id)a3 request:(id)a4 cacheInference:(BOOL)a5 error:(id *)a6;
- (BOOL)unmapIOSurfacesWithModel:(id)a3 request:(id)a4 error:(id *)a5;
- (BOOL)validateRequest:(id)a3 model:(id)a4;
- (_ANEDeviceController)controller;
- (_ANEDeviceController)deviceController;
- (_ANEProgramIOSurfacesMapper)init;
- (_ANEProgramIOSurfacesMapper)initWithController:(id)a3;
- (unint64_t)programHandle;
- (void)dealloc;
- (void)prepareANEMemoryMappingParams:(ANEMemoryMappingParamsStruct *)a3 request:(id)a4;
@end

@implementation _ANEProgramIOSurfacesMapper

+ (void)initialize
{
  if (qword_100057D88 != -1) {
    dispatch_once(&qword_100057D88, &stru_10004C8B8);
  }
}

+ (id)new
{
  return 0;
}

- (_ANEProgramIOSurfacesMapper)init
{
  return 0;
}

- (_ANEProgramIOSurfacesMapper)initWithController:(id)a3
{
  id v5 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_ANEProgramIOSurfacesMapper;
  v6 = [(_ANEProgramIOSurfacesMapper *)&v8 init];
  if (v6)
  {
    v6->_programHandle = (unint64_t)[v5 programHandle];
    objc_storeStrong((id *)&v6->_controller, a3);
    [(_ANEDeviceController *)v6->_controller start];
  }

  return v6;
}

+ (id)mapperWithProgramHandle:(unint64_t)a3
{
  v4 = +[_ANEDeviceController controllerWithProgramHandle:a3];
  id v5 = [objc_alloc((Class)a1) initWithController:v4];

  return v5;
}

+ (id)mapperWithController:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)a1) initWithController:v4];

  return v5;
}

- (void)dealloc
{
  v3 = [(_ANEProgramIOSurfacesMapper *)self controller];
  [v3 stop];

  v4.receiver = self;
  v4.super_class = (Class)_ANEProgramIOSurfacesMapper;
  [(_ANEProgramIOSurfacesMapper *)&v4 dealloc];
}

- (BOOL)validateRequest:(id)a3 model:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 validate])
  {
    objc_super v8 = [v6 procedureIndex];
    aSelector = a2;
    id v9 = [v8 unsignedIntegerValue];

    v10 = (char *)[v6 ioSurfacesCount];
    if ((unint64_t)(v10 - 129) <= 0xFFFFFFFFFFFFFF7FLL)
    {
      v11 = +[_ANELog common];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        v12 = NSStringFromSelector(aSelector);
        sub_10002E3B0(v12, v39, (uint64_t)v10, v11);
      }
    }
    v13 = [v7 inputSymbolIndicesForProcedureIndex:v9];
    v14 = [v6 inputIndexArray];
    id v15 = [v14 count];
    if (v15)
    {
      uint64_t v16 = 0;
      unsigned int v17 = 0;
      while (1)
      {
        v18 = [v14 objectAtIndexedSubscript:v16];
        unsigned int v19 = [v18 unsignedIntegerValue];

        if (([v13 containsIndex:v19] & 1) == 0) {
          break;
        }
        uint64_t v16 = ++v17;
        if ((unint64_t)v15 <= v17) {
          goto LABEL_10;
        }
      }
      v20 = +[_ANELog common];
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        v30 = NSStringFromSelector(aSelector);
        *(_DWORD *)buf = 138412802;
        v34 = v30;
        __int16 v35 = 1024;
        unsigned int v36 = v17;
        __int16 v37 = 1024;
        unsigned int v38 = v19;
        _os_log_error_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "%@: request.inputIndexArray[%u]=%u is invalid", buf, 0x18u);
      }
      BOOL v27 = 0;
    }
    else
    {
LABEL_10:
      v20 = [v7 outputSymbolIndicesForProcedureIndex:v9];
      v21 = [v6 outputIndexArray];
      id v22 = [v21 count];
      if (v22)
      {
        uint64_t v23 = 0;
        unsigned int v24 = 0;
        while (1)
        {
          v25 = [v21 objectAtIndexedSubscript:v23];
          unsigned int v26 = [v25 unsignedIntegerValue];

          if (([v20 containsIndex:v26] & 1) == 0) {
            break;
          }
          uint64_t v23 = ++v24;
          if ((unint64_t)v22 <= v24) {
            goto LABEL_14;
          }
        }
        v28 = +[_ANELog common];
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        {
          v31 = NSStringFromSelector(aSelector);
          *(_DWORD *)buf = 138412802;
          v34 = v31;
          __int16 v35 = 1024;
          unsigned int v36 = v24;
          __int16 v37 = 1024;
          unsigned int v38 = v26;
          _os_log_error_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "%@: request.outputIndexArray[%u]=%u is invalid", buf, 0x18u);
        }
        BOOL v27 = 0;
      }
      else
      {
LABEL_14:
        BOOL v27 = 1;
      }
    }
  }
  else
  {
    BOOL v27 = 0;
  }

  return v27;
}

- (void)prepareANEMemoryMappingParams:(ANEMemoryMappingParamsStruct *)a3 request:(id)a4
{
  id v27 = a4;
  bzero(a3, 0xC18uLL);
  a3->var2 = [v27 ioSurfacesCount];
  id v6 = [v27 procedureIndex];
  a3->var3 = [v6 unsignedIntValue];

  a3->var1 = [(_ANEProgramIOSurfacesMapper *)self programHandle];
  unsigned int v26 = [v27 inputIndexArray];
  unint64_t v7 = (unint64_t)[v26 count];
  if (v7)
  {
    uint64_t v8 = 0;
    unsigned int v9 = 1;
    do
    {
      v10 = [v27 inputArray];
      v11 = [v10 objectAtIndexedSubscript:v8];
      a3->var0[v8].var0 = (__IOSurface *)[v11 ioSurface];

      v12 = [v26 objectAtIndexedSubscript:v8];
      v13 = &a3->var0[v8];
      v13->var1 = [v12 unsignedIntValue];

      v13->var3 = 1;
      uint64_t v8 = v9;
      BOOL v14 = v7 > v9++;
    }
    while (v14);
  }
  id v15 = [v27 outputIndexArray];
  unint64_t v16 = (unint64_t)[v15 count];
  if (v16)
  {
    uint64_t v17 = 0;
    unsigned int v18 = 1;
    do
    {
      unsigned int v19 = [v27 outputArray];
      v20 = [v19 objectAtIndexedSubscript:v17];
      unint64_t v21 = v17 + v7;
      a3->var0[v17 + v7].var0 = (__IOSurface *)[v20 ioSurface];

      id v22 = [v15 objectAtIndexedSubscript:v17];
      uint64_t v23 = &a3->var0[v21];
      v23->var1 = [v22 unsignedIntValue];

      v23->var3 = 2;
      uint64_t v17 = v18;
      BOOL v14 = v16 > v18++;
    }
    while (v14);
  }
  unsigned int v24 = [v27 weightsBuffer];

  if (v24)
  {
    v25 = [v27 weightsBuffer];
    a3->var0[v16 + v7].var0 = (__IOSurface *)[v25 ioSurface];

    a3->var0[v16 + v7].var3 = 8;
  }
}

- (BOOL)mapIOSurfacesWithModel:(id)a3 request:(id)a4 cacheInference:(BOOL)a5 error:(id *)a6
{
  id v11 = a3;
  id v12 = a4;
  v13 = +[_ANEVirtualClient sharedConnection];

  if (v13)
  {
    BOOL v14 = +[_ANELog common];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      id v15 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412290;
      v41 = v15;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "%@: No support for VirtualClient yet.", buf, 0xCu);
    }
    goto LABEL_5;
  }
  if (+[_ANEDeviceInfo isVirtualMachine])
  {
    unint64_t v16 = +[_ANELog common];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      uint64_t v17 = NSStringFromSelector(a2);
      sub_10002E428(v17, buf, v16);
    }

    if (a6)
    {
      unsigned int v18 = NSStringFromSelector(a2);
      *a6 = +[_ANEErrors hostTooOld:v18];

LABEL_5:
      LOBYTE(a6) = 0;
    }
  }
  else
  {
    uint64_t v34 = 0;
    __int16 v35 = &v34;
    uint64_t v36 = 0x3032000000;
    __int16 v37 = sub_1000059A4;
    unsigned int v38 = sub_1000059B4;
    id v39 = 0;
    uint64_t v30 = 0;
    v31 = &v30;
    uint64_t v32 = 0x2020000000;
    char v33 = 0;
    unsigned int v20 = [(_ANEProgramIOSurfacesMapper *)self validateRequest:v12 model:v11];
    if (v20)
    {
      [(_ANEProgramIOSurfacesMapper *)self prepareANEMemoryMappingParams:buf request:v12];
      unint64_t v21 = qword_100057D80;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1000059BC;
      block[3] = &unk_10004C8E0;
      BOOL v29 = a5;
      id v27 = buf;
      SEL v28 = a2;
      block[4] = self;
      v25 = &v30;
      id v24 = v12;
      unsigned int v26 = &v34;
      dispatch_sync(v21, block);
    }
    if (v20)
    {
      if (a6) {
        *a6 = (id) v35[5];
      }
      LOBYTE(a6) = *((unsigned char *)v31 + 24) != 0;
    }
    else
    {
      LOBYTE(a6) = 0;
    }
    _Block_object_dispose(&v30, 8);
    _Block_object_dispose(&v34, 8);
  }
  return (char)a6;
}

- (BOOL)unmapIOSurfacesWithModel:(id)a3 request:(id)a4 error:(id *)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = +[_ANEVirtualClient sharedConnection];

  if (v11)
  {
    id v12 = +[_ANELog common];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v13 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412290;
      char v33 = v13;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "%@: No support for VirtualClient yet.", buf, 0xCu);
    }
    goto LABEL_5;
  }
  if (+[_ANEDeviceInfo isVirtualMachine])
  {
    BOOL v14 = +[_ANELog common];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      id v15 = NSStringFromSelector(a2);
      sub_10002E428(v15, buf, v14);
    }

    if (a5)
    {
      unint64_t v16 = NSStringFromSelector(a2);
      *a5 = +[_ANEErrors hostTooOld:v16];

LABEL_5:
      LOBYTE(a5) = 0;
    }
  }
  else
  {
    uint64_t v26 = 0;
    id v27 = &v26;
    uint64_t v28 = 0x3032000000;
    BOOL v29 = sub_1000059A4;
    uint64_t v30 = sub_1000059B4;
    id v31 = 0;
    uint64_t v22 = 0;
    uint64_t v23 = &v22;
    uint64_t v24 = 0x2020000000;
    char v25 = 0;
    unsigned int v18 = [(_ANEProgramIOSurfacesMapper *)self validateRequest:v10 model:v9];
    if (v18)
    {
      [(_ANEProgramIOSurfacesMapper *)self prepareANEMemoryMappingParams:buf request:v10];
      unsigned int v19 = [v10 transactionHandle];
      id v34 = [v19 unsignedIntegerValue];

      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100005F48;
      block[3] = &unk_10004C908;
      block[7] = buf;
      block[8] = a2;
      block[4] = self;
      void block[5] = &v22;
      block[6] = &v26;
      dispatch_sync((dispatch_queue_t)qword_100057D80, block);
    }
    if (v18)
    {
      if (a5) {
        *a5 = (id) v27[5];
      }
      LOBYTE(a5) = *((unsigned char *)v23 + 24) != 0;
    }
    else
    {
      LOBYTE(a5) = 0;
    }
    _Block_object_dispose(&v22, 8);
    _Block_object_dispose(&v26, 8);
  }
  return (char)a5;
}

- (_ANEDeviceController)deviceController
{
  return self->_deviceController;
}

- (_ANEDeviceController)controller
{
  return self->_controller;
}

- (unint64_t)programHandle
{
  return self->_programHandle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_controller, 0);
  objc_storeStrong((id *)&self->_deviceController, 0);
}

@end
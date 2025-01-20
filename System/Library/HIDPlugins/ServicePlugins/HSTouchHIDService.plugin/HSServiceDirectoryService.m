@interface HSServiceDirectoryService
- (BOOL)hsDecode:(void *)a3;
- (BOOL)hsEncode:(void *)a3;
- (NSString)description;
- (id)serviceDescription;
- (id)serviceName;
- (id)serviceProtocol;
- (unint64_t)serviceVersion;
- (void)addClient:(FileDescriptor *)a3 config:(id)a4;
@end

@implementation HSServiceDirectoryService

- (NSString)description
{
  name = self->name;
  protocol = self->protocol;
  v6 = +[NSNumber numberWithUnsignedLongLong:self->version];
  v3 = +[NSString stringWithFormat:@"HSServiceDirectoryService{%@, %@:%@}", name, protocol, v6];

  return v3;
}

- (BOOL)hsEncode:(void *)a3
{
  return 1;
}

- (BOOL)hsDecode:(void *)a3
{
  v33 = self;
  SEL v32 = a2;
  v31 = (HSUtil::Coder *)a3;
  HSUtil::Decoder::decodeArray((HSUtil::Decoder *)a3, (uint64_t)v30);
  if (HSUtil::Coder::ok(v31))
  {
    v3 = (NSString *)HSUtil::Decoder::decodeNSString((HSUtil::Decoder *)v30);
    name = v33->name;
    v33->name = v3;

    if (HSUtil::Coder::ok((HSUtil::Coder *)v30))
    {
      v5 = (NSString *)HSUtil::Decoder::decodeNSString((HSUtil::Decoder *)v30);
      description = v33->description;
      v33->description = v5;

      if (HSUtil::Coder::ok((HSUtil::Coder *)v30))
      {
        v7 = (NSString *)HSUtil::Decoder::decodeNSString((HSUtil::Decoder *)v30);
        protocol = v33->protocol;
        v33->protocol = v7;

        if (HSUtil::Coder::ok((HSUtil::Coder *)v30))
        {
          v33->version = HSUtil::Decoder::decodeUInt((HSUtil::Decoder *)v30);
          if (HSUtil::Coder::ok((HSUtil::Coder *)v30))
          {
            char v34 = 1;
            int v25 = 1;
          }
          else
          {
            v11 = basename_r("/Library/Caches/com.apple.xbs/Sources/HIDSensingPipeline/HIDSensingPipeline/HSServiceDirectory.mm", v36);
            os_log_t v10 = &_os_log_default;
            if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
            {
              __os_log_helper_16_2_4_8_32_8_32_8_0_8_32((uint64_t)v35, (uint64_t)"-[HSServiceDirectoryService hsDecode:]", (uint64_t)v11, 47, (uint64_t)"array");
              _os_log_error_impl(&def_411C8, v10, OS_LOG_TYPE_ERROR, "Assertion failed (%s @ %s:%ju): %s", v35, 0x2Au);
            }
            objc_storeStrong((id *)&v10, 0);
            char v34 = 0;
            int v25 = 1;
          }
        }
        else
        {
          v15 = basename_r("/Library/Caches/com.apple.xbs/Sources/HIDSensingPipeline/HIDSensingPipeline/HSServiceDirectory.mm", v38);
          os_log_t v14 = &_os_log_default;
          os_log_type_t v13 = OS_LOG_TYPE_ERROR;
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            __os_log_helper_16_2_4_8_32_8_32_8_0_8_32((uint64_t)v37, (uint64_t)"-[HSServiceDirectoryService hsDecode:]", (uint64_t)v15, 46, (uint64_t)"array");
            _os_log_error_impl(&def_411C8, v14, v13, "Assertion failed (%s @ %s:%ju): %s", v37, 0x2Au);
          }
          objc_storeStrong((id *)&v14, 0);
          char v34 = 0;
          int v25 = 1;
        }
      }
      else
      {
        v19 = basename_r("/Library/Caches/com.apple.xbs/Sources/HIDSensingPipeline/HIDSensingPipeline/HSServiceDirectory.mm", v40);
        os_log_t v18 = &_os_log_default;
        os_log_type_t v17 = OS_LOG_TYPE_ERROR;
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          __os_log_helper_16_2_4_8_32_8_32_8_0_8_32((uint64_t)v39, (uint64_t)"-[HSServiceDirectoryService hsDecode:]", (uint64_t)v19, 45, (uint64_t)"array");
          _os_log_error_impl(&def_411C8, v18, v17, "Assertion failed (%s @ %s:%ju): %s", v39, 0x2Au);
        }
        objc_storeStrong((id *)&v18, 0);
        char v34 = 0;
        int v25 = 1;
      }
    }
    else
    {
      v23 = basename_r("/Library/Caches/com.apple.xbs/Sources/HIDSensingPipeline/HIDSensingPipeline/HSServiceDirectory.mm", v42);
      os_log_t v22 = &_os_log_default;
      os_log_type_t v21 = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        __os_log_helper_16_2_4_8_32_8_32_8_0_8_32((uint64_t)v41, (uint64_t)"-[HSServiceDirectoryService hsDecode:]", (uint64_t)v23, 44, (uint64_t)"array");
        _os_log_error_impl(&def_411C8, v22, v21, "Assertion failed (%s @ %s:%ju): %s", v41, 0x2Au);
      }
      objc_storeStrong((id *)&v22, 0);
      char v34 = 0;
      int v25 = 1;
    }
  }
  else
  {
    v28 = basename_r("/Library/Caches/com.apple.xbs/Sources/HIDSensingPipeline/HIDSensingPipeline/HSServiceDirectory.mm", v44);
    os_log_t oslog = &_os_log_default;
    os_log_type_t type = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_4_8_32_8_32_8_0_8_32((uint64_t)v43, (uint64_t)"-[HSServiceDirectoryService hsDecode:]", (uint64_t)v28, 43, (uint64_t)"coder");
      _os_log_error_impl(&def_411C8, oslog, type, "Assertion failed (%s @ %s:%ju): %s", v43, 0x2Au);
    }
    objc_storeStrong((id *)&oslog, 0);
    char v34 = 0;
    int v25 = 1;
  }
  HSUtil::Decoder::~Decoder((HSUtil::Decoder *)v30);
  return v34 & 1;
}

- (id)serviceName
{
  return self->name;
}

- (id)serviceDescription
{
  return self->description;
}

- (id)serviceProtocol
{
  return self->protocol;
}

- (unint64_t)serviceVersion
{
  return self->version;
}

- (void)addClient:(FileDescriptor *)a3 config:(id)a4
{
  location[3] = self;
  location[2] = (id)a2;
  location[1] = a3;
  location[0] = 0;
  objc_storeStrong(location, a4);
  objc_storeStrong(location, 0);
}

- (void).cxx_destruct
{
}

@end
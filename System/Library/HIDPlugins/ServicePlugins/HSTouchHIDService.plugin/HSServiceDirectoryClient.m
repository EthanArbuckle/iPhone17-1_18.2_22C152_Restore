@interface HSServiceDirectoryClient
- (FileDescriptor)openService:(SEL)a3 config:(id)a4;
- (HSServiceDirectoryClient)initWithSendRight:(const SendRight *)a3;
- (HSServiceDirectoryClient)initWithSocket:(FileDescriptor *)a3;
- (id).cxx_construct;
- (id)services;
@end

@implementation HSServiceDirectoryClient

- (HSServiceDirectoryClient)initWithSendRight:(const SendRight *)a3
{
  id location = self;
  SEL v21 = a2;
  v20 = a3;
  if (!HSUtil::PortRight::operator BOOL((uint64_t)a3))
  {
    v6 = +[NSAssertionHandler currentHandler];
    [(NSAssertionHandler *)v6 handleFailureInMethod:v21, location, @"HSServiceDirectory.mm", 365, @"Invalid parameter not satisfying: %@", @"sendRight" object file lineNumber description];
  }
  id v3 = location;
  id location = 0;
  v19.receiver = v3;
  v19.super_class = (Class)HSServiceDirectoryClient;
  obj = [(HSServiceDirectoryClient *)&v19 init];
  id location = obj;
  objc_storeStrong(&location, obj);
  if (obj)
  {
    +[HSMachPortListener getSendRightFromServer:v20];
    if (HSUtil::PortRight::operator BOOL((uint64_t)v17))
    {
      HSUtil::PortRight::port((HSUtil::PortRight *)v17);
      int v12 = fileport_makefd();
      BOOL v11 = v12 >= 0;
      if (v12 >= 0)
      {
        HSUtil::FileDescriptor::FileDescriptor((HSUtil::FileDescriptor *)v7, v12);
        HSUtil::FileDescriptor::operator=((uint64_t)location + 8, (uint64_t)v7);
        HSUtil::FileDescriptor::~FileDescriptor((HSUtil::FileDescriptor *)v7);
        v23 = (HSServiceDirectoryClient *)location;
        int v18 = 1;
      }
      else
      {
        v10 = basename_r("/Library/Caches/com.apple.xbs/Sources/HIDSensingPipeline/HIDSensingPipeline/HSServiceDirectory.mm", v25);
        os_log_t v9 = &_os_log_default;
        os_log_type_t v8 = OS_LOG_TYPE_ERROR;
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          __os_log_helper_16_2_4_8_32_8_32_8_0_8_32((uint64_t)v24, (uint64_t)"-[HSServiceDirectoryClient initWithSendRight:]", (uint64_t)v10, 373, (uint64_t)"fd>=0");
          _os_log_error_impl(&def_411C8, v9, v8, "Assertion failed (%s @ %s:%ju): %s", v24, 0x2Au);
        }
        objc_storeStrong((id *)&v9, 0);
        v23 = 0;
        int v18 = 1;
      }
    }
    else
    {
      v15 = basename_r("/Library/Caches/com.apple.xbs/Sources/HIDSensingPipeline/HIDSensingPipeline/HSServiceDirectory.mm", v27);
      os_log_t oslog = &_os_log_default;
      os_log_type_t type = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
      {
        __os_log_helper_16_2_4_8_32_8_32_8_0_8_32((uint64_t)v26, (uint64_t)"-[HSServiceDirectoryClient initWithSendRight:]", (uint64_t)v15, 369, (uint64_t)"fileportSendRight");
        _os_log_error_impl(&def_411C8, oslog, type, "Assertion failed (%s @ %s:%ju): %s", v26, 0x2Au);
      }
      objc_storeStrong((id *)&oslog, 0);
      v23 = 0;
      int v18 = 1;
    }
    HSUtil::SendRight::~SendRight((HSUtil::SendRight *)v17);
  }
  else
  {
    v23 = 0;
    int v18 = 1;
  }
  objc_storeStrong(&location, 0);
  return v23;
}

- (HSServiceDirectoryClient)initWithSocket:(FileDescriptor *)a3
{
  id location = self;
  SEL v9 = a2;
  os_log_type_t v8 = a3;
  if (!HSUtil::FileDescriptor::operator BOOL((uint64_t)a3))
  {
    v6 = +[NSAssertionHandler currentHandler];
    [(NSAssertionHandler *)v6 handleFailureInMethod:v9, location, @"HSServiceDirectory.mm", 381, @"Invalid parameter not satisfying: %@", @"socket" object file lineNumber description];
  }
  id v3 = location;
  id location = 0;
  v7.receiver = v3;
  v7.super_class = (Class)HSServiceDirectoryClient;
  obj = [(HSServiceDirectoryClient *)&v7 init];
  id location = obj;
  objc_storeStrong(&location, obj);
  if (obj)
  {
    HSUtil::FileDescriptor::operator=((uint64_t)location + 8, (uint64_t)v8);
    BOOL v11 = (HSServiceDirectoryClient *)location;
  }
  else
  {
    BOOL v11 = 0;
  }
  objc_storeStrong(&location, 0);
  return v11;
}

- (id)services
{
  v13 = self;
  SEL v12 = a2;
  HSUtil::EncoderBuf::EncoderBuf((HSUtil::EncoderBuf *)v15);
  HSUtil::Encoder::encodeArrayStart((HSUtil::Coder *)v15, 4u);
  HSUtil::Encoder::encodeUInt((HSUtil::Encoder *)v15, 0);
  HSUtil::Encoder::encodeObjectStop((HSUtil::Encoder *)v15);
  if (!HSUtil::Coder::ok((HSUtil::Coder *)v15))
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "encode message failed");
  }
  sendMessage((HSUtil::FileDescriptor *)&v13->_socket, (HSUtil::EncoderBuf *)v15);
  receiveMessage((HSUtil::FileDescriptor *)&v13->_socket, (HSUtil::Coder *)v11);
  HSUtil::Decoder::decodeArray((HSUtil::Decoder *)v11, (uint64_t)v10);
  if (!HSUtil::Coder::ok((HSUtil::Coder *)v11))
  {
    v5 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(v5, "failed to decode array");
  }
  id v9 = (id)objc_opt_new();
  do
  {
    id location = (id)objc_opt_new();
    HSUtil::Decoder::decodeHSCodable((HSUtil::Coder *)v10, location);
    if (HSUtil::Coder::end((HSUtil::Coder *)v10))
    {
      int v7 = 2;
    }
    else
    {
      if (!HSUtil::Coder::ok((HSUtil::Coder *)v10))
      {
        v4 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
        std::runtime_error::runtime_error(v4, "failed to decode HSServiceDirectoryService");
      }
      [v9 addObject:location];
      int v7 = 0;
    }
    objc_storeStrong(&location, 0);
  }
  while (!v7);
  id v14 = v9;
  objc_storeStrong(&v9, 0);
  HSUtil::Decoder::~Decoder((HSUtil::Decoder *)v10);
  HSUtil::DecoderBuf::~DecoderBuf((HSUtil::DecoderBuf *)v11);
  HSUtil::EncoderBuf::~EncoderBuf((HSUtil::EncoderBuf *)v15);
  id v3 = v14;

  return v3;
}

- (FileDescriptor)openService:(SEL)a3 config:(id)a4
{
  id v14 = retstr;
  v13 = self;
  SEL v12 = a3;
  id location = 0;
  objc_storeStrong(&location, a4);
  id v10 = 0;
  objc_storeStrong(&v10, a5);
  if (!location)
  {
    int v7 = +[NSAssertionHandler currentHandler];
    [(NSAssertionHandler *)v7 handleFailureInMethod:v12, v13, @"HSServiceDirectory.mm", 422, @"Invalid parameter not satisfying: %@", @"name" object file lineNumber description];
  }
  HSUtil::EncoderBuf::EncoderBuf((HSUtil::EncoderBuf *)v15);
  HSUtil::Encoder::encodeArrayStart((HSUtil::Coder *)v15, 4u);
  HSUtil::Encoder::encodeUInt((HSUtil::Encoder *)v15, 1uLL);
  HSUtil::Encoder::encodeNSString((HSUtil::Encoder *)v15, (NSString *)location);
  HSUtil::Encoder::encodeNSDictionary((HSUtil::Encoder *)v15, (NSDictionary *)v10);
  HSUtil::Encoder::encodeObjectStop((HSUtil::Encoder *)v15);
  if (!HSUtil::Coder::ok((HSUtil::Coder *)v15))
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "encode message failed");
  }
  sendMessage((HSUtil::FileDescriptor *)&v13->_socket, (HSUtil::EncoderBuf *)v15);
  HSUtil::EncoderBuf::~EncoderBuf((HSUtil::EncoderBuf *)v15);
  HSUtil::FileDescriptor::FileDescriptor((uint64_t)retstr, (uint64_t)&v13->_socket);
  objc_storeStrong(&v10, 0);
  objc_storeStrong(&location, 0);
  return result;
}

- (void).cxx_destruct
{
}

- (id).cxx_construct
{
  return self;
}

@end
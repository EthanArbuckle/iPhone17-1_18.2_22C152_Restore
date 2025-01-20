@interface HSStageProxy
- (BOOL)decodeStateFromData:(id)a3;
- (BOOL)hsDecode:(void *)a3;
- (BOOL)hsEncode:(void *)a3;
- (id)description;
- (id)name;
- (void)lock;
- (void)unlock;
@end

@implementation HSStageProxy

- (BOOL)decodeStateFromData:(id)a3
{
  v10 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v7 = v10;
  id v6 = HSProxySynth::Box<NSData * {__strong}>(location[0]);
  id v11 = v6;
  v5 = +[NSArray arrayWithObjects:&v11 count:1];
  id v8 = -[HSStageProxy HSStageProxy_decodeStateFromData:](v7, "HSStageProxy_decodeStateFromData:");

  char v4 = HSProxySynth::Unbox<BOOL>(v8);
  objc_storeStrong(&v8, 0);
  objc_storeStrong(location, 0);
  return v4 & 1;
}

- (BOOL)hsEncode:(void *)a3
{
  v14 = self;
  SEL v13 = a2;
  v12 = (HSUtil::Encoder *)a3;
  id location = [(HSStageProxy *)self encodeStateToData];
  if (location)
  {
    HSUtil::Buffer::Buffer((uint64_t)v9, location);
    HSUtil::Decoder::Decoder((HSUtil::Decoder *)v8, (HSUtil::IO::Readable *)v9);
    HSUtil::Decoder::decodeElement((HSUtil::Decoder *)v8, (uint64_t)v7);
    if (HSUtil::Coder::ok((HSUtil::Coder *)v8))
    {
      HSUtil::Encoder::encodeDecoder(v12, (HSUtil::Decoder *)v7);
      if (HSUtil::Coder::ok(v12))
      {
        char v15 = 1;
        int v10 = 1;
      }
      else
      {
        v5 = basename_r("/Library/Caches/com.apple.xbs/Sources/HIDSensingPipeline/HIDSensingPipeline/HSStageProxy.mm", v17);
        os_log_t oslog = &_os_log_default;
        if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
        {
          __os_log_helper_16_2_4_8_32_8_32_8_0_8_32((uint64_t)v16, (uint64_t)"-[HSStageProxy(Other) hsEncode:]", (uint64_t)v5, 36, (uint64_t)"coder");
          _os_log_error_impl(&def_411C8, oslog, OS_LOG_TYPE_ERROR, "Assertion failed (%s @ %s:%ju): %s", v16, 0x2Au);
        }
        objc_storeStrong((id *)&oslog, 0);
        char v15 = 0;
        int v10 = 1;
      }
    }
    else
    {
      char v15 = 0;
      int v10 = 1;
    }
    HSUtil::Decoder::~Decoder((HSUtil::Decoder *)v7);
    HSUtil::Decoder::~Decoder((HSUtil::Decoder *)v8);
    HSUtil::Buffer::~Buffer((HSUtil::Buffer *)v9);
  }
  else
  {
    char v15 = 0;
    int v10 = 1;
  }
  objc_storeStrong(&location, 0);
  return v15 & 1;
}

- (BOOL)hsDecode:(void *)a3
{
  id v11 = self;
  SEL v10 = a2;
  v9 = (HSUtil::Decoder *)a3;
  HSUtil::EncoderBuf::EncoderBuf((HSUtil::EncoderBuf *)v15);
  HSUtil::Encoder::encodeDecoder((HSUtil::Encoder *)v15, v9);
  id v8 = (HSUtil::Buffer *)HSUtil::EncoderBuf::buffer((HSUtil::EncoderBuf *)v15);
  if (HSUtil::Buffer::operator BOOL(v8))
  {
    char v4 = HSUtil::Buffer::getNSData(v8);
    char v12 = -[HSStageProxy decodeStateFromData:](v11, "decodeStateFromData:");
  }
  else
  {
    id v6 = basename_r("/Library/Caches/com.apple.xbs/Sources/HIDSensingPipeline/HIDSensingPipeline/HSStageProxy.mm", v14);
    os_log_t oslog = &_os_log_default;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_4_8_32_8_32_8_0_8_32((uint64_t)v13, (uint64_t)"-[HSStageProxy(Other) hsDecode:]", (uint64_t)v6, 46, (uint64_t)"buf");
      _os_log_error_impl(&def_411C8, oslog, OS_LOG_TYPE_ERROR, "Assertion failed (%s @ %s:%ju): %s", v13, 0x2Au);
    }
    objc_storeStrong((id *)&oslog, 0);
    char v12 = 0;
  }
  HSUtil::EncoderBuf::~EncoderBuf((HSUtil::EncoderBuf *)v15);
  return v12 & 1;
}

- (void)lock
{
  exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
  std::runtime_error::runtime_error(exception, "-lock can't be called remotely");
}

- (void)unlock
{
  exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
  std::runtime_error::runtime_error(exception, "-unlock can't be called remotely");
}

- (id)name
{
  id location[2] = self;
  location[1] = (id)a2;
  v4.receiver = self;
  v4.super_class = (Class)HSStageProxy;
  location[0] = [(HSStageProxy *)&v4 name];
  if (location[0]) {
    id v6 = (__CFString *)location[0];
  }
  else {
    id v6 = @"HSStageProxy";
  }
  objc_storeStrong(location, 0);
  v2 = v6;

  return v2;
}

- (id)description
{
  id v5 = [(HSStageProxy *)self name];
  v3 = +[NSString stringWithFormat:@"<HSStageProxy: %p : %@>", self, v5];

  return v3;
}

@end
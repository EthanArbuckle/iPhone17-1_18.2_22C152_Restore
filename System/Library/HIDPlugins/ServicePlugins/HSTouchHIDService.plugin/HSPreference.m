@interface HSPreference
+ (const)hsClassName;
- (BOOL)hsDecode:(void *)a3;
- (BOOL)hsEncode:(void *)a3;
- (HSPreference)initWithKey:(id)a3 name:(id)a4 description:(id)a5;
@end

@implementation HSPreference

+ (const)hsClassName
{
  return (const CoderKey *)HSUtil::CoderKey::Literal<(char)72,(char)83,(char)80,(char)114,(char)101,(char)102,(char)101,(char)114,(char)101,(char)110,(char)99,(char)101>::Key;
}

- (HSPreference)initWithKey:(id)a3 name:(id)a4 description:(id)a5
{
  id v17 = self;
  SEL v16 = a2;
  id location = 0;
  objc_storeStrong(&location, a3);
  id v14 = 0;
  objc_storeStrong(&v14, a4);
  id v13 = 0;
  objc_storeStrong(&v13, a5);
  if (!location)
  {
    v9 = +[NSAssertionHandler currentHandler];
    [(NSAssertionHandler *)v9 handleFailureInMethod:v16, v17, @"HSPreferenceStage.mm", 141, @"Invalid parameter not satisfying: %@", @"k" object file lineNumber description];
  }
  if (!v14)
  {
    v8 = +[NSAssertionHandler currentHandler];
    [(NSAssertionHandler *)v8 handleFailureInMethod:v16, v17, @"HSPreferenceStage.mm", 142, @"Invalid parameter not satisfying: %@", @"n" object file lineNumber description];
  }
  id v5 = v17;
  id v17 = 0;
  v12.receiver = v5;
  v12.super_class = (Class)HSPreference;
  v7 = [(HSPreference *)&v12 init];
  id v17 = v7;
  objc_storeStrong(&v17, v7);
  if (v7)
  {
    objc_storeStrong((id *)v17 + 1, location);
    objc_storeStrong((id *)v17 + 2, v14);
    objc_storeStrong((id *)v17 + 3, v13);
    v18 = (HSPreference *)v17;
  }
  else
  {
    v18 = 0;
  }
  objc_storeStrong(&v13, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(&location, 0);
  objc_storeStrong(&v17, 0);
  return v18;
}

- (BOOL)hsEncode:(void *)a3
{
  if (self->description) {
    HSUtil::Encoder::encodeNSString((HSUtil::Encoder *)a3, self->description);
  }
  else {
    HSUtil::Encoder::encodeNull((HSUtil::Encoder *)a3);
  }
  HSUtil::Encoder::encodeObjectStop((HSUtil::Encoder *)a3);
  return 1;
}

- (BOOL)hsDecode:(void *)a3
{
  v29 = self;
  SEL v28 = a2;
  v27 = (HSUtil::Coder *)a3;
  HSUtil::Decoder::decodeArray((HSUtil::Decoder *)a3, (uint64_t)v26);
  if (HSUtil::Coder::ok(v27))
  {
    v3 = (NSString *)HSUtil::Decoder::decodeNSString((HSUtil::Decoder *)v26);
    key = v29->key;
    v29->key = v3;

    if (HSUtil::Coder::ok((HSUtil::Coder *)v26))
    {
      id v5 = (NSString *)HSUtil::Decoder::decodeNSString((HSUtil::Decoder *)v26);
      name = v29->name;
      v29->name = v5;

      if (HSUtil::Coder::ok((HSUtil::Coder *)v26))
      {
        if (HSUtil::Decoder::getElementType((HSUtil::Decoder *)v26) == 224)
        {
          v7 = (NSString *)HSUtil::Decoder::decodeNSString((HSUtil::Decoder *)v26);
          description = v29->description;
          v29->description = v7;
        }
        else
        {
          HSUtil::Decoder::decodeNull((HSUtil::Decoder *)v26);
          objc_storeStrong((id *)&v29->description, 0);
        }
        if (HSUtil::Coder::ok((HSUtil::Coder *)v26))
        {
          char v30 = 1;
          int v21 = 1;
        }
        else
        {
          v11 = basename_r("/Library/Caches/com.apple.xbs/Sources/HIDSensingPipeline/HIDSensingPipeline/HSPreferenceStage.mm", v32);
          os_log_t v10 = &_os_log_default;
          if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          {
            __os_log_helper_16_2_4_8_32_8_32_8_0_8_32((uint64_t)v31, (uint64_t)"-[HSPreference hsDecode:]", (uint64_t)v11, 176, (uint64_t)"array");
            _os_log_error_impl(&def_411C8, v10, OS_LOG_TYPE_ERROR, "Assertion failed (%s @ %s:%ju): %s", v31, 0x2Au);
          }
          objc_storeStrong((id *)&v10, 0);
          char v30 = 0;
          int v21 = 1;
        }
      }
      else
      {
        v15 = basename_r("/Library/Caches/com.apple.xbs/Sources/HIDSensingPipeline/HIDSensingPipeline/HSPreferenceStage.mm", v34);
        os_log_t v14 = &_os_log_default;
        os_log_type_t v13 = OS_LOG_TYPE_ERROR;
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          __os_log_helper_16_2_4_8_32_8_32_8_0_8_32((uint64_t)v33, (uint64_t)"-[HSPreference hsDecode:]", (uint64_t)v15, 168, (uint64_t)"array");
          _os_log_error_impl(&def_411C8, v14, v13, "Assertion failed (%s @ %s:%ju): %s", v33, 0x2Au);
        }
        objc_storeStrong((id *)&v14, 0);
        char v30 = 0;
        int v21 = 1;
      }
    }
    else
    {
      v19 = basename_r("/Library/Caches/com.apple.xbs/Sources/HIDSensingPipeline/HIDSensingPipeline/HSPreferenceStage.mm", v36);
      os_log_t v18 = &_os_log_default;
      os_log_type_t v17 = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        __os_log_helper_16_2_4_8_32_8_32_8_0_8_32((uint64_t)v35, (uint64_t)"-[HSPreference hsDecode:]", (uint64_t)v19, 165, (uint64_t)"array");
        _os_log_error_impl(&def_411C8, v18, v17, "Assertion failed (%s @ %s:%ju): %s", v35, 0x2Au);
      }
      objc_storeStrong((id *)&v18, 0);
      char v30 = 0;
      int v21 = 1;
    }
  }
  else
  {
    v24 = basename_r("/Library/Caches/com.apple.xbs/Sources/HIDSensingPipeline/HIDSensingPipeline/HSPreferenceStage.mm", v38);
    os_log_t oslog = &_os_log_default;
    os_log_type_t type = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_4_8_32_8_32_8_0_8_32((uint64_t)v37, (uint64_t)"-[HSPreference hsDecode:]", (uint64_t)v24, 162, (uint64_t)"coder");
      _os_log_error_impl(&def_411C8, oslog, type, "Assertion failed (%s @ %s:%ju): %s", v37, 0x2Au);
    }
    objc_storeStrong((id *)&oslog, 0);
    char v30 = 0;
    int v21 = 1;
  }
  HSUtil::Decoder::~Decoder((HSUtil::Decoder *)v26);
  return v30 & 1;
}

- (void).cxx_destruct
{
}

@end
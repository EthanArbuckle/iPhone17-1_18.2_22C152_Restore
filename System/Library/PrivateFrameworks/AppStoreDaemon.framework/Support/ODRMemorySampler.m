@interface ODRMemorySampler
- (id)currentStatsString;
- (id)takeSample;
@end

@implementation ODRMemorySampler

- (id)takeSample
{
  kern_return_t v3;
  mach_error_t v4;
  NSObject *v5;
  void *v6;
  char *v8;
  mach_msg_type_number_t task_info_outCnt;
  integer_t task_info_out[4];
  long long v11;
  long long v12;
  uint8_t buf[4];
  char *v14;
  uint64_t vars8;

  v11 = 0u;
  v12 = 0u;
  *(_OWORD *)task_info_out = 0u;
  task_info_outCnt = 48;
  v3 = task_info(mach_task_self_, 0x14u, task_info_out, &task_info_outCnt);
  if (v3)
  {
    v4 = v3;
    sub_10034A450(self);
    v5 = ASDLogHandleForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v8 = mach_error_string(v4);
      *(_DWORD *)buf = 136446210;
      v14 = v8;
      _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "ODRMemorySampler failed to take sample with error %{public}s.  Sampler stopped.", buf, 0xCu);
    }

    v6 = 0;
  }
  else
  {
    v6 = +[NSNumber numberWithUnsignedInteger:*(void *)&task_info_out[2]];
  }
  return v6;
}

- (id)currentStatsString
{
  v2 = self;
  objc_sync_enter(v2);
  bytesFormatter = v2->_bytesFormatter;
  if (!bytesFormatter)
  {
    v4 = (NSByteCountFormatter *)objc_alloc_init((Class)NSByteCountFormatter);
    v5 = v2->_bytesFormatter;
    v2->_bytesFormatter = v4;

    bytesFormatter = v2->_bytesFormatter;
  }
  v6 = sub_10034A538(v2);
  v7 = -[NSByteCountFormatter stringFromByteCount:](bytesFormatter, "stringFromByteCount:", [v6 integerValue]);
  v8 = v2->_bytesFormatter;
  v9 = sub_10034A5B8(v2);
  v10 = -[NSByteCountFormatter stringFromByteCount:](v8, "stringFromByteCount:", [v9 integerValue]);
  v11 = v2->_bytesFormatter;
  v12 = sub_10034A4B8(v2);
  [v12 floatValue];
  v14 = [(NSByteCountFormatter *)v11 stringFromByteCount:(unint64_t)v13];
  v15 = +[NSString stringWithFormat:@"Min:%@, Max:%@, Avg:%@", v7, v10, v14];

  objc_sync_exit(v2);
  return v15;
}

- (void).cxx_destruct
{
}

@end
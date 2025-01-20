@interface geo_state_capture_handle
- (geo_state_capture_handle)init;
- (os_state_data_s)_capturePlistState:(const os_state_hints_s *)a3;
- (void)dealloc;
@end

@implementation geo_state_capture_handle

- (os_state_data_s)_capturePlistState:(const os_state_hints_s *)a3
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  v5 = GEOGetStateCaptureLog();
  os_signpost_id_t v6 = os_signpost_id_generate(v5);

  v7 = GEOGetStateCaptureLog();
  v8 = v7;
  unint64_t v9 = v6 - 1;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1DD951000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "CapturePlistState", "", buf, 2u);
  }

  if (self->_lastCaptureTime > 0.0)
  {
    unsigned int var2 = a3->var2;
    switch(var2)
    {
      case 1u:
        if (self->_frequency <= 1)
        {
          v29 = GEOGetStateCaptureLog();
          v30 = v29;
          if (v9 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v29))
          {
            uint64_t frequency = (int)self->_frequency;
            if (frequency > 2) {
              v32 = "INVALID";
            }
            else {
              v32 = off_1E6CFC078[frequency];
            }
            *(_DWORD *)buf = 136315138;
            *(void *)&buf[4] = v32;
            _os_signpost_emit_with_name_impl(&dword_1DD951000, v30, OS_SIGNPOST_INTERVAL_END, v6, "CapturePlistState", "Skipped: ERROR & %s < OFTEN", buf, 0xCu);
          }

          return 0;
        }
        double v11 = 45.0;
        break;
      case 2u:
        double v11 = dbl_1DD9551B0[self->_frequency > 1];
        break;
      case 3u:
        double v11 = 0.5;
        break;
      default:
        double v11 = 0.0;
        break;
    }
    double v12 = (double)clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW) / 1000000000.0 - self->_lastCaptureTime;
    if (v12 < v11)
    {
      v13 = GEOGetStateCaptureLog();
      v14 = v13;
      if (v9 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
      {
        unsigned int v15 = a3->var2 - 1;
        if (v15 > 2) {
          v16 = "INVALID";
        }
        else {
          v16 = off_1E6CFC060[v15];
        }
        uint64_t v33 = (int)self->_frequency;
        if (v33 > 2) {
          v34 = "INVALID";
        }
        else {
          v34 = off_1E6CFC078[v33];
        }
        *(_DWORD *)buf = 136315906;
        *(void *)&buf[4] = v16;
        *(_WORD *)&buf[12] = 2080;
        *(void *)&buf[14] = v34;
        *(_WORD *)&buf[22] = 2048;
        v40 = *(uint64_t (**)(uint64_t, uint64_t))&v12;
        LOWORD(v41) = 2048;
        *(double *)((char *)&v41 + 2) = v11;
        _os_signpost_emit_with_name_impl(&dword_1DD951000, v14, OS_SIGNPOST_INTERVAL_END, v6, "CapturePlistState", "Skipped: %s & %s delta(%f) < minDelta(%f)", buf, 0x2Au);
      }

      return 0;
    }
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  v40 = __Block_byref_object_copy_;
  *(void *)&long long v41 = __Block_byref_object_dispose_;
  *((void *)&v41 + 1) = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__geo_state_capture_handle__capturePlistState___block_invoke;
  block[3] = &unk_1E6CFBFF8;
  block[4] = self;
  block[5] = buf;
  block[6] = a3;
  dispatch_async_and_wait(queue, block);
  uint64_t v18 = *(void *)(*(void *)&buf[8] + 40);
  if (v18)
  {
    v19 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v18 format:200 options:0 error:0];
    unint64_t v20 = [v19 length];
    if (v19 && (unint64_t v21 = v20, v20 <= 0xFFFFFFFE))
    {
      v22 = (char *)malloc_type_malloc(v20 + 200, 0x93E54006uLL);
      *(_DWORD *)v22 = 1;
      *(_OWORD *)(v22 + 136) = 0u;
      *(_OWORD *)(v22 + 152) = 0u;
      *(_OWORD *)(v22 + 168) = 0u;
      *(_OWORD *)(v22 + 184) = 0u;
      v23 = [(NSData *)self->_description bytes];
      if ([(NSData *)self->_description length] > 0x3F) {
        size_t v24 = 64;
      }
      else {
        size_t v24 = [(NSData *)self->_description length];
      }
      memcpy(v22 + 136, v23, v24);
      *((_DWORD *)v22 + 1) = v21;
      [v19 getBytes:v22 + 200 length:v21];
      self->_lastCaptureTime = (double)clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW) / 1000000000.0;
      v28 = GEOGetStateCaptureLog();
      v27 = v28;
      if (v9 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v28))
      {
        *(_DWORD *)v37 = 134217984;
        unint64_t v38 = v21;
        _os_signpost_emit_with_name_impl(&dword_1DD951000, v27, OS_SIGNPOST_INTERVAL_END, v6, "CapturePlistState", "Captured %zu bytes", v37, 0xCu);
      }
    }
    else
    {
      v26 = GEOGetStateCaptureLog();
      v27 = v26;
      if (v9 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v26))
      {
        *(_WORD *)v37 = 0;
        _os_signpost_emit_with_name_impl(&dword_1DD951000, v27, OS_SIGNPOST_INTERVAL_END, v6, "CapturePlistState", "Failed: serialization", v37, 2u);
      }
      v22 = 0;
    }
  }
  else
  {
    v25 = GEOGetStateCaptureLog();
    v19 = v25;
    if (v9 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v25))
    {
      *(_WORD *)v37 = 0;
      _os_signpost_emit_with_name_impl(&dword_1DD951000, v19, OS_SIGNPOST_INTERVAL_END, v6, "CapturePlistState", "Failed: nil plist", v37, 2u);
    }
    v22 = 0;
  }

  _Block_object_dispose(buf, 8);
  return (os_state_data_s *)v22;
}

- (geo_state_capture_handle)init
{
  v6.receiver = self;
  v6.super_class = (Class)geo_state_capture_handle;
  uint64_t v3 = [(geo_state_capture_handle *)&v6 self];

  if (v3)
  {
    *(void *)(v3 + 32) = 0;
    *(_DWORD *)(v3 + 40) = 0;
    *(void *)(v3 + 48) = 0;
    id v4 = (id)v3;
  }

  return (geo_state_capture_handle *)v3;
}

- (void)dealloc
{
  if (self->_stateCaptureHandle) {
    os_state_remove_handler();
  }
  v3.receiver = self;
  v3.super_class = (Class)geo_state_capture_handle;
  [(geo_state_capture_handle *)&v3 dealloc];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_description, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_weakStateCapturing);
}

@end
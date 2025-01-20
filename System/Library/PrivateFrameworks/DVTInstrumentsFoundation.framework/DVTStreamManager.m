@interface DVTStreamManager
- (DVTStreamManager)initWithStream:(id)a3;
- (id)export;
- (int64_t)commit:(const void *)a3 bufferSize:(unint64_t)a4 error:(id *)a5 destructor:(id)a6;
- (int64_t)commit:(id)a3 error:(id *)a4;
- (unint64_t)currentStreamSize;
@end

@implementation DVTStreamManager

- (DVTStreamManager)initWithStream:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)DVTStreamManager;
  v6 = [(DVTStreamManager *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_stream, a3);
    snprintf(__str, 0x80uLL, "com.apple.instruments.kperf.streammanager.%llu", atomic_fetch_add_explicit(&qword_268707F68, 1uLL, memory_order_relaxed));
    dispatch_queue_t v8 = dispatch_queue_create(__str, 0);
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v8;

    v7->_currentStreamSize = 0;
  }

  return v7;
}

- (int64_t)commit:(const void *)a3 bufferSize:(unint64_t)a4 error:(id *)a5 destructor:(id)a6
{
  id v10 = a6;
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x2020000000;
  uint64_t v24 = 0;
  queue = self->_queue;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = sub_2308C5FC4;
  v15[3] = &unk_264B8F0F8;
  v17 = &v21;
  v18 = a3;
  v15[4] = self;
  id v16 = v10;
  unint64_t v19 = a4;
  v20 = a5;
  id v12 = v10;
  dispatch_sync(queue, v15);
  int64_t v13 = v22[3];

  _Block_object_dispose(&v21, 8);
  return v13;
}

- (int64_t)commit:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x2020000000;
  uint64_t v18 = 0;
  queue = self->_queue;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = sub_2308C61D0;
  v11[3] = &unk_264B8F120;
  v11[4] = self;
  id v12 = v6;
  int64_t v13 = &v15;
  v14 = a4;
  id v8 = v6;
  dispatch_sync(queue, v11);
  int64_t v9 = v16[3];

  _Block_object_dispose(&v15, 8);
  return v9;
}

- (id)export
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  int64_t v9 = sub_2308C6314;
  id v10 = sub_2308C6324;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = sub_2308C632C;
  v5[3] = &unk_264B8EC38;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (unint64_t)currentStreamSize
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = sub_2308C643C;
  v5[3] = &unk_264B8EC38;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  unint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_stream, 0);
}

@end
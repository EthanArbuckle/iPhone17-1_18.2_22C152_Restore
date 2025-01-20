@interface CNSchedulerProvider
+ (CNSchedulerProvider)defaultProvider;
+ (CNSchedulerProvider)providerWithBackgroundConcurrencyLimit:(int64_t)a3;
+ (id)makeDefaultProvider;
- (CNScheduler)backgroundScheduler;
- (CNScheduler)immediateScheduler;
- (CNScheduler)inlineScheduler;
- (CNScheduler)mainThreadScheduler;
- (CNSchedulerProvider)initWithBackgroundScheduler:(id)a3 mainThreadScheduler:(id)a4 immediateScheduler:(id)a5 serialSchedulerProvider:(id)a6 synchronousSerialSchedulerProvider:(id)a7 readerWriterSchedulerProvider:(id)a8;
- (CNSchedulerProvider)initWithBackgroundScheduler:(id)a3 mainThreadScheduler:(id)a4 inlineScheduler:(id)a5 immediateScheduler:(id)a6 serialSchedulerProvider:(id)a7 synchronousSerialSchedulerProvider:(id)a8 readerWriterSchedulerProvider:(id)a9;
- (id)backgroundSchedulerWithQualityOfService:(unint64_t)a3;
- (id)newReaderWriterSchedulerWithName:(id)a3;
- (id)newSerialSchedulerWithName:(id)a3;
- (id)newSynchronousSerialSchedulerWithName:(id)a3;
- (id)readerWriterSchedulerProvider;
- (id)serialSchedulerProvider;
- (id)synchronousSerialSchedulerProvider;
@end

@implementation CNSchedulerProvider

- (CNScheduler)mainThreadScheduler
{
  return self->_mainThreadScheduler;
}

- (id)newSynchronousSerialSchedulerWithName:(id)a3
{
  id v4 = a3;
  v5 = [(CNSchedulerProvider *)self synchronousSerialSchedulerProvider];
  v6 = ((void (**)(void, id))v5)[2](v5, v4);

  return v6;
}

- (id)synchronousSerialSchedulerProvider
{
  return self->_synchronousSerialSchedulerProvider;
}

- (CNScheduler)immediateScheduler
{
  return self->_immediateScheduler;
}

- (id)newSerialSchedulerWithName:(id)a3
{
  id v4 = a3;
  v5 = [(CNSchedulerProvider *)self serialSchedulerProvider];
  v6 = ((void (**)(void, id))v5)[2](v5, v4);

  return v6;
}

- (id)serialSchedulerProvider
{
  return self->_serialSchedulerProvider;
}

+ (CNSchedulerProvider)defaultProvider
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __38__CNSchedulerProvider_defaultProvider__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (defaultProvider_cn_once_token_1 != -1) {
    dispatch_once(&defaultProvider_cn_once_token_1, block);
  }
  v2 = (void *)defaultProvider_cn_once_object_1;

  return (CNSchedulerProvider *)v2;
}

- (id)backgroundSchedulerWithQualityOfService:(unint64_t)a3
{
  v5 = [CNQualityOfServiceSchedulerDecorator alloc];
  v6 = [(CNSchedulerProvider *)self backgroundScheduler];
  v7 = [(CNQualityOfServiceSchedulerDecorator *)v5 initWithScheduler:v6 qualityOfService:a3];

  return v7;
}

- (CNScheduler)backgroundScheduler
{
  return self->_backgroundScheduler;
}

- (CNScheduler)inlineScheduler
{
  return self->_inlineScheduler;
}

+ (CNSchedulerProvider)providerWithBackgroundConcurrencyLimit:(int64_t)a3
{
  id v4 = objc_alloc((Class)a1);
  v5 = +[CNScheduler operationQueueSchedulerWithMaxConcurrentOperationCount:a3];
  v6 = +[CNScheduler mainThreadScheduler];
  v7 = +[CNScheduler inlineScheduler];
  v8 = +[CNScheduler immediateScheduler];
  v9 = (void *)[v4 initWithBackgroundScheduler:v5 mainThreadScheduler:v6 inlineScheduler:v7 immediateScheduler:v8 serialSchedulerProvider:&__block_literal_global_79 synchronousSerialSchedulerProvider:&__block_literal_global_3_1 readerWriterSchedulerProvider:&__block_literal_global_6];

  return (CNSchedulerProvider *)v9;
}

- (CNSchedulerProvider)initWithBackgroundScheduler:(id)a3 mainThreadScheduler:(id)a4 immediateScheduler:(id)a5 serialSchedulerProvider:(id)a6 synchronousSerialSchedulerProvider:(id)a7 readerWriterSchedulerProvider:(id)a8
{
  id v14 = a8;
  id v15 = a7;
  id v16 = a6;
  id v17 = a5;
  id v18 = a4;
  id v19 = a3;
  v20 = +[CNScheduler inlineScheduler];
  v21 = [(CNSchedulerProvider *)self initWithBackgroundScheduler:v19 mainThreadScheduler:v18 inlineScheduler:v20 immediateScheduler:v17 serialSchedulerProvider:v16 synchronousSerialSchedulerProvider:v15 readerWriterSchedulerProvider:v14];

  return v21;
}

uint64_t __38__CNSchedulerProvider_defaultProvider__block_invoke(uint64_t a1)
{
  defaultProvider_cn_once_object_1 = [*(id *)(a1 + 32) makeDefaultProvider];

  return MEMORY[0x1F41817F8]();
}

+ (id)makeDefaultProvider
{
  id v2 = objc_alloc((Class)a1);
  v3 = +[CNScheduler globalAsyncScheduler];
  id v4 = +[CNScheduler mainThreadScheduler];
  v5 = +[CNScheduler inlineScheduler];
  v6 = +[CNScheduler immediateScheduler];
  v7 = (void *)[v2 initWithBackgroundScheduler:v3 mainThreadScheduler:v4 inlineScheduler:v5 immediateScheduler:v6 serialSchedulerProvider:&__block_literal_global_79 synchronousSerialSchedulerProvider:&__block_literal_global_3_1 readerWriterSchedulerProvider:&__block_literal_global_6];

  return v7;
}

- (CNSchedulerProvider)initWithBackgroundScheduler:(id)a3 mainThreadScheduler:(id)a4 inlineScheduler:(id)a5 immediateScheduler:(id)a6 serialSchedulerProvider:(id)a7 synchronousSerialSchedulerProvider:(id)a8 readerWriterSchedulerProvider:(id)a9
{
  id v32 = a3;
  id v31 = a4;
  id v30 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  id v19 = a9;
  v33.receiver = self;
  v33.super_class = (Class)CNSchedulerProvider;
  v20 = [(CNSchedulerProvider *)&v33 init];
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_backgroundScheduler, a3);
    objc_storeStrong((id *)&v21->_mainThreadScheduler, a4);
    objc_storeStrong((id *)&v21->_inlineScheduler, a5);
    objc_storeStrong((id *)&v21->_immediateScheduler, a6);
    uint64_t v22 = [v17 copy];
    id serialSchedulerProvider = v21->_serialSchedulerProvider;
    v21->_id serialSchedulerProvider = (id)v22;

    uint64_t v24 = [v18 copy];
    id synchronousSerialSchedulerProvider = v21->_synchronousSerialSchedulerProvider;
    v21->_id synchronousSerialSchedulerProvider = (id)v24;

    uint64_t v26 = [v19 copy];
    id readerWriterSchedulerProvider = v21->_readerWriterSchedulerProvider;
    v21->_id readerWriterSchedulerProvider = (id)v26;

    v28 = v21;
  }

  return v21;
}

- (id)newReaderWriterSchedulerWithName:(id)a3
{
  id v4 = a3;
  v5 = [(CNSchedulerProvider *)self readerWriterSchedulerProvider];
  v6 = ((void (**)(void, id))v5)[2](v5, v4);

  return v6;
}

- (id)readerWriterSchedulerProvider
{
  return self->_readerWriterSchedulerProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_readerWriterSchedulerProvider, 0);
  objc_storeStrong(&self->_synchronousSerialSchedulerProvider, 0);
  objc_storeStrong(&self->_serialSchedulerProvider, 0);
  objc_storeStrong((id *)&self->_immediateScheduler, 0);
  objc_storeStrong((id *)&self->_inlineScheduler, 0);
  objc_storeStrong((id *)&self->_mainThreadScheduler, 0);

  objc_storeStrong((id *)&self->_backgroundScheduler, 0);
}

@end
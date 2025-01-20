@interface CSAudioTimeConverter
- (CSAudioTimeConverter)init;
- (OS_dispatch_queue)queue;
- (id)description;
- (unint64_t)anchorHostTime;
- (unint64_t)anchorSampleCount;
- (unint64_t)hostTimeFromSampleCount:(unint64_t)a3;
- (unint64_t)sampleCountFromHostTime:(unint64_t)a3;
- (void)processSampleCount:(unint64_t)a3 hostTime:(unint64_t)a4;
- (void)setAnchorHostTime:(unint64_t)a3;
- (void)setAnchorSampleCount:(unint64_t)a3;
- (void)setQueue:(id)a3;
@end

@implementation CSAudioTimeConverter

- (void).cxx_destruct
{
}

- (void)setAnchorHostTime:(unint64_t)a3
{
  self->_anchorHostTime = a3;
}

- (unint64_t)anchorHostTime
{
  return self->_anchorHostTime;
}

- (void)setAnchorSampleCount:(unint64_t)a3
{
  self->_anchorSampleCount = a3;
}

- (unint64_t)anchorSampleCount
{
  return self->_anchorSampleCount;
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (unint64_t)sampleCountFromHostTime:(unint64_t)a3
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__CSAudioTimeConverter_sampleCountFromHostTime___block_invoke;
  block[3] = &unk_1E6200FE0;
  block[5] = &v7;
  block[6] = a3;
  block[4] = self;
  dispatch_sync(queue, block);
  unint64_t v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

unint64_t __48__CSAudioTimeConverter_sampleCountFromHostTime___block_invoke(void *a1)
{
  uint64_t v2 = a1[6];
  uint64_t v3 = a1[4];
  uint64_t v5 = *(void *)(v3 + 16);
  uint64_t v4 = *(void *)(v3 + 24);
  +[CSConfig inputRecordingSampleRate];
  unint64_t result = +[CSFTimeUtils sampleCountFromHostTime:anchorHostTime:anchorSampleCount:sampleRate:](CSFTimeUtils, "sampleCountFromHostTime:anchorHostTime:anchorSampleCount:sampleRate:", v2, v4, v5);
  *(void *)(*(void *)(a1[5] + 8) + 24) = result;
  return result;
}

- (unint64_t)hostTimeFromSampleCount:(unint64_t)a3
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__CSAudioTimeConverter_hostTimeFromSampleCount___block_invoke;
  block[3] = &unk_1E6200FE0;
  block[5] = &v7;
  block[6] = a3;
  block[4] = self;
  dispatch_sync(queue, block);
  unint64_t v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

unint64_t __48__CSAudioTimeConverter_hostTimeFromSampleCount___block_invoke(void *a1)
{
  uint64_t v2 = a1[6];
  uint64_t v3 = a1[4];
  uint64_t v5 = *(void *)(v3 + 16);
  uint64_t v4 = *(void *)(v3 + 24);
  +[CSConfig inputRecordingSampleRate];
  unint64_t result = +[CSFTimeUtils hostTimeFromSampleCount:anchorHostTime:anchorSampleCount:sampleRate:](CSFTimeUtils, "hostTimeFromSampleCount:anchorHostTime:anchorSampleCount:sampleRate:", v2, v4, v5);
  *(void *)(*(void *)(a1[5] + 8) + 24) = result;
  return result;
}

- (void)processSampleCount:(unint64_t)a3 hostTime:(unint64_t)a4
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__CSAudioTimeConverter_processSampleCount_hostTime___block_invoke;
  block[3] = &unk_1E61FFE78;
  block[4] = self;
  block[5] = a3;
  block[6] = a4;
  dispatch_async(queue, block);
}

void *__52__CSAudioTimeConverter_processSampleCount_hostTime___block_invoke(void *result)
{
  *(void *)(result[4] + 16) = result[5];
  *(void *)(result[4] + 24) = result[6];
  return result;
}

- (id)description
{
  uint64_t v3 = [MEMORY[0x1E4F28E78] string];
  objc_msgSend(v3, "appendFormat:", @"[anchorHostTime = %llu]", self->_anchorHostTime);
  objc_msgSend(v3, "appendFormat:", @"[anchorSampleCount = %llu]", self->_anchorSampleCount);
  return v3;
}

- (CSAudioTimeConverter)init
{
  v6.receiver = self;
  v6.super_class = (Class)CSAudioTimeConverter;
  uint64_t v2 = [(CSAudioTimeConverter *)&v6 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("CSSampleCountHostTimeConverter", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    v2->_anchorSampleCount = 0;
    v2->_anchorHostTime = 0;
  }
  return v2;
}

@end
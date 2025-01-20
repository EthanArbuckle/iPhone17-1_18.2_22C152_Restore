@interface _MXExtensionMatchingMerger
- (_MXExtensionMatchingMerger)init;
- (id)receiveExtensions:(id)a3 withIndex:(unint64_t)a4;
- (void)clearExtensions;
@end

@implementation _MXExtensionMatchingMerger

- (id)receiveExtensions:(id)a3 withIndex:(unint64_t)a4
{
  id v6 = a3;
  v7 = [MEMORY[0x1E4F1CA48] array];
  lock = self->_lock;
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  v15 = __58___MXExtensionMatchingMerger_receiveExtensions_withIndex___block_invoke;
  v16 = &unk_1E54BB820;
  v17 = self;
  id v18 = v6;
  id v19 = v7;
  unint64_t v20 = a4;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(lock, &v13);
  v11 = objc_msgSend(v9, "copy", v13, v14, v15, v16, v17);

  return v11;
}

- (_MXExtensionMatchingMerger)init
{
  v7.receiver = self;
  v7.super_class = (Class)_MXExtensionMatchingMerger;
  v2 = [(_MXExtensionMatchingMerger *)&v7 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.maps.ThreeLegsMerger", v3);
    lock = v2->_lock;
    v2->_lock = (OS_dispatch_queue *)v4;
  }
  return v2;
}

- (void)clearExtensions
{
  lock = self->_lock;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45___MXExtensionMatchingMerger_clearExtensions__block_invoke;
  block[3] = &unk_1E54B8188;
  block[4] = self;
  dispatch_sync(lock, block);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_intentUIExtensions, 0);
  objc_storeStrong((id *)&self->_intentNonUIExtensions, 0);
  objc_storeStrong((id *)&self->_mapExtensions, 0);

  objc_storeStrong((id *)&self->_lock, 0);
}

@end
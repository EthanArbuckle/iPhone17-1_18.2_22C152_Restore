@interface _HDDeferredFeaturePropertiesWriting
- (_HDDeferredFeaturePropertiesWriting)initWithLocalDomain:(id)a3 pairedDeviceRegistry:(id)a4;
- (void)synchronize;
@end

@implementation _HDDeferredFeaturePropertiesWriting

- (_HDDeferredFeaturePropertiesWriting)initWithLocalDomain:(id)a3 pairedDeviceRegistry:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)_HDDeferredFeaturePropertiesWriting;
  v8 = [(_HDFeaturePropertiesWriting *)&v11 initWithLocalDomain:a3];
  v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_pairedDeviceRegistry, a4);
  }

  return v9;
}

- (void)synchronize
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50___HDDeferredFeaturePropertiesWriting_synchronize__block_invoke;
  block[3] = &unk_1E62F3208;
  block[4] = self;
  if (qword_1EBA18D88 != -1) {
    dispatch_once(&qword_1EBA18D88, block);
  }
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __50___HDDeferredFeaturePropertiesWriting_synchronize__block_invoke_2;
  v3[3] = &unk_1E62F3208;
  v3[4] = self;
  dispatch_async((dispatch_queue_t)_MergedGlobals_215, v3);
}

- (void).cxx_destruct
{
}

@end
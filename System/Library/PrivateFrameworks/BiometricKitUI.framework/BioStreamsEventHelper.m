@interface BioStreamsEventHelper
- (BOOL)inBuddy;
- (BioStreamsEventHelper)initWithBKDeviceType:(int64_t)a3 inBuddy:(BOOL)a4;
- (id)containerIdentifier;
- (id)subtype;
- (int64_t)deviceType;
- (void)sendSuccessfulEnrollEvent;
- (void)setDeviceType:(int64_t)a3;
- (void)setInBuddy:(BOOL)a3;
@end

@implementation BioStreamsEventHelper

- (BioStreamsEventHelper)initWithBKDeviceType:(int64_t)a3 inBuddy:(BOOL)a4
{
  v20.receiver = self;
  v20.super_class = (Class)BioStreamsEventHelper;
  v6 = [(BioStreamsEventHelper *)&v20 init];
  v7 = v6;
  if (!v6) {
    goto LABEL_9;
  }
  v6->_inBuddy = a4;
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x2050000000;
  v8 = (void *)getBKDeviceClass_softClass_0;
  uint64_t v29 = getBKDeviceClass_softClass_0;
  if (!getBKDeviceClass_softClass_0)
  {
    uint64_t v21 = MEMORY[0x1E4F143A8];
    uint64_t v22 = 3221225472;
    v23 = __getBKDeviceClass_block_invoke_0;
    v24 = &unk_1E6EA23D0;
    v25 = &v26;
    __getBKDeviceClass_block_invoke_0((uint64_t)&v21);
    v8 = (void *)v27[3];
  }
  id v9 = v8;
  _Block_object_dispose(&v26, 8);
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x2050000000;
  v10 = (void *)getBKDeviceDescriptorClass_softClass_0;
  uint64_t v29 = getBKDeviceDescriptorClass_softClass_0;
  if (!getBKDeviceDescriptorClass_softClass_0)
  {
    uint64_t v21 = MEMORY[0x1E4F143A8];
    uint64_t v22 = 3221225472;
    v23 = __getBKDeviceDescriptorClass_block_invoke_0;
    v24 = &unk_1E6EA23D0;
    v25 = &v26;
    __getBKDeviceDescriptorClass_block_invoke_0((uint64_t)&v21);
    v10 = (void *)v27[3];
  }
  id v11 = v10;
  _Block_object_dispose(&v26, 8);
  v12 = [v11 deviceDescriptorForType:a3];
  id v19 = 0;
  v13 = [v9 deviceWithDescriptor:v12 error:&v19];
  id v14 = v19;

  v7->_deviceType = a3;
  if (!v14)
  {
    v16 = [v13 identitiesWithError:0];
    uint64_t v17 = [v16 count];

    v15 = 0;
    if (v17) {
      goto LABEL_10;
    }
LABEL_9:
    v15 = v7;
    goto LABEL_10;
  }

  v15 = 0;
LABEL_10:

  return v15;
}

- (void)sendSuccessfulEnrollEvent
{
  uint64_t v18 = 0;
  id v19 = &v18;
  uint64_t v20 = 0x2050000000;
  v3 = (void *)getBMStreamsClass_softClass;
  uint64_t v21 = getBMStreamsClass_softClass;
  if (!getBMStreamsClass_softClass)
  {
    uint64_t v13 = MEMORY[0x1E4F143A8];
    uint64_t v14 = 3221225472;
    v15 = __getBMStreamsClass_block_invoke;
    v16 = &unk_1E6EA23D0;
    uint64_t v17 = &v18;
    __getBMStreamsClass_block_invoke((uint64_t)&v13);
    v3 = (void *)v19[3];
  }
  id v4 = v3;
  _Block_object_dispose(&v18, 8);
  v5 = [v4 discoverabilitySignal];
  v6 = [v5 source];
  uint64_t v18 = 0;
  id v19 = &v18;
  uint64_t v20 = 0x2050000000;
  v7 = (void *)getBMDiscoverabilitySignalEventClass_softClass;
  uint64_t v21 = getBMDiscoverabilitySignalEventClass_softClass;
  if (!getBMDiscoverabilitySignalEventClass_softClass)
  {
    uint64_t v13 = MEMORY[0x1E4F143A8];
    uint64_t v14 = 3221225472;
    v15 = __getBMDiscoverabilitySignalEventClass_block_invoke;
    v16 = &unk_1E6EA23D0;
    uint64_t v17 = &v18;
    __getBMDiscoverabilitySignalEventClass_block_invoke((uint64_t)&v13);
    v7 = (void *)v19[3];
  }
  v8 = v7;
  _Block_object_dispose(&v18, 8);
  id v9 = [v8 alloc];
  v10 = [(BioStreamsEventHelper *)self containerIdentifier];
  id v11 = [(BioStreamsEventHelper *)self subtype];
  v12 = (void *)[v9 initWithIdentifier:@"com.apple.biometrickitui.enrollment.success" bundleID:v10 context:v11];

  [v6 sendEvent:v12];
}

- (id)containerIdentifier
{
  if ([(BioStreamsEventHelper *)self inBuddy]) {
    return @"com.apple.setupassistant";
  }
  else {
    return @"com.apple.Preferences";
  }
}

- (id)subtype
{
  if ([(BioStreamsEventHelper *)self deviceType] == 1) {
    return @"TouchID";
  }
  else {
    return @"FaceID";
  }
}

- (int64_t)deviceType
{
  return self->_deviceType;
}

- (void)setDeviceType:(int64_t)a3
{
  self->_deviceType = a3;
}

- (BOOL)inBuddy
{
  return self->_inBuddy;
}

- (void)setInBuddy:(BOOL)a3
{
  self->_inBuddy = a3;
}

@end
@interface AUAudioUnitBus_XPC
+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3;
+ (BOOL)supportsSecureCoding;
- (AUAudioUnitBus_XPC)initWithCoder:(id)a3;
- (BOOL)isEnabled;
- (BOOL)setFormat:(id)a3 error:(id *)a4;
- (id)format;
- (void)addObserver:(id)a3 forKeyPath:(id)a4 options:(unint64_t)a5 context:(void *)a6;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)propertyChanged:(id)a3;
- (void)removeObserver:(id)a3 forKeyPath:(id)a4;
- (void)removeObserver:(id)a3 forKeyPath:(id)a4 context:(void *)a5;
- (void)setEnabled:(BOOL)a3;
@end

@implementation AUAudioUnitBus_XPC

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supportedChannelLayoutTags, 0);
  objc_storeStrong((id *)&self->_format, 0);
  objc_destroyWeak((id *)&self->_remoteAUXPCConnection);
  objc_destroyWeak((id *)&self->_audioUnit);
}

- (id)format
{
  return self->_format;
}

- (void)propertyChanged:(id)a3
{
  v4 = a3;
  [(AUAudioUnitBus_XPC *)self willChangeValueForKey:v4[1]];
  [(AUAudioUnitBus_XPC *)self didChangeValueForKey:v4[1]];
}

- (void)setEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  p_audioUnit = &self->_audioUnit;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_audioUnit);

  if (WeakRetained)
  {
    id v9 = objc_loadWeakRetained((id *)p_audioUnit);
    v7 = [MEMORY[0x1E4F28ED0] numberWithBool:v3];
    v8 = +[AUAudioUnitProperty propertyWithKey:@"enabled" scope:self->_scope element:self->_element];
    [v9 _setValue:v7 forProperty:v8 error:0];
  }
}

- (BOOL)isEnabled
{
  p_audioUnit = &self->_audioUnit;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_audioUnit);

  if (!WeakRetained) {
    return 0;
  }
  id v5 = objc_loadWeakRetained((id *)p_audioUnit);
  v6 = +[AUAudioUnitProperty propertyWithKey:@"enabled" scope:self->_scope element:self->_element];
  v7 = [v5 _getValueForProperty:v6 error:0];

  char v8 = [v7 BOOLValue];
  return v8;
}

- (BOOL)setFormat:(id)a3 error:(id *)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v7 = (AVAudioFormat *)a3;
  if (self->_format == v7) {
    goto LABEL_12;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_remoteAUXPCConnection);

  if (WeakRetained)
  {
    id v9 = objc_loadWeakRetained((id *)&self->_remoteAUXPCConnection);
    caulk::xpc::sync_message<objc_object  {objcproto22AUAudioUnitXPCProtocol}* {__strong},NSArray * {__strong}>::sync_message(&v19, v9);

    v10 = caulk::xpc::message<objc_object  {objcproto22AUAudioUnitXPCProtocol}* {__strong},NSArray * {__strong}>::sync_proxy(&v19);
    uint64_t element = self->_element;
    uint64_t scope = self->_scope;
    v13 = caulk::xpc::message<objc_object  {objcproto22AUAudioUnitXPCProtocol}* {__strong},NSArray * {__strong}>::reply((uint64_t)&v19);
    [v10 setBusFormat:element scope:scope format:v7 reply:v13];

    id v14 = v22;
    id v15 = v21;

    std::__function::__value_func<void ()(NSError *,std::tuple<NSArray * {__strong}> &&)>::~__value_func[abi:ne180100](v20);
    if (v15)
    {
      if (a4) {
        *a4 = v15;
      }
      id v16 = v15;

      BOOL v17 = 0;
      goto LABEL_11;
    }
    id v16 = v14;
  }
  else
  {
    id v16 = 0;
  }
  objc_storeStrong((id *)&self->_format, a3);
  if (!v16)
  {
LABEL_12:
    BOOL v17 = 1;
    goto LABEL_13;
  }
  id v14 = objc_loadWeakRetained((id *)&self->_audioUnit);
  [v14 propertiesChanged:v16];
  BOOL v17 = 1;
LABEL_11:

LABEL_13:
  return v17;
}

- (void)removeObserver:(id)a3 forKeyPath:(id)a4
{
  v15[4] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)AUAudioUnitBus_XPC;
  [(AUAudioUnitBus *)&v12 removeObserver:a3 forKeyPath:v6];
  if (!self->_removingObserverWithContext)
  {
    id WeakRetained = (char *)objc_loadWeakRetained((id *)&self->_audioUnit);
    char v8 = (std::recursive_mutex *)(WeakRetained + 584);
    std::recursive_mutex::lock((std::recursive_mutex *)(WeakRetained + 584));

    id v9 = +[AUAudioUnitProperty propertyWithKey:v6 scope:self->_scope element:self->_element];
    id v10 = objc_loadWeakRetained((id *)&self->_remoteAUXPCConnection);
    v13[0] = &unk_1EDF9E4D0;
    v13[1] = &__block_literal_global_30;
    v13[3] = v13;
    caulk::xpc::message<objc_object  {objcproto22AUAudioUnitXPCProtocol}* {__strong}>::message(&v14, v10, (uint64_t)v13);
    _ZNSt3__110__function12__value_funcIFvP7NSErrorONS_5tupleIJEEEEED2B8ne180100Ev(v13);

    v11 = caulk::xpc::message<objc_object  {objcproto22AUAudioUnitXPCProtocol}* {__strong}>::async_proxy(&v14);
    [v11 removePropertyObserver:v9 context:0 reply:&__block_literal_global_32];

    _ZNSt3__110__function12__value_funcIFvP7NSErrorONS_5tupleIJEEEEED2B8ne180100Ev(v15);
    std::recursive_mutex::unlock(v8);
  }
}

- (void)removeObserver:(id)a3 forKeyPath:(id)a4 context:(void *)a5
{
  v19[4] = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  self->_removingObserverWithContext = 1;
  v16.receiver = self;
  v16.super_class = (Class)AUAudioUnitBus_XPC;
  [(AUAudioUnitBus *)&v16 removeObserver:a3 forKeyPath:v8 context:a5];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_audioUnit);
  BOOL v10 = WeakRetained == 0;

  if (!v10)
  {
    v11 = (char *)objc_loadWeakRetained((id *)&self->_audioUnit);
    objc_super v12 = (std::recursive_mutex *)(v11 + 584);
    std::recursive_mutex::lock((std::recursive_mutex *)(v11 + 584));

    v13 = +[AUAudioUnitProperty propertyWithKey:v8 scope:self->_scope element:self->_element];
    id v14 = objc_loadWeakRetained((id *)&self->_remoteAUXPCConnection);
    v17[0] = &unk_1EDF9E4D0;
    v17[1] = &__block_literal_global_24;
    v17[3] = v17;
    caulk::xpc::message<objc_object  {objcproto22AUAudioUnitXPCProtocol}* {__strong}>::message(&v18, v14, (uint64_t)v17);
    _ZNSt3__110__function12__value_funcIFvP7NSErrorONS_5tupleIJEEEEED2B8ne180100Ev(v17);

    id v15 = caulk::xpc::message<objc_object  {objcproto22AUAudioUnitXPCProtocol}* {__strong}>::async_proxy(&v18);
    [v15 removePropertyObserver:v13 context:a5 reply:&__block_literal_global_26];

    _ZNSt3__110__function12__value_funcIFvP7NSErrorONS_5tupleIJEEEEED2B8ne180100Ev(v19);
    std::recursive_mutex::unlock(v12);
  }
  self->_removingObserverWithContext = 0;
}

- (void)addObserver:(id)a3 forKeyPath:(id)a4 options:(unint64_t)a5 context:(void *)a6
{
  v19[4] = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  v16.receiver = self;
  v16.super_class = (Class)AUAudioUnitBus_XPC;
  [(AUAudioUnitBus *)&v16 addObserver:a3 forKeyPath:v10 options:a5 context:a6];
  id WeakRetained = (char *)objc_loadWeakRetained((id *)&self->_audioUnit);
  objc_super v12 = (std::recursive_mutex *)(WeakRetained + 584);
  std::recursive_mutex::lock((std::recursive_mutex *)(WeakRetained + 584));

  v13 = +[AUAudioUnitProperty propertyWithKey:v10 scope:self->_scope element:self->_element];
  id v14 = objc_loadWeakRetained((id *)&self->_remoteAUXPCConnection);
  v17[0] = &unk_1EDF9E4D0;
  v17[1] = &__block_literal_global_4198;
  v17[3] = v17;
  caulk::xpc::message<objc_object  {objcproto22AUAudioUnitXPCProtocol}* {__strong}>::message(&v18, v14, (uint64_t)v17);
  _ZNSt3__110__function12__value_funcIFvP7NSErrorONS_5tupleIJEEEEED2B8ne180100Ev(v17);

  id v15 = caulk::xpc::message<objc_object  {objcproto22AUAudioUnitXPCProtocol}* {__strong}>::async_proxy(&v18);
  [v15 addPropertyObserver:v13 context:a6 reply:&__block_literal_global_20];

  _ZNSt3__110__function12__value_funcIFvP7NSErrorONS_5tupleIJEEEEED2B8ne180100Ev(v19);
  std::recursive_mutex::unlock(v12);
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)AUAudioUnitBus_XPC;
  [(AUAudioUnitBus *)&v2 dealloc];
}

- (AUAudioUnitBus_XPC)initWithCoder:(id)a3
{
  id v4 = a3;
  {
    id v9 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    id v10 = self;
    v11 = self;
    -[AUAudioUnitBus_XPC initWithCoder:]::layoutTagArrayClasses = objc_msgSend(v9, "initWithObjects:", v10, v11, 0);
  }
  {
    id v12 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    id AVAudioFormatClass = getAVAudioFormatClass();
    -[AUAudioUnitBus_XPC initWithCoder:]::formatClasses = objc_msgSend(v12, "initWithObjects:", AVAudioFormatClass, getAVAudioChannelLayoutClass(), 0);
  }
  v14.receiver = self;
  v14.super_class = (Class)AUAudioUnitBus_XPC;
  id v5 = [(AUAudioUnitBus_XPC *)&v14 init];
  if (v5)
  {
    v5->_uint64_t scope = [v4 decodeIntegerForKey:@"scope"];
    v5->_uint64_t element = [v4 decodeIntegerForKey:@"element"];
    id v6 = [v4 decodeObjectOfClasses:-[AUAudioUnitBus_XPC initWithCoder:]::formatClasses forKey:@"format"];
    objc_storeStrong((id *)&v5->_format, v6);

    v7 = [v4 decodeObjectOfClasses:-[AUAudioUnitBus_XPC initWithCoder:]::layoutTagArrayClasses forKey:@"supportedChannelLayoutTags"];
    objc_storeStrong((id *)&v5->_supportedChannelLayoutTags, v7);
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeInteger:self->_scope forKey:@"scope"];
  [v4 encodeInteger:self->_element forKey:@"element"];
  [v4 encodeObject:self->_format forKey:@"format"];
  [v4 encodeObject:self->_supportedChannelLayoutTags forKey:@"supportedChannelLayoutTags"];
}

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
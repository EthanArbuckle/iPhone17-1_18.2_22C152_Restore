@interface AUAudioUnit_RemoteV2
- (AUAudioUnit_RemoteV2)initWithXPCService:()unique_ptr<AUHostingServiceClient componentDescription:(std:(AudioComponentDescription *)a4 :(OpaqueAudioComponentInstance *)a5 default_delete<AUHostingServiceClient>>)a3 instance:(id)a6 instanceUUID:(id *)a7 error:;
- (BOOL)providesUserInterface;
- (id).cxx_construct;
- (id)_valueForProperty:(id)a3 error:(id *)a4;
- (id)auInstanceUUID;
- (id)initWithXPCService:componentDescription:instance:instanceUUID:error:;
- (uint64_t)initWithXPCService:componentDescription:instance:instanceUUID:error:;
- (void)_setValue:(id)a3 forKey:(id)a4 error:(id *)a5;
- (void)dealloc;
- (void)initWithXPCService:componentDescription:instance:instanceUUID:error:;
- (void)requestViewControllerWithCompletionHandler:(id)a3;
@end

@implementation AUAudioUnit_RemoteV2

- (id).cxx_construct
{
  *((void *)self + 125) = 0;
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_auInstanceUUID, 0);
  std::unique_ptr<AUHostingServiceClient>::reset[abi:ne180100](&self->_service.__ptr_.__value_, 0);
}

- (void)requestViewControllerWithCompletionHandler:(id)a3
{
}

- (BOOL)providesUserInterface
{
  v3 = [(AUAudioUnit *)self cachedViewController];

  if (v3) {
    return 1;
  }
  v5 = +[AUAudioUnitProperty propertyWithKey:@"_v2bridge_providesUserInterface" v2propID:0 scope:0 element:0];
  id v9 = 0;
  v6 = [(AUAudioUnit_XPC *)self _getValueForProperty:v5 error:&v9];
  id v7 = v9;

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    char v4 = [v6 BOOLValue];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

- (void)_setValue:(id)a3 forKey:(id)a4 error:(id *)a5
{
  id v12 = a3;
  id v8 = a4;
  id v9 = +[AUAudioUnit keyPathsForValuesAffectingAllParameterValues];
  int v10 = [v9 containsObject:v8];

  if (v10)
  {
    [(AUAudioUnit_XPC *)self _setState:v12 forKey:v8 error:a5];
  }
  else
  {
    v11 = +[AUAudioUnitProperty propertyWithKey:v8];
    [(AUAudioUnit_XPC *)self _setValue:v12 forProperty:v11 error:a5];
  }
}

- (id)_valueForProperty:(id)a3 error:(id *)a4
{
  char v4 = [(AUAudioUnit_XPC *)self _getValueForProperty:a3 error:a4];
  return v4;
}

- (void)dealloc
{
  v5[4] = *MEMORY[0x1E4F143B8];
  value = self->_service.__ptr_.__value_;
  v5[3] = 0;
  AUHostingServiceClient::setInvalidationHandler(*((std::recursive_mutex **)value + 7), (uint64_t)v5);
  std::__function::__value_func<void ()(void)>::~__value_func[abi:ne180100](v5);
  v4.receiver = self;
  v4.super_class = (Class)AUAudioUnit_RemoteV2;
  [(AUAudioUnit_XPC *)&v4 dealloc];
}

- (id)auInstanceUUID
{
  return self->_auInstanceUUID;
}

- (AUAudioUnit_RemoteV2)initWithXPCService:()unique_ptr<AUHostingServiceClient componentDescription:(std:(AudioComponentDescription *)a4 :(OpaqueAudioComponentInstance *)a5 default_delete<AUHostingServiceClient>>)a3 instance:(id)a6 instanceUUID:(id *)a7 error:
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v13 = a6;
  AudioComponentDescription v36 = *a4;
  v35.receiver = self;
  v35.super_class = (Class)AUAudioUnit_RemoteV2;
  v14 = [(AUAudioUnit *)&v35 initWithComponentDescription:&v36 options:0 error:a7];
  v15 = v14;
  if (v14)
  {
    p_service = &v14->_service;
    v17 = *(AUHostingServiceClient **)a3.__ptr_.__value_;
    *(void *)a3.__ptr_.__value_ = 0;
    std::unique_ptr<AUHostingServiceClient>::reset[abi:ne180100](&v14->_service.__ptr_.__value_, v17);
    [(AUAudioUnit_XPC *)v15 _setComponentInstance:a5];
    objc_storeStrong((id *)&v15->_auInstanceUUID, a6);
    objc_initWeak(&location, v15);
    value = p_service->__ptr_.__value_;
    objc_copyWeak(&to, &location);
    v39 = 0;
    v37 = &unk_1EDF8B078;
    objc_moveWeak(&v38, &to);
    v39 = &v37;
    objc_destroyWeak(&to);
    AUHostingServiceClient::setInvalidationHandler(*((std::recursive_mutex **)value + 7), (uint64_t)&v37);
    std::__function::__value_func<void ()(void)>::~__value_func[abi:ne180100](&v37);
    uint64_t v27 = 0;
    v28 = &v27;
    uint64_t v29 = 0x3032000000;
    v30 = __Block_byref_object_copy__15067;
    v31 = __Block_byref_object_dispose__15068;
    id v32 = 0;
    id v19 = *((id *)p_service->__ptr_.__value_ + 5);
    v20 = v15;
    id v21 = v19;
    v22 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EDFB6DE0];
    SetAllowedClassesForAUAudioUnitHostXPCInterface(v22);
    [v21 setExportedInterface:v22];
    v23 = objc_opt_new();
    [v23 setAudioUnit:v20];
    [v21 setExportedObject:v23];

    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __92__AUAudioUnit_RemoteV2_initWithXPCService_componentDescription_instance_instanceUUID_error___block_invoke;
    v26[3] = &unk_1E5688D50;
    v26[4] = &v27;
    [(AUAudioUnit_XPC *)v20 _doOpen:v21 completion:v26];

    if (a7) {
      *a7 = (id) v28[5];
    }
    v24 = v20;
    _Block_object_dispose(&v27, 8);

    objc_destroyWeak(&location);
  }

  return v15;
}

- (void)initWithXPCService:componentDescription:instance:instanceUUID:error:
{
  objc_destroyWeak((id *)(a1 + 8));
  JUMPOUT(0x192FC8940);
}

- (id)initWithXPCService:componentDescription:instance:instanceUUID:error:
{
  v1 = (id *)(a1 + 8);
  v2 = (id *)operator new(0x10uLL);
  id *v2 = &unk_1EDF8B078;
  objc_copyWeak(v2 + 1, v1);
  return v2;
}

- (uint64_t)initWithXPCService:componentDescription:instance:instanceUUID:error:
{
  return a1;
}

@end
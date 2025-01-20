@interface CarbonComponentScannerXPCClient
- (AudioComponentVector)initialScan:(SEL)a3;
- (CarbonComponentScannerXPCClient)init;
- (id)xpcConnection;
- (void)handleConnectionError:(BOOL)a3;
- (void)rescan:(id)a3 added:(void *)a4 removed:(void *)a5;
@end

@implementation CarbonComponentScannerXPCClient

- (void).cxx_destruct
{
}

- (void)rescan:(id)a3 added:(void *)a4 removed:(void *)a5
{
  v26[4] = *(void ***)MEMORY[0x1E4F143B8];
  id v8 = a3;
  [(CarbonComponentScannerXPCClient *)self xpcConnection];
  aBlock.__begin_ = &unk_1EDFA14A0;
  aBlock.__end_ = &v19;
  *(void *)&aBlock.mSorted = &aBlock;
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  id v19 = v9;
  std::__function::__value_func<void ()(NSError *,std::tuple<NSData * {__strong},NSData * {__strong}> &&)>::__value_func[abi:ne180100]((uint64_t)v20, (uint64_t)&aBlock);

  std::__function::__value_func<void ()(NSError *,std::tuple<NSData * {__strong},NSData * {__strong}> &&)>::~__value_func[abi:ne180100](&aBlock);
  id v21 = 0;
  id v22 = 0;
  id obj = 0;

  std::__function::__value_func<void ()(NSError *,std::tuple<NSData * {__strong},NSData * {__strong}> &&)>::__value_func[abi:ne180100]((uint64_t)v26, (uint64_t)v20);
  id v10 = v19;
  aBlock.__begin_ = (void *)MEMORY[0x1E4F143A8];
  aBlock.__end_ = (void *)3321888768;
  aBlock.__end_cap_.__value_ = ___ZN5caulk3xpc7messageIU8__strongPU44objcproto33CarbonComponentScannerXPCProtocol11objc_objectJU8__strongP6NSDataS7_EE10sync_proxyEv_block_invoke;
  *(void *)&aBlock.mSorted = &__block_descriptor_64_ea8_32c71_ZTSNSt3__18functionIFvP7NSErrorONS_5tupleIJU8__strongP6NSDataS6_EEEEEE_e17_v16__0__NSError_8l;
  std::__function::__value_func<void ()(NSError *,std::tuple<NSData * {__strong},NSData * {__strong}> &&)>::__value_func[abi:ne180100]((uint64_t)v25, (uint64_t)v26);
  v11 = [v10 synchronousRemoteObjectProxyWithErrorHandler:&aBlock];
  std::__function::__value_func<void ()(NSError *,std::tuple<NSData * {__strong},NSData * {__strong}> &&)>::~__value_func[abi:ne180100](v25);
  v12 = std::__function::__value_func<void ()(NSError *,std::tuple<NSData * {__strong},NSData * {__strong}> &&)>::~__value_func[abi:ne180100](v26);
  std::__function::__value_func<void ()(NSError *,std::tuple<NSData * {__strong},NSData * {__strong}> &&)>::__value_func[abi:ne180100]((uint64_t)v12, (uint64_t)v20);
  aBlock.__begin_ = (void *)MEMORY[0x1E4F143A8];
  aBlock.__end_ = (void *)3321888768;
  aBlock.__end_cap_.__value_ = ___ZN5caulk3xpc7messageIU8__strongPU44objcproto33CarbonComponentScannerXPCProtocol11objc_objectJU8__strongP6NSDataS7_EE5replyEv_block_invoke;
  *(void *)&aBlock.mSorted = &__block_descriptor_64_ea8_32c71_ZTSNSt3__18functionIFvP7NSErrorONS_5tupleIJU8__strongP6NSDataS6_EEEEEE_e39_v32__0__NSError_8__NSData_16__NSData_24l;
  std::__function::__value_func<void ()(NSError *,std::tuple<NSData * {__strong},NSData * {__strong}> &&)>::__value_func[abi:ne180100]((uint64_t)v25, (uint64_t)v26);
  v13 = _Block_copy(&aBlock);
  std::__function::__value_func<void ()(NSError *,std::tuple<NSData * {__strong},NSData * {__strong}> &&)>::~__value_func[abi:ne180100](v25);
  std::__function::__value_func<void ()(NSError *,std::tuple<NSData * {__strong},NSData * {__strong}> &&)>::~__value_func[abi:ne180100](v26);
  [v11 rescan:v8 reply:v13];

  id v14 = v21;
  if (v14)
  {
    if (!gAudioComponentLogCategory) {
      operator new();
    }
    v15 = *(id *)gAudioComponentLogCategory;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      LODWORD(aBlock.__begin_) = 136315650;
      *(void **)((char *)&aBlock.__begin_ + 4) = "CarbonComponentScannerXPCClient.mm";
      WORD2(aBlock.__end_) = 1024;
      *(_DWORD *)((char *)&aBlock.__end_ + 6) = 105;
      WORD1(aBlock.__end_cap_.__value_) = 2112;
      *(void **)((char *)&aBlock.__end_cap_.__value_ + 4) = v14;
      _os_log_impl(&dword_18FEC0000, v15, OS_LOG_TYPE_ERROR, "%25s:%-5d CarbonComponentScannerXPCClient error encountered on rescan: %@", (uint8_t *)&aBlock, 0x1Cu);
    }
  }
  else
  {
    v17 = 0;
    v18 = (NSData *)v22;
    objc_storeStrong((id *)&v17, obj);
    AudioComponentVector::createWithSerializedData(&aBlock, v18);
    std::vector<std::shared_ptr<APComponent>>::__vdeallocate((uint64_t *)a4);
    *(_OWORD *)a4 = *(_OWORD *)&aBlock.__begin_;
    *((void *)a4 + 2) = aBlock.__end_cap_.__value_;
    memset(&aBlock, 0, 24);
    *((unsigned char *)a4 + 24) = aBlock.mSorted;
    v26[0] = (void **)&aBlock;
    std::vector<std::shared_ptr<CA::ADMPackFormat>>::__destroy_vector::operator()[abi:ne180100](v26);
    AudioComponentVector::createWithSerializedData(&aBlock, v17);
    std::vector<std::shared_ptr<APComponent>>::__vdeallocate((uint64_t *)a5);
    *(_OWORD *)a5 = *(_OWORD *)&aBlock.__begin_;
    *((void *)a5 + 2) = aBlock.__end_cap_.__value_;
    memset(&aBlock, 0, 24);
    *((unsigned char *)a5 + 24) = aBlock.mSorted;
    v26[0] = (void **)&aBlock;
    std::vector<std::shared_ptr<CA::ADMPackFormat>>::__destroy_vector::operator()[abi:ne180100](v26);
  }
  std::__function::__value_func<void ()(NSError *,std::tuple<NSData * {__strong},NSData * {__strong}> &&)>::~__value_func[abi:ne180100](v20);
}

- (AudioComponentVector)initialScan:(SEL)a3
{
  v23[4] = *(void ***)MEMORY[0x1E4F143B8];
  id v6 = a4;
  [(CarbonComponentScannerXPCClient *)self xpcConnection];
  aBlock.__begin_ = &unk_1EDFA1458;
  aBlock.__end_ = &v17;
  *(void *)&aBlock.mSorted = &aBlock;
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  id v17 = v7;
  std::__function::__value_func<void ()(NSError *,std::tuple<NSData * {__strong}> &&)>::__value_func[abi:ne180100]((uint64_t)v18, (uint64_t)&aBlock);

  std::__function::__value_func<void ()(NSError *,std::tuple<NSData * {__strong}> &&)>::~__value_func[abi:ne180100](&aBlock);
  id v19 = 0;
  id v20 = 0;

  std::__function::__value_func<void ()(NSError *,std::tuple<NSData * {__strong}> &&)>::__value_func[abi:ne180100]((uint64_t)v23, (uint64_t)v18);
  id v8 = v17;
  aBlock.__begin_ = (void *)MEMORY[0x1E4F143A8];
  aBlock.__end_ = (void *)3321888768;
  aBlock.__end_cap_.__value_ = ___ZN5caulk3xpc7messageIU8__strongPU44objcproto33CarbonComponentScannerXPCProtocol11objc_objectJU8__strongP6NSDataEE10sync_proxyEv_block_invoke;
  *(void *)&aBlock.mSorted = &__block_descriptor_64_ea8_32c68_ZTSNSt3__18functionIFvP7NSErrorONS_5tupleIJU8__strongP6NSDataEEEEEE_e17_v16__0__NSError_8l;
  std::__function::__value_func<void ()(NSError *,std::tuple<NSData * {__strong}> &&)>::__value_func[abi:ne180100]((uint64_t)v22, (uint64_t)v23);
  id v9 = [v8 synchronousRemoteObjectProxyWithErrorHandler:&aBlock];
  std::__function::__value_func<void ()(NSError *,std::tuple<NSData * {__strong}> &&)>::~__value_func[abi:ne180100](v22);
  id v10 = std::__function::__value_func<void ()(NSError *,std::tuple<NSData * {__strong}> &&)>::~__value_func[abi:ne180100](v23);
  std::__function::__value_func<void ()(NSError *,std::tuple<NSData * {__strong}> &&)>::__value_func[abi:ne180100]((uint64_t)v10, (uint64_t)v18);
  aBlock.__begin_ = (void *)MEMORY[0x1E4F143A8];
  aBlock.__end_ = (void *)3321888768;
  aBlock.__end_cap_.__value_ = ___ZN5caulk3xpc7messageIU8__strongPU44objcproto33CarbonComponentScannerXPCProtocol11objc_objectJU8__strongP6NSDataEE5replyEv_block_invoke;
  *(void *)&aBlock.mSorted = &__block_descriptor_64_ea8_32c68_ZTSNSt3__18functionIFvP7NSErrorONS_5tupleIJU8__strongP6NSDataEEEEEE_e28_v24__0__NSError_8__NSData_16l;
  std::__function::__value_func<void ()(NSError *,std::tuple<NSData * {__strong}> &&)>::__value_func[abi:ne180100]((uint64_t)v22, (uint64_t)v23);
  v11 = _Block_copy(&aBlock);
  std::__function::__value_func<void ()(NSError *,std::tuple<NSData * {__strong}> &&)>::~__value_func[abi:ne180100](v22);
  std::__function::__value_func<void ()(NSError *,std::tuple<NSData * {__strong}> &&)>::~__value_func[abi:ne180100](v23);
  [v9 initialScan:v6 reply:v11];

  id v12 = v19;
  if (v12)
  {
    if (!gAudioComponentLogCategory) {
      operator new();
    }
    id v14 = *(id *)gAudioComponentLogCategory;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      LODWORD(aBlock.__begin_) = 136315650;
      *(void **)((char *)&aBlock.__begin_ + 4) = "CarbonComponentScannerXPCClient.mm";
      WORD2(aBlock.__end_) = 1024;
      *(_DWORD *)((char *)&aBlock.__end_ + 6) = 81;
      WORD1(aBlock.__end_cap_.__value_) = 2112;
      *(void **)((char *)&aBlock.__end_cap_.__value_ + 4) = v12;
      _os_log_impl(&dword_18FEC0000, v14, OS_LOG_TYPE_ERROR, "%25s:%-5d CarbonComponentScannerXPCClient error encountered on initialScan: %@", (uint8_t *)&aBlock, 0x1Cu);
    }
    *(_OWORD *)&retstr->__begin_ = 0u;
    *(_OWORD *)&retstr->__end_cap_.__value_ = 0u;
    retstr->mSorted = 1;
  }
  else
  {
    v13 = (NSData *)v20;
    AudioComponentVector::createWithSerializedData(&aBlock, v13);
    retstr->__begin_ = 0;
    retstr->__end_ = 0;
    retstr->__end_cap_.__value_ = 0;
    std::vector<std::shared_ptr<APComponent>>::__init_with_size[abi:ne180100]<std::shared_ptr<APComponent>*,std::shared_ptr<APComponent>*>(retstr, aBlock.__begin_, (void *)aBlock.__end_, ((char *)aBlock.__end_ - (char *)aBlock.__begin_) >> 4);
    retstr->mSorted = aBlock.mSorted;
    v23[0] = (void **)&aBlock;
    std::vector<std::shared_ptr<CA::ADMPackFormat>>::__destroy_vector::operator()[abi:ne180100](v23);
  }
  std::__function::__value_func<void ()(NSError *,std::tuple<NSData * {__strong}> &&)>::~__value_func[abi:ne180100](v18);

  return result;
}

- (void)handleConnectionError:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (!gAudioComponentLogCategory) {
    operator new();
  }
  v5 = *(id *)gAudioComponentLogCategory;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    id v7 = "interrupted";
    *(void *)&v11[4] = "CarbonComponentScannerXPCClient.mm";
    *(_DWORD *)v11 = 136315650;
    if (v3) {
      id v7 = "invalidated";
    }
    *(_WORD *)&v11[12] = 1024;
    *(_DWORD *)&v11[14] = 63;
    __int16 v12 = 2080;
    v13 = v7;
    _os_log_impl(&dword_18FEC0000, v5, OS_LOG_TYPE_ERROR, "%25s:%-5d CarbonComponentScannerXPCClient connection was %s!", v11, 0x1Cu);
  }
  connection = self->_connection;
  p_connection = &self->_connection;
  [(NSXPCConnection *)connection invalidate];
  id v10 = *p_connection;
  *p_connection = 0;
}

- (id)xpcConnection
{
  connection = self->_connection;
  if (!connection)
  {
    v4 = (NSXPCConnection *)[objc_alloc(MEMORY[0x1E4F29268]) initWithServiceName:@"com.apple.audio.CarbonComponentScanner.x86-64"];
    v5 = self->_connection;
    self->_connection = v4;

    id v6 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EDFBB630];
    [(NSXPCConnection *)self->_connection setRemoteObjectInterface:v6];

    objc_initWeak(&location, self);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __48__CarbonComponentScannerXPCClient_xpcConnection__block_invoke;
    v10[3] = &unk_1E5688E10;
    objc_copyWeak(&v11, &location);
    [(NSXPCConnection *)self->_connection setInterruptionHandler:v10];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __48__CarbonComponentScannerXPCClient_xpcConnection__block_invoke_2;
    v8[3] = &unk_1E5688E10;
    objc_copyWeak(&v9, &location);
    [(NSXPCConnection *)self->_connection setInvalidationHandler:v8];
    [(NSXPCConnection *)self->_connection resume];
    objc_destroyWeak(&v9);
    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
    connection = self->_connection;
  }
  return connection;
}

void __48__CarbonComponentScannerXPCClient_xpcConnection__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained) {
    [WeakRetained handleConnectionError:0];
  }
}

void __48__CarbonComponentScannerXPCClient_xpcConnection__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained) {
    [WeakRetained handleConnectionError:1];
  }
}

- (CarbonComponentScannerXPCClient)init
{
  v6.receiver = self;
  v6.super_class = (Class)CarbonComponentScannerXPCClient;
  v2 = [(CarbonComponentScannerXPCClient *)&v6 init];
  BOOL v3 = v2;
  if (v2)
  {
    connection = v2->_connection;
    v2->_connection = 0;
  }
  return v3;
}

@end
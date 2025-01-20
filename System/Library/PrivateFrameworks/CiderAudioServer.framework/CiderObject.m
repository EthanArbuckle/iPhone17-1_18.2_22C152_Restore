@interface CiderObject
- (id).cxx_construct;
- (id)init:(shared_ptr<RouteSessionAttributes>)a3;
- (id)setPropertyDataPrivileged_NSHelper:(id)a3 withInAddress:(AudioObjectPropertyAddress *)a4 withInData:(id)a5;
- (pair<NSError)getPropertyData_NSHelper:(id)a3 withInAddress:(AudioObjectPropertyAddress *)a4 withClass:(Class)a5;
- (void)clearReporterOpts;
- (void)connectADSDevice:(id)a3 withReply:(id)a4;
- (void)connectADSDevices:(id)a3 withReply:(id)a4;
- (void)disconnectADSDeviceByAOID:(id)a3 withReply:(id)a4;
- (void)disconnectADSDeviceByUUID:(id)a3 withReply:(id)a4;
- (void)disconnectADSDevicesByAOIDs:(id)a3 withReply:(id)a4;
- (void)disconnectADSDevicesByUUIDs:(id)a3 withReply:(id)a4;
- (void)disconnectAllADSDevices:(id)a3;
- (void)getADSDeviceMap:(id)a3;
- (void)getADSPluginAOID:(id)a3;
- (void)getAOIDForUUID:(id)a3 withReply:(id)a4;
- (void)getPropertyDataSize:(id)a3 withInAddress:(AudioObjectPropertyAddress *)a4 withInQualifierData:(id)a5 withReply:(id)a6;
- (void)getPropertyDataSize:(id)a3 withInAddress:(AudioObjectPropertyAddress *)a4 withReply:(id)a5;
- (void)getPropertyData_Arithmetic:(id)a3 withInAddress:(AudioObjectPropertyAddress *)a4 withInQualifierData:(id)a5 withReply:(id)a6;
- (void)getPropertyData_Arithmetic:(id)a3 withInAddress:(AudioObjectPropertyAddress *)a4 withReply:(id)a5;
- (void)getPropertyData_Array:(id)a3 withInAddress:(AudioObjectPropertyAddress *)a4 withReply:(id)a5;
- (void)getPropertyData_Dict:(id)a3 withInAddress:(AudioObjectPropertyAddress *)a4 withReply:(id)a5;
- (void)getPropertyData_String:(id)a3 withInAddress:(AudioObjectPropertyAddress *)a4 withReply:(id)a5;
- (void)getUUIDForAOID:(id)a3 withReply:(id)a4;
- (void)hasProperty:(id)a3 withInAddress:(AudioObjectPropertyAddress *)a4 withReply:(id)a5;
- (void)isDeviceWithAOIDConnected:(id)a3 withReply:(id)a4;
- (void)isDeviceWithUUIDConnected:(id)a3 withReply:(id)a4;
- (void)registerForRouteReport:(id)a3;
- (void)registerForSessionReport:(id)a3;
- (void)serializeNonADSDevices:(id)a3;
- (void)setPropertyDataPrivileged_Arithmetic:(id)a3 withInAddress:(AudioObjectPropertyAddress *)a4 withInData:(id)a5 withReply:(id)a6;
- (void)setPropertyDataPrivileged_Arithmetic:(id)a3 withInAddress:(AudioObjectPropertyAddress *)a4 withInQualifierData:(id)a5 withInData:(id)a6 withReply:(id)a7;
- (void)setPropertyDataPrivileged_Array:(id)a3 withInAddress:(AudioObjectPropertyAddress *)a4 withInData:(id)a5 withReply:(id)a6;
- (void)setPropertyDataPrivileged_Dict:(id)a3 withInAddress:(AudioObjectPropertyAddress *)a4 withInData:(id)a5 withReply:(id)a6;
- (void)setPropertyDataPrivileged_String:(id)a3 withInAddress:(AudioObjectPropertyAddress *)a4 withInData:(id)a5 withReply:(id)a6;
@end

@implementation CiderObject

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  return self;
}

- (void).cxx_destruct
{
  cntrl = self->mRouteSessionAttrsPtr.__cntrl_;
  if (cntrl) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)cntrl);
  }
  v4 = self->mKernelPtr.__cntrl_;
  if (v4)
  {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v4);
  }
}

- (void)registerForSessionReport:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  v4 = (uint64_t (**)(void))a3;
  v5 = (util *)std::optional<void({block_pointer} {__strong})(NSDictionary *)>::operator=[abi:ne180100]<void({block_pointer} {__strong}&)(NSDictionary *),void>((uint64_t)self->mRouteSessionAttrsPtr.__ptr_ + 40, (uint64_t)v4);
  ptr = self->mRouteSessionAttrsPtr.__ptr_;
  if (*((void *)ptr + 4))
  {
    if (*((unsigned char *)ptr + 56))
    {
      util::server_log(v5);
      v7 = (id) util::server_log(void)::sLogCat;
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        int v10 = 136315394;
        v11 = "InCider.mm";
        __int16 v12 = 1024;
        int v13 = 888;
        v8 = "%25s:%-5d Stored reply block for same reporter, no session configuration sent";
LABEL_9:
        _os_log_impl(&dword_249BFC000, v7, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v10, 0x12u);
      }
    }
    else
    {
      *((unsigned char *)ptr + 56) = 1;
      v9 = (util *)v4[2](v4);
      util::server_log(v9);
      v7 = (id) util::server_log(void)::sLogCat;
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        int v10 = 136315394;
        v11 = "InCider.mm";
        __int16 v12 = 1024;
        int v13 = 885;
        v8 = "%25s:%-5d Stored reply block for new reporter and sent session configuration";
        goto LABEL_9;
      }
    }
  }
  else
  {
    util::server_log(v5);
    v7 = (id) util::server_log(void)::sLogCat;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 136315394;
      v11 = "InCider.mm";
      __int16 v12 = 1024;
      int v13 = 891;
      v8 = "%25s:%-5d Stored reply block for reporter, no session configuration present";
      goto LABEL_9;
    }
  }
}

- (void)registerForRouteReport:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  v4 = (uint64_t (**)(void))a3;
  v5 = (util *)std::optional<void({block_pointer} {__strong})(NSDictionary *)>::operator=[abi:ne180100]<void({block_pointer} {__strong}&)(NSDictionary *),void>((uint64_t)self->mRouteSessionAttrsPtr.__ptr_ + 8, (uint64_t)v4);
  ptr = self->mRouteSessionAttrsPtr.__ptr_;
  if (*(void *)ptr)
  {
    if (*((unsigned char *)ptr + 24))
    {
      util::server_log(v5);
      v7 = (id) util::server_log(void)::sLogCat;
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        int v10 = 136315394;
        v11 = "InCider.mm";
        __int16 v12 = 1024;
        int v13 = 868;
        v8 = "%25s:%-5d Stored reply block for same reporter, no route configuration sent";
LABEL_9:
        _os_log_impl(&dword_249BFC000, v7, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v10, 0x12u);
      }
    }
    else
    {
      *((unsigned char *)ptr + 24) = 1;
      v9 = (util *)v4[2](v4);
      util::server_log(v9);
      v7 = (id) util::server_log(void)::sLogCat;
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        int v10 = 136315394;
        v11 = "InCider.mm";
        __int16 v12 = 1024;
        int v13 = 865;
        v8 = "%25s:%-5d Stored reply block for new reporter and sent route configuration";
        goto LABEL_9;
      }
    }
  }
  else
  {
    util::server_log(v5);
    v7 = (id) util::server_log(void)::sLogCat;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 136315394;
      v11 = "InCider.mm";
      __int16 v12 = 1024;
      int v13 = 871;
      v8 = "%25s:%-5d Stored reply block for reporter, no route configuration present";
      goto LABEL_9;
    }
  }
}

- (void)setPropertyDataPrivileged_String:(id)a3 withInAddress:(AudioObjectPropertyAddress *)a4 withInData:(id)a5 withReply:(id)a6
{
  v11 = (void (**)(id, void *))a6;
  int v10 = [(CiderObject *)self setPropertyDataPrivileged_NSHelper:a3 withInAddress:a4 withInData:a5];
  v11[2](v11, v10);
}

- (void)setPropertyDataPrivileged_Dict:(id)a3 withInAddress:(AudioObjectPropertyAddress *)a4 withInData:(id)a5 withReply:(id)a6
{
  v11 = (void (**)(id, void *))a6;
  int v10 = [(CiderObject *)self setPropertyDataPrivileged_NSHelper:a3 withInAddress:a4 withInData:a5];
  v11[2](v11, v10);
}

- (void)setPropertyDataPrivileged_Array:(id)a3 withInAddress:(AudioObjectPropertyAddress *)a4 withInData:(id)a5 withReply:(id)a6
{
  v11 = (void (**)(id, void *))a6;
  int v10 = [(CiderObject *)self setPropertyDataPrivileged_NSHelper:a3 withInAddress:a4 withInData:a5];
  v11[2](v11, v10);
}

- (void)setPropertyDataPrivileged_Arithmetic:(id)a3 withInAddress:(AudioObjectPropertyAddress *)a4 withInData:(id)a5 withReply:(id)a6
{
}

- (void)setPropertyDataPrivileged_Arithmetic:(id)a3 withInAddress:(AudioObjectPropertyAddress *)a4 withInQualifierData:(id)a5 withInData:(id)a6 withReply:(id)a7
{
  uint64_t v76 = *MEMORY[0x263EF8340];
  id v13 = a3;
  id v59 = a5;
  id v14 = a6;
  v15 = (util *)a7;
  v16 = v15;
  if (!v13 || !v14 || (v15 = (util *)[v14 bytes]) == 0)
  {
    util::server_log(v15);
    v17 = (id) util::server_log(void)::sLogCat;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v18 = (std::string *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      *(void *)&buf[4] = "InCider.mm";
      __int16 v65 = 1024;
      int v66 = 779;
      __int16 v67 = 2112;
      v68 = v18;
      _os_log_impl(&dword_249BFC000, v17, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Pre-kernel CiderObject encountered nil parameter in method %@", buf, 0x1Cu);
    }
    v19 = (void *)MEMORY[0x263F087E8];
    v20 = NSStringFromSelector(a2);
    v21 = [v19 errorWithDomain:v20 code:1852797029 userInfo:0];
    (*((void (**)(util *, void *))v16 + 2))(v16, v21);
  }
  int v22 = objc_msgSend(v13, "unsignedIntValue", v59);
  if (v60 && (id v23 = v60, [v23 bytes]))
  {
    ptr = self->mKernelPtr.__ptr_;
    int v25 = [v23 length];
    uint64_t v26 = [v23 bytes];
    int v27 = [v14 length];
    v28 = (const void *)[v14 bytes];
    v29 = (ads::Kernel *)ptr;
    int v30 = v22;
    v31 = a4;
    int v32 = v25;
    v33 = (const void *)v26;
    int v34 = v27;
  }
  else
  {
    v35 = self->mKernelPtr.__ptr_;
    int v36 = [v14 length];
    v28 = (const void *)[v14 bytes];
    v29 = (ads::Kernel *)v35;
    int v30 = v22;
    v31 = a4;
    int v32 = 0;
    v33 = 0;
    int v34 = v36;
  }
  v37 = (util *)ads::Kernel::setPropertyDataPrivileged(v29, v30, v31, v32, v33, v34, v28);
  signed int v38 = (int)v37;
  BOOL v39 = v37 == 0;
  util::server_log(v37);
  v40 = (id) util::server_log(void)::sLogCat;
  BOOL v41 = os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT);
  if (v39)
  {
    if (v41)
    {
      AudioObjectPropertySelector mSelector = a4->mSelector;
      int v44 = bswap32(a4->mSelector);
      *(_DWORD *)&buf[1] = v44;
      if (((char)v44 - 32) > 0x5E
        || (((__int16)v44 >> 8) - 32) > 0x5E
        || ((v44 << 8 >> 24) - 32) > 0x5E
        || ((v44 >> 24) - 32) > 0x5E)
      {
        std::to_string(&v63, mSelector);
      }
      else
      {
        strcpy(&buf[5], "'");
        buf[0] = 39;
        std::string::basic_string[abi:ne180100]<0>(&v63, buf);
      }
      if ((v63.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        v54 = &v63;
      }
      else {
        v54 = (std::string *)v63.__r_.__value_.__r.__words[0];
      }
      AudioObjectPropertyScope mScope = a4->mScope;
      int v56 = bswap32(mScope);
      *(_DWORD *)&buf[1] = v56;
      if (((char)v56 - 32) > 0x5E
        || (((__int16)v56 >> 8) - 32) > 0x5E
        || ((v56 << 8 >> 24) - 32) > 0x5E
        || ((v56 >> 24) - 32) > 0x5E)
      {
        std::to_string(&v62, mScope);
      }
      else
      {
        strcpy(&buf[5], "'");
        buf[0] = 39;
        std::string::basic_string[abi:ne180100]<0>(&v62, buf);
      }
      v57 = &v62;
      if ((v62.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
        v57 = (std::string *)v62.__r_.__value_.__r.__words[0];
      }
      AudioObjectPropertyElement mElement = a4->mElement;
      *(_DWORD *)buf = 136316418;
      *(void *)&buf[4] = "InCider.mm";
      __int16 v65 = 1024;
      int v66 = 809;
      __int16 v67 = 2080;
      v68 = v54;
      __int16 v69 = 2080;
      v70 = v57;
      __int16 v71 = 1024;
      *(_DWORD *)v72 = mElement;
      *(_WORD *)&v72[4] = 1024;
      *(_DWORD *)&v72[6] = v22;
      _os_log_impl(&dword_249BFC000, v40, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Kernel successfully set property [%s/%s/%u] on device with ID %u with privilege", buf, 0x32u);
      if (SHIBYTE(v62.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v62.__r_.__value_.__l.__data_);
      }
      if (SHIBYTE(v63.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v63.__r_.__value_.__l.__data_);
      }
    }

    (*((void (**)(util *, void))v16 + 2))(v16, 0);
  }
  else
  {
    if (v41)
    {
      int v42 = bswap32(v38);
      *(_DWORD *)&buf[1] = v42;
      if (((char)v42 - 32) > 0x5E
        || (((__int16)v42 >> 8) - 32) > 0x5E
        || ((v42 << 8 >> 24) - 32) > 0x5E
        || ((v42 >> 24) - 32) > 0x5E)
      {
        std::to_string(&v63, v38);
      }
      else
      {
        strcpy(&buf[5], "'");
        buf[0] = 39;
        std::string::basic_string[abi:ne180100]<0>(&v63, buf);
      }
      if ((v63.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        v45 = &v63;
      }
      else {
        v45 = (std::string *)v63.__r_.__value_.__r.__words[0];
      }
      AudioObjectPropertySelector v46 = a4->mSelector;
      int v47 = bswap32(a4->mSelector);
      *(_DWORD *)&buf[1] = v47;
      if (((char)v47 - 32) > 0x5E
        || (((__int16)v47 >> 8) - 32) > 0x5E
        || ((v47 << 8 >> 24) - 32) > 0x5E
        || ((v47 >> 24) - 32) > 0x5E)
      {
        std::to_string(&v62, v46);
      }
      else
      {
        strcpy(&buf[5], "'");
        buf[0] = 39;
        std::string::basic_string[abi:ne180100]<0>(&v62, buf);
      }
      if ((v62.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        v48 = &v62;
      }
      else {
        v48 = (std::string *)v62.__r_.__value_.__r.__words[0];
      }
      AudioObjectPropertyScope v49 = a4->mScope;
      int v50 = bswap32(v49);
      *(_DWORD *)&buf[1] = v50;
      if (((char)v50 - 32) > 0x5E
        || (((__int16)v50 >> 8) - 32) > 0x5E
        || ((v50 << 8 >> 24) - 32) > 0x5E
        || ((v50 >> 24) - 32) > 0x5E)
      {
        std::to_string(&v61, v49);
      }
      else
      {
        strcpy(&buf[5], "'");
        buf[0] = 39;
        std::string::basic_string[abi:ne180100]<0>(&v61, buf);
      }
      v51 = &v61;
      if ((v61.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
        v51 = (std::string *)v61.__r_.__value_.__r.__words[0];
      }
      AudioObjectPropertyElement v52 = a4->mElement;
      *(_DWORD *)buf = 136316674;
      *(void *)&buf[4] = "InCider.mm";
      __int16 v65 = 1024;
      int v66 = 820;
      __int16 v67 = 2080;
      v68 = v45;
      __int16 v69 = 2080;
      v70 = v48;
      __int16 v71 = 2080;
      *(void *)v72 = v51;
      *(_WORD *)&v72[8] = 1024;
      AudioObjectPropertyElement v73 = v52;
      __int16 v74 = 1024;
      int v75 = v22;
      _os_log_impl(&dword_249BFC000, v40, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Kernel encountered error %s setting property [%s/%s/%u] on device with ID %u with privilege", buf, 0x3Cu);
      if (SHIBYTE(v61.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v61.__r_.__value_.__l.__data_);
      }
      if (SHIBYTE(v62.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v62.__r_.__value_.__l.__data_);
      }
      if (SHIBYTE(v63.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v63.__r_.__value_.__l.__data_);
      }
    }

    v53 = [MEMORY[0x263F087E8] errorWithDomain:@"ads::Kernel::setPropertyDataPrivileged" code:v38 userInfo:0];
    (*((void (**)(util *, void *))v16 + 2))(v16, v53);
  }
}

- (void)getPropertyData_String:(id)a3 withInAddress:(AudioObjectPropertyAddress *)a4 withReply:(id)a5
{
  id v8 = a3;
  v9 = (void (**)(id, id, id))a5;
  [(CiderObject *)self getPropertyData_NSHelper:v8 withInAddress:a4 withClass:objc_opt_class()];
  v9[2](v9, v10, v11);
}

- (void)getPropertyData_Dict:(id)a3 withInAddress:(AudioObjectPropertyAddress *)a4 withReply:(id)a5
{
  id v8 = a3;
  v9 = (void (**)(id, id, id))a5;
  [(CiderObject *)self getPropertyData_NSHelper:v8 withInAddress:a4 withClass:objc_opt_class()];
  v9[2](v9, v10, v11);
}

- (void)getPropertyData_Array:(id)a3 withInAddress:(AudioObjectPropertyAddress *)a4 withReply:(id)a5
{
  id v8 = a3;
  v9 = (void (**)(id, id, id))a5;
  [(CiderObject *)self getPropertyData_NSHelper:v8 withInAddress:a4 withClass:objc_opt_class()];
  v9[2](v9, v10, v11);
}

- (void)getPropertyData_Arithmetic:(id)a3 withInAddress:(AudioObjectPropertyAddress *)a4 withReply:(id)a5
{
}

- (void)getPropertyData_Arithmetic:(id)a3 withInAddress:(AudioObjectPropertyAddress *)a4 withInQualifierData:(id)a5 withReply:(id)a6
{
  uint64_t v68 = *MEMORY[0x263EF8340];
  id v11 = a3;
  id v51 = a5;
  __int16 v12 = (util *)a6;
  id v13 = v12;
  if (!v11)
  {
    util::server_log(v12);
    id v14 = (id) util::server_log(void)::sLogCat;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v15 = (std::string *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      *(void *)&buf[4] = "InCider.mm";
      *(_WORD *)&unsigned char buf[12] = 1024;
      *(_DWORD *)&buf[14] = 700;
      __int16 v59 = 2112;
      id v60 = v15;
      _os_log_impl(&dword_249BFC000, v14, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Pre-kernel CiderObject encountered nil parameter in method %@", buf, 0x1Cu);
    }
    v16 = (void *)MEMORY[0x263F087E8];
    v17 = NSStringFromSelector(a2);
    v18 = [v16 errorWithDomain:v17 code:1852797029 userInfo:0];
    (*((void (**)(util *, void *, void))v13 + 2))(v13, v18, 0);
  }
  uint64_t v19 = objc_msgSend(v11, "unsignedIntValue", v51);
  int v56 = 0;
  uint64_t v57 = 0;
  if (v52 && (id v20 = v52, [v20 bytes]))
  {
    ptr = self->mKernelPtr.__ptr_;
    uint64_t v22 = [v20 length];
    uint64_t v23 = [v20 bytes];
    v24 = ptr;
    int v25 = (const AudioObjectPropertyAddress *)v19;
    uint64_t v26 = a4;
    int v27 = (const void *)v22;
  }
  else
  {
    v24 = self->mKernelPtr.__ptr_;
    int v25 = (const AudioObjectPropertyAddress *)v19;
    uint64_t v26 = a4;
    int v27 = 0;
    uint64_t v23 = 0;
  }
  ads::Kernel::getPropertyData((ads::Kernel *)buf, (uint64_t)v24, v25, (uint64_t)v26, v27, v23);
  signed int v28 = *(_DWORD *)buf;
  int v56 = *(_DWORD *)buf;
  v29 = *(const void **)&buf[8];
  uint64_t v57 = *(void *)&buf[8];
  BOOL v30 = *(_DWORD *)buf == 0;
  util::server_log(v31);
  int v32 = (id) util::server_log(void)::sLogCat;
  BOOL v33 = os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT);
  if (v30)
  {
    if (v33)
    {
      AudioObjectPropertySelector mSelector = a4->mSelector;
      int v36 = bswap32(a4->mSelector);
      *(_DWORD *)&buf[1] = v36;
      if (((char)v36 - 32) > 0x5E
        || (((__int16)v36 >> 8) - 32) > 0x5E
        || ((v36 << 8 >> 24) - 32) > 0x5E
        || ((v36 >> 24) - 32) > 0x5E)
      {
        std::to_string(&v55, mSelector);
      }
      else
      {
        strcpy(&buf[5], "'");
        buf[0] = 39;
        std::string::basic_string[abi:ne180100]<0>(&v55, buf);
      }
      if ((v55.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        AudioObjectPropertySelector v46 = &v55;
      }
      else {
        AudioObjectPropertySelector v46 = (std::string *)v55.__r_.__value_.__r.__words[0];
      }
      AudioObjectPropertyScope mScope = a4->mScope;
      int v48 = bswap32(mScope);
      *(_DWORD *)&buf[1] = v48;
      if (((char)v48 - 32) > 0x5E
        || (((__int16)v48 >> 8) - 32) > 0x5E
        || ((v48 << 8 >> 24) - 32) > 0x5E
        || ((v48 >> 24) - 32) > 0x5E)
      {
        std::to_string(&v54, mScope);
      }
      else
      {
        strcpy(&buf[5], "'");
        buf[0] = 39;
        std::string::basic_string[abi:ne180100]<0>(&v54, buf);
      }
      AudioObjectPropertyScope v49 = &v54;
      if ((v54.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
        AudioObjectPropertyScope v49 = (std::string *)v54.__r_.__value_.__r.__words[0];
      }
      AudioObjectPropertyElement mElement = a4->mElement;
      *(_DWORD *)buf = 136316418;
      *(void *)&buf[4] = "InCider.mm";
      *(_WORD *)&unsigned char buf[12] = 1024;
      *(_DWORD *)&buf[14] = 726;
      __int16 v59 = 2080;
      id v60 = v46;
      __int16 v61 = 2080;
      std::string v62 = v49;
      __int16 v63 = 1024;
      *(_DWORD *)v64 = mElement;
      *(_WORD *)&v64[4] = 1024;
      *(_DWORD *)&v64[6] = v19;
      _os_log_impl(&dword_249BFC000, v32, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Kernel successfully got property [%s/%s/%u] on device with ID %u", buf, 0x32u);
      if (SHIBYTE(v54.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v54.__r_.__value_.__l.__data_);
      }
      if (SHIBYTE(v55.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v55.__r_.__value_.__l.__data_);
      }
    }

    (*((void (**)(util *, void, const void *))v13 + 2))(v13, 0, v29);
  }
  else
  {
    if (v33)
    {
      int v34 = bswap32(v28);
      *(_DWORD *)&buf[1] = v34;
      if (((char)v34 - 32) > 0x5E
        || (((__int16)v34 >> 8) - 32) > 0x5E
        || ((v34 << 8 >> 24) - 32) > 0x5E
        || ((v34 >> 24) - 32) > 0x5E)
      {
        std::to_string(&v55, v28);
      }
      else
      {
        strcpy(&buf[5], "'");
        buf[0] = 39;
        std::string::basic_string[abi:ne180100]<0>(&v55, buf);
      }
      if ((v55.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        v37 = &v55;
      }
      else {
        v37 = (std::string *)v55.__r_.__value_.__r.__words[0];
      }
      AudioObjectPropertySelector v38 = a4->mSelector;
      int v39 = bswap32(a4->mSelector);
      *(_DWORD *)&buf[1] = v39;
      if (((char)v39 - 32) > 0x5E
        || (((__int16)v39 >> 8) - 32) > 0x5E
        || ((v39 << 8 >> 24) - 32) > 0x5E
        || ((v39 >> 24) - 32) > 0x5E)
      {
        std::to_string(&v54, v38);
      }
      else
      {
        strcpy(&buf[5], "'");
        buf[0] = 39;
        std::string::basic_string[abi:ne180100]<0>(&v54, buf);
      }
      if ((v54.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        v40 = &v54;
      }
      else {
        v40 = (std::string *)v54.__r_.__value_.__r.__words[0];
      }
      AudioObjectPropertyScope v41 = a4->mScope;
      int v42 = bswap32(v41);
      *(_DWORD *)&buf[1] = v42;
      if (((char)v42 - 32) > 0x5E
        || (((__int16)v42 >> 8) - 32) > 0x5E
        || ((v42 << 8 >> 24) - 32) > 0x5E
        || ((v42 >> 24) - 32) > 0x5E)
      {
        std::to_string(&v53, v41);
      }
      else
      {
        strcpy(&buf[5], "'");
        buf[0] = 39;
        std::string::basic_string[abi:ne180100]<0>(&v53, buf);
      }
      v43 = &v53;
      if ((v53.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
        v43 = (std::string *)v53.__r_.__value_.__r.__words[0];
      }
      AudioObjectPropertyElement v44 = a4->mElement;
      *(_DWORD *)buf = 136316674;
      *(void *)&buf[4] = "InCider.mm";
      *(_WORD *)&unsigned char buf[12] = 1024;
      *(_DWORD *)&buf[14] = 737;
      __int16 v59 = 2080;
      id v60 = v37;
      __int16 v61 = 2080;
      std::string v62 = v40;
      __int16 v63 = 2080;
      *(void *)v64 = v43;
      *(_WORD *)&v64[8] = 1024;
      AudioObjectPropertyElement v65 = v44;
      __int16 v66 = 1024;
      int v67 = v19;
      _os_log_impl(&dword_249BFC000, v32, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Kernel encountered error %s getting property [%s/%s/%u] on device with ID %u", buf, 0x3Cu);
      if (SHIBYTE(v53.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v53.__r_.__value_.__l.__data_);
      }
      if (SHIBYTE(v54.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v54.__r_.__value_.__l.__data_);
      }
      if (SHIBYTE(v55.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v55.__r_.__value_.__l.__data_);
      }
    }

    v45 = [MEMORY[0x263F087E8] errorWithDomain:@"ads::Kernel::getPropertyData" code:v28 userInfo:0];
    (*((void (**)(util *, void *, void))v13 + 2))(v13, v45, 0);
  }
  if (v29) {
    CFRelease(v29);
  }
}

- (void)getPropertyDataSize:(id)a3 withInAddress:(AudioObjectPropertyAddress *)a4 withReply:(id)a5
{
}

- (void)getPropertyDataSize:(id)a3 withInAddress:(AudioObjectPropertyAddress *)a4 withInQualifierData:(id)a5 withReply:(id)a6
{
  uint64_t v64 = *MEMORY[0x263EF8340];
  id v11 = a3;
  id v12 = a5;
  id v13 = (util *)a6;
  id v14 = v13;
  if (!v11)
  {
    util::server_log(v13);
    v15 = (id) util::server_log(void)::sLogCat;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v16 = (std::string *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      *(void *)&buf[4] = "InCider.mm";
      __int16 v53 = 1024;
      int v54 = 645;
      __int16 v55 = 2112;
      int v56 = v16;
      _os_log_impl(&dword_249BFC000, v15, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Pre-kernel CiderObject encountered nil parameter in method %@", buf, 0x1Cu);
    }
    v17 = (void *)MEMORY[0x263F087E8];
    v18 = NSStringFromSelector(a2);
    uint64_t v19 = [v17 errorWithDomain:v18 code:1852797029 userInfo:0];
    (*((void (**)(util *, void *, void))v14 + 2))(v14, v19, 0);
  }
  int v20 = [v11 unsignedIntValue];
  if (v12 && (id v21 = v12, [v21 bytes]))
  {
    ptr = self->mKernelPtr.__ptr_;
    int v23 = [v21 length];
    v24 = (const void *)[v21 bytes];
    int v25 = ptr;
    int v26 = v20;
    int v27 = a4;
    int v28 = v23;
  }
  else
  {
    int v25 = self->mKernelPtr.__ptr_;
    int v26 = v20;
    int v27 = a4;
    int v28 = 0;
    v24 = 0;
  }
  unint64_t PropertyDataSize = ads::Kernel::getPropertyDataSize((ads::Kernel *)v25, v26, v27, v28, v24);
  util::server_log((util *)PropertyDataSize);
  BOOL v30 = (id) util::server_log(void)::sLogCat;
  BOOL v31 = os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT);
  if (PropertyDataSize)
  {
    if (v31)
    {
      int v32 = bswap32(PropertyDataSize);
      *(_DWORD *)&buf[1] = v32;
      if (((char)v32 - 32) > 0x5E
        || (((__int16)v32 >> 8) - 32) > 0x5E
        || ((v32 << 8 >> 24) - 32) > 0x5E
        || ((v32 >> 24) - 32) > 0x5E)
      {
        std::to_string(&v51, PropertyDataSize);
      }
      else
      {
        strcpy(&buf[5], "'");
        buf[0] = 39;
        std::string::basic_string[abi:ne180100]<0>(&v51, buf);
      }
      if ((v51.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        v35 = &v51;
      }
      else {
        v35 = (std::string *)v51.__r_.__value_.__r.__words[0];
      }
      AudioObjectPropertySelector mSelector = a4->mSelector;
      int v37 = bswap32(a4->mSelector);
      *(_DWORD *)&buf[1] = v37;
      if (((char)v37 - 32) > 0x5E
        || (((__int16)v37 >> 8) - 32) > 0x5E
        || ((v37 << 8 >> 24) - 32) > 0x5E
        || ((v37 >> 24) - 32) > 0x5E)
      {
        std::to_string(&v50, mSelector);
      }
      else
      {
        strcpy(&buf[5], "'");
        buf[0] = 39;
        std::string::basic_string[abi:ne180100]<0>(&v50, buf);
      }
      if ((v50.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        AudioObjectPropertySelector v38 = &v50;
      }
      else {
        AudioObjectPropertySelector v38 = (std::string *)v50.__r_.__value_.__r.__words[0];
      }
      AudioObjectPropertyScope mScope = a4->mScope;
      int v40 = bswap32(mScope);
      *(_DWORD *)&buf[1] = v40;
      if (((char)v40 - 32) > 0x5E
        || (((__int16)v40 >> 8) - 32) > 0x5E
        || ((v40 << 8 >> 24) - 32) > 0x5E
        || ((v40 >> 24) - 32) > 0x5E)
      {
        std::to_string(&v49, mScope);
      }
      else
      {
        strcpy(&buf[5], "'");
        buf[0] = 39;
        std::string::basic_string[abi:ne180100]<0>(&v49, buf);
      }
      AudioObjectPropertyScope v41 = &v49;
      if ((v49.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
        AudioObjectPropertyScope v41 = (std::string *)v49.__r_.__value_.__r.__words[0];
      }
      AudioObjectPropertyElement mElement = a4->mElement;
      *(_DWORD *)buf = 136316674;
      *(void *)&buf[4] = "InCider.mm";
      __int16 v53 = 1024;
      int v54 = 682;
      __int16 v55 = 2080;
      int v56 = v35;
      __int16 v57 = 2080;
      v58 = v38;
      __int16 v59 = 2080;
      *(void *)id v60 = v41;
      *(_WORD *)&v60[8] = 1024;
      AudioObjectPropertyElement v61 = mElement;
      __int16 v62 = 1024;
      int v63 = v20;
      _os_log_impl(&dword_249BFC000, v30, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Kernel encountered error %s getting property data size for [%s/%s/%u] on device with ID %u", buf, 0x3Cu);
      if (SHIBYTE(v49.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v49.__r_.__value_.__l.__data_);
      }
      if (SHIBYTE(v50.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v50.__r_.__value_.__l.__data_);
      }
      if (SHIBYTE(v51.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v51.__r_.__value_.__l.__data_);
      }
    }

    v43 = [MEMORY[0x263F087E8] errorWithDomain:@"ads::Kernel::getPropertyDataSize" code:(int)PropertyDataSize userInfo:0];
    (*((void (**)(util *, void *, void))v14 + 2))(v14, v43, 0);
  }
  else
  {
    if (v31)
    {
      AudioObjectPropertySelector v33 = a4->mSelector;
      int v34 = bswap32(a4->mSelector);
      *(_DWORD *)&buf[1] = v34;
      if (((char)v34 - 32) > 0x5E
        || (((__int16)v34 >> 8) - 32) > 0x5E
        || ((v34 << 8 >> 24) - 32) > 0x5E
        || ((v34 >> 24) - 32) > 0x5E)
      {
        std::to_string(&v51, v33);
      }
      else
      {
        strcpy(&buf[5], "'");
        buf[0] = 39;
        std::string::basic_string[abi:ne180100]<0>(&v51, buf);
      }
      if ((v51.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        AudioObjectPropertyElement v44 = &v51;
      }
      else {
        AudioObjectPropertyElement v44 = (std::string *)v51.__r_.__value_.__r.__words[0];
      }
      AudioObjectPropertyScope v45 = a4->mScope;
      int v46 = bswap32(v45);
      *(_DWORD *)&buf[1] = v46;
      if (((char)v46 - 32) > 0x5E
        || (((__int16)v46 >> 8) - 32) > 0x5E
        || ((v46 << 8 >> 24) - 32) > 0x5E
        || ((v46 >> 24) - 32) > 0x5E)
      {
        std::to_string(&v50, v45);
      }
      else
      {
        strcpy(&buf[5], "'");
        buf[0] = 39;
        std::string::basic_string[abi:ne180100]<0>(&v50, buf);
      }
      int v47 = &v50;
      if ((v50.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
        int v47 = (std::string *)v50.__r_.__value_.__r.__words[0];
      }
      AudioObjectPropertyElement v48 = a4->mElement;
      *(_DWORD *)buf = 136316418;
      *(void *)&buf[4] = "InCider.mm";
      __int16 v53 = 1024;
      int v54 = 671;
      __int16 v55 = 2080;
      int v56 = v44;
      __int16 v57 = 2080;
      v58 = v47;
      __int16 v59 = 1024;
      *(_DWORD *)id v60 = v48;
      *(_WORD *)&v60[4] = 1024;
      *(_DWORD *)&v60[6] = v20;
      _os_log_impl(&dword_249BFC000, v30, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Kernel successfully got property data size for [%s/%s/%u] on device with ID %u", buf, 0x32u);
      if (SHIBYTE(v50.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v50.__r_.__value_.__l.__data_);
      }
      if (SHIBYTE(v51.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v51.__r_.__value_.__l.__data_);
      }
    }

    (*((void (**)(util *, void, unint64_t))v14 + 2))(v14, 0, HIDWORD(PropertyDataSize));
  }
}

- (void)hasProperty:(id)a3 withInAddress:(AudioObjectPropertyAddress *)a4 withReply:(id)a5
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = (util *)a5;
  id v11 = v10;
  if (!v9)
  {
    util::server_log(v10);
    id v12 = (id) util::server_log(void)::sLogCat;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      id v13 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 136315650;
      *(void *)&buf[4] = "InCider.mm";
      *(_WORD *)&unsigned char buf[12] = 1024;
      *(_DWORD *)&buf[14] = 605;
      *(_WORD *)&unsigned char buf[18] = 2112;
      *(void *)&buf[20] = v13;
      _os_log_impl(&dword_249BFC000, v12, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Pre-kernel CiderObject encountered nil parameter in method %@", buf, 0x1Cu);
    }
    id v14 = (void *)MEMORY[0x263F087E8];
    v15 = NSStringFromSelector(a2);
    v16 = [v14 errorWithDomain:v15 code:1852797029 userInfo:0];
    (*((void (**)(util *, void *, void))v11 + 2))(v11, v16, 0);
  }
  int v17 = [v9 unsignedIntValue];
  ptr = self->mKernelPtr.__ptr_;
  int v46 = v17;
  __p.__r_.__value_.__r.__words[0] = (std::string::size_type)a4;
  v45.__r_.__value_.__r.__words[0] = (std::string::size_type)ptr;
  v45.__r_.__value_.__l.__size_ = (std::string::size_type)&v46;
  v45.__r_.__value_.__r.__words[2] = (std::string::size_type)&__p;
  uint64_t v19 = (void *)*((void *)ptr + 7);
  int v20 = applesauce::dispatch::v1::queue::operator*(v19);
  LODWORD(v44.__r_.__value_.__l.__data_) = 0;
  WORD2(v44.__r_.__value_.__r.__words[0]) = 0;
  *(void *)buf = MEMORY[0x263EF8330];
  *(void *)&buf[8] = 3221225472;
  *(void *)&buf[16] = ___ZN10applesauce8dispatch2v19sync_implIZN3ads6Kernel11hasPropertyEjPK26AudioObjectPropertyAddressE3__0EENSt3__15decayIDTclfp0_EEE4typeEPU28objcproto17OS_dispatch_queue8NSObjectOT_NS9_17integral_constantIbLb0EEE_block_invoke;
  *(void *)&buf[24] = &__block_descriptor_48_e5_v8__0l;
  *(void *)&buf[32] = &v44;
  *(void *)&buf[40] = &v45;
  dispatch_sync(v20, buf);
  std::string::size_type v21 = v44.__r_.__value_.__r.__words[0];

  util::server_log(v22);
  int v23 = (id) util::server_log(void)::sLogCat;
  BOOL v24 = os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT);
  if (v21)
  {
    if (v24)
    {
      int v25 = bswap32(v21);
      *(_DWORD *)&buf[1] = v25;
      if (((char)v25 - 32) > 0x5E
        || (((__int16)v25 >> 8) - 32) > 0x5E
        || ((v25 << 8 >> 24) - 32) > 0x5E
        || ((v25 >> 24) - 32) > 0x5E)
      {
        std::to_string(&v45, v21);
      }
      else
      {
        strcpy(&buf[5], "'");
        buf[0] = 39;
        std::string::basic_string[abi:ne180100]<0>(&v45, buf);
      }
      if ((v45.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        int v28 = &v45;
      }
      else {
        int v28 = (std::string *)v45.__r_.__value_.__r.__words[0];
      }
      AudioObjectPropertySelector mSelector = a4->mSelector;
      int v30 = bswap32(a4->mSelector);
      *(_DWORD *)&buf[1] = v30;
      if (((char)v30 - 32) > 0x5E
        || (((__int16)v30 >> 8) - 32) > 0x5E
        || ((v30 << 8 >> 24) - 32) > 0x5E
        || ((v30 >> 24) - 32) > 0x5E)
      {
        std::to_string(&v44, mSelector);
      }
      else
      {
        strcpy(&buf[5], "'");
        buf[0] = 39;
        std::string::basic_string[abi:ne180100]<0>(&v44, buf);
      }
      if ((v44.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        BOOL v31 = &v44;
      }
      else {
        BOOL v31 = (std::string *)v44.__r_.__value_.__r.__words[0];
      }
      AudioObjectPropertyScope mScope = a4->mScope;
      int v33 = bswap32(mScope);
      *(_DWORD *)&buf[1] = v33;
      if (((char)v33 - 32) > 0x5E
        || (((__int16)v33 >> 8) - 32) > 0x5E
        || ((v33 << 8 >> 24) - 32) > 0x5E
        || ((v33 >> 24) - 32) > 0x5E)
      {
        std::to_string(&__p, mScope);
      }
      else
      {
        strcpy(&buf[5], "'");
        buf[0] = 39;
        std::string::basic_string[abi:ne180100]<0>(&__p, buf);
      }
      p_p = &__p;
      if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
        p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
      }
      AudioObjectPropertyElement mElement = a4->mElement;
      *(_DWORD *)buf = 136316674;
      *(void *)&buf[4] = "InCider.mm";
      *(_WORD *)&unsigned char buf[12] = 1024;
      *(_DWORD *)&buf[14] = 633;
      *(_WORD *)&unsigned char buf[18] = 2080;
      *(void *)&buf[20] = v28;
      *(_WORD *)&buf[28] = 1024;
      *(_DWORD *)&buf[30] = v17;
      *(_WORD *)&buf[34] = 2080;
      *(void *)&buf[36] = v31;
      *(_WORD *)&buf[44] = 2080;
      *(void *)&buf[46] = p_p;
      *(_WORD *)&buf[54] = 1024;
      *(_DWORD *)&buf[56] = mElement;
      _os_log_impl(&dword_249BFC000, v23, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Kernel encountered error %s checking if device with ID %u has property [%s/%s/%u]", buf, 0x3Cu);
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(__p.__r_.__value_.__l.__data_);
      }
      if (SHIBYTE(v44.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v44.__r_.__value_.__l.__data_);
      }
      if (SHIBYTE(v45.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v45.__r_.__value_.__l.__data_);
      }
    }

    int v36 = [MEMORY[0x263F087E8] errorWithDomain:@"ads::Kernel::hasProperty" code:(int)v21 userInfo:0];
    (*((void (**)(util *, void *, void))v11 + 2))(v11, v36, 0);
  }
  else
  {
    if (v24)
    {
      AudioObjectPropertySelector v26 = a4->mSelector;
      int v27 = bswap32(a4->mSelector);
      *(_DWORD *)&buf[1] = v27;
      if (((char)v27 - 32) > 0x5E
        || (((__int16)v27 >> 8) - 32) > 0x5E
        || ((v27 << 8 >> 24) - 32) > 0x5E
        || ((v27 >> 24) - 32) > 0x5E)
      {
        std::to_string(&v45, v26);
      }
      else
      {
        strcpy(&buf[5], "'");
        buf[0] = 39;
        std::string::basic_string[abi:ne180100]<0>(&v45, buf);
      }
      if ((v45.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        int v37 = &v45;
      }
      else {
        int v37 = (std::string *)v45.__r_.__value_.__r.__words[0];
      }
      AudioObjectPropertyScope v38 = a4->mScope;
      int v39 = bswap32(v38);
      *(_DWORD *)&buf[1] = v39;
      if (((char)v39 - 32) > 0x5E
        || (((__int16)v39 >> 8) - 32) > 0x5E
        || ((v39 << 8 >> 24) - 32) > 0x5E
        || ((v39 >> 24) - 32) > 0x5E)
      {
        std::to_string(&v44, v38);
      }
      else
      {
        strcpy(&buf[5], "'");
        buf[0] = 39;
        std::string::basic_string[abi:ne180100]<0>(&v44, buf);
      }
      int v40 = &v44;
      if ((v44.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
        int v40 = (std::string *)v44.__r_.__value_.__r.__words[0];
      }
      AudioObjectPropertyElement v41 = a4->mElement;
      int v42 = "it does";
      *(_DWORD *)buf = 136316674;
      *(void *)&buf[4] = "InCider.mm";
      if (!BYTE4(v21)) {
        int v42 = "'it doesn't";
      }
      *(_WORD *)&unsigned char buf[12] = 1024;
      *(_DWORD *)&buf[14] = 622;
      *(_WORD *)&unsigned char buf[18] = 1024;
      *(_DWORD *)&buf[20] = v17;
      *(_WORD *)&buf[24] = 2080;
      *(void *)&buf[26] = v37;
      *(_WORD *)&buf[34] = 2080;
      *(void *)&buf[36] = v40;
      *(_WORD *)&buf[44] = 1024;
      *(_DWORD *)&buf[46] = v41;
      *(_WORD *)&buf[50] = 2080;
      *(void *)&buf[52] = v42;
      _os_log_impl(&dword_249BFC000, v23, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Kernel successfully checked if device with ID %u has property [%s/%s/%u] (%s)", buf, 0x3Cu);
      if (SHIBYTE(v44.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v44.__r_.__value_.__l.__data_);
      }
      if (SHIBYTE(v45.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v45.__r_.__value_.__l.__data_);
      }
    }

    (*((void (**)(util *, void, BOOL))v11 + 2))(v11, 0, BYTE4(v21) != 0);
  }
}

- (void)serializeNonADSDevices:(id)a3
{
  v3 = (void (**)(id, void *, void))a3;
  util::WriteDevicesExceptionSafe((util *)&v6);
  if (v6)
  {
    v4 = objc_msgSend(MEMORY[0x263F087E8], "errorWithDomain:code:userInfo:", @"ads::Kernel::serializeNonADSDevices");
    v3[2](v3, v4, 0);
  }
  else
  {
    v5 = (void **)applesauce::CF::details::make_CFArrayRef<std::string>(v7);
    id v8 = (long long **)v5;
    ((void (**)(id, void *, void **))v3)[2](v3, 0, v5);
    CFRelease(v5);
  }
  id v8 = v7;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v8);
}

- (void)isDeviceWithUUIDConnected:(id)a3 withReply:(id)a4
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = (util *)a4;
  id v9 = v8;
  if (!v7)
  {
    util::server_log(v8);
    id v10 = (id) util::server_log(void)::sLogCat;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 136315650;
      *(void *)&buf[4] = "InCider.mm";
      *(_WORD *)&unsigned char buf[12] = 1024;
      *(_DWORD *)&buf[14] = 576;
      *(_WORD *)&unsigned char buf[18] = 2112;
      *(void *)&buf[20] = v11;
      _os_log_impl(&dword_249BFC000, v10, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Pre-kernel CiderObject encountered nil parameter in method %@", buf, 0x1Cu);
    }
    id v12 = (void *)MEMORY[0x263F087E8];
    id v13 = NSStringFromSelector(a2);
    id v14 = [v12 errorWithDomain:v13 code:1852797029 userInfo:0];
    (*((void (**)(util *, void *, void))v9 + 2))(v9, v14, 0);
  }
  id v15 = v7;
  std::string::basic_string[abi:ne180100]<0>(&v25, (char *)[v15 UTF8String]);
  ptr = self->mKernelPtr.__ptr_;
  if (SHIBYTE(v25.__r_.__value_.__r.__words[2]) < 0) {
    std::string::__init_copy_ctor_external(&__p, v25.__r_.__value_.__l.__data_, v25.__r_.__value_.__l.__size_);
  }
  else {
    std::string __p = v25;
  }
  v26[0] = ptr;
  v26[1] = &__p;
  int v17 = (void *)*((void *)ptr + 7);
  v18 = applesauce::dispatch::v1::queue::operator*(v17);
  unsigned __int8 v27 = 0;
  *(void *)buf = MEMORY[0x263EF8330];
  *(void *)&buf[8] = 3221225472;
  *(void *)&buf[16] = ___ZN10applesauce8dispatch2v19sync_implIZN3ads6Kernel25isDeviceWithUUIDConnectedENSt3__112basic_stringIcNS5_11char_traitsIcEENS5_9allocatorIcEEEEE3__0EENS5_5decayIDTclfp0_EEE4typeEPU28objcproto17OS_dispatch_queue8NSObjectOT_NS5_17integral_constantIbLb0EEE_block_invoke;
  *(void *)&buf[24] = &__block_descriptor_48_e5_v8__0l;
  *(void *)&buf[32] = &v27;
  v29 = v26;
  dispatch_sync(v18, buf);
  int v19 = v27;

  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  util::server_log(v20);
  std::string::size_type v21 = (id) util::server_log(void)::sLogCat;
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v22 = &v25;
    if ((v25.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
      uint64_t v22 = (std::string *)v25.__r_.__value_.__r.__words[0];
    }
    *(void *)&buf[4] = "InCider.mm";
    *(_WORD *)&unsigned char buf[12] = 1024;
    *(_DWORD *)&buf[14] = 583;
    int v23 = "it is";
    *(_DWORD *)buf = 136315906;
    if (!v19) {
      int v23 = "it isn't";
    }
    *(_WORD *)&unsigned char buf[18] = 2080;
    *(void *)&buf[20] = v22;
    *(_WORD *)&buf[28] = 2080;
    *(void *)&buf[30] = v23;
    _os_log_impl(&dword_249BFC000, v21, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Kernel checked if device with UUID %s is connected (%s)", buf, 0x26u);
  }
  (*((void (**)(util *, void, BOOL))v9 + 2))(v9, 0, v19 != 0);
  if (SHIBYTE(v25.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v25.__r_.__value_.__l.__data_);
  }
}

- (void)isDeviceWithAOIDConnected:(id)a3 withReply:(id)a4
{
  *(void *)&v24[5] = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = (util *)a4;
  id v9 = v8;
  if (!v7)
  {
    util::server_log(v8);
    id v10 = (id) util::server_log(void)::sLogCat;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = NSStringFromSelector(a2);
      int v19 = 136315650;
      int v20 = "InCider.mm";
      __int16 v21 = 1024;
      int v22 = 560;
      __int16 v23 = 2112;
      *(void *)BOOL v24 = v11;
      _os_log_impl(&dword_249BFC000, v10, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Pre-kernel CiderObject encountered nil parameter in method %@", (uint8_t *)&v19, 0x1Cu);
    }
    id v12 = (void *)MEMORY[0x263F087E8];
    id v13 = NSStringFromSelector(a2);
    id v14 = [v12 errorWithDomain:v13 code:1852797029 userInfo:0];
    (*((void (**)(util *, void *, void))v9 + 2))(v9, v14, 0);
  }
  int v15 = [v7 unsignedIntValue];
  isDeviceWithAOIDConnected = (util *)ads::Kernel::isDeviceWithAOIDConnected((ads::Kernel *)self->mKernelPtr.__ptr_, v15);
  util::server_log(isDeviceWithAOIDConnected);
  int v17 = (id) util::server_log(void)::sLogCat;
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v18 = "it isn't";
    int v19 = 136315906;
    int v20 = "InCider.mm";
    int v22 = 567;
    __int16 v21 = 1024;
    if (isDeviceWithAOIDConnected) {
      v18 = "it is";
    }
    __int16 v23 = 1024;
    v24[0] = v15;
    LOWORD(v24[1]) = 2080;
    *(void *)((char *)&v24[1] + 2) = v18;
    _os_log_impl(&dword_249BFC000, v17, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Kernel checked if device with AOID %u is connected (%s)", (uint8_t *)&v19, 0x22u);
  }
  (*((void (**)(util *, void, util *))v9 + 2))(v9, 0, isDeviceWithAOIDConnected);
}

- (void)disconnectAllADSDevices:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v4 = (void (**)(id, void *))a3;
  v5 = (util *)ads::Kernel::disconnectAllADSDevices((ads::Kernel *)self->mKernelPtr.__ptr_);
  signed int v6 = (int)v5;
  util::server_log(v5);
  id v7 = (id) util::server_log(void)::sLogCat;
  id v8 = v7;
  if (v6)
  {
    id v9 = v7;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = bswap32(v6);
      *(_DWORD *)&buf[1] = v10;
      if (((char)v10 - 32) > 0x5E
        || (((__int16)v10 >> 8) - 32) > 0x5E
        || ((v10 << 8 >> 24) - 32) > 0x5E
        || ((v10 >> 24) - 32) > 0x5E)
      {
        std::to_string(&v13, v6);
      }
      else
      {
        strcpy(&buf[5], "'");
        buf[0] = 39;
        std::string::basic_string[abi:ne180100]<0>(&v13, buf);
      }
      id v11 = &v13;
      if ((v13.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
        id v11 = (std::string *)v13.__r_.__value_.__r.__words[0];
      }
      *(_DWORD *)buf = 136315650;
      *(void *)&buf[4] = "InCider.mm";
      __int16 v15 = 1024;
      int v16 = 549;
      __int16 v17 = 2080;
      v18 = v11;
      _os_log_impl(&dword_249BFC000, v9, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Kernel encountered error %s disconnecting all ADS devices", buf, 0x1Cu);
      if (SHIBYTE(v13.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v13.__r_.__value_.__l.__data_);
      }
    }

    id v12 = [MEMORY[0x263F087E8] errorWithDomain:@"ads::Kernel::disconnectAllADSDevices" code:v6 userInfo:0];
    v4[2](v4, v12);
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&buf[4] = "InCider.mm";
      __int16 v15 = 1024;
      int v16 = 544;
      _os_log_impl(&dword_249BFC000, v8, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Kernel disconnected all ADS devices without error", buf, 0x12u);
    }
    v4[2](v4, 0);
  }
}

- (void)disconnectADSDevicesByUUIDs:(id)a3 withReply:(id)a4
{
  uint64_t v61 = *MEMORY[0x263EF8340];
  id v5 = a3;
  signed int v6 = (util *)a4;
  std::string v50 = v5;
  std::string v51 = v6;
  if (v5)
  {
    CFRetain(v5);
  }
  else
  {
    util::server_log(v6);
    id v7 = (id) util::server_log(void)::sLogCat;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      id v8 = (std::string *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf.__first_) = 136315650;
      *(std::__split_buffer<std::string>::pointer *)((char *)&buf.__first_ + 4) = (std::__split_buffer<std::string>::pointer)"InCider.mm";
      WORD2(buf.__begin_) = 1024;
      *(_DWORD *)((char *)&buf.__begin_ + 6) = 512;
      WORD1(buf.__end_) = 2112;
      *(std::__split_buffer<std::string>::pointer *)((char *)&buf.__end_ + 4) = v8;
      _os_log_impl(&dword_249BFC000, v7, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Pre-kernel CiderObject encountered nil parameter in method %@", (uint8_t *)&buf, 0x1Cu);
    }
    id v9 = (void *)MEMORY[0x263F087E8];
    int v10 = NSStringFromSelector(a2);
    id v11 = [v9 errorWithDomain:v10 code:1852797029 userInfo:0];
    (*((void (**)(util *, void *))v51 + 2))(v51, v11);

    id v5 = 0;
  }
  applesauce::CF::ArrayRef::ArrayRef((applesauce::CF::ArrayRef *)&cf, v5);

  CFTypeRef v12 = cf;
  if (!cf)
  {
    exception = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x24C5B19C0](exception, "Could not construct");
    __cxa_throw(exception, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }
  CFTypeID TypeID = CFArrayGetTypeID();
  id v14 = (util *)CFGetTypeID(v12);
  if ((util *)TypeID != v14)
  {
    LOBYTE(v53.__begin_) = 0;
    char v54 = 0;
LABEL_38:
    util::server_log(v14);
    int v36 = (id) util::server_log(void)::sLogCat;
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf.__first_) = 136315394;
      *(std::__split_buffer<std::string>::pointer *)((char *)&buf.__first_ + 4) = (std::__split_buffer<std::string>::pointer)"InCider.mm";
      WORD2(buf.__begin_) = 1024;
      *(_DWORD *)((char *)&buf.__begin_ + 6) = 535;
      _os_log_impl(&dword_249BFC000, v36, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Pre-kernel CiderObject was unable to parse NSArray input as std::vector<std::string>", (uint8_t *)&buf, 0x12u);
    }
    int v37 = (void *)MEMORY[0x263F087E8];
    AudioObjectPropertyScope v38 = NSStringFromSelector(a2);
    int v39 = [v37 errorWithDomain:v38 code:1852797029 userInfo:0];
    (*((void (**)(util *, void *))v51 + 2))(v51, v39);

    goto LABEL_64;
  }
  CFIndex Count = CFArrayGetCount((CFArrayRef)v12);
  int v16 = Count;
  memset(&v58, 0, sizeof(v58));
  if (Count << 32)
  {
    if (Count << 32 < 0) {
LABEL_70:
    }
      std::vector<applesauce::CF::StringRef>::__throw_length_error[abi:ne180100]();
    buf.__end_cap_.__value_ = (std::allocator<std::string> *)&v58.__end_cap_;
    buf.__first_ = (std::__split_buffer<std::string>::pointer)std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>((int)Count);
    buf.__begin_ = buf.__first_;
    buf.__end_ = buf.__first_;
    buf.__end_cap_.__value_ = &buf.__first_[v17];
    std::vector<std::string>::__swap_out_circular_buffer(&v58, &buf);
    std::__split_buffer<std::string>::~__split_buffer(&buf);
  }
  if (v16 < 1)
  {
LABEL_27:
    std::vector<std::string> v53 = v58;
    memset(&v58, 0, sizeof(v58));
    char v54 = 1;
  }
  else
  {
    CFIndex v18 = 0;
    while (1)
    {
      CFStringRef ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex((CFArrayRef)v12, v18);
      applesauce::CF::convert_as<std::string,0>((uint64_t)&__p, ValueAtIndex);
      if (!v57) {
        break;
      }
      std::vector<std::string>::pointer end = v58.__end_;
      if (v58.__end_ >= v58.__end_cap_.__value_)
      {
        unint64_t v22 = 0xAAAAAAAAAAAAAAABLL * (((char *)v58.__end_ - (char *)v58.__begin_) >> 3);
        unint64_t v23 = v22 + 1;
        if (v22 + 1 > 0xAAAAAAAAAAAAAAALL) {
          goto LABEL_70;
        }
        if (0x5555555555555556 * (((char *)v58.__end_cap_.__value_ - (char *)v58.__begin_) >> 3) > v23) {
          unint64_t v23 = 0x5555555555555556 * (((char *)v58.__end_cap_.__value_ - (char *)v58.__begin_) >> 3);
        }
        if (0xAAAAAAAAAAAAAAABLL * (((char *)v58.__end_cap_.__value_ - (char *)v58.__begin_) >> 3) >= 0x555555555555555) {
          unint64_t v24 = 0xAAAAAAAAAAAAAAALL;
        }
        else {
          unint64_t v24 = v23;
        }
        buf.__end_cap_.__value_ = (std::allocator<std::string> *)&v58.__end_cap_;
        if (v24) {
          unint64_t v24 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>(v24);
        }
        else {
          uint64_t v25 = 0;
        }
        AudioObjectPropertySelector v26 = (std::string *)(v24 + 24 * v22);
        buf.__first_ = (std::__split_buffer<std::string>::pointer)v24;
        buf.__begin_ = v26;
        buf.__end_cap_.__value_ = (std::string *)(v24 + 24 * v25);
        *AudioObjectPropertySelector v26 = __p;
        memset(&__p, 0, sizeof(__p));
        buf.__end_ = v26 + 1;
        std::vector<std::string>::__swap_out_circular_buffer(&v58, &buf);
        __int16 v21 = v58.__end_;
        std::__split_buffer<std::string>::~__split_buffer(&buf);
      }
      else
      {
        *(_OWORD *)v58.__end_ = *(_OWORD *)&__p.__r_.__value_.__l.__data_;
        end->__r_.__value_.__r.__words[2] = __p.__r_.__value_.__r.__words[2];
        memset(&__p, 0, sizeof(__p));
        __int16 v21 = end + 1;
      }
      v58.__end_ = v21;
      if (v16 == ++v18) {
        goto LABEL_27;
      }
    }
    LOBYTE(v53.__begin_) = 0;
    char v54 = 0;
  }
  buf.__first_ = (std::__split_buffer<std::string>::pointer)&v58;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&buf);
  if (!v54) {
    goto LABEL_38;
  }
  ptr = self->mKernelPtr.__ptr_;
  memset(v52, 0, sizeof(v52));
  std::vector<std::string>::__init_with_size[abi:ne180100]<std::string*,std::string*>((uint64_t)v52, (long long *)v53.__begin_, (long long *)v53.__end_, 0xAAAAAAAAAAAAAAABLL * (((char *)v53.__end_ - (char *)v53.__begin_) >> 3));
  __p.__r_.__value_.__r.__words[0] = (std::string::size_type)v52;
  __p.__r_.__value_.__l.__size_ = (std::string::size_type)ptr;
  int v28 = (void *)*((void *)ptr + 7);
  v29 = applesauce::dispatch::v1::queue::operator*(v28);
  LODWORD(v58.__begin_) = 0;
  buf.__first_ = (std::__split_buffer<std::string>::pointer)MEMORY[0x263EF8330];
  buf.__begin_ = (std::__split_buffer<std::string>::pointer)3221225472;
  buf.__end_ = (std::__split_buffer<std::string>::pointer)___ZN10applesauce8dispatch2v19sync_implIZN3ads6Kernel27disconnectADSDevicesByUUIDsENSt3__16vectorINS5_12basic_stringIcNS5_11char_traitsIcEENS5_9allocatorIcEEEENSA_ISC_EEEEE3__0EENS5_5decayIDTclfp0_EEE4typeEPU28objcproto17OS_dispatch_queue8NSObjectOT_NS5_17integral_constantIbLb0EEE_block_invoke;
  buf.__end_cap_.__value_ = (std::string *)&__block_descriptor_48_e5_v8__0l;
  buf.__end_cap_.__value_ = (std::allocator<std::string> *)&v58;
  p_p = &__p;
  dispatch_sync(v29, &buf);
  signed int begin = (signed int)v58.__begin_;

  buf.__first_ = (std::__split_buffer<std::string>::pointer)v52;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&buf);
  util::server_log(v31);
  int v32 = (id) util::server_log(void)::sLogCat;
  BOOL v33 = os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT);
  if (begin)
  {
    uint64_t v34 = begin;
    if (v33)
    {
      int v35 = bswap32(begin);
      *(_DWORD *)((char *)&v58.__begin_ + 1) = v35;
      if (((char)v35 - 32) > 0x5E
        || (((__int16)v35 >> 8) - 32) > 0x5E
        || ((v35 << 8 >> 24) - 32) > 0x5E
        || ((v35 >> 24) - 32) > 0x5E)
      {
        std::to_string(&__p, begin);
      }
      else
      {
        *(_WORD *)((char *)&v58.__begin_ + 5) = 39;
        LOBYTE(v58.__begin_) = 39;
        std::string::basic_string[abi:ne180100]<0>(&__p, (char *)&v58);
      }
      if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        int v42 = &__p;
      }
      else {
        int v42 = (std::string *)__p.__r_.__value_.__r.__words[0];
      }
      if (!cf)
      {
        int v46 = __cxa_allocate_exception(0x10uLL);
        MEMORY[0x24C5B19C0](v46, "Could not construct");
        __cxa_throw(v46, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
      }
      CFStringRef v43 = CFCopyDescription(cf);
      applesauce::CF::details::CFString_get_value<true>((uint64_t)&v58, v43);
      if (v43) {
        CFRelease(v43);
      }
      std::string v44 = (std::string *)&v58;
      if (SHIBYTE(v58.__end_cap_.__value_) < 0) {
        std::string v44 = v58.__begin_;
      }
      LODWORD(buf.__first_) = 136315906;
      *(std::__split_buffer<std::string>::pointer *)((char *)&buf.__first_ + 4) = (std::__split_buffer<std::string>::pointer)"InCider.mm";
      WORD2(buf.__begin_) = 1024;
      *(_DWORD *)((char *)&buf.__begin_ + 6) = 529;
      WORD1(buf.__end_) = 2080;
      *(std::__split_buffer<std::string>::pointer *)((char *)&buf.__end_ + 4) = v42;
      WORD2(buf.__end_cap_.__value_) = 2080;
      *(std::string **)((char *)&buf.__end_cap_.__value_ + 6) = v44;
      _os_log_impl(&dword_249BFC000, v32, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Kernel encountered error %s disconnecting ADS devices with UUIDs %s", (uint8_t *)&buf, 0x26u);
      if (SHIBYTE(v58.__end_cap_.__value_) < 0) {
        operator delete(v58.__begin_);
      }
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(__p.__r_.__value_.__l.__data_);
      }
    }

    AudioObjectPropertyScope v38 = [MEMORY[0x263F087E8] errorWithDomain:@"ads::Kernel::disconnectADSDeviceByUUIDs" code:v34 userInfo:0];
    (*((void (**)(util *, void *))v51 + 2))(v51, v38);
LABEL_64:

    goto LABEL_65;
  }
  if (v33)
  {
    if (!cf)
    {
      int v47 = __cxa_allocate_exception(0x10uLL);
      MEMORY[0x24C5B19C0](v47, "Could not construct");
      __cxa_throw(v47, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
    }
    CFStringRef v40 = CFCopyDescription(cf);
    applesauce::CF::details::CFString_get_value<true>((uint64_t)&__p, v40);
    if (v40) {
      CFRelease(v40);
    }
    AudioObjectPropertyElement v41 = &__p;
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
      AudioObjectPropertyElement v41 = (std::string *)__p.__r_.__value_.__r.__words[0];
    }
    LODWORD(buf.__first_) = 136315650;
    *(std::__split_buffer<std::string>::pointer *)((char *)&buf.__first_ + 4) = (std::__split_buffer<std::string>::pointer)"InCider.mm";
    WORD2(buf.__begin_) = 1024;
    *(_DWORD *)((char *)&buf.__begin_ + 6) = 524;
    WORD1(buf.__end_) = 2080;
    *(std::__split_buffer<std::string>::pointer *)((char *)&buf.__end_ + 4) = v41;
    _os_log_impl(&dword_249BFC000, v32, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Kernel disconnected ADS devices with UUIDs %s without error", (uint8_t *)&buf, 0x1Cu);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p.__r_.__value_.__l.__data_);
    }
  }

  (*((void (**)(util *, void))v51 + 2))(v51, 0);
LABEL_65:
  if (v54)
  {
    buf.__first_ = (std::__split_buffer<std::string>::pointer)&v53;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&buf);
  }
  if (cf) {
    CFRelease(cf);
  }
}

- (void)disconnectADSDeviceByUUID:(id)a3 withReply:(id)a4
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = (util *)a4;
  id v9 = v8;
  if (!v7)
  {
    util::server_log(v8);
    int v10 = (id) util::server_log(void)::sLogCat;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      id v11 = (std::string *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)std::__split_buffer<std::string> buf = 136315650;
      *(void *)&buf[4] = "InCider.mm";
      __int16 v31 = 1024;
      int v32 = 489;
      __int16 v33 = 2112;
      uint64_t v34 = v11;
      _os_log_impl(&dword_249BFC000, v10, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Pre-kernel CiderObject encountered nil parameter in method %@", buf, 0x1Cu);
    }
    CFTypeRef v12 = (void *)MEMORY[0x263F087E8];
    std::string v13 = NSStringFromSelector(a2);
    id v14 = [v12 errorWithDomain:v13 code:1852797029 userInfo:0];
    (*((void (**)(util *, void *))v9 + 2))(v9, v14);
  }
  id v15 = v7;
  std::string::basic_string[abi:ne180100]<0>(&__p, (char *)[v15 UTF8String]);
  ptr = self->mKernelPtr.__ptr_;
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    std::string::__init_copy_ctor_external(&v28, __p.__r_.__value_.__l.__data_, __p.__r_.__value_.__l.__size_);
  }
  else {
    std::string v28 = __p;
  }
  uint64_t v17 = (util *)ads::Kernel::disconnectADSDeviceByUUID((uint64_t)ptr, (uint64_t)&v28);
  signed int v18 = (int)v17;
  if (SHIBYTE(v28.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v28.__r_.__value_.__l.__data_);
  }
  util::server_log(v17);
  uint64_t v19 = (id) util::server_log(void)::sLogCat;
  int v20 = v19;
  if (v18)
  {
    __int16 v21 = v19;
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      int v22 = bswap32(v18);
      *(_DWORD *)&buf[1] = v22;
      if (((char)v22 - 32) > 0x5E
        || (((__int16)v22 >> 8) - 32) > 0x5E
        || ((v22 << 8 >> 24) - 32) > 0x5E
        || ((v22 >> 24) - 32) > 0x5E)
      {
        std::to_string(&v27, v18);
      }
      else
      {
        strcpy(&buf[5], "'");
        buf[0] = 39;
        std::string::basic_string[abi:ne180100]<0>(&v27, buf);
      }
      unint64_t v24 = &v27;
      if ((v27.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
        unint64_t v24 = (std::string *)v27.__r_.__value_.__r.__words[0];
      }
      p_p = &__p;
      if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
        p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
      }
      *(_DWORD *)std::__split_buffer<std::string> buf = 136315906;
      *(void *)&buf[4] = "InCider.mm";
      __int16 v31 = 1024;
      int v32 = 502;
      __int16 v33 = 2080;
      uint64_t v34 = v24;
      __int16 v35 = 2080;
      int v36 = p_p;
      _os_log_impl(&dword_249BFC000, v21, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Kernel encountered error %s disconnecting ADS device with UUID %s", buf, 0x26u);
      if (SHIBYTE(v27.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v27.__r_.__value_.__l.__data_);
      }
    }

    AudioObjectPropertySelector v26 = [MEMORY[0x263F087E8] errorWithDomain:@"ads::Kernel::disconnectADSDeviceByUUID" code:v18 userInfo:0];
    (*((void (**)(util *, void *))v9 + 2))(v9, v26);
  }
  else
  {
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v23 = &__p;
      if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
        unint64_t v23 = (std::string *)__p.__r_.__value_.__r.__words[0];
      }
      *(_DWORD *)std::__split_buffer<std::string> buf = 136315650;
      *(void *)&buf[4] = "InCider.mm";
      __int16 v31 = 1024;
      int v32 = 497;
      __int16 v33 = 2080;
      uint64_t v34 = v23;
      _os_log_impl(&dword_249BFC000, v20, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Kernel disconnected ADS device with UUID %s without error", buf, 0x1Cu);
    }
    (*((void (**)(util *, void))v9 + 2))(v9, 0);
  }
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
}

- (void)disconnectADSDevicesByAOIDs:(id)a3 withReply:(id)a4
{
  uint64_t v67 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = (util *)a4;
  int v56 = v6;
  char v57 = v7;
  if (v6)
  {
    CFRetain(v6);
  }
  else
  {
    util::server_log(v7);
    id v8 = (id) util::server_log(void)::sLogCat;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = NSStringFromSelector(a2);
      *(_DWORD *)std::__split_buffer<std::string> buf = 136315650;
      *(void *)&buf[4] = "InCider.mm";
      *(_WORD *)&unsigned char buf[12] = 1024;
      *(_DWORD *)&buf[14] = 456;
      *(_WORD *)&unsigned char buf[18] = 2112;
      *(void *)&buf[20] = v9;
      _os_log_impl(&dword_249BFC000, v8, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Pre-kernel CiderObject encountered nil parameter in method %@", buf, 0x1Cu);
    }
    int v10 = (void *)MEMORY[0x263F087E8];
    id v11 = NSStringFromSelector(a2);
    CFTypeRef v12 = [v10 errorWithDomain:v11 code:1852797029 userInfo:0];
    (*((void (**)(util *, void *))v57 + 2))(v57, v12);

    id v6 = 0;
  }
  applesauce::CF::ArrayRef::ArrayRef((applesauce::CF::ArrayRef *)&cf, v6);

  CFTypeRef v13 = cf;
  if (!cf)
  {
    exception = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x24C5B19C0](exception, "Could not construct");
    __cxa_throw(exception, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }
  CFTypeID TypeID = CFArrayGetTypeID();
  CFTypeID v15 = CFGetTypeID(v13);
  if (TypeID != v15)
  {
LABEL_46:
    util::server_log((util *)v15);
    AudioObjectPropertyElement v41 = (id) util::server_log(void)::sLogCat;
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)std::__split_buffer<std::string> buf = 136315394;
      *(void *)&buf[4] = "InCider.mm";
      *(_WORD *)&unsigned char buf[12] = 1024;
      *(_DWORD *)&buf[14] = 479;
      _os_log_impl(&dword_249BFC000, v41, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Pre-kernel CiderObject was unable to parse NSArray input as std::vector<AudioObjectID>", buf, 0x12u);
    }
    int v42 = (void *)MEMORY[0x263F087E8];
    CFStringRef v43 = NSStringFromSelector(a2);
    std::string v44 = [v42 errorWithDomain:v43 code:1852797029 userInfo:0];
    (*((void (**)(util *, void *))v57 + 2))(v57, v44);

    unint64_t v23 = 0;
    char v45 = 1;
    goto LABEL_72;
  }
  char v54 = a2;
  CFIndex Count = CFArrayGetCount((CFArrayRef)v13);
  int v17 = Count;
  if (Count << 32)
  {
    if (Count << 32 < 0) {
LABEL_79:
    }
      std::vector<applesauce::CF::StringRef>::__throw_length_error[abi:ne180100]();
    signed int v18 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned int>>((int)Count);
    int v20 = &v18[4 * v19];
  }
  else
  {
    int v20 = 0;
    signed int v18 = 0;
  }
  if (v17 >= 1)
  {
    CFIndex v21 = 0;
    uint64_t v22 = v17;
    unint64_t v23 = v18;
    while (1)
    {
      CFNumberRef ValueAtIndex = (const __CFNumber *)CFArrayGetValueAtIndex((CFArrayRef)v13, v21);
      CFTypeID v15 = (CFTypeID)applesauce::CF::convert_as<unsigned int,0>(ValueAtIndex);
      if (!HIDWORD(v15)) {
        break;
      }
      int v25 = v15;
      if (v18 >= v20)
      {
        uint64_t v27 = (v18 - v23) >> 2;
        unint64_t v28 = v27 + 1;
        if ((unint64_t)(v27 + 1) >> 62) {
          goto LABEL_79;
        }
        if ((v20 - v23) >> 1 > v28) {
          unint64_t v28 = (v20 - v23) >> 1;
        }
        if ((unint64_t)(v20 - v23) >= 0x7FFFFFFFFFFFFFFCLL) {
          unint64_t v29 = 0x3FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v29 = v28;
        }
        if (v29) {
          unint64_t v29 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned int>>(v29);
        }
        else {
          uint64_t v30 = 0;
        }
        __int16 v31 = (char *)(v29 + 4 * v27);
        *(_DWORD *)__int16 v31 = v25;
        uint64_t v26 = (uint64_t)(v31 + 4);
        while (v18 != v23)
        {
          int v32 = *((_DWORD *)v18 - 1);
          v18 -= 4;
          *((_DWORD *)v31 - 1) = v32;
          v31 -= 4;
        }
        int v20 = (char *)(v29 + 4 * v30);
        if (v23) {
          operator delete(v23);
        }
        unint64_t v23 = v31;
      }
      else
      {
        *(_DWORD *)signed int v18 = v15;
        uint64_t v26 = (uint64_t)(v18 + 4);
      }
      ++v21;
      signed int v18 = (char *)v26;
      if (v21 == v22) {
        goto LABEL_35;
      }
    }
    a2 = v54;
    if (v23) {
      operator delete(v23);
    }
    goto LABEL_46;
  }
  uint64_t v26 = (uint64_t)v18;
  unint64_t v23 = v18;
LABEL_35:
  ptr = self->mKernelPtr.__ptr_;
  id v60 = 0;
  uint64_t v61 = 0;
  std::string __p = 0;
  std::vector<unsigned int>::__init_with_size[abi:ne180100]<unsigned int *,unsigned int *>(&__p, v23, v26, (v26 - (uint64_t)v23) >> 2);
  v58.__r_.__value_.__r.__words[0] = (std::string::size_type)&__p;
  v58.__r_.__value_.__l.__size_ = (std::string::size_type)ptr;
  uint64_t v34 = (void *)*((void *)ptr + 7);
  __int16 v35 = applesauce::dispatch::v1::queue::operator*(v34);
  LODWORD(v63[0]) = 0;
  *(void *)std::__split_buffer<std::string> buf = MEMORY[0x263EF8330];
  *(void *)&buf[8] = 3221225472;
  *(void *)&buf[16] = ___ZN10applesauce8dispatch2v19sync_implIZN3ads6Kernel27disconnectADSDevicesByAOIDsENSt3__16vectorIjNS5_9allocatorIjEEEEE3__0EENS5_5decayIDTclfp0_EEE4typeEPU28objcproto17OS_dispatch_queue8NSObjectOT_NS5_17integral_constantIbLb0EEE_block_invoke;
  *(void *)&buf[24] = &__block_descriptor_48_e5_v8__0l;
  *(void *)&buf[32] = v63;
  __int16 v66 = &v58;
  dispatch_sync(v35, buf);
  uint64_t v36 = SLODWORD(v63[0]);

  uint64_t v37 = (util *)__p;
  if (__p)
  {
    id v60 = __p;
    operator delete(__p);
  }
  util::server_log(v37);
  AudioObjectPropertyScope v38 = (id) util::server_log(void)::sLogCat;
  BOOL v39 = os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT);
  if (v36)
  {
    if (v39)
    {
      int v40 = bswap32(v36);
      *(_DWORD *)((char *)v63 + 1) = v40;
      if (((char)v40 - 32) > 0x5E
        || (((__int16)v40 >> 8) - 32) > 0x5E
        || ((v40 << 8 >> 24) - 32) > 0x5E
        || ((v40 >> 24) - 32) > 0x5E)
      {
        std::to_string(&v58, v36);
      }
      else
      {
        *(_WORD *)((char *)v63 + 5) = 39;
        LOBYTE(v63[0]) = 39;
        std::string::basic_string[abi:ne180100]<0>(&v58, (char *)v63);
      }
      if ((v58.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        uint64_t v48 = &v58;
      }
      else {
        uint64_t v48 = (std::string *)v58.__r_.__value_.__r.__words[0];
      }
      if (!cf)
      {
        id v52 = __cxa_allocate_exception(0x10uLL);
        MEMORY[0x24C5B19C0](v52, "Could not construct");
        __cxa_throw(v52, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
      }
      CFStringRef v49 = CFCopyDescription(cf);
      applesauce::CF::details::CFString_get_value<true>((uint64_t)v63, v49);
      if (v49) {
        CFRelease(v49);
      }
      std::string v50 = v63;
      if (v64 < 0) {
        std::string v50 = (void **)v63[0];
      }
      *(_DWORD *)std::__split_buffer<std::string> buf = 136315906;
      *(void *)&buf[4] = "InCider.mm";
      *(_WORD *)&unsigned char buf[12] = 1024;
      *(_DWORD *)&buf[14] = 473;
      *(_WORD *)&unsigned char buf[18] = 2080;
      *(void *)&buf[20] = v48;
      *(_WORD *)&buf[28] = 2080;
      *(void *)&buf[30] = v50;
      _os_log_impl(&dword_249BFC000, v38, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Kernel encountered error %s disconnecting ADS devices with AOIDs %s", buf, 0x26u);
      if (v64 < 0) {
        operator delete(v63[0]);
      }
      if (SHIBYTE(v58.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v58.__r_.__value_.__l.__data_);
      }
    }

    CFStringRef v43 = [MEMORY[0x263F087E8] errorWithDomain:@"ads::Kernel::disconnectADSDevicesByAOIDs" code:v36 userInfo:0];
    (*((void (**)(util *, void *))v57 + 2))(v57, v43);
    char v45 = 0;
LABEL_72:

    goto LABEL_73;
  }
  if (v39)
  {
    if (!cf)
    {
      std::vector<std::string> v53 = __cxa_allocate_exception(0x10uLL);
      MEMORY[0x24C5B19C0](v53, "Could not construct");
      __cxa_throw(v53, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
    }
    CFStringRef v46 = CFCopyDescription(cf);
    applesauce::CF::details::CFString_get_value<true>((uint64_t)&v58, v46);
    if (v46) {
      CFRelease(v46);
    }
    int v47 = &v58;
    if ((v58.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
      int v47 = (std::string *)v58.__r_.__value_.__r.__words[0];
    }
    *(_DWORD *)std::__split_buffer<std::string> buf = 136315650;
    *(void *)&buf[4] = "InCider.mm";
    *(_WORD *)&unsigned char buf[12] = 1024;
    *(_DWORD *)&buf[14] = 468;
    *(_WORD *)&unsigned char buf[18] = 2080;
    *(void *)&buf[20] = v47;
    _os_log_impl(&dword_249BFC000, v38, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Kernel disconnected ADS devices with AOIDs %s without error", buf, 0x1Cu);
    if (SHIBYTE(v58.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v58.__r_.__value_.__l.__data_);
    }
  }

  (*((void (**)(util *, void))v57 + 2))(v57, 0);
  char v45 = 0;
LABEL_73:
  if ((v45 & 1) == 0 && v23) {
    operator delete(v23);
  }
  if (cf) {
    CFRelease(cf);
  }
}

- (void)disconnectADSDeviceByAOID:(id)a3 withReply:(id)a4
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = (util *)a4;
  id v9 = v8;
  if (!v7)
  {
    util::server_log(v8);
    int v10 = (id) util::server_log(void)::sLogCat;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      id v11 = (std::string *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)std::__split_buffer<std::string> buf = 136315650;
      *(void *)&buf[4] = "InCider.mm";
      __int16 v26 = 1024;
      int v27 = 433;
      __int16 v28 = 2112;
      unint64_t v29 = v11;
      _os_log_impl(&dword_249BFC000, v10, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Pre-kernel CiderObject encountered nil parameter in method %@", buf, 0x1Cu);
    }
    CFTypeRef v12 = (void *)MEMORY[0x263F087E8];
    CFTypeRef v13 = NSStringFromSelector(a2);
    id v14 = [v12 errorWithDomain:v13 code:1852797029 userInfo:0];
    (*((void (**)(util *, void *))v9 + 2))(v9, v14);
  }
  int v15 = [v7 unsignedIntValue];
  int v16 = (util *)ads::Kernel::disconnectADSDeviceByAOID((ads::Kernel *)self->mKernelPtr.__ptr_, v15);
  signed int v17 = (int)v16;
  util::server_log(v16);
  signed int v18 = (id) util::server_log(void)::sLogCat;
  uint64_t v19 = v18;
  if (v17)
  {
    int v20 = v18;
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      int v21 = bswap32(v17);
      *(_DWORD *)&buf[1] = v21;
      if (((char)v21 - 32) > 0x5E
        || (((__int16)v21 >> 8) - 32) > 0x5E
        || ((v21 << 8 >> 24) - 32) > 0x5E
        || ((v21 >> 24) - 32) > 0x5E)
      {
        std::to_string(&v24, v17);
      }
      else
      {
        strcpy(&buf[5], "'");
        buf[0] = 39;
        std::string::basic_string[abi:ne180100]<0>(&v24, buf);
      }
      uint64_t v22 = &v24;
      if ((v24.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
        uint64_t v22 = (std::string *)v24.__r_.__value_.__r.__words[0];
      }
      *(_DWORD *)std::__split_buffer<std::string> buf = 136315906;
      *(void *)&buf[4] = "InCider.mm";
      __int16 v26 = 1024;
      int v27 = 446;
      __int16 v28 = 2080;
      unint64_t v29 = v22;
      __int16 v30 = 1024;
      int v31 = v15;
      _os_log_impl(&dword_249BFC000, v20, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Kernel encountered error %s disconnecting ADS device with AOID %u", buf, 0x22u);
      if (SHIBYTE(v24.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v24.__r_.__value_.__l.__data_);
      }
    }

    unint64_t v23 = [MEMORY[0x263F087E8] errorWithDomain:@"ads::Kernel::disconnectADSDeviceByAOID" code:v17 userInfo:0];
    (*((void (**)(util *, void *))v9 + 2))(v9, v23);
  }
  else
  {
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)std::__split_buffer<std::string> buf = 136315650;
      *(void *)&buf[4] = "InCider.mm";
      __int16 v26 = 1024;
      int v27 = 441;
      __int16 v28 = 1024;
      LODWORD(v29) = v15;
      _os_log_impl(&dword_249BFC000, v19, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Kernel disconnected ADS device with AOID %u without error", buf, 0x18u);
    }
    (*((void (**)(util *, void))v9 + 2))(v9, 0);
  }
}

- (void)connectADSDevices:(id)a3 withReply:(id)a4
{
  uint64_t v59 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = (util *)a4;
  id v9 = v8;
  if (v7)
  {
    CFRetain(v7);
  }
  else
  {
    util::server_log(v8);
    int v10 = (id) util::server_log(void)::sLogCat;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      id v11 = (std::string *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf.__first_) = 136315650;
      *(std::__split_buffer<std::string>::pointer *)((char *)&buf.__first_ + 4) = (std::__split_buffer<std::string>::pointer)"InCider.mm";
      WORD2(buf.__begin_) = 1024;
      *(_DWORD *)((char *)&buf.__begin_ + 6) = 388;
      WORD1(buf.__end_) = 2112;
      *(std::__split_buffer<std::string>::pointer *)((char *)&buf.__end_ + 4) = v11;
      _os_log_impl(&dword_249BFC000, v10, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Pre-kernel CiderObject encountered nil parameter in method %@", (uint8_t *)&buf, 0x1Cu);
    }
    CFTypeRef v12 = (void *)MEMORY[0x263F087E8];
    CFTypeRef v13 = NSStringFromSelector(a2);
    id v14 = [v12 errorWithDomain:v13 code:1852797029 userInfo:0];
    (*((void (**)(util *, void *, void))v9 + 2))(v9, v14, 0);
  }
  applesauce::CF::ArrayRef::ArrayRef((applesauce::CF::ArrayRef *)&cf, v7);

  if (!cf)
  {
    exception = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x24C5B19C0](exception, "Could not construct");
    __cxa_throw(exception, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }
  applesauce::CF::convert_as<std::vector<applesauce::CF::DictionaryRef>,0>(&v53, (const __CFArray *)cf);
  if (v54)
  {
    ptr = self->mKernelPtr.__ptr_;
    memset(v48, 0, sizeof(v48));
    std::vector<applesauce::CF::DictionaryRef>::__init_with_size[abi:ne180100]<applesauce::CF::DictionaryRef*,applesauce::CF::DictionaryRef*>(v48, (CFTypeRef *)v53.i64[0], (CFTypeRef *)v53.i64[1], (v53.i64[1] - v53.i64[0]) >> 3);
    v56.__r_.__value_.__r.__words[0] = (std::string::size_type)ptr;
    v56.__r_.__value_.__l.__size_ = (std::string::size_type)v48;
    applesauce::dispatch::v1::queue::operator*(*((id *)ptr + 7));
    signed int v17 = (id)objc_claimAutoreleasedReturnValue();
    unsigned int __val = 0;
    std::string v51 = 0;
    uint64_t v52 = 0;
    std::string __p = 0;
    buf.__first_ = (std::__split_buffer<std::string>::pointer)MEMORY[0x263EF8330];
    buf.__begin_ = (std::__split_buffer<std::string>::pointer)3221225472;
    buf.__end_ = (std::__split_buffer<std::string>::pointer)___ZN10applesauce8dispatch2v19sync_implIZN3ads6Kernel17connectADSDevicesENSt3__16vectorINS_2CF13DictionaryRefENS5_9allocatorIS8_EEEEE3__0EENS5_5decayIDTclfp0_EEE4typeEPU28objcproto17OS_dispatch_queue8NSObjectOT_NS5_17integral_constantIbLb0EEE_block_invoke;
    buf.__end_cap_.__value_ = (std::string *)&__block_descriptor_48_e5_v8__0l;
    buf.__end_cap_.__value_ = (std::allocator<std::string> *)&__val;
    std::string v58 = &v56;
    dispatch_sync(v17, &buf);

    buf.__first_ = (std::__split_buffer<std::string>::pointer)v48;
    std::vector<applesauce::CF::DictionaryRef>::__destroy_vector::operator()[abi:ne180100]((void ***)&buf);
    if (__val)
    {
      util::server_log(v18);
      uint64_t v19 = (id) util::server_log(void)::sLogCat;
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        int v20 = bswap32(__val);
        *(_DWORD *)((char *)&buf.__first_ + 1) = v20;
        if (((char)v20 - 32) > 0x5E
          || (((__int16)v20 >> 8) - 32) > 0x5E
          || ((v20 << 8 >> 24) - 32) > 0x5E
          || ((v20 >> 24) - 32) > 0x5E)
        {
          std::to_string(&v56, __val);
        }
        else
        {
          strcpy((char *)&buf.__first_ + 5, "'");
          LOBYTE(buf.__first_) = 39;
          std::string::basic_string[abi:ne180100]<0>(&v56, (char *)&buf);
        }
        BOOL v39 = &v56;
        if ((v56.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
          BOOL v39 = (std::string *)v56.__r_.__value_.__r.__words[0];
        }
        LODWORD(buf.__first_) = 136315906;
        *(std::__split_buffer<std::string>::pointer *)((char *)&buf.__first_ + 4) = (std::__split_buffer<std::string>::pointer)"InCider.mm";
        WORD2(buf.__begin_) = 1024;
        *(_DWORD *)((char *)&buf.__begin_ + 6) = 416;
        WORD1(buf.__end_) = 2080;
        *(std::__split_buffer<std::string>::pointer *)((char *)&buf.__end_ + 4) = v39;
        WORD2(buf.__end_cap_.__value_) = 2048;
        *(std::string **)((char *)&buf.__end_cap_.__value_ + 6) = (std::string *)((v53.i64[1] - v53.i64[0]) >> 3);
        _os_log_impl(&dword_249BFC000, v19, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Kernel encountered error %s connecting %lu ADS devices", (uint8_t *)&buf, 0x26u);
        if (SHIBYTE(v56.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(v56.__r_.__value_.__l.__data_);
        }
      }
    }
    else
    {
      char v45 = 0;
      CFStringRef v46 = 0;
      uint64_t v47 = 0;
      std::vector<unsigned int>::__init_with_size[abi:ne180100]<unsigned int *,unsigned int *>(&v45, __p, (uint64_t)v51, (v51 - (unsigned char *)__p) >> 2);
      memset(&v44, 0, sizeof(v44));
      int v25 = v45;
      __int16 v26 = v46;
      CFStringRef v43 = self;
      if (v25 != v26)
      {
        int v27 = v25;
        do
        {
          ads::Kernel::getUUIDForAOID((ads::Kernel *)&buf, (uint64_t)self->mKernelPtr.__ptr_, *v27);
          if (LODWORD(buf.__first_))
          {
            AudioObjectPropertyElement v41 = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
            std::logic_error::logic_error(v41, "We should never throw here. Successfully connecting a list of ads::Device then failing to get their UUIDs?");
            v41->__vftable = (std::logic_error_vtbl *)(MEMORY[0x263F8C3A0] + 16);
            __cxa_throw(v41, (struct type_info *)off_26527D640, MEMORY[0x263F8C080]);
          }
          if (SHIBYTE(buf.__end_cap_.__value_) < 0)
          {
            std::string::__init_copy_ctor_external(&v56, (const std::string::value_type *)buf.__begin_, (std::string::size_type)buf.__end_);
            if (LOBYTE(buf.__end_cap_.__value_) && SHIBYTE(buf.__end_cap_.__value_) < 0) {
              operator delete(buf.__begin_);
            }
          }
          else
          {
            std::string v56 = *(std::string *)&buf.__begin_;
          }
          std::vector<std::string>::pointer end = v44.__end_;
          if (v44.__end_ >= v44.__end_cap_.__value_)
          {
            unint64_t v30 = 0xAAAAAAAAAAAAAAABLL * (((char *)v44.__end_ - (char *)v44.__begin_) >> 3);
            unint64_t v31 = v30 + 1;
            if (v30 + 1 > 0xAAAAAAAAAAAAAAALL) {
              std::vector<applesauce::CF::StringRef>::__throw_length_error[abi:ne180100]();
            }
            if (0x5555555555555556 * (((char *)v44.__end_cap_.__value_ - (char *)v44.__begin_) >> 3) > v31) {
              unint64_t v31 = 0x5555555555555556 * (((char *)v44.__end_cap_.__value_ - (char *)v44.__begin_) >> 3);
            }
            if (0xAAAAAAAAAAAAAAABLL * (((char *)v44.__end_cap_.__value_ - (char *)v44.__begin_) >> 3) >= 0x555555555555555) {
              unint64_t v32 = 0xAAAAAAAAAAAAAAALL;
            }
            else {
              unint64_t v32 = v31;
            }
            buf.__end_cap_.__value_ = (std::allocator<std::string> *)&v44.__end_cap_;
            if (v32) {
              unint64_t v32 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>(v32);
            }
            else {
              uint64_t v33 = 0;
            }
            uint64_t v34 = (std::string *)(v32 + 24 * v30);
            buf.__first_ = (std::__split_buffer<std::string>::pointer)v32;
            buf.__begin_ = v34;
            buf.__end_cap_.__value_ = (std::string *)(v32 + 24 * v33);
            *uint64_t v34 = v56;
            memset(&v56, 0, sizeof(v56));
            buf.__end_ = v34 + 1;
            std::vector<std::string>::__swap_out_circular_buffer(&v44, &buf);
            unint64_t v29 = v44.__end_;
            std::__split_buffer<std::string>::~__split_buffer(&buf);
          }
          else
          {
            *(_OWORD *)v44.__end_ = *(_OWORD *)&v56.__r_.__value_.__l.__data_;
            end->__r_.__value_.__r.__words[2] = v56.__r_.__value_.__r.__words[2];
            memset(&v56, 0, sizeof(v56));
            unint64_t v29 = end + 1;
          }
          v44.__end_ = v29;
          ++v27;
        }
        while (v27 != v26);
      }

      __int16 v35 = applesauce::CF::details::make_CFArrayRef<std::string>((long long **)&v44);
      util::server_log(v35);
      uint64_t v36 = (id) util::server_log(void)::sLogCat;
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        CFStringRef v37 = CFCopyDescription(v35);
        applesauce::CF::details::CFString_get_value<true>((uint64_t)&v56, v37);
        if (v37) {
          CFRelease(v37);
        }
        AudioObjectPropertyScope v38 = &v56;
        if ((v56.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
          AudioObjectPropertyScope v38 = (std::string *)v56.__r_.__value_.__r.__words[0];
        }
        LODWORD(buf.__first_) = 136315650;
        *(std::__split_buffer<std::string>::pointer *)((char *)&buf.__first_ + 4) = (std::__split_buffer<std::string>::pointer)"InCider.mm";
        WORD2(buf.__begin_) = 1024;
        *(_DWORD *)((char *)&buf.__begin_ + 6) = 411;
        WORD1(buf.__end_) = 2080;
        *(std::__split_buffer<std::string>::pointer *)((char *)&buf.__end_ + 4) = v38;
        _os_log_impl(&dword_249BFC000, v36, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Kernel connected ADS devices with UUIDs %s without error", (uint8_t *)&buf, 0x1Cu);
        if (SHIBYTE(v56.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(v56.__r_.__value_.__l.__data_);
        }
      }

      (*((void (**)(util *, void, util *))v9 + 2))(v9, 0, v35);
      CFRelease(v35);
      buf.__first_ = (std::__split_buffer<std::string>::pointer)&v44;
      std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&buf);
      if (v25) {
        operator delete(v25);
      }
    }
    int v40 = [MEMORY[0x263F087E8] errorWithDomain:@"ads::Kernel::connectADSDevices" code:(int)__val userInfo:0];
    (*((void (**)(util *, void *, void))v9 + 2))(v9, v40, 0);

    if (__p)
    {
      std::string v51 = __p;
      operator delete(__p);
    }
  }
  else
  {
    util::server_log(v15);
    int v21 = (id) util::server_log(void)::sLogCat;
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf.__first_) = 136315394;
      *(std::__split_buffer<std::string>::pointer *)((char *)&buf.__first_ + 4) = (std::__split_buffer<std::string>::pointer)"InCider.mm";
      WORD2(buf.__begin_) = 1024;
      *(_DWORD *)((char *)&buf.__begin_ + 6) = 422;
      _os_log_impl(&dword_249BFC000, v21, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Pre-kernel CiderObject was unable to parse NSArray input as std::vector<ascf::DictionaryRef>", (uint8_t *)&buf, 0x12u);
    }
    uint64_t v22 = (void *)MEMORY[0x263F087E8];
    unint64_t v23 = NSStringFromSelector(a2);
    std::string v24 = [v22 errorWithDomain:v23 code:1852797029 userInfo:0];
    (*((void (**)(util *, void *, void))v9 + 2))(v9, v24, 0);
  }
  if (v54)
  {
    buf.__first_ = (std::__split_buffer<std::string>::pointer)&v53;
    std::vector<applesauce::CF::DictionaryRef>::__destroy_vector::operator()[abi:ne180100]((void ***)&buf);
  }
  if (cf) {
    CFRelease(cf);
  }
}

- (void)connectADSDevice:(id)a3 withReply:(id)a4
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = (util *)a4;
  id v9 = v8;
  if (v7)
  {
    CFRetain(v7);
  }
  else
  {
    util::server_log(v8);
    int v10 = (id) util::server_log(void)::sLogCat;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      id v11 = (unsigned char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)std::__split_buffer<std::string> buf = 136315650;
      *(void *)std::vector<std::string> v44 = "InCider.mm";
      *(_WORD *)&v44[8] = 1024;
      *(_DWORD *)&v44[10] = 356;
      __int16 v45 = 2112;
      CFStringRef v46 = v11;
      _os_log_impl(&dword_249BFC000, v10, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Pre-kernel CiderObject encountered nil parameter in method %@", buf, 0x1Cu);
    }
    CFTypeRef v12 = (void *)MEMORY[0x263F087E8];
    CFTypeRef v13 = NSStringFromSelector(a2);
    id v14 = [v12 errorWithDomain:v13 code:1852797029 userInfo:0];
    (*((void (**)(util *, void *, void))v9 + 2))(v9, v14, 0);
  }
  applesauce::CF::DictionaryRef::DictionaryRef((applesauce::CF::DictionaryRef *)&cf, v7);

  ptr = self->mKernelPtr.__ptr_;
  CFTypeRef v16 = cf;
  if (cf) {
    CFRetain(cf);
  }
  CFTypeRef v37 = v16;
  unint64_t v17 = ads::Kernel::connectADSDevice((uint64_t)ptr, (uint64_t)&v37);
  signed int v18 = (util *)v37;
  if (v37) {
    CFRelease(v37);
  }
  if (v17)
  {
    util::server_log(v18);
    uint64_t v19 = (id) util::server_log(void)::sLogCat;
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      int v20 = bswap32(v17);
      *(_DWORD *)((char *)&__p.__r_.__value_.__l.__data_ + 1) = v20;
      if (((char)v20 - 32) > 0x5E
        || (((__int16)v20 >> 8) - 32) > 0x5E
        || ((v20 << 8 >> 24) - 32) > 0x5E
        || ((v20 >> 24) - 32) > 0x5E)
      {
        std::to_string((std::string *)v40, v17);
      }
      else
      {
        *(_WORD *)((char *)__p.__r_.__value_.__r.__words + 5) = 39;
        __p.__r_.__value_.__s.__data_[0] = 39;
        std::string::basic_string[abi:ne180100]<0>(v40, (char *)&__p);
      }
      if (v40[23] >= 0) {
        __int16 v28 = v40;
      }
      else {
        __int16 v28 = *(unsigned char **)v40;
      }
      if (!cf)
      {
        exception = __cxa_allocate_exception(0x10uLL);
        MEMORY[0x24C5B19C0](exception, "Could not construct");
        __cxa_throw(exception, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
      }
      CFStringRef v29 = CFCopyDescription(cf);
      applesauce::CF::details::CFString_get_value<true>((uint64_t)&__p, v29);
      if (v29) {
        CFRelease(v29);
      }
      p_p = &__p;
      if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
        p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
      }
      *(_DWORD *)std::__split_buffer<std::string> buf = 136315906;
      *(void *)std::vector<std::string> v44 = "InCider.mm";
      *(_WORD *)&v44[8] = 1024;
      *(_DWORD *)&v44[10] = 378;
      __int16 v45 = 2080;
      CFStringRef v46 = v28;
      __int16 v47 = 2080;
      uint64_t v48 = p_p;
      _os_log_impl(&dword_249BFC000, v19, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Kernel encountered error %s connecting ADS device with dictionary %s", buf, 0x26u);
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(__p.__r_.__value_.__l.__data_);
      }
      if ((v40[23] & 0x80000000) != 0) {
        operator delete(*(void **)v40);
      }
    }

    unint64_t v31 = [MEMORY[0x263F087E8] errorWithDomain:@"ads::Kernel::connectADSDevice" code:(int)v17 userInfo:0];
    (*((void (**)(util *, void *, void))v9 + 2))(v9, v31, 0);
  }
  else
  {
    unint64_t v21 = HIDWORD(v17);
    ads::Kernel::getUUIDForAOID((ads::Kernel *)buf, (uint64_t)self->mKernelPtr.__ptr_, SHIDWORD(v17));
    int v22 = *(_DWORD *)buf;
    util::server_log(v23);
    std::string v24 = (id) util::server_log(void)::sLogCat;
    int v25 = v24;
    if (v22)
    {
      __int16 v26 = v24;
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        int v27 = bswap32(*(unsigned int *)buf);
        *(_DWORD *)&v40[1] = v27;
        if (((char)v27 - 32) > 0x5E
          || (((__int16)v27 >> 8) - 32) > 0x5E
          || ((v27 << 8 >> 24) - 32) > 0x5E
          || ((v27 >> 24) - 32) > 0x5E)
        {
          std::to_string(&__p, *(unsigned int *)buf);
        }
        else
        {
          strcpy(&v40[5], "'");
          v40[0] = 39;
          std::string::basic_string[abi:ne180100]<0>(&__p, v40);
        }
        __int16 v35 = &__p;
        if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
          __int16 v35 = (std::string *)__p.__r_.__value_.__r.__words[0];
        }
        *(_DWORD *)int v40 = 136315906;
        *(void *)&v40[4] = "InCider.mm";
        *(_WORD *)&v40[12] = 1024;
        *(_DWORD *)&v40[14] = 372;
        *(_WORD *)&v40[18] = 2080;
        *(void *)&v40[20] = v35;
        __int16 v41 = 1024;
        int v42 = v21;
        _os_log_impl(&dword_249BFC000, v26, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Kernel encountered error %s getting UUID for newly connected ADS device with AOID %d", v40, 0x22u);
        if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(__p.__r_.__value_.__l.__data_);
        }
      }

      uint64_t v34 = [MEMORY[0x263F087E8] errorWithDomain:@"ads::Kernel::getUUIDForAOID" code:*(int *)buf userInfo:0];
      (*((void (**)(util *, void *, void))v9 + 2))(v9, v34, 0);
    }
    else
    {
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        unint64_t v32 = &v44[4];
        if (SBYTE1(v48) < 0) {
          unint64_t v32 = *(unsigned char **)&v44[4];
        }
        *(_DWORD *)int v40 = 136315650;
        *(void *)&v40[4] = "InCider.mm";
        *(_WORD *)&v40[12] = 1024;
        *(_DWORD *)&v40[14] = 367;
        *(_WORD *)&v40[18] = 2080;
        *(void *)&v40[20] = v32;
        _os_log_impl(&dword_249BFC000, v25, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Kernel connected ADS device with UUID %s without error", v40, 0x1Cu);
      }
      if (SBYTE1(v48) >= 0) {
        uint64_t v33 = &v44[4];
      }
      else {
        uint64_t v33 = *(unsigned char **)&v44[4];
      }
      uint64_t v34 = [NSString stringWithCString:v33 encoding:4];
      (*((void (**)(util *, void, void *))v9 + 2))(v9, 0, v34);
    }

    if (BYTE2(v48) && SBYTE1(v48) < 0) {
      operator delete(*(void **)&v44[4]);
    }
  }
  if (cf) {
    CFRelease(cf);
  }
}

- (void)getUUIDForAOID:(id)a3 withReply:(id)a4
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = (util *)a4;
  id v9 = v8;
  if (!v7)
  {
    util::server_log(v8);
    int v10 = (id) util::server_log(void)::sLogCat;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = NSStringFromSelector(a2);
      *(_DWORD *)std::__split_buffer<std::string> buf = 136315650;
      *(void *)std::string __p = "InCider.mm";
      *(_WORD *)&__p[8] = 1024;
      *(_DWORD *)&__p[10] = 332;
      __int16 v36 = 2112;
      CFTypeRef v37 = v11;
      _os_log_impl(&dword_249BFC000, v10, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Pre-kernel CiderObject encountered nil parameter in method %@", buf, 0x1Cu);
    }
    CFTypeRef v12 = (void *)MEMORY[0x263F087E8];
    CFTypeRef v13 = NSStringFromSelector(a2);
    id v14 = [v12 errorWithDomain:v13 code:1852797029 userInfo:0];
    (*((void (**)(util *, void *, void))v9 + 2))(v9, v14, 0);
  }
  int v15 = [v7 unsignedIntValue];
  ads::Kernel::getUUIDForAOID((ads::Kernel *)buf, (uint64_t)self->mKernelPtr.__ptr_, v15);
  int v16 = *(_DWORD *)buf;
  util::server_log(v17);
  signed int v18 = (id) util::server_log(void)::sLogCat;
  uint64_t v19 = v18;
  if (v16)
  {
    int v20 = v18;
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      int v21 = bswap32(*(unsigned int *)buf);
      *(_DWORD *)&v27[1] = v21;
      if (((char)v21 - 32) > 0x5E
        || (((__int16)v21 >> 8) - 32) > 0x5E
        || ((v21 << 8 >> 24) - 32) > 0x5E
        || ((v21 >> 24) - 32) > 0x5E)
      {
        std::to_string(&v26, *(unsigned int *)buf);
      }
      else
      {
        strcpy(&v27[5], "'");
        v27[0] = 39;
        std::string::basic_string[abi:ne180100]<0>(&v26, v27);
      }
      int v25 = &v26;
      if ((v26.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
        int v25 = (std::string *)v26.__r_.__value_.__r.__words[0];
      }
      *(_DWORD *)int v27 = 136315906;
      *(void *)&v27[4] = "InCider.mm";
      __int16 v28 = 1024;
      int v29 = 345;
      __int16 v30 = 2080;
      unint64_t v31 = v25;
      __int16 v32 = 1024;
      int v33 = v15;
      _os_log_impl(&dword_249BFC000, v20, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Kernel encountered error %s retrieving UUID for AOID %u", v27, 0x22u);
      if (SHIBYTE(v26.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v26.__r_.__value_.__l.__data_);
      }
    }

    std::string v24 = [MEMORY[0x263F087E8] errorWithDomain:@"ads::Kernel::getUUIDForAOID" code:*(int *)buf userInfo:0];
    (*((void (**)(util *, void *, void))v9 + 2))(v9, v24, 0);
  }
  else
  {
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      int v22 = (std::string *)&__p[4];
      if (v38 < 0) {
        int v22 = *(std::string **)&__p[4];
      }
      *(_DWORD *)int v27 = 136315906;
      *(void *)&v27[4] = "InCider.mm";
      __int16 v28 = 1024;
      int v29 = 340;
      __int16 v30 = 2080;
      unint64_t v31 = v22;
      __int16 v32 = 1024;
      int v33 = v15;
      _os_log_impl(&dword_249BFC000, v19, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Kernel retrieved UUID %s for AOID %u without error", v27, 0x22u);
    }
    if (v38 >= 0) {
      unint64_t v23 = &__p[4];
    }
    else {
      unint64_t v23 = *(unsigned char **)&__p[4];
    }
    std::string v24 = [NSString stringWithCString:v23 encoding:4];
    (*((void (**)(util *, void, void *))v9 + 2))(v9, 0, v24);
  }

  if (v39 && v38 < 0) {
    operator delete(*(void **)&__p[4]);
  }
}

- (void)getAOIDForUUID:(id)a3 withReply:(id)a4
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = (util *)a4;
  id v9 = v8;
  if (!v7)
  {
    util::server_log(v8);
    int v10 = (id) util::server_log(void)::sLogCat;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = NSStringFromSelector(a2);
      *(_DWORD *)std::__split_buffer<std::string> buf = 136315650;
      *(void *)&uint8_t buf[4] = "InCider.mm";
      *(_WORD *)&unsigned char buf[12] = 1024;
      *(_DWORD *)&buf[14] = 309;
      *(_WORD *)&unsigned char buf[18] = 2112;
      *(void *)&buf[20] = v11;
      _os_log_impl(&dword_249BFC000, v10, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Pre-kernel CiderObject encountered nil parameter in method %@", buf, 0x1Cu);
    }
    CFTypeRef v12 = (void *)MEMORY[0x263F087E8];
    CFTypeRef v13 = NSStringFromSelector(a2);
    id v14 = [v12 errorWithDomain:v13 code:1852797029 userInfo:0];
    (*((void (**)(util *, void *, void))v9 + 2))(v9, v14, 0);
  }
  id v15 = v7;
  std::string::basic_string[abi:ne180100]<0>(&__p, (char *)[v15 UTF8String]);
  ptr = self->mKernelPtr.__ptr_;
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    std::string::__init_copy_ctor_external(&v32, __p.__r_.__value_.__l.__data_, __p.__r_.__value_.__l.__size_);
  }
  else {
    std::string v32 = __p;
  }
  v31.__r_.__value_.__r.__words[0] = (std::string::size_type)ptr;
  v31.__r_.__value_.__l.__size_ = (std::string::size_type)&v32;
  unint64_t v17 = (void *)*((void *)ptr + 7);
  signed int v18 = applesauce::dispatch::v1::queue::operator*(v17);
  LODWORD(v34) = 0;
  BYTE4(v34) = 0;
  char v35 = 0;
  *(void *)std::__split_buffer<std::string> buf = MEMORY[0x263EF8330];
  *(void *)&buf[8] = 3221225472;
  *(void *)&buf[16] = ___ZN10applesauce8dispatch2v19sync_implIZN3ads6Kernel14getAOIDForUUIDENSt3__112basic_stringIcNS5_11char_traitsIcEENS5_9allocatorIcEEEEE3__0EENS5_5decayIDTclfp0_EEE4typeEPU28objcproto17OS_dispatch_queue8NSObjectOT_NS5_17integral_constantIbLb0EEE_block_invoke;
  *(void *)&buf[24] = &__block_descriptor_48_e5_v8__0l;
  *(void *)&buf[32] = &v34;
  CFTypeRef v37 = &v31;
  dispatch_sync(v18, buf);
  unint64_t v19 = v34;

  if (SHIBYTE(v32.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v32.__r_.__value_.__l.__data_);
  }
  util::server_log(v20);
  int v21 = (id) util::server_log(void)::sLogCat;
  int v22 = v21;
  if (v19)
  {
    unint64_t v23 = v21;
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      int v24 = bswap32(v19);
      *(_DWORD *)&buf[1] = v24;
      if (((char)v24 - 32) > 0x5E
        || (((__int16)v24 >> 8) - 32) > 0x5E
        || ((v24 << 8 >> 24) - 32) > 0x5E
        || ((v24 >> 24) - 32) > 0x5E)
      {
        std::to_string(&v31, v19);
      }
      else
      {
        strcpy(&buf[5], "'");
        buf[0] = 39;
        std::string::basic_string[abi:ne180100]<0>(&v31, buf);
      }
      __int16 v28 = &v31;
      if ((v31.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
        __int16 v28 = (std::string *)v31.__r_.__value_.__r.__words[0];
      }
      p_p = &__p;
      if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
        p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
      }
      *(_DWORD *)std::__split_buffer<std::string> buf = 136315906;
      *(void *)&uint8_t buf[4] = "InCider.mm";
      *(_WORD *)&unsigned char buf[12] = 1024;
      *(_DWORD *)&buf[14] = 322;
      *(_WORD *)&unsigned char buf[18] = 2080;
      *(void *)&buf[20] = v28;
      *(_WORD *)&buf[28] = 2080;
      *(void *)&buf[30] = p_p;
      _os_log_impl(&dword_249BFC000, v23, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Kernel encountered error %s retrieving AOID for UUID %s", buf, 0x26u);
      if (SHIBYTE(v31.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v31.__r_.__value_.__l.__data_);
      }
    }

    __int16 v30 = [MEMORY[0x263F087E8] errorWithDomain:@"ads::Kernel::getAOIDForUUID" code:(int)v19 userInfo:0];
    (*((void (**)(util *, void *, void))v9 + 2))(v9, v30, 0);
  }
  else
  {
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v25 = HIDWORD(v19);
      std::string v26 = &__p;
      if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
        std::string v26 = (std::string *)__p.__r_.__value_.__r.__words[0];
      }
      *(_DWORD *)std::__split_buffer<std::string> buf = 136315906;
      *(void *)&uint8_t buf[4] = "InCider.mm";
      *(_WORD *)&unsigned char buf[12] = 1024;
      *(_DWORD *)&buf[14] = 317;
      *(_WORD *)&unsigned char buf[18] = 1024;
      *(_DWORD *)&buf[20] = v25;
      *(_WORD *)&buf[24] = 2080;
      *(void *)&buf[26] = v26;
      _os_log_impl(&dword_249BFC000, v22, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Kernel retrieved AOID %u for UUID %s without error", buf, 0x22u);
      unint64_t v27 = v25;
    }
    else
    {
      unint64_t v27 = HIDWORD(v19);
    }
    __int16 v30 = [NSNumber numberWithUnsignedInt:v27];
    (*((void (**)(util *, void, void *))v9 + 2))(v9, 0, v30);
  }

  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
}

- (void)getADSDeviceMap:(id)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  v4 = (void (**)(id, void, CFDictionaryRef))a3;
  v28.i64[0] = (uint64_t)self->mKernelPtr.__ptr_;
  applesauce::dispatch::v1::queue::operator*(*(id *)(v28.i64[0] + 56));
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  *(_OWORD *)std::string __p = 0u;
  *(_OWORD *)unint64_t v25 = 0u;
  int v26 = 1065353216;
  *(void *)block = MEMORY[0x263EF8330];
  *(void *)&block[8] = 3221225472;
  *(void *)&block[16] = ___ZN10applesauce8dispatch2v19sync_implIZN3ads6Kernel15getADSDeviceMapEvE3__0EENSt3__15decayIDTclfp0_EEE4typeEPU28objcproto17OS_dispatch_queue8NSObjectOT_NS6_17integral_constantIbLb0EEE_block_invoke;
  *(void *)&block[24] = &__block_descriptor_48_e5_v8__0l;
  std::string v31 = __p;
  std::string v32 = &v28;
  dispatch_sync(v5, block);

  int64x2_t v28 = 0uLL;
  unint64_t v29 = 0;
  std::vector<applesauce::CF::TypeRefPair>::reserve(&v28, (unint64_t)v25[1]);
  id v6 = v25;
  while (1)
  {
    id v6 = (void **)*v6;
    if (!v6) {
      break;
    }
    uint64_t v7 = v28.i64[1];
    if (v28.i64[1] >= v29)
    {
      uint64_t v9 = (v28.i64[1] - v28.i64[0]) >> 4;
      if ((unint64_t)(v9 + 1) >> 60) {
        std::vector<applesauce::CF::StringRef>::__throw_length_error[abi:ne180100]();
      }
      unint64_t v10 = (uint64_t)(v29 - v28.i64[0]) >> 3;
      if (v10 <= v9 + 1) {
        unint64_t v10 = v9 + 1;
      }
      if (v29 - v28.i64[0] >= 0x7FFFFFFFFFFFFFF0) {
        unint64_t v11 = 0xFFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v11 = v10;
      }
      std::string v31 = (void **)&v29;
      if (v11) {
        unint64_t v11 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<applesauce::CF::TypeRefPair>>(v11);
      }
      else {
        uint64_t v12 = 0;
      }
      *(void *)block = v11;
      *(void *)&block[8] = v11 + 16 * v9;
      *(void *)&block[16] = *(void *)&block[8];
      *(void *)&block[24] = v11 + 16 * v12;
      applesauce::CF::TypeRefPair::TypeRefPair<std::string const&,unsigned int const&>(*(CFStringRef **)&block[8], (const UInt8 *)v6 + 16, (int *)v6 + 10);
      uint64_t v13 = *(void *)&block[8];
      uint64_t v8 = *(void *)&block[16] + 16;
      *(void *)&block[16] += 16;
      id v14 = (void *)v28.i64[1];
      id v15 = (void *)v28.i64[0];
      if (v28.i64[1] == v28.i64[0])
      {
        int64x2_t v17 = vdupq_n_s64(v28.u64[1]);
      }
      else
      {
        do
        {
          uint64_t v16 = *(v14 - 2);
          v14 -= 2;
          *(void *)(v13 - 16) = v16;
          v13 -= 16;
          *id v14 = 0;
          *(void *)(v13 + 8) = v14[1];
          v14[1] = 0;
        }
        while (v14 != v15);
        int64x2_t v17 = v28;
        uint64_t v8 = *(void *)&block[16];
      }
      v28.i64[0] = v13;
      v28.i64[1] = v8;
      *(int64x2_t *)&block[8] = v17;
      unint64_t v18 = v29;
      unint64_t v29 = *(void *)&block[24];
      *(void *)&block[24] = v18;
      *(void *)block = v17.i64[0];
      std::__split_buffer<applesauce::CF::TypeRefPair>::~__split_buffer((uint64_t)block);
    }
    else
    {
      applesauce::CF::TypeRefPair::TypeRefPair<std::string const&,unsigned int const&>((CFStringRef *)v28.i64[1], (const UInt8 *)v6 + 16, (int *)v6 + 10);
      uint64_t v8 = v7 + 16;
    }
    v28.i64[1] = v8;
  }
  CFDictionaryRef CFDictionaryRef = applesauce::CF::details::make_CFDictionaryRef((void ***)&v28);
  *(void *)block = &v28;
  std::vector<applesauce::CF::TypeRefPair>::__destroy_vector::operator()[abi:ne180100]((void ***)block);
  CFDictionaryRef v27 = CFDictionaryRef;
  std::__hash_table<std::__hash_value_type<std::string,unsigned int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,unsigned int>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,unsigned int>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,unsigned int>>>::__deallocate_node((void **)v25[0]);
  int v20 = __p[0];
  __p[0] = 0;
  if (v20) {
    operator delete(v20);
  }
  util::server_log((util *)v20);
  int v21 = (id) util::server_log(void)::sLogCat;
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v22 = CFCopyDescription(CFDictionaryRef);
    applesauce::CF::details::CFString_get_value<true>((uint64_t)__p, v22);
    if (v22) {
      CFRelease(v22);
    }
    unint64_t v23 = __p;
    if (SHIBYTE(v25[0]) < 0) {
      unint64_t v23 = (void **)__p[0];
    }
    *(_DWORD *)block = 136315650;
    *(void *)&block[4] = "InCider.mm";
    *(_WORD *)&block[12] = 1024;
    *(_DWORD *)&block[14] = 300;
    *(_WORD *)&block[18] = 2080;
    *(void *)&block[20] = v23;
    _os_log_impl(&dword_249BFC000, v21, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Kernel retrieved ADS device map: %s", block, 0x1Cu);
    if (SHIBYTE(v25[0]) < 0) {
      operator delete(__p[0]);
    }
  }

  v4[2](v4, 0, CFDictionaryRef);
  CFRelease(CFDictionaryRef);
}

- (void)getADSPluginAOID:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  v3 = (ads::Kernel *)a3;
  ADSPluginAOID = (util *)ads::Kernel::getADSPluginAOID(v3);
  util::server_log(ADSPluginAOID);
  id v5 = (id) util::server_log(void)::sLogCat;
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (ADSPluginAOID)
  {
    if (v6)
    {
      int v8 = 136315650;
      uint64_t v9 = "InCider.mm";
      __int16 v10 = 1024;
      int v11 = 293;
      __int16 v12 = 1024;
      int v13 = (int)ADSPluginAOID;
      _os_log_impl(&dword_249BFC000, v5, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Kernel retrieved ADS plugin AOID %u without error", (uint8_t *)&v8, 0x18u);
    }
    uint64_t v7 = [NSNumber numberWithUnsignedInt:ADSPluginAOID];
    (*((void (**)(ads::Kernel *, void, void *))v3 + 2))(v3, 0, v7);
  }
  else
  {
    if (v6)
    {
      int v8 = 136315394;
      uint64_t v9 = "InCider.mm";
      __int16 v10 = 1024;
      int v11 = 288;
      _os_log_impl(&dword_249BFC000, v5, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Kernel encountered error retrieving ADS plugin AOID -- ADS is not enabled", (uint8_t *)&v8, 0x12u);
    }
    uint64_t v7 = [MEMORY[0x263F087E8] errorWithDomain:@"ads::Kernel::getADSPluginAOID" code:1852797029 userInfo:0];
    (*((void (**)(ads::Kernel *, void *, void))v3 + 2))(v3, v7, 0);
  }
}

- (id)setPropertyDataPrivileged_NSHelper:(id)a3 withInAddress:(AudioObjectPropertyAddress *)a4 withInData:(id)a5
{
  uint64_t v64 = *MEMORY[0x263EF8340];
  id v9 = a3;
  __int16 v10 = (util *)a5;
  int v11 = v10;
  if (v9 && v10)
  {
    int v12 = [v9 unsignedIntValue];
    int v13 = v11;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v14 = v13;
      CFRetain(v14);
      applesauce::CF::ArrayRef::ArrayRef((applesauce::CF::ArrayRef *)cf, v14);

      id v15 = *(const void **)cf;
      if (*(void *)cf)
      {
        CFRetain(*(CFTypeRef *)cf);
        uint64_t v16 = *(const void **)cf;
        CFTypeRef v51 = v15;
        if (*(void *)cf) {
          goto LABEL_17;
        }
        goto LABEL_19;
      }
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        CFStringRef v22 = v13;
        CFRetain(v22);
        applesauce::CF::DictionaryRef::DictionaryRef((applesauce::CF::DictionaryRef *)cf, v22);

        unint64_t v23 = *(const void **)cf;
        if (*(void *)cf)
        {
          CFRetain(*(CFTypeRef *)cf);
          uint64_t v16 = *(const void **)cf;
          CFTypeRef v51 = v23;
          if (*(void *)cf) {
            goto LABEL_17;
          }
          goto LABEL_19;
        }
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          int v24 = v13;
          CFRetain(v24);
          applesauce::CF::StringRef::StringRef((applesauce::CF::StringRef *)cf, v24);

          unint64_t v25 = *(const void **)cf;
          if (*(void *)cf)
          {
            CFRetain(*(CFTypeRef *)cf);
            uint64_t v16 = *(const void **)cf;
            CFTypeRef v51 = v25;
            if (*(void *)cf) {
LABEL_17:
            }
              CFRelease(v16);
LABEL_19:

            int v26 = (util *)ads::Kernel::setPropertyDataPrivileged_TypeRef((ads::Kernel *)self->mKernelPtr.__ptr_, v12, a4, (const applesauce::CF::TypeRef *)&v51);
            signed int v27 = (int)v26;
            BOOL v28 = v26 == 0;
            util::server_log(v26);
            unint64_t v29 = (id) util::server_log(void)::sLogCat;
            BOOL v30 = os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT);
            if (v28)
            {
              if (v30)
              {
                AudioObjectPropertySelector mSelector = a4->mSelector;
                int v33 = bswap32(a4->mSelector);
                *(_DWORD *)&cf[1] = v33;
                if (((char)v33 - 32) > 0x5E
                  || (((__int16)v33 >> 8) - 32) > 0x5E
                  || ((v33 << 8 >> 24) - 32) > 0x5E
                  || ((v33 >> 24) - 32) > 0x5E)
                {
                  std::to_string(&v50, mSelector);
                }
                else
                {
                  strcpy(&cf[5], "'");
                  cf[0] = 39;
                  std::string::basic_string[abi:ne180100]<0>(&v50, cf);
                }
                if ((v50.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
                  int v42 = &v50;
                }
                else {
                  int v42 = (std::string *)v50.__r_.__value_.__r.__words[0];
                }
                AudioObjectPropertyScope mScope = a4->mScope;
                int v44 = bswap32(mScope);
                *(_DWORD *)&cf[1] = v44;
                if (((char)v44 - 32) > 0x5E
                  || (((__int16)v44 >> 8) - 32) > 0x5E
                  || ((v44 << 8 >> 24) - 32) > 0x5E
                  || ((v44 >> 24) - 32) > 0x5E)
                {
                  std::to_string(&v49, mScope);
                }
                else
                {
                  strcpy(&cf[5], "'");
                  cf[0] = 39;
                  std::string::basic_string[abi:ne180100]<0>(&v49, cf);
                }
                __int16 v45 = &v49;
                if ((v49.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
                  __int16 v45 = (std::string *)v49.__r_.__value_.__r.__words[0];
                }
                AudioObjectPropertyElement mElement = a4->mElement;
                *(_DWORD *)CFTypeRef cf = 136316418;
                *(void *)&cf[4] = "InCider.mm";
                __int16 v53 = 1024;
                int v54 = 266;
                __int16 v55 = 2080;
                std::string v56 = v42;
                __int16 v57 = 2080;
                std::string v58 = v45;
                __int16 v59 = 1024;
                *(_DWORD *)id v60 = mElement;
                *(_WORD *)&v60[4] = 1024;
                *(_DWORD *)&v60[6] = v12;
                _os_log_impl(&dword_249BFC000, v29, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Kernel successfully set property [%s/%s/%u] on device with ID %u with privilege", cf, 0x32u);
                if (SHIBYTE(v49.__r_.__value_.__r.__words[2]) < 0) {
                  operator delete(v49.__r_.__value_.__l.__data_);
                }
                if (SHIBYTE(v50.__r_.__value_.__r.__words[2]) < 0) {
                  operator delete(v50.__r_.__value_.__l.__data_);
                }
              }

              int v21 = 0;
            }
            else
            {
              if (v30)
              {
                int v31 = bswap32(v27);
                *(_DWORD *)&cf[1] = v31;
                if (((char)v31 - 32) > 0x5E
                  || (((__int16)v31 >> 8) - 32) > 0x5E
                  || ((v31 << 8 >> 24) - 32) > 0x5E
                  || ((v31 >> 24) - 32) > 0x5E)
                {
                  std::to_string(&v50, v27);
                }
                else
                {
                  strcpy(&cf[5], "'");
                  cf[0] = 39;
                  std::string::basic_string[abi:ne180100]<0>(&v50, cf);
                }
                if ((v50.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
                  unint64_t v34 = &v50;
                }
                else {
                  unint64_t v34 = (std::string *)v50.__r_.__value_.__r.__words[0];
                }
                AudioObjectPropertySelector v35 = a4->mSelector;
                int v36 = bswap32(a4->mSelector);
                *(_DWORD *)&cf[1] = v36;
                if (((char)v36 - 32) > 0x5E
                  || (((__int16)v36 >> 8) - 32) > 0x5E
                  || ((v36 << 8 >> 24) - 32) > 0x5E
                  || ((v36 >> 24) - 32) > 0x5E)
                {
                  std::to_string(&v49, v35);
                }
                else
                {
                  strcpy(&cf[5], "'");
                  cf[0] = 39;
                  std::string::basic_string[abi:ne180100]<0>(&v49, cf);
                }
                if ((v49.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
                  CFTypeRef v37 = &v49;
                }
                else {
                  CFTypeRef v37 = (std::string *)v49.__r_.__value_.__r.__words[0];
                }
                AudioObjectPropertyScope v38 = a4->mScope;
                int v39 = bswap32(v38);
                *(_DWORD *)&cf[1] = v39;
                if (((char)v39 - 32) > 0x5E
                  || (((__int16)v39 >> 8) - 32) > 0x5E
                  || ((v39 << 8 >> 24) - 32) > 0x5E
                  || ((v39 >> 24) - 32) > 0x5E)
                {
                  std::to_string(&__p, v38);
                }
                else
                {
                  strcpy(&cf[5], "'");
                  cf[0] = 39;
                  std::string::basic_string[abi:ne180100]<0>(&__p, cf);
                }
                p_p = &__p;
                if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
                  p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
                }
                AudioObjectPropertyElement v41 = a4->mElement;
                *(_DWORD *)CFTypeRef cf = 136316674;
                *(void *)&cf[4] = "InCider.mm";
                __int16 v53 = 1024;
                int v54 = 277;
                __int16 v55 = 2080;
                std::string v56 = v34;
                __int16 v57 = 2080;
                std::string v58 = v37;
                __int16 v59 = 2080;
                *(void *)id v60 = p_p;
                *(_WORD *)&v60[8] = 1024;
                AudioObjectPropertyElement v61 = v41;
                __int16 v62 = 1024;
                int v63 = v12;
                _os_log_impl(&dword_249BFC000, v29, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Kernel encountered error %s setting property [%s/%s/%u] on device with ID %u with privilege", cf, 0x3Cu);
                if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
                  operator delete(__p.__r_.__value_.__l.__data_);
                }
                if (SHIBYTE(v49.__r_.__value_.__r.__words[2]) < 0) {
                  operator delete(v49.__r_.__value_.__l.__data_);
                }
                if (SHIBYTE(v50.__r_.__value_.__r.__words[2]) < 0) {
                  operator delete(v50.__r_.__value_.__l.__data_);
                }
              }

              int v21 = [MEMORY[0x263F087E8] errorWithDomain:@"ads::Kernel::setPropertyDataPrivileged_TypeRef" code:v27 userInfo:0];
            }
            if (v51) {
              CFRelease(v51);
            }
            goto LABEL_79;
          }
        }
      }
    }
    CFTypeRef v51 = 0;
    goto LABEL_19;
  }
  util::server_log(v10);
  int64x2_t v17 = (id) util::server_log(void)::sLogCat;
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    unint64_t v18 = (std::string *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)CFTypeRef cf = 136315650;
    *(void *)&cf[4] = "InCider.mm";
    __int16 v53 = 1024;
    int v54 = 247;
    __int16 v55 = 2112;
    std::string v56 = v18;
    _os_log_impl(&dword_249BFC000, v17, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Pre-kernel CiderObject encountered nil parameter in method %@", cf, 0x1Cu);
  }
  unint64_t v19 = (void *)MEMORY[0x263F087E8];
  int v20 = NSStringFromSelector(a2);
  int v21 = [v19 errorWithDomain:v20 code:1852797029 userInfo:0];

LABEL_79:

  return v21;
}

- (pair<NSError)getPropertyData_NSHelper:(id)a3 withInAddress:(AudioObjectPropertyAddress *)a4 withClass:(Class)a5
{
  __int16 v10 = v5;
  uint64_t v70 = *MEMORY[0x263EF8340];
  id v11 = a3;
  int v12 = v11;
  if (v11)
  {
    int v13 = (const AudioObjectPropertyAddress *)[v11 unsignedIntValue];
    int v14 = (int)v13;
    ads::Kernel::getPropertyData_TypeRef((ads::Kernel *)&__val, (uint64_t)self->mKernelPtr.__ptr_, v13, (uint64_t)a4);
    if (__val)
    {
      util::server_log(v15);
      uint64_t v16 = (id) util::server_log(void)::sLogCat;
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        int v17 = bswap32(__val);
        *(_DWORD *)&buf[1] = v17;
        if (((char)v17 - 32) > 0x5E
          || (((__int16)v17 >> 8) - 32) > 0x5E
          || ((v17 << 8 >> 24) - 32) > 0x5E
          || ((v17 >> 24) - 32) > 0x5E)
        {
          std::to_string(&v54, __val);
        }
        else
        {
          strcpy(&buf[5], "'");
          buf[0] = 39;
          std::string::basic_string[abi:ne180100]<0>(&v54, buf);
        }
        if ((v54.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
          unint64_t v23 = &v54;
        }
        else {
          unint64_t v23 = (std::string *)v54.__r_.__value_.__r.__words[0];
        }
        AudioObjectPropertySelector mSelector = a4->mSelector;
        int v25 = bswap32(a4->mSelector);
        *(_DWORD *)&buf[1] = v25;
        if (((char)v25 - 32) > 0x5E
          || (((__int16)v25 >> 8) - 32) > 0x5E
          || ((v25 << 8 >> 24) - 32) > 0x5E
          || ((v25 >> 24) - 32) > 0x5E)
        {
          std::to_string(&v58, mSelector);
        }
        else
        {
          strcpy(&buf[5], "'");
          buf[0] = 39;
          std::string::basic_string[abi:ne180100]<0>(&v58, buf);
        }
        if ((v58.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
          int v26 = &v58;
        }
        else {
          int v26 = (std::string *)v58.__r_.__value_.__r.__words[0];
        }
        AudioObjectPropertyScope mScope = a4->mScope;
        int v28 = bswap32(mScope);
        *(_DWORD *)&buf[1] = v28;
        if (((char)v28 - 32) > 0x5E
          || (((__int16)v28 >> 8) - 32) > 0x5E
          || ((v28 << 8 >> 24) - 32) > 0x5E
          || ((v28 >> 24) - 32) > 0x5E)
        {
          std::to_string(&v57, mScope);
        }
        else
        {
          strcpy(&buf[5], "'");
          buf[0] = 39;
          std::string::basic_string[abi:ne180100]<0>(&v57, buf);
        }
        unint64_t v29 = &v57;
        if ((v57.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
          unint64_t v29 = (std::string *)v57.__r_.__value_.__r.__words[0];
        }
        AudioObjectPropertyElement mElement = a4->mElement;
        *(_DWORD *)std::__split_buffer<std::string> buf = 136316674;
        *(void *)&uint8_t buf[4] = "InCider.mm";
        __int16 v60 = 1024;
        int v61 = 236;
        __int16 v62 = 2080;
        int v63 = v23;
        __int16 v64 = 2080;
        AudioObjectPropertyElement v65 = v26;
        __int16 v66 = 2080;
        *(void *)uint64_t v67 = v29;
        *(_WORD *)&v67[8] = 1024;
        *(_DWORD *)&v67[10] = mElement;
        __int16 v68 = 1024;
        int v69 = v14;
        _os_log_impl(&dword_249BFC000, v16, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Kernel encountered error %s getting property [%s/%s/%u] on device with ID %u", buf, 0x3Cu);
        if (SHIBYTE(v57.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(v57.__r_.__value_.__l.__data_);
        }
        if (SHIBYTE(v58.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(v58.__r_.__value_.__l.__data_);
        }
        if (SHIBYTE(v54.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(v54.__r_.__value_.__l.__data_);
        }
      }

      *__int16 v10 = [MEMORY[0x263F087E8] errorWithDomain:@"ads::Kernel::getPropertyData_TypeRef" code:(int)__val userInfo:0];
      v10[1] = 0;
LABEL_98:
      if (cf) {
        CFRelease(cf);
      }
      goto LABEL_100;
    }
    if ((Class)objc_opt_class() == a5)
    {
      *(void *)std::__split_buffer<std::string> buf = 0;
      CFStringRef v22 = applesauce::CF::TypeRef::operator applesauce::CF::ArrayRef((applesauce::CF::ArrayRef *)&v54, &cf);
      *(void *)std::__split_buffer<std::string> buf = v54.__r_.__value_.__r.__words[0];
      if (!v54.__r_.__value_.__r.__words[0]) {
        goto LABEL_49;
      }
    }
    else
    {
      if ((Class)objc_opt_class() != a5)
      {
        CFStringRef v22 = (objc_class *)objc_opt_class();
        if (v22 != a5) {
          goto LABEL_57;
        }
        *(void *)std::__split_buffer<std::string> buf = 0;
        CFStringRef v22 = applesauce::CF::TypeRef::operator applesauce::CF::StringRef((applesauce::CF::StringRef *)&v54, &cf);
        *(void *)std::__split_buffer<std::string> buf = v54.__r_.__value_.__r.__words[0];
        if (v54.__r_.__value_.__r.__words[0]) {
          goto LABEL_48;
        }
LABEL_49:
        int v31 = 0;
LABEL_50:
        if (v31)
        {
          util::server_log(v22);
          std::string v32 = (id) util::server_log(void)::sLogCat;
          if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
          {
            AudioObjectPropertySelector v33 = a4->mSelector;
            int v34 = bswap32(a4->mSelector);
            *(_DWORD *)&buf[1] = v34;
            if (((char)v34 - 32) > 0x5E
              || (((__int16)v34 >> 8) - 32) > 0x5E
              || ((v34 << 8 >> 24) - 32) > 0x5E
              || ((v34 >> 24) - 32) > 0x5E)
            {
              std::to_string(&v54, v33);
            }
            else
            {
              strcpy(&buf[5], "'");
              buf[0] = 39;
              std::string::basic_string[abi:ne180100]<0>(&v54, buf);
            }
            if ((v54.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
              __int16 v47 = &v54;
            }
            else {
              __int16 v47 = (std::string *)v54.__r_.__value_.__r.__words[0];
            }
            AudioObjectPropertyScope v48 = a4->mScope;
            int v49 = bswap32(v48);
            *(_DWORD *)&buf[1] = v49;
            if (((char)v49 - 32) > 0x5E
              || (((__int16)v49 >> 8) - 32) > 0x5E
              || ((v49 << 8 >> 24) - 32) > 0x5E
              || ((v49 >> 24) - 32) > 0x5E)
            {
              std::to_string(&v58, v48);
            }
            else
            {
              strcpy(&buf[5], "'");
              buf[0] = 39;
              std::string::basic_string[abi:ne180100]<0>(&v58, buf);
            }
            std::string v50 = &v58;
            if ((v58.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
              std::string v50 = (std::string *)v58.__r_.__value_.__r.__words[0];
            }
            AudioObjectPropertyElement v51 = a4->mElement;
            *(_DWORD *)std::__split_buffer<std::string> buf = 136316418;
            *(void *)&uint8_t buf[4] = "InCider.mm";
            __int16 v60 = 1024;
            int v61 = 225;
            __int16 v62 = 2080;
            int v63 = v47;
            __int16 v64 = 2080;
            AudioObjectPropertyElement v65 = v50;
            __int16 v66 = 1024;
            *(_DWORD *)uint64_t v67 = v51;
            *(_WORD *)&v67[4] = 1024;
            *(_DWORD *)&v67[6] = v14;
            _os_log_impl(&dword_249BFC000, v32, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Kernel successfully got property [%s/%s/%u] on device with ID %u", buf, 0x32u);
            if (SHIBYTE(v58.__r_.__value_.__r.__words[2]) < 0) {
              operator delete(v58.__r_.__value_.__l.__data_);
            }
            if (SHIBYTE(v54.__r_.__value_.__r.__words[2]) < 0) {
              operator delete(v54.__r_.__value_.__l.__data_);
            }
          }

          *__int16 v10 = 0;
          v10[1] = (uint64_t)v31;
          goto LABEL_98;
        }
LABEL_57:
        util::server_log(v22);
        AudioObjectPropertySelector v35 = (id) util::server_log(void)::sLogCat;
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
        {
          AudioObjectPropertySelector v36 = a4->mSelector;
          int v37 = bswap32(a4->mSelector);
          *(_DWORD *)((char *)&v58.__r_.__value_.__l.__data_ + 1) = v37;
          if (((char)v37 - 32) > 0x5E
            || (((__int16)v37 >> 8) - 32) > 0x5E
            || ((v37 << 8 >> 24) - 32) > 0x5E
            || ((v37 >> 24) - 32) > 0x5E)
          {
            std::to_string(&v54, v36);
          }
          else
          {
            *(_WORD *)((char *)v58.__r_.__value_.__r.__words + 5) = 39;
            v58.__r_.__value_.__s.__data_[0] = 39;
            std::string::basic_string[abi:ne180100]<0>(&v54, (char *)&v58);
          }
          if ((v54.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
            AudioObjectPropertyScope v38 = &v54;
          }
          else {
            AudioObjectPropertyScope v38 = (std::string *)v54.__r_.__value_.__r.__words[0];
          }
          AudioObjectPropertyScope v39 = a4->mScope;
          int v40 = bswap32(v39);
          *(_DWORD *)((char *)&v57.__r_.__value_.__l.__data_ + 1) = v40;
          if (((char)v40 - 32) > 0x5E
            || (((__int16)v40 >> 8) - 32) > 0x5E
            || ((v40 << 8 >> 24) - 32) > 0x5E
            || ((v40 >> 24) - 32) > 0x5E)
          {
            std::to_string(&v58, v39);
          }
          else
          {
            *(_WORD *)((char *)v57.__r_.__value_.__r.__words + 5) = 39;
            v57.__r_.__value_.__s.__data_[0] = 39;
            std::string::basic_string[abi:ne180100]<0>(&v58, (char *)&v57);
          }
          if ((v58.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
            AudioObjectPropertyElement v41 = &v58;
          }
          else {
            AudioObjectPropertyElement v41 = (std::string *)v58.__r_.__value_.__r.__words[0];
          }
          AudioObjectPropertyElement v42 = a4->mElement;
          NSStringFromClass(a5);
          id v43 = objc_claimAutoreleasedReturnValue();
          uint64_t v44 = [v43 UTF8String];
          *(_DWORD *)std::__split_buffer<std::string> buf = 136316674;
          *(void *)&uint8_t buf[4] = "InCider.mm";
          __int16 v60 = 1024;
          int v61 = 216;
          __int16 v62 = 2080;
          int v63 = v38;
          __int16 v64 = 2080;
          AudioObjectPropertyElement v65 = v41;
          __int16 v66 = 1024;
          *(_DWORD *)uint64_t v67 = v42;
          *(_WORD *)&v67[4] = 2080;
          *(void *)&v67[6] = v44;
          __int16 v68 = 1024;
          int v69 = v14;
          _os_log_impl(&dword_249BFC000, v35, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Error: couldn't convert result for property [%s/%s/%u] to %s on device with ID %u", buf, 0x3Cu);

          if (SHIBYTE(v58.__r_.__value_.__r.__words[2]) < 0) {
            operator delete(v58.__r_.__value_.__l.__data_);
          }
          if (SHIBYTE(v54.__r_.__value_.__r.__words[2]) < 0) {
            operator delete(v54.__r_.__value_.__l.__data_);
          }
        }

        __int16 v45 = (void *)MEMORY[0x263F087E8];
        CFStringRef v46 = NSStringFromSelector(a2);
        *__int16 v10 = [v45 errorWithDomain:v46 code:1970171760 userInfo:0];
        v10[1] = 0;

        goto LABEL_98;
      }
      *(void *)std::__split_buffer<std::string> buf = 0;
      CFStringRef v22 = applesauce::CF::TypeRef::operator applesauce::CF::DictionaryRef((applesauce::CF::DictionaryRef *)&v54, &cf);
      *(void *)std::__split_buffer<std::string> buf = v54.__r_.__value_.__r.__words[0];
      if (!v54.__r_.__value_.__r.__words[0]) {
        goto LABEL_49;
      }
    }
LABEL_48:
    int v31 = v54.__r_.__value_.__l.__data_;
    CFRelease(v31);
    goto LABEL_50;
  }
  util::server_log(0);
  unint64_t v18 = (id) util::server_log(void)::sLogCat;
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    unint64_t v19 = (std::string *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)std::__split_buffer<std::string> buf = 136315650;
    *(void *)&uint8_t buf[4] = "InCider.mm";
    __int16 v60 = 1024;
    int v61 = 180;
    __int16 v62 = 2112;
    int v63 = v19;
    _os_log_impl(&dword_249BFC000, v18, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Pre-kernel CiderObject encountered nil parameter in method %@", buf, 0x1Cu);
  }
  int v20 = (void *)MEMORY[0x263F087E8];
  int v21 = NSStringFromSelector(a2);
  *__int16 v10 = [v20 errorWithDomain:v21 code:1852797029 userInfo:0];
  v10[1] = 0;

LABEL_100:
  result.var1 = v53;
  result.var0 = v52;
  return result;
}

- (void)clearReporterOpts
{
  ptr = self->mRouteSessionAttrsPtr.__ptr_;
  if (*((unsigned char *)ptr + 16))
  {

    *((unsigned char *)ptr + 16) = 0;
    ptr = self->mRouteSessionAttrsPtr.__ptr_;
  }
  if (*((unsigned char *)ptr + 48))
  {

    *((unsigned char *)ptr + 48) = 0;
    ptr = self->mRouteSessionAttrsPtr.__ptr_;
  }
  *((unsigned char *)ptr + 24) = 0;
  *((unsigned char *)ptr + 56) = 0;
}

- (id)init:(shared_ptr<RouteSessionAttributes>)a3
{
  ptr = a3.__ptr_;
  v17.receiver = self;
  v17.super_class = (Class)CiderObject;
  v4 = [(CiderObject *)&v17 init];
  if (!v4) {
    return v4;
  }
  {
    __cxa_atexit((void (*)(void *))std::weak_ptr<ads::Kernel>::~weak_ptr, &util::ref_counted_singleton::get_or_create<ads::Kernel>()::sWeakInstanceRef, &dword_249BFC000);
  }
  if (!qword_26972E498)
  {
    BOOL v6 = 0;
    goto LABEL_8;
  }
  id v5 = std::__shared_weak_count::lock((std::__shared_weak_count *)qword_26972E498);
  BOOL v6 = v5;
  if (!v5 || !util::ref_counted_singleton::get_or_create<ads::Kernel>()::sWeakInstanceRef)
  {
LABEL_8:
    int v8 = (std::__shared_weak_count *)operator new(0x58uLL);
    v8->__shared_owners_ = 0;
    v8->__shared_weak_owners_ = 0;
    v8->__vftable = (std::__shared_weak_count_vtbl *)&unk_26FDCDB80;
    ads::Kernel::Kernel((ads::Kernel *)&v8[1]);
    shared_owners = (std::__shared_weak_count *)v8[1].__shared_owners_;
    if (shared_owners)
    {
      if (shared_owners->__shared_owners_ != -1)
      {
LABEL_13:
        atomic_fetch_add_explicit(&v8->__shared_weak_owners_, 1uLL, memory_order_relaxed);
        __int16 v10 = (std::__shared_weak_count *)qword_26972E498;
        *(void *)&long long v7 = v8 + 1;
        util::ref_counted_singleton::get_or_create<ads::Kernel>()::sWeakInstanceRef = (uint64_t)&v8[1];
        qword_26972E498 = (uint64_t)v8;
        if (v10)
        {
          std::__shared_weak_count::__release_weak(v10);
          *(void *)&long long v7 = v8 + 1;
        }
        *((void *)&v7 + 1) = v8;
        if (v6)
        {
          long long v16 = v7;
          std::__shared_weak_count::__release_shared[abi:ne180100](v6);
          long long v7 = v16;
        }
        goto LABEL_17;
      }
      atomic_fetch_add_explicit(&v8->__shared_owners_, 1uLL, memory_order_relaxed);
      atomic_fetch_add_explicit(&v8->__shared_weak_owners_, 1uLL, memory_order_relaxed);
      v8[1].__vftable = (std::__shared_weak_count_vtbl *)&v8[1];
      v8[1].__shared_owners_ = (uint64_t)v8;
      std::__shared_weak_count::__release_weak(shared_owners);
    }
    else
    {
      atomic_fetch_add_explicit(&v8->__shared_owners_, 1uLL, memory_order_relaxed);
      atomic_fetch_add_explicit(&v8->__shared_weak_owners_, 1uLL, memory_order_relaxed);
      v8[1].__vftable = (std::__shared_weak_count_vtbl *)&v8[1];
      v8[1].__shared_owners_ = (uint64_t)v8;
    }
    std::__shared_weak_count::__release_shared[abi:ne180100](v8);
    goto LABEL_13;
  }
  *(void *)&long long v7 = util::ref_counted_singleton::get_or_create<ads::Kernel>()::sWeakInstanceRef;
  *((void *)&v7 + 1) = v5;
LABEL_17:
  id v11 = (std::__shared_weak_count *)*((void *)v4 + 2);
  *(_OWORD *)(v4 + 8) = v7;
  if (v11) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v11);
  }
  uint64_t v13 = *(void *)ptr;
  uint64_t v12 = *((void *)ptr + 1);
  if (v12) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v12 + 8), 1uLL, memory_order_relaxed);
  }
  int v14 = (std::__shared_weak_count *)*((void *)v4 + 4);
  *((void *)v4 + 3) = v13;
  *((void *)v4 + 4) = v12;
  if (v14) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v14);
  }
  return v4;
}

@end
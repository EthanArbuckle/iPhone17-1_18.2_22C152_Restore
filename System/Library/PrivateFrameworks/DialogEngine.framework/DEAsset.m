@interface DEAsset
+ (id)assetFromPb:(const void *)a3;
+ (int)downloadTypeToPb:(unint64_t)a3;
+ (unint64_t)downloadTypeFromPb:(int)a3;
+ (void)assetToPb:(id)a3 asset:(id)a4 assetPb:(void *)a5;
- (NSData)encryptedVersion;
- (NSData)version;
- (unint64_t)downloadType;
- (unint64_t)encryptedSize;
- (void)setDownloadType:(unint64_t)a3;
- (void)setEncryptedSize:(unint64_t)a3;
- (void)setEncryptedVersion:(id)a3;
- (void)setVersion:(id)a3;
@end

@implementation DEAsset

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_encryptedVersion, 0);
  objc_storeStrong((id *)&self->_version, 0);
}

- (void)setEncryptedSize:(unint64_t)a3
{
  self->_encryptedSize = a3;
}

- (unint64_t)encryptedSize
{
  return self->_encryptedSize;
}

- (void)setDownloadType:(unint64_t)a3
{
  self->_downloadType = a3;
}

- (unint64_t)downloadType
{
  return self->_downloadType;
}

- (void)setEncryptedVersion:(id)a3
{
}

- (NSData)encryptedVersion
{
  return self->_encryptedVersion;
}

- (void)setVersion:(id)a3
{
}

- (NSData)version
{
  return self->_version;
}

+ (void)assetToPb:(id)a3 asset:(id)a4 assetPb:(void *)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = v7;
  v10 = (char *)[v9 UTF8String];
  if (v10)
  {
    *((_DWORD *)a5 + 4) |= 1u;
    std::string::basic_string[abi:ne180100]<0>(__p, v10);
  }
  else
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)__p, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/DialogEngine/updater/CatUpdater.pb.h", 1716);
    v11 = google::protobuf::internal::LogMessage::operator<<(__p, "CHECK failed: value != nullptr: ");
    google::protobuf::internal::LogFinisher::operator=((int)&v23, (const char **)&v11->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&__p[0].__r_.__value_.__l.__data_);
    *((_DWORD *)a5 + 4) |= 1u;
    std::string::basic_string[abi:ne180100]<0>(__p, 0);
  }
  *(void *)&double v12 = google::protobuf::internal::ArenaStringPtr::SetNoArena((uint64_t *)a5 + 3, (uint64_t)&google::protobuf::internal::fixed_address_empty_string, (__n128 *)__p).n128_u64[0];
  if (SHIBYTE(__p[0].__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p[0].__r_.__value_.__l.__data_);
  }
  objc_msgSend(v8, "version", v12);
  id v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)[v13 bytes];
  v15 = [v8 version];
  size_t v16 = [v15 length];
  *((_DWORD *)a5 + 4) |= 2u;
  std::string::basic_string[abi:ne180100](__p, v14, v16);
  google::protobuf::internal::ArenaStringPtr::SetNoArena((uint64_t *)a5 + 4, (uint64_t)&google::protobuf::internal::fixed_address_empty_string, (__n128 *)__p);
  if (SHIBYTE(__p[0].__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p[0].__r_.__value_.__l.__data_);
  }

  id v17 = [v8 encryptedVersion];
  v18 = (void *)[v17 bytes];
  v19 = [v8 encryptedVersion];
  size_t v20 = [v19 length];
  *((_DWORD *)a5 + 4) |= 4u;
  std::string::basic_string[abi:ne180100](__p, v18, v20);
  google::protobuf::internal::ArenaStringPtr::SetNoArena((uint64_t *)a5 + 5, (uint64_t)&google::protobuf::internal::fixed_address_empty_string, (__n128 *)__p);
  if (SHIBYTE(__p[0].__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p[0].__r_.__value_.__l.__data_);
  }

  unsigned int v21 = +[DEAsset downloadTypeToPb:](DEAsset, "downloadTypeToPb:", [v8 downloadType]);
  if (v21 >= 3) {
    __assert_rtn("_internal_set_download_type", "CatUpdater.pb.h", 1840, "::siri::dialogengine::CatUpdater::Asset_DownloadType_IsValid(value)");
  }
  *((_DWORD *)a5 + 4) |= 0x10u;
  *((_DWORD *)a5 + 14) = v21;
  uint64_t v22 = [v8 encryptedSize];
  *((_DWORD *)a5 + 4) |= 8u;
  *((void *)a5 + 6) = v22;
}

+ (id)assetFromPb:(const void *)a3
{
  v4 = (long long *)*((void *)a3 + 4);
  if (*((char *)v4 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(&v17, *(const std::string::value_type **)v4, *((void *)v4 + 1));
  }
  else
  {
    long long v5 = *v4;
    v17.__r_.__value_.__r.__words[2] = *((void *)v4 + 2);
    *(_OWORD *)&v17.__r_.__value_.__l.__data_ = v5;
  }
  v6 = (long long *)*((void *)a3 + 5);
  if (*((char *)v6 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)v6, *((void *)v6 + 1));
  }
  else
  {
    long long v7 = *v6;
    __p.__r_.__value_.__r.__words[2] = *((void *)v6 + 2);
    *(_OWORD *)&__p.__r_.__value_.__l.__data_ = v7;
  }
  id v8 = objc_opt_new();
  if ((v17.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    id v9 = &v17;
  }
  else {
    id v9 = (std::string *)v17.__r_.__value_.__r.__words[0];
  }
  if ((v17.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    std::string::size_type size = HIBYTE(v17.__r_.__value_.__r.__words[2]);
  }
  else {
    std::string::size_type size = v17.__r_.__value_.__l.__size_;
  }
  v11 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytes:length:", v9, size, __p.__r_.__value_.__r.__words[0]);
  [v8 setVersion:v11];

  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    p_p = &__p;
  }
  else {
    p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
  }
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    std::string::size_type v13 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
  }
  else {
    std::string::size_type v13 = __p.__r_.__value_.__l.__size_;
  }
  v14 = [MEMORY[0x1E4F1C9B8] dataWithBytes:p_p length:v13];
  [v8 setEncryptedVersion:v14];

  objc_msgSend(v8, "setDownloadType:", +[DEAsset downloadTypeFromPb:](DEAsset, "downloadTypeFromPb:", *((unsigned int *)a3 + 14)));
  [v8 setEncryptedSize:*((int *)a3 + 12)];
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v17.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v17.__r_.__value_.__l.__data_);
  }
  return v8;
}

+ (unint64_t)downloadTypeFromPb:(int)a3
{
  if (a3 >= 3) {
    return 3;
  }
  else {
    return a3;
  }
}

+ (int)downloadTypeToPb:(unint64_t)a3
{
  if (a3 == 1) {
    int v3 = 1;
  }
  else {
    int v3 = 2;
  }
  if (a3) {
    return v3;
  }
  else {
    return 0;
  }
}

@end
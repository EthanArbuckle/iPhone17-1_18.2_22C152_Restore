@interface DEManifest
+ (id)anyManifestWithContentsOfURL:(id)a3 encrypted:(BOOL)a4;
+ (id)anyManifestWithContentsOfURL:(id)a3 wasEncrypted:(BOOL *)a4;
+ (id)manifestWithContentsOfURL:(id)a3;
+ (id)manifestWithContentsOfURL:(id)a3 encrypted:(BOOL)a4;
+ (id)manifestWithContentsOfURL:(id)a3 encrypted:(BOOL)a4 allowAllKeys:(BOOL)a5 filter:(id)a6;
+ (id)manifestWithContentsOfURL:(id)a3 encrypted:(BOOL)a4 filter:(id)a5;
+ (id)manifestWithContentsOfURL:(id)a3 wasEncrypted:(BOOL *)a4 allowAllKeys:(BOOL)a5 filter:(id)a6;
+ (id)manifestWithContentsOfURL:(id)a3 wasEncrypted:(BOOL *)a4 filter:(id)a5;
- (BOOL)testOnly;
- (BOOL)writeToURL:(id)a3;
- (BOOL)writeToURL:(id)a3 keyId:(unint64_t)a4 privateKey:(id)a5;
- (DEManifest)init;
- (DEManifest)initWithName:(id)a3 contents:(id)a4 summary:(id)a5 dirDownloadType:(unint64_t)a6;
- (DEManifest)initWithName:(id)a3 contents:(id)a4 summary:(id)a5 dirDownloadType:(unint64_t)a6 version:(id)a7 keyVersion:(id)a8;
- (NSData)keyVersion;
- (NSData)summary;
- (NSData)version;
- (NSDictionary)contents;
- (NSString)name;
- (NSURL)downloadURLPrefix;
- (NSURL)publicationURL;
- (unint64_t)dirDownloadType;
- (void)setContents:(id)a3;
- (void)setDirDownloadType:(unint64_t)a3;
- (void)setDownloadURLPrefix:(id)a3;
- (void)setKeyVersion:(id)a3;
- (void)setName:(id)a3;
- (void)setPublicationURL:(id)a3;
- (void)setSummary:(id)a3;
- (void)setTestOnly:(BOOL)a3;
- (void)setVersion:(id)a3;
@end

@implementation DEManifest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_downloadURLPrefix, 0);
  objc_storeStrong((id *)&self->_publicationURL, 0);
  objc_storeStrong((id *)&self->_keyVersion, 0);
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_summary, 0);
  objc_storeStrong((id *)&self->_contents, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (void)setTestOnly:(BOOL)a3
{
  self->_testOnly = a3;
}

- (BOOL)testOnly
{
  return self->_testOnly;
}

- (void)setDownloadURLPrefix:(id)a3
{
}

- (NSURL)downloadURLPrefix
{
  return self->_downloadURLPrefix;
}

- (void)setPublicationURL:(id)a3
{
}

- (NSURL)publicationURL
{
  return self->_publicationURL;
}

- (void)setDirDownloadType:(unint64_t)a3
{
  self->_dirDownloadType = a3;
}

- (unint64_t)dirDownloadType
{
  return self->_dirDownloadType;
}

- (void)setKeyVersion:(id)a3
{
}

- (NSData)keyVersion
{
  return self->_keyVersion;
}

- (void)setVersion:(id)a3
{
}

- (NSData)version
{
  return self->_version;
}

- (void)setSummary:(id)a3
{
}

- (NSData)summary
{
  return self->_summary;
}

- (void)setContents:(id)a3
{
}

- (NSDictionary)contents
{
  return self->_contents;
}

- (void)setName:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (BOOL)writeToURL:(id)a3
{
  return [(DEManifest *)self writeToURL:a3 keyId:0 privateKey:0];
}

- (BOOL)writeToURL:(id)a3 keyId:(unint64_t)a4 privateKey:(id)a5
{
  uint64_t v73 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v50 = a5;
  v51 = v7;
  if (!v7)
  {
    +[DELog error:@"Unexpected nil in Manifest:writeToURL"];
    BOOL v10 = 0;
    goto LABEL_70;
  }
  siri::dialogengine::CatUpdater::Manifest::Manifest((siri::dialogengine::CatUpdater::Manifest *)v58);
  name = self->_name;
  if (name)
  {
    v9 = [(NSString *)name UTF8String];
    if (v9)
    {
      v59 |= 2u;
      std::string::basic_string[abi:ne180100]<0>(__p, v9);
    }
    else
    {
      google::protobuf::internal::LogMessage::LogMessage((uint64_t)__p, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/DialogEngine/updater/CatUpdater.pb.h", 2100);
      v11 = google::protobuf::internal::LogMessage::operator<<(__p, "CHECK failed: value != nullptr: ");
      google::protobuf::internal::LogFinisher::operator=((int)&v70, (const char **)&v11->__r_.__value_.__l.__data_);
      google::protobuf::internal::LogMessage::~LogMessage((void **)&__p[0].__r_.__value_.__l.__data_);
      v59 |= 2u;
      std::string::basic_string[abi:ne180100]<0>(__p, 0);
    }
    google::protobuf::internal::ArenaStringPtr::SetNoArena(&v65, (uint64_t)&google::protobuf::internal::fixed_address_empty_string, (__n128 *)__p);
    if (SHIBYTE(__p[0].__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p[0].__r_.__value_.__l.__data_);
    }
  }
  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  v12 = self->_contents;
  uint64_t v13 = [(NSDictionary *)v12 countByEnumeratingWithState:&v54 objects:v72 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v55;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v55 != v14) {
          objc_enumerationMutation(v12);
        }
        uint64_t v16 = *(void *)(*((void *)&v54 + 1) + 8 * i);
        v17 = [(NSDictionary *)self->_contents objectForKey:v16];
        v18 = v17;
        if (v17)
        {
          v19 = [v17 version];
          BOOL v20 = v19 == 0;

          if (!v20)
          {
            v21 = v63;
            if (v63)
            {
              uint64_t v22 = v61;
              int v23 = *v63;
              if (v61 < *v63)
              {
                ++v61;
                v24 = *(siri::dialogengine::CatUpdater::Asset **)&v63[2 * v22 + 2];
LABEL_23:
                +[DEAsset assetToPb:v16 asset:v18 assetPb:v24];
                goto LABEL_24;
              }
              if (v23 == v62)
              {
LABEL_21:
                google::protobuf::internal::RepeatedPtrFieldBase::Reserve((unsigned int *)&v60, v23 + 1);
                v21 = v63;
                int v23 = *v63;
              }
              _DWORD *v21 = v23 + 1;
              v24 = google::protobuf::Arena::CreateMaybeMessage<siri::dialogengine::CatUpdater::Asset>(v60);
              uint64_t v25 = v61++;
              *(void *)&v63[2 * v25 + 2] = v24;
              goto LABEL_23;
            }
            int v23 = v62;
            goto LABEL_21;
          }
        }
LABEL_24:
      }
      uint64_t v13 = [(NSDictionary *)v12 countByEnumeratingWithState:&v54 objects:v72 count:16];
    }
    while (v13);
  }

  summary = self->_summary;
  if (summary)
  {
    v27 = [(NSData *)summary bytes];
    size_t v28 = [(NSData *)self->_summary length];
    v59 |= 1u;
    std::string::basic_string[abi:ne180100](__p, v27, v28);
    google::protobuf::internal::ArenaStringPtr::SetNoArena(&v64, (uint64_t)&google::protobuf::internal::fixed_address_empty_string, (__n128 *)__p);
    if (SHIBYTE(__p[0].__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p[0].__r_.__value_.__l.__data_);
    }
  }
  unint64_t dirDownloadType = self->_dirDownloadType;
  v59 |= 0x10u;
  if (dirDownloadType == 3)
  {
    char v68 = 0;
  }
  else
  {
    char v68 = 1;
    unsigned int v30 = +[DEAsset downloadTypeToPb:](DEAsset, "downloadTypeToPb:");
    if (v30 >= 3) {
      __assert_rtn("_internal_set_dir_download_type", "CatUpdater.pb.h", 2181, "::siri::dialogengine::CatUpdater::Asset_DownloadType_IsValid(value)");
    }
    v59 |= 0x20u;
    unsigned int v69 = v30;
  }
  publicationURL = self->_publicationURL;
  if (publicationURL)
  {
    id v32 = [(NSURL *)publicationURL absoluteString];
    v33 = (char *)[v32 UTF8String];
    if (v33)
    {
      v59 |= 4u;
      std::string::basic_string[abi:ne180100]<0>(__p, v33);
    }
    else
    {
      google::protobuf::internal::LogMessage::LogMessage((uint64_t)__p, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/DialogEngine/updater/CatUpdater.pb.h", 2228);
      v34 = google::protobuf::internal::LogMessage::operator<<(__p, "CHECK failed: value != nullptr: ");
      google::protobuf::internal::LogFinisher::operator=((int)&v70, (const char **)&v34->__r_.__value_.__l.__data_);
      google::protobuf::internal::LogMessage::~LogMessage((void **)&__p[0].__r_.__value_.__l.__data_);
      v59 |= 4u;
      std::string::basic_string[abi:ne180100]<0>(__p, 0);
    }
    google::protobuf::internal::ArenaStringPtr::SetNoArena(&v66, (uint64_t)&google::protobuf::internal::fixed_address_empty_string, (__n128 *)__p);
    if (SHIBYTE(__p[0].__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p[0].__r_.__value_.__l.__data_);
    }
  }
  downloadURLPrefix = self->_downloadURLPrefix;
  if (downloadURLPrefix)
  {
    id v36 = [(NSURL *)downloadURLPrefix absoluteString];
    v37 = (char *)[v36 UTF8String];
    if (v37)
    {
      v59 |= 8u;
      std::string::basic_string[abi:ne180100]<0>(__p, v37);
    }
    else
    {
      google::protobuf::internal::LogMessage::LogMessage((uint64_t)__p, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/DialogEngine/updater/CatUpdater.pb.h", 2299);
      v38 = google::protobuf::internal::LogMessage::operator<<(__p, "CHECK failed: value != nullptr: ");
      google::protobuf::internal::LogFinisher::operator=((int)&v70, (const char **)&v38->__r_.__value_.__l.__data_);
      google::protobuf::internal::LogMessage::~LogMessage((void **)&__p[0].__r_.__value_.__l.__data_);
      v59 |= 8u;
      std::string::basic_string[abi:ne180100]<0>(__p, 0);
    }
    google::protobuf::internal::ArenaStringPtr::SetNoArena(&v67, (uint64_t)&google::protobuf::internal::fixed_address_empty_string, (__n128 *)__p);
    if (SHIBYTE(__p[0].__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p[0].__r_.__value_.__l.__data_);
    }
  }
  memset(__p, 0, 24);
  if (google::protobuf::MessageLite::SerializeToString(v58, __p))
  {
    if ((__p[0].__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      v39 = __p;
    }
    else {
      v39 = (std::string *)__p[0].__r_.__value_.__r.__words[0];
    }
    if ((__p[0].__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      std::string::size_type size = HIBYTE(__p[0].__r_.__value_.__r.__words[2]);
    }
    else {
      std::string::size_type size = __p[0].__r_.__value_.__l.__size_;
    }
    v41 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v39 length:size];
    v42 = v41;
    if (!a4)
    {
      id v53 = 0;
      char v47 = [v41 writeToURL:v51 options:0 error:&v53];
      id v46 = v53;
      if (v47)
      {
        BOOL v10 = 1;
      }
      else
      {
        +[DELog error:@"Failed to write manifest at \"%@\": %@", v51, v46];
        BOOL v10 = 0;
      }
      goto LABEL_66;
    }
    v43 = +[DEEncrypted encrypt:v41 keyId:a4 privateKey:v50 multipart:1];
    v44 = v43;
    if (v43)
    {
      id v52 = 0;
      char v45 = [v43 writeToURL:v51 options:0 error:&v52];
      id v46 = v52;
      if (v45)
      {
        BOOL v10 = 1;
LABEL_64:

LABEL_66:
        goto LABEL_67;
      }
      +[DELog error:@"Failed to write manifest at \"%@\": %@", v51, v46];
    }
    else
    {
      id v46 = 0;
      +[DELog error:@"Failed to encrypt data to write manifest to \"%@\"", v51];
    }
    BOOL v10 = 0;
    goto LABEL_64;
  }
  +[DELog error:@"Failed to serialize data to write manifest to \"%@\"", v51];
  BOOL v10 = 0;
LABEL_67:
  if (SHIBYTE(__p[0].__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p[0].__r_.__value_.__l.__data_);
  }
  siri::dialogengine::CatUpdater::Manifest::~Manifest((siri::dialogengine::CatUpdater::Manifest *)v58);
LABEL_70:

  return v10;
}

- (DEManifest)init
{
  return [(DEManifest *)self initWithName:0 contents:0 summary:0 dirDownloadType:3 version:0 keyVersion:0];
}

- (DEManifest)initWithName:(id)a3 contents:(id)a4 summary:(id)a5 dirDownloadType:(unint64_t)a6
{
  return [(DEManifest *)self initWithName:a3 contents:a4 summary:a5 dirDownloadType:a6 version:0 keyVersion:0];
}

- (DEManifest)initWithName:(id)a3 contents:(id)a4 summary:(id)a5 dirDownloadType:(unint64_t)a6 version:(id)a7 keyVersion:(id)a8
{
  id v14 = a3;
  id v24 = a4;
  id v23 = a5;
  id v15 = a7;
  id v16 = a8;
  v25.receiver = self;
  v25.super_class = (Class)DEManifest;
  v17 = [(DEManifest *)&v25 init];
  if (v17)
  {
    if (!v14) {
      +[DELog debug:@"Creating manifest without name"];
    }
    objc_storeStrong((id *)&v17->_name, a3);
    objc_storeStrong((id *)&v17->_contents, a4);
    objc_storeStrong((id *)&v17->_summary, a5);
    v17->_unint64_t dirDownloadType = a6;
    objc_storeStrong((id *)&v17->_version, a7);
    objc_storeStrong((id *)&v17->_keyVersion, a8);
    publicationURL = v17->_publicationURL;
    v17->_publicationURL = 0;

    downloadURLPrefix = v17->_downloadURLPrefix;
    v17->_downloadURLPrefix = 0;

    v17->_testOnly = 0;
    BOOL v20 = v17;
  }

  return v17;
}

+ (id)manifestWithContentsOfURL:(id)a3
{
  v3 = +[DEManifest manifestWithContentsOfURL:a3 wasEncrypted:0 allowAllKeys:0 filter:0];
  return v3;
}

+ (id)anyManifestWithContentsOfURL:(id)a3 wasEncrypted:(BOOL *)a4
{
  v4 = +[DEManifest manifestWithContentsOfURL:a3 wasEncrypted:a4 allowAllKeys:1 filter:0];
  return v4;
}

+ (id)manifestWithContentsOfURL:(id)a3 wasEncrypted:(BOOL *)a4 filter:(id)a5
{
  v5 = +[DEManifest manifestWithContentsOfURL:a3 wasEncrypted:a4 allowAllKeys:0 filter:a5];
  return v5;
}

+ (id)manifestWithContentsOfURL:(id)a3 wasEncrypted:(BOOL *)a4 allowAllKeys:(BOOL)a5 filter:(id)a6
{
  BOOL v7 = a5;
  id v9 = a3;
  id v10 = a6;
  uint64_t v11 = +[DEManifest manifestWithContentsOfURL:v9 encrypted:0 allowAllKeys:v7 filter:v10];
  v12 = (void *)v11;
  if (!v11)
  {
    v12 = +[DEManifest manifestWithContentsOfURL:v9 encrypted:1 allowAllKeys:v7 filter:v10];
  }
  if (a4 && v12) {
    *a4 = v11 == 0;
  }

  return v12;
}

+ (id)manifestWithContentsOfURL:(id)a3 encrypted:(BOOL)a4
{
  v4 = +[DEManifest manifestWithContentsOfURL:a3 encrypted:a4 allowAllKeys:0 filter:0];
  return v4;
}

+ (id)manifestWithContentsOfURL:(id)a3 encrypted:(BOOL)a4 filter:(id)a5
{
  v5 = +[DEManifest manifestWithContentsOfURL:a3 encrypted:a4 allowAllKeys:0 filter:a5];
  return v5;
}

+ (id)anyManifestWithContentsOfURL:(id)a3 encrypted:(BOOL)a4
{
  v4 = +[DEManifest manifestWithContentsOfURL:a3 encrypted:a4 allowAllKeys:1 filter:0];
  return v4;
}

+ (id)manifestWithContentsOfURL:(id)a3 encrypted:(BOOL)a4 allowAllKeys:(BOOL)a5 filter:(id)a6
{
  BOOL v7 = a5;
  BOOL v8 = a4;
  id v9 = a3;
  id v10 = a6;
  if (!v9)
  {
    +[DELog error:@"Unexpected nil src in Manifest:manifestWithContentsOfURL"];
    id v15 = 0;
    goto LABEL_42;
  }
  v38[0] = 0;
  uint64_t v11 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v9 options:0 error:v38];
  id v12 = v38[0];
  if (v12 || !v11)
  {
    if (v12) {
      +[DELog error:@"Failed to read manifest file at \"%@\": %@", v9, v12];
    }
    else {
      +[DELog error:@"Failed to read manifest file at \"%@\"", v9];
    }
    id v15 = 0;
    goto LABEL_41;
  }
  if (!v8)
  {
    id v14 = 0;
    goto LABEL_11;
  }
  id v37 = 0;
  uint64_t v13 = +[DEEncrypted decrypt:v11 allowAllKeys:v7 keyVersion:&v37];
  id v14 = v37;

  if (v13)
  {
    uint64_t v11 = (void *)v13;
LABEL_11:
    id v16 = objc_opt_new();
    siri::dialogengine::CatUpdater::Manifest::Manifest((siri::dialogengine::CatUpdater::Manifest *)v31);
    id v17 = v11;
    std::string::basic_string[abi:ne180100](__p, (void *)[v17 bytes], objc_msgSend(v17, "length"));
    if (google::protobuf::MessageLite::ParseFromString(v31, __p))
    {
      id v28 = v14;
      if ((v32 & 2) != 0)
      {
        v27 = objc_msgSend(NSString, "stringWithUTF8String:");
      }
      else
      {
        +[DELog debug:@"Failed find name in manifest file at \"%@\"", v9];
        v27 = 0;
      }
      if (v34 >= 1)
      {
        for (int i = 0; i < v34; ++i)
        {
          v19 = NSString;
          BOOL v20 = *(uint64_t **)(google::protobuf::internal::RepeatedPtrFieldBase::Get<google::protobuf::RepeatedPtrField<siri::dialogengine::CatUpdater::Asset>::TypeHandler>((uint64_t)&v33, i)+ 24);
          if (*((char *)v20 + 23) < 0) {
            BOOL v20 = (uint64_t *)*v20;
          }
          v21 = [v19 stringWithUTF8String:v20];
          if (!v10 || ([v10 allows:v21] & 1) != 0)
          {
            uint64_t v22 = +[DEAsset assetFromPb:google::protobuf::internal::RepeatedPtrFieldBase::Get<google::protobuf::RepeatedPtrField<siri::dialogengine::CatUpdater::Asset>::TypeHandler>((uint64_t)&v33, i)];
            [v16 setObject:v22 forKey:v21];
          }
        }
      }
      if (v32)
      {
        id v23 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytes:length:");
      }
      else
      {
        id v23 = 0;
      }
      if (v35) {
        unint64_t v24 = +[DEAsset downloadTypeFromPb:v36];
      }
      else {
        unint64_t v24 = 3;
      }
      objc_super v25 = +[DEVersionWriter versionData:v17];
      if (v25) {
        id v15 = [[DEManifest alloc] initWithName:v27 contents:v16 summary:v23 dirDownloadType:v24 version:v25 keyVersion:v28];
      }
      else {
        id v15 = 0;
      }

      id v12 = 0;
      id v14 = v28;
    }
    else
    {
      id v15 = 0;
    }
    if (v30 < 0) {
      operator delete(__p[0]);
    }
    siri::dialogengine::CatUpdater::Manifest::~Manifest((siri::dialogengine::CatUpdater::Manifest *)v31);

    goto LABEL_40;
  }
  +[DELog error:@"Failed decrypt of manifest file at \"%@\"", v9];
  id v17 = 0;
  id v15 = 0;
LABEL_40:

  uint64_t v11 = v17;
LABEL_41:

LABEL_42:
  return v15;
}

@end
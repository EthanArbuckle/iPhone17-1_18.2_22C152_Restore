@interface DEMatchCriteria
+ (id)matchCriteriaFromPb:(const void *)a3;
+ (void)matchCriteriaToPb:(id)a3 matchCriteriaPb:(void *)a4;
- (BOOL)all:(id)a3;
- (BOOL)any:(id)a3;
- (BOOL)isEqual:(id)a3;
- (DEMatchCriteria)init;
- (DEMatchCriteria)initWithPrefixes:(id)a3 suffixes:(id)a4;
- (NSArray)prefixes;
- (NSArray)suffixes;
- (void)setPrefixes:(id)a3;
- (void)setSuffixes:(id)a3;
@end

@implementation DEMatchCriteria

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suffixes, 0);
  objc_storeStrong((id *)&self->_prefixes, 0);
}

- (void)setSuffixes:(id)a3
{
}

- (NSArray)suffixes
{
  return self->_suffixes;
}

- (void)setPrefixes:(id)a3
{
}

- (NSArray)prefixes
{
  return self->_prefixes;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (DEMatchCriteria *)a3;
  if (self == v4)
  {
    char v16 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      prefixes = self->_prefixes;
      v7 = [(DEMatchCriteria *)v5 prefixes];
      LOBYTE(prefixes) = (prefixes != 0) ^ (v7 == 0);

      if ((prefixes & 1) == 0) {
        goto LABEL_11;
      }
      suffixes = self->_suffixes;
      v9 = [(DEMatchCriteria *)v5 suffixes];
      BOOL v10 = v9 == 0;

      if ((suffixes != 0) == v10
        || (v11 = self->_prefixes) != 0
        && ([(DEMatchCriteria *)v5 prefixes],
            v12 = objc_claimAutoreleasedReturnValue(),
            BOOL v13 = [(NSArray *)v11 isEqualToArray:v12],
            v12,
            !v13))
      {
LABEL_11:
        char v16 = 0;
      }
      else
      {
        v14 = self->_suffixes;
        if (v14)
        {
          v15 = [(DEMatchCriteria *)v5 suffixes];
          char v16 = [(NSArray *)v14 isEqualToArray:v15];
        }
        else
        {
          char v16 = 1;
        }
      }
    }
    else
    {
      char v16 = 0;
    }
  }

  return v16;
}

- (BOOL)all:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  prefixes = self->_prefixes;
  if (prefixes && [(NSArray *)prefixes count])
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    v6 = self->_prefixes;
    uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v19 objects:v24 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v20;
      while (2)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v20 != v8) {
            objc_enumerationMutation(v6);
          }
          if (*(void *)(*((void *)&v19 + 1) + 8 * i) && (objc_msgSend(v4, "hasPrefix:") & 1) != 0)
          {

            goto LABEL_14;
          }
        }
        uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v19 objects:v24 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
    LOBYTE(v10) = 0;
    goto LABEL_28;
  }
LABEL_14:
  suffixes = self->_suffixes;
  if (suffixes && [(NSArray *)suffixes count])
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    v6 = self->_suffixes;
    uint64_t v10 = [(NSArray *)v6 countByEnumeratingWithState:&v15 objects:v23 count:16];
    if (v10)
    {
      uint64_t v12 = *(void *)v16;
      while (2)
      {
        for (uint64_t j = 0; j != v10; ++j)
        {
          if (*(void *)v16 != v12) {
            objc_enumerationMutation(v6);
          }
          if (*(void *)(*((void *)&v15 + 1) + 8 * j) && ([v4 hasSuffix:(void)v15] & 1) != 0)
          {
            LOBYTE(v10) = 1;
            goto LABEL_28;
          }
        }
        uint64_t v10 = [(NSArray *)v6 countByEnumeratingWithState:&v15 objects:v23 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }
LABEL_28:

    goto LABEL_29;
  }
  LOBYTE(v10) = 1;
LABEL_29:

  return v10;
}

- (BOOL)any:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    LOBYTE(v9) = 0;
    goto LABEL_24;
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v5 = self->_prefixes;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v17 objects:v22 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v18;
LABEL_4:
    uint64_t v8 = 0;
    while (1)
    {
      if (*(void *)v18 != v7) {
        objc_enumerationMutation(v5);
      }
      if (*(void *)(*((void *)&v17 + 1) + 8 * v8) && (objc_msgSend(v4, "hasPrefix:") & 1) != 0) {
        goto LABEL_21;
      }
      if (v6 == ++v8)
      {
        uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v17 objects:v22 count:16];
        if (v6) {
          goto LABEL_4;
        }
        break;
      }
    }
  }

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v5 = self->_suffixes;
  uint64_t v9 = [(NSArray *)v5 countByEnumeratingWithState:&v13 objects:v21 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v14;
LABEL_13:
    uint64_t v11 = 0;
    while (1)
    {
      if (*(void *)v14 != v10) {
        objc_enumerationMutation(v5);
      }
      if (*(void *)(*((void *)&v13 + 1) + 8 * v11) && ([v4 hasSuffix:(void)v13] & 1) != 0) {
        break;
      }
      if (v9 == ++v11)
      {
        uint64_t v9 = [(NSArray *)v5 countByEnumeratingWithState:&v13 objects:v21 count:16];
        if (v9) {
          goto LABEL_13;
        }
        goto LABEL_22;
      }
    }
LABEL_21:
    LOBYTE(v9) = 1;
  }
LABEL_22:

LABEL_24:
  return v9;
}

- (DEMatchCriteria)init
{
  return [(DEMatchCriteria *)self initWithPrefixes:0 suffixes:0];
}

- (DEMatchCriteria)initWithPrefixes:(id)a3 suffixes:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)DEMatchCriteria;
  uint64_t v9 = [(DEMatchCriteria *)&v13 init];
  uint64_t v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_prefixes, a3);
    objc_storeStrong((id *)&v10->_suffixes, a4);
    uint64_t v11 = v10;
  }

  return v10;
}

+ (void)matchCriteriaToPb:(id)a3 matchCriteriaPb:(void *)a4
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5) {
    goto LABEL_46;
  }
  uint64_t v6 = v5;
  id v38 = v5;
  id v7 = [v5 prefixes];

  if (!v7) {
    goto LABEL_24;
  }
  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v8 = [v6 prefixes];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v43 objects:v50 count:16];
  if (!v9) {
    goto LABEL_23;
  }
  uint64_t v10 = *(void *)v44;
  uint64_t v11 = (uint64_t *)((char *)a4 + 24);
  do
  {
    for (uint64_t i = 0; i != v9; ++i)
    {
      if (*(void *)v44 != v10) {
        objc_enumerationMutation(v8);
      }
      uint64_t v13 = [*(id *)(*((void *)&v43 + 1) + 8 * i) UTF8String];
      if (!v13)
      {
        google::protobuf::internal::LogMessage::LogMessage((uint64_t)v48, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/DialogEngine/updater/CatUpdater.pb.h", 2604);
        long long v14 = google::protobuf::internal::LogMessage::operator<<(v48, "CHECK failed: value != nullptr: ");
        google::protobuf::internal::LogFinisher::operator=((int)&v47, (const char **)&v14->__r_.__value_.__l.__data_);
        google::protobuf::internal::LogMessage::~LogMessage((void **)&v48[0].__r_.__value_.__l.__data_);
      }
      long long v15 = (int *)*((void *)a4 + 5);
      if (!v15)
      {
        int v17 = *((_DWORD *)a4 + 9);
LABEL_15:
        google::protobuf::internal::RepeatedPtrFieldBase::Reserve((unsigned int *)a4 + 6, v17 + 1);
        long long v15 = (int *)*((void *)a4 + 5);
        int v17 = *v15;
        goto LABEL_16;
      }
      uint64_t v16 = *((int *)a4 + 8);
      int v17 = *v15;
      if ((int)v16 < *v15)
      {
        *((_DWORD *)a4 + 8) = v16 + 1;
        AlignedAndAddCleanup = *(void **)&v15[2 * v16 + 2];
        goto LABEL_21;
      }
      if (v17 == *((_DWORD *)a4 + 9)) {
        goto LABEL_15;
      }
LABEL_16:
      int *v15 = v17 + 1;
      long long v19 = (atomic_ullong *)*v11;
      if (!*v11) {
        operator new();
      }
      if (v19[14]) {
      AlignedAndAddCleanup = google::protobuf::internal::ArenaImpl::AllocateAlignedAndAddCleanup(v19, 0x18uLL, (void (*)(void *))google::protobuf::internal::arena_destruct_object<std::string>);
      }
      void *AlignedAndAddCleanup = 0;
      AlignedAndAddCleanup[1] = 0;
      AlignedAndAddCleanup[2] = 0;
      uint64_t v20 = *((void *)a4 + 5);
      uint64_t v21 = *((int *)a4 + 8);
      *((_DWORD *)a4 + 8) = v21 + 1;
      *(void *)(v20 + 8 * v21 + 8) = AlignedAndAddCleanup;
LABEL_21:
      MEMORY[0x1C8796900](AlignedAndAddCleanup, v13);
    }
    uint64_t v9 = [v8 countByEnumeratingWithState:&v43 objects:v50 count:16];
  }
  while (v9);
LABEL_23:

  uint64_t v6 = v38;
LABEL_24:
  long long v22 = [v6 suffixes];
  BOOL v23 = v22 == 0;

  id v5 = v38;
  if (!v23)
  {
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    v24 = [v38 suffixes];
    uint64_t v25 = [v24 countByEnumeratingWithState:&v39 objects:v49 count:16];
    if (!v25) {
      goto LABEL_45;
    }
    uint64_t v26 = *(void *)v40;
    v27 = (uint64_t *)((char *)a4 + 48);
    while (1)
    {
      for (uint64_t j = 0; j != v25; ++j)
      {
        if (*(void *)v40 != v26) {
          objc_enumerationMutation(v24);
        }
        uint64_t v29 = [*(id *)(*((void *)&v39 + 1) + 8 * j) UTF8String];
        if (!v29)
        {
          google::protobuf::internal::LogMessage::LogMessage((uint64_t)v48, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/DialogEngine/updater/CatUpdater.pb.h", 2678);
          v30 = google::protobuf::internal::LogMessage::operator<<(v48, "CHECK failed: value != nullptr: ");
          google::protobuf::internal::LogFinisher::operator=((int)&v47, (const char **)&v30->__r_.__value_.__l.__data_);
          google::protobuf::internal::LogMessage::~LogMessage((void **)&v48[0].__r_.__value_.__l.__data_);
        }
        v31 = (int *)*((void *)a4 + 8);
        if (!v31)
        {
          int v33 = *((_DWORD *)a4 + 15);
LABEL_37:
          google::protobuf::internal::RepeatedPtrFieldBase::Reserve((unsigned int *)a4 + 12, v33 + 1);
          v31 = (int *)*((void *)a4 + 8);
          int v33 = *v31;
          goto LABEL_38;
        }
        uint64_t v32 = *((int *)a4 + 14);
        int v33 = *v31;
        if ((int)v32 < *v31)
        {
          *((_DWORD *)a4 + 14) = v32 + 1;
          v34 = *(void **)&v31[2 * v32 + 2];
          goto LABEL_43;
        }
        if (v33 == *((_DWORD *)a4 + 15)) {
          goto LABEL_37;
        }
LABEL_38:
        int *v31 = v33 + 1;
        v35 = (atomic_ullong *)*v27;
        if (!*v27) {
          operator new();
        }
        if (v35[14]) {
        v34 = google::protobuf::internal::ArenaImpl::AllocateAlignedAndAddCleanup(v35, 0x18uLL, (void (*)(void *))google::protobuf::internal::arena_destruct_object<std::string>);
        }
        void *v34 = 0;
        v34[1] = 0;
        v34[2] = 0;
        uint64_t v36 = *((void *)a4 + 8);
        uint64_t v37 = *((int *)a4 + 14);
        *((_DWORD *)a4 + 14) = v37 + 1;
        *(void *)(v36 + 8 * v37 + 8) = v34;
LABEL_43:
        MEMORY[0x1C8796900](v34, v29);
      }
      uint64_t v25 = [v24 countByEnumeratingWithState:&v39 objects:v49 count:16];
      if (!v25)
      {
LABEL_45:

        id v5 = v38;
        break;
      }
    }
  }
LABEL_46:
}

+ (id)matchCriteriaFromPb:(const void *)a3
{
  if (*((int *)a3 + 8) < 1)
  {
    uint64_t v5 = 0;
  }
  else
  {
    int v4 = 0;
    uint64_t v5 = 0;
    do
    {
      if (!v5) {
        uint64_t v5 = objc_opt_new();
      }
      uint64_t v6 = NSString;
      uint64_t v7 = google::protobuf::internal::RepeatedPtrFieldBase::Get<google::protobuf::RepeatedPtrField<std::string>::TypeHandler>((uint64_t)a3 + 24, v4);
      if (*(char *)(v7 + 23) >= 0) {
        uint64_t v8 = v7;
      }
      else {
        uint64_t v8 = *(void *)v7;
      }
      uint64_t v9 = [v6 stringWithUTF8String:v8];
      [(id)v5 addObject:v9];

      ++v4;
    }
    while (v4 < *((_DWORD *)a3 + 8));
  }
  if (*((int *)a3 + 14) < 1)
  {
    uint64_t v11 = 0;
  }
  else
  {
    int v10 = 0;
    uint64_t v11 = 0;
    do
    {
      if (!v11) {
        uint64_t v11 = objc_opt_new();
      }
      uint64_t v12 = NSString;
      uint64_t v13 = google::protobuf::internal::RepeatedPtrFieldBase::Get<google::protobuf::RepeatedPtrField<std::string>::TypeHandler>((uint64_t)a3 + 48, v10);
      if (*(char *)(v13 + 23) >= 0) {
        uint64_t v14 = v13;
      }
      else {
        uint64_t v14 = *(void *)v13;
      }
      long long v15 = [v12 stringWithUTF8String:v14];
      [(id)v11 addObject:v15];

      ++v10;
    }
    while (v10 < *((_DWORD *)a3 + 14));
  }
  if (v5 | v11) {
    uint64_t v16 = [[DEMatchCriteria alloc] initWithPrefixes:v5 suffixes:v11];
  }
  else {
    uint64_t v16 = 0;
  }

  return v16;
}

@end
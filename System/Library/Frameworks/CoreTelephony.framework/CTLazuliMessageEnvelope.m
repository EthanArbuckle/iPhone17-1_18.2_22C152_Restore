@interface CTLazuliMessageEnvelope
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToCTLazuliMessageEnvelope:(id)a3;
- (CTLazuliDestination)from;
- (CTLazuliMessageEnvelope)initWithCoder:(id)a3;
- (CTLazuliMessageEnvelope)initWithReflection:(const void *)a3;
- (CTLazuliMessageID)messageID;
- (id)content;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)type;
- (void)encodeWithCoder:(id)a3;
- (void)setContent:(id)a3;
- (void)setFrom:(id)a3;
- (void)setMessageID:(id)a3;
- (void)setType:(int64_t)a3;
@end

@implementation CTLazuliMessageEnvelope

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@", objc_opt_class()];
  int64_t v4 = [(CTLazuliMessageEnvelope *)self type];
  int64_t v8 = [(CTLazuliMessageEnvelope *)self type];
  [v3 appendFormat:@", type = [%ld - %s]", v4, print_CTLazuliMessageType(&v8)];
  v5 = [(CTLazuliMessageEnvelope *)self from];
  [v3 appendFormat:@", from = %@", v5];

  v6 = [(CTLazuliMessageEnvelope *)self messageID];
  [v3 appendFormat:@", messageID = %@", v6];

  [v3 appendFormat:@", content {%@} = %@", objc_opt_class(), self->_content];
  [v3 appendString:@">"];

  return v3;
}

- (BOOL)isEqualToCTLazuliMessageEnvelope:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(CTLazuliMessageEnvelope *)self type];
  if (v5 != [v4 type]) {
    goto LABEL_6;
  }
  v6 = [(CTLazuliMessageEnvelope *)self from];
  v7 = [v4 from];
  char v8 = [v6 isEqualToCTLazuliDestination:v7];

  if ((v8 & 1) == 0) {
    goto LABEL_6;
  }
  v9 = [(CTLazuliMessageEnvelope *)self messageID];
  v10 = [v4 messageID];
  char v11 = [v9 isEqualToCTLazuliMessageID:v10];

  if (v11)
  {
    switch(self->_type)
    {
      case 0:
        v12 = [(CTLazuliMessageEnvelope *)self content];
        v13 = [v4 content];
        char v14 = [v12 isEqualToCTLazuliMessageText:v13];
        goto LABEL_17;
      case 1:
        v12 = [(CTLazuliMessageEnvelope *)self content];
        v13 = [v4 content];
        char v14 = [v12 isEqualToCTLazuliMessageGroupText:v13];
        goto LABEL_17;
      case 2:
        v12 = [(CTLazuliMessageEnvelope *)self content];
        v13 = [v4 content];
        char v14 = [v12 isEqualToCTLazuliMessageGeoLocationPush:v13];
        goto LABEL_17;
      case 3:
        v12 = [(CTLazuliMessageEnvelope *)self content];
        v13 = [v4 content];
        char v14 = [v12 isEqualToCTLazuliMessageGroupGeoLocationPush:v13];
        goto LABEL_17;
      case 4:
        v12 = [(CTLazuliMessageEnvelope *)self content];
        v13 = [v4 content];
        char v14 = [v12 isEqualToCTLazuliMessageFileTransferPush:v13];
        goto LABEL_17;
      case 5:
        v12 = [(CTLazuliMessageEnvelope *)self content];
        v13 = [v4 content];
        char v14 = [v12 isEqualToCTLazuliMessageGroupFileTransferPush:v13];
        goto LABEL_17;
      case 6:
        v12 = [(CTLazuliMessageEnvelope *)self content];
        v13 = [v4 content];
        char v14 = [v12 isEqualToCTLazuliMessageChatBotCard:v13];
        goto LABEL_17;
      case 7:
        v12 = [(CTLazuliMessageEnvelope *)self content];
        v13 = [v4 content];
        char v14 = [v12 isEqualToCTLazuliMessageChatBotCardCarousel:v13];
        goto LABEL_17;
      case 8:
        v12 = [(CTLazuliMessageEnvelope *)self content];
        v13 = [v4 content];
        char v14 = [v12 isEqualToCTLazuliMessageIncomingGroupChat:v13];
LABEL_17:
        BOOL v15 = v14;

        break;
      default:
        BOOL v15 = 1;
        break;
    }
  }
  else
  {
LABEL_6:
    BOOL v15 = 0;
  }

  return v15;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (CTLazuliMessageEnvelope *)a3;
  int64_t v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(CTLazuliMessageEnvelope *)self isEqualToCTLazuliMessageEnvelope:v5];

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[CTLazuliMessageEnvelope allocWithZone:a3];
  [(CTLazuliMessageEnvelope *)v4 setType:self->_type];
  [(CTLazuliMessageEnvelope *)v4 setFrom:self->_from];
  [(CTLazuliMessageEnvelope *)v4 setMessageID:self->_messageID];
  [(CTLazuliMessageEnvelope *)v4 setContent:self->_content];
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  id v4 = [NSNumber numberWithLong:self->_type];
  [v5 encodeObject:v4 forKey:@"kTypeKey"];

  [v5 encodeObject:self->_from forKey:@"kFromKey"];
  [v5 encodeObject:self->_messageID forKey:@"kMessageIDKey"];
  [v5 encodeObject:self->_content forKey:@"kContentKey"];
}

- (CTLazuliMessageEnvelope)initWithCoder:(id)a3
{
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)CTLazuliMessageEnvelope;
  id v5 = [(CTLazuliMessageEnvelope *)&v24 init];
  if (v5)
  {
    BOOL v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kTypeKey"];
    v5->_type = [v6 longValue];

    uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kFromKey"];
    from = v5->_from;
    v5->_from = (CTLazuliDestination *)v7;

    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kMessageIDKey"];
    messageID = v5->_messageID;
    v5->_messageID = (CTLazuliMessageID *)v9;

    v23 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v22 = objc_opt_class();
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = objc_opt_class();
    uint64_t v13 = objc_opt_class();
    uint64_t v14 = objc_opt_class();
    uint64_t v15 = objc_opt_class();
    uint64_t v16 = objc_opt_class();
    uint64_t v17 = objc_opt_class();
    v18 = objc_msgSend(v23, "setWithObjects:", v22, v11, v12, v13, v14, v15, v16, v17, objc_opt_class(), 0);
    uint64_t v19 = [v4 decodeObjectOfClasses:v18 forKey:@"kContentKey"];
    id content = v5->_content;
    v5->_id content = (id)v19;
  }
  return v5;
}

- (CTLazuliMessageEnvelope)initWithReflection:(const void *)a3
{
  v54.receiver = self;
  v54.super_class = (Class)CTLazuliMessageEnvelope;
  id v4 = [(CTLazuliMessageEnvelope *)&v54 init];
  if (v4)
  {
    v4->_type = encode_CTLazuliMessageType((unsigned int *)a3);
    id v5 = [[CTLazuliDestination alloc] initWithReflection:(char *)a3 + 8];
    from = v4->_from;
    v4->_from = v5;

    uint64_t v7 = [[CTLazuliMessageID alloc] initWithReflection:(char *)a3 + 120];
    messageID = v4->_messageID;
    v4->_messageID = v7;

    switch(*((_DWORD *)a3 + 188))
    {
      case 0:
        *(void *)&long long v35 = 0;
        long long v33 = 0u;
        long long v34 = 0u;
        long long v31 = 0u;
        long long v32 = 0u;
        *(_OWORD *)__p = 0u;
        if (*((char *)a3 + 175) < 0)
        {
          std::string::__init_copy_ctor_external((std::string *)__p, *((const std::string::value_type **)a3 + 19), *((void *)a3 + 20));
        }
        else
        {
          *(_OWORD *)__p = *(_OWORD *)((char *)a3 + 152);
          *(void *)&long long v31 = *((void *)a3 + 21);
        }
        std::__optional_copy_base<Lazuli::ChatBotSuggestedChipList,false>::__optional_copy_base[abi:nn180100]((uint64_t)&v31 + 8, (uint64_t)a3 + 176);
        std::__optional_copy_base<Lazuli::CustomMetaData,false>::__optional_copy_base[abi:nn180100]((std::string *)((char *)&v33 + 8), (uint64_t)a3 + 208);
        v25 = [[CTLazuliMessageText alloc] initWithReflection:__p];
        id content = v4->_content;
        v4->_id content = v25;

        if ((_BYTE)v35)
        {
          v55 = (void **)&v33 + 1;
          std::vector<Lazuli::CustomMetaDataWrapper>::__destroy_vector::operator()[abi:nn180100](&v55);
        }
        if ((_BYTE)v33)
        {
          v55 = (void **)&v31 + 1;
          std::vector<Lazuli::ChatBotSuggestedChip>::__destroy_vector::operator()[abi:nn180100](&v55);
        }
        if (SBYTE7(v31) < 0)
        {
          uint64_t v12 = __p[0];
          goto LABEL_29;
        }
        return v4;
      case 1:
        uint64_t v53 = 0;
        long long v51 = 0u;
        long long v52 = 0u;
        long long v49 = 0u;
        *(_OWORD *)v50 = 0u;
        long long v47 = 0u;
        long long v48 = 0u;
        long long v45 = 0u;
        long long v46 = 0u;
        long long v43 = 0u;
        long long v44 = 0u;
        long long v41 = 0u;
        long long v42 = 0u;
        long long v39 = 0u;
        long long v40 = 0u;
        long long v37 = 0u;
        long long v38 = 0u;
        long long v35 = 0u;
        long long v36 = 0u;
        long long v33 = 0u;
        long long v34 = 0u;
        long long v31 = 0u;
        long long v32 = 0u;
        *(_OWORD *)__p = 0u;
        Lazuli::GroupChatInformation::GroupChatInformation((Lazuli::GroupChatInformation *)__p, (const Lazuli::GroupChatInformation *)((char *)a3 + 152));
        if (*((char *)a3 + 495) < 0)
        {
          std::string::__init_copy_ctor_external((std::string *)v50, *((const std::string::value_type **)a3 + 59), *((void *)a3 + 60));
        }
        else
        {
          *(_OWORD *)v50 = *(_OWORD *)((char *)a3 + 472);
          *(void *)&long long v51 = *((void *)a3 + 61);
        }
        std::__optional_copy_base<Lazuli::CustomMetaData,false>::__optional_copy_base[abi:nn180100]((std::string *)((char *)&v51 + 8), (uint64_t)a3 + 496);
        v27 = [[CTLazuliMessageGroupText alloc] initWithReflection:__p];
        id v28 = v4->_content;
        v4->_id content = v27;

        if ((_BYTE)v53)
        {
          v55 = (void **)&v51 + 1;
          std::vector<Lazuli::CustomMetaDataWrapper>::__destroy_vector::operator()[abi:nn180100](&v55);
        }
        if (SBYTE7(v51) < 0) {
          operator delete(v50[0]);
        }
        goto LABEL_35;
      case 2:
        long long v35 = 0u;
        long long v36 = 0u;
        long long v33 = 0u;
        long long v34 = 0u;
        long long v31 = 0u;
        long long v32 = 0u;
        *(_OWORD *)__p = *(_OWORD *)((char *)a3 + 152);
        std::__optional_copy_base<std::string,false>::__optional_copy_base[abi:nn180100]((std::string *)&v31, (long long *)((char *)a3 + 168));
        std::__optional_copy_base<Lazuli::ChatBotSuggestedChipList,false>::__optional_copy_base[abi:nn180100]((uint64_t)&v33, (uint64_t)a3 + 200);
        std::__optional_copy_base<Lazuli::CustomMetaData,false>::__optional_copy_base[abi:nn180100]((std::string *)&v35, (uint64_t)a3 + 232);
        v10 = [[CTLazuliMessageGeoLocationPush alloc] initWithReflection:__p];
        id v11 = v4->_content;
        v4->_id content = v10;

        if (BYTE8(v36))
        {
          v55 = (void **)&v35;
          std::vector<Lazuli::CustomMetaDataWrapper>::__destroy_vector::operator()[abi:nn180100](&v55);
        }
        if (BYTE8(v34))
        {
          v55 = (void **)&v33;
          std::vector<Lazuli::ChatBotSuggestedChip>::__destroy_vector::operator()[abi:nn180100](&v55);
        }
        if (BYTE8(v32) && SBYTE7(v32) < 0)
        {
          uint64_t v12 = (void *)v31;
LABEL_29:
          operator delete(v12);
        }
        return v4;
      case 3:
        long long v51 = 0u;
        long long v52 = 0u;
        long long v49 = 0u;
        *(_OWORD *)v50 = 0u;
        long long v47 = 0u;
        long long v48 = 0u;
        long long v45 = 0u;
        long long v46 = 0u;
        long long v43 = 0u;
        long long v44 = 0u;
        long long v41 = 0u;
        long long v42 = 0u;
        long long v39 = 0u;
        long long v40 = 0u;
        long long v37 = 0u;
        long long v38 = 0u;
        long long v35 = 0u;
        long long v36 = 0u;
        long long v33 = 0u;
        long long v34 = 0u;
        long long v31 = 0u;
        long long v32 = 0u;
        *(_OWORD *)__p = 0u;
        Lazuli::GroupChatInformation::GroupChatInformation((Lazuli::GroupChatInformation *)__p, (const Lazuli::GroupChatInformation *)((char *)a3 + 152));
        *(_OWORD *)v50 = *(_OWORD *)((char *)a3 + 472);
        std::__optional_copy_base<Lazuli::CustomMetaData,false>::__optional_copy_base[abi:nn180100]((std::string *)&v51, (uint64_t)a3 + 488);
        uint64_t v13 = [[CTLazuliMessageGroupGeoLocationPush alloc] initWithReflection:__p];
        id v14 = v4->_content;
        v4->_id content = v13;

        if (BYTE8(v52))
        {
          v55 = (void **)&v51;
          std::vector<Lazuli::CustomMetaDataWrapper>::__destroy_vector::operator()[abi:nn180100](&v55);
        }
        goto LABEL_35;
      case 4:
        *(void *)&long long v49 = 0;
        long long v47 = 0u;
        long long v48 = 0u;
        long long v45 = 0u;
        long long v46 = 0u;
        long long v43 = 0u;
        long long v44 = 0u;
        long long v41 = 0u;
        long long v42 = 0u;
        long long v39 = 0u;
        long long v40 = 0u;
        long long v37 = 0u;
        long long v38 = 0u;
        long long v35 = 0u;
        long long v36 = 0u;
        long long v33 = 0u;
        long long v34 = 0u;
        long long v31 = 0u;
        long long v32 = 0u;
        *(_OWORD *)__p = 0u;
        Lazuli::MessageFileTransferPush::MessageFileTransferPush((Lazuli::MessageFileTransferPush *)__p, (const Lazuli::MessageFileTransferPush *)((char *)a3 + 152));
        uint64_t v15 = [[CTLazuliMessageFileTransferPush alloc] initWithReflection:__p];
        id v16 = v4->_content;
        v4->_id content = v15;

        Lazuli::MessageFileTransferPush::~MessageFileTransferPush((Lazuli::MessageFileTransferPush *)__p);
        return v4;
      case 5:
        bzero(__p, 0x258uLL);
        Lazuli::MessageGroupFileTransferPush::MessageGroupFileTransferPush((Lazuli::MessageGroupFileTransferPush *)__p, (const Lazuli::MessageGroupFileTransferPush *)((char *)a3 + 152));
        uint64_t v17 = [[CTLazuliMessageGroupFileTransferPush alloc] initWithReflection:__p];
        id v18 = v4->_content;
        v4->_id content = v17;

        Lazuli::MessageGroupFileTransferPush::~MessageGroupFileTransferPush((Lazuli::MessageGroupFileTransferPush *)__p);
        return v4;
      case 6:
        *(void *)&long long v52 = 0;
        *(_OWORD *)v50 = 0u;
        long long v51 = 0u;
        long long v48 = 0u;
        long long v49 = 0u;
        long long v46 = 0u;
        long long v47 = 0u;
        long long v44 = 0u;
        long long v45 = 0u;
        long long v42 = 0u;
        long long v43 = 0u;
        long long v40 = 0u;
        long long v41 = 0u;
        long long v38 = 0u;
        long long v39 = 0u;
        long long v36 = 0u;
        long long v37 = 0u;
        long long v34 = 0u;
        long long v35 = 0u;
        long long v32 = 0u;
        long long v33 = 0u;
        *(_OWORD *)__p = 0u;
        long long v31 = 0u;
        Lazuli::MessageChatBotCard::MessageChatBotCard((Lazuli::MessageChatBotCard *)__p, (const Lazuli::MessageChatBotCard *)((char *)a3 + 152));
        uint64_t v19 = [[CTLazuliMessageChatBotCard alloc] initWithReflection:__p];
        id v20 = v4->_content;
        v4->_id content = v19;

        Lazuli::MessageChatBotCard::~MessageChatBotCard((Lazuli::MessageChatBotCard *)__p);
        return v4;
      case 7:
        long long v35 = 0u;
        long long v36 = 0u;
        long long v33 = 0u;
        long long v34 = 0u;
        long long v31 = 0u;
        long long v32 = 0u;
        *(_OWORD *)__p = 0u;
        Lazuli::MessageChatBotCardCarousel::MessageChatBotCardCarousel((Lazuli::MessageChatBotCardCarousel *)__p, (const Lazuli::MessageChatBotCardCarousel *)((char *)a3 + 152));
        v21 = [[CTLazuliMessageChatBotCardCarousel alloc] initWithReflection:__p];
        id v22 = v4->_content;
        v4->_id content = v21;

        Lazuli::MessageChatBotCardCarousel::~MessageChatBotCardCarousel((Lazuli::MessageChatBotCardCarousel *)__p);
        return v4;
      case 8:
        long long v48 = 0u;
        long long v49 = 0u;
        long long v46 = 0u;
        long long v47 = 0u;
        long long v44 = 0u;
        long long v45 = 0u;
        long long v42 = 0u;
        long long v43 = 0u;
        long long v40 = 0u;
        long long v41 = 0u;
        long long v38 = 0u;
        long long v39 = 0u;
        long long v36 = 0u;
        long long v37 = 0u;
        long long v34 = 0u;
        long long v35 = 0u;
        long long v32 = 0u;
        long long v33 = 0u;
        *(_OWORD *)__p = 0u;
        long long v31 = 0u;
        Lazuli::GroupChatInformation::GroupChatInformation((Lazuli::GroupChatInformation *)__p, (const Lazuli::GroupChatInformation *)((char *)a3 + 152));
        v23 = [[CTLazuliMessageIncomingGroupChat alloc] initWithReflection:__p];
        id v24 = v4->_content;
        v4->_id content = v23;

LABEL_35:
        Lazuli::GroupChatInformation::~GroupChatInformation(__p);
        break;
      default:
        id v9 = v4->_content;
        v4->_id content = 0;

        break;
    }
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (CTLazuliDestination)from
{
  return self->_from;
}

- (void)setFrom:(id)a3
{
}

- (CTLazuliMessageID)messageID
{
  return self->_messageID;
}

- (void)setMessageID:(id)a3
{
}

- (id)content
{
  return self->_content;
}

- (void)setContent:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_content, 0);
  objc_storeStrong((id *)&self->_messageID, 0);

  objc_storeStrong((id *)&self->_from, 0);
}

@end
@interface CTLazuliChatBotSuggestedChip
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToCTLazuliChatBotSuggestedChip:(id)a3;
- (CTLazuliChatBotSuggestedChip)initWithCoder:(id)a3;
- (CTLazuliChatBotSuggestedChip)initWithReflection:(const void *)a3;
- (id)chip;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)type;
- (void)encodeWithCoder:(id)a3;
- (void)setChip:(id)a3;
- (void)setType:(int64_t)a3;
@end

@implementation CTLazuliChatBotSuggestedChip

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@", objc_opt_class()];
  int64_t v4 = [(CTLazuliChatBotSuggestedChip *)self type];
  int64_t v6 = [(CTLazuliChatBotSuggestedChip *)self type];
  [v3 appendFormat:@", type = [%ld - %s]", v4, print_CTLazuliSuggestedChipType(&v6)];
  [v3 appendFormat:@", chip {%@} = %@", objc_opt_class(), self->_chip];
  [v3 appendString:@">"];

  return v3;
}

- (BOOL)isEqualToCTLazuliChatBotSuggestedChip:(id)a3
{
  id v5 = a3;
  int64_t v6 = [(CTLazuliChatBotSuggestedChip *)self type];
  if (v6 == [v5 type])
  {
    v7 = [(CTLazuliChatBotSuggestedChip *)self chip];
    if (v7)
    {
    }
    else
    {
      v8 = [v5 chip];

      if (!v8)
      {
        char v3 = 1;
        goto LABEL_11;
      }
    }
    int64_t v9 = [(CTLazuliChatBotSuggestedChip *)self type];
    if ((unint64_t)(v9 + 1) < 2)
    {
      v10 = [(CTLazuliChatBotSuggestedChip *)self chip];
      v11 = [v5 chip];
      char v12 = [v10 isEqualToCTLazuliChatBotSuggestedReply:v11];
LABEL_10:
      char v3 = v12;

      goto LABEL_11;
    }
    if (v9 == 1)
    {
      v10 = [(CTLazuliChatBotSuggestedChip *)self chip];
      v11 = [v5 chip];
      char v12 = [v10 isEqualToCTLazuliChatBotSuggestedAction:v11];
      goto LABEL_10;
    }
  }
  else
  {
    char v3 = 0;
  }
LABEL_11:

  return v3 & 1;
}

- (BOOL)isEqual:(id)a3
{
  int64_t v4 = (CTLazuliChatBotSuggestedChip *)a3;
  id v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(CTLazuliChatBotSuggestedChip *)self isEqualToCTLazuliChatBotSuggestedChip:v5];

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  int64_t v4 = +[CTLazuliChatBotSuggestedChip allocWithZone:a3];
  [(CTLazuliChatBotSuggestedChip *)v4 setType:self->_type];
  [(CTLazuliChatBotSuggestedChip *)v4 setChip:self->_chip];
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  int64_t v4 = [NSNumber numberWithLong:self->_type];
  [v5 encodeObject:v4 forKey:@"kTypeKey"];

  [v5 encodeObject:self->_chip forKey:@"kChipKey"];
}

- (CTLazuliChatBotSuggestedChip)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CTLazuliChatBotSuggestedChip;
  id v5 = [(CTLazuliChatBotSuggestedChip *)&v14 init];
  if (v5)
  {
    BOOL v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kTypeKey"];
    v5->_type = [v6 longValue];

    v7 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    v10 = objc_msgSend(v7, "setWithObjects:", v8, v9, objc_opt_class(), 0);
    uint64_t v11 = [v4 decodeObjectOfClasses:v10 forKey:@"kChipKey"];
    id chip = v5->_chip;
    v5->_id chip = (id)v11;
  }
  return v5;
}

- (CTLazuliChatBotSuggestedChip)initWithReflection:(const void *)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v12.receiver = self;
  v12.super_class = (Class)CTLazuliChatBotSuggestedChip;
  id v4 = [(CTLazuliChatBotSuggestedChip *)&v12 init];
  if (v4)
  {
    v4->_type = encode_CTLazuliGroupChatParticipantRoleType(a3);
    int v5 = *((_DWORD *)a3 + 56);
    if (v5 == 1)
    {
      *(void *)&long long v16 = 0;
      *(_OWORD *)__p = 0u;
      memset(v14, 0, sizeof(v14));
      if (*((char *)a3 + 31) < 0)
      {
        std::string::__init_copy_ctor_external((std::string *)v14, *((const std::string::value_type **)a3 + 1), *((void *)a3 + 2));
      }
      else
      {
        *(_OWORD *)objc_super v14 = *(_OWORD *)((char *)a3 + 8);
        *(void *)&v14[16] = *((void *)a3 + 3);
      }
      std::__optional_copy_base<Lazuli::ChatBotPostbackData,false>::__optional_copy_base[abi:nn180100]((std::string *)&v14[24], (long long *)a3 + 2);
      uint64_t v9 = [[CTLazuliChatBotSuggestedReply alloc] initWithReflection:v14];
      id chip = v4->_chip;
      v4->_id chip = v9;

      if ((_BYTE)v16 && SHIBYTE(__p[1]) < 0) {
        operator delete(*(void **)&v14[24]);
      }
      if ((v14[23] & 0x80000000) != 0)
      {
        uint64_t v8 = *(void **)v14;
        goto LABEL_22;
      }
    }
    else if (!v5)
    {
      uint64_t v18 = 0;
      long long v16 = 0u;
      memset(v17, 0, sizeof(v17));
      *(_OWORD *)__p = 0u;
      memset(v14, 0, sizeof(v14));
      *(_DWORD *)objc_super v14 = *((_DWORD *)a3 + 2);
      if (*((char *)a3 + 39) < 0)
      {
        std::string::__init_copy_ctor_external((std::string *)&v14[8], *((const std::string::value_type **)a3 + 2), *((void *)a3 + 3));
      }
      else
      {
        *(_OWORD *)&v14[8] = *((_OWORD *)a3 + 1);
        *(void *)&v14[24] = *((void *)a3 + 4);
      }
      std::__optional_copy_base<Lazuli::ChatBotPostbackData,false>::__optional_copy_base[abi:nn180100]((std::string *)__p, (long long *)((char *)a3 + 40));
      std::__variant_detail::__copy_constructor<std::__variant_detail::__traits<Lazuli::SuggestedActionOpenUrlInWebView,Lazuli::SuggestedActionOpenUrlInApplication,Lazuli::SuggestedActionComposeText,Lazuli::SuggestedActionComposeAudioRecording,Lazuli::SuggestedActionComposeVideoRecording,Lazuli::SuggestedActionShowLocation,Lazuli::SuggestedActionRequestLocationPush,Lazuli::SuggestedActionCalendar,Lazuli::SuggestedActionDialVideoCall,Lazuli::SuggestedActionDialEnrichedCall,Lazuli::SuggestedActionDialPhoneNumber,Lazuli::SuggestedActionDevice,Lazuli::SuggestedActionSettings>,(std::__variant_detail::_Trait)1>::__copy_constructor((uint64_t)v17 + 8, (uint64_t)a3 + 80);
      BOOL v6 = [[CTLazuliChatBotSuggestedAction alloc] initWithReflection:v14];
      id v7 = v4->_chip;
      v4->_id chip = v6;

      if (v18 != -1) {
        ((void (*)(char *, char *))off_1ECFD4430[v18])(&v13, (char *)v17 + 8);
      }
      LODWORD(v18) = -1;
      if (BYTE8(v16) && SBYTE7(v16) < 0) {
        operator delete(__p[0]);
      }
      if ((v14[31] & 0x80000000) != 0)
      {
        uint64_t v8 = *(void **)&v14[8];
LABEL_22:
        operator delete(v8);
      }
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

- (id)chip
{
  return self->_chip;
}

- (void)setChip:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
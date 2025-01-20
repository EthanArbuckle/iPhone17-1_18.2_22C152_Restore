@interface CTLazuliChatBotMenuL1Content
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToCTLazuliChatBotMenuL1Content:(id)a3;
- (CTLazuliChatBotMenuL1Content)initWithCoder:(id)a3;
- (CTLazuliChatBotMenuL1Content)initWithReflection:(const void *)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)item;
- (int64_t)type;
- (void)encodeWithCoder:(id)a3;
- (void)setItem:(id)a3;
- (void)setType:(int64_t)a3;
@end

@implementation CTLazuliChatBotMenuL1Content

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@", objc_opt_class()];
  int64_t v4 = [(CTLazuliChatBotMenuL1Content *)self type];
  int64_t v6 = [(CTLazuliChatBotMenuL1Content *)self type];
  [v3 appendFormat:@", type = [%ld - %s]", v4, print_CTLazuliMenuL1ContentType(&v6)];
  [v3 appendFormat:@", item {%@} = %@", objc_opt_class(), self->_item];
  [v3 appendString:@">"];

  return v3;
}

- (BOOL)isEqualToCTLazuliChatBotMenuL1Content:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(CTLazuliChatBotMenuL1Content *)self type];
  if (v5 == [v4 type])
  {
    int64_t v6 = [(CTLazuliChatBotMenuL1Content *)self type];
    if (v6 == 1)
    {
      v7 = [v4 item];
      v8 = [(CTLazuliChatBotMenuL1Content *)self item];
      char v9 = [v7 isEqualToCTLazuliChatBotMenuL2:v8];
    }
    else
    {
      if (v6)
      {
        BOOL v10 = 1;
        goto LABEL_9;
      }
      v7 = [v4 item];
      v8 = [(CTLazuliChatBotMenuL1Content *)self item];
      char v9 = [v7 isEqualToCTLazuliChatBotSuggestedChip:v8];
    }
    BOOL v10 = v9;
  }
  else
  {
    BOOL v10 = 0;
  }
LABEL_9:

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (CTLazuliChatBotMenuL1Content *)a3;
  int64_t v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(CTLazuliChatBotMenuL1Content *)self isEqualToCTLazuliChatBotMenuL1Content:v5];

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[CTLazuliChatBotMenuL1Content allocWithZone:a3];
  [(CTLazuliChatBotMenuL1Content *)v4 setType:self->_type];
  [(CTLazuliChatBotMenuL1Content *)v4 setItem:self->_item];
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  id v4 = [NSNumber numberWithLong:self->_type];
  [v5 encodeObject:v4 forKey:@"kTypeKey"];

  [v5 encodeObject:self->_item forKey:@"kItemKey"];
}

- (CTLazuliChatBotMenuL1Content)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CTLazuliChatBotMenuL1Content;
  id v5 = [(CTLazuliChatBotMenuL1Content *)&v14 init];
  if (v5)
  {
    BOOL v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kTypeKey"];
    v5->_type = [v6 longValue];

    v7 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    BOOL v10 = objc_msgSend(v7, "setWithObjects:", v8, v9, objc_opt_class(), 0);
    uint64_t v11 = [v4 decodeObjectOfClasses:v10 forKey:@"kItemKey"];
    id item = v5->_item;
    v5->_id item = (id)v11;
  }
  return v5;
}

- (CTLazuliChatBotMenuL1Content)initWithReflection:(const void *)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  v12.receiver = self;
  v12.super_class = (Class)CTLazuliChatBotMenuL1Content;
  id v4 = [(CTLazuliChatBotMenuL1Content *)&v12 init];
  if (v4)
  {
    v4->_type = encode_CTLazuliGroupChatParticipantRoleType(a3);
    int v5 = *((_DWORD *)a3 + 60);
    if (v5 == 1)
    {
      long long v15 = 0u;
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
      *(void *)&v14[24] = 0;
      long long v15 = 0uLL;
      std::vector<Lazuli::ChatBotMenuL2Content>::__init_with_size[abi:nn180100]<Lazuli::ChatBotMenuL2Content*,Lazuli::ChatBotMenuL2Content*>(&v14[24], *((void *)a3 + 4), *((void *)a3 + 5), 0x34F72C234F72C235 * ((uint64_t)(*((void *)a3 + 5) - *((void *)a3 + 4)) >> 3));
      uint64_t v9 = [[CTLazuliChatBotMenuL2 alloc] initWithReflection:v14];
      id item = v4->_item;
      v4->_id item = v9;

      v13 = (void **)&v14[24];
      std::vector<Lazuli::ChatBotMenuL2Content>::__destroy_vector::operator()[abi:nn180100](&v13);
      if ((v14[23] & 0x80000000) != 0) {
        operator delete(*(void **)v14);
      }
    }
    else if (!v5)
    {
      uint64_t v27 = 0;
      long long v25 = 0u;
      long long v26 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      long long v20 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      long long v16 = 0u;
      long long v17 = 0u;
      long long v15 = 0u;
      int v6 = *((_DWORD *)a3 + 2);
      memset(v14, 0, sizeof(v14));
      *(_DWORD *)objc_super v14 = v6;
      std::__variant_detail::__copy_constructor<std::__variant_detail::__traits<Lazuli::ChatBotSuggestedAction,Lazuli::ChatBotSuggestedReply>,(std::__variant_detail::_Trait)1>::__copy_constructor((uint64_t)&v14[8], (uint64_t)a3 + 16);
      v7 = [[CTLazuliChatBotSuggestedChip alloc] initWithReflection:v14];
      id v8 = v4->_item;
      v4->_id item = v7;

      if (v27 != -1) {
        ((void (*)(void ***, unsigned char *))off_1ECFD4500[v27])(&v13, &v14[8]);
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

- (id)item
{
  return self->_item;
}

- (void)setItem:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
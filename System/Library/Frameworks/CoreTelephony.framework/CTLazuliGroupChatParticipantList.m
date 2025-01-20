@interface CTLazuliGroupChatParticipantList
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToCTLazuliGroupChatParticipantList:(id)a3;
- (CTLazuliGroupChatParticipantList)initWithCoder:(id)a3;
- (CTLazuliGroupChatParticipantList)initWithReflection:(const void *)a3;
- (NSArray)list;
- (NSArray)memberList;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setList:(id)a3;
- (void)setMemberList:(id)a3;
@end

@implementation CTLazuliGroupChatParticipantList

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@", objc_opt_class()];
  v4 = [(CTLazuliGroupChatParticipantList *)self list];
  [v3 appendFormat:@", list = %@", v4];

  v5 = [(CTLazuliGroupChatParticipantList *)self memberList];
  [v3 appendFormat:@", memberList = %@", v5];

  [v3 appendString:@">"];

  return v3;
}

- (BOOL)isEqualToCTLazuliGroupChatParticipantList:(id)a3
{
  id v4 = a3;
  v5 = [(CTLazuliGroupChatParticipantList *)self list];
  v6 = [v4 list];
  if ([v5 isEqualToArray:v6])
  {
    v7 = [(CTLazuliGroupChatParticipantList *)self memberList];
    v8 = [v4 memberList];
    char v9 = [v7 isEqualToArray:v8];
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (CTLazuliGroupChatParticipantList *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(CTLazuliGroupChatParticipantList *)self isEqualToCTLazuliGroupChatParticipantList:v5];

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[CTLazuliGroupChatParticipantList allocWithZone:a3];
  [(CTLazuliGroupChatParticipantList *)v4 setList:self->_list];
  [(CTLazuliGroupChatParticipantList *)v4 setMemberList:self->_memberList];
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeObject:self->_list forKey:@"kListKey"];
  [v4 encodeObject:self->_memberList forKey:@"kMemberListKey"];
}

- (CTLazuliGroupChatParticipantList)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)CTLazuliGroupChatParticipantList;
  v5 = [(CTLazuliGroupChatParticipantList *)&v17 init];
  if (v5)
  {
    BOOL v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"kListKey"];
    list = v5->_list;
    v5->_list = (NSArray *)v9;

    v11 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v12 = objc_opt_class();
    v13 = objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
    uint64_t v14 = [v4 decodeObjectOfClasses:v13 forKey:@"kMemberListKey"];
    memberList = v5->_memberList;
    v5->_memberList = (NSArray *)v14;
  }
  return v5;
}

- (CTLazuliGroupChatParticipantList)initWithReflection:(const void *)a3
{
  v17.receiver = self;
  v17.super_class = (Class)CTLazuliGroupChatParticipantList;
  id v4 = [(CTLazuliGroupChatParticipantList *)&v17 init];
  if (v4)
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    BOOL v6 = *(uint64_t **)a3;
    uint64_t v7 = (uint64_t *)*((void *)a3 + 1);
    if (*(uint64_t **)a3 != v7)
    {
      do
      {
        id v8 = [NSString alloc];
        uint64_t v9 = v6;
        if (*((char *)v6 + 23) < 0) {
          uint64_t v9 = (uint64_t *)*v6;
        }
        v10 = (void *)[v8 initWithUTF8String:v9];
        [v5 addObject:v10];

        v6 += 3;
      }
      while (v6 != v7);
    }
    objc_storeStrong((id *)&v4->_list, v5);
    v11 = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v12 = *((void *)a3 + 3);
    for (uint64_t i = *((void *)a3 + 4); v12 != i; v12 += 32)
    {
      uint64_t v14 = [[CTLazuliGroupChatParticipant alloc] initWithReflection:v12];
      [(NSArray *)v11 addObject:v14];
    }
    memberList = v4->_memberList;
    v4->_memberList = v11;
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSArray)list
{
  return self->_list;
}

- (void)setList:(id)a3
{
}

- (NSArray)memberList
{
  return self->_memberList;
}

- (void)setMemberList:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_memberList, 0);

  objc_storeStrong((id *)&self->_list, 0);
}

@end
@interface CTLazuliGroupChatParticipant
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToCTLazuliGroupChatParticipant:(id)a3;
- (CTLazuliGroupChatParticipant)initWithCoder:(id)a3;
- (CTLazuliGroupChatParticipant)initWithReflection:(const void *)a3;
- (NSString)member;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)role;
- (void)encodeWithCoder:(id)a3;
- (void)setMember:(id)a3;
- (void)setRole:(int64_t)a3;
@end

@implementation CTLazuliGroupChatParticipant

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@", objc_opt_class()];
  v4 = [(CTLazuliGroupChatParticipant *)self member];
  [v3 appendFormat:@", member = %@", v4];

  int64_t v5 = [(CTLazuliGroupChatParticipant *)self role];
  int64_t v7 = [(CTLazuliGroupChatParticipant *)self role];
  [v3 appendFormat:@", role = [%ld - %s]", v5, print_CTLazuliGroupChatParticipantRoleType(&v7)];
  [v3 appendString:@">"];

  return v3;
}

- (BOOL)isEqualToCTLazuliGroupChatParticipant:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(CTLazuliGroupChatParticipant *)self member];
  v6 = [v4 member];
  if ([v5 isEqualToString:v6])
  {
    int64_t v7 = [(CTLazuliGroupChatParticipant *)self role];
    BOOL v8 = v7 == [v4 role];
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (CTLazuliGroupChatParticipant *)a3;
  int64_t v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(CTLazuliGroupChatParticipant *)self isEqualToCTLazuliGroupChatParticipant:v5];

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[CTLazuliGroupChatParticipant allocWithZone:a3];
  [(CTLazuliGroupChatParticipant *)v4 setMember:self->_member];
  [(CTLazuliGroupChatParticipant *)v4 setRole:self->_role];
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  [v5 encodeObject:self->_member forKey:@"kMemberKey"];
  id v4 = [NSNumber numberWithLong:self->_role];
  [v5 encodeObject:v4 forKey:@"kRoleKey"];
}

- (CTLazuliGroupChatParticipant)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CTLazuliGroupChatParticipant;
  id v5 = [(CTLazuliGroupChatParticipant *)&v10 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kMemberKey"];
    member = v5->_member;
    v5->_member = (NSString *)v6;

    BOOL v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kRoleKey"];
    v5->_role = [v8 longValue];
  }
  return v5;
}

- (CTLazuliGroupChatParticipant)initWithReflection:(const void *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)CTLazuliGroupChatParticipant;
  id v4 = [(CTLazuliGroupChatParticipant *)&v9 init];
  if (v4)
  {
    if (*((char *)a3 + 23) >= 0) {
      id v5 = a3;
    }
    else {
      id v5 = *(const void **)a3;
    }
    uint64_t v6 = [NSString stringWithUTF8String:v5];
    member = v4->_member;
    v4->_member = (NSString *)v6;

    v4->_role = encode_CTLazuliGroupChatParticipantRoleType((_DWORD *)a3 + 6);
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)member
{
  return self->_member;
}

- (void)setMember:(id)a3
{
}

- (int64_t)role
{
  return self->_role;
}

- (void)setRole:(int64_t)a3
{
  self->_role = a3;
}

- (void).cxx_destruct
{
}

@end
@interface DDIUser
+ (id)userWithUUID:(id)a3 uid:(unsigned int)a4 name:(id)a5 primaryGroupUUID:(id)a6 fullName:(id)a7 homeDirectory:(id)a8 shell:(id)a9 memberships:(id)a10;
- (NSMutableSet)aliases;
- (NSMutableSet)memberships;
- (NSString)fullName;
- (NSString)homeDirectory;
- (NSString)name;
- (NSString)shell;
- (NSUUID)primaryGroupUUID;
- (NSUUID)uuid;
- (id)initWithUUID:(int)a3 uid:(void *)a4 name:(void *)a5 primaryGroupUUID:(void *)a6 fullName:(void *)a7 homeDirectory:(void *)a8 shell:(void *)a9 memberships:;
- (unsigned)uid;
- (void)setAliases:(id)a3;
- (void)setFullName:(id)a3;
- (void)setHomeDirectory:(id)a3;
- (void)setMemberships:(id)a3;
- (void)setName:(id)a3;
- (void)setPrimaryGroupUUID:(id)a3;
- (void)setShell:(id)a3;
- (void)setUid:(unsigned int)a3;
@end

@implementation DDIUser

+ (id)userWithUUID:(id)a3 uid:(unsigned int)a4 name:(id)a5 primaryGroupUUID:(id)a6 fullName:(id)a7 homeDirectory:(id)a8 shell:(id)a9 memberships:(id)a10
{
  id v16 = a10;
  id v17 = a9;
  id v18 = a8;
  id v19 = a7;
  id v20 = a6;
  id v21 = a5;
  id v22 = a3;
  v23 = -[DDIUser initWithUUID:uid:name:primaryGroupUUID:fullName:homeDirectory:shell:memberships:]((id *)[DDIUser alloc], v22, a4, v21, v20, v19, v18, v17, v16);

  return v23;
}

- (id)initWithUUID:(int)a3 uid:(void *)a4 name:(void *)a5 primaryGroupUUID:(void *)a6 fullName:(void *)a7 homeDirectory:(void *)a8 shell:(void *)a9 memberships:
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v35 = a2;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a8;
  id v22 = a9;
  if (a1)
  {
    v37.receiver = a1;
    v37.super_class = (Class)DDIUser;
    v23 = (id *)objc_msgSendSuper2(&v37, sel_init);
    if (!v23) {
      -[DDIUser initWithUUID:uid:name:primaryGroupUUID:fullName:homeDirectory:shell:memberships:](&v36, v38);
    }
    a1 = v23;

    objc_storeStrong(a1 + 2, a2);
    *((_DWORD *)a1 + 2) = a3;
    uint64_t v24 = [v17 copy];
    id v25 = a1[3];
    a1[3] = (id)v24;

    objc_storeStrong(a1 + 4, a5);
    uint64_t v26 = [v19 copy];
    id v27 = a1[5];
    a1[5] = (id)v26;

    uint64_t v28 = [v20 copy];
    id v29 = a1[6];
    a1[6] = (id)v28;

    uint64_t v30 = [v21 copy];
    id v31 = a1[7];
    a1[7] = (id)v30;

    uint64_t v32 = [v22 mutableCopy];
    id v33 = a1[8];
    a1[8] = (id)v32;
  }
  return a1;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (unsigned)uid
{
  return self->_uid;
}

- (void)setUid:(unsigned int)a3
{
  self->_uid = a3;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSUUID)primaryGroupUUID
{
  return self->_primaryGroupUUID;
}

- (void)setPrimaryGroupUUID:(id)a3
{
}

- (NSString)fullName
{
  return self->_fullName;
}

- (void)setFullName:(id)a3
{
}

- (NSString)homeDirectory
{
  return self->_homeDirectory;
}

- (void)setHomeDirectory:(id)a3
{
}

- (NSString)shell
{
  return self->_shell;
}

- (void)setShell:(id)a3
{
}

- (NSMutableSet)memberships
{
  return self->_memberships;
}

- (void)setMemberships:(id)a3
{
}

- (NSMutableSet)aliases
{
  return self->_aliases;
}

- (void)setAliases:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_aliases, 0);
  objc_storeStrong((id *)&self->_memberships, 0);
  objc_storeStrong((id *)&self->_shell, 0);
  objc_storeStrong((id *)&self->_homeDirectory, 0);
  objc_storeStrong((id *)&self->_fullName, 0);
  objc_storeStrong((id *)&self->_primaryGroupUUID, 0);
  objc_storeStrong((id *)&self->_name, 0);

  objc_storeStrong((id *)&self->_uuid, 0);
}

- (void)initWithUUID:(void *)a1 uid:(_OWORD *)a2 name:primaryGroupUUID:fullName:homeDirectory:shell:memberships:.cold.1(void *a1, _OWORD *a2)
{
  *a1 = 0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    uint64_t v5 = 3;
  }
  else {
    uint64_t v5 = 2;
  }
  OUTLINED_FUNCTION_0(v5, v2, v3, v4, (uint64_t)&dword_24C8A9000);
  _os_crash_msg();
  __break(1u);
  sub_24C8F78D0();
}

@end
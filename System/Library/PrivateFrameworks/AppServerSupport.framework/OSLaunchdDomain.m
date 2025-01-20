@interface OSLaunchdDomain
+ (id)createDomainForRoleAccount:(unsigned int)a3 sessionType:(id)a4 options:(unint64_t)a5 error:(id *)a6;
+ (id)currentDomain;
+ (id)domainForAsid:(int)a3;
+ (id)domainForPid:(int)a3;
+ (id)domainForRoleAccountUser:(unsigned int)a3;
+ (id)domainForUser:(unsigned int)a3;
+ (id)loginwindowDomain;
+ (id)systemDomain;
+ (unsigned)_createDomainOptions2flags:(unint64_t)a3;
- (BOOL)initiateRemoval:(id *)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)unpendLaunches:(id *)a3;
- (OSLaunchdDomain)initWithType:(int)a3 handle:(unint64_t)a4;
- (unint64_t)hash;
@end

@implementation OSLaunchdDomain

+ (id)domainForPid:(int)a3
{
  v3 = [[OSLaunchdDomain alloc] initWithType:5 handle:a3];

  return v3;
}

+ (id)currentDomain
{
  v2 = [[OSLaunchdDomain alloc] initWithType:7 handle:0];

  return v2;
}

- (OSLaunchdDomain)initWithType:(int)a3 handle:(unint64_t)a4
{
  v10.receiver = self;
  v10.super_class = (Class)OSLaunchdDomain;
  v6 = [(OSLaunchdDomain *)&v10 init];
  v7 = v6;
  if (v6)
  {
    v6->_type = a3;
    v6->_handle = a4;
    v8 = v6;
  }

  return v7;
}

+ (id)domainForUser:(unsigned int)a3
{
  v3 = [[OSLaunchdDomain alloc] initWithType:2 handle:a3];

  return v3;
}

+ (id)systemDomain
{
  v2 = [[OSLaunchdDomain alloc] initWithType:1 handle:0];

  return v2;
}

+ (id)loginwindowDomain
{
  v2 = [[OSLaunchdDomain alloc] initWithType:8 handle:-1];

  return v2;
}

+ (id)domainForRoleAccountUser:(unsigned int)a3
{
  v3 = [[OSLaunchdDomain alloc] initWithType:2 handle:a3];

  return v3;
}

+ (id)domainForAsid:(int)a3
{
  v3 = [[OSLaunchdDomain alloc] initWithType:3 handle:a3];

  return v3;
}

+ (unsigned)_createDomainOptions2flags:(unint64_t)a3
{
  return a3 & 1;
}

+ (id)createDomainForRoleAccount:(unsigned int)a3 sessionType:(id)a4 options:(unint64_t)a5 error:(id *)a6
{
  uint64_t v8 = *(void *)&a3;
  id v9 = a4;
  xpc_object_t empty = xpc_dictionary_create_empty();
  xpc_dictionary_set_uint64(empty, "type", 2uLL);
  xpc_dictionary_set_uint64(empty, "handle", v8);
  id v11 = v9;
  v12 = (const char *)[v11 UTF8String];

  xpc_dictionary_set_string(empty, "session", v12);
  xpc_object_t v13 = xpc_dictionary_create_empty();
  xpc_dictionary_set_uint64(v13, "type", 1uLL);
  xpc_dictionary_set_uint64(v13, "handle", 0);
  xpc_dictionary_set_value(v13, "properties", empty);
  xpc_dictionary_set_uint64(v13, "flags", +[OSLaunchdDomain _createDomainOptions2flags:a5]);
  uint64_t v14 = _xpc_domain_routine();
  if (v14)
  {
    if (a6)
    {
      +[OSLaunchdError createXPCError:v14];
      v15 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v15 = 0;
    }
  }
  else
  {
    v15 = +[OSLaunchdDomain domainForRoleAccountUser:v8];
  }

  return v15;
}

- (BOOL)unpendLaunches:(id *)a3
{
  xpc_object_t empty = xpc_dictionary_create_empty();
  xpc_dictionary_set_uint64(empty, "type", self->_type);
  xpc_dictionary_set_uint64(empty, "handle", self->_handle);
  uint64_t v6 = _xpc_domain_routine();
  int v7 = v6;
  if (a3 && v6)
  {
    *a3 = +[OSLaunchdError createXPCError:v6];
  }

  return v7 == 0;
}

- (BOOL)initiateRemoval:(id *)a3
{
  xpc_object_t empty = xpc_dictionary_create_empty();
  xpc_dictionary_set_uint64(empty, "type", self->_type);
  xpc_dictionary_set_uint64(empty, "handle", self->_handle);
  xpc_dictionary_set_BOOL(empty, "no-einprogress", 1);
  uint64_t v6 = _xpc_domain_routine();
  int v7 = v6;
  if (a3 && v6)
  {
    *a3 = +[OSLaunchdError createXPCError:v6];
  }

  return v7 == 0;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && self->_type == v4[2] && self->_handle == *((void *)v4 + 2);

  return v5;
}

- (unint64_t)hash
{
  v3 = [NSNumber numberWithInt:self->_type];
  uint64_t v4 = [v3 hash];
  BOOL v5 = [NSNumber numberWithUnsignedLong:self->_handle];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

@end
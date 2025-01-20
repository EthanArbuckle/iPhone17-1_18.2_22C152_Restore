@interface _OSLogEventStoreTimeRef
+ (id)timeRef;
- (_OSLogEventStoreTimeRef)initWithDictionary:(id)a3;
- (_OSLogEventStoreTimeRef)initWithUUID:(unsigned __int8)a3[16] continuous:(unint64_t)a4;
- (const)UUID;
- (unint64_t)continuousTime;
@end

@implementation _OSLogEventStoreTimeRef

- (unint64_t)continuousTime
{
  return self->_ct;
}

- (const)UUID
{
  return (const char *)self->_uuid;
}

- (_OSLogEventStoreTimeRef)initWithDictionary:(id)a3
{
  id v4 = a3;
  v5 = [(_OSLogEventStoreTimeRef *)self init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"UUID"];
    uint64_t v7 = [v4 objectForKeyedSubscript:@"ContinuousTime"];
    v8 = (void *)v7;
    if (!v6
      || !v7
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
      || (id v9 = v6, uuid_parse((const char *)[v9 UTF8String], v5->_uuid) == -1))
    {

      v10 = 0;
      goto LABEL_10;
    }
    v5->_ct = [v8 unsignedLongLongValue];
  }
  v10 = v5;
LABEL_10:

  return v10;
}

- (_OSLogEventStoreTimeRef)initWithUUID:(unsigned __int8)a3[16] continuous:(unint64_t)a4
{
  result = [(_OSLogEventStoreTimeRef *)self init];
  if (result)
  {
    *(_OWORD *)result->_uuid = *(_OWORD *)a3;
    result->_ct = a4;
  }
  return result;
}

+ (id)timeRef
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  memset(uu, 0, sizeof(uu));
  uint64_t v3 = mach_continuous_time();
  boot_uuid = (const char *)_os_trace_get_boot_uuid();
  uuid_parse(boot_uuid, uu);
  v5 = (void *)[objc_alloc((Class)a1) initWithUUID:uu continuous:v3];
  return v5;
}

@end
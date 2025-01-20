@interface NSUUID(GEOExtras)
+ (id)_geo_dataForUUID;
+ (id)_geo_dataForWaypointUUID:()GEOExtras;
+ (id)_geo_uuidForData:()GEOExtras;
+ (id)_geo_uuidForHighBytes:()GEOExtras lowBytes:;
+ (id)_geo_uuidForWaypointUUID:()GEOExtras;
+ (id)_geo_waypointUUIDForData:()GEOExtras;
- (GEOWaypointUUID)_geo_waypointUUID;
- (id)_geo_data;
- (uint64_t)_geo_getHighBytes:()GEOExtras lowBytes:;
@end

@implementation NSUUID(GEOExtras)

+ (id)_geo_dataForUUID
{
  v0 = [MEMORY[0x1E4F29128] UUID];
  v1 = objc_msgSend(v0, "_geo_data");

  return v1;
}

- (id)_geo_data
{
  v3[2] = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  v3[1] = 0;
  [a1 getUUIDBytes:v3];
  v1 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v3 length:16];

  return v1;
}

+ (id)_geo_waypointUUIDForData:()GEOExtras
{
  v0 = objc_msgSend(MEMORY[0x1E4F29128], "_geo_uuidForData:");
  v1 = objc_msgSend(v0, "_geo_waypointUUID");

  return v1;
}

- (GEOWaypointUUID)_geo_waypointUUID
{
  unint64_t v5 = 0;
  unint64_t v6 = 0;
  [a1 getUUIDBytes:&v5];
  v1 = objc_alloc_init(GEOWaypointUUID);
  if (v1)
  {
    unint64_t v2 = v5;
    *(unsigned char *)&v1->_flags |= 1u;
    v1->_high = v2;
    unint64_t v3 = v6;
    *(unsigned char *)&v1->_flags |= 2u;
    v1->_low = v3;
  }

  return v1;
}

+ (id)_geo_uuidForData:()GEOExtras
{
  id v3 = a3;
  if ([v3 length] == 16)
  {
    v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F29128]), "initWithUUIDBytes:", objc_msgSend(v3, "bytes"));
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)unint64_t v6 = 0;
      _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: data.length == sizeof(uuid_t)", v6, 2u);
    }
    v4 = 0;
  }

  return v4;
}

+ (id)_geo_uuidForWaypointUUID:()GEOExtras
{
  id v3 = a3;
  if (v3)
  {
    uint64_t v4 = v3[2];
    uint64_t v5 = v3[3];
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v5 = 0;
  }
  v8[0] = v4;

  v8[1] = v5;
  unint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDBytes:v8];

  return v6;
}

+ (id)_geo_uuidForHighBytes:()GEOExtras lowBytes:
{
  v6[0] = a3;
  v6[1] = a4;
  uint64_t v4 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDBytes:v6];

  return v4;
}

- (uint64_t)_geo_getHighBytes:()GEOExtras lowBytes:
{
  uint64_t v8 = 0;
  uint64_t v9 = 0;
  uint64_t result = [a1 getUUIDBytes:&v8];
  uint64_t v7 = v9;
  *a3 = v8;
  *a4 = v7;
  return result;
}

+ (id)_geo_dataForWaypointUUID:()GEOExtras
{
  v0 = objc_msgSend(MEMORY[0x1E4F29128], "_geo_uuidForWaypointUUID:");
  v1 = objc_msgSend(v0, "_geo_data");

  return v1;
}

@end
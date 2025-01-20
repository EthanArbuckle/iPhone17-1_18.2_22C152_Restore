@interface ATXLocationOfInterest(ProtoBufWrapper)
- (id)encodeAsProto;
- (id)initWithProto:()ProtoBufWrapper;
- (id)initWithProtoData:()ProtoBufWrapper;
- (id)proto;
- (uint64_t)_protoLOITypeFromRoutineLOIType:()ProtoBufWrapper;
- (uint64_t)_routineLOITypeFromProtoLOIType:()ProtoBufWrapper;
@end

@implementation ATXLocationOfInterest(ProtoBufWrapper)

- (id)initWithProtoData:()ProtoBufWrapper
{
  if (a3)
  {
    id v4 = a3;
    v5 = [[ATXPBPredictionLocationOfInterest alloc] initWithData:v4];

    a1 = (id)[a1 initWithProto:v5];
    id v6 = a1;
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)encodeAsProto
{
  v1 = [a1 proto];
  v2 = [v1 data];

  return v2;
}

- (id)initWithProto:()ProtoBufWrapper
{
  id v4 = a3;
  if (!v4)
  {
LABEL_7:
    id v15 = 0;
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v16 = __atxlog_handle_default();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
      -[ATXLocationOfInterest(ProtoBufWrapper) initWithProto:]((uint64_t)a1, v16);
    }

    goto LABEL_7;
  }
  v5 = (objc_class *)MEMORY[0x1E4F29128];
  id v6 = v4;
  id v7 = [v5 alloc];
  v8 = [v6 uuid];
  v9 = (void *)[v7 initWithUUIDString:v8];

  [v6 latitude];
  CLLocationDegrees v11 = v10;
  [v6 longitude];
  CLLocationCoordinate2D v13 = CLLocationCoordinate2DMake(v11, v12);
  uint64_t v14 = [v6 type];

  a1 = (id)objc_msgSend(a1, "initWithUUID:visits:coordinate:type:", v9, 0, objc_msgSend(a1, "_routineLOITypeFromProtoLOIType:", v14), v13.latitude, v13.longitude);
  id v15 = a1;
LABEL_8:

  return v15;
}

- (id)proto
{
  v2 = objc_opt_new();
  v3 = [a1 uuid];
  id v4 = [v3 UUIDString];
  [v2 setUuid:v4];

  [a1 coordinate];
  objc_msgSend(v2, "setLatitude:");
  [a1 coordinate];
  [v2 setLongitude:v5];
  objc_msgSend(v2, "setType:", objc_msgSend(a1, "_protoLOITypeFromRoutineLOIType:", objc_msgSend(a1, "type")));
  return v2;
}

- (uint64_t)_routineLOITypeFromProtoLOIType:()ProtoBufWrapper
{
  if (a3 < 5) {
    return a3 - 1;
  }
  id v6 = __atxlog_handle_default();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    [(ATXLocationOfInterest(ProtoBufWrapper) *)a1 _routineLOITypeFromProtoLOIType:v6];
  }

  id v7 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v8 = *MEMORY[0x1E4F1C3B8];
  v9 = (objc_class *)objc_opt_class();
  double v10 = NSStringFromClass(v9);
  CLLocationDegrees v11 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a3);
  [v7 raise:v8, @"%@ - _routineLOITypeFromProtoLOIType got unhandled LOI type of %@", v10, v11 format];

  return -1;
}

- (uint64_t)_protoLOITypeFromRoutineLOIType:()ProtoBufWrapper
{
  if (a3 < 4) {
    return (a3 + 1);
  }
  else {
    return 0;
  }
}

- (void)initWithProto:()ProtoBufWrapper .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  int v5 = 138412290;
  id v6 = v4;
  _os_log_fault_impl(&dword_1D0FA3000, a2, OS_LOG_TYPE_FAULT, "%@: tried to initialize with a non-ATXPBPredictionLocationOfInterest proto", (uint8_t *)&v5, 0xCu);
}

- (void)_routineLOITypeFromProtoLOIType:()ProtoBufWrapper .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  int v5 = (objc_class *)objc_opt_class();
  id v6 = NSStringFromClass(v5);
  uint64_t v7 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a2);
  *(_DWORD *)buf = 138412546;
  v9 = v6;
  __int16 v10 = 2112;
  CLLocationDegrees v11 = v7;
  _os_log_error_impl(&dword_1D0FA3000, a3, OS_LOG_TYPE_ERROR, "%@ - _routineLOITypeFromProtoLOIType got unhandled LOI type of %@", buf, 0x16u);
}

@end
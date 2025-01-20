@interface CLPrefetchFloorRequest
+ (BOOL)supportsSecureCoding;
+ (id)prefetchRequestForFloor:(id)a3 inVenue:(id)a4 lastRelevant:(id)a5 locationContext:(int64_t)a6;
- (BOOL)allowCellularDownload;
- (BOOL)hasCompleteFloor;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToRequest:(id)a3;
- (CLPrefetchFloorRequest)init;
- (CLPrefetchFloorRequest)initWithCoder:(id)a3;
- (CLPrefetchFloorRequest)initWithFloor:(id)a3 inVenue:(id)a4 lastRelevant:(id)a5 hasCompleteFloor:(BOOL)a6 allowCellularDownload:(BOOL)a7 locationContext:(int64_t)a8;
- (CLPrefetchFloorRequest)initWithFloor:(id)a3 inVenue:(id)a4 lastRelevant:(id)a5 hasCompleteFloor:(BOOL)a6 allowCellularDownload:(BOOL)a7 locationContext:(int64_t)a8 priority:(int64_t)a9;
- (CLPrefetchFloorRequest)initWithFloor:(id)a3 inVenue:(id)a4 lastRelevant:(id)a5 hasCompleteFloor:(BOOL)a6 allowCellularDownload:(BOOL)a7 locationContext:(int64_t)a8 ranking:(int64_t)a9;
- (CLPrefetchFloorRequest)initWithFloor:(id)a3 inVenue:(id)a4 lastRelevant:(id)a5 locationContext:(int64_t)a6;
- (CLPrefetchFloorRequest)initWithFloor:(id)a3 inVenue:(id)a4 lastRelevant:(id)a5 locationContext:(int64_t)a6 priority:(int64_t)a7;
- (CLPrefetchFloorRequest)initWithFloor:(id)a3 inVenue:(id)a4 lastRelevant:(id)a5 locationContext:(int64_t)a6 ranking:(int64_t)a7;
- (NSDate)relevancy;
- (NSString)floorUuid;
- (NSString)venueUuid;
- (id)description;
- (id)floorUid;
- (int64_t)locationContext;
- (int64_t)priority;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setAllowCellularDownload:(BOOL)a3;
- (void)setFloorUid:(id)a3;
- (void)setFloorUuid:(id)a3;
- (void)setHasCompleteFloor:(BOOL)a3;
- (void)setLocationContext:(int64_t)a3;
- (void)setPriority:(int64_t)a3;
- (void)setRelevancy:(id)a3;
- (void)setVenueUuid:(id)a3;
@end

@implementation CLPrefetchFloorRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)prefetchRequestForFloor:(id)a3 inVenue:(id)a4 lastRelevant:(id)a5 locationContext:(int64_t)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = [CLPrefetchFloorRequest alloc];
  Relevant_locationContext = objc_msgSend_initWithFloor_inVenue_lastRelevant_locationContext_(v12, v13, (uint64_t)v9, (uint64_t)v10, (uint64_t)v11, a6);

  return Relevant_locationContext;
}

- (CLPrefetchFloorRequest)init
{
  objc_msgSend_doesNotRecognizeSelector_(self, a2, (uint64_t)a2, v2, v3);
  abort();
}

- (CLPrefetchFloorRequest)initWithFloor:(id)a3 inVenue:(id)a4 lastRelevant:(id)a5 locationContext:(int64_t)a6
{
  return (CLPrefetchFloorRequest *)MEMORY[0x270F9A6D0](self, sel_initWithFloor_inVenue_lastRelevant_hasCompleteFloor_allowCellularDownload_locationContext_, a3, a4, a5);
}

- (CLPrefetchFloorRequest)initWithFloor:(id)a3 inVenue:(id)a4 lastRelevant:(id)a5 locationContext:(int64_t)a6 priority:(int64_t)a7
{
  return (CLPrefetchFloorRequest *)objc_msgSend_initWithFloor_inVenue_lastRelevant_hasCompleteFloor_allowCellularDownload_locationContext_ranking_(self, a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, 0, 1, a6, a7);
}

- (CLPrefetchFloorRequest)initWithFloor:(id)a3 inVenue:(id)a4 lastRelevant:(id)a5 locationContext:(int64_t)a6 ranking:(int64_t)a7
{
  return (CLPrefetchFloorRequest *)objc_msgSend_initWithFloor_inVenue_lastRelevant_hasCompleteFloor_allowCellularDownload_locationContext_ranking_(self, a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, 0, 1, a6, a7);
}

- (CLPrefetchFloorRequest)initWithFloor:(id)a3 inVenue:(id)a4 lastRelevant:(id)a5 hasCompleteFloor:(BOOL)a6 allowCellularDownload:(BOOL)a7 locationContext:(int64_t)a8 priority:(int64_t)a9
{
  return (CLPrefetchFloorRequest *)objc_msgSend_initWithFloor_inVenue_lastRelevant_hasCompleteFloor_allowCellularDownload_locationContext_ranking_(self, a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, 0, a7, a8);
}

- (CLPrefetchFloorRequest)initWithFloor:(id)a3 inVenue:(id)a4 lastRelevant:(id)a5 hasCompleteFloor:(BOOL)a6 allowCellularDownload:(BOOL)a7 locationContext:(int64_t)a8
{
  BOOL v9 = a7;
  BOOL v10 = a6;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  v21.receiver = self;
  v21.super_class = (Class)CLPrefetchFloorRequest;
  v17 = [(CLPrefetchFloorRequest *)&v21 init];
  if (v17) {
    hasCompleteFloor_allowCellularDownload_locationContext_priority = (CLPrefetchFloorRequest *)objc_msgSend_initWithFloor_inVenue_lastRelevant_hasCompleteFloor_allowCellularDownload_locationContext_priority_(v17, v18, (uint64_t)v14, (uint64_t)v15, (uint64_t)v16, v10, v9, a8, 1);
  }
  else {
    hasCompleteFloor_allowCellularDownload_locationContext_priority = 0;
  }

  return hasCompleteFloor_allowCellularDownload_locationContext_priority;
}

- (CLPrefetchFloorRequest)initWithFloor:(id)a3 inVenue:(id)a4 lastRelevant:(id)a5 hasCompleteFloor:(BOOL)a6 allowCellularDownload:(BOOL)a7 locationContext:(int64_t)a8 ranking:(int64_t)a9
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  v23.receiver = self;
  v23.super_class = (Class)CLPrefetchFloorRequest;
  v19 = [(CLPrefetchFloorRequest *)&v23 init];
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_floorUuid, a3);
    objc_storeStrong((id *)&v20->_venueUuid, a4);
    objc_storeStrong((id *)&v20->_relevancy, a5);
    v20->_hasCompleteFloor = a6;
    v20->_allowCellularDownload = a7;
    v20->_locationContext = a8;
    v20->_priority = a9;
    objc_super v21 = v20;
  }

  return v20;
}

- (CLPrefetchFloorRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  id v11 = objc_msgSend_decodeObjectForKey_(v4, v5, @"floorUuid", v6, v7);
  if (!v11)
  {
    id v11 = objc_msgSend_decodeObjectForKey_(v4, v8, @"floorUuid", v9, v10);
  }
  uint64_t v12 = objc_msgSend_decodeObjectForKey_(v4, v8, @"venueUuid", v9, v10);
  if (v12) {
    id v16 = (__CFString *)v12;
  }
  else {
    id v16 = @"mismatch between pipelined/CoreIndoor.framework";
  }
  id v17 = (void *)MEMORY[0x263EFF910];
  objc_msgSend_decodeDoubleForKey_(v4, v13, @"relevancy", v14, v15);
  v22 = objc_msgSend_dateWithTimeIntervalSinceReferenceDate_(v17, v18, v19, v20, v21);
  uint64_t v26 = objc_msgSend_decodeBoolForKey_(v4, v23, @"hasCompleteFloor", v24, v25);
  uint64_t v30 = objc_msgSend_decodeBoolForKey_(v4, v27, @"allowCellularDownload", v28, v29);
  uint64_t v34 = objc_msgSend_decodeIntegerForKey_(v4, v31, @"locationContext", v32, v33);
  uint64_t v38 = objc_msgSend_decodeIntegerForKey_(v4, v35, @"priority", v36, v37);
  hasCompleteFloor_allowCellularDownload_locationContext_priority = (CLPrefetchFloorRequest *)objc_msgSend_initWithFloor_inVenue_lastRelevant_hasCompleteFloor_allowCellularDownload_locationContext_priority_(self, v39, (uint64_t)v11, (uint64_t)v16, (uint64_t)v22, v26, v30, v34, v38);

  return hasCompleteFloor_allowCellularDownload_locationContext_priority;
}

- (void)encodeWithCoder:(id)a3
{
  id v25 = a3;
  objc_msgSend_encodeObject_forKey_(v25, v4, (uint64_t)self->_floorUuid, @"floorUuid", v5);
  objc_msgSend_encodeObject_forKey_(v25, v6, (uint64_t)self->_floorUuid, @"floorUuid", v7);
  objc_msgSend_encodeObject_forKey_(v25, v8, (uint64_t)self->_venueUuid, @"venueUuid", v9);
  objc_msgSend_timeIntervalSinceReferenceDate(self->_relevancy, v10, v11, v12, v13);
  objc_msgSend_encodeDouble_forKey_(v25, v14, @"relevancy", v15, v16);
  objc_msgSend_encodeBool_forKey_(v25, v17, self->_hasCompleteFloor, @"hasCompleteFloor", v18);
  objc_msgSend_encodeBool_forKey_(v25, v19, self->_allowCellularDownload, @"allowCellularDownload", v20);
  objc_msgSend_encodeInteger_forKey_(v25, v21, self->_locationContext, @"locationContext", v22);
  objc_msgSend_encodeInteger_forKey_(v25, v23, self->_priority, @"priority", v24);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    char isEqualToString = objc_msgSend_isEqualToString_(self->_floorUuid, v5, (uint64_t)v4, v6, v7);
  }
  else {
    char isEqualToString = objc_msgSend_isEqualToRequest_(self, v5, (uint64_t)v4, v6, v7);
  }
  BOOL v9 = isEqualToString;

  return v9;
}

- (BOOL)isEqualToRequest:(id)a3
{
  floorUuid = self->_floorUuid;
  uint64_t v6 = objc_msgSend_floorUuid(a3, a2, (uint64_t)a3, v3, v4);
  LOBYTE(floorUuid) = objc_msgSend_isEqualToString_(floorUuid, v7, (uint64_t)v6, v8, v9);

  return (char)floorUuid;
}

- (unint64_t)hash
{
  return ((uint64_t (*)(NSString *, char *))MEMORY[0x270F9A6D0])(self->_floorUuid, sel_hash);
}

- (id)description
{
  return self->_floorUuid;
}

- (id)floorUid
{
  return self->_floorUuid;
}

- (void)setFloorUid:(id)a3
{
}

- (NSString)floorUuid
{
  return self->_floorUuid;
}

- (void)setFloorUuid:(id)a3
{
}

- (NSString)venueUuid
{
  return self->_venueUuid;
}

- (void)setVenueUuid:(id)a3
{
}

- (NSDate)relevancy
{
  return self->_relevancy;
}

- (void)setRelevancy:(id)a3
{
}

- (BOOL)hasCompleteFloor
{
  return self->_hasCompleteFloor;
}

- (void)setHasCompleteFloor:(BOOL)a3
{
  self->_hasCompleteFloor = a3;
}

- (BOOL)allowCellularDownload
{
  return self->_allowCellularDownload;
}

- (void)setAllowCellularDownload:(BOOL)a3
{
  self->_allowCellularDownload = a3;
}

- (int64_t)locationContext
{
  return self->_locationContext;
}

- (void)setLocationContext:(int64_t)a3
{
  self->_locationContext = a3;
}

- (int64_t)priority
{
  return self->_priority;
}

- (void)setPriority:(int64_t)a3
{
  self->_priority = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_relevancy, 0);
  objc_storeStrong((id *)&self->_venueUuid, 0);
  objc_storeStrong((id *)&self->_floorUuid, 0);
}

@end
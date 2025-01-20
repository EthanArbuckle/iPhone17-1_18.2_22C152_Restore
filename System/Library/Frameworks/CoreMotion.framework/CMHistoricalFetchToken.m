@interface CMHistoricalFetchToken
+ (BOOL)supportsSecureCoding;
+ (id)cardioToken;
+ (id)mobilityToken;
- (BOOL)isEqual:(id)a3;
- (CMHistoricalFetchToken)initWithCoder:(id)a3;
- (CMHistoricalFetchToken)initWithType:(unint64_t)a3 cursorList:(id)a4;
- (NSMutableArray)tables;
- (double)endTime;
- (double)startTime;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)getProgressState;
- (unint64_t)fetchType;
- (unint64_t)hash;
- (unint64_t)version;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setEndTime:(double)a3;
- (void)setFetchType:(unint64_t)a3;
- (void)setStartTime:(double)a3;
- (void)setTables:(id)a3;
- (void)setVersion:(unint64_t)a3;
@end

@implementation CMHistoricalFetchToken

- (CMHistoricalFetchToken)initWithType:(unint64_t)a3 cursorList:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)CMHistoricalFetchToken;
  v8 = [(CMHistoricalFetchToken *)&v10 init];
  if (v8)
  {
    v8->_tables = (NSMutableArray *)objc_msgSend_mutableCopy(a4, v6, v7);
    v8->_version = 2;
    v8->_startTime = 0.0;
    v8->_endTime = 0.0;
    v8->_fetchType = a3;
  }
  return v8;
}

+ (id)cardioToken
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  v3 = objc_msgSend_arrayWithCapacity_(MEMORY[0x1E4F1CA48], a2, 8);
  v4 = [CMTableCursor alloc];
  id v6 = (id)objc_msgSend_initWithDatatype_(v4, v5, 0);
  objc_msgSend_addObject_(v3, v7, (uint64_t)v6);
  v8 = [CMTableCursor alloc];
  id v10 = (id)objc_msgSend_initWithDatatype_(v8, v9, 1);
  objc_msgSend_addObject_(v3, v11, (uint64_t)v10);
  v12 = [CMTableCursor alloc];
  id v14 = (id)objc_msgSend_initWithDatatype_(v12, v13, 2);
  objc_msgSend_addObject_(v3, v15, (uint64_t)v14);
  v16 = [CMTableCursor alloc];
  id v18 = (id)objc_msgSend_initWithDatatype_(v16, v17, 3);
  objc_msgSend_addObject_(v3, v19, (uint64_t)v18);
  v20 = [CMTableCursor alloc];
  id v22 = (id)objc_msgSend_initWithDatatype_(v20, v21, 4);
  objc_msgSend_addObject_(v3, v23, (uint64_t)v22);
  v24 = [CMTableCursor alloc];
  id v26 = (id)objc_msgSend_initWithDatatype_(v24, v25, 6);
  objc_msgSend_addObject_(v3, v27, (uint64_t)v26);
  v28 = [CMTableCursor alloc];
  id v30 = (id)objc_msgSend_initWithDatatype_(v28, v29, 5);
  objc_msgSend_addObject_(v3, v31, (uint64_t)v30);
  v32 = [CMTableCursor alloc];
  id v34 = (id)objc_msgSend_initWithDatatype_(v32, v33, 7);
  objc_msgSend_addObject_(v3, v35, (uint64_t)v34);
  if (objc_msgSend_count(v3, v36, v37) != 8)
  {
    if (qword_1E929D9F8 != -1) {
      dispatch_once(&qword_1E929D9F8, &unk_1EDFD1CA0);
    }
    v38 = qword_1E929DA00;
    if (os_log_type_enabled((os_log_t)qword_1E929DA00, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109376;
      int v48 = 8;
      __int16 v49 = 2048;
      uint64_t v50 = objc_msgSend_count(v3, v39, v40);
      _os_log_impl(&dword_1902AF000, v38, OS_LOG_TYPE_ERROR, "[HistoricalFetch] Expected %d cardio tables but initialized %lu", buf, 0x12u);
    }
    if (sub_1902D8400(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1E929D9F8 != -1) {
        dispatch_once(&qword_1E929D9F8, &unk_1EDFD1CA0);
      }
      objc_msgSend_count(v3, v44, v45);
      v46 = (char *)_os_log_send_and_compose_impl();
      sub_1902D398C("Generic", 1, 0, 0, "+[CMHistoricalFetchToken cardioToken]", "CoreLocation: %s\n", v46);
      if (v46 != (char *)buf) {
        free(v46);
      }
    }
  }
  id v41 = objc_alloc((Class)a1);
  return (id)objc_msgSend_initWithType_cursorList_(v41, v42, 0, v3);
}

+ (id)mobilityToken
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  v3 = objc_msgSend_arrayWithCapacity_(MEMORY[0x1E4F1CA48], a2, 5);
  v4 = [CMTableCursor alloc];
  id v6 = (id)objc_msgSend_initWithDatatype_(v4, v5, 0);
  objc_msgSend_addObject_(v3, v7, (uint64_t)v6);
  v8 = [CMTableCursor alloc];
  id v10 = (id)objc_msgSend_initWithDatatype_(v8, v9, 3);
  objc_msgSend_addObject_(v3, v11, (uint64_t)v10);
  v12 = [CMTableCursor alloc];
  id v14 = (id)objc_msgSend_initWithDatatype_(v12, v13, 1);
  objc_msgSend_addObject_(v3, v15, (uint64_t)v14);
  v16 = [CMTableCursor alloc];
  id v18 = (id)objc_msgSend_initWithDatatype_(v16, v17, 4);
  objc_msgSend_addObject_(v3, v19, (uint64_t)v18);
  v20 = [CMTableCursor alloc];
  id v22 = (id)objc_msgSend_initWithDatatype_(v20, v21, 2);
  objc_msgSend_addObject_(v3, v23, (uint64_t)v22);
  if (objc_msgSend_count(v3, v24, v25) != 5)
  {
    if (qword_1E929D9F8 != -1) {
      dispatch_once(&qword_1E929D9F8, &unk_1EDFD1CA0);
    }
    id v26 = qword_1E929DA00;
    if (os_log_type_enabled((os_log_t)qword_1E929DA00, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109376;
      int v36 = 5;
      __int16 v37 = 2048;
      uint64_t v38 = objc_msgSend_count(v3, v27, v28);
      _os_log_impl(&dword_1902AF000, v26, OS_LOG_TYPE_ERROR, "[HistoricalFetch] Expected %d mobility tables but initialized %lu", buf, 0x12u);
    }
    if (sub_1902D8400(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1E929D9F8 != -1) {
        dispatch_once(&qword_1E929D9F8, &unk_1EDFD1CA0);
      }
      objc_msgSend_count(v3, v32, v33);
      id v34 = (char *)_os_log_send_and_compose_impl();
      sub_1902D398C("Generic", 1, 0, 0, "+[CMHistoricalFetchToken mobilityToken]", "CoreLocation: %s\n", v34);
      if (v34 != (char *)buf) {
        free(v34);
      }
    }
  }
  id v29 = objc_alloc((Class)a1);
  return (id)objc_msgSend_initWithType_cursorList_(v29, v30, 1, v3);
}

- (void)dealloc
{
  self->_tables = 0;
  v3.receiver = self;
  v3.super_class = (Class)CMHistoricalFetchToken;
  [(CMHistoricalFetchToken *)&v3 dealloc];
}

- (CMHistoricalFetchToken)initWithCoder:(id)a3
{
  v18.receiver = self;
  v18.super_class = (Class)CMHistoricalFetchToken;
  v4 = [(CMHistoricalFetchToken *)&v18 init];
  if (v4)
  {
    v5 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = objc_opt_class();
    uint64_t v9 = objc_msgSend_setWithObjects_(v5, v8, v6, v7, 0);
    v4->_tables = (NSMutableArray *)(id)objc_msgSend_decodeObjectOfClasses_forKey_(a3, v10, v9, @"kCMHistoricalFetchTokenCodingKeyTables");
    v4->_version = objc_msgSend_decodeIntegerForKey_(a3, v11, @"kCMHistoricalFetchTokenCodingKeyVersion");
    v4->_fetchType = objc_msgSend_decodeIntegerForKey_(a3, v12, @"kCMHistoricalFetchTokenCodingKeyFetchType");
    objc_msgSend_decodeDoubleForKey_(a3, v13, @"kCMHistoricalFetchTokenCodingKeyStartTime");
    v4->_startTime = v14;
    objc_msgSend_decodeDoubleForKey_(a3, v15, @"kCMHistoricalFetchTokenCodingKeyEndTime");
    v4->_endTime = v16;
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend_encodeObject_forKey_(a3, a2, (uint64_t)self->_tables, @"kCMHistoricalFetchTokenCodingKeyTables");
  objc_msgSend_encodeInteger_forKey_(a3, v5, self->_version, @"kCMHistoricalFetchTokenCodingKeyVersion");
  objc_msgSend_encodeInteger_forKey_(a3, v6, self->_fetchType, @"kCMHistoricalFetchTokenCodingKeyFetchType");
  objc_msgSend_encodeDouble_forKey_(a3, v7, @"kCMHistoricalFetchTokenCodingKeyStartTime", self->_startTime);
  double endTime = self->_endTime;

  objc_msgSend_encodeDouble_forKey_(a3, v8, @"kCMHistoricalFetchTokenCodingKeyEndTime", endTime);
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_opt_class();
  uint64_t v7 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  uint64_t v9 = objc_msgSend_initWithType_cursorList_(v7, v8, self->_fetchType, self->_tables);
  objc_msgSend_setStartTime_(v9, v10, v11, self->_startTime);
  objc_msgSend_setEndTime_(v9, v12, v13, self->_endTime);
  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_11;
  }
  uint64_t v7 = objc_msgSend_tables(self, v5, v6);
  uint64_t v10 = objc_msgSend_count(v7, v8, v9);
  uint64_t v13 = objc_msgSend_tables(a3, v11, v12);
  if (v10 != objc_msgSend_count(v13, v14, v15)) {
    goto LABEL_11;
  }
  uint64_t v18 = objc_msgSend_version(self, v16, v17);
  if (v18 != objc_msgSend_version(a3, v19, v20)) {
    goto LABEL_11;
  }
  uint64_t Type = objc_msgSend_fetchType(self, v21, v22);
  if (Type == objc_msgSend_fetchType(a3, v24, v25)
    && (objc_msgSend_startTime(self, v26, v27), double v29 = v28, objc_msgSend_startTime(a3, v30, v31), v29 == v34)
    && (objc_msgSend_endTime(self, v32, v33), double v36 = v35, objc_msgSend_endTime(a3, v37, v38), v36 == v41))
  {
    v42 = objc_msgSend_tables(self, v39, v40);
    if (objc_msgSend_count(v42, v43, v44))
    {
      unint64_t v47 = 0;
      int v48 = 1;
      do
      {
        __int16 v49 = objc_msgSend_tables(self, v45, v46);
        uint64_t v51 = objc_msgSend_objectAtIndexedSubscript_(v49, v50, v47);
        v54 = objc_msgSend_tables(a3, v52, v53);
        uint64_t v56 = objc_msgSend_objectAtIndexedSubscript_(v54, v55, v47);
        v48 &= objc_msgSend_isEqual_(v51, v57, v56);
        ++v47;
        v60 = objc_msgSend_tables(self, v58, v59);
      }
      while (objc_msgSend_count(v60, v61, v62) > v47);
    }
    else
    {
      LOBYTE(v48) = 1;
    }
  }
  else
  {
LABEL_11:
    LOBYTE(v48) = 0;
  }
  return v48;
}

- (unint64_t)hash
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = objc_msgSend_version(self, a2, v2);
  double v7 = (double)(unint64_t)(31 * (objc_msgSend_fetchType(self, v5, v6) - v4 + 32 * v4) + 29791);
  objc_msgSend_startTime(self, v8, v9);
  double v11 = (double)(31 * (unint64_t)(v10 + v7));
  objc_msgSend_endTime(self, v12, v13);
  unint64_t v15 = (unint64_t)(v14 + v11);
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  uint64_t v18 = objc_msgSend_tables(self, v16, v17, 0);
  uint64_t v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v19, (uint64_t)&v27, v31, 16);
  if (v20)
  {
    uint64_t v23 = v20;
    uint64_t v24 = *(void *)v28;
    do
    {
      uint64_t v25 = 0;
      do
      {
        if (*(void *)v28 != v24) {
          objc_enumerationMutation(v18);
        }
        unint64_t v15 = objc_msgSend_hash(*(void **)(*((void *)&v27 + 1) + 8 * v25++), v21, v22) - v15 + 32 * v15;
      }
      while (v23 != v25);
      uint64_t v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v21, (uint64_t)&v27, v31, 16);
    }
    while (v23);
  }
  return v15;
}

- (id)description
{
  objc_super v3 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  uint64_t v8 = objc_msgSend_version(self, v6, v7);
  uint64_t Type = objc_msgSend_fetchType(self, v9, v10);
  objc_msgSend_startTime(self, v12, v13);
  uint64_t v15 = v14;
  objc_msgSend_endTime(self, v16, v17);
  uint64_t v19 = v18;
  uint64_t v22 = objc_msgSend_tables(self, v20, v21);
  return (id)objc_msgSend_stringWithFormat_(v3, v23, @"%@, <version, %lu, fetchType, %lu, startTime, %f, endTime, %f, tables, %@>", v5, v8, Type, v15, v19, v22);
}

- (id)getProgressState
{
  return self->_tables;
}

- (NSMutableArray)tables
{
  return self->_tables;
}

- (void)setTables:(id)a3
{
}

- (unint64_t)version
{
  return self->_version;
}

- (void)setVersion:(unint64_t)a3
{
  self->_version = a3;
}

- (unint64_t)fetchType
{
  return self->_fetchType;
}

- (void)setFetchType:(unint64_t)a3
{
  self->_fetchuint64_t Type = a3;
}

- (double)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(double)a3
{
  self->_startTime = a3;
}

- (double)endTime
{
  return self->_endTime;
}

- (void)setEndTime:(double)a3
{
  self->_double endTime = a3;
}

@end
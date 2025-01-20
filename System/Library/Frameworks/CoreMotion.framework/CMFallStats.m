@interface CMFallStats
+ (BOOL)supportsSecureCoding;
- (BOOL)isNearFall;
- (CMFallStats)initWithBufferAndLength:(char *)a3 length:(unint64_t)a4;
- (CMFallStats)initWithCoder:(id)a3;
- (CMFallStats)initWithData:(id)a3;
- (NSString)description;
- (double)iOStime;
- (id)binarySampleRepresentation;
- (id)itemsIterator;
- (id)sr_exportRepresentationEnumerator;
- (int)fallType;
- (void)_decodeMeta;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CMFallStats

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CMFallStats)initWithCoder:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)CMFallStats;
  v4 = [(CMFallStats *)&v10 init];
  if (v4)
  {
    uint64_t v5 = objc_opt_class();
    v4->_data = (NSData *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v6, v5, @"kCMFallStatsCodingKeyData");
    objc_msgSend__decodeMeta(v4, v7, v8);
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
}

- (CMFallStats)initWithData:(id)a3
{
  if (!objc_msgSend_length(a3, a2, (uint64_t)a3)) {
    return 0;
  }
  v11.receiver = self;
  v11.super_class = (Class)CMFallStats;
  v7 = [(CMFallStats *)&v11 init];
  if (v7)
  {
    v7->_data = (NSData *)objc_msgSend_copy(a3, v5, v6);
    objc_msgSend__decodeMeta(v7, v8, v9);
  }
  return v7;
}

- (CMFallStats)initWithBufferAndLength:(char *)a3 length:(unint64_t)a4
{
  if (!a3) {
    return 0;
  }
  v11.receiver = self;
  v11.super_class = (Class)CMFallStats;
  v7 = [(CMFallStats *)&v11 init];
  if (v7)
  {
    v7->_data = (NSData *)(id)objc_msgSend_dataWithBytes_length_(MEMORY[0x1E4F1C9B8], v6, (uint64_t)a3, a4);
    objc_msgSend__decodeMeta(v7, v8, v9);
  }
  return v7;
}

- (id)itemsIterator
{
  v3 = [CMFallStatsItemsIterator alloc];
  uint64_t v5 = objc_msgSend_initWithData_(v3, v4, (uint64_t)self->_data);

  return v5;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CMFallStats;
  [(CMFallStats *)&v3 dealloc];
}

- (void)_decodeMeta
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  self->_iOStime = 0.0;
  self->_fallType = 0;
  self->_isNearFall = 0;
  if (self->_data)
  {
    sub_190384F88(v32, a2);
    uint64_t v5 = objc_msgSend_bytes(self->_data, v3, v4);
    uint64_t v8 = objc_msgSend_length(self->_data, v6, v7);
    v31[0] = &unk_1EDFD0398;
    v31[1] = v5;
    v31[2] = v8;
    if (sub_190385098((uint64_t)v32, (uint64_t)v31))
    {
      sub_190384EF4(&v28, (uint64_t)v32);
      while (v28)
      {
        if (self->_iOStime != 0.0) {
          break;
        }
        uint64_t v9 = *(void *)(v29 + 1000);
        if (v9)
        {
          uint64_t v10 = *(void *)(v9 + 88);
          if (v10)
          {
            double v11 = *(double *)(v29 + 616);
            self->_iOStime = v11;
            self->_fallType = *(_DWORD *)(v10 + 12);
            self->_isNearFall = *(unsigned char *)(v10 + 70);
            if (v11 != 0.0)
            {
              if (qword_1E929D8E8 != -1) {
                dispatch_once(&qword_1E929D8E8, &unk_1EDFD1640);
              }
              v12 = qword_1E929D8F0;
              if (os_log_type_enabled((os_log_t)qword_1E929D8F0, OS_LOG_TYPE_DEBUG))
              {
                v15 = objc_msgSend_description(self, v13, v14);
                uint64_t v18 = objc_msgSend_UTF8String(v15, v16, v17);
                *(_DWORD *)buf = 136315138;
                uint64_t v36 = v18;
                _os_log_impl(&dword_1902AF000, v12, OS_LOG_TYPE_DEBUG, "Decoded CMFallStats meta and found fall snippet metadata item [%s]", buf, 0xCu);
              }
              if (sub_1902D8400(115, 2))
              {
                bzero(buf, 0x65CuLL);
                if (qword_1E929D8E8 != -1) {
                  dispatch_once(&qword_1E929D8E8, &unk_1EDFD1640);
                }
                v21 = objc_msgSend_description(self, v19, v20);
                uint64_t v24 = objc_msgSend_UTF8String(v21, v22, v23);
                int v33 = 136315138;
                uint64_t v34 = v24;
                v25 = (char *)_os_log_send_and_compose_impl();
                sub_1902D398C("Generic", 1, 0, 2, "-[CMFallStats _decodeMeta]", "CoreLocation: %s\n", v25);
                if (v25 != (char *)buf) {
                  free(v25);
                }
              }
            }
          }
        }
        sub_19046A998((uint64_t)v26, (uint64_t)&v28);
        if (v27) {
          sub_1902D8B58(v27);
        }
      }
      sub_190384FD0((uint64_t)v32);
      if (v30) {
        sub_1902D8B58(v30);
      }
    }
    sub_190384FCC((uint64_t)v32);
  }
}

- (NSString)description
{
  objc_super v3 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  return (NSString *)objc_msgSend_stringWithFormat_(v3, v6, @"%@, Time,%.3lf,Type,CMFallStats,fallType,%d,isNearFall,%d", v5, *(void *)&self->_iOStime, self->_fallType, self->_isNearFall);
}

- (double)iOStime
{
  return self->_iOStime;
}

- (int)fallType
{
  return self->_fallType;
}

- (BOOL)isNearFall
{
  return self->_isNearFall;
}

- (id)binarySampleRepresentation
{
  return self->_data;
}

- (id)sr_exportRepresentationEnumerator
{
  return (id)((uint64_t (*)(CMFallStats *, char *))MEMORY[0x1F4181798])(self, sel_itemsIterator);
}

@end
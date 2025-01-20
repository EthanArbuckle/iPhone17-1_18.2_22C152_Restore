@interface IDSProtobuf
+ (id)keyRepresentationForType:(unsigned __int16)a3 isResponse:(BOOL)a4;
- (BOOL)isResponse;
- (IDSMessageContext)context;
- (IDSProtobuf)init;
- (IDSProtobuf)initWithCoder:(id)a3;
- (IDSProtobuf)initWithDictionary:(id)a3;
- (IDSProtobuf)initWithProtobufData:(id)a3 type:(unsigned __int16)a4 isResponse:(BOOL)a5;
- (NSData)data;
- (NSData)uncompressedData;
- (id)description;
- (id)dictionaryRepresentation;
- (id)dictionaryRepresentationWithUncompressedData;
- (unsigned)type;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setContext:(id)a3;
- (void)setData:(id)a3;
- (void)setIsResponse:(BOOL)a3;
- (void)setType:(unsigned __int16)a3;
- (void)setUncompressedData:(id)a3;
@end

@implementation IDSProtobuf

+ (id)keyRepresentationForType:(unsigned __int16)a3 isResponse:(BOOL)a4
{
  if (a4) {
    int v5 = 0x10000;
  }
  else {
    int v5 = 0;
  }
  return (id)objc_msgSend_numberWithUnsignedInt_(NSNumber, a2, v5 | a3, v4);
}

- (id)description
{
  int v5 = NSString;
  unsigned int v6 = objc_msgSend_type(self, a2, v2, v3);
  unsigned int isResponse = objc_msgSend_isResponse(self, v7, v8, v9);
  v14 = objc_msgSend_data(self, v11, v12, v13);
  uint64_t v18 = objc_msgSend_length(v14, v15, v16, v17);
  v21 = objc_msgSend_stringWithFormat_(v5, v19, @"IDSProtobuf %p type %d isResponse %d data length %lu", v20, self, v6, isResponse, v18);

  return v21;
}

- (IDSProtobuf)initWithProtobufData:(id)a3 type:(unsigned __int16)a4 isResponse:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v6 = a4;
  id v8 = a3;
  v25.receiver = self;
  v25.super_class = (Class)IDSProtobuf;
  double v9 = [(IDSProtobuf *)&v25 init];
  v10 = v9;
  if (v9)
  {
    v11 = v9;
    objc_sync_enter(v11);
    id v12 = objc_alloc(MEMORY[0x1E4F1CA60]);
    uint64_t v15 = objc_msgSend_initWithCapacity_(v12, v13, 3, v14);
    CFMutableDictionaryRef v16 = v11[1];
    v11[1] = (CFMutableDictionaryRef)v15;

    id v17 = v8;
    if (v17) {
      CFDictionarySetValue(v11[1], @"IDSProtoBufDataKey", v17);
    }

    double v20 = objc_msgSend_numberWithUnsignedShort_(NSNumber, v18, v6, v19);
    if (v20) {
      CFDictionarySetValue(v11[1], @"IDSProtoBufTypeKey", v20);
    }

    v23 = objc_msgSend_numberWithBool_(NSNumber, v21, v5, v22);
    if (v23) {
      CFDictionarySetValue(v11[1], @"IDSProtoBufIsResponseKey", v23);
    }

    objc_sync_exit(v11);
  }

  return v10;
}

- (IDSProtobuf)initWithDictionary:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v15.receiver = self;
    v15.super_class = (Class)IDSProtobuf;
    BOOL v5 = [(IDSProtobuf *)&v15 init];
    uint64_t v6 = v5;
    if (v5)
    {
      v7 = v5;
      objc_sync_enter(v7);
      uint64_t v11 = objc_msgSend_mutableCopy(v4, v8, v9, v10);
      protoBufParams = v7->_protoBufParams;
      v7->_protoBufParams = (NSMutableDictionary *)v11;

      objc_sync_exit(v7);
    }
    self = v6;
    double v13 = self;
  }
  else
  {
    double v13 = 0;
  }

  return v13;
}

- (IDSProtobuf)init
{
  v8.receiver = self;
  v8.super_class = (Class)IDSProtobuf;
  uint64_t v2 = [(IDSProtobuf *)&v8 init];
  double v3 = v2;
  if (v2)
  {
    id v4 = v2;
    objc_sync_enter(v4);
    BOOL v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    protoBufParams = v4->_protoBufParams;
    v4->_protoBufParams = v5;

    objc_sync_exit(v4);
  }
  return v3;
}

- (void)dealloc
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  objc_sync_exit(v2);

  v3.receiver = v2;
  v3.super_class = (Class)IDSProtobuf;
  [(IDSProtobuf *)&v3 dealloc];
}

- (id)dictionaryRepresentation
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  uint64_t v6 = objc_msgSend_mutableCopy(v2->_protoBufParams, v3, v4, v5);
  objc_msgSend_removeObjectForKey_(v6, v7, @"IDSProtoBufMessageContextKey", v8);
  objc_sync_exit(v2);

  return v6;
}

- (id)dictionaryRepresentationWithUncompressedData
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  uint64_t v6 = objc_msgSend_mutableCopy(v2->_protoBufParams, v3, v4, v5);
  objc_msgSend_removeObjectForKey_(v6, v7, @"IDSProtoBufMessageContextKey", v8);
  objc_msgSend_setObject_forKey_(v6, v9, (uint64_t)v2->_uncompressedData, v10, @"IDSProtoBufDataKey");
  objc_sync_exit(v2);

  return v6;
}

- (void)setData:(id)a3
{
  id v7 = a3;
  uint64_t v4 = self;
  objc_sync_enter(v4);
  objc_msgSend_setObject_forKey_(v4->_protoBufParams, v5, (uint64_t)v7, v6, @"IDSProtoBufDataKey");
  objc_sync_exit(v4);
}

- (NSData)data
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  double v5 = objc_msgSend_objectForKey_(v2->_protoBufParams, v3, @"IDSProtoBufDataKey", v4);
  objc_sync_exit(v2);

  return (NSData *)v5;
}

- (void)setType:(unsigned __int16)a3
{
  uint64_t v3 = a3;
  obj = self;
  objc_sync_enter(obj);
  protoBufParams = obj->_protoBufParams;
  id v7 = objc_msgSend_numberWithUnsignedShort_(NSNumber, v5, v3, v6);
  objc_msgSend_setObject_forKey_(protoBufParams, v8, (uint64_t)v7, v9, @"IDSProtoBufTypeKey");

  objc_sync_exit(obj);
}

- (unsigned)type
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  double v5 = objc_msgSend_objectForKey_(v2->_protoBufParams, v3, @"IDSProtoBufTypeKey", v4);
  unsigned __int16 v9 = objc_msgSend_unsignedIntegerValue(v5, v6, v7, v8);

  objc_sync_exit(v2);
  return v9;
}

- (void)setIsResponse:(BOOL)a3
{
  BOOL v3 = a3;
  obj = self;
  objc_sync_enter(obj);
  protoBufParams = obj->_protoBufParams;
  uint64_t v7 = objc_msgSend_numberWithBool_(NSNumber, v5, v3, v6);
  objc_msgSend_setObject_forKey_(protoBufParams, v8, (uint64_t)v7, v9, @"IDSProtoBufIsResponseKey");

  objc_sync_exit(obj);
}

- (BOOL)isResponse
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  double v5 = objc_msgSend_objectForKey_(v2->_protoBufParams, v3, @"IDSProtoBufIsResponseKey", v4);
  char v9 = objc_msgSend_BOOLValue(v5, v6, v7, v8);

  objc_sync_exit(v2);
  return v9;
}

- (IDSMessageContext)context
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  double v5 = objc_msgSend_objectForKey_(v2->_protoBufParams, v3, @"IDSProtoBufMessageContextKey", v4);
  objc_sync_exit(v2);

  return (IDSMessageContext *)v5;
}

- (void)setContext:(id)a3
{
  uint64_t v7 = (char *)a3;
  double v4 = self;
  objc_sync_enter(v4);
  protoBufParams = v4->_protoBufParams;
  if (v7) {
    objc_msgSend_setObject_forKey_(protoBufParams, v7, (uint64_t)v7, v5, @"IDSProtoBufMessageContextKey");
  }
  else {
    objc_msgSend_removeObjectForKey_(protoBufParams, 0, @"IDSProtoBufMessageContextKey", v5);
  }
  objc_sync_exit(v4);
}

- (void)encodeWithCoder:(id)a3
{
  id v7 = a3;
  double v4 = self;
  objc_sync_enter(v4);
  objc_msgSend_encodeObject_forKey_(v7, v5, (uint64_t)v4->_protoBufParams, v6, @"protobufparams");
  objc_sync_exit(v4);
}

- (IDSProtobuf)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)IDSProtobuf;
  double v5 = [(IDSProtobuf *)&v13 init];
  double v6 = v5;
  if (v5)
  {
    id v7 = v5;
    objc_sync_enter(v7);
    uint64_t v10 = objc_msgSend_decodeObjectForKey_(v4, v8, @"protobufparams", v9);
    protoBufParams = v7->_protoBufParams;
    v7->_protoBufParams = (NSMutableDictionary *)v10;

    objc_sync_exit(v7);
  }

  return v6;
}

- (NSData)uncompressedData
{
  return self->_uncompressedData;
}

- (void)setUncompressedData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uncompressedData, 0);
  objc_storeStrong((id *)&self->_protoBufParams, 0);
}

@end
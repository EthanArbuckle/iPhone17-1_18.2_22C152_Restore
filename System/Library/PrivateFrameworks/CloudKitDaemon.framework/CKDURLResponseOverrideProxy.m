@interface CKDURLResponseOverrideProxy
- (CKDURLResponseOverrideProxy)initWithResponse:(id)a3 overrides:(id)a4;
- (id)allHeaderFields;
- (id)forwardingTargetForSelector:(SEL)a3;
- (id)valueForHTTPHeaderField:(id)a3;
- (int64_t)statusCode;
@end

@implementation CKDURLResponseOverrideProxy

- (CKDURLResponseOverrideProxy)initWithResponse:(id)a3 overrides:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  objc_storeStrong((id *)&self->_realResponse, a3);
  v10 = objc_msgSend_objectForKeyedSubscript_(v8, v9, @"HTTPResponseStatusOverride");
  v13 = v10;
  if (v10) {
    int64_t v14 = objc_msgSend_integerValue(v10, v11, v12);
  }
  else {
    int64_t v14 = objc_msgSend_statusCode(v7, v11, v12);
  }
  self->_statusCode = v14;
  objc_msgSend_objectForKeyedSubscript_(v8, v15, @"HTTPResponseHeaderOverrides");
  v16 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  responseHeaderOverrides = self->_responseHeaderOverrides;
  self->_responseHeaderOverrides = v16;

  return self;
}

- (int64_t)statusCode
{
  return self->_statusCode;
}

- (id)allHeaderFields
{
  v4 = objc_msgSend_allHeaderFields(self->_realResponse, a2, v2);
  id v7 = objc_msgSend_mutableCopy(v4, v5, v6);

  objc_msgSend_addEntriesFromDictionary_(v7, v8, (uint64_t)self->_responseHeaderOverrides);
  v11 = objc_msgSend_copy(v7, v9, v10);

  return v11;
}

- (id)valueForHTTPHeaderField:(id)a3
{
  id v4 = a3;
  id v7 = objc_msgSend_objectForKey_(self->_responseHeaderOverrides, v5, (uint64_t)v4);
  if (!v7)
  {
    id v7 = objc_msgSend_valueForHTTPHeaderField_(self->_realResponse, v6, (uint64_t)v4);
  }

  return v7;
}

- (id)forwardingTargetForSelector:(SEL)a3
{
  return self->_realResponse;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responseHeaderOverrides, 0);
  objc_storeStrong((id *)&self->_realResponse, 0);
}

@end
@interface MTRReadClientContainer
- (AttributePathParams)pathParams;
- (EventPathParams)eventPathParams;
- (unint64_t)deviceID;
- (void)callback;
- (void)cleanup;
- (void)onDone;
- (void)readClientPtr;
- (void)setCallback:(void *)a3;
- (void)setDeviceID:(unint64_t)a3;
- (void)setEventPathParams:(EventPathParams *)a3;
- (void)setPathParams:(AttributePathParams *)a3;
- (void)setReadClientPtr:(void *)a3;
@end

@implementation MTRReadClientContainer

- (void)cleanup
{
  readClientPtr = (void (***)(void *, SEL))self->_readClientPtr;
  if (readClientPtr)
  {
    (**readClientPtr)(self->_readClientPtr, a2);
    j__free(readClientPtr);
    self->_readClientPtr = 0;
  }
  pathParams = self->_pathParams;
  if (pathParams)
  {
    j__free(pathParams);
    self->_pathParams = 0;
  }
  eventPathParams = self->_eventPathParams;
  if (eventPathParams)
  {
    j__free(eventPathParams);
    self->_eventPathParams = 0;
  }
  callback = self->_callback;
  if (callback)
  {
    v7 = (void *)sub_2447E6B08((uint64_t)callback);
    j__free(v7);
    self->_callback = 0;
  }
}

- (void)onDone
{
  objc_msgSend_cleanup(self, a2, v2);
  unint64_t deviceID = self->_deviceID;
  if (qword_268EBE918 != -1) {
    dispatch_once(&qword_268EBE918, &unk_26F944D20);
  }
  objc_msgSend_numberWithUnsignedLongLong_(NSNumber, v4, deviceID);
  id v19 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_lock((void *)qword_268EBE908, v6, v7);
  v11 = objc_msgSend_objectForKeyedSubscript_((void *)qword_268EBE910, v8, (uint64_t)v19);
  unint64_t v12 = 0;
  while (v12 < objc_msgSend_count(v11, v9, v10))
  {
    v15 = objc_msgSend_objectAtIndexedSubscript_(v11, v13, v12);
    uint64_t ClientPtr = objc_msgSend_readClientPtr(v15, v16, v17);

    if (ClientPtr) {
      ++v12;
    }
    else {
      objc_msgSend_removeObjectAtIndex_(v11, v9, v12);
    }
  }
  objc_msgSend_unlock((void *)qword_268EBE908, v13, v14);
}

- (void)readClientPtr
{
  return self->_readClientPtr;
}

- (void)setReadClientPtr:(void *)a3
{
  self->_readuint64_t ClientPtr = a3;
}

- (void)callback
{
  return self->_callback;
}

- (void)setCallback:(void *)a3
{
  self->_callback = a3;
}

- (AttributePathParams)pathParams
{
  return self->_pathParams;
}

- (void)setPathParams:(AttributePathParams *)a3
{
  self->_pathParams = a3;
}

- (EventPathParams)eventPathParams
{
  return self->_eventPathParams;
}

- (void)setEventPathParams:(EventPathParams *)a3
{
  self->_eventPathParams = a3;
}

- (unint64_t)deviceID
{
  return self->_deviceID;
}

- (void)setDeviceID:(unint64_t)a3
{
  self->_unint64_t deviceID = a3;
}

@end
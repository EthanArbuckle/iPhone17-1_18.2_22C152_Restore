@interface IASTextInputUserPreferenceStateEvent
- (BOOL)isDispatchable;
- (NSString)preferenceName;
- (int64_t)preferenceValue;
- (void)dispatchEvent:(id)a3;
- (void)setPreferenceName:(id)a3;
- (void)setPreferenceValue:(int64_t)a3;
@end

@implementation IASTextInputUserPreferenceStateEvent

- (void)dispatchEvent:(id)a3
{
  v17[2] = *MEMORY[0x263EF8340];
  v4 = (void (**)(id, void *))a3;
  int isDispatchable = objc_msgSend_isDispatchable(self, v5, v6, v7);
  if (v4 && isDispatchable)
  {
    preferenceName = self->_preferenceName;
    int64_t preferenceValue = self->_preferenceValue;
    v16[0] = @"preferenceName";
    v16[1] = @"currentValue";
    v17[0] = preferenceName;
    v13 = objc_msgSend_numberWithInteger_(NSNumber, v9, preferenceValue, v10);
    v17[1] = v13;
    v15 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v14, (uint64_t)v17, (uint64_t)v16, 2);

    v4[2](v4, v15);
  }
}

- (BOOL)isDispatchable
{
  return self->_preferenceName != 0;
}

- (NSString)preferenceName
{
  return self->_preferenceName;
}

- (void)setPreferenceName:(id)a3
{
}

- (int64_t)preferenceValue
{
  return self->_preferenceValue;
}

- (void)setPreferenceValue:(int64_t)a3
{
  self->_int64_t preferenceValue = a3;
}

- (void).cxx_destruct
{
}

@end
@interface MTRAttributeReport
- (MTRAttributePath)path;
- (MTRAttributeReport)initWithPath:(const void *)a3 value:(id)a4 error:(id)a5;
- (MTRAttributeReport)initWithResponseValue:(NSDictionary *)responseValue error:(NSError *)error;
- (NSError)error;
- (id)copyWithZone:(_NSZone *)a3;
- (id)value;
@end

@implementation MTRAttributeReport

- (MTRAttributeReport)initWithPath:(const void *)a3 value:(id)a4 error:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)MTRAttributeReport;
  v11 = [(MTRAttributeReport *)&v17 init];
  if (v11)
  {
    v12 = [MTRAttributePath alloc];
    uint64_t v14 = objc_msgSend_initWithPath_(v12, v13, (uint64_t)a3);
    path = v11->_path;
    v11->_path = (MTRAttributePath *)v14;

    objc_storeStrong(&v11->_value, a4);
    objc_storeStrong((id *)&v11->_error, a5);
  }

  return v11;
}

- (MTRAttributeReport)initWithResponseValue:(NSDictionary *)responseValue error:(NSError *)error
{
  v6 = responseValue;
  v35.receiver = self;
  v35.super_class = (Class)MTRAttributeReport;
  v7 = [(MTRAttributeReport *)&v35 init];
  if (v7)
  {
    uint64_t v8 = objc_opt_class();
    if (sub_2447DE310(v6, @"attributePath", v8, @"response-value attribute path is not an MTRAttributePath.", error))
    {
      id v10 = objc_msgSend_objectForKeyedSubscript_(v6, v9, @"attributePath");
      v12 = objc_msgSend_objectForKeyedSubscript_(v6, v11, @"error");
      if (v12)
      {
        uint64_t v13 = objc_opt_class();
        if (sub_2447DE310(v6, @"error", v13, @"response-value error is not an NSError.", error))
        {
          objc_storeStrong((id *)&v7->_path, v10);
          id value = v7->_value;
          v7->_id value = 0;

          objc_storeStrong((id *)&v7->_error, v12);
          v15 = v7;
LABEL_19:

          goto LABEL_20;
        }
LABEL_12:
        v15 = 0;
        goto LABEL_19;
      }
      uint64_t v16 = objc_opt_class();
      if (!sub_2447DE310(v6, @"data", v16, @"response-value data is not a data-value dictionary.", error))goto LABEL_12; {
      v18 = objc_msgSend_objectForKeyedSubscript_(v6, v17, @"data");
      }
      v33 = 0;
      v34 = 0;
      sub_244CB3988((uint64_t)v32);
      if ((sub_2447E2870(&v34, &v33, v18, (uint64_t)v32, error) & 1) == 0)
      {
        v15 = 0;
LABEL_18:
        sub_2446D7EC0(&v33);
        sub_244794634(&v34);

        goto LABEL_19;
      }
      uint64_t v21 = objc_msgSend__asConcretePath(v10, v19, v20);
      int v31 = v22;
      long long v28 = xmmword_2651951E0;
      uint64_t v29 = 3198;
      uint64_t v30 = v21;
      v23 = sub_244B9BC80((uint64_t)&v30, (uint64_t)v32, (uint64_t)&v28);
      if (v28 == 181)
      {
        v25 = @"No known schema for decoding attribute value.";
        uint64_t v26 = 12;
      }
      else
      {
        if (!v28)
        {
          objc_storeStrong((id *)&v7->_path, v10);
          objc_storeStrong(&v7->_value, v23);
          v24 = v7->_error;
          v7->_error = 0;

          v15 = v7;
LABEL_17:

          goto LABEL_18;
        }
        v25 = @"Attribute decoding failed schema check.";
        uint64_t v26 = 13;
      }
      sub_2447DE428(v25, v26, error);
      v15 = 0;
      goto LABEL_17;
    }
  }
  v15 = 0;
LABEL_20:

  return v15;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [MTRAttributeReport alloc];
  v7 = objc_msgSend_path(self, v5, v6);
  uint64_t v19 = objc_msgSend__asConcretePath(v7, v8, v9);
  int v20 = (int)v10;
  __int16 v21 = 0;
  char v22 = 0;
  char v23 = 0;
  v12 = objc_msgSend_value(self, v10, v11);
  v15 = objc_msgSend_error(self, v13, v14);
  objc_super v17 = objc_msgSend_initWithPath_value_error_(v4, v16, (uint64_t)&v19, v12, v15);

  return v17;
}

- (MTRAttributePath)path
{
  return self->_path;
}

- (id)value
{
  return self->_value;
}

- (NSError)error
{
  return self->_error;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong(&self->_value, 0);

  objc_storeStrong((id *)&self->_path, 0);
}

@end
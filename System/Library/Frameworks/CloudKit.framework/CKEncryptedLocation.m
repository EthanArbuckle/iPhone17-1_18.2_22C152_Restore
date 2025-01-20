@interface CKEncryptedLocation
- (CKEncryptedLocation)initWithLocation:(id)a3;
- (CLLocation)location;
- (id)value;
@end

@implementation CKEncryptedLocation

- (CKEncryptedLocation)initWithLocation:(id)a3
{
  id v4 = a3;
  id v32 = 0;
  char v5 = _CKCheckArgument((uint64_t)"location", v4, 0, 0, 0, &v32);
  id v6 = v32;
  if ((v5 & 1) == 0)
  {
    v19 = v6;
    v20 = [CKException alloc];
    uint64_t v24 = objc_msgSend_code(v19, v21, v22, v23);
    v28 = objc_msgSend_localizedDescription(v19, v25, v26, v27);
    id v30 = (id)objc_msgSend_initWithCode_format_(v20, v29, v24, @"%@", v28);

    objc_exception_throw(v30);
  }

  v7 = objc_opt_new();
  v10 = objc_msgSend_CKDPLocationCoordinateFromCLLocation_(MEMORY[0x1E4F1E5F0], v8, (uint64_t)v4, v9);
  objc_msgSend_setLocationValue_(v7, v11, (uint64_t)v10, v12);

  v16 = objc_msgSend_data(v7, v13, v14, v15);
  v31.receiver = self;
  v31.super_class = (Class)CKEncryptedLocation;
  v17 = [(CKEncryptedData *)&v31 initWithData:v16];

  return v17;
}

- (CLLocation)location
{
  id v4 = objc_msgSend_data(self, a2, v2, v3);
  if (v4)
  {
    char v5 = [CKDPRecordFieldValueEncryptedValue alloc];
    v8 = objc_msgSend_initWithData_(v5, v6, (uint64_t)v4, v7);
    uint64_t v9 = (void *)MEMORY[0x1E4F1E5F0];
    v13 = objc_msgSend_locationValue(v8, v10, v11, v12);
    v16 = objc_msgSend_CKLocationFromPLocationCoordinate_(v9, v14, (uint64_t)v13, v15);
  }
  else
  {
    v16 = 0;
  }

  return (CLLocation *)v16;
}

- (id)value
{
  return (id)((uint64_t (*)(CKEncryptedLocation *, char *))MEMORY[0x1F4181798])(self, sel_location);
}

@end
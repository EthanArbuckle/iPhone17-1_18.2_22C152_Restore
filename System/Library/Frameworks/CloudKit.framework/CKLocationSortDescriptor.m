@interface CKLocationSortDescriptor
+ (BOOL)supportsSecureCoding;
- (CKLocationSortDescriptor)initWithCoder:(NSCoder *)aDecoder;
- (CKLocationSortDescriptor)initWithKey:(NSString *)key relativeLocation:(CLLocation *)relativeLocation;
- (CLLocation)relativeLocation;
- (id)CKPropertiesDescription;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)compareObject:(id)a3 toObject:(id)a4;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CKLocationSortDescriptor

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CKLocationSortDescriptor)initWithKey:(NSString *)key relativeLocation:(CLLocation *)relativeLocation
{
  v6 = relativeLocation;
  v14.receiver = self;
  v14.super_class = (Class)CKLocationSortDescriptor;
  v10 = [(CKLocationSortDescriptor *)&v14 initWithKey:key ascending:1 selector:0];
  if (v10)
  {
    uint64_t v11 = objc_msgSend_copy(v6, v7, v8, v9);
    v12 = v10->_relativeLocation;
    v10->_relativeLocation = (CLLocation *)v11;
  }
  return v10;
}

- (CKLocationSortDescriptor)initWithCoder:(NSCoder *)aDecoder
{
  v4 = aDecoder;
  v12.receiver = self;
  v12.super_class = (Class)CKLocationSortDescriptor;
  v5 = [(CKLocationSortDescriptor *)&v12 initWithCoder:v4];
  if (v5)
  {
    v6 = (void *)MEMORY[0x18C12ADA0]();
    uint64_t v7 = objc_opt_class();
    uint64_t v9 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v8, v7, @"Location");
    relativeLocation = v5->_relativeLocation;
    v5->_relativeLocation = (CLLocation *)v9;
  }

  return v5;
}

- (CLLocation)relativeLocation
{
  v4 = objc_msgSend_copy(self->_relativeLocation, a2, v2, v3);

  return (CLLocation *)v4;
}

- (id)CKPropertiesDescription
{
  v4 = NSString;
  v5 = objc_msgSend_relativeLocation(self, a2, v2, v3);
  uint64_t v8 = objc_msgSend_stringWithFormat_(v4, v6, @"relativeLocation=%@", v7, v5);

  return v8;
}

- (id)description
{
  return (id)((uint64_t (*)(CKLocationSortDescriptor *, char *))MEMORY[0x1F4181798])(self, sel_CKDescription);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x18C12ADA0]();
  v11.receiver = self;
  v11.super_class = (Class)CKLocationSortDescriptor;
  [(CKLocationSortDescriptor *)&v11 encodeWithCoder:v4];
  uint64_t v9 = objc_msgSend_relativeLocation(self, v6, v7, v8);
  objc_msgSend_encodeObject_forKey_(v4, v10, (uint64_t)v9, @"Location");
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [CKLocationSortDescriptor alloc];
  uint64_t v8 = objc_msgSend_key(self, v5, v6, v7);
  objc_super v12 = objc_msgSend_relativeLocation(self, v9, v10, v11);
  objc_super v14 = objc_msgSend_initWithKey_relativeLocation_(v4, v13, (uint64_t)v8, (uint64_t)v12);

  uint64_t v18 = objc_msgSend_ascending(self, v15, v16, v17);
  objc_msgSend__setAscending_(v14, v19, v18, v20);
  return v14;
}

- (int64_t)compareObject:(id)a3 toObject:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v11 = objc_msgSend_key(self, v8, v9, v10);
  objc_super v14 = objc_msgSend_valueForKey_(v7, v12, (uint64_t)v11, v13);

  uint64_t v18 = objc_msgSend_key(self, v15, v16, v17);
  v21 = objc_msgSend_valueForKey_(v6, v19, (uint64_t)v18, v20);

  v25 = objc_msgSend_relativeLocation(self, v22, v23, v24);
  objc_msgSend_distanceFromLocation_(v14, v26, (uint64_t)v25, v27);
  double v29 = v28;

  v33 = objc_msgSend_relativeLocation(self, v30, v31, v32);
  objc_msgSend_distanceFromLocation_(v21, v34, (uint64_t)v33, v35);
  double v37 = v36;

  if (objc_msgSend_ascending(self, v38, v39, v40)) {
    int64_t v41 = v29 < v37;
  }
  else {
    int64_t v41 = v29 > v37;
  }

  return v41;
}

- (void).cxx_destruct
{
}

@end
@interface CMALSPhone
+ (BOOL)supportsSecureCoding;
- (CMALSPhone)initWithCoder:(id)a3;
- (CMALSPhone)initWithTimestamp:(double)a3 illumination:(float)a4;
- (NSNumber)illumination;
- (NSNumber)timestamp;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CMALSPhone

- (CMALSPhone)initWithTimestamp:(double)a3 illumination:(float)a4
{
  v15.receiver = self;
  v15.super_class = (Class)CMALSPhone;
  v6 = [(CMALSPhone *)&v15 init];
  if (v6)
  {
    id v7 = objc_alloc(NSNumber);
    v6->fTimestamp = (NSNumber *)objc_msgSend_initWithDouble_(v7, v8, v9, a3);
    id v10 = objc_alloc(NSNumber);
    *(float *)&double v11 = a4;
    v6->fIllumination = (NSNumber *)objc_msgSend_initWithFloat_(v10, v12, v13, v11);
  }
  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CMALSPhone)initWithCoder:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)CMALSPhone;
  v4 = [(CMALSPhone *)&v10 init];
  if (v4)
  {
    uint64_t v5 = objc_opt_class();
    v4->fTimestamp = (NSNumber *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v6, v5, @"kCMALSPhoneTimestamp");
    uint64_t v7 = objc_opt_class();
    v4->fIllumination = (NSNumber *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v8, v7, @"kCMALSPhoneIllumination");
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend_encodeObject_forKey_(a3, a2, (uint64_t)self->fTimestamp, @"kCMALSPhoneTimestamp");
  fIllumination = self->fIllumination;

  objc_msgSend_encodeObject_forKey_(a3, v5, (uint64_t)fIllumination, @"kCMALSPhoneIllumination");
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_opt_class();
  uint64_t v7 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  v12 = objc_msgSend_init(v7, v8, v9);
  if (v12)
  {
    v12[1] = objc_msgSend_copy(self->fTimestamp, v10, v11);
    v12[2] = objc_msgSend_copy(self->fIllumination, v13, v14);
  }
  return v12;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CMALSPhone;
  [(CMALSPhone *)&v3 dealloc];
}

- (NSNumber)timestamp
{
  return self->fTimestamp;
}

- (NSNumber)illumination
{
  return self->fIllumination;
}

- (id)description
{
  objc_super v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  uint64_t v8 = objc_msgSend_timestamp(self, v6, v7);
  uint64_t v11 = objc_msgSend_illumination(self, v9, v10);
  return (id)objc_msgSend_stringWithFormat_(v3, v12, @"%@, <timestamp %@, illumination %@>", v5, v8, v11);
}

@end
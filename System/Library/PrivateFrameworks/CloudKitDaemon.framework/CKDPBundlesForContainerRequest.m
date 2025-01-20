@interface CKDPBundlesForContainerRequest
+ (id)options;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (Class)responseClass;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)requestTypeCode;
@end

@implementation CKDPBundlesForContainerRequest

+ (id)options
{
  if (qword_1EBBD0148 != -1) {
    dispatch_once(&qword_1EBBD0148, &unk_1F2044B50);
  }
  v2 = (void *)qword_1EBBD0140;
  return v2;
}

- (id)description
{
  v3 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)CKDPBundlesForContainerRequest;
  v4 = [(CKDPBundlesForContainerRequest *)&v11 description];
  v7 = objc_msgSend_dictionaryRepresentation(self, v5, v6);
  v9 = objc_msgSend_stringWithFormat_(v3, v8, @"%@ %@", v4, v7);

  return v9;
}

- (id)dictionaryRepresentation
{
  return (id)objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], a2, v2);
}

- (BOOL)readFrom:(id)a3
{
  return sub_1C4D4E644((uint64_t)self, (uint64_t)a3);
}

- (unsigned)requestTypeCode
{
  return 53;
}

- (Class)responseClass
{
  return (Class)objc_opt_class();
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_opt_class();
  uint64_t v6 = objc_msgSend_allocWithZone_(v4, v5, (uint64_t)a3);
  return (id)objc_msgSend_init(v6, v7, v8);
}

- (BOOL)isEqual:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_opt_class();
  char isMemberOfClass = objc_msgSend_isMemberOfClass_(v3, v5, v4);

  return isMemberOfClass;
}

- (unint64_t)hash
{
  return 0;
}

@end
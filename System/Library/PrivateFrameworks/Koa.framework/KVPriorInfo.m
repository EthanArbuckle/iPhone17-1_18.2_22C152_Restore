@interface KVPriorInfo
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToPriorInfo:(id)a3;
- (KVPriorInfo)init;
- (KVPriorInfo)initWithCoder:(id)a3;
- (KVPriorInfo)initWithOrdinality:(unsigned int)a3 score:(float)a4;
- (float)score;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (unsigned)ordinality;
- (void)encodeWithCoder:(id)a3;
@end

@implementation KVPriorInfo

- (KVPriorInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)KVPriorInfo;
  v5 = [(KVPriorInfo *)&v22 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    v10 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v6, @"o", v8, v9);
    v5->_ordinality = objc_msgSend_unsignedIntValue(v10, v11, v12, v13, v14, v15);

    objc_msgSend_decodeFloatForKey_(v4, v16, @"s", v17, v18, v19);
    v5->_score = v20;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v17 = a3;
  uint64_t v8 = objc_msgSend_numberWithUnsignedInt_(NSNumber, v4, self->_ordinality, v5, v6, v7);
  objc_msgSend_encodeObject_forKey_(v17, v9, (uint64_t)v8, @"o", v10, v11);

  *(float *)&double v12 = self->_score;
  objc_msgSend_encodeFloat_forKey_(v17, v13, @"s", v14, v15, v16, v12);
}

- (unint64_t)hash
{
  uint64_t v6 = objc_msgSend_numberWithUnsignedInt_(NSNumber, a2, self->_ordinality, v2, v3, v4);
  uint64_t v12 = objc_msgSend_hash(v6, v7, v8, v9, v10, v11);
  *(float *)&double v13 = self->_score;
  uint64_t v19 = objc_msgSend_numberWithFloat_(NSNumber, v14, v15, v16, v17, v18, v13);
  unint64_t v25 = objc_msgSend_hash(v19, v20, v21, v22, v23, v24) ^ v12;

  return v25;
}

- (BOOL)isEqualToPriorInfo:(id)a3
{
  id v4 = a3;
  unsigned int ordinality = self->_ordinality;
  if (ordinality == objc_msgSend_ordinality(v4, v6, v7, v8, v9, v10))
  {
    float score = self->_score;
    objc_msgSend_score(v4, v11, v12, v13, v14, v15);
    BOOL v18 = score == v17;
  }
  else
  {
    BOOL v18 = 0;
  }

  return v18;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (KVPriorInfo *)a3;
  uint64_t v5 = v4;
  if (v4 == self)
  {
    char isEqualToPriorInfo = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    char isEqualToPriorInfo = objc_msgSend_isEqualToPriorInfo_(self, v6, (uint64_t)v5, v7, v8, v9);
  }
  else
  {
    char isEqualToPriorInfo = 0;
  }

  return isEqualToPriorInfo;
}

- (id)description
{
  v10.receiver = self;
  v10.super_class = (Class)KVPriorInfo;
  uint64_t v3 = [(KVPriorInfo *)&v10 description];
  uint64_t v8 = objc_msgSend_stringByAppendingFormat_(v3, v4, @" ordinality: %d, prior score: %f", v5, v6, v7, self->_ordinality, self->_score);

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_opt_class();
  id result = (id)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7, v8, v9);
  *((_DWORD *)result + 2) = self->_ordinality;
  *((_DWORD *)result + 3) = LODWORD(self->_score);
  return result;
}

- (float)score
{
  return self->_score;
}

- (unsigned)ordinality
{
  return self->_ordinality;
}

- (KVPriorInfo)init
{
  objc_msgSend_exceptionWithName_reason_userInfo_(MEMORY[0x1E4F1CA00], a2, *MEMORY[0x1E4F1C3B8], @"init unsupported", MEMORY[0x1E4F1CC08], v2);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

- (KVPriorInfo)initWithOrdinality:(unsigned int)a3 score:(float)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v11.receiver = self;
  v11.super_class = (Class)KVPriorInfo;
  uint64_t v6 = [(KVPriorInfo *)&v11 init];
  uint64_t v7 = v6;
  if (!v6) {
    goto LABEL_5;
  }
  v6->_float score = a4;
  if (a4 >= 0.0 && a4 <= 1.0)
  {
    v6->_unsigned int ordinality = a3;
LABEL_5:
    uint64_t v8 = v6;
    goto LABEL_9;
  }
  uint64_t v9 = qword_1EB5EE458;
  if (os_log_type_enabled((os_log_t)qword_1EB5EE458, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v13 = "-[KVPriorInfo initWithOrdinality:score:]";
    __int16 v14 = 2048;
    double v15 = a4;
    _os_log_error_impl(&dword_1BC3B6000, v9, OS_LOG_TYPE_ERROR, "%s Invalid score: %f", buf, 0x16u);
  }
  uint64_t v8 = 0;
LABEL_9:

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
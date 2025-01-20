@interface VN1vLyVSh30UQ26TGBoV8MHv
+ (BOOL)supportsSecureCoding;
- (BOOL)hasAdjustmentForKey:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSArray)adjustmentKeys;
- (VN1vLyVSh30UQ26TGBoV8MHv)initWithCoder:(id)a3;
- (VN1vLyVSh30UQ26TGBoV8MHv)initWithOriginatingRequestSpecifier:(id)a3 adjustments:(id)a4;
- (id)adjustmentValuesForKey:(id)a3;
- (id)description;
- (id)vn_cloneObject;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation VN1vLyVSh30UQ26TGBoV8MHv

- (void).cxx_destruct
{
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)VN1vLyVSh30UQ26TGBoV8MHv;
  id v4 = a3;
  [(VNObservation *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_adjustments, @"adjustments", v5.receiver, v5.super_class);
}

- (VN1vLyVSh30UQ26TGBoV8MHv)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)VN1vLyVSh30UQ26TGBoV8MHv;
  objc_super v5 = [(VNObservation *)&v15 initWithCoder:v4];
  if (!v5) {
    goto LABEL_3;
  }
  id v6 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  v9 = objc_msgSend(v6, "initWithObjects:", v7, v8, objc_opt_class(), 0);
  uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"adjustments"];
  adjustments = v5->_adjustments;
  v5->_adjustments = (NSDictionary *)v10;

  v12 = v5->_adjustments;
  if (!v12) {
    v13 = 0;
  }
  else {
LABEL_3:
  }
    v13 = v5;

  return v13;
}

- (id)vn_cloneObject
{
  v7.receiver = self;
  v7.super_class = (Class)VN1vLyVSh30UQ26TGBoV8MHv;
  v3 = [(VNObservation *)&v7 vn_cloneObject];
  if (v3)
  {
    uint64_t v4 = [(NSDictionary *)self->_adjustments copy];
    objc_super v5 = (void *)v3[12];
    v3[12] = v4;
  }

  return v3;
}

- (id)description
{
  v3 = NSString;
  v9.receiver = self;
  v9.super_class = (Class)VN1vLyVSh30UQ26TGBoV8MHv;
  uint64_t v4 = [(VNObservation *)&v9 description];
  objc_super v5 = [(VN1vLyVSh30UQ26TGBoV8MHv *)self adjustmentKeys];
  id v6 = [v5 componentsJoinedByString:@", "];
  objc_super v7 = [v3 stringWithFormat:@"%@ [%@]", v4, v6];

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (VN1vLyVSh30UQ26TGBoV8MHv *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(NSDictionary *)self->_adjustments isEqualToDictionary:v4->_adjustments];
  }

  return v5;
}

- (unint64_t)hash
{
  v3.receiver = self;
  v3.super_class = (Class)VN1vLyVSh30UQ26TGBoV8MHv;
  return [(NSDictionary *)self->_adjustments hash] ^ __ROR8__([(VNObservation *)&v3 hash], 51);
}

- (id)adjustmentValuesForKey:(id)a3
{
  return [(NSDictionary *)self->_adjustments objectForKey:a3];
}

- (BOOL)hasAdjustmentForKey:(id)a3
{
  objc_super v3 = [(NSDictionary *)self->_adjustments objectForKey:a3];
  BOOL v4 = v3 != 0;

  return v4;
}

- (NSArray)adjustmentKeys
{
  return [(NSDictionary *)self->_adjustments allKeys];
}

- (VN1vLyVSh30UQ26TGBoV8MHv)initWithOriginatingRequestSpecifier:(id)a3 adjustments:(id)a4
{
  id v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)VN1vLyVSh30UQ26TGBoV8MHv;
  objc_super v7 = [(VNObservation *)&v11 initWithOriginatingRequestSpecifier:a3];
  if (v7)
  {
    uint64_t v8 = [objc_alloc(MEMORY[0x1E4F1C9E8]) initWithDictionary:v6 copyItems:1];
    adjustments = v7->_adjustments;
    v7->_adjustments = (NSDictionary *)v8;
  }
  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
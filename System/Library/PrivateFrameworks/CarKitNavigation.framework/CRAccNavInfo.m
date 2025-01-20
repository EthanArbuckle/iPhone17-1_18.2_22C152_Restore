@interface CRAccNavInfo
+ (BOOL)supportsSecureCoding;
- (ACCNavigationInfo)accNavInfo;
- (CRAccNavComponent)component;
- (CRAccNavInfo)initWithCoder:(id)a3;
- (CRAccNavInfo)initWithComponent:(id)a3 accNavInfo:(id)a4;
- (id)description;
- (id)valueForInfoType:(unsigned __int16)a3;
- (unsigned)uint16ForInfoType:(unsigned __int16)a3;
- (unsigned)uint8ForInfoType:(unsigned __int16)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CRAccNavInfo

- (CRAccNavInfo)initWithComponent:(id)a3 accNavInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CRAccNavInfo;
  v8 = [(CRAccNavInfo *)&v12 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    component = v8->_component;
    v8->_component = (CRAccNavComponent *)v9;

    objc_storeStrong((id *)&v8->_accNavInfo, a4);
  }

  return v8;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(CRAccNavInfo *)self component];
  id v6 = [v5 uuid];
  id v7 = [(CRAccNavInfo *)self accNavInfo];
  v8 = objc_msgSend(v7, "cr_dictionary");
  uint64_t v9 = [v3 stringWithFormat:@"<%@: %p> component=%@ accNavInfo={\n%@\n}", v4, self, v6, v8];

  return v9;
}

- (id)valueForInfoType:(unsigned __int16)a3
{
  uint64_t v3 = a3;
  uint64_t v4 = [(CRAccNavInfo *)self accNavInfo];
  v5 = (void *)[v4 copyInfo:v3];

  return v5;
}

- (unsigned)uint8ForInfoType:(unsigned __int16)a3
{
  uint64_t v3 = a3;
  objc_opt_class();
  id v5 = [(CRAccNavInfo *)self valueForInfoType:v3];
  if (v5 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }

  unsigned __int8 v7 = [v6 unsignedCharValue];
  return v7;
}

- (unsigned)uint16ForInfoType:(unsigned __int16)a3
{
  uint64_t v3 = a3;
  objc_opt_class();
  id v5 = [(CRAccNavInfo *)self valueForInfoType:v3];
  if (v5 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }

  unsigned __int16 v7 = [v6 unsignedShortValue];
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(CRAccNavInfo *)self component];
  id v6 = NSStringFromSelector(sel_component);
  [v4 encodeObject:v5 forKey:v6];

  id v9 = [(CRAccNavInfo *)self accNavInfo];
  unsigned __int16 v7 = objc_msgSend(v9, "cr_dictionary");
  v8 = NSStringFromSelector(sel_accNavInfo);
  [v4 encodeObject:v7 forKey:v8];
}

- (CRAccNavInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  id v6 = NSStringFromSelector(sel_component);
  unsigned __int16 v7 = [v4 decodeObjectOfClass:v5 forKey:v6];

  v8 = (void *)MEMORY[0x263EFFA08];
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  objc_super v12 = objc_msgSend(v8, "setWithObjects:", v9, v10, v11, objc_opt_class(), 0);
  v13 = NSStringFromSelector(sel_accNavInfo);
  v14 = [v4 decodeObjectOfClasses:v12 forKey:v13];

  [(id)objc_opt_class() ACCNavigationInfoClass];
  v15 = objc_opt_new();
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __30__CRAccNavInfo_initWithCoder___block_invoke;
  v19[3] = &unk_265274840;
  id v20 = v15;
  id v16 = v15;
  [v14 enumerateKeysAndObjectsUsingBlock:v19];
  v17 = (CRAccNavInfo *)[objc_alloc((Class)objc_opt_class()) initWithComponent:v7 accNavInfo:v16];

  return v17;
}

void __30__CRAccNavInfo_initWithCoder___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = *(void **)(a1 + 32);
  id v5 = a3;
  objc_msgSend(v4, "cr_setInfo:data:", objc_msgSend(a2, "unsignedShortValue"), v5);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CRAccNavComponent)component
{
  return self->_component;
}

- (ACCNavigationInfo)accNavInfo
{
  return self->_accNavInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accNavInfo, 0);
  objc_storeStrong((id *)&self->_component, 0);
}

@end
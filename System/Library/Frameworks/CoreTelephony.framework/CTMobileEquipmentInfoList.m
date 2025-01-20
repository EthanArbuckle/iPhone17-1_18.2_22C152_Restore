@interface CTMobileEquipmentInfoList
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (CTMobileEquipmentInfoList)initWithCoder:(id)a3;
- (NSArray)meInfoList;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setMeInfoList:(id)a3;
@end

@implementation CTMobileEquipmentInfoList

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  v4 = [(CTMobileEquipmentInfoList *)self meInfoList];
  [v3 appendFormat:@" meInfoList=%@", v4];

  [v3 appendString:@">"];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    meInfoList = self->_meInfoList;
    v6 = [v4 meInfoList];
    BOOL v7 = [(NSArray *)meInfoList isEqualToArray:v6];
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = [(CTMobileEquipmentInfoList *)self meInfoList];
  v6 = (void *)[v5 copy];
  [v4 setMeInfoList:v6];

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
}

- (CTMobileEquipmentInfoList)initWithCoder:(id)a3
{
  v13[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CTMobileEquipmentInfoList;
  v5 = [(CTMobileEquipmentInfoList *)&v12 init];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    v13[0] = objc_opt_class();
    v13[1] = objc_opt_class();
    BOOL v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:2];
    v8 = [v6 setWithArray:v7];
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"meInfoList"];
    meInfoList = v5->_meInfoList;
    v5->_meInfoList = (NSArray *)v9;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSArray)meInfoList
{
  return self->_meInfoList;
}

- (void)setMeInfoList:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
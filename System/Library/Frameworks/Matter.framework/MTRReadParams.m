@interface MTRReadParams
+ (BOOL)supportsSecureCoding;
- (BOOL)shouldAssumeUnknownAttributesReportable;
- (BOOL)shouldFilterByFabric;
- (MTRReadParams)init;
- (MTRReadParams)initWithCoder:(id)a3;
- (NSNumber)fabricFiltered;
- (NSNumber)minEventNumber;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setAssumeUnknownAttributesReportable:(BOOL)a3;
- (void)setFabricFiltered:(NSNumber *)fabricFiltered;
- (void)setFilterByFabric:(BOOL)filterByFabric;
- (void)setMinEventNumber:(NSNumber *)minEventNumber;
- (void)toReadPrepareParams:(void *)a3;
@end

@implementation MTRReadParams

- (MTRReadParams)init
{
  v3.receiver = self;
  v3.super_class = (Class)MTRReadParams;
  result = [(MTRReadParams *)&v3 init];
  if (result) {
    *(_WORD *)&result->_filterByFabric = 257;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MTRReadParams)initWithCoder:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)MTRReadParams;
  v6 = [(MTRReadParams *)&v18 init];
  if (v6)
  {
    uint64_t v7 = objc_msgSend_decodeBoolForKey_(v4, v5, @"sFilterByFabricKey");
    objc_msgSend_setFilterByFabric_(v6, v8, v7);
    uint64_t v10 = objc_msgSend_decodeBoolForKey_(v4, v9, @"sAssumeUnknownAttributesReportableKey");
    objc_msgSend_setAssumeUnknownAttributesReportable_(v6, v11, v10);
    uint64_t v12 = objc_opt_class();
    v14 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v13, v12, @"sMinEventNumberKey");
    objc_msgSend_setMinEventNumber_(v6, v15, (uint64_t)v14);

    v16 = v6;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v19 = a3;
  uint64_t shouldFilterByFabric = objc_msgSend_shouldFilterByFabric(self, v4, v5);
  objc_msgSend_encodeBool_forKey_(v19, v7, shouldFilterByFabric, @"sFilterByFabricKey");
  uint64_t shouldAssumeUnknownAttributesReportable = objc_msgSend_shouldAssumeUnknownAttributesReportable(self, v8, v9);
  objc_msgSend_encodeBool_forKey_(v19, v11, shouldAssumeUnknownAttributesReportable, @"sAssumeUnknownAttributesReportableKey");
  v14 = objc_msgSend_minEventNumber(self, v12, v13);

  if (v14)
  {
    v17 = objc_msgSend_minEventNumber(self, v15, v16);
    objc_msgSend_encodeObject_forKey_(v19, v18, (uint64_t)v17, @"sMinEventNumberKey");
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(MTRReadParams);
  uint64_t shouldFilterByFabric = objc_msgSend_shouldFilterByFabric(self, v5, v6);
  objc_msgSend_setFilterByFabric_(v4, v8, shouldFilterByFabric);
  v11 = objc_msgSend_minEventNumber(self, v9, v10);
  objc_msgSend_setMinEventNumber_(v4, v12, (uint64_t)v11);

  uint64_t shouldAssumeUnknownAttributesReportable = objc_msgSend_shouldAssumeUnknownAttributesReportable(self, v13, v14);
  objc_msgSend_setAssumeUnknownAttributesReportable_(v4, v16, shouldAssumeUnknownAttributesReportable);
  return v4;
}

- (void)toReadPrepareParams:(void *)a3
{
  *((unsigned char *)a3 + 113) = objc_msgSend_shouldFilterByFabric(self, a2, (uint64_t)a3);
  uint64_t v7 = objc_msgSend_minEventNumber(self, v5, v6);

  if (v7)
  {
    objc_msgSend_minEventNumber(self, v8, v9);
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v12 = objc_msgSend_unsignedLongLongValue(v13, v10, v11);
    *((unsigned char *)a3 + 88) = 1;
    *((void *)a3 + 12) = v12;
  }
}

- (BOOL)shouldFilterByFabric
{
  return self->_filterByFabric;
}

- (void)setFilterByFabric:(BOOL)filterByFabric
{
  self->_filterByFabric = filterByFabric;
}

- (NSNumber)minEventNumber
{
  return self->_minEventNumber;
}

- (void)setMinEventNumber:(NSNumber *)minEventNumber
{
}

- (BOOL)shouldAssumeUnknownAttributesReportable
{
  return self->_assumeUnknownAttributesReportable;
}

- (void)setAssumeUnknownAttributesReportable:(BOOL)a3
{
  self->_assumeUnknownAttributesReportable = a3;
}

- (void).cxx_destruct
{
}

- (void)setFabricFiltered:(NSNumber *)fabricFiltered
{
  id v4 = fabricFiltered;
  uint64_t v9 = v4;
  if (v4)
  {
    uint64_t v7 = objc_msgSend_BOOLValue(v4, v5, v6);
    objc_msgSend_setFilterByFabric_(self, v8, v7);
  }
  else
  {
    objc_msgSend_setFilterByFabric_(self, v5, 1);
  }
}

- (NSNumber)fabricFiltered
{
  objc_super v3 = NSNumber;
  uint64_t shouldFilterByFabric = objc_msgSend_shouldFilterByFabric(self, a2, v2);

  return (NSNumber *)objc_msgSend_numberWithBool_(v3, v4, shouldFilterByFabric);
}

@end
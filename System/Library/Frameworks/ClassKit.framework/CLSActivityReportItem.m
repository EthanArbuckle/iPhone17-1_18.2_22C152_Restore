@interface CLSActivityReportItem
+ (BOOL)supportsSecureCoding;
- (CLSActivityReportItem)initWithCoder:(id)a3;
- (NSString)identifier;
- (NSString)title;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (void)encodeWithCoder:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation CLSActivityReportItem

- (CLSActivityReportItem)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CLSActivityReportItem;
  v5 = [(CLSActivityReportItem *)&v15 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    uint64_t v8 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v6, @"title");
    title = v5->_title;
    v5->_title = (NSString *)v8;

    uint64_t v10 = objc_opt_class();
    uint64_t v12 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v11, v10, @"identifier");
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v12;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  title = self->_title;
  id v7 = a3;
  objc_msgSend_encodeObject_forKey_(v7, v5, (uint64_t)title, @"title");
  objc_msgSend_encodeObject_forKey_(v7, v6, (uint64_t)self->_identifier, @"identifier");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v14.receiver = self;
  v14.super_class = (Class)CLSActivityReportItem;
  id v4 = [(CLSReportItem *)&v14 copyWithZone:a3];
  id v7 = objc_msgSend_title(self, v5, v6);
  objc_msgSend_setTitle_(v4, v8, (uint64_t)v7);

  v11 = objc_msgSend_identifier(self, v9, v10);
  objc_msgSend_setIdentifier_(v4, v12, (uint64_t)v11);

  return v4;
}

- (id)dictionaryRepresentation
{
  v13.receiver = self;
  v13.super_class = (Class)CLSActivityReportItem;
  v3 = [(CLSReportItem *)&v13 dictionaryRepresentation];
  uint64_t v6 = objc_msgSend_title(self, v4, v5);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v7, (uint64_t)v6, @"title");

  uint64_t v10 = objc_msgSend_identifier(self, v8, v9);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v11, (uint64_t)v10, @"identifier");

  return v3;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

@end
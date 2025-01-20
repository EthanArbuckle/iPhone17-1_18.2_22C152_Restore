@interface IMGroupTitleChangeItem
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (IMGroupTitleChangeItem)initWithCoder:(id)a3;
- (IMGroupTitleChangeItem)initWithDictionary:(id)a3;
- (NSString)otherCountryCode;
- (NSString)otherHandle;
- (NSString)otherUnformattedID;
- (NSString)title;
- (id)copyDictionaryRepresentation;
- (id)copyWithZone:(_NSZone *)a3;
- (unsigned)errorCode;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setErrorCode:(unsigned int)a3;
- (void)setOtherCountryCode:(id)a3;
- (void)setOtherHandle:(id)a3;
- (void)setOtherUnformattedID:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation IMGroupTitleChangeItem

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)IMGroupTitleChangeItem;
  [(IMGroupTitleChangeItem *)&v3 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)IMGroupTitleChangeItem;
  id v4 = [(IMItem *)&v6 copyWithZone:a3];
  objc_msgSend(v4, "setOtherUnformattedID:", -[IMGroupTitleChangeItem otherUnformattedID](self, "otherUnformattedID"));
  objc_msgSend(v4, "setOtherHandle:", -[IMGroupTitleChangeItem otherHandle](self, "otherHandle"));
  objc_msgSend(v4, "setOtherCountryCode:", -[IMGroupTitleChangeItem otherCountryCode](self, "otherCountryCode"));
  objc_msgSend(v4, "setTitle:", -[IMGroupTitleChangeItem title](self, "title"));
  objc_msgSend(v4, "setErrorCode:", -[IMGroupTitleChangeItem errorCode](self, "errorCode"));
  return v4;
}

- (IMGroupTitleChangeItem)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)IMGroupTitleChangeItem;
  id v4 = -[IMItem initWithCoder:](&v6, sel_initWithCoder_);
  if (v4)
  {
    -[IMGroupTitleChangeItem setOtherCountryCode:](v4, "setOtherCountryCode:", [a3 decodeObjectOfClass:objc_opt_class() forKey:@"otherCountryCode"]);
    -[IMGroupTitleChangeItem setOtherHandle:](v4, "setOtherHandle:", [a3 decodeObjectOfClass:objc_opt_class() forKey:@"otherHandle"]);
    -[IMGroupTitleChangeItem setOtherUnformattedID:](v4, "setOtherUnformattedID:", [a3 decodeObjectOfClass:objc_opt_class() forKey:@"otherUnformattedID"]);
    -[IMGroupTitleChangeItem setTitle:](v4, "setTitle:", [a3 decodeObjectOfClass:objc_opt_class() forKey:@"title"]);
    -[IMGroupTitleChangeItem setErrorCode:](v4, "setErrorCode:", objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), @"errorCode"), "intValue"));
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)IMGroupTitleChangeItem;
  -[IMItem encodeWithCoder:](&v5, sel_encodeWithCoder_);
  objc_msgSend(a3, "encodeObject:forKey:", -[IMGroupTitleChangeItem otherCountryCode](self, "otherCountryCode"), @"otherCountryCode");
  objc_msgSend(a3, "encodeObject:forKey:", -[IMGroupTitleChangeItem otherHandle](self, "otherHandle"), @"otherHandle");
  objc_msgSend(a3, "encodeObject:forKey:", -[IMGroupTitleChangeItem otherUnformattedID](self, "otherUnformattedID"), @"otherUnformattedID");
  objc_msgSend(a3, "encodeObject:forKey:", -[IMGroupTitleChangeItem title](self, "title"), @"title");
  objc_msgSend(a3, "encodeObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[IMGroupTitleChangeItem errorCode](self, "errorCode")), @"errorCode");
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self)
  {
    LOBYTE(v7) = 1;
  }
  else
  {
    uint64_t v16 = v3;
    uint64_t v17 = v4;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v15.receiver = self;
      v15.super_class = (Class)IMGroupTitleChangeItem;
      BOOL v7 = [(IMItem *)&v15 isEqual:a3];
      if (v7)
      {
        title = self->_title;
        if (title == (NSString *)[a3 title]
          || (BOOL v7 = -[NSString isEqualToString:](self->_title, "isEqualToString:", [a3 title])))
        {
          otherCountryCode = self->_otherCountryCode;
          if (otherCountryCode == (NSString *)[a3 otherCountryCode]
            || (BOOL v7 = -[NSString isEqualToString:](self->_otherCountryCode, "isEqualToString:", [a3 otherCountryCode])))
          {
            otherHandle = self->_otherHandle;
            if (otherHandle == (NSString *)[a3 otherHandle]
              || (BOOL v7 = -[NSString isEqualToString:](self->_otherHandle, "isEqualToString:", [a3 otherHandle])))
            {
              otherUnformattedID = self->_otherUnformattedID;
              if (otherUnformattedID == (NSString *)[a3 otherUnformattedID]
                || (BOOL v7 = -[NSString isEqualToString:](self->_otherUnformattedID, "isEqualToString:", [a3 otherUnformattedID])))
              {
                unsigned int errorCode = self->_errorCode;
                LOBYTE(v7) = errorCode == [a3 errorCode];
              }
            }
          }
        }
      }
    }
    else
    {
      v14.receiver = self;
      v14.super_class = (Class)IMGroupTitleChangeItem;
      LOBYTE(v7) = [(IMItem *)&v14 isEqual:a3];
    }
  }
  return v7;
}

- (IMGroupTitleChangeItem)initWithDictionary:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)IMGroupTitleChangeItem;
  uint64_t v4 = -[IMItem initWithDictionary:](&v6, sel_initWithDictionary_);
  if (v4)
  {
    -[IMGroupTitleChangeItem setOtherCountryCode:](v4, "setOtherCountryCode:", [a3 objectForKey:@"otherCountryCode"]);
    -[IMGroupTitleChangeItem setOtherHandle:](v4, "setOtherHandle:", [a3 objectForKey:@"otherHandle"]);
    -[IMGroupTitleChangeItem setOtherUnformattedID:](v4, "setOtherUnformattedID:", [a3 objectForKey:@"otherUnformattedID"]);
    -[IMGroupTitleChangeItem setTitle:](v4, "setTitle:", [a3 objectForKey:@"title"]);
    -[IMGroupTitleChangeItem setErrorCode:](v4, "setErrorCode:", objc_msgSend((id)objc_msgSend(a3, "_numberForKey:", @"errorCode"), "intValue"));
  }
  return v4;
}

- (id)copyDictionaryRepresentation
{
  v11.receiver = self;
  v11.super_class = (Class)IMGroupTitleChangeItem;
  uint64_t v3 = [(IMItem *)&v11 copyDictionaryRepresentation];
  uint64_t v4 = (void *)MEMORY[0x1A6228190]();
  otherCountryCode = self->_otherCountryCode;
  if (otherCountryCode) {
    CFDictionarySetValue(v3, @"otherCountryCode", otherCountryCode);
  }
  otherHandle = self->_otherHandle;
  if (otherHandle) {
    CFDictionarySetValue(v3, @"otherHandle", otherHandle);
  }
  otherUnformattedID = self->_otherUnformattedID;
  if (otherUnformattedID) {
    CFDictionarySetValue(v3, @"otherUnformattedID", otherUnformattedID);
  }
  title = self->_title;
  if (title) {
    CFDictionarySetValue(v3, @"title", title);
  }
  v9 = (const void *)[NSNumber numberWithUnsignedInt:self->_errorCode];
  if (v9) {
    CFDictionarySetValue(v3, @"errorCode", v9);
  }
  return v3;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)otherCountryCode
{
  return self->_otherCountryCode;
}

- (void)setOtherCountryCode:(id)a3
{
}

- (NSString)otherHandle
{
  return self->_otherHandle;
}

- (void)setOtherHandle:(id)a3
{
}

- (NSString)otherUnformattedID
{
  return self->_otherUnformattedID;
}

- (void)setOtherUnformattedID:(id)a3
{
}

- (unsigned)errorCode
{
  return self->_errorCode;
}

- (void)setErrorCode:(unsigned int)a3
{
  self->_unsigned int errorCode = a3;
}

@end
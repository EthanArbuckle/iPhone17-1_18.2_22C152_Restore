@interface IMLocationShareStatusChangeItem
+ (BOOL)supportsSecureCoding;
- (BOOL)actionable;
- (BOOL)expired;
- (BOOL)isEqual:(id)a3;
- (BOOL)isLastMessageCandidate;
- (IMLocationShareStatusChangeItem)init;
- (IMLocationShareStatusChangeItem)initWithCoder:(id)a3;
- (IMLocationShareStatusChangeItem)initWithDictionary:(id)a3;
- (NSString)otherCountryCode;
- (NSString)otherHandle;
- (NSString)otherUnformattedID;
- (id)copyDictionaryRepresentation;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)direction;
- (int64_t)status;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setActionable:(BOOL)a3;
- (void)setDirection:(int64_t)a3;
- (void)setExpired:(BOOL)a3;
- (void)setOtherCountryCode:(id)a3;
- (void)setOtherHandle:(id)a3;
- (void)setOtherUnformattedID:(id)a3;
- (void)setStatus:(int64_t)a3;
@end

@implementation IMLocationShareStatusChangeItem

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)IMLocationShareStatusChangeItem;
  [(IMLocationShareStatusChangeItem *)&v3 dealloc];
}

- (IMLocationShareStatusChangeItem)init
{
  v5.receiver = self;
  v5.super_class = (Class)IMLocationShareStatusChangeItem;
  v2 = [(IMLocationShareStatusChangeItem *)&v5 init];
  objc_super v3 = v2;
  if (v2) {
    [(IMItem *)v2 setType:4];
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)IMLocationShareStatusChangeItem;
  id v4 = [(IMItem *)&v6 copyWithZone:a3];
  objc_msgSend(v4, "setOtherUnformattedID:", -[IMLocationShareStatusChangeItem otherUnformattedID](self, "otherUnformattedID"));
  objc_msgSend(v4, "setOtherHandle:", -[IMLocationShareStatusChangeItem otherHandle](self, "otherHandle"));
  objc_msgSend(v4, "setOtherCountryCode:", -[IMLocationShareStatusChangeItem otherCountryCode](self, "otherCountryCode"));
  objc_msgSend(v4, "setStatus:", -[IMLocationShareStatusChangeItem status](self, "status"));
  objc_msgSend(v4, "setDirection:", -[IMLocationShareStatusChangeItem direction](self, "direction"));
  objc_msgSend(v4, "setActionable:", -[IMLocationShareStatusChangeItem actionable](self, "actionable"));
  objc_msgSend(v4, "setExpired:", -[IMLocationShareStatusChangeItem expired](self, "expired"));
  objc_msgSend(v4, "_setMessageID:", -[IMItem messageID](self, "messageID"));
  return v4;
}

- (IMLocationShareStatusChangeItem)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)IMLocationShareStatusChangeItem;
  id v4 = -[IMItem initWithCoder:](&v6, sel_initWithCoder_);
  if (v4)
  {
    -[IMLocationShareStatusChangeItem setOtherCountryCode:](v4, "setOtherCountryCode:", [a3 decodeObjectOfClass:objc_opt_class() forKey:@"otherCountryCode"]);
    -[IMLocationShareStatusChangeItem setOtherHandle:](v4, "setOtherHandle:", [a3 decodeObjectOfClass:objc_opt_class() forKey:@"otherHandle"]);
    -[IMLocationShareStatusChangeItem setOtherUnformattedID:](v4, "setOtherUnformattedID:", [a3 decodeObjectOfClass:objc_opt_class() forKey:@"otherUnformattedID"]);
    v4->_status = [a3 decodeInt64ForKey:@"status"];
    v4->_direction = [a3 decodeInt64ForKey:@"direction"];
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
  v5.super_class = (Class)IMLocationShareStatusChangeItem;
  -[IMItem encodeWithCoder:](&v5, sel_encodeWithCoder_);
  objc_msgSend(a3, "encodeObject:forKey:", -[IMLocationShareStatusChangeItem otherCountryCode](self, "otherCountryCode"), @"otherCountryCode");
  objc_msgSend(a3, "encodeObject:forKey:", -[IMLocationShareStatusChangeItem otherHandle](self, "otherHandle"), @"otherHandle");
  objc_msgSend(a3, "encodeObject:forKey:", -[IMLocationShareStatusChangeItem otherUnformattedID](self, "otherUnformattedID"), @"otherUnformattedID");
  [a3 encodeInt64:self->_status forKey:@"status"];
  [a3 encodeInt64:self->_direction forKey:@"direction"];
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
      v15.super_class = (Class)IMLocationShareStatusChangeItem;
      BOOL v7 = [(IMItem *)&v15 isEqual:a3];
      if (v7)
      {
        int64_t status = self->_status;
        if (status == [a3 status]
          && (int64_t direction = self->_direction, direction == [a3 direction]))
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
              LOBYTE(v7) = otherUnformattedID == (NSString *)[a3 otherUnformattedID]
                        || -[NSString isEqualToString:](self->_otherUnformattedID, "isEqualToString:", [a3 otherUnformattedID]);
            }
          }
        }
        else
        {
          LOBYTE(v7) = 0;
        }
      }
    }
    else
    {
      v14.receiver = self;
      v14.super_class = (Class)IMLocationShareStatusChangeItem;
      LOBYTE(v7) = [(IMItem *)&v14 isEqual:a3];
    }
  }
  return v7;
}

- (IMLocationShareStatusChangeItem)initWithDictionary:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)IMLocationShareStatusChangeItem;
  uint64_t v4 = -[IMItem initWithDictionary:](&v6, sel_initWithDictionary_);
  if (v4)
  {
    -[IMLocationShareStatusChangeItem setStatus:](v4, "setStatus:", objc_msgSend((id)objc_msgSend(a3, "objectForKey:", @"status"), "longLongValue"));
    -[IMLocationShareStatusChangeItem setDirection:](v4, "setDirection:", objc_msgSend((id)objc_msgSend(a3, "objectForKey:", @"direction"), "longLongValue"));
    -[IMLocationShareStatusChangeItem setOtherCountryCode:](v4, "setOtherCountryCode:", [a3 objectForKey:@"otherCountryCode"]);
    -[IMLocationShareStatusChangeItem setOtherHandle:](v4, "setOtherHandle:", [a3 objectForKey:@"otherHandle"]);
    -[IMLocationShareStatusChangeItem setOtherUnformattedID:](v4, "setOtherUnformattedID:", [a3 objectForKey:@"otherUnformattedID"]);
  }
  return v4;
}

- (id)copyDictionaryRepresentation
{
  v11.receiver = self;
  v11.super_class = (Class)IMLocationShareStatusChangeItem;
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
  v8 = (const void *)[NSNumber numberWithLongLong:self->_status];
  if (v8) {
    CFDictionarySetValue(v3, @"status", v8);
  }
  v9 = (const void *)[NSNumber numberWithLongLong:self->_direction];
  if (v9) {
    CFDictionarySetValue(v3, @"direction", v9);
  }
  return v3;
}

- (BOOL)isLastMessageCandidate
{
  return 0;
}

- (int64_t)status
{
  return self->_status;
}

- (void)setStatus:(int64_t)a3
{
  self->_int64_t status = a3;
}

- (BOOL)actionable
{
  return self->_actionable;
}

- (void)setActionable:(BOOL)a3
{
  self->_actionable = a3;
}

- (BOOL)expired
{
  return self->_expired;
}

- (void)setExpired:(BOOL)a3
{
  self->_expired = a3;
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

- (int64_t)direction
{
  return self->_direction;
}

- (void)setDirection:(int64_t)a3
{
  self->_int64_t direction = a3;
}

@end
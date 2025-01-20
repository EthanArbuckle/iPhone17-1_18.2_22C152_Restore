@interface IMGroupActionItem
+ (BOOL)supportsSecureCoding;
- (BOOL)actionIsGroupPhoto;
- (BOOL)isCompatibleWithMiC;
- (BOOL)isEqual:(id)a3;
- (IMGroupActionItem)initWithCoder:(id)a3;
- (IMGroupActionItem)initWithDictionary:(id)a3;
- (NSString)otherCountryCode;
- (NSString)otherHandle;
- (NSString)otherUnformattedID;
- (id)copyDictionaryRepresentation;
- (id)copyWithZone:(_NSZone *)a3;
- (id)fileTransferGUIDs;
- (int64_t)actionType;
- (unsigned)errorCode;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setActionType:(int64_t)a3;
- (void)setErrorCode:(unsigned int)a3;
- (void)setOtherCountryCode:(id)a3;
- (void)setOtherHandle:(id)a3;
- (void)setOtherUnformattedID:(id)a3;
@end

@implementation IMGroupActionItem

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)IMGroupActionItem;
  [(IMGroupActionItem *)&v3 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)IMGroupActionItem;
  id v4 = [(IMItem *)&v6 copyWithZone:a3];
  objc_msgSend(v4, "setOtherUnformattedID:", -[IMGroupActionItem otherUnformattedID](self, "otherUnformattedID"));
  objc_msgSend(v4, "setOtherHandle:", -[IMGroupActionItem otherHandle](self, "otherHandle"));
  objc_msgSend(v4, "setOtherCountryCode:", -[IMGroupActionItem otherCountryCode](self, "otherCountryCode"));
  objc_msgSend(v4, "setActionType:", -[IMGroupActionItem actionType](self, "actionType"));
  objc_msgSend(v4, "setErrorCode:", -[IMGroupActionItem errorCode](self, "errorCode"));
  return v4;
}

- (IMGroupActionItem)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)IMGroupActionItem;
  id v4 = -[IMItem initWithCoder:](&v6, sel_initWithCoder_);
  if (v4)
  {
    -[IMGroupActionItem setOtherCountryCode:](v4, "setOtherCountryCode:", [a3 decodeObjectOfClass:objc_opt_class() forKey:@"otherCountryCode"]);
    -[IMGroupActionItem setOtherHandle:](v4, "setOtherHandle:", [a3 decodeObjectOfClass:objc_opt_class() forKey:@"otherHandle"]);
    -[IMGroupActionItem setOtherUnformattedID:](v4, "setOtherUnformattedID:", [a3 decodeObjectOfClass:objc_opt_class() forKey:@"otherUnformattedID"]);
    [a3 decodeValueOfObjCType:"q" at:&v4->_actionType size:8];
    -[IMGroupActionItem setErrorCode:](v4, "setErrorCode:", [a3 decodeIntForKey:@"errorCode"]);
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
  v5.super_class = (Class)IMGroupActionItem;
  -[IMItem encodeWithCoder:](&v5, sel_encodeWithCoder_);
  objc_msgSend(a3, "encodeObject:forKey:", -[IMGroupActionItem otherCountryCode](self, "otherCountryCode"), @"otherCountryCode");
  objc_msgSend(a3, "encodeObject:forKey:", -[IMGroupActionItem otherHandle](self, "otherHandle"), @"otherHandle");
  objc_msgSend(a3, "encodeObject:forKey:", -[IMGroupActionItem otherUnformattedID](self, "otherUnformattedID"), @"otherUnformattedID");
  [a3 encodeValueOfObjCType:"q" at:&self->_actionType];
  [a3 encodeInt:self->_errorCode forKey:@"errorCode"];
}

- (IMGroupActionItem)initWithDictionary:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)IMGroupActionItem;
  id v4 = -[IMItem initWithDictionary:](&v6, sel_initWithDictionary_);
  if (v4)
  {
    -[IMGroupActionItem setActionType:](v4, "setActionType:", objc_msgSend((id)objc_msgSend(a3, "objectForKey:", @"actionType"), "longLongValue"));
    -[IMGroupActionItem setOtherCountryCode:](v4, "setOtherCountryCode:", [a3 objectForKey:@"otherCountryCode"]);
    -[IMGroupActionItem setOtherHandle:](v4, "setOtherHandle:", [a3 objectForKey:@"otherHandle"]);
    -[IMGroupActionItem setOtherUnformattedID:](v4, "setOtherUnformattedID:", [a3 objectForKey:@"otherUnformattedID"]);
    -[IMGroupActionItem setErrorCode:](v4, "setErrorCode:", objc_msgSend((id)objc_msgSend(a3, "_numberForKey:", @"errorCode"), "intValue"));
  }
  return v4;
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
      v15.super_class = (Class)IMGroupActionItem;
      BOOL v7 = [(IMItem *)&v15 isEqual:a3];
      if (v7)
      {
        int64_t actionType = self->_actionType;
        if (actionType == [a3 actionType])
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
        else
        {
          LOBYTE(v7) = 0;
        }
      }
    }
    else
    {
      v14.receiver = self;
      v14.super_class = (Class)IMGroupActionItem;
      LOBYTE(v7) = [(IMItem *)&v14 isEqual:a3];
    }
  }
  return v7;
}

- (id)copyDictionaryRepresentation
{
  v11.receiver = self;
  v11.super_class = (Class)IMGroupActionItem;
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
  v8 = (const void *)[NSNumber numberWithLongLong:self->_actionType];
  if (v8) {
    CFDictionarySetValue(v3, @"actionType", v8);
  }
  v9 = (const void *)[NSNumber numberWithUnsignedInt:self->_errorCode];
  if (v9) {
    CFDictionarySetValue(v3, @"errorCode", v9);
  }
  return v3;
}

- (BOOL)actionIsGroupPhoto
{
  int64_t v3 = [(IMGroupActionItem *)self actionType];
  if (v3 != 1) {
    LOBYTE(v3) = [(IMGroupActionItem *)self actionType] == 3;
  }
  return v3;
}

- (BOOL)isCompatibleWithMiC
{
  return [(IMGroupActionItem *)self actionType] == 0;
}

- (id)fileTransferGUIDs
{
  v4[1] = *MEMORY[0x1E4F143B8];
  if (![(IMGroupActionItem *)self actionIsGroupPhoto]) {
    return 0;
  }
  v4[0] = IMFileTransferGUIDForPluginPayloadOrGroupPhotoInMessageGUID((uint64_t)[(IMItem *)self guid]);
  return (id)[MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
}

- (int64_t)actionType
{
  return self->_actionType;
}

- (void)setActionType:(int64_t)a3
{
  self->_int64_t actionType = a3;
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
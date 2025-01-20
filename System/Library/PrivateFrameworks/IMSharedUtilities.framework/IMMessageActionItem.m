@interface IMMessageActionItem
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (IMMessageActionItem)initWithCoder:(id)a3;
- (IMMessageActionItem)initWithDictionary:(id)a3;
- (NSString)originalMessageGUID;
- (NSString)otherCountryCode;
- (NSString)otherHandle;
- (NSString)otherUnformattedID;
- (id)copyDictionaryRepresentation;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)actionType;
- (void)encodeWithCoder:(id)a3;
- (void)setActionType:(int64_t)a3;
- (void)setOriginalMessageGUID:(id)a3;
- (void)setOtherCountryCode:(id)a3;
- (void)setOtherHandle:(id)a3;
- (void)setOtherUnformattedID:(id)a3;
@end

@implementation IMMessageActionItem

- (id)description
{
  v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)IMMessageActionItem;
  v4 = [(IMItem *)&v7 description];
  v5 = [v3 stringWithFormat:@"%@ actionType:%d originalMessageGUID:%@", v4, self->_actionType, self->_originalMessageGUID];

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)IMMessageActionItem;
  id v4 = [(IMItem *)&v10 copyWithZone:a3];
  v5 = [(IMMessageActionItem *)self otherUnformattedID];
  [v4 setOtherUnformattedID:v5];

  v6 = [(IMMessageActionItem *)self otherHandle];
  [v4 setOtherHandle:v6];

  objc_super v7 = [(IMMessageActionItem *)self otherCountryCode];
  [v4 setOtherCountryCode:v7];

  v8 = [(IMMessageActionItem *)self originalMessageGUID];
  [v4 setOriginalMessageGUID:v8];

  objc_msgSend(v4, "setActionType:", -[IMMessageActionItem actionType](self, "actionType"));
  return v4;
}

- (IMMessageActionItem)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)IMMessageActionItem;
  v5 = [(IMItem *)&v11 initWithCoder:v4];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"otherCountryCode"];
    [(IMMessageActionItem *)v5 setOtherCountryCode:v6];

    objc_super v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"otherHandle"];
    [(IMMessageActionItem *)v5 setOtherHandle:v7];

    v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"otherUnformattedID"];
    [(IMMessageActionItem *)v5 setOtherUnformattedID:v8];

    v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"originalMessageGUID"];
    [(IMMessageActionItem *)v5 setOriginalMessageGUID:v9];

    v5->_actionType = [v4 decodeInt64ForKey:@"actionType"];
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)IMMessageActionItem;
  id v4 = a3;
  [(IMItem *)&v9 encodeWithCoder:v4];
  v5 = [(IMMessageActionItem *)self otherCountryCode];
  [v4 encodeObject:v5 forKey:@"otherCountryCode"];

  v6 = [(IMMessageActionItem *)self otherHandle];
  [v4 encodeObject:v6 forKey:@"otherHandle"];

  objc_super v7 = [(IMMessageActionItem *)self otherUnformattedID];
  [v4 encodeObject:v7 forKey:@"otherUnformattedID"];

  v8 = [(IMMessageActionItem *)self originalMessageGUID];
  [v4 encodeObject:v8 forKey:@"originalMessageGUID"];

  [v4 encodeInt64:self->_actionType forKey:@"actionType"];
}

- (IMMessageActionItem)initWithDictionary:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)IMMessageActionItem;
  v5 = [(IMItem *)&v12 initWithDictionary:v4];
  if (v5)
  {
    v6 = [v4 objectForKey:@"actionType"];
    -[IMMessageActionItem setActionType:](v5, "setActionType:", [v6 longLongValue]);

    objc_super v7 = [v4 objectForKey:@"otherCountryCode"];
    [(IMMessageActionItem *)v5 setOtherCountryCode:v7];

    v8 = [v4 objectForKey:@"otherHandle"];
    [(IMMessageActionItem *)v5 setOtherHandle:v8];

    objc_super v9 = [v4 objectForKey:@"otherUnformattedID"];
    [(IMMessageActionItem *)v5 setOtherUnformattedID:v9];

    objc_super v10 = [v4 objectForKey:@"originalMessageGUID"];
    [(IMMessageActionItem *)v5 setOriginalMessageGUID:v10];
  }
  return v5;
}

- (id)copyDictionaryRepresentation
{
  v11.receiver = self;
  v11.super_class = (Class)IMMessageActionItem;
  v3 = [(IMItem *)&v11 copyDictionaryRepresentation];
  id v4 = (void *)MEMORY[0x1A6228190]();
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
  v8 = [NSNumber numberWithLongLong:self->_actionType];
  if (v8) {
    CFDictionarySetValue(v3, @"actionType", v8);
  }

  originalMessageGUID = self->_originalMessageGUID;
  if (originalMessageGUID) {
    CFDictionarySetValue(v3, @"originalMessageGUID", originalMessageGUID);
  }
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (IMMessageActionItem *)a3;
  if (v4 == self)
  {
    unsigned __int8 v10 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      v32.receiver = self;
      v32.super_class = (Class)IMMessageActionItem;
      if (![(IMItem *)&v32 isEqual:v5])
      {
        unsigned __int8 v10 = 0;
LABEL_34:

        goto LABEL_35;
      }
      otherCountryCode = self->_otherCountryCode;
      objc_super v7 = [(IMMessageActionItem *)v5 otherCountryCode];
      if (otherCountryCode != v7)
      {
        v8 = self->_otherCountryCode;
        objc_super v9 = [(IMMessageActionItem *)v5 otherCountryCode];
        if (![(NSString *)v8 isEqualToString:v9])
        {
          unsigned __int8 v10 = 0;
          goto LABEL_32;
        }
        v30 = v9;
      }
      otherHandle = self->_otherHandle;
      objc_super v12 = [(IMMessageActionItem *)v5 otherHandle];
      if (otherHandle != v12)
      {
        v13 = self->_otherHandle;
        v14 = [(IMMessageActionItem *)v5 otherHandle];
        if (![(NSString *)v13 isEqualToString:v14])
        {
          unsigned __int8 v10 = 0;
          objc_super v9 = v30;
LABEL_30:

LABEL_31:
          if (otherCountryCode == v7)
          {
LABEL_33:

            goto LABEL_34;
          }
LABEL_32:

          goto LABEL_33;
        }
        v28 = v14;
      }
      otherUnformattedID = self->_otherUnformattedID;
      v16 = [(IMMessageActionItem *)v5 otherUnformattedID];
      v29 = otherUnformattedID;
      if (otherUnformattedID == v16)
      {
        v27 = otherHandle;
      }
      else
      {
        v17 = self->_otherUnformattedID;
        v18 = [(IMMessageActionItem *)v5 otherUnformattedID];
        if (![(NSString *)v17 isEqualToString:v18])
        {
          unsigned __int8 v10 = 0;
          objc_super v9 = v30;
LABEL_28:

LABEL_29:
          v14 = v28;
          if (otherHandle == v12) {
            goto LABEL_31;
          }
          goto LABEL_30;
        }
        v26 = v18;
        v27 = otherHandle;
      }
      originalMessageGUID = self->_originalMessageGUID;
      v20 = [(IMMessageActionItem *)v5 originalMessageGUID];
      if (originalMessageGUID == v20
        || (v21 = self->_originalMessageGUID,
            [(IMMessageActionItem *)v5 originalMessageGUID],
            v25 = objc_claimAutoreleasedReturnValue(),
            -[NSString isEqualToString:](v21, "isEqualToString:")))
      {
        otherHandle = v27;
        int64_t actionType = self->_actionType;
        unsigned __int8 v10 = actionType == [(IMMessageActionItem *)v5 actionType];
        if (originalMessageGUID == v20)
        {

          v23 = v29;
          objc_super v9 = v30;
LABEL_27:
          v18 = v26;
          if (v23 == v16) {
            goto LABEL_29;
          }
          goto LABEL_28;
        }
        objc_super v9 = v30;
      }
      else
      {
        unsigned __int8 v10 = 0;
        objc_super v9 = v30;
        otherHandle = v27;
      }

      v23 = v29;
      goto LABEL_27;
    }
    v31.receiver = self;
    v31.super_class = (Class)IMMessageActionItem;
    unsigned __int8 v10 = [(IMItem *)&v31 isEqual:v4];
  }
LABEL_35:

  return v10;
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

- (NSString)originalMessageGUID
{
  return self->_originalMessageGUID;
}

- (void)setOriginalMessageGUID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originalMessageGUID, 0);
  objc_storeStrong((id *)&self->_otherUnformattedID, 0);
  objc_storeStrong((id *)&self->_otherHandle, 0);

  objc_storeStrong((id *)&self->_otherCountryCode, 0);
}

@end
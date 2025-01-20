@interface IMLocationUpdateSentItem
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (IMLocationUpdateSentItem)initWithCoder:(id)a3;
- (IMLocationUpdateSentItem)initWithDictionary:(id)a3;
- (NSString)otherCountryCode;
- (NSString)otherHandle;
- (NSString)otherUnformattedID;
- (id)copyDictionaryRepresentation;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setOtherCountryCode:(id)a3;
- (void)setOtherHandle:(id)a3;
- (void)setOtherUnformattedID:(id)a3;
@end

@implementation IMLocationUpdateSentItem

- (id)copyWithZone:(_NSZone *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)IMLocationUpdateSentItem;
  id v4 = [(IMItem *)&v9 copyWithZone:a3];
  v5 = [(IMLocationUpdateSentItem *)self otherUnformattedID];
  [v4 setOtherUnformattedID:v5];

  v6 = [(IMLocationUpdateSentItem *)self otherHandle];
  [v4 setOtherHandle:v6];

  v7 = [(IMLocationUpdateSentItem *)self otherCountryCode];
  [v4 setOtherCountryCode:v7];

  return v4;
}

- (IMLocationUpdateSentItem)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)IMLocationUpdateSentItem;
  v5 = [(IMItem *)&v10 initWithCoder:v4];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"otherCountryCode"];
    [(IMLocationUpdateSentItem *)v5 setOtherCountryCode:v6];

    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"otherHandle"];
    [(IMLocationUpdateSentItem *)v5 setOtherHandle:v7];

    v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"otherUnformattedID"];
    [(IMLocationUpdateSentItem *)v5 setOtherUnformattedID:v8];
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)IMLocationUpdateSentItem;
  id v4 = a3;
  [(IMItem *)&v8 encodeWithCoder:v4];
  v5 = [(IMLocationUpdateSentItem *)self otherCountryCode];
  [v4 encodeObject:v5 forKey:@"otherCountryCode"];

  v6 = [(IMLocationUpdateSentItem *)self otherHandle];
  [v4 encodeObject:v6 forKey:@"otherHandle"];

  v7 = [(IMLocationUpdateSentItem *)self otherUnformattedID];
  [v4 encodeObject:v7 forKey:@"otherUnformattedID"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (IMLocationUpdateSentItem *)a3;
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
      v26.receiver = self;
      v26.super_class = (Class)IMLocationUpdateSentItem;
      if (![(IMItem *)&v26 isEqual:v5])
      {
        unsigned __int8 v10 = 0;
LABEL_23:

        goto LABEL_24;
      }
      otherCountryCode = self->_otherCountryCode;
      v7 = [(IMLocationUpdateSentItem *)v5 otherCountryCode];
      if (otherCountryCode != v7)
      {
        objc_super v8 = self->_otherCountryCode;
        objc_super v9 = [(IMLocationUpdateSentItem *)v5 otherCountryCode];
        if (![(NSString *)v8 isEqualToString:v9])
        {
          unsigned __int8 v10 = 0;
          goto LABEL_21;
        }
        v24 = v9;
      }
      otherHandle = self->_otherHandle;
      v12 = [(IMLocationUpdateSentItem *)v5 otherHandle];
      if (otherHandle != v12)
      {
        v13 = self->_otherHandle;
        v14 = [(IMLocationUpdateSentItem *)v5 otherHandle];
        if (![(NSString *)v13 isEqualToString:v14])
        {
          unsigned __int8 v10 = 0;
          objc_super v9 = v24;
          goto LABEL_19;
        }
        v22 = v14;
      }
      otherUnformattedID = self->_otherUnformattedID;
      uint64_t v16 = [(IMLocationUpdateSentItem *)v5 otherUnformattedID];
      if (otherUnformattedID == (NSString *)v16)
      {

        unsigned __int8 v10 = 1;
      }
      else
      {
        v17 = (void *)v16;
        v18 = self->_otherUnformattedID;
        v19 = [(IMLocationUpdateSentItem *)v5 otherUnformattedID];
        unsigned __int8 v10 = [(NSString *)v18 isEqualToString:v19];
      }
      BOOL v20 = otherHandle == v12;
      v14 = v23;
      objc_super v9 = v24;
      if (v20)
      {
LABEL_20:

        if (otherCountryCode == v7)
        {
LABEL_22:

          goto LABEL_23;
        }
LABEL_21:

        goto LABEL_22;
      }
LABEL_19:

      goto LABEL_20;
    }
    v25.receiver = self;
    v25.super_class = (Class)IMLocationUpdateSentItem;
    unsigned __int8 v10 = [(IMItem *)&v25 isEqual:v4];
  }
LABEL_24:

  return v10;
}

- (IMLocationUpdateSentItem)initWithDictionary:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)IMLocationUpdateSentItem;
  v5 = [(IMItem *)&v10 initWithDictionary:v4];
  if (v5)
  {
    v6 = [v4 objectForKey:@"otherCountryCode"];
    [(IMLocationUpdateSentItem *)v5 setOtherCountryCode:v6];

    v7 = [v4 objectForKey:@"otherHandle"];
    [(IMLocationUpdateSentItem *)v5 setOtherHandle:v7];

    objc_super v8 = [v4 objectForKey:@"otherUnformattedID"];
    [(IMLocationUpdateSentItem *)v5 setOtherUnformattedID:v8];
  }
  return v5;
}

- (id)copyDictionaryRepresentation
{
  v9.receiver = self;
  v9.super_class = (Class)IMLocationUpdateSentItem;
  v3 = [(IMItem *)&v9 copyDictionaryRepresentation];
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
  return v3;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_otherUnformattedID, 0);
  objc_storeStrong((id *)&self->_otherHandle, 0);

  objc_storeStrong((id *)&self->_otherCountryCode, 0);
}

@end
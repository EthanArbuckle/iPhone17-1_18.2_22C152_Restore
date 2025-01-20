@interface HSIORChannelDescription
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToChannelDescription:(id)a3;
- (HSIORChannelDescription)initWithIOReportChannelRef:(__CFDictionary *)a3;
- (NSNumber)driverIdentifier;
- (NSNumber)identifier;
- (NSString)driverName;
- (NSString)groupName;
- (NSString)name;
- (NSString)subGroupName;
- (NSString)summary;
- (Protocol)reportingProtocol;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)setDriverIdentifier:(id)a3;
- (void)setDriverName:(id)a3;
- (void)setGroupName:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setName:(id)a3;
- (void)setReportingProtocol:(id)a3;
- (void)setSubGroupName:(id)a3;
- (void)setSummary:(id)a3;
@end

@implementation HSIORChannelDescription

- (HSIORChannelDescription)initWithIOReportChannelRef:(__CFDictionary *)a3
{
  v27.receiver = self;
  v27.super_class = (Class)HSIORChannelDescription;
  v3 = [(HSIORChannelDescription *)&v27 init];
  if (v3)
  {
    uint64_t v4 = IOReportChannelGetChannelName();
    name = v3->_name;
    v3->_name = (NSString *)v4;

    uint64_t v6 = IOReportChannelGetGroup();
    groupName = v3->_groupName;
    v3->_groupName = (NSString *)v6;

    uint64_t v8 = IOReportChannelGetSubGroup();
    subGroupName = v3->_subGroupName;
    v3->_subGroupName = (NSString *)v8;

    uint64_t v10 = IOReportChannelGetDriverName();
    driverName = v3->_driverName;
    v3->_driverName = (NSString *)v10;

    uint64_t ChannelID = IOReportChannelGetChannelID();
    if (ChannelID == 0x8000000000000000)
    {
      identifier = v3->_identifier;
      v3->_identifier = 0;
    }
    else
    {
      uint64_t v14 = [NSNumber numberWithUnsignedLongLong:ChannelID];
      identifier = v3->_identifier;
      v3->_identifier = (NSNumber *)v14;
    }

    uint64_t v15 = IOReportChannelGetChannelID();
    if (v15 == 0x8000000000000000)
    {
      driverIdentifier = v3->_driverIdentifier;
      v3->_driverIdentifier = 0;
    }
    else
    {
      uint64_t v17 = [NSNumber numberWithUnsignedLongLong:v15];
      driverIdentifier = v3->_driverIdentifier;
      v3->_driverIdentifier = (NSNumber *)v17;
    }

    v18 = (void *)IOReportChannelCopyDescription();
    v19 = [MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet];
    uint64_t v20 = [v18 stringByTrimmingCharactersInSet:v19];
    summary = v3->_summary;
    v3->_summary = (NSString *)v20;

    int Format = IOReportChannelGetFormat();
    if (Format == 1)
    {
      v24 = &unk_26DD13B48;
    }
    else
    {
      if (!Format)
      {
        reportingProtocol = v3->_reportingProtocol;
        v3->_reportingProtocol = 0;
LABEL_14:

        return v3;
      }
      v24 = &unk_26DD13AE0;
    }
    v25 = v24;
    reportingProtocol = v3->_reportingProtocol;
    v3->_reportingProtocol = v25;
    goto LABEL_14;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = [(HSIORChannelDescription *)self name];
  [v4 setName:v5];

  uint64_t v6 = [(HSIORChannelDescription *)self groupName];
  [v4 setGroupName:v6];

  v7 = [(HSIORChannelDescription *)self subGroupName];
  [v4 setSubGroupName:v7];

  uint64_t v8 = [(HSIORChannelDescription *)self driverName];
  [v4 setDriverName:v8];

  v9 = [(HSIORChannelDescription *)self identifier];
  [v4 setIdentifier:v9];

  uint64_t v10 = [(HSIORChannelDescription *)self driverIdentifier];
  [v4 setDriverIdentifier:v10];

  v11 = [(HSIORChannelDescription *)self summary];
  [v4 setSummary:v11];

  v12 = [(HSIORChannelDescription *)self reportingProtocol];
  [v4 setReportingProtocol:v12];

  return v4;
}

- (unint64_t)hash
{
  v3 = [(HSIORChannelDescription *)self name];
  uint64_t v4 = [v3 hash];
  v5 = [(HSIORChannelDescription *)self groupName];
  uint64_t v6 = [v5 hash] ^ v4;
  v7 = [(HSIORChannelDescription *)self subGroupName];
  uint64_t v8 = [v7 hash];
  v9 = [(HSIORChannelDescription *)self driverName];
  uint64_t v10 = v6 ^ v8 ^ [v9 hash];
  v11 = [(HSIORChannelDescription *)self identifier];
  uint64_t v12 = [v11 hash];
  v13 = [(HSIORChannelDescription *)self driverIdentifier];
  uint64_t v14 = v12 ^ [v13 hash];
  uint64_t v15 = [(HSIORChannelDescription *)self summary];
  uint64_t v16 = v10 ^ v14 ^ [v15 hash];
  uint64_t v17 = [(HSIORChannelDescription *)self reportingProtocol];
  v18 = NSStringFromProtocol(v17);
  unint64_t v19 = v16 ^ [v18 hash];

  return v19;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (HSIORChannelDescription *)a3;
  if (v4 == self)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(HSIORChannelDescription *)self isEqualToChannelDescription:v4];
  }

  return v5;
}

- (BOOL)isEqualToChannelDescription:(id)a3
{
  id v11 = a3;
  uint64_t v12 = [v11 name];
  if (!v12)
  {
    v3 = [(HSIORChannelDescription *)self name];
    if (!v3)
    {
      char v42 = 1;
LABEL_6:

      goto LABEL_7;
    }
  }
  uint64_t v4 = [v11 name];
  BOOL v5 = [(HSIORChannelDescription *)self name];
  char v42 = [v4 isEqual:v5];

  if (!v12) {
    goto LABEL_6;
  }
LABEL_7:

  v13 = [v11 groupName];
  if (!v13)
  {
    uint64_t v4 = [(HSIORChannelDescription *)self groupName];
    if (!v4)
    {
      char v41 = 1;
LABEL_12:

      goto LABEL_13;
    }
  }
  BOOL v5 = [v11 groupName];
  uint64_t v6 = [(HSIORChannelDescription *)self groupName];
  char v41 = [v5 isEqual:v6];

  if (!v13) {
    goto LABEL_12;
  }
LABEL_13:

  uint64_t v14 = [v11 subGroupName];
  if (!v14)
  {
    BOOL v5 = [(HSIORChannelDescription *)self subGroupName];
    if (!v5)
    {
      char v40 = 1;
LABEL_18:

      goto LABEL_19;
    }
  }
  uint64_t v6 = [v11 subGroupName];
  v7 = [(HSIORChannelDescription *)self subGroupName];
  char v40 = [v6 isEqual:v7];

  if (!v14) {
    goto LABEL_18;
  }
LABEL_19:

  uint64_t v15 = [v11 driverName];
  if (!v15)
  {
    uint64_t v6 = [(HSIORChannelDescription *)self driverName];
    if (!v6)
    {
      char v16 = 1;
LABEL_24:

      goto LABEL_25;
    }
  }
  v7 = [v11 driverName];
  uint64_t v8 = [(HSIORChannelDescription *)self driverName];
  char v16 = [v7 isEqual:v8];

  if (!v15) {
    goto LABEL_24;
  }
LABEL_25:

  uint64_t v17 = [v11 identifier];
  if (!v17)
  {
    v7 = [(HSIORChannelDescription *)self identifier];
    if (!v7)
    {
      char v18 = 1;
LABEL_30:

      goto LABEL_31;
    }
  }
  uint64_t v8 = [v11 identifier];
  v9 = [(HSIORChannelDescription *)self identifier];
  char v18 = [v8 isEqual:v9];

  if (!v17) {
    goto LABEL_30;
  }
LABEL_31:

  unint64_t v19 = [v11 driverIdentifier];
  if (!v19)
  {
    uint64_t v8 = [(HSIORChannelDescription *)self driverIdentifier];
    if (!v8)
    {
      char v21 = 1;
LABEL_36:

      goto LABEL_37;
    }
  }
  v9 = [v11 driverIdentifier];
  uint64_t v20 = [(HSIORChannelDescription *)self driverIdentifier];
  char v21 = [v9 isEqual:v20];

  if (!v19) {
    goto LABEL_36;
  }
LABEL_37:

  v22 = [v11 summary];
  if (!v22)
  {
    v9 = [(HSIORChannelDescription *)self summary];
    if (!v9)
    {
      char v25 = 1;
LABEL_42:

      goto LABEL_43;
    }
  }
  v23 = [v11 summary];
  v24 = [(HSIORChannelDescription *)self summary];
  char v25 = [v23 isEqual:v24];

  if (!v22) {
    goto LABEL_42;
  }
LABEL_43:

  v26 = [v11 reportingProtocol];
  v39 = v11;
  if (!v26)
  {
    uint64_t v37 = [(HSIORChannelDescription *)self reportingProtocol];
    if (!v37)
    {
      v38 = 0;
      char v35 = 1;
LABEL_48:

      goto LABEL_49;
    }
  }
  objc_msgSend(v11, "reportingProtocol", v37, v11);
  objc_super v27 = (Protocol *)objc_claimAutoreleasedReturnValue();
  v28 = NSStringFromProtocol(v27);
  [(HSIORChannelDescription *)self reportingProtocol];
  char v29 = v21;
  char v30 = v16;
  v31 = (Protocol *)objc_claimAutoreleasedReturnValue();
  NSStringFromProtocol(v31);
  char v32 = v25;
  v34 = char v33 = v18;
  char v35 = [v28 isEqualToString:v34];

  char v18 = v33;
  char v25 = v32;

  char v16 = v30;
  char v21 = v29;

  if (!v26) {
    goto LABEL_48;
  }
LABEL_49:

  return v42 & v41 & v40 & v16 & v18 & v21 & v25 & v35;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HSIORChannelDescription;
  uint64_t v4 = [(HSIORChannelDescription *)&v8 description];
  BOOL v5 = [(HSIORChannelDescription *)self summary];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (NSString)summary
{
  return self->_summary;
}

- (void)setSummary:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSString)groupName
{
  return self->_groupName;
}

- (void)setGroupName:(id)a3
{
}

- (NSString)subGroupName
{
  return self->_subGroupName;
}

- (void)setSubGroupName:(id)a3
{
}

- (NSNumber)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)driverName
{
  return self->_driverName;
}

- (void)setDriverName:(id)a3
{
}

- (NSNumber)driverIdentifier
{
  return self->_driverIdentifier;
}

- (void)setDriverIdentifier:(id)a3
{
}

- (Protocol)reportingProtocol
{
  return self->_reportingProtocol;
}

- (void)setReportingProtocol:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reportingProtocol, 0);
  objc_storeStrong((id *)&self->_driverIdentifier, 0);
  objc_storeStrong((id *)&self->_driverName, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_subGroupName, 0);
  objc_storeStrong((id *)&self->_groupName, 0);
  objc_storeStrong((id *)&self->_name, 0);

  objc_storeStrong((id *)&self->_summary, 0);
}

@end
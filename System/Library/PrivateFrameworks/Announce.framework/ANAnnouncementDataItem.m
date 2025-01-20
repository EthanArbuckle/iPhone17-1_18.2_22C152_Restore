@interface ANAnnouncementDataItem
+ (BOOL)supportsSecureCoding;
+ (id)strictSecureDecodeFromData:(id)a3;
+ (id)strictSecureDecodeFromData:(id)a3 classList:(id)a4 decodingFailurePolicy:(int64_t)a5;
- (ANAnnouncementDataItem)init;
- (ANAnnouncementDataItem)initWithCoder:(id)a3;
- (ANAnnouncementDataItem)initWithData:(id)a3 type:(unint64_t)a4;
- (ANAnnouncementDataItem)initWithMessage:(id)a3;
- (NSData)data;
- (NSDictionary)info;
- (NSString)description;
- (id)_stringForDataType:(unint64_t)a3;
- (id)copy;
- (id)message;
- (unint64_t)flags;
- (unint64_t)type;
- (void)encodeWithCoder:(id)a3;
- (void)setData:(id)a3;
- (void)setFlags:(unint64_t)a3;
- (void)setType:(unint64_t)a3;
@end

@implementation ANAnnouncementDataItem

- (ANAnnouncementDataItem)init
{
  v3.receiver = self;
  v3.super_class = (Class)ANAnnouncementDataItem;
  return [(ANAnnouncementDataItem *)&v3 init];
}

- (ANAnnouncementDataItem)initWithData:(id)a3 type:(unint64_t)a4
{
  id v7 = a3;
  v8 = [(ANAnnouncementDataItem *)self init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_data, a3);
    v9->_type = a4;
    v9->_flags = 0;
  }

  return v9;
}

+ (id)strictSecureDecodeFromData:(id)a3
{
  objc_super v3 = (void *)MEMORY[0x263EFFA68];
  if (a3)
  {
    v4 = (void *)MEMORY[0x263EFFA08];
    id v5 = a3;
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = objc_opt_class();
    v8 = objc_msgSend(v4, "setWithObjects:", v6, v7, objc_opt_class(), 0);
    uint64_t v9 = +[ANAnnouncementDataItem strictSecureDecodeFromData:v5 classList:v8 decodingFailurePolicy:1];

    if (v9) {
      objc_super v3 = (void *)v9;
    }
  }

  return v3;
}

+ (id)strictSecureDecodeFromData:(id)a3 classList:(id)a4 decodingFailurePolicy:(int64_t)a5
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v7 = a4;
  v8 = (objc_class *)MEMORY[0x263F08928];
  id v9 = a3;
  id v19 = 0;
  v10 = (void *)[[v8 alloc] initForReadingFromData:v9 error:&v19];

  id v11 = v19;
  if (v11)
  {
    id v12 = v11;
    v13 = ANLogHandleAnnouncementDataItem();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v21 = &stru_26D2D46B0;
      __int16 v22 = 2112;
      id v23 = v12;
      _os_log_impl(&dword_220FAA000, v13, OS_LOG_TYPE_ERROR, "%@Failed to init unarchiver for reading AnnouncementDataItems. error = %@", buf, 0x16u);
    }
LABEL_8:
    v16 = 0;
    goto LABEL_9;
  }
  [v10 _enableStrictSecureDecodingMode];
  [v10 setDecodingFailurePolicy:a5];
  uint64_t v14 = *MEMORY[0x263F081D0];
  id v18 = 0;
  v13 = [v10 decodeTopLevelObjectOfClasses:v7 forKey:v14 error:&v18];
  id v12 = v18;
  if (v12)
  {
    v15 = ANLogHandleAnnouncementDataItem();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v21 = &stru_26D2D46B0;
      __int16 v22 = 2112;
      id v23 = v12;
      _os_log_impl(&dword_220FAA000, v15, OS_LOG_TYPE_ERROR, "%@Failed to unarchive data for AnnouncementDataItems. error = %@", buf, 0x16u);
    }

    goto LABEL_8;
  }
  v13 = v13;
  v16 = v13;
LABEL_9:

  return v16;
}

- (id)copy
{
  objc_super v3 = objc_opt_new();
  uint64_t v4 = [(ANAnnouncementDataItem *)self data];
  id v5 = (void *)v3[2];
  v3[2] = v4;

  v3[1] = [(ANAnnouncementDataItem *)self type];
  v3[3] = [(ANAnnouncementDataItem *)self flags];
  return v3;
}

- (NSDictionary)info
{
  objc_super v3 = objc_opt_new();
  uint64_t v4 = [(ANAnnouncementDataItem *)self _stringForDataType:[(ANAnnouncementDataItem *)self type]];
  [v3 setValue:v4 forKey:@"DataType"];

  id v5 = [(ANAnnouncementDataItem *)self data];
  [v3 setValue:v5 forKey:@"Data"];

  uint64_t v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[ANAnnouncementDataItem flags](self, "flags"));
  [v3 setValue:v6 forKey:@"Flags"];

  return (NSDictionary *)v3;
}

- (NSString)description
{
  v2 = [(ANAnnouncementDataItem *)self info];
  objc_super v3 = [v2 description];

  return (NSString *)v3;
}

- (ANAnnouncementDataItem)initWithMessage:(id)a3
{
  id v4 = a3;
  id v5 = [(ANAnnouncementDataItem *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKey:@"DataType"];
    id v7 = v6;
    if (v6) {
      uint64_t v6 = (void *)[v6 unsignedIntegerValue];
    }
    v5->_type = (unint64_t)v6;
    uint64_t v8 = [v4 objectForKey:@"Data"];
    data = v5->_data;
    v5->_data = (NSData *)v8;

    v10 = [v4 objectForKey:@"Flags"];
    id v11 = v10;
    if (v10) {
      v10 = (void *)[v10 unsignedIntegerValue];
    }
    v5->_flags = (unint64_t)v10;
  }
  return v5;
}

- (id)message
{
  objc_super v3 = objc_opt_new();
  id v4 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[ANAnnouncementDataItem type](self, "type"));
  [v3 setValue:v4 forKey:@"DataType"];

  id v5 = [(ANAnnouncementDataItem *)self data];
  [v3 setValue:v5 forKey:@"Data"];

  uint64_t v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[ANAnnouncementDataItem flags](self, "flags"));
  [v3 setValue:v6 forKey:@"Flags"];

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = NSNumber;
  id v5 = a3;
  uint64_t v6 = objc_msgSend(v4, "numberWithUnsignedInteger:", -[ANAnnouncementDataItem type](self, "type"));
  [v5 encodeObject:v6 forKey:@"DataType"];

  id v7 = [(ANAnnouncementDataItem *)self data];
  [v5 encodeObject:v7 forKey:@"Data"];

  objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[ANAnnouncementDataItem flags](self, "flags"));
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  [v5 encodeObject:v8 forKey:@"Flags"];
}

- (ANAnnouncementDataItem)initWithCoder:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)ANAnnouncementDataItem;
  id v5 = [(ANAnnouncementDataItem *)&v16 init];
  if (v5)
  {
    uint64_t v6 = (void *)MEMORY[0x263EFFA08];
    uint64_t v7 = objc_opt_class();
    id v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"Data"];
    data = v5->_data;
    v5->_data = (NSData *)v9;

    id v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"DataType"];
    id v12 = v11;
    if (v11) {
      id v11 = (void *)[v11 unsignedIntegerValue];
    }
    v5->_type = (unint64_t)v11;
    v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Flags"];
    uint64_t v14 = v13;
    if (v13) {
      v13 = (void *)[v13 unsignedIntegerValue];
    }
    v5->_flags = (unint64_t)v13;
  }
  return v5;
}

- (id)_stringForDataType:(unint64_t)a3
{
  if (a3 > 2) {
    return @"Unknown";
  }
  else {
    return off_264587320[a3];
  }
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (NSData)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
}

- (unint64_t)flags
{
  return self->_flags;
}

- (void)setFlags:(unint64_t)a3
{
  self->_flags = a3;
}

- (void).cxx_destruct
{
}

@end
@interface HPSResult
+ (BOOL)supportsSecureCoding;
- (BOOL)isSuccess;
- (HPSResult)initWithCoder:(id)a3;
- (HPSResult)initWithSetting:(id)a3 accessoryIdentifier:(id)a4 error:(id)a5 result:(BOOL)a6;
- (HPSSetting)setting;
- (NSError)error;
- (NSUUID)accessoryIdentifier;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HPSResult

- (HPSResult)initWithSetting:(id)a3 accessoryIdentifier:(id)a4 error:(id)a5 result:(BOOL)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v17.receiver = self;
  v17.super_class = (Class)HPSResult;
  v14 = [(HPSResult *)&v17 init];
  v15 = v14;
  if (v14)
  {
    v14->_isSuccess = a6;
    objc_storeStrong((id *)&v14->_error, a5);
    objc_storeStrong((id *)&v15->_accessoryIdentifier, a4);
    objc_storeStrong((id *)&v15->_setting, a3);
  }

  return v15;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(HPSResult *)self accessoryIdentifier];
  if (v5) {
    [v4 encodeObject:v5 forKey:@"AccessoryIdentifier"];
  }
  v6 = objc_msgSend(NSNumber, "numberWithBool:", -[HPSResult isSuccess](self, "isSuccess"));
  [v4 encodeObject:v6 forKey:@"Success"];

  v7 = [(HPSResult *)self setting];
  if (v7)
  {
    id v12 = 0;
    v8 = [MEMORY[0x263F08910] archivedDataWithRootObject:v7 requiringSecureCoding:1 error:&v12];
    id v9 = v12;
    if (v9)
    {
      v10 = _HPSLoggingFacility();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[HPSResult encodeWithCoder:]((uint64_t)v9, v10);
      }
    }
    else
    {
      [v4 encodeObject:v8 forKey:@"Value"];
    }
  }
  id v11 = [(HPSResult *)self error];
  if (v11) {
    [v4 encodeObject:v11 forKey:@"Error"];
  }
}

- (HPSResult)initWithCoder:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)HPSResult;
  v5 = [(HPSResult *)&v18 init];
  if (!v5)
  {
LABEL_13:
    id v13 = v5;
    goto LABEL_14;
  }
  if ([v4 containsValueForKey:@"AccessoryIdentifier"])
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AccessoryIdentifier"];
    accessoryIdentifier = v5->_accessoryIdentifier;
    v5->_accessoryIdentifier = (NSUUID *)v6;
  }
  v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Success"];
  if (v8)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v5->_isSuccess = [v8 BOOLValue];
    }
  }
  if (![v4 containsValueForKey:@"Value"]) {
    goto LABEL_17;
  }
  id v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Value"];
  id v17 = 0;
  uint64_t v10 = [MEMORY[0x263F08928] unarchivedObjectOfClass:objc_opt_class() fromData:v9 error:&v17];
  id v11 = v17;
  setting = v5->_setting;
  v5->_setting = (HPSSetting *)v10;

  if (!v11)
  {
LABEL_17:
    if ([v4 containsValueForKey:@"Error"])
    {
      uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Error"];
      error = v5->_error;
      v5->_error = (NSError *)v14;
    }
    goto LABEL_13;
  }

  id v13 = 0;
LABEL_14:

  return v13;
}

- (id)description
{
  v3 = NSString;
  if ([(HPSResult *)self isSuccess]) {
    id v4 = @"YES";
  }
  else {
    id v4 = @"NO";
  }
  v5 = [(HPSResult *)self accessoryIdentifier];
  uint64_t v6 = [(HPSResult *)self setting];
  v7 = [(HPSResult *)self error];
  v8 = [v3 stringWithFormat:@"\n Success = %@, \n Accessory Identifier = %@, \n Setting = [%@], \n Error = %@", v4, v5, v6, v7];

  return v8;
}

- (HPSSetting)setting
{
  return self->_setting;
}

- (NSUUID)accessoryIdentifier
{
  return self->_accessoryIdentifier;
}

- (NSError)error
{
  return self->_error;
}

- (BOOL)isSuccess
{
  return self->_isSuccess;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_accessoryIdentifier, 0);
  objc_storeStrong((id *)&self->_setting, 0);
}

- (void)encodeWithCoder:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_23D144000, a2, OS_LOG_TYPE_ERROR, "Encoding result failed with error %@", (uint8_t *)&v2, 0xCu);
}

@end
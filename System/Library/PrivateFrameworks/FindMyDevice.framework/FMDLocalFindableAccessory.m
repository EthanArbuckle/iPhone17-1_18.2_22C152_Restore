@interface FMDLocalFindableAccessory
+ (BOOL)supportsSecureCoding;
- (BOOL)isConnected;
- (FMDIdentifiable)accessoryIdentifier;
- (FMDLocalFindableAccessory)initWithCoder:(id)a3;
- (FMDLocalFindableAccessory)initWithIdentifier:(id)a3 name:(id)a4 connected:(BOOL)a5;
- (NSData)irkData;
- (NSString)alternateSerialNumber;
- (NSString)btAddress;
- (NSString)firmwareVersion;
- (NSString)name;
- (NSString)productId;
- (NSString)serialNumber;
- (NSString)vendorId;
- (NSUUID)baUUID;
- (NSUUID)identifier;
- (void)encodeWithCoder:(id)a3;
- (void)setAlternateSerialNumber:(id)a3;
- (void)setBaUUID:(id)a3;
- (void)setBtAddress:(id)a3;
- (void)setConnected:(BOOL)a3;
- (void)setFirmwareVersion:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setIrkData:(id)a3;
- (void)setName:(id)a3;
- (void)setProductId:(id)a3;
- (void)setSerialNumber:(id)a3;
- (void)setVendorId:(id)a3;
@end

@implementation FMDLocalFindableAccessory

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (FMDLocalFindableAccessory)initWithIdentifier:(id)a3 name:(id)a4 connected:(BOOL)a5
{
  id v9 = a3;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)FMDLocalFindableAccessory;
  v11 = [(FMDLocalFindableAccessory *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_identifier, a3);
    objc_storeStrong((id *)&v12->_name, a4);
    v12->_connected = a5;
  }

  return v12;
}

- (FMDLocalFindableAccessory)initWithCoder:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)FMDLocalFindableAccessory;
  v5 = [(FMDLocalFindableAccessory *)&v18 init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    [(FMDLocalFindableAccessory *)v5 setIdentifier:v6];

    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"baUUID"];
    [(FMDLocalFindableAccessory *)v5 setBaUUID:v7];

    v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"name"];
    [(FMDLocalFindableAccessory *)v5 setName:v8];

    id v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"connected"];
    -[FMDLocalFindableAccessory setConnected:](v5, "setConnected:", [v9 BOOLValue]);

    id v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"serialNumber"];
    [(FMDLocalFindableAccessory *)v5 setSerialNumber:v10];

    v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"alternateSerialNumber"];
    [(FMDLocalFindableAccessory *)v5 setAlternateSerialNumber:v11];

    v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"irkData"];
    [(FMDLocalFindableAccessory *)v5 setIrkData:v12];

    v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"btAddress"];
    [(FMDLocalFindableAccessory *)v5 setBtAddress:v13];

    objc_super v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"firmwareVersion"];
    [(FMDLocalFindableAccessory *)v5 setFirmwareVersion:v14];

    v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"vendorId"];
    [(FMDLocalFindableAccessory *)v5 setVendorId:v15];

    v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"productId"];
    [(FMDLocalFindableAccessory *)v5 setProductId:v16];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(FMDLocalFindableAccessory *)self identifier];
  [v4 encodeObject:v5 forKey:@"identifier"];

  v6 = [(FMDLocalFindableAccessory *)self baUUID];
  [v4 encodeObject:v6 forKey:@"baUUID"];

  v7 = [(FMDLocalFindableAccessory *)self name];
  [v4 encodeObject:v7 forKey:@"name"];

  v8 = objc_msgSend(NSNumber, "numberWithBool:", -[FMDLocalFindableAccessory isConnected](self, "isConnected"));
  [v4 encodeObject:v8 forKey:@"connected"];

  id v9 = [(FMDLocalFindableAccessory *)self serialNumber];
  [v4 encodeObject:v9 forKey:@"serialNumber"];

  id v10 = [(FMDLocalFindableAccessory *)self alternateSerialNumber];
  [v4 encodeObject:v10 forKey:@"alternateSerialNumber"];

  v11 = [(FMDLocalFindableAccessory *)self irkData];
  [v4 encodeObject:v11 forKey:@"irkData"];

  v12 = [(FMDLocalFindableAccessory *)self btAddress];
  [v4 encodeObject:v12 forKey:@"btAddress"];

  v13 = [(FMDLocalFindableAccessory *)self firmwareVersion];
  [v4 encodeObject:v13 forKey:@"firmwareVersion"];

  objc_super v14 = [(FMDLocalFindableAccessory *)self vendorId];
  [v4 encodeObject:v14 forKey:@"vendorId"];

  id v15 = [(FMDLocalFindableAccessory *)self productId];
  [v4 encodeObject:v15 forKey:@"productId"];
}

- (FMDIdentifiable)accessoryIdentifier
{
  return self->accessoryIdentifier;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSString)serialNumber
{
  return self->_serialNumber;
}

- (void)setSerialNumber:(id)a3
{
}

- (NSString)alternateSerialNumber
{
  return self->_alternateSerialNumber;
}

- (void)setAlternateSerialNumber:(id)a3
{
}

- (NSData)irkData
{
  return self->_irkData;
}

- (void)setIrkData:(id)a3
{
}

- (NSString)btAddress
{
  return self->_btAddress;
}

- (void)setBtAddress:(id)a3
{
}

- (NSString)firmwareVersion
{
  return self->_firmwareVersion;
}

- (void)setFirmwareVersion:(id)a3
{
}

- (NSString)vendorId
{
  return self->_vendorId;
}

- (void)setVendorId:(id)a3
{
}

- (NSString)productId
{
  return self->_productId;
}

- (void)setProductId:(id)a3
{
}

- (BOOL)isConnected
{
  return self->_connected;
}

- (void)setConnected:(BOOL)a3
{
  self->_connected = a3;
}

- (NSUUID)baUUID
{
  return self->_baUUID;
}

- (void)setBaUUID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_baUUID, 0);
  objc_storeStrong((id *)&self->_productId, 0);
  objc_storeStrong((id *)&self->_vendorId, 0);
  objc_storeStrong((id *)&self->_firmwareVersion, 0);
  objc_storeStrong((id *)&self->_btAddress, 0);
  objc_storeStrong((id *)&self->_irkData, 0);
  objc_storeStrong((id *)&self->_alternateSerialNumber, 0);
  objc_storeStrong((id *)&self->_serialNumber, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_storeStrong((id *)&self->accessoryIdentifier, 0);
}

@end
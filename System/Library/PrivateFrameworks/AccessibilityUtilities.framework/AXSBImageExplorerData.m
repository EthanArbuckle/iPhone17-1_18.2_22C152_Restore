@interface AXSBImageExplorerData
+ (BOOL)supportsSecureCoding;
- (AXSBImageExplorerData)initWithCoder:(id)a3;
- (NSArray)customContent;
- (NSString)axLabel;
- (NSString)hostAppBundleID;
- (NSString)hostAppName;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setAxLabel:(id)a3;
- (void)setCustomContent:(id)a3;
- (void)setHostAppBundleID:(id)a3;
- (void)setHostAppName:(id)a3;
@end

@implementation AXSBImageExplorerData

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AXSBImageExplorerData)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)AXSBImageExplorerData;
  v5 = [(AXSBImageExplorerData *)&v14 init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"hostAppBundleID"];
    [(AXSBImageExplorerData *)v5 setHostAppBundleID:v6];

    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"hostAppName"];
    [(AXSBImageExplorerData *)v5 setHostAppName:v7];

    v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"axLabel"];
    [(AXSBImageExplorerData *)v5 setAxLabel:v8];

    v9 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v10 = objc_opt_class();
    v11 = objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
    v12 = [v4 decodeObjectOfClasses:v11 forKey:@"axCustomContent"];
    [(AXSBImageExplorerData *)v5 setCustomContent:v12];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(AXSBImageExplorerData *)self hostAppBundleID];
  [v4 encodeObject:v5 forKey:@"hostAppBundleID"];

  v6 = [(AXSBImageExplorerData *)self hostAppName];
  [v4 encodeObject:v6 forKey:@"hostAppName"];

  v7 = [(AXSBImageExplorerData *)self axLabel];
  [v4 encodeObject:v7 forKey:@"axLabel"];

  id v8 = [(AXSBImageExplorerData *)self customContent];
  [v4 encodeObject:v8 forKey:@"axCustomContent"];
}

- (id)description
{
  v3 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)AXSBImageExplorerData;
  id v4 = [(AXSBImageExplorerData *)&v11 description];
  v5 = [(AXSBImageExplorerData *)self hostAppBundleID];
  v6 = [(AXSBImageExplorerData *)self hostAppName];
  v7 = [(AXSBImageExplorerData *)self axLabel];
  id v8 = [(AXSBImageExplorerData *)self customContent];
  v9 = [v3 stringWithFormat:@"%@ bundleID : %@ appName: %@ axLabel:%@ axCustomContent : %@", v4, v5, v6, v7, v8];

  return v9;
}

- (NSString)hostAppBundleID
{
  return self->_hostAppBundleID;
}

- (void)setHostAppBundleID:(id)a3
{
}

- (NSString)hostAppName
{
  return self->_hostAppName;
}

- (void)setHostAppName:(id)a3
{
}

- (NSString)axLabel
{
  return self->_axLabel;
}

- (void)setAxLabel:(id)a3
{
}

- (NSArray)customContent
{
  return self->_customContent;
}

- (void)setCustomContent:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customContent, 0);
  objc_storeStrong((id *)&self->_axLabel, 0);
  objc_storeStrong((id *)&self->_hostAppName, 0);

  objc_storeStrong((id *)&self->_hostAppBundleID, 0);
}

@end
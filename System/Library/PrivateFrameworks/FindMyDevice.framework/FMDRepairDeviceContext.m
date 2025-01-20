@interface FMDRepairDeviceContext
+ (BOOL)supportsSecureCoding;
- (FMDRepairDeviceContext)initWithCoder:(id)a3;
- (NSArray)searchIdentifiers;
- (NSArray)selectedDevices;
- (NSString)ephemeralToken;
- (int64_t)repairDeviceMode;
- (void)encodeWithCoder:(id)a3;
- (void)setEphemeralToken:(id)a3;
- (void)setRepairDeviceMode:(int64_t)a3;
- (void)setSearchIdentifiers:(id)a3;
- (void)setSelectedDevices:(id)a3;
@end

@implementation FMDRepairDeviceContext

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (FMDRepairDeviceContext)initWithCoder:(id)a3
{
  v22[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)FMDRepairDeviceContext;
  v5 = [(FMDRepairDeviceContext *)&v20 init];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    v22[0] = objc_opt_class();
    v22[1] = objc_opt_class();
    v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:2];
    v8 = [v6 setWithArray:v7];
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"selectedDevices"];
    selectedDevices = v5->_selectedDevices;
    v5->_selectedDevices = (NSArray *)v9;

    v11 = (void *)MEMORY[0x1E4F1CAD0];
    v21[0] = objc_opt_class();
    v21[1] = objc_opt_class();
    v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:2];
    v13 = [v11 setWithArray:v12];
    uint64_t v14 = [v4 decodeObjectOfClasses:v13 forKey:@"searchIdentifiers"];
    searchIdentifiers = v5->_searchIdentifiers;
    v5->_searchIdentifiers = (NSArray *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ephemeralToken"];
    ephemeralToken = v5->_ephemeralToken;
    v5->_ephemeralToken = (NSString *)v16;

    v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"repairDeviceMode"];
    v5->_repairDeviceMode = [v18 integerValue];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  selectedDevices = self->_selectedDevices;
  id v5 = a3;
  [v5 encodeObject:selectedDevices forKey:@"selectedDevices"];
  [v5 encodeObject:self->_searchIdentifiers forKey:@"searchIdentifiers"];
  [v5 encodeObject:self->_ephemeralToken forKey:@"ephemeralToken"];
  id v6 = [NSNumber numberWithInteger:self->_repairDeviceMode];
  [v5 encodeObject:v6 forKey:@"repairDeviceMode"];
}

- (NSArray)selectedDevices
{
  return self->_selectedDevices;
}

- (void)setSelectedDevices:(id)a3
{
}

- (NSArray)searchIdentifiers
{
  return self->_searchIdentifiers;
}

- (void)setSearchIdentifiers:(id)a3
{
}

- (NSString)ephemeralToken
{
  return self->_ephemeralToken;
}

- (void)setEphemeralToken:(id)a3
{
}

- (int64_t)repairDeviceMode
{
  return self->_repairDeviceMode;
}

- (void)setRepairDeviceMode:(int64_t)a3
{
  self->_repairDeviceMode = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ephemeralToken, 0);
  objc_storeStrong((id *)&self->_searchIdentifiers, 0);

  objc_storeStrong((id *)&self->_selectedDevices, 0);
}

@end
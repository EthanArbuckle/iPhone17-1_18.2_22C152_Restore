@interface MPSectionedIdentifierListEntryPositionKey
+ (BOOL)supportsSecureCoding;
+ (id)positionKeyWithDeviceIdentifier:(id)a3 generation:(id)a4;
- (MPSectionedIdentifierListEntryPositionKey)initWithCoder:(id)a3;
- (NSString)deviceIdentifier;
- (NSString)generation;
- (int64_t)compare:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setDeviceIdentifier:(id)a3;
- (void)setGeneration:(id)a3;
@end

@implementation MPSectionedIdentifierListEntryPositionKey

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)generation
{
  return self->_generation;
}

- (MPSectionedIdentifierListEntryPositionKey)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MPSectionedIdentifierListEntryPositionKey;
  v5 = [(MPSectionedIdentifierListEntryPositionKey *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"did"];
    deviceIdentifier = v5->_deviceIdentifier;
    v5->_deviceIdentifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"gen"];
    generation = v5->_generation;
    v5->_generation = (NSString *)v8;
  }
  return v5;
}

+ (id)positionKeyWithDeviceIdentifier:(id)a3 generation:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = objc_alloc_init((Class)a1);
  uint64_t v9 = [v7 copy];

  v10 = (void *)v8[1];
  v8[1] = v9;

  uint64_t v11 = [v6 copy];
  v12 = (void *)v8[2];
  v8[2] = v11;

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_generation, 0);

  objc_storeStrong((id *)&self->_deviceIdentifier, 0);
}

- (void)setGeneration:(id)a3
{
}

- (void)setDeviceIdentifier:(id)a3
{
}

- (NSString)deviceIdentifier
{
  return self->_deviceIdentifier;
}

- (void)encodeWithCoder:(id)a3
{
  deviceIdentifier = self->_deviceIdentifier;
  id v5 = a3;
  [v5 encodeObject:deviceIdentifier forKey:@"did"];
  [v5 encodeObject:self->_generation forKey:@"gen"];
}

- (int64_t)compare:(id)a3
{
  id v4 = a3;
  id v5 = [(MPSectionedIdentifierListEntryPositionKey *)self generation];
  id v6 = [v4 generation];
  int64_t v7 = [v5 compare:v6];

  if (!v7)
  {
    uint64_t v8 = [(MPSectionedIdentifierListEntryPositionKey *)self deviceIdentifier];
    uint64_t v9 = [v4 deviceIdentifier];
    int64_t v7 = [v8 compare:v9];
  }
  return v7;
}

@end
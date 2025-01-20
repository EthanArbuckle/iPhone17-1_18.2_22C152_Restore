@interface ASKCapacityData
- (ASKCapacityData)init;
- (NSNumber)totalDataAvailable;
- (NSNumber)totalDataCapacity;
- (NSNumber)totalDiskCapacity;
- (NSNumber)totalSystemAvailable;
- (NSNumber)totalSystemCapacity;
- (void)setTotalDataAvailable:(id)a3;
- (void)setTotalDataCapacity:(id)a3;
- (void)setTotalDiskCapacity:(id)a3;
- (void)setTotalSystemAvailable:(id)a3;
- (void)setTotalSystemCapacity:(id)a3;
@end

@implementation ASKCapacityData

- (ASKCapacityData)init
{
  v20.receiver = self;
  v20.super_class = (Class)ASKCapacityData;
  v2 = [(ASKCapacityData *)&v20 init];
  if (v2)
  {
    v3 = (void *)MGCopyAnswer();
    uint64_t v4 = [v3 objectForKey:*MEMORY[0x1E4FBA108]];
    v5 = (void *)v4;
    if (v4) {
      v6 = (void *)v4;
    }
    else {
      v6 = &unk_1F3D38690;
    }
    [(ASKCapacityData *)v2 setTotalSystemCapacity:v6];
    uint64_t v7 = [v3 objectForKey:*MEMORY[0x1E4FBA100]];
    v8 = (void *)v7;
    if (v7) {
      v9 = (void *)v7;
    }
    else {
      v9 = &unk_1F3D38690;
    }
    [(ASKCapacityData *)v2 setTotalSystemAvailable:v9];
    uint64_t v10 = [v3 objectForKey:*MEMORY[0x1E4FBA0F0]];
    v11 = (void *)v10;
    if (v10) {
      v12 = (void *)v10;
    }
    else {
      v12 = &unk_1F3D38690;
    }
    [(ASKCapacityData *)v2 setTotalDataCapacity:v12];
    uint64_t v13 = [v3 objectForKey:*MEMORY[0x1E4FBA0E8]];
    v14 = (void *)v13;
    if (v13) {
      v15 = (void *)v13;
    }
    else {
      v15 = &unk_1F3D38690;
    }
    [(ASKCapacityData *)v2 setTotalDataAvailable:v15];
    uint64_t v16 = [v3 objectForKey:*MEMORY[0x1E4FBA0F8]];
    v17 = (void *)v16;
    if (v16) {
      v18 = (void *)v16;
    }
    else {
      v18 = &unk_1F3D386A8;
    }
    [(ASKCapacityData *)v2 setTotalDiskCapacity:v18];
  }
  return v2;
}

- (NSNumber)totalSystemCapacity
{
  return self->_totalSystemCapacity;
}

- (void)setTotalSystemCapacity:(id)a3
{
}

- (NSNumber)totalSystemAvailable
{
  return self->_totalSystemAvailable;
}

- (void)setTotalSystemAvailable:(id)a3
{
}

- (NSNumber)totalDataCapacity
{
  return self->_totalDataCapacity;
}

- (void)setTotalDataCapacity:(id)a3
{
}

- (NSNumber)totalDataAvailable
{
  return self->_totalDataAvailable;
}

- (void)setTotalDataAvailable:(id)a3
{
}

- (NSNumber)totalDiskCapacity
{
  return self->_totalDiskCapacity;
}

- (void)setTotalDiskCapacity:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_totalDiskCapacity, 0);
  objc_storeStrong((id *)&self->_totalDataAvailable, 0);
  objc_storeStrong((id *)&self->_totalDataCapacity, 0);
  objc_storeStrong((id *)&self->_totalSystemAvailable, 0);
  objc_storeStrong((id *)&self->_totalSystemCapacity, 0);
}

@end
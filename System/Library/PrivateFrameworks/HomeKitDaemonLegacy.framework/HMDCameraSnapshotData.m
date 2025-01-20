@interface HMDCameraSnapshotData
- (HMDCameraSnapshotData)initWithSnapshotData:(id)a3 videoResolution:(id)a4 snapshotDataTrasaction:(id)a5;
- (HMDCameraSnapshotData)initWithSnapshotFile:(id)a3 videoResolution:(id)a4;
- (HMDVideoResolution)videoResolution;
- (HMFOSTransaction)snapshotDataTrasaction;
- (NSData)snapshotData;
- (void)dealloc;
@end

@implementation HMDCameraSnapshotData

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_videoResolution, 0);
  objc_storeStrong((id *)&self->_snapshotDataTrasaction, 0);
  objc_storeStrong((id *)&self->_snapshotData, 0);
}

- (HMDVideoResolution)videoResolution
{
  return (HMDVideoResolution *)objc_getProperty(self, a2, 24, 1);
}

- (HMFOSTransaction)snapshotDataTrasaction
{
  return (HMFOSTransaction *)objc_getProperty(self, a2, 16, 1);
}

- (NSData)snapshotData
{
  return (NSData *)objc_getProperty(self, a2, 8, 1);
}

- (void)dealloc
{
  snapshotData = self->_snapshotData;
  self->_snapshotData = 0;

  v4.receiver = self;
  v4.super_class = (Class)HMDCameraSnapshotData;
  [(HMDCameraSnapshotData *)&v4 dealloc];
}

- (HMDCameraSnapshotData)initWithSnapshotFile:(id)a3 videoResolution:(id)a4
{
  v6 = (objc_class *)MEMORY[0x1E4F654E0];
  id v7 = a4;
  id v8 = a3;
  v9 = (void *)[[v6 alloc] initWithName:@"com.apple.homed.snapshot-data"];
  v10 = [MEMORY[0x1E4F28CB8] defaultManager];
  v11 = [v10 contentsAtPath:v8];

  v12 = [(HMDCameraSnapshotData *)self initWithSnapshotData:v11 videoResolution:v7 snapshotDataTrasaction:v9];
  return v12;
}

- (HMDCameraSnapshotData)initWithSnapshotData:(id)a3 videoResolution:(id)a4 snapshotDataTrasaction:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)HMDCameraSnapshotData;
  v12 = [(HMDCameraSnapshotData *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_snapshotData, a3);
    objc_storeStrong((id *)&v13->_snapshotDataTrasaction, a5);
    objc_storeStrong((id *)&v13->_videoResolution, a4);
  }

  return v13;
}

@end
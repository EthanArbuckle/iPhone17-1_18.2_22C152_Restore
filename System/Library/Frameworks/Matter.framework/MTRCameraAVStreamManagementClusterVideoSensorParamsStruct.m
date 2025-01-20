@interface MTRCameraAVStreamManagementClusterVideoSensorParamsStruct
- (MTRCameraAVStreamManagementClusterVideoSensorParamsStruct)init;
- (NSNumber)hdrCapable;
- (NSNumber)maxFPS;
- (NSNumber)maxHDRFPS;
- (NSNumber)sensorHeight;
- (NSNumber)sensorWidth;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setHdrCapable:(id)a3;
- (void)setMaxFPS:(id)a3;
- (void)setMaxHDRFPS:(id)a3;
- (void)setSensorHeight:(id)a3;
- (void)setSensorWidth:(id)a3;
@end

@implementation MTRCameraAVStreamManagementClusterVideoSensorParamsStruct

- (MTRCameraAVStreamManagementClusterVideoSensorParamsStruct)init
{
  v10.receiver = self;
  v10.super_class = (Class)MTRCameraAVStreamManagementClusterVideoSensorParamsStruct;
  v2 = [(MTRCameraAVStreamManagementClusterVideoSensorParamsStruct *)&v10 init];
  v3 = v2;
  if (v2)
  {
    sensorWidth = v2->_sensorWidth;
    v2->_sensorWidth = (NSNumber *)&unk_26F9C8620;

    sensorHeight = v3->_sensorHeight;
    v3->_sensorHeight = (NSNumber *)&unk_26F9C8620;

    hdrCapable = v3->_hdrCapable;
    v3->_hdrCapable = (NSNumber *)&unk_26F9C8620;

    maxFPS = v3->_maxFPS;
    v3->_maxFPS = (NSNumber *)&unk_26F9C8620;

    maxHDRFPS = v3->_maxHDRFPS;
    v3->_maxHDRFPS = (NSNumber *)&unk_26F9C8620;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTRCameraAVStreamManagementClusterVideoSensorParamsStruct);
  v7 = objc_msgSend_sensorWidth(self, v5, v6);
  objc_msgSend_setSensorWidth_(v4, v8, (uint64_t)v7);

  v11 = objc_msgSend_sensorHeight(self, v9, v10);
  objc_msgSend_setSensorHeight_(v4, v12, (uint64_t)v11);

  v15 = objc_msgSend_hdrCapable(self, v13, v14);
  objc_msgSend_setHdrCapable_(v4, v16, (uint64_t)v15);

  v19 = objc_msgSend_maxFPS(self, v17, v18);
  objc_msgSend_setMaxFPS_(v4, v20, (uint64_t)v19);

  v23 = objc_msgSend_maxHDRFPS(self, v21, v22);
  objc_msgSend_setMaxHDRFPS_(v4, v24, (uint64_t)v23);

  return v4;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  objc_msgSend_stringWithFormat_(v3, v6, @"<%@: sensorWidth:%@; sensorHeight:%@; hdrCapable:%@; maxFPS:%@; maxHDRFPS:%@; >",
    v5,
    self->_sensorWidth,
    self->_sensorHeight,
    self->_hdrCapable,
    self->_maxFPS,
  v7 = self->_maxHDRFPS);

  return v7;
}

- (NSNumber)sensorWidth
{
  return self->_sensorWidth;
}

- (void)setSensorWidth:(id)a3
{
}

- (NSNumber)sensorHeight
{
  return self->_sensorHeight;
}

- (void)setSensorHeight:(id)a3
{
}

- (NSNumber)hdrCapable
{
  return self->_hdrCapable;
}

- (void)setHdrCapable:(id)a3
{
}

- (NSNumber)maxFPS
{
  return self->_maxFPS;
}

- (void)setMaxFPS:(id)a3
{
}

- (NSNumber)maxHDRFPS
{
  return self->_maxHDRFPS;
}

- (void)setMaxHDRFPS:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maxHDRFPS, 0);
  objc_storeStrong((id *)&self->_maxFPS, 0);
  objc_storeStrong((id *)&self->_hdrCapable, 0);
  objc_storeStrong((id *)&self->_sensorHeight, 0);

  objc_storeStrong((id *)&self->_sensorWidth, 0);
}

@end